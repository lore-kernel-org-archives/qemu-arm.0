Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0002CCF9E3
	for <qemu-arm@archiver.kernel.org>; Sun,  2 Nov 2025 23:04:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFh7G-0007c8-E6; Sun, 02 Nov 2025 18:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vFh7F-0007bf-65
 for qemu-arm@nongnu.org; Sun, 02 Nov 2025 18:04:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vFh7D-0003ej-Fv
 for qemu-arm@nongnu.org; Sun, 02 Nov 2025 18:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762124642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhJlhyl3Tq6ZrMsbM4j6dNCCYitvL7uLEe94HeZ7A+M=;
 b=K32lR3CUpD05C4RoTaJ+xKtBDnFfAd+jRlDx9LOL5v+sqd+irOUIaG+LN9guN2fzodY6/N
 vttOnyNk8XYmHXWpEsPoC5e14n/M8TBts8B0PasPmybiEPAe9BvrRAH09DBGdIeH2ggcrR
 kT0iYieD9LXjLbP34QHhIoQ3s7+mo9I=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-XKxzihJ3MEKKHWlcUA67Tw-1; Sun, 02 Nov 2025 18:04:01 -0500
X-MC-Unique: XKxzihJ3MEKKHWlcUA67Tw-1
X-Mimecast-MFC-AGG-ID: XKxzihJ3MEKKHWlcUA67Tw_1762124640
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3407734d98bso3495437a91.3
 for <qemu-arm@nongnu.org>; Sun, 02 Nov 2025 15:04:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762124640; x=1762729440;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vhJlhyl3Tq6ZrMsbM4j6dNCCYitvL7uLEe94HeZ7A+M=;
 b=pJ9jVKS6fCWUuRutpSQMDxEtoylvleaVw3OIwAwJ04ptr99Yp+j4cWBVVg9ExGYzEW
 z5SJdtS+ouNx5PK8H2j91ZMqUTAABKL48dcc9YTSKiBCWexCau5iUNoGmmrfBXXe8JdX
 ATlvq4iDWAmv/oWA3PZ97kTbbK5+ffEMoJ9St8Hu90czPp1KGrNveLBOxUxpuZheqBEK
 GcpsCE8qIAWwEH3UH38sZmVjN6emdZodQ+aAEgOiTll9TrWfVjwFz9bgoMc9/zpfXxnC
 MYWdJ554JHXsSLrdCXJ0Oi+kTQkKtVkWuQ/f8cfQ6rYUPFqEGuHOitv91XpePoGZFas9
 /d4w==
X-Gm-Message-State: AOJu0Yyf0dNJp5l41z++9H2RfNlYb4kZD/a0b4Y9EMa+LnFqmYDVMN34
 OlC1NucYaCl8kRknhCio8fT7gy8mC4m4/uKYZoA4yRuLmiI8N93/47I/J9WFOPPooDp13swGM0U
 jfi/Wavw0Go+814360VwtskWCUKb3n9vMLTMbIKYpgMStxMhCswd13A==
X-Gm-Gg: ASbGncs2A73vVPoc40uViKKs1MVGjkdG3LjRHufbOC98ygDCoylP0NDzeGkCVMqOdyh
 j83yLRjYeu/srGK/Qxoi9UWQD6O83B7iI9OiIQF24uYzDs4m/dkguoM02VUYW9aVg7S5G1WcR+A
 iPhC61XNIZxp4Z8F0JEG/48IfD7gSOHf6iWQe6frRkg5q+PAxDO168CPfCtk5RhNNKfPV+SV4Xw
 Goz68DwhBq9W1SONXekuXf/Qm0a38O92hnwjc3hTwTkYkIBc6vtqXQPqeet1wIfFPjxnEEywZ5c
 L5esdx7TgNXv29BaOuFDvD/X1+tJhvaaqqWqflVMG0MFKIqmIprRLF2/uGKBKneQ63klJtyPwn5
 Ds7s/OKAT3OVYvLCTuAhKPxf47SB8ZE9UPZSN61Y=
X-Received: by 2002:a17:90b:1c8c:b0:340:5b6a:5bb0 with SMTP id
 98e67ed59e1d1-34083088e22mr13670415a91.26.1762124639898; 
 Sun, 02 Nov 2025 15:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFbk65Ry5yCUNKJVbZPPGEItAfFuloNNmDHhrcdVvNWci7j36taDGABSh1mXIPA3xolwSYaw==
X-Received: by 2002:a17:90b:1c8c:b0:340:5b6a:5bb0 with SMTP id
 98e67ed59e1d1-34083088e22mr13670394a91.26.1762124639515; 
 Sun, 02 Nov 2025 15:03:59 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3409288c910sm8826544a91.8.2025.11.02.15.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Nov 2025 15:03:59 -0800 (PST)
Message-ID: <dd4749b3-f980-45c8-87df-b4ac4095e1b0@redhat.com>
Date: Mon, 3 Nov 2025 09:03:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/3] target/arm/kvm: Support multiple memory
 CPERs injection
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, gengdongjiu1@gmail.com,
 peter.maydell@linaro.org, pbonzini@redhat.com, mchehab+huawei@kernel.org,
 shan.gavin@gmail.com
References: <20251007060810.258536-1-gshan@redhat.com>
 <20251007060810.258536-4-gshan@redhat.com>
 <20251031101051.00006fa3@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251031101051.00006fa3@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f6HKVoKIoiPQKowysgMzCaHqjlsv4VhqXwAeIGjNstU_1762124640
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 10/31/25 8:10 PM, Jonathan Cameron wrote:
> On Tue,  7 Oct 2025 16:08:10 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> In the combination of 64KB host and 4KB guest, a problematic host page
>> affects 16x guest pages. In this specific case, it's reasonable to
>> push 16 consecutive memory CPERs. Otherwise, QEMU can run into core
>> dump due to the current error can't be delivered as the previous error
>> isn't acknoledges. It's caused by the nature the host page can be
>> accessed in parallel due to the mismatched host and guest page sizes.
>>
>> Imporve push_ghes_memory_errors() to push 16x consecutive memory CPERs
>> for this specific case. The maximal error block size is bumped to 4KB,
>> providing enough storage space for those 16x memory CPERs.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Subject to tests being added and the Docs update Mauro requested + follow
> on from earlier patch reviews, this looks good to me.
> 

Yes, the ACPI tables were forgotten to be patched in the last respin. I will
do in the next respin.

Thanks,
Gavin


