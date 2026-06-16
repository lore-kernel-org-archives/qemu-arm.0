Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C93BCD98CE
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 04:56:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZLqM-0007Lz-6S; Tue, 16 Jun 2026 00:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZLqK-0007LM-As
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 00:56:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZLqI-0002Ma-EX
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 00:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781585764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwZcKCqR8JDLXYMDOK12GRhm9ggAjDLD6MH2lffyvW8=;
 b=OTzHs8akknTDM9W/JspswVirrKCupcX/RFmi7Fwts6O+/v7KECsUDX8nBEdRvebrHm1bFZ
 sponVgs/zhvbnGrFZZK1BJD1OBrL1JyWD6BNspSCtK6YD3jST0ehJDsevJnyO0o9oI3Keq
 zto1rT86Qeo9jsSWLr+wuEljt2k0zYU=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-9gg4TryPPMGGFcXM0DHM5Q-1; Tue, 16 Jun 2026 00:56:03 -0400
X-MC-Unique: 9gg4TryPPMGGFcXM0DHM5Q-1
X-Mimecast-MFC-AGG-ID: 9gg4TryPPMGGFcXM0DHM5Q_1781585762
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304d8613efbso4891150eec.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 21:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781585762; x=1782190562;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KwZcKCqR8JDLXYMDOK12GRhm9ggAjDLD6MH2lffyvW8=;
 b=lsABWfgBf1E2SqgbjPiZu/mvg5GrxUDwgJY9Aex3TRjFprZzspM5tJB+00j9o4K95z
 9X2BJYQgkbmz//Wsb+vk6h2I/0QjHHoG/+LFKsGvmh5yq3FA5ndopNAqekuIcE8kTKpn
 BdrMgYHthjOOealKEFniji6/Sqz5Belm+UDpv9CDEuJkl3mm6yQV89IQ+rnq8YQ7SgAS
 an1duOF2GABPNVDsKiDQI0H87PiFGi3BhpSGy4VGHvk5S4HW0TQpQ9Hb5QaV7WpGzKTZ
 /LGjwpebPzDP2uvkB1Sc/2nfTRKEhiM+U39oPz0+gk3qCqQ7E2QarZhvcajQz/nk76yd
 6XSg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9zBAzfncnuS79LrH9k3XeIN6Iu4bcOZAn8ZOTfk5TuA5Xq5VoGS8C1eL+HJKi+Diwdj2Lj88AaJw==@nongnu.org
X-Gm-Message-State: AOJu0YywVeLtx+/fV+9Y6vv0cQN7VrCsF2tgojGiRQx4f3PPQFmmtHsx
 0F6J/4UbTQFq2tQEbpD7gV7doa8EFztn0uNe465Ln23OuhdwcIvlokhGR4fINEeYI8BwddYI2o/
 Gumq/4gUE0dTJX7kYEUQ5sfOC3ABWP4B9Uuvpf7eXJJUMMJS4H/iTIw==
X-Gm-Gg: Acq92OEmoCo8tGxe6g3XPvOYb74wBs2owQIiOVK9z+0V2pGyVfsq2nc4kMlzV20bsJR
 JpDbVk3m8lguGt7P2mfqO+zcvevgqLr1OAkwyRsSeVxynNgh+ow+VGkCTnfu9lS/d9boCOMQH/N
 IszQGY5P0LwKTgRMwxTNxi8TnAKjov5NzwWdWfH85Vdnn8Dk/xf8ONITU4sOEdMtWixR/7/koQD
 nlS0TMSzSRALFEcfGecmXFugECtESymBSOs4I7+eXAvzz7/xDaadBG2p9xvrdYmXFk/4zZFZ4yg
 zzmwbOGHNPaFfug7w49HMmKbZvJJM/qGwVxDtgBLrHRM7x+YjMGbsdxaxVr365ByktlcQGBRmx8
 lBz3mpG5KH2/D4ngTajMkGUcGHCu3yKyb0/qeBYz/63uywpJG0Or3V20PUBIWawS/
X-Received: by 2002:a05:7300:7c12:b0:304:d32e:65e7 with SMTP id
 5a478bee46e88-30ba559df7fmr1211665eec.0.1781585762240; 
 Mon, 15 Jun 2026 21:56:02 -0700 (PDT)
X-Received: by 2002:a05:7300:7c12:b0:304:d32e:65e7 with SMTP id
 5a478bee46e88-30ba559df7fmr1211653eec.0.1781585761742; 
 Mon, 15 Jun 2026 21:56:01 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3081e5cea89sm18880655eec.8.2026.06.15.21.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 21:56:01 -0700 (PDT)
Message-ID: <3880910f-4465-46c5-a5e5-daa2f70821d1@redhat.com>
Date: Tue, 16 Jun 2026 14:55:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
 <20260615105556-mutt-send-email-mst@kernel.org>
 <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
 <e399ceb9-bc4a-4ba6-8efd-ed2742d0853b@redhat.com>
 <20260615154054-mutt-send-email-mst@kernel.org>
 <22d55870-b521-4002-add7-791bce8ea96a@redhat.com>
 <20260615224658-mutt-send-email-mst@kernel.org>
 <0038f601-7647-4547-a67a-c6a17fae26ca@linaro.org>
 <20260616004924-mutt-send-email-mst@kernel.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260616004924-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lGD87Ny_couVtkGe3RC0-XEyjzUi3QV79f7-X3cqTdU_1781585762
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/16/26 2:49 PM, Michael S. Tsirkin wrote:
> On Mon, Jun 15, 2026 at 09:48:00PM -0700, Richard Henderson wrote:
>> On 6/15/26 21:23, Michael S. Tsirkin wrote:
>>> B. Also on x86, I do not see why we should not use memcpy for large
>>> accesses if we can. Better perf.
>>
>> We have an example where memcpy writes to the same location 3 times.
>> This is not appropriate for any host.
>>
>>
>> r~
> 
> as in, same byte?  could you share the details pls?
> 

This issue happened on aarch64 only.

https://lore.kernel.org/qemu-devel/CAFEAcA8dwHV8F48kb-013rxkG9kKcZhym9_qarKmoeUfeh0YWw@mail.gmail.com/

Thanks,
Gavin


