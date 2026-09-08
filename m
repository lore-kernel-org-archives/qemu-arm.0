Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A477AC79FA1
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 11:13:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3tlj-0003Qb-6i; Tue, 08 Sep 2026 07:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3tlh-0003Pf-W1
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 07:13:38 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3tlg-000439-H4
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 07:13:37 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8200b55dc47so48482347b3.3
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 04:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788866015; cv=none;
 d=google.com; s=arc-20260327;
 b=YCx0r/T3r+2qsMdNZ2thejt5bKGiT4d1DSHBW2QpB4/IPuptdRlY6BZufL8XCZEr1N
 UEj3WewUFZg58yjJhxQMJFTAWFMrV2Ig2x/8MT6hlggS+q6l3lrdyk0Ix6vmG2wbDwsF
 ow2AeTGsd7ujnT/aiY4xSiKqqqap+r9LUL4WwSxNxUPMstkk2JViLXToQTjt/NU1NsT7
 Ud2YiTHYM4HIYfsoHggVA4F8YBvG0lqCdGg0tT2g9Iy68O8wUCfJn8wkNkgN1lwMRTzu
 qdLVOrn4OEcbJqzggzjktZ+Rt9Djj5/mkTJadp/a2r8B+INrPzLxehcDFZZE4R6Z7OFz
 ggJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=HGH1zNO5nAWuMSzPWQs7YvpcnSGNu4Y9KffjpjeZ29M=;
 fh=ItNyg8PMXx+xTG9UvI4Bclo/nfzuvgZobYzQ7CdlHoA=;
 b=ZzhJogyZwlWcDaxGADK2s+Tn8j5THJyRIKml3wqnx4C+2gB1JfQ5Ow+315EKNj0KaP
 JHeBNvKufg0z9in3Ti3PpAmdXFsj6wfxJZYYycyfHgkLmojzBeRT27NoPZDwEe15B/fH
 u8s6JwAR2UC28GHKFMqdcg5hwInFZXgCujV8X4QPhHY/YQ1p7be2WjlN6oKTTqFK3/AU
 6O1jezcDjbNPbdHRC0qr79PdmreYRhMUl1tu+kc/uqaN7lwThY71CwIEHZ+tY3YPcase
 EGuKk5/sGnU0KhnV7uItJp17K4/ovfu7cn1zEFGdX8JUEiJs1HPFUUKbxhZ7qPsQMzCS
 YCTQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788866015; x=1789470815; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=HGH1zNO5nAWuMSzPWQs7YvpcnSGNu4Y9KffjpjeZ29M=;
 b=Wlku9ltKNOvf+7GLekUWkvmMysAdhSHLz8E67Kig4a7HoY2UqEvptQ5mmgntosLmg2
 yF1+5jQhOjTQbaHvItlvjtDUfTzPiRqBd3v8+MMUMey1rMyrDJzGZNqaUiiuoy5Jrlu4
 0zDCO3FKReYWZ/Bnz2RY1/HdlHRgWeanpwb7itD8+Lt7B1100JUQgbNL0glOwGEMQcgx
 PATw7zLDR/BYqHOtHEOhqizMkqPw9CdQ9LcTcB8XFuNtNGv95iFPCBRo1eHDUU3QU4am
 HpYjClnyevvastMF4LpfHs4m0zM7mEibobcZQyhnEGEDd3IBW8JDQ3QqtM4OWeIlJqIY
 citg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788866015; x=1789470815;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HGH1zNO5nAWuMSzPWQs7YvpcnSGNu4Y9KffjpjeZ29M=;
 b=pLvbCaANfjGEJ4sZk8v2aA4kPhZGr1muiV6OnCan5K6F7m7DQapGK6uovz7XP4PXjQ
 IAZh9tmuXlV4vCXRzDjpjOUMczMbuyXO1OUEcQGd/IqVjvXJMlYiXH0ROoe6hanHaw+0
 We8cgFb+Ke2g9ZPuZuzNvzwKfw6Lqnwh+adNetH6vaExz2wDRavyiv3VbVkcjem5K40h
 q/6L/YCBRGIqsq6ACRTevaCeZWKKEfy+T+Ivgr9Myru73m1sN4dkLJTExUScy6/KHJjt
 Y0lpsEGIH7N35mnp5InXS9DnDetojLOSHpAN4gj3WnYNPRKugBsCtp3Lt7D3p3UI+Efa
 UY8w==
X-Forwarded-Encrypted: i=1;
 AKwUvBxy1pVSpRP+evA5jq/tpnWZJ00vX2cbIgpJW7+W+WCnVgc04i/sOyLV9HtQ3deFe/oNedAAQWSCag==@nongnu.org
X-Gm-Message-State: AFuF++mp6jukfG22ZD4fPZP0wxy2c5n6/kR215xsbX/uIBbcUpIKYhBI
 Rua+GLqtkeShALO4NcPnoBYpf6xZQHp8w5DcsGVhkdPGA+8lDW3vRogUbhQWfso5GnRwA11jFKV
 BtNlWfdgs6PDY3Mu9vQYvtBZWwLenGcXPtSUiUDNKlA==
X-Gm-Gg: AYBFou1Uo+QsXrOpuzyrKQRi69DSKbX0wirUsSKNoFnPvJdYUyrOudc41Ti0A81sEGo
 WPSTBntNZAvLt3ym/uBuRpnwlxp8dtz+51olDOwq+wiW4scKhVhI+dcB0e//sl68pN8yFRPO3Tt
 QIPx5Z19IRiHXY1d2sfNYzT3bwVjZGoTdPU6lpkqW5T0z+03cws7/1xFLulsJdMlnbuVEqjlXd7
 udcrwxcDouqIFBkxMCtQSre6j7GFqwqjOh0IAhoejsByBXlwCB5Z2wmqtBns4VTQTPH5imJoGYE
 65i2L5CKH+7ukgekFMm+vns3kD3HwbD/jmm59TLkLkIFoVU+hNkhyJq0iDNXte9eYJU359DQaGK
 kMpb1xgzIKrj35A2fCTPchcqAJWPL
X-Received: by 2002:a05:690c:88:b0:873:5c6b:a2fb with SMTP id
 00721157ae682-8735c6ba60amr76671057b3.41.1788866014906; Tue, 08 Sep 2026
 04:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
 <20260828222639.1432046-13-richard.henderson@linaro.org>
In-Reply-To: <20260828222639.1432046-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 12:13:23 +0100
X-Gm-Features: AcwNN1XLN4l88312c053wkNL0jo2UuK5ifDEdyLLEDoBGJAm-ONUYXFEByxlJGs
Message-ID: <CAFEAcA8xRJXzYjNyK8S6GeQTLiaVALHOsZKvZPsCNTpcBEe7vQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] target/arm: Honor PSTATE.UINJ during translation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Fri, 28 Aug 2026 at 23:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c |  8 ++++++++
>  target/arm/tcg/translate.c     | 16 ++++++++++++++++
>  2 files changed, 24 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

