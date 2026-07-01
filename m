Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DC9C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 07:34:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wepSS-0005m5-7q; Wed, 01 Jul 2026 03:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wepSQ-0005ld-GN
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 03:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wepSO-0000MM-R9
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 03:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782891243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DHvVX9r7XG0ikk4EZa9QYwjLuFgzLrZXiCIURWzxJfs=;
 b=hnIQcV+d8DUNEiLWlkn9x4QcaaprjyxINXbQ1t5aY4Rga5XRYmrHKkZDg4yYADYuiU+xb3
 OyqfZO6e7JmUP4JixYnz8FL33r11dC9gwa+MZN7YiVRIKw8/yjvkSWI9X4OfqNSmm+ef/6
 ZOyK5U6B9m6vT2DPaDQLan4qoDwiT/w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-wIXLSXZIOc2nl10X288MIg-1; Wed, 01 Jul 2026 03:34:02 -0400
X-MC-Unique: wIXLSXZIOc2nl10X288MIg-1
X-Mimecast-MFC-AGG-ID: wIXLSXZIOc2nl10X288MIg_1782891241
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-476608a9fefso105065f8f.1
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 00:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782891241; x=1783496041;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DHvVX9r7XG0ikk4EZa9QYwjLuFgzLrZXiCIURWzxJfs=;
 b=g138r4TP91GrNCmjYEZ45NoTX7wg0ONcHyEGPe6RRkwkw42GaHVcT5lujzDmgC+bvq
 N8gekUp0rHlOzwID1LZdHgbPP3UlBbWnHhZENpo85ah3ZEj6twjj8G3taxgMLTjXxRNZ
 ZTvel5EjOQvMCQ/QErYsSWzgWkVgm+8Ho0mdPkib8zsjqIRzcOOMP5oLQ5lpJXKhE3Uz
 DH+XGmmjocdUyJvKgB9o+z9b5DOtPY6xvrMpqU43Wt3BHW726SU3LCsbukh74ugSsTyJ
 LK/8WBFzZSJc3l+BilhSB8fdnl67nc9ZJ/xGg1U7SEM0kQ+ydwfjJ4Fj11bkJc/L6RTs
 Vh0g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr2mpu/RhRBeImJKBBbBednbqGXouJIkwP0KJrjTWP7Hk15A8p+o3Ei6x1znbnkZXuvYUUcV2B29w==@nongnu.org
X-Gm-Message-State: AOJu0Ywkp6mhM4csQ2YBZxy2xVCVjeGcKunCEth/jJ2uABfgUcpVk9Vo
 Phv5nVUhOHCoF/gwZpXjV0ArCri/jeIK0GWrlBGaxadg6MEut0E49I7crRo+ldy0TDz9TTtSXdA
 pnmOW5mQXevPxGXVi0zocciMx3epAEz9FW+l9VZJKA/bfM0liW5ddrg==
X-Gm-Gg: AfdE7ckZ7xxR/v5SnNIEQOKjrl0gYz0oer16sQ1/ODOicx2ZAikHRk3sZxCW2+DICai
 oWRxXhMYmNXtMj7MVL9gezUIrEJQi/V1iuXqU7GLXucNiOZbUxh7XRJ/5yXFCVuk8piMCMw7Mcs
 zNWv4Axmo1OTheMaWcGhAOmhRweuURoQPAXxN1ZthbW2IGrhNMcRXADHCbXO31Yks+PfVQPT3Jv
 Z1rvY8ycGHl84REjVTNJMd81w0ooqn2DlZr0t1uC7dULFvEdJtLuKY5NLvENR2JkACpzogYR6bA
 TwqFltOeA+DFkZTaVoP9jkQRoshBfAFkurNPMTeIk6+jgrmab93EBVz5YAeppMS77TLNun4VTTc
 c2RxHyH60eFMhGS7XQH+29BZ5i7xLMdF0p+fd21zdt3oiHDnwaQ==
X-Received: by 2002:adf:e18e:0:b0:460:d18:865c with SMTP id
 ffacd0b85a97d-475de07c91bmr9619051f8f.1.1782891241034; 
 Wed, 01 Jul 2026 00:34:01 -0700 (PDT)
X-Received: by 2002:adf:e18e:0:b0:460:d18:865c with SMTP id
 ffacd0b85a97d-475de07c91bmr9619002f8f.1.1782891240597; 
 Wed, 01 Jul 2026 00:34:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475641e4618sm15093237f8f.9.2026.07.01.00.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 00:34:00 -0700 (PDT)
Message-ID: <25ee74ac-1ccf-4f91-9ed1-3c9ca42a92ce@redhat.com>
Date: Wed, 1 Jul 2026 09:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform-bus: Align MMIO regions to host page size
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
References: <20260630173245.2070268-1-clg@redhat.com>
 <CAFEAcA8G2sti8T=u_Sa5HSSNXAJfJMmbv14PVD0y6yn1wDEaHw@mail.gmail.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <CAFEAcA8G2sti8T=u_Sa5HSSNXAJfJMmbv14PVD0y6yn1wDEaHw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o_qMseidRisXF4Uh4WWWqUUwSkrNUAWzKS9L8_O3S6Y_1782891241
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 6/30/26 22:03, Peter Maydell wrote:
> On Tue, 30 Jun 2026 at 18:33, Cédric Le Goater <clg@redhat.com> wrote:
>>
>> On aarch64 hosts with 64K pages, the platform bus MMIO allocator can
>> place device regions (such as the 1KB "tpm-ppi" region) at offsets
>> that are not aligned to the host page size. This causes unnecessary
>> and noisy VFIO IOMMU warnings when starting VMs configured with
>> passed-through PCI devices:
>>
>>    vfio_listener_valid_section received unaligned region tpm-ppi
>>      iova=0xc005000 offset_within_region=0x0
>>      qemu_real_host_page_size=0x10000
> 
> Why does vfio care about the tpm-ppi region? I thought vfio
> was only for passthrough devices, not for normal ones.

It's caught by the VFIO listener which doesn't filer per device, it
covers the entire address space.

This is a benign address mis-alignment warning of the tpm-ppi memory
region and VFIO simply skips the region.

> 
>> Fix this by ensuring the alignment used by the platform bus allocator
>> is at least qemu_real_host_page_size().
>>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   hw/core/platform-bus.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
>> index a2217a2deec7ab0f49b211c6658db02d13c319df..a17a38c1ba5491e2001fec5a29c188de67e93d11 100644
>> --- a/hw/core/platform-bus.c
>> +++ b/hw/core/platform-bus.c
>> @@ -140,6 +140,13 @@ static void platform_bus_map_mmio(PlatformBusDevice *pbus, SysBusDevice *sbdev,
>>           return;
>>       }
>>
>> +    /*
>> +     * Ensure alignment is at least the host page size so that IOMMU
>> +     * mappings (e.g. VFIO) work on hosts with large pages such as
>> +     * aarch64 with 64K pages.
>> +     */
>> +    alignment = MAX(alignment, qemu_real_host_page_size());
> 
> Do we need to tie this to machine versions? Otherwise I think
> the memory layout can change underfoot which would break a
> guest migrated from an old QEMU to new.

OK. Let's extend vfio_known_safe_misalignment() instead as done
by commit 851d6d1a0ff2 ("vfio/common: remove spurious tpm-crb-cmd
misalignment warning").


Thanks,

C.



