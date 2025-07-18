Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EF5C83F34
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 22:28:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uctYk-0001Dx-Li; Fri, 18 Jul 2025 18:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucssL-0004hL-2Q
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:44:21 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucssJ-0006xu-Dd
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:44:16 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7490acf57b9so1998631b3a.2
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 14:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752875054; x=1753479854; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7d5mfb1vZoSWOVoszpZk3FSkl4iasZVRfEKys6zyL10=;
 b=UN5jmiCrWz79O1luzAGK1oS1SjUr4NYuETVcQ/l8aPWlLelvGpH2Bh9KJphBWL0Ira
 8r+c01PT4pEc0CNSDABacxDhaJw7b+KfytEvRz+HHnH98G+g4+47vfgjKkVQuFa0ipGo
 67kz1ryLhua/JRJLDauGuRrj/kq6qYfjz1nRURX8qgX/cVUAYfPAPCuhsdifiY1ue2qe
 CQyPS7I5bH0JT7cRgA4kLhpdPCXrn36dm/WpJ8iHurKI0xqe1Mp3N19+MaYXxwy2aqgL
 3w4bmXQPaOeuvZWca9PEodPmWV7BCtrzc+XaRXK/j8YtFhppactTs93iIk8+C5gG7fHf
 moHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752875054; x=1753479854;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7d5mfb1vZoSWOVoszpZk3FSkl4iasZVRfEKys6zyL10=;
 b=qBcmY5rg9hm3vr1f/NF+pO4KbZb3W5AklNggLLr0AcDqZsePsHoWRyhO4zDqlRoAdR
 qh1KTXBpZ2EH1ynP+3DgCUkb3q7CoyBiyr/mSCEWXORKRDXkCiMX1hsTZphubiD+0gUE
 j3wpy4nAHUb9jUSj0rR/CD/ry0JFdpxKV/5JqAvPXXqpMsNiHBMLpkKUMShoGiUdzy9X
 uu2xuXjaA+3f2Bk/ysh/fW+ED/WLLQ9a7oozr+MSgqgmlPdKWww5SSlfkcB6TS+zgNhe
 +t82t5xqqYMC/AJyDx+dDYIiKhx2qWxOFcCW8D1awN95accZVX5veyW4aYZiLFoseSgT
 U8Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK2Q3B3jtJerk8oupoxr+8yEBu5iZEM8dsroKANKNhgrTZKGheiQIaAwFXgwgA9n6GqHKGRZtg+w==@nongnu.org
X-Gm-Message-State: AOJu0YzLoY+qR8gaRgg+K1J2qH5scjkr8D7ZuPDw4jdCZOKB9mtyShjh
 w/V2HZAuUxMne5jtzJ7cILCa/q4I+Q9GbPp/zMjSWRtnKjeZWxTVA+HC+iCakLhEBFw=
X-Gm-Gg: ASbGncuRor3yRKtHZHJqlrJUk9HQaeza93ddb9u+AdvikX0vPlPPPD37aL21PY71S4y
 84NqCnWU2XIQZUUyD5+r5h9P4hq/axIwVF5+ntLk9RCpeRbngRbTtbQGkTai0gdzgDFBJYt/jRD
 8UGOOfBO2JZZNDrpAE091RJdP+6JprZkTxwYNIWrGf1oipCRBG/q0RLy1a+hJW7Vf+nKmb7TuFW
 nXbvaibqS+SFaAl8+7zrIy8VlcQPpb1gYQ3QDb7sUMXeNgK8I44M5QjSenhXd8sO+ZFAddWrQTC
 RxwCKt1/SD5fDsrGDlaTdJqUHy1x7MgQ7hnZAE4c/xzq0SMgNZCILk1QfP/K3G8bl5WYMlZLmC3
 7Aoh0mDsiZM1TlR8b9R1edq08AIrVxH9W0mgPRB+7Aw==
X-Google-Smtp-Source: AGHT+IGogHsfp/akgyKg2MNZhmW+/LTuH7wnw5htWyVx1tklQuOd7+Tym7kLZkuiCbaGnKuO3gZzfg==
X-Received: by 2002:a05:6a21:a616:b0:238:351a:643e with SMTP id
 adf61e73a8af0-238351aa167mr12958978637.46.1752875053768; 
 Fri, 18 Jul 2025 14:44:13 -0700 (PDT)
Received: from [192.168.101.134] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2ff87da9sm1636401a12.50.2025.07.18.14.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 14:44:13 -0700 (PDT)
Message-ID: <39d4bf8d-d5d5-4500-b819-628e70ff3470@linaro.org>
Date: Fri, 18 Jul 2025 14:44:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 08/10] target/arm: Don't nest H() macro calls in
 SVE DO_REDUCE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
 <20250718173032.2498900-9-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250718173032.2498900-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 7/18/25 10:30, Peter Maydell wrote:
> In the part of the SVE DO_REDUCE macro used by the SVE2p1 FMAXQV,
> FMINQV, etc insns, we incorrectly applied the H() macro twice when
> calculating an offset to add to the vn pointer.  This has no effect
> on little-endian hosts but on big-endian hosts the two invocations
> will cancel each other out and we will access the wrong part of the
> array.
> 
> The "s * 16" part of the expression is already aligned, so we only
> need to use the H macro on the "e". Correct the macro usage.
> 
> Fixes: 1de7ecfc12d05 ("target/arm: Implement FADDQV, F{MIN, MAX}{NM}QV for SVE2p1")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/sve_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
> index 105cc5dd122..bf894f0bf13 100644
> --- a/target/arm/tcg/sve_helper.c
> +++ b/target/arm/tcg/sve_helper.c
> @@ -4509,7 +4509,7 @@ void helper_sve2p1_##NAME##qv_##SUF(void *vd, void *vn, void *vg,     \
>           TYPE data[ARM_MAX_VQ];                                        \
>           for (unsigned s = 0; s < segments; s++) {                     \
>               uint16_t pg = *(uint16_t *)(vg + H1_2(s * 2));            \
> -            TYPE nn = *(TYPE *)(vn + H(s * 16 + H(e)));               \
> +            TYPE nn = *(TYPE *)(vn + (s * 16 + H(e)));                \
>               data[s] = (pg >> e) & 1 ? nn : IDENT;                     \
>           }                                                             \
>           *(TYPE *)(vd + H(e)) = FUNC##_reduce(data, status, segments); \

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

