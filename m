Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp379022lfu;
        Tue, 26 Apr 2022 10:06:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVkuIK9gIQbCjuCcQ8BpQZn7gYu/Lkm+nItl9coDz57egja3U97C/CJtd21FzR/iUbcVn1
X-Received: by 2002:a0d:f0c3:0:b0:2f4:d291:9dde with SMTP id z186-20020a0df0c3000000b002f4d2919ddemr23081987ywe.437.1650992798056;
        Tue, 26 Apr 2022 10:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650992798; cv=none;
        d=google.com; s=arc-20160816;
        b=FBpJIIebpKpSdSqgo5rjPm9u9kdYEc9nLcBwmHsUnDQGsiOarawaS516Yl1qWccvAN
         ijsdQyO6+G5ZE+HlSL5kczuK+gWXcX7Uk3sbNTF2u5zLvG+NAnHohJVHjAGExsgPKlEB
         wk1RD/LWWqqsSxdg0onGTQNR2czb3v69Fh+XV1oj/pm+dpzPe+u4QQP4uxxNxR5Q/n++
         uoG+DcxITGVUligQb5m6BuW4TU9Gnb/VLj6n4EeOPIrwKT/ILmzGaeUefSMf6sJeExEI
         bXUdaaDn9oQK2htqwU/RlDV59nkNreu6H9duN0EefPOmiP7J9juYBg9bPdYNEpCbmdEw
         u91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ah0wax+Io8Un9um16DZI/sPE/uUBnXT9rHc+UFy3E50=;
        b=GbBWYTGIn6CNjvf3iE6d5R0DQf5WlE0ecpUQ6+mqT0XZcjVa9Q7WZiekBhGqY4hHhd
         biR7iuFXYmxsDeO5K7jrTJWYUIiHv5PrFOlWUvvUrcI5jlRZ2bJZmUFD53Sf0hELrHQq
         e6h8jk4mXyIJTN3QXuMineuSu3S1MOqGwqk5E5EQpEBn3AujT23c+LbJnj/Arbh2Y9xG
         FPPlfWLg3JnYYbcsFbmLQj0dQYCyb/BpuGbr9NHcMekec7BiCQAYSU9dE7qJj6Ty6gTq
         UvQsEQPE3MaDPLK7wVrO7hos+EImoNWNYiJhLJFwD7Nh1hCzRQsDr6N7zsWJw7j8ZGMM
         /TLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gmVDydr0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r188-20020a2544c5000000b006416ada0e6bsi14006576yba.299.2022.04.26.10.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 10:06:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gmVDydr0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOe5-0001Qw-Ec
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 13:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8w-0002Dl-OR
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:26 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8u-0004Ld-LR
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:26 -0400
Received: by mail-pf1-x429.google.com with SMTP id b15so18454675pfm.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ah0wax+Io8Un9um16DZI/sPE/uUBnXT9rHc+UFy3E50=;
 b=gmVDydr0gY8djhkL/xO3d2QJIzDkUsepY3lTk9ngYbBYoqonbtEdSKLI6+js2fl2Gp
 EuUFPw20RoCweQV9/ZE11UWhgxTawGYhp7wapuwTlgSXqWlROVE5UARqG20SxoQ/CqKo
 +h/+uqnWjPr9T4rNMp9fwNZRG1tH0Kg+h6sMYlQRETtBFM+fG9O76jQPrEKk/GR1/I/1
 vOn4cg/mjJsL0825C1afUgS4IVdd6Ff4SQm0+jySZxWLPFqvNGF+xc1ZYM+DpMTeeUgx
 0yVoCX+xZIRejU7+jrCpf7Vq6+4Qe5Q9AYHgXCKGJLhgTI7SDuZlurHuVLyBy7aB/pdz
 BCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ah0wax+Io8Un9um16DZI/sPE/uUBnXT9rHc+UFy3E50=;
 b=jO4OvNOgnCxreKMkMHtXfQebBymFjDgMACRZ902u7ATNahjaHCsytYofTDmdM0yVkL
 VtTUcb5zCC08HZ5cIiNKdf3Y7q4dgNlwWT/HE0d28WoAbj6CcNQlLz3ZVmXlN4F0GRrA
 NpmgKnMXGzTreBH7PH1yE/hDTQtzqNMtgC1zoYAMvspdYkizrrY/7krG5Z+GobmVQ8Ff
 P8WS+i+x32/Jh+VSoe7HnbWwbA43X5K250eiKPIEIuh4/hK6XriydmtA9yQTn8PnZ6w5
 wepiH05dNE+i7isnmXgQ6wMY7tJZEOR/IZZg94n884/Du8HERvtKTJVTthPK6Vg23k6Y
 f40w==
X-Gm-Message-State: AOAM53221V8SQQDbJxOmORVOpB8BK+rLYIEinoMWlMKwB7mGhYfowUB0
 LmhSYPzuLDXN1WA00vABGSAeL7ye1/AQQQ==
X-Received: by 2002:a62:3848:0:b0:50d:376e:57ed with SMTP id
 f69-20020a623848000000b0050d376e57edmr13571138pfa.71.1650990863085; 
 Tue, 26 Apr 2022 09:34:23 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a17090acb8d00b001d953eb2412sm1132834pju.19.2022.04.26.09.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:34:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 40/47] target/arm: Use tcg_constant in do_clast_scalar
Date: Tue, 26 Apr 2022 09:30:36 -0700
Message-Id: <20220426163043.100432-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nsaMjoXsMU2q

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c3d3f301c9..7a39ed0c06 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2926,7 +2926,7 @@ static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
                             bool before, TCGv_i64 reg_val)
 {
     TCGv_i32 last = tcg_temp_new_i32();
-    TCGv_i64 ele, cmp, zero;
+    TCGv_i64 ele, cmp;
 
     find_last_active(s, last, esz, pg);
 
@@ -2946,10 +2946,9 @@ static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
     ele = load_last_active(s, last, rm, esz);
     tcg_temp_free_i32(last);
 
-    zero = tcg_const_i64(0);
-    tcg_gen_movcond_i64(TCG_COND_GE, reg_val, cmp, zero, ele, reg_val);
+    tcg_gen_movcond_i64(TCG_COND_GE, reg_val, cmp, tcg_constant_i64(0),
+                        ele, reg_val);
 
-    tcg_temp_free_i64(zero);
     tcg_temp_free_i64(cmp);
     tcg_temp_free_i64(ele);
 }
-- 
2.34.1

