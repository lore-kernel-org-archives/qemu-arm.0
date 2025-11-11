Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E111CCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 11:51:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vImrQ-00073Z-Fc; Tue, 11 Nov 2025 06:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vImqh-00051N-Tr
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 06:47:48 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vImqg-0004QT-A5
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 06:47:47 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b72cbc24637so759814866b.0
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 03:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762861664; x=1763466464; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CBEBtmFXIYhtD9uj/O0m0IZEIQnCBydNbN9HhNAKK8=;
 b=yP27YQbuxK6Kq/UT9Cj/J5aXO33twcYka0tRYd4623hHR6uAa34buIoHa4UJx/pD34
 YTZVnEAsOobsGnjG3CnbuwuLpfjSh4m2CLa6ad8vv9UPaS+70kcPARF0uYMXqU6+fr6y
 7+iusrdT2ZY9Nz2hY23tz5TmELCS8x2Zm6h8uAU8I4lC0rWBVZO76LzV1aB0yt9efeQA
 UJ1cQNIKc2OM+sAgdY4OUPe2x9qTdpz0NZSXVneHFS9HQOPgoDUf+rBNO1piuAJzsWZs
 QSjOwK75T+herBP4gmPXYdHX3Oif+10C36mbL/WKDEU6w2uANYWZ4qULs91MaA/MqDib
 ihzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762861664; x=1763466464;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5CBEBtmFXIYhtD9uj/O0m0IZEIQnCBydNbN9HhNAKK8=;
 b=gZj5XM01RMxu0d1UUKZY6HdNOvs5ZW6spngwTieoQP1wiK7jyRa22sw5M2huMzRgLo
 4hXydIADJh76Ao7cgwiiK4VWdBuy2wVHhmKRaw9gqvI++v+NvoydxfOwY9JBFR1HI9JK
 1Q1rdA1PpxqpsUY1937i/kkKA2s0qGkItRMUuNI1yCAf5LjQ2xvdYv491rrbr7lZxbXX
 m+3HkIea3EdnSs2e9jt+Q/CuwcGz/jmits24BSyjs+D5GKl5uU/uPKMhfuiDtx/ZLS1q
 fVE5cOdwe2kZC4OB5nthjcb96P9UHLyMSUxtEg7nWLt0embJSOlaqNVl0VU0pEIXGfWC
 EmGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj+Fmg7gMUioSoWMjl9cOZWwfNbqwrydAmI37ww5jfGuoSjOUhIxCvCiz9zjDaabR5y3TopgJN6Q==@nongnu.org
X-Gm-Message-State: AOJu0YzMxWKuQB/eAPdOXlGBrYd2UTlPCQEzEb+1uvWqDL851M7LHCoO
 w8e+itMCkGbQPjT34+0hUl+SYnjHWnDuW2ov4QTx0kIpN6oS0RSx9gMRe+sh1xqo4T4=
X-Gm-Gg: ASbGncu04O3uCN0RFTjBlvFG0EPgIcZlD7iLV898r6th1Q1Png9Yj7aFs8XU3O+/opg
 XoKU/d5YY+gBPO0A/Q/WZdLlqihUu7xiQk2U9udTIFoQ2TpfWkXwyjs3ce1shDozWIG9R74yKEj
 7XI4GNDykgCrzSW90SAw98k9tEiAp2QWpkgKLwMJyGEq8x0JTpd8PYuLGWtgs8/s253NlodZhSm
 tdXODl+zUaoQ6bYhFIcSwd+wbeS7V9Wow1BBXtDGCa+MoKS9UDSz9GQExBa9THD3vIwloYseOmo
 /Dbgql58ZrCNzakFAGIXG8hqoL3eqi/vZAY9NRSc3nHLydFiPXiwo+EHiB8ZPwfxoNfZrxo3iMd
 Erl1PBzJEROVruvIcq94LypVGQK3JH2BtnvdzgPCnl9tuSfcjTeE5Ct0C1I5B5D+I3JXzZ21eCz
 6kSLI8/E4iTG4=
X-Google-Smtp-Source: AGHT+IEUIwW0WkQrXpevTrRi1x3YysgnDtxgHUTJxSeTZOPBephkYD4MkNTvEieUtkDOSRNNNumJUg==
X-Received: by 2002:a17:906:eec7:b0:b6d:5914:30c with SMTP id
 a640c23a62f3a-b72e04e3d76mr1391400666b.34.1762861664493; 
 Tue, 11 Nov 2025 03:47:44 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97d43bsm1383702766b.45.2025.11.11.03.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 03:47:43 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0F4555F871;
 Tue, 11 Nov 2025 11:47:43 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  peter.maydell@linaro.org
Subject: Re: [PATCH] target/arm/cpu64: remove duplicate include
In-Reply-To: <20251110161552.700333-1-osama.abdelkader@gmail.com> (Osama
 Abdelkader's message of "Mon, 10 Nov 2025 18:15:52 +0200")
References: <20251110161552.700333-1-osama.abdelkader@gmail.com>
User-Agent: mu4e 1.12.14-dev2; emacs 30.1
Date: Tue, 11 Nov 2025 11:47:42 +0000
Message-ID: <87zf8srdsx.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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

Osama Abdelkader <osama.abdelkader@gmail.com> writes:

> cpregs.h is included twice.
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu64.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index f81cfd0113..ae84d8e420 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -34,7 +34,6 @@
>  #include "hw/qdev-properties.h"
>  #include "internals.h"
>  #include "cpu-features.h"
> -#include "cpregs.h"
>=20=20
>  /* convert between <register>_IDX and SYS_<register> */
>  #define DEF(NAME, OP0, OP1, CRN, CRM, OP2)      \

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

