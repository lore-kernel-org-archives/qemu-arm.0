Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4299418ejc;
        Sun, 26 Feb 2023 21:47:24 -0800 (PST)
X-Google-Smtp-Source: AK7set8+v453fm5aGOwnOR/NYl5AAF3VpH0EvcC93kVQSi/rrPqQTbcgsQkR6n6p2U1BUfSrL/14
X-Received: by 2002:a05:622a:1751:b0:3bf:d51e:18d with SMTP id l17-20020a05622a175100b003bfd51e018dmr5406667qtk.61.1677476844672;
        Sun, 26 Feb 2023 21:47:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476844; cv=none;
        d=google.com; s=arc-20160816;
        b=k74P+dXldihND++FxQErOdODh1FtcrhGY1UnM9sgIDbWezPU/Mib8CLlN+/flcU2An
         RZy0/HL1tA7nz8ICdw1iF+SQIKlga/WKEEoJR34qzdXqcR09Vgm6EXSAhXpAWm9YSL4Z
         H/ZhtbcZZ6O4Ci18u1V8ayOlnBHWjwWbBViAp75L0XEQ08moe3m3E4s5prHp2E+AQiH1
         bPnAK8NIF8Esx+ABe30/givWnX+k6H0V4bByPQE/uQcx5iR8d2CK1Uzak9ipKL8PISK5
         VN2t4HvjjkZimntaWmuPsKYVBC/0fUMNdRQuVRe7Hur8DJizU5uGv+TH0jvDvPrUCnCJ
         iQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dD1wamCoNKZFIfQmB4g+Cu58J9uOq8aDnkIyPrSbVuM=;
        b=VIv2JVunyhO7644a5MD2fCsjD0kvjaqaQsbwN/VWdcSIlUe+Tqwe2KgUvi5W/QRx4Z
         odXnHIE/JtMrMzM3rXKLT1YMwubesqrY4P8yneT6EQGiXcyfViRxvOT+gdR/f3VBkU12
         mKWZzuXsZT0d6I4EB+3z4qv+TAMCxh0hA2FATvH922XsM4THBl4jiOmIxRE0QzbOF1ht
         Y12Zn/Y/NIj3gsTGIaV4uHrSSWywcgeFlDVLjVoKshuc1YL4/nvhDYFblJdhc3Of1vLy
         eissiZ4T4HxrSAopd0LwEtcpN/IIbB9Tto8zKENuHB7A280vqV4LUfynWC5DsNyI7mDO
         4pEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eVymLw/j";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020a05620a409600b00705b1d4165fsi5546681qko.676.2023.02.26.21.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:47:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eVymLw/j";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWI2-0002rP-IK; Mon, 27 Feb 2023 00:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI0-0002mH-2W
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:08 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHx-0004sG-1D
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:07 -0500
Received: by mail-pf1-x431.google.com with SMTP id a7so2783355pfx.10
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dD1wamCoNKZFIfQmB4g+Cu58J9uOq8aDnkIyPrSbVuM=;
 b=eVymLw/jK+sSGk4aIbnExUx9TvZm0bM3vrf64rar+J3dm/GQxf77RGiOJ+CTdg5ovh
 7zwh/AJcYtfuQNcUzTCCrpj+0ucjBC+N7dMoZkGnBCdlJyxe0KmO+zQ59Mw565yfd1DM
 DCxuRkcDPXdPczjlN2RBDyLFBuWeF5FOq+xJkdzMs/OwcPMCm+/0xJWbuGbwf2a5k1BM
 +4pSR1isgEnR57qrWxCzv13KQwcxD7stjRM8jgxgBzonkgRdNCyIFMQ1cD7qh3LokyOZ
 LInpfJspBe9qZncTchZ/Zq3ura8l3eTS4b/b0QfXZJVV62G7SWdlMkvg+KXrmKY8+kIT
 b1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dD1wamCoNKZFIfQmB4g+Cu58J9uOq8aDnkIyPrSbVuM=;
 b=yAUgEHaudFjL4dmWu06Kft+S4pHfpQcnf6TyCJfJS3i1NzQ3qQ5G+xeL0ZBw2UlzD2
 4+UvYMeHqBCkt6jNVbcMR7S5djJDAe2gBvfZYgGhci95dAroWvRqwDQj7FNkP/Npjzgi
 ty3RudnnwJsTmzmv3YgBmp/7jzTs1ZFriPHqVOmh7JD7N4Xs7WdlX7Dsmx8KqcPuIsWW
 8Hv4c9A7H1JpCkZ2a/RIU/Jbx/lTO9GhQUndYOMW2MXMA1ZiOskQ4fPRTBs2s9pGUw94
 hDdygwsXKVazeht7/vZfhxmLlGJfHpB01WEk4B/k3TymcwGi7592sGCyFDBUKmDgEqb3
 6QWQ==
X-Gm-Message-State: AO0yUKVW6t1+UfVIC8wKu3DKsV6mIfDJBoE54nO5rYjUsypL4PbH2Dco
 YRRkTT/pVNTwmgpcA/3AGIWIHDPHybAo21uYdcY=
X-Received: by 2002:aa7:9604:0:b0:5e0:1073:1f25 with SMTP id
 q4-20020aa79604000000b005e010731f25mr10677648pfg.7.1677476582559; 
 Sun, 26 Feb 2023 21:43:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 07/70] target/arm: Avoid tcg_const_ptr in gen_sve_{ldr,str}
Date: Sun, 26 Feb 2023 19:41:30 -1000
Message-Id: <20230227054233.390271-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zGaz5//Ocstk

This hides the implicit initialization of a variable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3ca60fb36b..92ab290106 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4206,8 +4206,9 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         }
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_ptr(0);
+        TCGv_ptr tp, i = tcg_temp_new_ptr();
 
+        tcg_gen_movi_ptr(i, 0);
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4284,8 +4285,9 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         }
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_ptr(0);
+        TCGv_ptr tp, i = tcg_temp_new_ptr();
 
+        tcg_gen_movi_ptr(i, 0);
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
-- 
2.34.1

