Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7240883wrx;
        Thu, 7 Mar 2019 07:02:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqwkzgG8lhYz5evxjjQMxZJimtyazo9IeTPwJYe4ajNzFGRvnaSueyLkCf9lmHFvqptmhhOi
X-Received: by 2002:a0d:eb94:: with SMTP id u142mr10298542ywe.356.1551970931289;
        Thu, 07 Mar 2019 07:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551970931; cv=none;
        d=google.com; s=arc-20160816;
        b=qQoIlTTICLorrydGj/up9UXWmoXD/SpNnNVsWBVU/6ya6NB2raIu2VX5/CGm+nzSrB
         DJGiwV4hAW62IXWWtIowYGU8uYpOav2bOtLGyf5MqBk3Es1nZrhp01175KTXiip/mTVJ
         57TBySEeAEWM1+zsLTX6GqchpeZ5fHaCJFQX77yZjZGHIM2U184lSmm4daJpdHOMyLMS
         rk/txZq1fToXZWeaMpPS7fSGuYN5B2VRh2QXfi1W7XgALTLn5kM0ypehYvf6TWUjFKpi
         V9OcQTQkwS8wzMSvkOkVvQ0gkug+ZNq6dCHmsb48k1XVpLJhuaE4f8ee85B/K299U4lJ
         8T4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=pYVYxt9SbAUZKsGEgiUmj22ae9l+P8yjkapVVpNUM0w=;
        b=PS+i4v8TmHCxws3zKS4r2kO+40aJGueF/60ZYdfWHRB0nT+QaFmjoPDXwkTUuSW4KP
         NFOX2HJUqVcQVZxQL0HqGbw1nu+kvsrxiRuiDwFWhW6saZjCvuSSnivkejE8b5ED1XjB
         msQkKEyIROJCcICIMKnf2k8WPHifwPlXk6izFcvpsdlrYuqXQZZ9P0p7GGJ9NtzTbCKg
         nKiuUg1Pf5UToF2o8v22JPtb5ipic7VX2Xjfysn23K3rzhrS0V/mvCUUrTmgcVQ20M0o
         weEdqFu4ewmgwrfrIG7uUo8J2t6SA5SA7CK7ip1uXJ73W5lClK2xSQkQeGvxkbIGa3E7
         FEEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oMcnlXNu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o81si2869343ywc.424.2019.03.07.07.02.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 07:02:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oMcnlXNu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1uXC-0007If-Kc
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 10:02:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h1uDQ-0006vl-R9
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:41:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h1uDL-0003Z7-8p
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:41:44 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37595)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h1uDL-0003YS-3M
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:41:39 -0500
Received: by mail-pg1-x543.google.com with SMTP id q206so11422091pgq.4
	for <qemu-devel@nongnu.org>; Thu, 07 Mar 2019 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pYVYxt9SbAUZKsGEgiUmj22ae9l+P8yjkapVVpNUM0w=;
	b=oMcnlXNuDXmWR9YUIo1/zp2rn8kN7H+V/yHHmzyE8jay8LAOXTea1UFydgdo/r+UJ7
	DjYNedV8Pn9XhVlH4I20rhIqgbC0VEu0SYDZyU6OYnSv+DLZgj+3jqxbxaaA56XiWArL
	mMDB+XszN5+Awnt1pgTSO7DrU6QAqCkar7Qnmo/VMpoXb+hEHz2FPrW/QZC0JUOSJVQL
	tBq6isW5CNsnB1XInsDPfMHbv20EXsvvrzgvreEk1dy8fA8r2pkQ5cWzgx57kgR63nXr
	lDbc7xiqlaqiRRcrkfWMTCyLqevo9OqhrxtEd7iI5at2GNAuq11QxlKWaLwVyjxOOSlj
	c3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pYVYxt9SbAUZKsGEgiUmj22ae9l+P8yjkapVVpNUM0w=;
	b=sqfm/dnXYgSiGA3IN0eIxURO0rBK21pfuHzZKb3OIinSEHdaBrAuIBTkC4lKgOJPuz
	uAnEa+nBX4aOgkM2qIMMyGCt7ZR46bIu1Me7B0jbLc8uJqg6/XsQ5AqswVUXbZyjkXxo
	6C/BDisJqvyYgJChRVtt1LikF5MhhM3AiO7S7Ul7VMU03bA7JWsTPz4sGa5UM4h3y+lR
	MhsiGZeapcMFuSJ7Gi/sb5KoYpYPZz4KewgIU5vckwvZtilcjhtfaP5ShrXZI7bHxtHD
	IdZe1+pc4msFaTitP9JWCpsW5xhv0KU9JnAM0wbMiGXPRqSrh4dnMzPW39FDTFmVGvRF
	Ivug==
X-Gm-Message-State: APjAAAUhdS2pIQe/ueGpQzZ8p+sA3oci4TajV9HeM2DzCeCh7bIdy+/T
	cBabFZGdOuC/M+gpCoslGCUPwyN3s88=
X-Received: by 2002:a17:902:361:: with SMTP id
	88mr13373589pld.78.1551969697822; 
	Thu, 07 Mar 2019 06:41:37 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id p2sm6222838pgs.7.2019.03.07.06.41.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Mar 2019 06:41:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 06:41:25 -0800
Message-Id: <20190307144126.31847-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190307144126.31847-1-richard.henderson@linaro.org>
References: <20190307144126.31847-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH 8/9] target/arm: Use extract2 for EXTR
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	david@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1WpY16gZ4IKy

This is, after all, how we implement extract2 in tcg/aarc64.

Cc: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1959046343..54fe94c436 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4114,25 +4114,27 @@ static void disas_extract(DisasContext *s, uint32_t insn)
             } else {
                 tcg_gen_ext32u_i64(tcg_rd, cpu_reg(s, rm));
             }
-        } else if (rm == rn) { /* ROR */
-            tcg_rm = cpu_reg(s, rm);
-            if (sf) {
-                tcg_gen_rotri_i64(tcg_rd, tcg_rm, imm);
-            } else {
-                TCGv_i32 tmp = tcg_temp_new_i32();
-                tcg_gen_extrl_i64_i32(tmp, tcg_rm);
-                tcg_gen_rotri_i32(tmp, tmp, imm);
-                tcg_gen_extu_i32_i64(tcg_rd, tmp);
-                tcg_temp_free_i32(tmp);
-            }
         } else {
-            tcg_rm = read_cpu_reg(s, rm, sf);
-            tcg_rn = read_cpu_reg(s, rn, sf);
-            tcg_gen_shri_i64(tcg_rm, tcg_rm, imm);
-            tcg_gen_shli_i64(tcg_rn, tcg_rn, bitsize - imm);
-            tcg_gen_or_i64(tcg_rd, tcg_rm, tcg_rn);
-            if (!sf) {
-                tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
+            tcg_rm = cpu_reg(s, rm);
+            tcg_rn = cpu_reg(s, rn);
+
+            if (sf) {
+                /* Specialization to ROR happens in EXTRACT2.  */
+                tcg_gen_extract2_i64(tcg_rd, tcg_rm, tcg_rn, imm);
+            } else {
+                TCGv_i32 t0 = tcg_temp_new_i32();
+
+                tcg_gen_extrl_i64_i32(t0, tcg_rm);
+                if (rm == rn) {
+                    tcg_gen_rotri_i32(t0, t0, imm);
+                } else {
+                    TCGv_i32 t1 = tcg_temp_new_i32();
+                    tcg_gen_extrl_i64_i32(t1, tcg_rn);
+                    tcg_gen_extract2_i32(t0, t0, t1, imm);
+                    tcg_temp_free_i32(t1);
+                }
+                tcg_gen_extu_i32_i64(tcg_rd, t0);
+                tcg_temp_free_i32(t0);
             }
         }
     }
-- 
2.17.2

