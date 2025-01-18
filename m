Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp4917959njn;
        Sat, 18 Jan 2025 02:05:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAd1+31DHvTcVfnYItdUAXl8SHpjG8kvJ1t+WV6eJOwyRFJCHIwDRLBwLjhnZnEH5DTIiak35HuUix7w==@linaro.org
X-Google-Smtp-Source: AGHT+IGSW2E1/Tpd9zSq/qiTy3WDo1sOuR9Qd7u5/YPydk6qPq5W1aAE3sMFjdL6xaEx90gd9Irs
X-Received: by 2002:a05:620a:439c:b0:7b6:d631:2669 with SMTP id af79cd13be357-7be6321be46mr948631185a.21.1737194725862;
        Sat, 18 Jan 2025 02:05:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737194725; cv=none;
        d=google.com; s=arc-20240605;
        b=THrjWYyEbPg+3kuKKLHlNUwu29T8fUi6pJMbwD44ww3uXPfRVJ+Nxc1JJiANfSm1GH
         2jqoyphv1oet5Pg2tM8bGCAsk5/pEMvDoH1BjWOvvWZuXEoGXE24IkPLgZf/1htM3A5F
         e+42K+gfrO3A8PPvgr3E/lvS3jmMkPbXv3euFIBT4BwG+btqa2A8E6jsm+noash/rfK/
         OCmEZ00rY1eIUl8iLaxlYaYPkX7q5n1RSsouKjqiw8GyZK67Kv41QB3V4arSAxU95XdJ
         al8TNDtreratqy+O3Pn7JF9jdblFPgtU0bQWYiW/Nr8qJoOFgWCBHqOUHVsV98G9imyB
         pWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:cc:to:from:message-id:date
         :dkim-signature;
        bh=Hjut8whFfjCaZr+RZ6ZuQCHIcuRVJxhxWEfHPpyo9j8=;
        fh=oQuN9aKsUbpI3uHWR8WU+tPyqEvGMPNnwlt4rr+v0pc=;
        b=DLtkY8Sz8JxpN7eYhYfFxKEvF9MIVdTQ0v1HKcF82as52YheWLO1eHv96dVXNikH1Q
         6BaT3eQxtszCCO8XXrwiY06+/tPADzggZv0JHmizmLHx4D+gCz9m1hbKIM4cY67vPDXw
         P5bjkGoeWE9gYYQ3W37uCcl9vSY32DkvzeZG4igiW4vCAU0zohdrbA8af7yY/L5szcbs
         Iqxea+gKyaCvcqgn9U2FjABqX9kKZfSAi7v/sTauNjZaBgvVigTd0Yde4w4nKfD2AKnX
         cfl6Je2BrkA7QeyIhfO/Y/Kv1orAnQpioAYq6Eud/LuhlwvbMHsL7k9hjMK/w6hQ5wpC
         6Lcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=klSrteoI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614c03a3si483499585a.280.2025.01.18.02.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2025 02:05:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=klSrteoI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tZ5hI-0003QS-Uw; Sat, 18 Jan 2025 05:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1tZ5hG-0003Pg-6e; Sat, 18 Jan 2025 05:04:54 -0500
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1tZ5hE-0007pT-Gc; Sat, 18 Jan 2025 05:04:53 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 359F2A41412;
 Sat, 18 Jan 2025 10:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC7EC4CED1;
 Sat, 18 Jan 2025 10:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737194683;
 bh=n6lk+IDDPFoEfytA9saYl9OKLXnh/xFJqbWobAiRjF4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=klSrteoIAiaWy1P83hWvx9aM/376V6UCPMuxkf6HhOcbF0AY+WwAcSKbO2PWpEouh
 1wCEgl7x8Cq4oFW2dvf3M82viZlzSDat42mt0JXMmOTjSc+YfwLIVxigihcLdRIyaT
 6GxZm69w4JNXaB3d5pDejY96qQGm5V/PAoTNM8FhoSofkJy01qPouOGEz0pew44CD9
 QyealEBQTyRF4Vi4B7jgan+0x2IfmOqr24BdHAvH7Q4klm4dZsbRFkaALG+roPGBml
 N4j+5YLTp8lDwSf3bWk+FDofqEwcOridp13ayn2IKYzvPXEDN63T/rOq9veiLroR6I
 MBWx7jHMwlISQ==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=wait-a-minute.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1tZ5h3-00DMRm-Df;
 Sat, 18 Jan 2025 10:04:41 +0000
Date: Sat, 18 Jan 2025 10:04:37 +0000
Message-ID: <87sepgtp3e.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, sebott@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/2] docs/cpu-features: Update "PAuth" (Pointer
 Authentication) details
In-Reply-To: <20250117191106.322363-3-kchamart@redhat.com>
References: <20250117191106.322363-1-kchamart@redhat.com>
 <20250117191106.322363-3-kchamart@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kchamart@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, sebott@redhat.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=2604:1380:45d1:ec00::3;
 envelope-from=maz@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AjbvWX3z2ztO

On Fri, 17 Jan 2025 19:11:06 +0000,
Kashyap Chamarthy <kchamart@redhat.com> wrote:
> 
> PAuth (Pointer Authentication), a security feature in software, is
> relevant for both KVM and QEMU.  Relect this fact into the docs:
> 
>   - For KVM, `pauth` is a binary, "on" vs "off" option.  The host CPU
>     will choose the cryptographic algorithm.
> 
>   - For TCG, however, along with `pauth`, a couple of properties can be
>     controlled -- they're are related to cryptographic algorithm choice.
> 
> Thanks to Peter Maydell and Marc Zyngier for explaining more about PAuth
> on IRC (#qemu, OFTC).
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 78f18c87a81..7f99f7614b4 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -204,11 +204,26 @@ the list of KVM vCPU features and their descriptions.
>    the guest scheduler behavior and/or be exposed to the guest
>    userspace.
>  
> -TCG vCPU Features
> -=================
> +"PAuth" (Pointer Authentication)
> +================================
> +
> +PAuth (Pointer Authentication) is a security feature in software that
> +was introduced in Armv8.3-A and Armv9.0-A.  It aims to protect against

nit: given that ARMv9.0 is congruent to ARMv8.5 and therefore has all
the ARMv8.5 features, mentioning ARMv8.3 should be enough (but I don't
feel strongly about this). I feel much strongly about the use of
capital letters, but I live in a distant past... ;-)

> +ROP (return-oriented programming) attacks.
> +
> +KVM
> +---
> +
> +``pauth``
> +
> +  Enable or disable ``FEAT_Pauth``.  The host silicon will choose the
> +  cryptographic algorithm.  No other properties can be controlled.

nit: "choose" is a an odd choice of word. The host implementation
defines, or even imposes the signature algorithm, as well as the level
of PAuth support (PAuth, EPAC, PAuth2, FPAC, FPACCOMBINE, ...), some
of which are mutually exclusive (EPAC and PAuth2 are incompatible).

Maybe it would be worth capturing some of these details, as this has a
direct influence on the ability to migrate a VM.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
