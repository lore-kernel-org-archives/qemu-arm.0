Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42371CD98E1
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:32:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZSy1-0003Ib-H7; Tue, 16 Jun 2026 08:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSxz-0003F1-Dv
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:32:32 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSxw-0006Pb-6t
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:32:30 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-6611689dc10so4573970d50.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781613147; cv=none;
 d=google.com; s=arc-20240605;
 b=lPx2boipM3MilIXxQ3azjmda6bUc7daLelyuOUULcXoTHYoZyDPQW+UGk2AIJ3GLfs
 zTHGJjQIFU+RoDbKsDklgablpPKZWI5fzfErvvIjn8oANRIf4Dibuq09Y1GNyRX+Xo+O
 2I5AmEjkP5lRDinXyT46YQDTgJFT1RPvkXFvdsiL/Kym5MrLe6K4TyWPDcvRgJNFWryn
 OK98Rfv7ax7G6Z58izRGWBvevJb3/PBrdeSd9Gzt0L6mpFO3uuV8D2MESrbBR28pmbRp
 WIC4Z7HT1A9W5h9n7fOyo+bQpHXwpK6uBd0KqDYLfIz1DAmY0GC0J58K++BKgBHzjpi9
 dXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=z0nWJfQs9yQ/gSJuxzKeyHB5MjQefLgvpKfz/keyWjU=;
 fh=yBOEwzjvMMhrgISB5fqrSd28JOJeZ89BhlYE7648UvQ=;
 b=gpKlXvZQmbUFxJfWSQXrWY46r3s08B1vzouLJsFap4kU4Ku9vchjut30bq2x5xKpyR
 O1NN1QAGBKZiqgmdIuc1bZgv/woyqjUUBpp/AL8N2N3TC+hI8ufoUfihFNcp5eJH6q4x
 SjShKUA76lhQIIqT7HEHLkreDVMz3kGRFTFBvdOK3dyaDoow5UDFTeVcGXGUehqlH6IL
 PAYI51LFtzNSUHy2BfQ58H2pBParcZ9qX5hMfIdy3mPEt1d6hRXT0srYwCVHDsFTkB1D
 fFJfv/WLeEz4Azd9YjDxw23Pa2bS3SXjELve4l4GjrCJSnhjd6UNuXXPtQNV+QCc6YBq
 H/CQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781613147; x=1782217947; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z0nWJfQs9yQ/gSJuxzKeyHB5MjQefLgvpKfz/keyWjU=;
 b=dB/wyhxKYJcOysZGHN98PgmkHoiIH4b5hpopab+nntb5Krcki8c8BLUX81y4KPGFp9
 gSim+H0DwTmjwlLa/RyMavGJMHWlvG4fPjGpztWXCpZqNRNngZ6nKeQC5xMBCWDT66/7
 BOuwKcYZbkNyhYnD7hNCinOZZbG/w6uaTJRfvBZt2BwWseHiEWh+rcFiA89xvXUJzWid
 J0Ucqt6gc2smUCM7C73ZIadjipwCecLM69Psxj5zFjd8YkV6UTYpFVjmD6WnyUzb1vNt
 fAyEfzSIWJ/pGV1ddLIImF8OK2FKS9ic78vNTZ3acndD4Yv0fLLAivufnfEmnLKy11AL
 7dSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781613147; x=1782217947;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z0nWJfQs9yQ/gSJuxzKeyHB5MjQefLgvpKfz/keyWjU=;
 b=TsYgZV0PWvLVQ0LoGuSCXDiZb+l0sv1FPnklGtI4mphwhj9+cM5leg7BdJuetV1Lua
 N9/P7uEWunZ8RdAIxFegr9gAPKEoOBBI0fxTS7p4x4RvPYojg0DjGGWAwqOIiIjj6yTq
 CbyA26XhUAbnY0V08HPXAZnem7Gef0gVwrNYXyqPKRecaqkiCVI7MDO1hHfnOLrCv0sj
 dyiTnnkDYeb96cWSka2ESDD5O5mUN0d/3HgrGttNVdpWPjkQ7dDehtipmlpV5nNvStOH
 NMcmWRUd7aRGBYrEP4QMTxaLncp2D9MRlG041QOdGCcLkcJBFjHQKyO808ygp7J+Nrro
 G1eQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/m3W90xafUc1X9Ole10BkBLZ3p08yxwFSOYmeUqxA/YYmoyaRKqaCyjcjROwpAIHv3kYynGwXB9Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx6xmGP0zmN9TTZNEEpjjc5YHadnciPtWu9ncUjktDF21kscHb9
 Pk6NILetlAdg/+Mg8frEDIrwZ7SMsu5gKfCubjlg2Ue829VLvHmrkCqYTqeyn2PRrr4NfR4pTY7
 uLKa+lj1sQYU6Sqr/rayY0LgixGk9ci0xOkVSblfdFA==
X-Gm-Gg: Acq92OFP3Rqi8fXgJHuisYxt6a3ELXoZnXIbQVLN4zEZBoX8X6s1Pb7y4ehH6t7ZBsl
 o01OqT42znPRf1f6pwtoyGRiX/jVGi958Jeihg0ROyNt7MAWGbMrrBpDHhbbc8OYMfWDRvo6RyE
 ySOn8FIKnTKIXuIRmTwo97t+51WwuLWn8Ae5dHON9sXmtGgx4mWuwmMoRwcJMGGguMjQtvRm0Ph
 YpVomfUIvMeLHLaMPAySR+hGtQsuDXLDhBr0LxRuM8jaSd5i1cf80kHP5eR4SRLsw43LD+YYGP1
 YwBrTfQyXRI6HxX9C8XlP7LDjiIP9iMuix7D3dfZ+oVt3u0J4TR3RHNrQcNA57PgI0k=
X-Received: by 2002:a05:690e:d46:b0:65e:4b1d:c67d with SMTP id
 956f58d0204a3-6627833b603mr13437732d50.53.1781613146291; Tue, 16 Jun 2026
 05:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-10-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:32:14 +0100
X-Gm-Features: AVVi8CfBofjB6GhJAnzgTG7VvKJ6Gwxem5HhblJvx1DQ56z3wD5wGxx_3RkiW5Y
Message-ID: <CAFEAcA_x78cRfujrHqhk5s1+Pa8efYoE5oHdfc9i5390bjW56w@mail.gmail.com>
Subject: Re: [PATCH 09/25] target/arm: Implement SVE2 integer unary operations
 (predicated, zeroing)
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 5 Jun 2026 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes URECPE, URSQRTE, SQABS, SQNEG.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

