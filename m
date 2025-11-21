Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63994CFA477
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Nov 2025 07:37:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vMLhl-0006BT-6v; Fri, 21 Nov 2025 02:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vMLhk-0006B6-HC
 for qemu-arm@nongnu.org; Fri, 21 Nov 2025 02:37:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vMLhh-0003Ui-E5
 for qemu-arm@nongnu.org; Fri, 21 Nov 2025 02:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763710632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82qnaFPBZTwgTGUTYtaBG0ApMNQ3Bp2OWvgPpLO11nw=;
 b=dTQf8eFAdr7nbZ2GirtoPZ+ESn+i33fgOehZt5sVWPLGjXbUIwWDdSkRqtDtyyk3Pe7PP9
 +mc1W0nT968dxTAD1yvKH3dJ62ferKFLHnRWsjiJm24Kx6wRGA+Jgf/RIZGjTARM0b5DgN
 6pWBEHLt1aYEN52/GWj2+420gU4rPlw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-ahF31t92PMmoSEC2Y4SRSg-1; Fri, 21 Nov 2025 01:54:49 -0500
X-MC-Unique: ahF31t92PMmoSEC2Y4SRSg-1
X-Mimecast-MFC-AGG-ID: ahF31t92PMmoSEC2Y4SRSg_1763708088
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-343823be748so1872349a91.0
 for <qemu-arm@nongnu.org>; Thu, 20 Nov 2025 22:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763708088; x=1764312888;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=82qnaFPBZTwgTGUTYtaBG0ApMNQ3Bp2OWvgPpLO11nw=;
 b=VBgMSGRt9+l/kbYZbuhHiPzUqcdvoOpuOWWBid/wjiAsDIdJLfUl1enBLY/y+9yt87
 DNYMR8DkbkSMQOCypMVnCKrrNJu0844LHpeTkalN/gZuMg7MuCnhZjFut2KpmbUTY7sK
 V7twXDH6GM9Scj10oXBG3mwVE4rMhI/Mr1wqA/7kJ1RutvaR9VFfpw3We9xvk0PtoeWL
 B6zHom4yL2+KyR4zF2oJbyXhYNSxN84tVyT6R1VNiDuRlz495Ddh5ZXS+RptiexSjldp
 F6Hk8e9EZMqYOUQMAJH4jNj1kEuR+d5rwW2TIZ2dwLDtAoQ7YTDLszWL7xeJKJDm73VQ
 9Y0w==
X-Gm-Message-State: AOJu0YwLs+jZS1WCu8wfmNKEi79HQROHMtoL1VL//jGYqs3iViMHYPJF
 0vIBUiW2RbG1t1GsjThfPSJRwzOzdgCfJibHMBVF8hkxjqXvjEuOuB7TZypQcPAW5lZHMTZuapk
 ql2AiPCylap1Kan/yvIoceiEXj2m1v2ollPcgEs/V/gqP4KWQ5zAbWQ==
X-Gm-Gg: ASbGnct4B5GX9zsp3ACt6UYIutMKJG3egL3xB05euAiNsj214eiVVqXW0WRavdg04A7
 vRw4tc0A+eE3f47oe/k5clg0ln/c/W9aSllZ6mAujokV3yiFCH0M92L8FqdVyQ1thPPlH/bXsdl
 TWOGw0mFXe7bVHj5/DFZ9AEgnEFQ7Zd6NYq+AWMGvZ1Yce6zvx9vXKS8lR9GUqK2qx4CXJsAD9j
 QSvAZ3mnSMaPmFGyjOQk3iiYn4WRLLbyjEXMXB2M8inKoHCHgkoCBQuEBluMo5kdT5eb5/uOAiC
 udrFIx10lmPCHlepzXSSLxX+bG6S++ZfICS20jM1ip5biXjdYwT0pjj/XMbfsVmvhMqI0Pw3rmJ
 CDAg9aew/sXPb59mPzifel03giUmLHtJexvRNVJTQvF44tcJEPA==
X-Received: by 2002:a17:90b:1e51:b0:340:c060:4d44 with SMTP id
 98e67ed59e1d1-34733e5c442mr1575221a91.14.1763708088072; 
 Thu, 20 Nov 2025 22:54:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4IUYEXig1EOQlEkXHp2/sAMo4ljyvIGox1RbMWdChM1PHXKNPRpVPGGz82A7GskWAySTcoQ==
X-Received: by 2002:a17:90b:1e51:b0:340:c060:4d44 with SMTP id
 98e67ed59e1d1-34733e5c442mr1575196a91.14.1763708087694; 
 Thu, 20 Nov 2025 22:54:47 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34727be2320sm4317637a91.5.2025.11.20.22.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 22:54:47 -0800 (PST)
Message-ID: <a43d044e-51e3-4000-b5cc-3bcc14317d20@redhat.com>
Date: Fri, 21 Nov 2025 16:54:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] target/arm/kvm: Improve memory error handling
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, gengdongjiu1@gmail.com,
 mst@redhat.com, imammedo@redhat.com, armbru@redhat.com, anisinha@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, zhao1.liu@intel.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com, zhangliang5@huawei.com
References: <20251112172535.403042-1-gshan@redhat.com>
 <20251118104755.000024c8@huawei.com>
 <lghhh6xohwekbst2bbuqksiono5dgtrkyjxoypb4ahij2t2qgs@7dmgytmbiehd>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <lghhh6xohwekbst2bbuqksiono5dgtrkyjxoypb4ahij2t2qgs@7dmgytmbiehd>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6rT-oOz-7X2UCBqZCIlOJkGxdmkNkl6ClObQyjjUGYs_1763708088
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

Hi Mauro,

On 11/18/25 8:54 PM, Mauro Carvalho Chehab wrote:
> On Tue, Nov 18, 2025 at 10:47:55AM +0000, Jonathan Cameron wrote:
>> On Thu, 13 Nov 2025 03:25:27 +1000
>> Gavin Shan <gshan@redhat.com> wrote:
>>
>>> In the combination of 64KiB host and 4KiB guest, a problematic host
>>> page affects 16x guest pages. Those 16x guest pages are most likely
>>> owned by separate threads and accessed by the threads in parallel.
>>> It means 16x memory errors can be raised at once. However, we're
>>> unable to handle this situation because the only error source has
>>> one read acknowledgement register in current design. QEMU has to
>>> crash in the following path due to the previously delivered error
>>> isn't acknowledged by the guest on attempt to deliver another error.
>>>
>>>    kvm_vcpu_thread_fn
>>>      kvm_cpu_exec
>>>        kvm_arch_on_sigbus_vcpu
>>>          kvm_cpu_synchronize_state
>>>          acpi_ghes_memory_errors
>>>          abort
>>>
>>> This series fixes the issue by sending 16x consective CPER errors
>>> which are contained in a single GHES error block.
>>>
>>> PATCH[1-4] Increases GHES raw data maximal length from 1KiB to 4KiB
>>> PATCH[5]   Supports multiple error records in a single error block
>>> PATCH[6-7] Improves the error handling in the error delivery path
>>> PATCH[8]   Sends 16x consective CPERs in a single block if needed
>>>
>>
>> Hi Gavin,
>>
>> Just a quick head's up to say we've had some internal discussions around the
>> kernel handling of broader address masks in CPER and think it is probably
>> broken. Rectifying that may at least simplify what is needed on the QEMU side
>> of things and maybe even handle much larger blocks (2M and larger).
> 
> Btw, I just added a logic at rasdaemon to catch SIGBUS errors:
> https://github.com/mchehab/rasdaemon/pull/199
> 
> But so far, I didn't find a proper way to check such code.
> 
> Jonathan/Gavin,
> 
> Do you know a good way for us to check how the mm SEA notification
> is handled with QEMU?
> 

Sorry that I'm not familiar with rasdaemon. Could you please provide more
contexts about your question?

Thanks,
Gavin


