Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811EBFF4923
	for <qemu-arm@archiver.kernel.org>; Mon, 30 Mar 2026 00:56:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w70vP-0006eW-Kt; Sun, 29 Mar 2026 20:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w70vO-0006bi-FM
 for qemu-arm@nongnu.org; Sun, 29 Mar 2026 20:56:14 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w70vM-0007D6-Q9
 for qemu-arm@nongnu.org; Sun, 29 Mar 2026 20:56:14 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-35dac556bb2so90507a91.1
 for <qemu-arm@nongnu.org>; Sun, 29 Mar 2026 17:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774832171; x=1775436971; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ojPG2Ze40t1KtSD6h5yAXHlCsX9S2Na7rWSxoBI4080=;
 b=EoyHCl2OhvlqbvnzOOAcVN/HmdaeMypYBrpQfUWTXl/oxKVX6N2x7XeJDNcNgTKvCS
 UeWBXH29mBbCfSwdCx5c6Qi3ENBkeGgOr4snaycQ2sblMJTCSkIJ5dCOKNoJKuQ8+xsQ
 f6jqGeEI+hnZph0yzV7gYcjMD46MHd3ttbWUJbbicLgkXOOVbxLI5JcxiO55LOcER9BA
 hfex0KmPEE1dHAWjMOeZkvkwIWDRFiRjH65/n6tFqZyQ72eqni0EwuaANioF5LH/6Zzt
 1x98hg19XFiUBp5Y0hjKEGy6Y1odbkU+IOJU3qcx+z5P6NdepSKxBbiTqRq/IcdJE8hi
 iU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774832171; x=1775436971;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ojPG2Ze40t1KtSD6h5yAXHlCsX9S2Na7rWSxoBI4080=;
 b=YSX0hNdzZn8mfF727SNtnzqHXoneR1EZGlKY078GSB8alBEBjt++WmDZAvfG0RVUUY
 b8Q3r2Z2hpKIfZCvbVi1BLHgiZtq5a9Lb4S49O07HVOkpZniRAQ3ritJtNZ07+4wCVSe
 3OrLXfZ6ZsDFjYxz260vrSnF/JYfii+5kcyjOE+Fxgp7fLFtHdVqUSIlcMUEXUKRUptz
 hzUN6bsAZAwpdzAl/JEWZe/jQfJD53EYIaag7ifp8XR5anRqdXaZKC/SXfdOx7nvT7i6
 FAhLysrGrEcEW7f63enKnVL+I+hHPKnGpn1R656v1InhtrdsFKGiXxbCw6yGLL+oQL2T
 OSzg==
X-Gm-Message-State: AOJu0YwTGshTtFFbWCstrw5/3H2fbAGpHc2GW2m73EYETp8R8iegFqgW
 Dvy5iUxHhWID+Cye5PhrO8tVQSXyLw0+Bbx7VtZN4tApXzAZvRzGqeJf3Ca3gpp2tYk=
X-Gm-Gg: ATEYQzwUAfU6f53XtE9/M6s2+okzwmAbhmQnVDzFiRQp8XapCV/fQEGuKWjHq89fqE1
 PiII8IDqsyf3ggnccTIWMH6bVPDy/CUGxfNaOoBUVBxJvK5evjgBkfZX6GR25oV5kHgSVk2eQh+
 90DG7of7dJ5JCwCrxUMNbvbwNaSXqFbJbSDpaA9NhtbZqVdYJD63HFAQHUfuxQ9wwIQnRhBRj7V
 dKo7Hd0+C+Na2TkFFmaKLq+qt7YLPq/FK3S287L/HIjs1WzmfbnRJJd50wNova98hVjbBZ0ANe/
 2zm+XYz5L55DW7WNWJq0RZ/p10d02ZqrU9Lb3txjcN5JcCNyLw0c1yPfjx/PjLasuUfwl012xdW
 gwX0Z8tUPXB7LgmGME5bhkumlbcukWIyO/d1TIsYhKIqnpZav+6yO+Djd+YmlhDYXc02D59L6o+
 vIbJClWHTm7S3NDHeozGCiEdJa1naMchH8vqzlY38=
X-Received: by 2002:a17:903:944:b0:2b2:4fe3:7b89 with SMTP id
 d9443c01a7336-2b24fe381bamr29726875ad.38.1774832171061; 
 Sun, 29 Mar 2026 17:56:11 -0700 (PDT)
Received: from [192.168.4.112] ([103.73.85.112])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b242765bf4sm70385995ad.42.2026.03.29.17.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Mar 2026 17:56:10 -0700 (PDT)
Message-ID: <e680a72e-8db9-4cbf-9986-0b03db60ddaa@linaro.org>
Date: Mon, 30 Mar 2026 10:56:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] include/tcg/tcg-op: extract memory operations to
 tcg-op-mem.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, jim.macarthur@linaro.org
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
 <20260327165042.604105-2-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260327165042.604105-2-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 3/28/26 02:50, Pierrick Bouvier wrote:
> This new header defines a new type for target virtual address,
> independent from TCGv and is parameterized by a new define
> TCG_ADDRESS_BITS (name was suggested by Paolo instead of
> TARGET_ADDRESS_BITS).
> 
> By default, tcg-op.h include set this define to TARGET_LONG_BITS, but
> it's also possible to include only tcg-op-common.h and tcg-op-mem.h and
> set TCG_ADDRESS_BITS manually, which is what next commits will do.
> 
> We preserve existing MIT license when extracting this new header.
> 
> Implemented from:
> https://lore.kernel.org/qemu-devel/a68321f0-3d54-4909-864c-9793cda05b2a@linaro.org/
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/tcg/tcg-op-mem.h | 126 +++++++++++++++++++++++++++++++++++++++
>   include/tcg/tcg-op.h     | 100 +------------------------------
>   2 files changed, 129 insertions(+), 97 deletions(-)
>   create mode 100644 include/tcg/tcg-op-mem.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

