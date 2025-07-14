Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AC6C83F1A
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 16:52:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubMQ1-0003Kw-UY; Mon, 14 Jul 2025 12:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ubLVV-0003Ih-HJ
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 11:54:22 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ubLVT-000772-Mi
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 11:54:21 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-7490702fc7cso2723984b3a.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752508458; x=1753113258; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OkC3rNYoVJo0EaWuNbUfG9cVGCYaTYcoWc1Wldc65SQ=;
 b=xg0f/nmIFvaTaj6M40eEdOVa6lc1G0c5OTRKcSEAR7rL7bmSTcL2ovSzr2m60+lhNW
 6Mhl6DbI7CRdsjxqxkzblMNzEZ+4aFip5gJtUpZtzzOCnEBS8WqDZ3e4hkZiMm/LS+3C
 iXN8LY3U4k5ccXPM1ZR1KPplQL7YpkUWeX9av1JxcyUlpsIeFTSaWrrkW5ayi8IBSPDR
 nBHufALnp3QCIxGhFYh2Q2pGIgLy+CXJtN6HRLXGgNe8MEVJNiywa+jDMlJUZ636O4uY
 e11C6Ytiw3KXo5NHE0kv3KAMZYvZYp7ING+BWjyBI1KLYaYNY+mCJq28WSa9+MTuhla7
 h6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752508458; x=1753113258;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OkC3rNYoVJo0EaWuNbUfG9cVGCYaTYcoWc1Wldc65SQ=;
 b=XNZfsvnddwQXl62DhKl3WMPEh0wG756TisJ8UHAK8s4vT+1SGh6ap11kYgIP3A2Ohc
 dhDdV0GYGs6kYTpcGns11Tvrg4Qkf+D3xSVF45HEVqoG9aBFUPVb+KKwSve7Kgc1mw45
 lWYRIqDWYHDNE+GRyTRpGkRe4dEVNCv2Ja8wslqLgcaZ6PGYqgZ9Pqo9vF66x/eIAf1D
 dZdKuPpktFBN/s1O1COmv2DssbXGES1BdJDmIJZWjPbNb9AyZf1u6l56j6BeFArjU0jb
 s/UY/1TVOZJYkc/k3WaLAXrtrsVKJo+mOt3sYFAXWIiqr6I3sW5/eqZHw35iEGqO5Rc9
 NtjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl5piSm7hPfbrn7HASL0ZnzSKLrbaT4BRlju9hYgCFYgmbgLWEQap9c8vgMr2iUUjHO8+jKyO0XA==@nongnu.org
X-Gm-Message-State: AOJu0YzmHhsn4qBq3Z/Xfxp3xFihMOL759BrlEjBCrVHbwP4hcZIRmX0
 sf6XxFx6+BzRh8unOJS7GXGsjSkkF4nYiLBRvUyUmJqQmKXmSPMis8pVmrnR7LoMtIU=
X-Gm-Gg: ASbGncu+n6who0INORgEHPaYsLLi3hPxZZSJCsshpLqZ+JrzmFmv53zQFyO0RH3h93R
 YI1Vqtk/WP56lXtFthZ2UoNsDHCXZduq559lzurSKaLvqJ3g4Pm2TjOlFnK0bMzNMgZAB9LD3xW
 hyeTbJe/BeKvgNMj1KiRDYGeKTBPaOhJ6+Bn7mqDBGskae+k5ctvD+gaJhPwxdAKutbS7lSvpNv
 un24pYlOgABfz87WFI8W6K8RhV1xhFDt4ub75HkqrgwY/GGoD6hHQe1ZxwGya/3dQk1cHCCc74N
 DHoWhSfl+1dpFdxxIUZe9AbdxLvZ+jX1MNLJpRv0dDIklSzHLxuKcG21Gszx+DZNbc6RcbGd9/X
 rQ5Uv5T+JPFaTRuiTs3zojYbHpuP4fHuz7idok2r+3q2Oy4ZqWdUSwJ8Pbs74+f4=
X-Google-Smtp-Source: AGHT+IEn+gLq96LdhuIAnZC/mbTFqusBtzvRU7mZzMo5N/Rb+ZVJC+IsBdYO9E6P6B3ENSby2aDB5Q==
X-Received: by 2002:a05:6a20:1596:b0:222:c922:e33 with SMTP id
 adf61e73a8af0-2317dbd4e60mr21008862637.6.1752508457991; 
 Mon, 14 Jul 2025 08:54:17 -0700 (PDT)
Received: from [10.113.99.227] ([172.56.179.167])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe72912asm10374528a12.71.2025.07.14.08.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 08:54:17 -0700 (PDT)
Message-ID: <6f0cd2fd-2152-4c28-8dd1-ca7271e686f4@linaro.org>
Date: Mon, 14 Jul 2025 09:52:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Provide always-false kvm_arm_*_supported()
 stubs for usermode
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250714135152.1896214-1-peter.maydell@linaro.org>
 <0b438773-01b9-42e1-8edf-2330e50387f8@linaro.org>
 <95b00393-bdd2-4db3-ac39-02a09f83b4d7@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <95b00393-bdd2-4db3-ac39-02a09f83b4d7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/14/25 09:41, Pierrick Bouvier wrote:
> Indeed, clang does not fold the condition "value && kvm_enabled() && ! 
> kvm_arm_sve_supported()". Looks like a missing case.
> This code compiles with gcc -O0, but not clang -O0.
> 
> extern int f(void);
> int main(int argc) {
>      if (argc && 0)
>          f();
> }
> 
> As folding is not guaranteed by C standard, I'm not sure it's really possible to file a 
> bug. However, since we rely on this behaviour in other parts, maybe it would be better to 
> rewrite the condition on our side.

It's probably worth filing a missed-optimization type bug, if that's available in clang's 
reporting system.

With my compiler hat on, I suspect that GCC generates IR like

   if (argc) {
     if (0) {
       f();
     }
   }

in order to get the short-circuting part of && correct, which Just So Happens to fold away 
exactly as we wish.

I'm not sure how clang expands the expression such that (x && 0) doesn't fold away, but (0 
&& x) does, as evidenced by

> +        if (kvm_enabled() && !kvm_arm_sve_supported()) { 


r~

