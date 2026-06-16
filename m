Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521DDCD98E1
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 23:02:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZcnP-0006z8-Pa; Tue, 16 Jun 2026 19:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZcnO-0006ya-Pr
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 19:02:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZcnN-0001GA-1f
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 19:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781650931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psGvQPF4L61GMg2ufnde8AbhD6rsAtI3w+6cM4o/hfc=;
 b=HKdXmXUTCjhdsIslKP0gLFhDslCKDIH9/cCO+RqMazMf+Jufp2Gu94fXpTF6i97Ky8jUBA
 L6XuDadw6RdEzc9eaSWYNrklqZl169Tbt6xo4OkIbUyrYiYqP9V+kstoce06YRD+9yQ/HL
 oOG2ttcRTe1iEz6+xETXWhfZR1zfuYA=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371--rdyRvcCO8a3fqM0aL4nVw-1; Tue, 16 Jun 2026 19:02:09 -0400
X-MC-Unique: -rdyRvcCO8a3fqM0aL4nVw-1
X-Mimecast-MFC-AGG-ID: -rdyRvcCO8a3fqM0aL4nVw_1781650929
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2c0b1bb53a8so1922355ad.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 16:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781650928; x=1782255728;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=psGvQPF4L61GMg2ufnde8AbhD6rsAtI3w+6cM4o/hfc=;
 b=gHKYzhWgtI9L0OH0KpPakx/cIOMKPHqYKcsEAsWQ/n8yN0iUawMJAkQrCA6RpqrXWv
 +YqeazXuXUu+fSunCZR+xYae80HJDPMInSZ7lNnO2KlOI0WG4R4fqeOeXdNfgFetP31f
 36PqPE3K8688ssfu4Qs6ygVoooTuxNw3MlkNnVnqpiuDYKkaX8wukH0KrxQO/neG8ViK
 06N985DHF1A6KREhYDeZSbfDvrQ7tB3vrzGfgRhK3FO1yIVAGg584L9UcwI0YENjQGXE
 1HTt1WqhFl10kVmy1NXshi2pSy078VS088hxXbxH3v2wYFrixNDdskKzt1wuXSWzgatj
 jxLw==
X-Gm-Message-State: AOJu0YwEVrYglXPpRs/vDlIMfCAKPBVxw2YsF7WfFrX/VQxU4wsYMRna
 Dhv/KBs28Npxj+uOJxF6JfgZnpiJDtoOzV90hFiGtLULxoMEMLkKxQxdt56RZ1ZIfFynOkTyG6y
 oowtY53G3/jSUMltf5TIvmaOZcIxtYOYtHwGrhr/WKfcklLLs1ePE1g==
X-Gm-Gg: AfdE7ck5Dy0iaIia5lERtG6vNBja15JnBvw8Oz06si4npD+TZnHuR8mcro7vWzCtA6J
 0+yt6fXFGA4rQM0PpYn+KltPAasZVeT4qH+dZLmd79IhSA05+1Gq8bPgXF5hr3FUIJiqD02tb4Q
 bBY3WBq1GWyRcPIRJuY61rmGO7Xg46sYd6MINlru7DadmSWnnOjcLiQBBz6PgxTtKATZLf5g2SU
 wkqTbaz4LhGqEAr6Ekne5xyA3GlojYzPvZVVGyOaGgllYRSYBHh3fDCYSZDx13sP/JdyOeYDNO0
 9aH9SlQVxo7DsngcKxWAT5GA9fUQ7ssCGUQ/a0w10LQTkzFKXEB7wOMARkaR0DcddyUIy18D753
 ROFoawPS2Gl0VOVhjptQGQvKn8Jdg3LYXismn3qa8PqkR5F1tyPHaMQRPx72dmvM0
X-Received: by 2002:a17:903:2ed0:b0:2c0:d29b:34ff with SMTP id
 d9443c01a7336-2c6bcfbc399mr5214775ad.10.1781650928470; 
 Tue, 16 Jun 2026 16:02:08 -0700 (PDT)
X-Received: by 2002:a17:903:2ed0:b0:2c0:d29b:34ff with SMTP id
 d9443c01a7336-2c6bcfbc399mr5214415ad.10.1781650927992; 
 Tue, 16 Jun 2026 16:02:07 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c4327ac794sm143688145ad.46.2026.06.16.16.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 16:02:07 -0700 (PDT)
Message-ID: <fa3c7e4d-4ec5-4aa9-a9b0-612f54ba474c@redhat.com>
Date: Wed, 17 Jun 2026 09:01:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: "Michael S. Tsirkin" <mst@redhat.com>, Ding Hui <dinghui@sangfor.com.cn>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 alex@shazbot.org, richard.henderson@linaro.org, peter.maydell@linaro.org,
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn, shan.gavin@gmail.com
References: <20260616052552.389021-1-gshan@redhat.com>
 <20260616052552.389021-2-gshan@redhat.com>
 <20260616021153-mutt-send-email-mst@kernel.org>
 <dfc55b58-5f5d-4ac8-a508-b208cf9565fa@redhat.com>
 <20260616054555-mutt-send-email-mst@kernel.org>
 <ecbd8c97-29f4-4e80-af15-ef5c25f2a66b@sangfor.com.cn>
 <20260616115004-mutt-send-email-mst@kernel.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260616115004-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ttb62yGIm6sm9fY5VuK1bclXxqONqkNNc_pLWiMiTzM_1781650929
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

On 6/17/26 1:51 AM, Michael S. Tsirkin wrote:
> On Tue, Jun 16, 2026 at 08:50:27PM +0800, Ding Hui wrote:
>>> What is the question, exactly? That's why I made the list of 11 issues.
>>> Is that unclear, somehow?  Another reason to include that, maybe.
>>>
>>
>> We can take the e1000 issue on aarch64 for example:
>>
>> Link: https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn/
>>
>> The software allocate ring buffer for hardware to receive packet.
>> In normal case, the hardware fill the RX ring descriptor, and with status DD bit=1 (Descriptor Done),
>> then the ownership of the ring descriptor is converted to software, after the software consume
>> the descriptor, it will write status DD bit=0 and give it back to hardware to refill data.
>>
>> pci_dma_write calls memcpy at the underlying level, and on aarch64 with glibc 2.24+,
>> the memcpy/memmove implementation uses a branchless sequence that copies
>> the same byte three times when count == 1.
> 
> Yes this is issue 11:
> 
> 10. on non-x86 memcpy will do multiple overlapping stores even
> for single byte writes. E.g. it does it to avoid extra branches.
> This is causing issues in practice.
> 

This issue should be fixed by this series. With this series applied, the memcpy/memmove
are replaced with 'qatomic_set((uint8_t *)dst, qatomic_read((uint8_t *)src))' in
qemu_ram_{copy, backwards_copy}_unaligned(). I hope Ding can give this series a try
to confirm.

After this series is applied:

   pci_dma_write
     pci_dma_rw
       dma_memory_rw
         dma_memory_rw_relaxed
           address_space_rw
             address_space_write
               flatview_write
                 flatview_write_continue
                   flatview_write_continue_step
                     memory_access_is_direct          // return true
                     qemu_ram_move                    // replaced original memmove()
                       qemu_ram_{copy, backwards_copy}_unaligned
                         qatomic_set((uint8_t *)dst, qatomic_read((uint8_t *)src));

For this specific case, what's done in this series is similar to the proposed
in that thread [1]. In the proposal, pci_dma_write() is replaced with address_space_stb(),
and eventually bail into "*(uint8_t *)ptr = v;". However, address_space_stb()
seems not friendly to DMA write from from syntax level because the limited
size is supported by it.

   [1] https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn/

   address_space_stb
     address_space_stm_internal
       stm_p
         stb_p
           *(uint8_t *)ptr = v;

Thanks,
Gavin


