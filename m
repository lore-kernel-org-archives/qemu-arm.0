Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1870710ejc;
        Tue, 23 Aug 2022 20:30:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ncUt0A/fwQVyMh8OU58/gpxAqQjQoZUQY68NfK0+b+hH2GR+JSzp+7BZbtE9cUT7Q+b7L
X-Received: by 2002:a05:6214:23ca:b0:474:8c8:4fdf with SMTP id hr10-20020a05621423ca00b0047408c84fdfmr23239581qvb.89.1661311824165;
        Tue, 23 Aug 2022 20:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661311824; cv=none;
        d=google.com; s=arc-20160816;
        b=JJ4YKjB4iODFI95ndz4jt/feZFHyBXL5QrFAeGTWx+mDRCnomML7pALWFbc/J388lM
         ArhEYwcpST8yKbXWfyBNw3yNL7URPQSfB3DQX5bs9255/4wqgZ+vDKHmya7Fer1Kztn3
         VSQuADJFTsnKiS1R9ZZd+Nk81A4YcfVZgI4fZm520NsV3RAUwVraaVBZ+3uG0hJKa3vE
         Hb2q55d1zbHup2lHsvkoJsbqu3ziC4upyr9An8VdS8xotVwSVYVVNqwh96UnSS1t4k9j
         tVsql+KAL4q0/D219wm4VKOdZQ88AiH10n3P4r0ba81r18EN9JXXvAx9Qt6+KlwH308e
         r2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:dkim-signature;
        bh=skBTlM1qYjaODtD+U/hyP1zUx30GK4Ge87puWKZMzxo=;
        b=vt4yGpQq+S+op1opEcVNLdqXDQZ1bobL7B9ZaOxh9gfS6v6/QyYp9I2WaIZ9NOePc9
         8FkZ9S/svHGSaNC5h3IHHAHZUl8JZs8pBf+NjvlKmrNVI5VYnN7cmzlcg5v9TunXwnJy
         ziuWVYSS88bN9oRMsQLCD8eTHDvnq+jS/OeU82OVN3CadjQ7+t3uZqNWJGzA2RrUfZOp
         A4+LPr85w0cKr/EpUJFAxdul+oE3bU4pidESXXsFexkwRUxSNbi3tddxlI5JwPaYrjgZ
         6yiPd0lVn9EFjbqFS1tNQVZBo/xm6fZtlIZcPsbiamyuuhPZroPlC7TafDlA7gG5lZoC
         rjHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hBVd+tLe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cp4-20020a05622a420400b00342f959afb3si7048551qtb.98.2022.08.23.20.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Aug 2022 20:30:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hBVd+tLe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQh5z-0006Vq-MW
	for alex.bennee@linaro.org; Tue, 23 Aug 2022 23:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oQh5Z-0006UL-Uu
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 23:30:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oQh5W-0003Zm-O9
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 23:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661311792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skBTlM1qYjaODtD+U/hyP1zUx30GK4Ge87puWKZMzxo=;
 b=hBVd+tLepos5dA3GcoeAm8y8YjibK+cXH4uiXJMwS+anvhaz/HArTBTYkggABzO1p20n6g
 bUvYSpFuo3TV8fPbGWfB+/W7GxNZ0jiqd4q1lTJKDtcsFIHFxS6WfNTaH+sEHYX1ZemYvt
 8rjbBUtXi4pQyQS4s6axjT0xAUNvFkE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-nsKUHO7UNlmkWBYnHBF-nA-1; Tue, 23 Aug 2022 23:29:49 -0400
X-MC-Unique: nsKUHO7UNlmkWBYnHBF-nA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 032CD3C0D86C;
 Wed, 24 Aug 2022 03:29:49 +0000 (UTC)
Received: from [10.64.54.16] (vpn2-54-16.bne.redhat.com [10.64.54.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68B6F1121315;
 Wed, 24 Aug 2022 03:29:41 +0000 (UTC)
Subject: Re: [PATCH v2 0/4] hw/arm/virt: Improve address assignment for high
 memory regions
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, shan.gavin@gmail.com
References: <20220815062958.100366-1-gshan@redhat.com>
Message-ID: <8f219b9f-d5ee-aa9d-519e-e3a7623c2c63@redhat.com>
Date: Wed, 24 Aug 2022 13:29:35 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220815062958.100366-1-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a9yKLIevCCrJ

Hi Marc,

On 8/15/22 4:29 PM, Gavin Shan wrote:
> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>      
> (1) One specific high memory region is disabled by developer by
>      toggling vms->highmem_{redists, ecam, mmio}.
>      
> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>      'virt-2.12' or ealier than it.
>      
> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>      on 32-bits system.
>      
> (4) One specific high memory region is disabled when it breaks the
>      PA space limit.
>      
> The current implementation of virt_set_memmap() isn't comprehensive
> because the space for one specific high memory region is always
> reserved from the PA space for case (1), (2) and (3). In the code,
> 'base' and 'vms->highest_gpa' are always increased for those three
> cases. It's unnecessary since the assigned space of the disabled
> high memory region won't be used afterwards.
> 
> The series intends to improve the address assignment for these
> high memory regions:
> 
> PATCH[1] and PATCH[2] are cleanup and preparatory works.
> PATCH[3] improves address assignment for these high memory regions
> PATCH[4] moves the address assignment logic into standalone helper
> 
> History
> =======
> v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html
> 
> Changelog
> =========
> v2:
>    * Split the patches for easier review                        (Gavin)
>    * Improved changelog                                         (Marc)
>    * Use 'bool fits' in virt_set_high_memmap()                  (Eric)
> 

Could you help to review when you have free cycles? It's just a kindly
ping :)

Thanks,
Gavin

> 
> Gavin Shan (4):
>    hw/arm/virt: Rename variable size to region_size in virt_set_memmap()
>    hw/arm/virt: Introduce variable region_base in virt_set_memmap()
>    hw/arm/virt: Improve address assignment for high memory regions
>    virt/hw/virt: Add virt_set_high_memmap() helper
> 
>   hw/arm/virt.c | 84 ++++++++++++++++++++++++++++++---------------------
>   1 file changed, 50 insertions(+), 34 deletions(-)
> 

