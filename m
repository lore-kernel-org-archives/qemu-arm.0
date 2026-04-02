Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78D1D6AAEC
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 18:02:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8MNF-0001UQ-DL; Thu, 02 Apr 2026 14:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8MNB-0001LX-FY
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 14:02:30 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8MN4-0000X9-93
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 14:02:25 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-483487335c2so11750515e9.2
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 11:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775152940; x=1775757740; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Cqd02rloH4qWYkodiVboVkNgAG3Np1UDG5yCBlvtX0=;
 b=gvWQiK1qfqx21gqj1+xy6nRx8qRPo7uA0mQGxMtBZvbRipBSZPjzmrQdPVj+Jm0kfb
 xDXTO67OiIXpoBmHlkYly+czSiYuix0SDfPojYLXBYqAp+XOzFVK7LWo0/SS3t95Ym91
 iDOMII674ohN6j3vAB8wVJBAuZCEyq1Rlig0HN3ytnMERJDnZKiMfkqAxLOHeWnBviMD
 UHcu1wZLDX68Ru2N3QkuhIGh38odsJ0/WIMKbbR2lP5hFwcC44h31W82IMum0bOhp04U
 SyosVSIt1PLT6/uOfjc4Hh2U3VICHznceZOexAHbRWntIV3/TecV10J4jRftZHvQMX+s
 hBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775152940; x=1775757740;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Cqd02rloH4qWYkodiVboVkNgAG3Np1UDG5yCBlvtX0=;
 b=hdxp77+KsASl87b+PQY0QDvzVVWXINe8HphyYhBwLcZFwW7SYR1AvWtf0F6/JO84dp
 /FFMncnLA2lJWULk+EZ6MVSCUDWzJFwhvI1Iy9sVfqq2HflgfbLw1GOTx9va6UyKf8lW
 WzIu2+etd0TbjkvZxNSRBrEfYiC36Z3Z0R0UUtBNrpPTWGlHm63iDR69qVgv+WD79h9N
 QFHCz7nmnfjvm29KlqeGLpCbHJfykRX5YCd1azF90hL3q2rMCUpllYNsGvX8M9SbHwTS
 8kjNnPP9rO7VGLqvqo+5SXQKPhEFIgjwfzAZB8vhFA4VTTRmXJiGbR+MrpEnxrd8wE2z
 N0Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf2ViAPYsvrKHs8ilPbBHeWGVl5Bj0C9HZqlM5SOT2dyZfm6JL5zqiEOqPffzhbA4eN7IPdvhQaQ==@nongnu.org
X-Gm-Message-State: AOJu0YzUwDwUrO7yUg/GP46E68h6vxWfteXsDCwABX1A4ZDhxbrbsZG1
 YWRzvtxIPm0cUU4VYOXFGlFztp7SNECGRv/C5f4Lp/9Dt+awzn4mova8QZvoZFe53sk=
X-Gm-Gg: ATEYQzyLCiE0uhc6wySTdUE8yCWJuxmwtA6Sg8ro8UGMUetEO51eCNulh5QkIfn6bPU
 H3hXXRYnEeZIJzsfJUS/KAtgPaMK62okmgkJZHM++p1FoIuOz02gZV9kkVpc640V+wjcHHQckBe
 nRM+hOtPO77S+Dd04dTaj8AfqIeEOHXqu/0CrEi5b3KQZU+tlEAFM0yS39e/EkwtHejGZ4RJMWE
 I6iJxeJ5S8i4msMXsFbe/8c0/ixWC1mq9QzLVMwpnAoRLmHKDBxPytqU1ZCdlAJNqcNfDaVWCh5
 yuHrJTcUr+Yb1Fj31gA1UqNFkL9RfW4gFeSjNTru7nL4JJYN9XAHqF3jf0zUd3PpbbZfVvRyFDN
 nUHKTU2UK+NuesIT78yRZAMWEgoF7cs397LMduulAE4fLNodduxV1zfD1JBvcxCZwkWLEtTh4Vt
 MGm1FmH6oV3udeSp+4p5yKRXLeekTLhLeJkKXcaxBPx5Xo33TkO2/amjiDwuEYchwRsA==
X-Received: by 2002:a05:600c:4e88:b0:485:3f72:323f with SMTP id
 5b1f17b1804b1-4888358809emr146323355e9.11.1775152939887; 
 Thu, 02 Apr 2026 11:02:19 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887c8ee2d3sm74726695e9.32.2026.04.02.11.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 11:02:19 -0700 (PDT)
Message-ID: <66240c1c-07b8-4faf-84a4-0275d772b82e@linaro.org>
Date: Thu, 2 Apr 2026 20:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-11.1 v2 4/9] accel/kvm: Expose all non-target specific
 declarations
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260402170434.94783-1-philmd@linaro.org>
 <20260402170434.94783-5-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260402170434.94783-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/4/26 19:04, Philippe Mathieu-Daudé wrote:
> None of the declarations guarded within the COMPILING_PER_TARGET
> checks use target-specific declaration. "cpu.h" is not required
> since some time (maybe commit 4fb54de823e "meson: build target
> libraries with common dependencies"). Remove the restrictions.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/kvm.h | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/include/system/kvm.h b/include/system/kvm.h
> index 9b722ad931a..c33fb160b5b 100644
> --- a/include/system/kvm.h
> +++ b/include/system/kvm.h
> @@ -225,9 +225,6 @@ void kvm_irqchip_add_change_notifier(Notifier *n);
>   void kvm_irqchip_remove_change_notifier(Notifier *n);
>   void kvm_irqchip_change_notify(void);
>   
> -#ifdef COMPILING_PER_TARGET
> -#include "cpu.h"

Prerequisites still missing, sorry.

>   /**
>    * kvm_update_guest_debug(): ensure KVM debug structures updated
>    * @cs: the CPUState for this cpu
> @@ -450,8 +447,6 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
>   int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
>                                          hwaddr *phys_addr);
>   
> -#endif /* COMPILING_PER_TARGET */
> -
>   bool kvm_arch_supports_vmfd_change(void);
>   int kvm_arch_on_vmfd_change(MachineState *ms, KVMState *s);
>   


