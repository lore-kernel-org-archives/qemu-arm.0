Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2084943lff;
        Mon, 14 Jun 2021 08:42:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhyOjY/O4eiaU4oxAcaxmaTDLY3PYJ5T9IYlOQKYS3DF6ybk+MQA1vA3cdIL7Sj0dW/xZr
X-Received: by 2002:a05:6102:11b:: with SMTP id z27mr3669940vsq.8.1623685355872;
        Mon, 14 Jun 2021 08:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623685355; cv=none;
        d=google.com; s=arc-20160816;
        b=vJadozIqvPobl25GFximBbAG6BeGsAhzJByd8SlG5Hpy4488vUh2k7DgZT5LfW1PIB
         c3bwYtbFMFjrtn944/IlVM9OpIiwA9gUb4AWWqRpLZ4crm2do2xSmWYR/7wJsjwWvl0F
         GI2T7P+rpTGMYoWewe5cBfs80mRxkdkqm1HpioZUxhZeqS7am3Ez6PzaqJwbRc2ssItb
         VF9PqTYfzRaTBOJo6wOeSiBqjyQ6EzuqIRMbc7nHHZ0MyrhT87fMD4GZceSbbEhnX0DN
         39H4F9Z62KYO4Fd2HrCGzfWf+yuGjo5oPtZb2Ah8yIfKa67UKtCm25nLgBr+6Qx8mDU0
         TuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7zqOydxbKO5ngS36l1pVCkgMCT82aVZ0gtfX2O2TgPM=;
        b=rgJRx10aoySmej5tp+dQU5QLEDOG/fzLx9oWrdfCL4W7NRoIh9UqE5k7a0TvgYGVEg
         HIwIMSHI5U0ogqyeQ/II+dk1JoDZ6o37Txq5RgaFqc8rgzFb9HqM/kJ7VXI/a9Y2mVvO
         6FCtwHgmJlFrtrefBcg6myGg3uiU7CXrYDKQb6aTY6VCy88pJJye10iEdW15zjMdO1xI
         Ps4OeBCHnYY9FeWLMYIe6IV5a3OnaPklIQm3nUCcnMekW/aR2d7Xb4kC+rqV9Tcuj95h
         11rWdCJEtbocDp8bQ7vu+/C6HxKXlas4Z94F+JxRO2qgz90sJ4kYd6gUZS6Ke4JnqeWs
         WOuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qlmCzZrM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si34744vsq.442.2021.06.14.08.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:42:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qlmCzZrM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsojT-0003Vi-3l
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoF3-0002Rw-Iu
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEk-0000ag-A6
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id o3so14939925wri.8
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7zqOydxbKO5ngS36l1pVCkgMCT82aVZ0gtfX2O2TgPM=;
 b=qlmCzZrMwsR4YOfDjAYP9n85ndzLIn6gFqMQqm9jLXePOallysYTAJ4Q6vONrCZGqn
 4rbIenNNqtBbHB2zYPglzQRq8aIs/GtVawAULEtg7Wm9Bz28l1D4EuRkn3kmM1aETEW5
 t1uktQyM90LB9aY+TXJNrG85bYpjIxjt2kx74gUbP8VVKpcz1MjD+8YeXOP3iCu9V9BP
 g3okcFSnCVROE4IPHNk8rxRgOud+RItuBIwwV27NuqOTds4nK4cZ20WLv6b3SEWfk71X
 bcV84M4QNEgnweNvjKZ+rJpGEbqMBbDr2itdO2md1Jx9tooVfCpzWDKzeKc43KYOc6vL
 Mn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7zqOydxbKO5ngS36l1pVCkgMCT82aVZ0gtfX2O2TgPM=;
 b=jyfiOKYEMAkidISWbuh2+pnLEAJSjPciPZ1PL9uym1rs2oTqMNtwxI5rW3v6fkNPrj
 odpH7VKQqszNVHa3YdL8fOQiZgKVixRJKGvsKcbHD5Co1xKGy5aJEY3azuSs9L7Sn10k
 dJO6UkNbstILrF46DUUiAg88Y8z7rr+3rNvOPh8PabYfVwEJZd7WbViG/hQxPlnOoobe
 QSBv9WP2dQJjmrdcdfZfzMf9/M6VRq46Q7IMy1es0JmjL69y7mWqOa+zHHFsT/1BNXFH
 t0FVFvPhaIE3EBATUSb0CQ1H7QoD8iRma+DunU+owLoM9b9F+swMIEXSdIezE76ro+I+
 9D7g==
X-Gm-Message-State: AOAM532ro2ADVTL9eFzGLzTVgLJzdylCQDJuxlWryd1cG/I6zbL6SR7w
 DwlzY1vJtAWUjl4eRCPfk6infA==
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr19893004wrw.310.1623683448258; 
 Mon, 14 Jun 2021 08:10:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 47/57] target/arm: Implement MVE VSHL insn
Date: Mon, 14 Jun 2021 16:09:57 +0100
Message-Id: <20210614151007.4545-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xOhCXafZ2BSp

Implement the MVE VSHL insn (vector form).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 42be99ad526..56b3e8591ad 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -169,6 +169,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vqshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index e78eab6d659..ebf156b46b5 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -130,6 +130,9 @@ VQADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
 VQSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 
+VSHL_S           111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
+VSHL_U           111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
+
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 3464dd311f1..be5a1168c6b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -536,6 +536,12 @@ DO_2OP_U(vhaddu, do_vhadd_u)
 DO_2OP_S(vhsubs, do_vhsub_s)
 DO_2OP_U(vhsubu, do_vhsub_u)
 
+#define DO_VSHLS(N, M) do_sqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, false, NULL)
+#define DO_VSHLU(N, M) do_uqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, false, NULL)
+
+DO_2OP_S(vshls, DO_VSHLS)
+DO_2OP_U(vshlu, DO_VSHLU)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index ac0114c8358..a0340c5e993 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -402,6 +402,8 @@ DO_2OP(VQADD_S, vqadds)
 DO_2OP(VQADD_U, vqaddu)
 DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
+DO_2OP(VSHL_S, vshls)
+DO_2OP(VSHL_U, vshlu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
 DO_2OP(VQRSHL_S, vqrshls)
-- 
2.20.1

