Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A957C83F1D
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 12:39:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZqXt-0005jT-0P; Thu, 10 Jul 2025 08:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZqXl-0005io-Ky
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 08:38:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZqXX-00026d-Hj
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 08:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752151090;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBbqLVbb4mMQBkscVz7ffuFQui58Mhk166fIk0k9BIs=;
 b=Kb5LJvVVaKMINnMWSO21YOUxkTKrpF4awS+fDFqxrh1mR+8rPhhF/r/fVlgbXuJPLixqyT
 1xrAxtFYhq90luaQZFi2F2Ha374+xcrXkDSHxgHotDzzqnDxue4zhtgryp9PPPw/061ZLl
 dNB+tL2lAcSmWR1UnEiC10Z4zB19buE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-PmaLDj0KMbeiPzLH_WzFsQ-1; Thu, 10 Jul 2025 08:38:09 -0400
X-MC-Unique: PmaLDj0KMbeiPzLH_WzFsQ-1
X-Mimecast-MFC-AGG-ID: PmaLDj0KMbeiPzLH_WzFsQ_1752151088
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4532514dee8so7524765e9.0
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 05:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752151088; x=1752755888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WBbqLVbb4mMQBkscVz7ffuFQui58Mhk166fIk0k9BIs=;
 b=tDhtYpC8PPF1FyW9Zy2aWDh0IBsZQbsr4oiQd+jIY+Lb5t+fhBJYm+ByoMC28VqJid
 Mne9SDi2enghBU3B+CZCqM8cqaYeWFiycChjxF28oWe0et3yIiJZfdxpjBS9XdxQ0ZmL
 h9vDh8FBrHjtvAPdVFN01vcEUdhgOIK0O2m++nIF/1lxS/CIuApMyoTCVCu7UWtxTX0L
 xvcJtIDs65fUfIERYYdDiAyslKt/MUuzrreQ9mrrPDnaqXTXQB+M8wa5OJCL44/5Iz5G
 GrmFJvuuu0gBtWyP5pdLNUIK8OY/V6LZUK9+aLxB7I+hM8OlbFy5fpYC9o542MPz67b0
 nBvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSh7cKYDJOPNENZ0kC+UxUxm3Bu0upSWJQ9vEB37D5Gu9sR3GiSkxj8A/xMjOcVblSInf/1gYnUQ==@nongnu.org
X-Gm-Message-State: AOJu0YwEXixHNKvIM7f0qmFEs3+wWQ3/H9HMsQY9tPoKdsVpPnivDg+N
 1S8hpnPtdFwAG6H/h8s5ELPCorlBFtKHpzm9k7yiQFuQM6kRteBsmlIVnYAyiftyfTpTXAv4Y24
 2+ClAvX/eOLQNa86eaZOBGkHXEKO/R/AwCmJPyWnXc5ZZe4g5FiCfWw==
X-Gm-Gg: ASbGnctEEJQdYXep5e2OzswyMJJHN7cNdMok2Uj+u15rasx7JzjozyJBbd3ZLZSC5Na
 +cqmanEasHcfRW9Eqv6+s8l/xjAEMwDo+NdrC2Wa2QnSXWi62h1SD7pbDSbPHk1UKPThtzRAA3m
 35qEdFO8Fd9FCr2ckoFxIG60Pc5oS6xhiUw/b0GsDfyJ4kIPv2lGkgSYYV3P6aSMzzjoXNV5Xxh
 P0RVvBisMIIeLBC8aLGt9g2ze1KaUbitwmOAUfF4CEp9f3M2faB4eTdIEoZ5QAGltrYMwH9jDoq
 yKzwJ+goUHkpwMnBiF5ehZZsouqdC6quz7J/EfUO+NUPMWfsfwlqdMzNy+LLrUxx2INYKg==
X-Received: by 2002:a05:600c:3589:b0:439:9b2a:1b2f with SMTP id
 5b1f17b1804b1-454dbeefab3mr30632955e9.3.1752151087790; 
 Thu, 10 Jul 2025 05:38:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/00WZJXz/sRbHElftGoi2dIKiBrkzchsACWbEj9ZL+4jUDNYpiDM0zrBC4MXTflKwEcnfUw==
X-Received: by 2002:a05:600c:3589:b0:439:9b2a:1b2f with SMTP id
 5b1f17b1804b1-454dbeefab3mr30632595e9.3.1752151087343; 
 Thu, 10 Jul 2025 05:38:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd43906dsm19204495e9.3.2025.07.10.05.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 05:38:06 -0700 (PDT)
Message-ID: <06350d07-7c4f-4ed9-abc1-a3d447a814f8@redhat.com>
Date: Thu, 10 Jul 2025 14:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/5] ARM Nested Virt Support
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com,
 hi@alyssa.is
References: <20250707164129.1167837-1-eric.auger@redhat.com>
 <CAFEAcA8UGHWLY-OpSZ2CP=LY7AynO_YxS27BzLadegL40VgNYA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8UGHWLY-OpSZ2CP=LY7AynO_YxS27BzLadegL40VgNYA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NCxDhTGDil5rjOd3ea0qcPo0npzSp1VaqLEANhq8Yr4_1752151088
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Peter,

On 7/10/25 12:42 PM, Peter Maydell wrote:
> On Mon, 7 Jul 2025 at 17:41, Eric Auger <eric.auger@redhat.com> wrote:
>> This is candidate for 10.1.
>>
>> For gaining virt functionality in KVM accelerated L1, The host needs to
>> be booted with "kvm-arm.mode=nested" option and qemu needs to be invoked
>> with: -machine virt,virtualization=on.
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/v10.0.0-nv-v9
>> previous:
>> https://github.com/eauger/qemu/tree/v10.0.0-nv-v8
>
> Applied to target-arm.next, thanks. I'm going to squash in
> this change
>
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2248,8 +2248,13 @@ static void machvirt_init(MachineState *machine)
>          exit(1);
>      }
>
> -    if (vms->virt && !(kvm_enabled() && kvm_arm_el2_supported()) &&
> -                     !tcg_enabled() && !qtest_enabled()) {
> +    if (vms->virt && kvm_enabled() && !kvm_arm_el2_supported()) {
> +        error_report("mach-virt: host kernel KVM does not support providing "
> +                     "Virtualization extensions to the guest CPU");
> +        exit(1);
> +    }
> +
> +    if (vms->virt && !kvm_enabled() && !tcg_enabled() && !qtest_enabled()) {
>          error_report("mach-virt: %s does not support providing "
>                       "Virtualization extensions to the guest CPU",
>                       current_accel_name());
>
> so we can distinguish "QEMU doesn't support KVM EL2" from
> "QEMU supports it but the kernel does not".

Sure.

Thanks!

Eric
>
> -- PMM
>


