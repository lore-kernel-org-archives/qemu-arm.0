Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2028338lfb;
        Thu, 26 Nov 2020 20:59:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVLVLfHfjLgwdWxbiTAbxI+OiWMgOOodYtcsejX/wSZJ9lDQ5xL8hAi6uFZB6lige4tDxd
X-Received: by 2002:a25:3493:: with SMTP id b141mr6854491yba.320.1606453193078;
        Thu, 26 Nov 2020 20:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606453193; cv=none;
        d=google.com; s=arc-20160816;
        b=eR/dAaGm7xMrbLPNV58ywcaGSo2sOvUKjvFVUdO9/vP1Vp3xek35Ev2wRHdvMuTRHM
         16F3p62n6PFvlfDO5c4oCtq92agDotRMRdKz/CNlNSP+jhMh9Jo+5HDx5+hnL2WZgImk
         exz6EnXhRVWWaVmhpl++g72uTO+1QDppdj3dDvbZlCEezFV2PvA+cSb/X0OpnqLejAIP
         LMkh2VNVywnjxz47enHFv2GPYAx40A829PsWNYb62ISuV3ddZTDNl2JyTwycNEA/2dgL
         +C4YuDBjm3E81lMVQhD+Cj7PTSovxC7+MdbwZ7uQkcXSmHasYhGUk3gCtWosVJCh4Exp
         nvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=u5DNNUxYeOYLRMc1uslSjLOudofVnOvS0Rh60db7kHc=;
        b=yOtyf75zp4/7/psVDVaDPu9fdjGQkobGDj18x2US/YESNhuLs9NMkB/JivsIw+z8IZ
         xNJ0qQPwaC9hR7jlKdmdYy4WjX60GLz48n+GCaAF5vvsYI0S1Wpoex7DnIgD+yUJu0Ol
         pkUZdcH6QxurDDNmmj8O/75miL0NC/gc8z92S8D4V11J2kucnuFBdQrPBWMYJf02b1Fq
         sVO+lzrNj0vMjPuf6qsEMcyGWQBZ62sxg4BgYTQyQS6m7NdI5zHkSsoOcsjE6DW2MruG
         I4SnFeOU6IwY9NB/OvEk8qrxFn/5KG7cTSMyM3VeavluDFPgd54Mh4HieG03PlgHvMm0
         uR0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c16UV0T8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20si7686516ybj.71.2020.11.26.20.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 20:59:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c16UV0T8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiVrK-00024m-Rt
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 23:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVr1-00024U-Ec
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 23:59:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVqz-0007Z8-In
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 23:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606453168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u5DNNUxYeOYLRMc1uslSjLOudofVnOvS0Rh60db7kHc=;
 b=c16UV0T8QYD60ceqgOZ2KiPIovLoWegyouXLIsVokHlDgsoTSpqUpjFqIjvAetvFW+vAdp
 A6dpa0ueAs+Z+3UhVNEJmLWYMxnjQAVbDmp0Mz0rc8o3FAgtRbJPYJ/uHYxZfHsfOazYcU
 9GNonoxDmUA1fhox4lborbGthu419hk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-3YX9uUZtP3q9ex5lHS7mXA-1; Thu, 26 Nov 2020 23:59:26 -0500
X-MC-Unique: 3YX9uUZtP3q9ex5lHS7mXA-1
Received: by mail-ed1-f70.google.com with SMTP id f20so1976701edx.23
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2020 20:59:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u5DNNUxYeOYLRMc1uslSjLOudofVnOvS0Rh60db7kHc=;
 b=PgSwr7JZb5I7D758WqXHcnKfz6GZoau+/dG4NSxYDgprddp7QBWnSrV1owcphPatP4
 foM7LBEWov4YlulseLmP8QTyzs1Y0o62QvgZebQp56mM/ntSBF3qnY6D3tNGA4eLJoq+
 Lv8kK0YuowZ9Bt1Mt6sqYr09CQSu8GfFXCSPA0blLQTR7FoAl8T6tYOnzV8WpNWw/Cov
 jkgwSlpBrgCp6hgoHNNBHNPi5C4mTTirbs7Y0r1u/E50clPRMTiBrUrG4cMKJYZLR+zR
 ZNsC/MIp2OrqSNiK8XCmA2a2gLWm+hMrfdnS0ZQCUaMxLELgonsVqSxYWenYoZqDTFGX
 rUbw==
X-Gm-Message-State: AOAM531ynxbB0arn6czcoa8epQ5oXxhVbBYNcH6ZEtaP7HZA0EEQyitb
 hhNAQ1L8gqGbo24GLAgSsWrO87Vjv+rsfHOTQZphBUsZZ6UAP6O+s1BUne10qBdz+notexff6Dn
 NR+t5xObLIsv+
X-Received: by 2002:a17:906:a946:: with SMTP id
 hh6mr5092767ejb.456.1606453165453; 
 Thu, 26 Nov 2020 20:59:25 -0800 (PST)
X-Received: by 2002:a17:906:a946:: with SMTP id
 hh6mr5092748ejb.456.1606453165167; 
 Thu, 26 Nov 2020 20:59:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id s6sm4270905ejb.122.2020.11.26.20.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 20:59:24 -0800 (PST)
Subject: Re: [PATCH 7/8] arm: Add Hypervisor.framework build target
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-8-agraf@csgraf.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <48aa3247-9d1b-301f-adb5-7779cdbbf37b@redhat.com>
Date: Fri, 27 Nov 2020 05:59:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126215017.41156-8-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hXFSTyjlTy5q

On 26/11/20 22:50, Alexander Graf wrote:
> Now that we have all logic in place that we need to handle Hypervisor.framework
> on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
> can build it.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Between patch 1 and this one, this series is a nice showcase for the 
good, the bad and the ugly of Meson... :)

> diff --git a/meson.build b/meson.build
> index 2a7ff5560c..21565f5787 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -74,16 +74,23 @@ else
>   endif
>   
>   accelerator_targets = { 'CONFIG_KVM': kvm_targets }
> +
> +if cpu in ['x86', 'x86_64']
> +  hvf_targets = ['i386-softmmu', 'x86_64-softmmu']
> +elif cpu in ['aarch64']
> +  hvf_targets = ['aarch64-softmmu']
> +endif
> +
>   if cpu in ['x86', 'x86_64', 'arm', 'aarch64']

This would fail to compile on 32-bit ARM.  Simpler to add an 
"hvf_targets = []" else branch above, and add "'CONFIG_HVF': 
hvf_targets" unconditionally.  That is, copy even more of what it is 
doing for KVM.

Paolo

>     # i368 emulator provides xenpv machine type for multiple architectures
>     accelerator_targets += {
>       'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_HVF': hvf_targets,
>     }
>   endif
>   if cpu in ['x86', 'x86_64']
>     accelerator_targets += {
>       'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
> -    'CONFIG_HVF': ['x86_64-softmmu'],
>       'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
>     }
>   endif
> diff --git a/target/arm/hvf/meson.build b/target/arm/hvf/meson.build
> new file mode 100644
> index 0000000000..855e6cce5a
> --- /dev/null
> +++ b/target/arm/hvf/meson.build
> @@ -0,0 +1,3 @@
> +arm_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
> +  'hvf.c',
> +))
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index f5de2a77b8..95bebae216 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -56,5 +56,7 @@ arm_softmmu_ss.add(files(
>     'psci.c',
>   ))
>   
> +subdir('hvf')
> +
>   target_arch += {'arm': arm_ss}
>   target_softmmu_arch += {'arm': arm_softmmu_ss}
> 

