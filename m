Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3240656lfo;
        Mon, 1 Feb 2021 01:05:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzu8YzDTiTO5DahVwrRDd4Pl22RqejK1Dq1pNqWRy5Pgb/OtdmRROCocol3Z6GCjzOtb7Ms
X-Received: by 2002:a5b:b51:: with SMTP id b17mr18902362ybr.169.1612170319529;
        Mon, 01 Feb 2021 01:05:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612170319; cv=none;
        d=google.com; s=arc-20160816;
        b=R9blc4PZI2kdto7qyOjwvaeCdoCtjVJl5sPHlTPSAgA77dj1rXXG38v5uDCvJP6dpy
         GTKF5x50A4CGwjn7fa8L5PzNDuqjM/Q3kuq5p0mlmDyBrqjg5QAXCBAPHM4Npy0pDceb
         sV9VsIE20lJ6vn94w3iacmfssqDyw7AFcd72WEIRlsQf/fuzw0H0Ovf0Y6Nm0yhIJg/i
         Hfb1yZot1sX444PVhmFn7s+wz1/gtUA0AlkRdKfJQZQQ7N5dzBJdpMEllamcaT5HiTnG
         ++odxBbT9GeLHdts9LLmp9+52derN0XQwZDXDu9aFcgtal1kDGKDhN7pWywbOmUUbbhG
         +VFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rA4Poahqcvs3hugJ0Vxd7mWcAdH0y65GCIo8X7bZcfI=;
        b=tRHh5fCZV4ZrPSasItTb7Fe38p7v5OPXVjC1xhYHvCPSiU4u16GA6kijSgHLXQ9RPv
         1YLX9WVcvK0cjWqieig3vKqTLok77YAljp564Tm8LAXzg0SsA1ahulyeD9huO8swCZhF
         irHDh3UHebVNpAWEvAfV5HF4GPvC3NpiFzHQWy9xKs6VpmU4SNN1ZBxbZO47vGkoeM60
         CUcPvjyBwTk4lDhcwCMOlDgKojAEJxKt/dO2B86FBM5meDqdMZc5HzUlEClHMozyPybm
         6IxEI1JGYGuNgAPyInbGQ04pdQMALKln/Dj1Arx8IvetJZULdD6669RBXnNnYUPQQRzz
         kFsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VCuCMdY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 63si14660079ybh.449.2021.02.01.01.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 01:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VCuCMdY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6V94-0007YS-Sl
	for alex.bennee@linaro.org; Mon, 01 Feb 2021 04:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6V8W-0007WY-2p
 for qemu-arm@nongnu.org; Mon, 01 Feb 2021 04:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6V8O-0001vV-EN
 for qemu-arm@nongnu.org; Mon, 01 Feb 2021 04:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612170275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rA4Poahqcvs3hugJ0Vxd7mWcAdH0y65GCIo8X7bZcfI=;
 b=VCuCMdY3mlv38pDzq9+9jsYLXo3eereS+wU3aBdGfsNl+sRxzSiMhSvyWDv9mDMQ92ovok
 zGwGfuKDTOpc65bexwDtABvbM5YzIQqW6V8JRD9BdmjA0v5wOVnk3HCQyh9BDZEGtdzb9v
 plGozwDKF2c3sb3JWUDXG3DvndqG39o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-L2_pxnARM0GqqLsrp6cAew-1; Mon, 01 Feb 2021 04:04:31 -0500
X-MC-Unique: L2_pxnARM0GqqLsrp6cAew-1
Received: by mail-ed1-f72.google.com with SMTP id i13so1610173edq.19
 for <qemu-arm@nongnu.org>; Mon, 01 Feb 2021 01:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rA4Poahqcvs3hugJ0Vxd7mWcAdH0y65GCIo8X7bZcfI=;
 b=uRelzH0nml7+Zek5aq3meYAd7Ej65VQFUuWYKe6fNTt6CzTyM+7HEe9tdTn+sfeSnA
 3OPgYSHPc+fKXDMPLMqek1Da2CeG1BezXm7EM+WZEccK1JdvdaIcP1OKmY5YgY7RalCw
 4yN3ExL9DE9XOlfF1LRlYmPlbCWUr2EDpH1xvy8L+q0uS2lfH/lDsh/LsJwdzWvANoMr
 iuvcHLiSALLh1yLE3TCdpfFwNiQuThYZdVWaRvBVuqDQbPMHUGG2+86hIkPjx/DUdnz7
 d9yduGM9zwkXWqzXofo2OUIwVjTaVBDUyv5wQTeSn5kqhSVMzoisF+jGBdm935XqpUIJ
 hBrg==
X-Gm-Message-State: AOAM530b7q/P+ePGTpirggJPcFlkjs6FNQtD6gu0C+okhG6PqWdX4rAw
 ywHoJ1cID6WVRuu0yb/x7TBnTPanU0BIbDtZbI/O3oxOgd5KfWyzed0eKsRbYSFC+fXTEmdYsbZ
 QyPgI5rauBySCbqqwwzOFEqNM1fkXYVx2o8gPcnRyujE9H/A2dd+O4YD2U3fxmRWn
X-Received: by 2002:a17:906:2a8b:: with SMTP id
 l11mr16672209eje.1.1612170269896; 
 Mon, 01 Feb 2021 01:04:29 -0800 (PST)
X-Received: by 2002:a17:906:2a8b:: with SMTP id
 l11mr16672146eje.1.1612170269483; 
 Mon, 01 Feb 2021 01:04:29 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bm2sm607291ejb.87.2021.02.01.01.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 01:04:28 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Luc Michel <luc@lmichel.fr>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
 <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
 <337e9fe1-3d84-83a7-20b1-d64aa5125e7c@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2e21d938-20e3-1595-b1aa-6fc2eff087e8@redhat.com>
Date: Mon, 1 Feb 2021 10:04:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <337e9fe1-3d84-83a7-20b1-d64aa5125e7c@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c5Eq7BVzXIMX

On 01/02/21 09:46, Philippe Mathieu-Daudé wrote:
>>> +#ifdef CONFIG_TCG
>> I'm not sure it's enough. TCG and KVM can be enabled in the same
>> binary. You'll have to perform a runtime check here I think.
> If TCG is enabled, all SoC are built in (regardless of KVM enabled).
> If only KVM is enabled, the TCG part is not built in (only ARMv8
> based SoC left).
> 
> The problem is when QOM types are registered, we can not know
> yet if the accelerator is enabled, because accelerators are also
> QOM types and are realized later. So at this point runtime check
> is not possible. See this post:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777761.html
> 

The check should be done on the CPU type, not on the accelerator.

On top of that you could add a "depends on TCG" to the hw/arm/Kconfig 
file, but Luc is correct that it would be just a nice-to-have and not 
the real fix.

Paolo

