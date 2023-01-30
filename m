Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1149446ejb;
        Mon, 30 Jan 2023 10:25:56 -0800 (PST)
X-Google-Smtp-Source: AK7set82kKa8OCBwoa1HO6KdwrdON4v11TP0RcxDvTZGzqobqSVcPgR2k0qa78z9h2y4o8mddD6r
X-Received: by 2002:ad4:5311:0:b0:53a:a39f:b24e with SMTP id y17-20020ad45311000000b0053aa39fb24emr11014207qvr.11.1675103155988;
        Mon, 30 Jan 2023 10:25:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675103155; cv=none;
        d=google.com; s=arc-20160816;
        b=cG8uf1LUh/KT5DGoVuj0DIHnivv3aQSXUUcoHuSkjxbOjd8s8TyE581Pusju9TqhaJ
         wwrz0gVUO7XcjWnqFDv3ZO90JELerW+5Fbz4wpyg0lLNzAkB82CVVZ8M+EkzVrA4/Jk7
         k3FMjjoEoXRj2YtvU0JyAc2bsNuDlgS1h07mskVrwZtgkBnFLTztsmhChVwGbBNv1uN/
         ia5Y6H+YrfUsEJyIVfEhQu1ITbPKO434suSF3xLYbl9BMe+mPqjHuxho1fEnNSpstU1O
         FAJzq3yxd+eRQy5mkuQpDH4jZ1D8vDTYX6KHHIBNSU+WSYCYEhM9rfc5R3K2mnhR07fP
         UfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=go2SaPky1rTKNTTKbI6nYsdnpD4UmWB7Rewm+CymwZw=;
        b=GCND94f1+iX3EEXO5XuCMA15yKvD28UOZfzMzPMqs1XDIMi7/EDotTu+O1XgQvruOy
         +5axwWEDFHSwRVU3z3HuWTX4kRsyLm5IkjjU3Qj3nILX2l/sDw3eptMKmPRIET4dG992
         Lk5ZmkemLgEoKDE1caQeuSwMtF/ErCw0Z0/HqrTlpaLQ6BZqhZmUzdA163uk3KXE9esj
         oUvPu24UEPhJQRO8+DAaAqsjHP29SZ836n7ezj7KKgau2QsYFvp1L+l0y9fyzdSP/5j/
         E6hT24fWYHTyDJf2TaEhw6VIFBaezXns1tcLcwfrHEzqmsOdb0210Pu+QY0699SVew0H
         lofw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HUeOK2D8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id on13-20020a056214448d00b0053793a78ae8si6703472qvb.261.2023.01.30.10.25.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 10:25:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HUeOK2D8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMYqB-000104-9I; Mon, 30 Jan 2023 13:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq7-0000yf-9y
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:11 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq3-0008CG-53
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:10 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o18so2514222wrj.3
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 10:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=go2SaPky1rTKNTTKbI6nYsdnpD4UmWB7Rewm+CymwZw=;
 b=HUeOK2D8a+YDbPcs7aL9SrhKNW6aBBLCjAfi5vJ95AxrVm8jto0l5UObpAnxyyO09c
 4YxLKnlh/TT6/lcsfI0malZw3y2rMEEyO9DGjkyoyYFmnwEK3/GWj1bNgS0FHzAVzDSh
 AeSPxhAtQ5LE/xyB7iqO529sSfAzkYO30RveWlwD298ImITUvfUQJ25EXkdZRWNMUlha
 DsRdNscrhGzeODuZXfl51toBd6E18M0OhGKMrqMWbk/jbtrHFPOCB+1HIvaZDAYGVlfq
 LbW2SHii/tIYVdxdPlfLK4o52q5z8u5YANj9qkscGKHzT2lo2Y4Tg+iw/9g+Ml8LRXfW
 XMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=go2SaPky1rTKNTTKbI6nYsdnpD4UmWB7Rewm+CymwZw=;
 b=3eUJHe/bR2JwDgJRxaHbak7i5WUZwLfRUbJgIl8mZ4k8ohjk45O0hLmNMtYXDaxExr
 Z5H5nYYpcdmjjVwGNHIfw393Ak7FH1zBdXheoXBCUaMX4kwhORR0ZGFoJpXbJn9jRO2R
 bO8G50qlck5ErKo0KWWXk//ZCjDShjhS0mkzvr+TE6BOw8EpszB1mAMQYWmh8UNmEK7G
 l3HSa2keWhVE0tq/g7OsfsF+aYyuxmRgWGUyFJeL/Q1O+i3DjfI50rC3VxQu3fIrSpuS
 nw+varuvooRVJJHMnOiASqOMVIJKvJClSp+ctN5EvqR0yQbQtyKw8i2jxjR4b0c6edFZ
 3/cA==
X-Gm-Message-State: AO0yUKWHmXFeK+sfel/Tv30R2FRluIZysQTZFbaa1jpxuaaq2N/mzyvd
 F9v+Rn2Qo14MqpQFadcZNkzj4M5NQ66rdTML
X-Received: by 2002:a5d:4578:0:b0:2bf:c725:85 with SMTP id
 a24-20020a5d4578000000b002bfc7250085mr14591485wrc.12.1675103102487; 
 Mon, 30 Jan 2023 10:25:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/23] target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs
 correctly
Date: Mon, 30 Jan 2023 18:24:37 +0000
Message-Id: <20230130182459.3309057-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: 8CBcZEEMPUFc

The encodings 0,0,C7,C9,0 and 0,0,C7,C9,1 are AT SP1E1RP and AT
S1E1WP, but our ARMCPRegInfo definitions for them incorrectly name
them AT S1E1R and AT S1E1W (which are entirely different
instructions).  Fix the names.

(This has no guest-visible effect as the names are for debug purposes
only.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-2-peter.maydell@linaro.org
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72b37b7cf17..ccb7d1e1712 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7734,11 +7734,11 @@ static const ARMCPRegInfo vhe_reginfo[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const ARMCPRegInfo ats1e1_reginfo[] = {
-    { .name = "AT_S1E1R", .state = ARM_CP_STATE_AA64,
+    { .name = "AT_S1E1RP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write64 },
-    { .name = "AT_S1E1W", .state = ARM_CP_STATE_AA64,
+    { .name = "AT_S1E1WP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write64 },
-- 
2.34.1

