Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1950947wrq;
        Sun, 10 Feb 2019 17:23:43 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbVSSxXmDP3NdreLbu73npnJqwgy6WNG50ViisY8vN7XYC4DTv/t9HpjP5GoBBXkNSM/DKH
X-Received: by 2002:a1c:2003:: with SMTP id g3mr6998597wmg.32.1549848223162;
        Sun, 10 Feb 2019 17:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549848223; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGtUbX1fBsDXUXYHpjOPG2liiKtc3kQ8yUVQjLsFV1EmHqiiOpUcCfUDN3lJAgcAAL
         DMwaAV4odE3XsoIMPD1NqGnnp2a1KfRNDGUOqhZ/yYgNxdGA8ZorueATwg8Vps6AZcOL
         bC/3/0VU4P9U/Oups3lNJriO3HZl9FUmyr9OlThIG872PRYX7NFq+/NAYCL5q0bM+wnx
         0W403vfjHuNROiS3mQcUKYHTU54GSCtpb1ZnHUYQCpmNl4bf2oLetIUuMZAp7blPzYU5
         LLLbUzqOFOg1ycmZTs0Lj64XA9S1X1fCGg7Zx7banc24c8+fZA27wXmq/1J1BLozdTh+
         +Tww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=WSCoDwSU+P+38revDmJNxYHnEDDbY09xYDeZCaGFSLU=;
        b=MmErvkyou7pGrTPHOfzAz2H/97jALZLfPK24SGeZx8eOOc9y8fDHveSjsKrhB4bwEN
         zql+T6TYNq47urQveKK5Hi4sidgn0CHBmTQRpJFGtaDRXiIGnz4Ts/Fj5RSjHBGAdYsn
         HEGmsIsacpH9WwQ4j4jKxsW2BNy5nm06qNmPHjpZURdIQQEJIEUTpCNyEfBhvvJBC1Jv
         VVEcPSRqhIBkJjgFSr33lSpELi8ytOpb3LZGvqBqs9CyoKaorZz6UCofqxgAOSK0XVLY
         XKAR6wuXQfDzZW247UDkgMEgQSZ89cZklhYBl7/8BXlGsmklbDFDOW1aFzgqq1+7a32/
         DwWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mgEUH07+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si6364031wrw.346.2019.02.10.17.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:23:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mgEUH07+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0Jy-0000Ir-4L
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:23:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05w-0005xS-8i
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05s-00009S-R1
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:12 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46862)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05s-0008CD-7k
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:08 -0500
Received: by mail-pl1-x644.google.com with SMTP id o6so4487354pls.13
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WSCoDwSU+P+38revDmJNxYHnEDDbY09xYDeZCaGFSLU=;
	b=mgEUH07+T6/yfcpLmIiF6eKwKl0sBjjjIKOsAXfQiIkXUtD5F1vHrMSs9WCVe0wKFX
	M3CAfQNXb9F9Eji9STUyno1L2kEIQipPUjP06t3QOJX5h1RbXlZYo3JxDHYGk1VsWbbP
	BukK1z/5yJs10SSJj2ViDuDqIhXqMGqEStw02J2T8t9x8oECWU/Wgk3TA5Sws9GZmQwb
	J9Mrpb+X2ewO4pnkojPO12lymQp/4HSuitK0+tcrJ2RUvL35MyOTJwbGzx3+FAJZXjvb
	LZTbcEsE4uHF85txTVW1DWU3suJO8aPshvy0a8LYqJQ+0EuRCQ7ktqJ6DXqwYZqqswz5
	dccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WSCoDwSU+P+38revDmJNxYHnEDDbY09xYDeZCaGFSLU=;
	b=LTyE8jL8kLP7TGXl32ji9WEoiVXLLeMUHYdJ9A5THssrCqAoNekS6zYgZx9b/HClXn
	jLVu0HHqiLAvjjZdvlTuO4iIXKdW+hQ/wP+UehLamqAMKwY5wX9vmgcOpNoqWNIwcS72
	jF+zaYZdYoLiWHsgXtElIB4pNUdC+mitle52ky/qLd4ouOOPRvg6KzIg+gKDM2PpEvWS
	e6RINs2zd77BIMG7FTA5cmuBSm6zp3Bn0ol6Y4OiJHoH+BD7pENlXsONn1gycSHzPsaN
	Ta8CcKIu3Jt0afOw8YPBA9s/8pYHJ7CScwbRqtC0J1VA2S5s3bJj7p1mOOE7Qje2bJPJ
	cpBQ==
X-Gm-Message-State: AHQUAuZcyKVqDUpdbYSPx+kw+9RQ+aj6yJDDIRPy9M4yYdvCBQ0Nt0iw
	uDB3Xsst19HLi7I0og8NKJgh4u61Nek=
X-Received: by 2002:a17:902:e090:: with SMTP id
	cb16mr20567029plb.32.1549847327850; 
	Sun, 10 Feb 2019 17:08:47 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:15 -0800
Message-Id: <20190211010829.29869-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH v2 12/26] target/arm: Implement the GMI
 instruction
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yNJSbnUTTjrG

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    | 1 +
 target/arm/mte_helper.c    | 6 ++++++
 target/arm/translate-a64.c | 6 ++++++
 3 files changed, 13 insertions(+)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 47577207b2..ef340cb6f9 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -107,3 +107,4 @@ DEF_HELPER_FLAGS_2(mte_check, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
 DEF_HELPER_FLAGS_4(subg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
+DEF_HELPER_FLAGS_2(gmi, TCG_CALL_NO_RWG_SE, i64, i64, i64)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 3eb5d622fc..fc9e172c95 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -234,3 +234,9 @@ uint64_t HELPER(subg)(CPUARMState *env, uint64_t ptr,
 
     return address_with_allocation_tag(ptr - offset, rtag);
 }
+
+uint64_t HELPER(gmi)(uint64_t ptr, uint64_t mask)
+{
+    int tag = allocation_tag_from_addr(ptr);
+    return mask | (1ULL << tag);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3d71a9701f..2e0d797294 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5158,6 +5158,12 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
         gen_helper_irg(cpu_reg_sp(s, rd), cpu_env,
                        cpu_reg_sp(s, rn), cpu_reg(s, rm));
         break;
+    case 5: /* GMI */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        }
+        gen_helper_gmi(cpu_reg(s, rd), cpu_reg_sp(s, rn), cpu_reg(s, rm));
+        break;
     case 8: /* LSLV */
         handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
         break;
-- 
2.17.2

