Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1345232ejc;
        Fri, 3 Mar 2023 09:33:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/SdPxkVMVIgAOWB2r9B+o2BVmDW/OoASs1N2OX/HazBT1OgSIjSUgUNCZV+O7dlIT5OYXv
X-Received: by 2002:adf:fa46:0:b0:2c7:1c36:3c6e with SMTP id y6-20020adffa46000000b002c71c363c6emr1638653wrr.64.1677864806338;
        Fri, 03 Mar 2023 09:33:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677864806; cv=none;
        d=google.com; s=arc-20160816;
        b=06mIVOkXrKbh0kzkFjgMynUy9NzGzAPD0sy81evZNUriOKvPwoin4PomC6LTeiw/rn
         iss2wvlXKlCPfeK+FrZRP9sblfgU65CIp/Nrgz9G7g979BqVaAJ+AzBwTVIWURdBYTia
         p5jySKdIHMaoZ2xakw1Bfg60+/vkrDfOX8RFXNi7scYHoTSMk7zb2Vic7wd5wSIpqO+6
         zL5wL6xJ3h07s1mrSeUyKTZXyE9amlKPNO/ZCgbI2EiTRS8gELpakcDZpKcD7yG6UBQs
         3NJyXw32BQ5caIOQo1DNejS4HSl0KZNEdUVlyIz42g/wKvnl05ExVEZeoLiSmDOcbABh
         pvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aj8U0OhWmYk3psFTHxrKO9h0uci0aJEwA5Rppq7iSfs=;
        b=Z70RMzz19waIJ+yqUPC9q2XGAoS7XEtt618ew5Wf5MoB466IZ0ZjsgZIV3d932wOGe
         Jr3BKwqLioQFAtuCm9ooi9qd2sPobh+aEZo+cIjW9AC3KX3WXjeWcEEbse9i4OzluTCr
         j8Y1XhXqi70a+TrwgSU8F0pbYONJyNOD7R7DNlujBH9BeRSymyEmuEhjkfvV2WH+FFc8
         Y1lFnrvxJS2TpyLvoHZgMyuAE0z/75OLpojZGm8sNAdoBxX3Imm52tb5c9GN8a64+Yzl
         BXkvz36kYwQjNE8Sedy/eXdFONxKmdydxkzPzD20bstOWYcHz5VAB90BMU3jzTD7bb1I
         BAog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xRDa5Kwd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020adfcd0e000000b002c55847910asi1864240wrm.35.2023.03.03.09.33.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:33:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xRDa5Kwd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY9HJ-0004mJ-8P; Fri, 03 Mar 2023 12:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9H3-0004a1-DK
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:32:56 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9H0-0007y7-IN
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:32:52 -0500
Received: by mail-pl1-x636.google.com with SMTP id p20so3409941plw.13
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 09:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aj8U0OhWmYk3psFTHxrKO9h0uci0aJEwA5Rppq7iSfs=;
 b=xRDa5Kwdu0pjHPxV1AjNwRTEz2qhUhIl+rXeDahbXZA5F2sIXbTBsBqdJW7XnxzPqu
 JOF4jZ1BCI/Gfj3CPUY11oEhd6pi4vFXV+d4Az7rbgPYw8SVEGWghVnPyIf1n2Chj5IV
 2TuP+YRg/LTH0NWa8KtMrrRFeDsfeEmLtLMHX//BVUcGu4VyL2ItxpSD/eP/DhpLjQE2
 2qcHQJzV3Y2XACRcW0MDjETI9EofwCIbLPLxHFiEaQSP0Xfch46DFgDluSihfJq018i8
 W+a0R3Q4PGk2bBcu3NfxGkSoRmpE8qg3fgYWp0NZrt8cmMGiqyBunxwvH2W8CBNUMYPm
 jXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aj8U0OhWmYk3psFTHxrKO9h0uci0aJEwA5Rppq7iSfs=;
 b=QewwX1cIBgD1T/uoiU4rGc5ZJSVBesXjRx/cQUay7ZpQM7vCrHZXLqBXlXedwWtLGl
 db/kCj1nQpemz3KUe+AvWsk1iYvwLY2G0p7R1O12RZ1TfEqmyaZisIs83EjCMZFqTQ1o
 IBF2bBxdXpV9O+vsNBb+oTxHDPNLQbwznsdw8rBkT4jGSwbuNplGEGDAZmtKU7O8TG5z
 xmKDGNspIqZy3pzzEwXjMtWHTO69JgHc5csiO3oLuAi0nx8ae3A3qsCeGCJy00rgbs0Y
 T5qpTE7+H0xVuD+Ybhh9UX8u5HWW7mJhZXI2mWVjInRU2GRS3+rdBlD/PTc6/cZ99+vT
 vVgA==
X-Gm-Message-State: AO0yUKWonPGZaHFqgyzphGIRciORX3PeIB8hl14SXPOyNcWYiJaByRfa
 Sz3on4jXkyTdjwKbQdtKOi8+c6fEwHxBlCeElVfe+A==
X-Received: by 2002:a17:902:efce:b0:19b:5233:51d8 with SMTP id
 ja14-20020a170902efce00b0019b523351d8mr1034251plb.13.1677864757531; Fri, 03
 Mar 2023 09:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-9-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:32:26 +0000
Message-ID: <CAFEAcA-QBk6d22a-TdHQ3m22C0qMqJybob3kMMmp6Q+HPwp-xQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/76] target/arm: Drop new_tmp_a64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 76aQE+xIOP/2

On Mon, 27 Feb 2023 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is now a simple wrapper for tcg_temp_new_i64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.h |  1 -
>  target/arm/translate-a64.c | 45 +++++++++++++++++---------------------
>  target/arm/translate-sve.c | 20 ++++++++---------
>  3 files changed, 30 insertions(+), 36 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
