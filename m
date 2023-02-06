Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4148900ejb;
        Mon, 6 Feb 2023 04:47:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+SgdMr5MnqcamV47NMHdoSU3RTicVK4w1DT4ESvyEZUF+ZY4eLNzX5wEyxzROXvAQxDVcj
X-Received: by 2002:a05:6214:2526:b0:56b:ef97:10e0 with SMTP id gg6-20020a056214252600b0056bef9710e0mr11587154qvb.46.1675687652078;
        Mon, 06 Feb 2023 04:47:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675687652; cv=none;
        d=google.com; s=arc-20160816;
        b=Xh08izHujwVNorZSBoQro/7rNF3WHF+LxofFO2qWEbGUcZre/MRm3CRP9tQGMT8gOU
         j3nWt7eOcfpAN4QZ+a47ah6KPrWEPFygIXfybBOAx6uqp4+ix+QR/FFoDg9nlpDwEN3i
         wPjTBSVfIa+l7tbru5o45ojrbySn0pqIXrXtGYuye0kdXuW3qsBm+ygT0Vu6d45Jb3vo
         a+vbWD5O+Q0MCkUOCBEEouPcQJ1sOXB6dZMdHbF+uvjWyaO7VYYI4jnbi95IREkndSKA
         LF1+kWS49a3elLwc9Bq99i8iO/Q71o9AMSZFKeEEcss5RDaRexs75DASjVkhZOcLIgfQ
         Sqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TDRj1e1Of6zXPK6vdEPHmWKOg6uKLmaGGU/8IdkYWus=;
        b=guvvyr+Yudo/J6W4HiFygPevWDGQJ/DPCpKpo1+9MDsZLZlkX+0k6NI74SJRkfYAlh
         2Hg6GDofJlAaulRT9BiYpnfv230pakKt8zTmc7IsjQqAIVCRQt5kF3Iq0q6L8somNQBf
         mw2DLFcg8gjvlMatqO6sNsnedsnDxHP92tgRZSKA+VYdpZsfYbMDJsnj9uGVJ20z1soq
         9/EypsweWBPg6Qe4ayHUfx+kwa7o7ZbTyDb4dCicQdst+k1wZbBAF0hzXmSoCDdqNMiE
         NPXzZpt9sD5Ig0ZvIKKMXACYItW1J0pg2VinPLIqGu1jDO4ITL2Cc6FW+/He11110a3o
         eqiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WQxhDeZC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5-20020a0cfcc5000000b00498925e2db2si7482240qvq.524.2023.02.06.04.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 04:47:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WQxhDeZC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0tm-0000pQ-Qz; Mon, 06 Feb 2023 07:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pP0tc-0000oh-UW
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:46:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pP0tb-0003FT-AC
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675687614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDRj1e1Of6zXPK6vdEPHmWKOg6uKLmaGGU/8IdkYWus=;
 b=WQxhDeZCsFAsWjLmtlkYd7yGtQ8FCi+ejeRIq7VSHOLHQ5jxsn1xF8wm6Nj7r0r5dme8MR
 hbGBqz80Ru2P4i7N3kWPoLS7+S/fNR6q3n9KkBuNbncJBshxETXY/TH1rEdOGnXJACrzEJ
 6Dq92rYNvRxfl2zqXYQrqZAcvJbnSD4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-139-e-uG1_6BPD-wlvSN7TpW5w-1; Mon, 06 Feb 2023 07:46:53 -0500
X-MC-Unique: e-uG1_6BPD-wlvSN7TpW5w-1
Received: by mail-qv1-f71.google.com with SMTP id
 pv16-20020ad45490000000b0056bf828babfso1084393qvb.23
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TDRj1e1Of6zXPK6vdEPHmWKOg6uKLmaGGU/8IdkYWus=;
 b=GwfdL/+4OwLHLmZOdxMSn62/1XPvndJuGyjP/yc16xAkYrU72myetBYGyJTq8xk6Zw
 gs4cFtNRWNuDc0xNqZzgHrDzFy3ow0RBvXYUtJTGKzdN80JCf90izmkt0u+pj1NjxFjo
 bwsC2oe5ooefrrtOltUHqpSLRLaTEEjOZThdv8/IhJcX5PwbNJ2A+nYfPl9JedUMTTcU
 q0RiSU/y/1sovs3oDhnMm6YiRII7pGNqlZLZtRpnkooXqSfpBzDSfR/s+H38MTr2+Xzy
 xixNwyL7K4jxnMNO5TFGmaXJrteAqupO0Ws009zkgo65wuAhnMYQTsonqKcHu7GGD09M
 E7IA==
X-Gm-Message-State: AO0yUKV5cBJRFv5Y9nMY4eatmkLgk8xcyT2P9FL0CzClfjmYKrdumHRD
 Rt9mxPRCT4+M2xUS9h09fEP2k+8dcP3pWSAvOvzdzWP0RMTdDUuI/adM2/NT7nRgqy8JjHSkNGI
 ZWe/hP400eefHhh0=
X-Received: by 2002:ac8:5711:0:b0:3b8:6788:bf25 with SMTP id
 17-20020ac85711000000b003b86788bf25mr35877082qtw.23.1675687612548; 
 Mon, 06 Feb 2023 04:46:52 -0800 (PST)
X-Received: by 2002:ac8:5711:0:b0:3b8:6788:bf25 with SMTP id
 17-20020ac85711000000b003b86788bf25mr35877052qtw.23.1675687612305; 
 Mon, 06 Feb 2023 04:46:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 s184-20020ae9dec1000000b006fcaa1eab0esm7260423qkf.123.2023.02.06.04.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 04:46:51 -0800 (PST)
Message-ID: <e6732349-efa8-afbf-6c69-498643250bfc@redhat.com>
Date: Mon, 6 Feb 2023 13:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 1/3] arm/virt: don't try to spell out the accelerator
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-2-cohuck@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20230203134433.31513-2-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LpRTRACQeOXZ

Hi Connie,

On 2/3/23 14:44, Cornelia Huck wrote:
> Just use current_accel_name() directly.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/virt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ea2413a0bad7..bdc297a4570c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2123,21 +2123,21 @@ static void machvirt_init(MachineState *machine)
>      if (vms->secure && (kvm_enabled() || hvf_enabled())) {
>          error_report("mach-virt: %s does not support providing "
>                       "Security extensions (TrustZone) to the guest CPU",
> -                     kvm_enabled() ? "KVM" : "HVF");
> +                     current_accel_name());
>          exit(1);
>      }
>  
>      if (vms->virt && (kvm_enabled() || hvf_enabled())) {
>          error_report("mach-virt: %s does not support providing "
>                       "Virtualization extensions to the guest CPU",
> -                     kvm_enabled() ? "KVM" : "HVF");
> +                     current_accel_name());
>          exit(1);
>      }
>  
>      if (vms->mte && (kvm_enabled() || hvf_enabled())) {
>          error_report("mach-virt: %s does not support providing "
>                       "MTE to the guest CPU",
> -                     kvm_enabled() ? "KVM" : "HVF");
> +                     current_accel_name());
>          exit(1);
>      }
>  

