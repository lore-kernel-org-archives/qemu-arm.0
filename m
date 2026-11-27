Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987F0606A31E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r70IKdaH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWyua-0004T3-DI; Fri, 27 Nov 2026 11:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWyuX-0004QR-Fj
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 11:34:57 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWyuV-0008MN-DN
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 11:34:57 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-67db6d4054eso8881092d50.1
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 08:34:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795797293; cv=none;
 d=google.com; s=arc-20260327;
 b=Tg+WhdVIByqWeDrlyJHhLQwyHP3JWdxeSbiUv4snUSSZ+O+PEyiHxQZnzZS8BwREI3
 V3ib3vXxlpYjc0WcqU0zi2ktmFVlKuZW0KmxItyAsxxJ8sczGCxY+GV4GxprxhNoxo55
 jjVhwCZ09Cr2pen3Uej5gqic8spvWRGo5a9BKT6NF6BKy7B9364kmrEh4wjI74EZnlHj
 lckboSZxAmr6snRnWb2J0xzPrdVayddmgwmkaWRgVDwCbG9YuKnTN8sonXnXkKL1OBc4
 M8wbSJnfn5b9aRaMqOJVlYHKvSYu0YrJGmwtbOBFSaUtAeie6f5PzAjIaido09jE/1Dr
 r2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gkNB1yn1vBvRfZOUu4YP2wMaupBynUSTFtR8pgn0SPM=;
 fh=zR9R2LSTo0JzRbfL4R6DMaXW3gDNvb2QVVvHw2fgS+c=;
 b=ZF0gNag7c1g54oqOINRlAGUvH1fz7iuEJJ7qznlLoX9c1Vl7tFN8VbVx1j2s+GeNhS
 2zxvNuNMeI8MlEUepSK7BVefAjX/q5LV8nAjHyaLGkjYDgBKoeTR2KkF5DcP8Q6m/lBy
 GcL9zci7ZuZ6k32ErJ3o1OgS3hKDBJgwfxPpMaGN4w9FpY5uODa/GIQh01MxeIhKP9ML
 UxZkAXWIO1gqlPeEYAztWD7x0YU5tcZQmd/4vpHAxrR2ONiyBnzFuza47Udou8ac17Qz
 JNCqJLLTlMgVt0UuNdIQc7V7nBUosOQY4LFeduyBosEXbzJrSSPqKkdLY1a+wW5QuO14
 ILdw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795797293; x=1796402093; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=gkNB1yn1vBvRfZOUu4YP2wMaupBynUSTFtR8pgn0SPM=;
 b=r70IKdaHxPYjbOlvSLeP0kdufLzCnRas7DUoTu1cgw59GDTeHv1N93eMWb8UfGjT1M
 k6Kboop8l0qC0WNVkAljONnolfhCMFdARlxt0xmTRRxKMlX7aqyC0Edu6iw6zkfKaKqZ
 3wGSoabdDxH3BK/4F9ACVX/rY42IjqdpbEzK7dLKmEomxdmO/rQgOJ+ZOZfla5QdvXWK
 3uwFUhHmJWVxl5/HXXzhY9yjCzXGe8fLI2qB9HxmbrpVqH74QKC7udIw0VIG5vnI1p06
 YHWwJCaCaxaZN/hsrZCF/DH7NeMprj743uau+7ZT2IE5yoIzOCKorh3o8HNOHRH3KWGz
 GSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795797293; x=1796402093;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=gkNB1yn1vBvRfZOUu4YP2wMaupBynUSTFtR8pgn0SPM=;
 b=C6Asj+X969yGnKR+KXH5g7apBDAI+A4GvUEkN15zVcL6746oQyCpKNNKpI93/ViMem
 vAZVOYv7SIngMAT7d0T4fCBjKgEchVEa4dJNY3zjH4JfkF/6oUWoRXJyPCG1VL11MBR1
 /y/DZ99BAKQ3ZnoPvSF9uS506F2NFaSBDdbSmw4yEk21IbrI7BkP7PgHIWIIXtt3TpK1
 CjIHKf2bg1lumxTJMoXgXVyneo4DeQ3BxEzGd7xj7GJ4IViNd5YjJ/Y/bc2VUqeMdR1s
 f+LlGcgQmRbJvbbMBi9m0jg30FV2/uQbeHD1ubRT2NAyIHM83lbSnLiFmaTJ3Ig+STic
 yMvw==
X-Forwarded-Encrypted: i=1;
 AL+hErHgU4J1VVKtX2gVo/P85c9a503ZovJmt1x+Ae65e7KFTSH3X8Mi2fVssTh5Q4ZOWI7HwqlsMF8Ccg==@nongnu.org
X-Gm-Message-State: APuU4Z91uBWK2RZbvhjAFddOzZqzSf0RYBIHryjyIeJCfB20pTbMoamn
 46G/vo/1g0iBgAEfTDO7IJykZx3DS+ssvN1QvwY1kmNqax1UHem4b1eRpB0XAO56x94dARwrIMY
 42FRCLnrBl/FY1YW4TqRTxNcehGjW24fPL0ghuwM0J+LGs33MC3nU
X-Gm-Gg: AZFdTZeYQd3X4PSmL0qkFtLo1QLrP0NvB6Inn7d/JuRjsLWcGuMn09GvNUa6X8Bkffl
 narmyyfnLGnwo5HjD9wbU37/XSmz9JDGcXia3MbH72TozTI29mHHxYdjCM2vUd0XPqOoW9fleIR
 TPn7hOTaob+nhL5YE9SuBWRQ9m4kxhmLUWbDfIWIIDCGxUY0/Lm5I5KA2Wh95+Di5n4cIF60QU4
 z8J8Z1G30TzNg4YCnbZLnb+yhocwcCrNuoiJ6Kfzxkt/p5y/Z0xBXpe8icjewbinig/o8sJbnpW
 N6QojzfSWJX16jpASvdhSrHl24KaflN6uHAHtn/VrepaGLQvFsBd0nMbSntURxKBasp/thZDpNf
 I5/QbDGjwYt/E6NymhOnOxh2HVNdMGz1ZmdfKbZ7it3R7RTJc2RpbfSgEZ02675lPFM4btqA2Bi
 +GsxI805QhvfwdAgPvTlQZ
X-Received: by 2002:a05:690e:138e:b0:67d:c122:e5ce with SMTP id
 956f58d0204a3-67df43ce276mr11155126d50.36.1795797292937; Fri, 27 Nov 2026
 08:34:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030194318.319310-1-richard.henderson@linaro.org>
 <20261030194318.319310-6-richard.henderson@linaro.org>
In-Reply-To: <20261030194318.319310-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2026 16:34:40 +0000
X-Gm-Features: Aa3M54oSrEZUYgrrknaN5VsAijYOfU3DiqRU5-Dl4snvgEj38BfRQHJO52tiZSw
Message-ID: <CAFEAcA_t+5pTvv=UP62y5jWd5ENcUDSSgEemiT-HSC5T6YbLBg@mail.gmail.com>
Subject: Re: [PATCH 5/9] target/arm: Split out gen_indirect_branch
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 19:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use this instead of DISAS_JUMP.  Existing indirect branches
> now end the TB with DISAS_NORETURN.  Share the code with
> gen_goto_tb when use_goto_tb is false.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 51 +++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 25 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

