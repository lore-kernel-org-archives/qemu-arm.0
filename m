Received: by 10.223.188.70 with SMTP id a6csp1443871wrh;
        Fri, 25 Aug 2017 15:48:46 -0700 (PDT)
X-Received: by 10.55.78.6 with SMTP id c6mr28879qkb.286.1503701326424;
        Fri, 25 Aug 2017 15:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503701326; cv=none;
        d=google.com; s=arc-20160816;
        b=h2hEL1nXwMJAEWxgL4gdmDnwbyCqXl8BgX3qjPe3HSIPuclbTGPbqB1y+Cw+/H+LGJ
         GgGvURnHkKn6y3KAu8kh2MJZKUtLXhEPC/2SyUfxs77ZO9BGrJ3pCrLHIf+UIEvXvss7
         XWm81WS0b44MUk9lrLdCoe4EFREkXwjt0L0fQ/ZtDVvbJ+K6l1KB/8j+L2KSf2r8z4PO
         VNz0ty7qH0ExMFd3Z/Rg7Bobx7zLseQmBKpKHsDnI4CYZ3yU90bN061HKZ6Rsb28wpu9
         aLmjRpxmfxE/hV9XuywydCqk7PkY/9XT0/lHQHX/T84qGIt7DtV4X2IMliC4WPEZjrkX
         3fAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=oq+6LYUxUqGMzh3Jz8wl6Y896EmqkJ+9dBQMgVzDKFY=;
        b=Y9UtcvJsZsKYtUCqQmfZqefgqg+0A940/QutYrOJhfTB8m9nDPeCfyawEnj4keG+yt
         eruyqLohwKcw8N2kamDL7CqQZZiw/xvBDNUsHvf9wXiJOow2lPffrwOspQ8DzuaTftOy
         tN2HNvS6q9BLg9uUa4JceMZHsrcSi7s/AWrmTrFUv1EVcLRm0WkgRdA2md2fuSzkQdTB
         BSO2+PY1mhXjCeVkKC31nRNCL6Vu9sYs55LKf/95yDqn9UBRA69Rl1VwJ0bSzwPOjARd
         QbAvq+TZqCVX8pQMh75P1gvibMDTzKEWW4VrOh3X6eWta6gI3YAemxpAY3qxyXB8VWyZ
         g5Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I/boU41n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x14si7152597qkb.243.2017.08.25.15.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Aug 2017 15:48:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I/boU41n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dlNPA-0004X2-22
	for alex.bennee@linaro.org; Fri, 25 Aug 2017 18:48:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dlNP6-0004Wa-GJ
	for qemu-arm@nongnu.org; Fri, 25 Aug 2017 18:48:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dlNP5-0001wS-Bc
	for qemu-arm@nongnu.org; Fri, 25 Aug 2017 18:48:40 -0400
Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d]:35507)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dlNP5-0001sX-4h
	for qemu-arm@nongnu.org; Fri, 25 Aug 2017 18:48:39 -0400
Received: by mail-pg0-x22d.google.com with SMTP id 63so5941856pgc.2
	for <qemu-arm@nongnu.org>; Fri, 25 Aug 2017 15:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=oq+6LYUxUqGMzh3Jz8wl6Y896EmqkJ+9dBQMgVzDKFY=;
	b=I/boU41neE99mV7vrUQHBoAn6jqo61/zOH7bfuYpy9toaK/LA5BYnZpV8V1S1XPZjK
	H5ksYjyC0a3oWa80Rdd6pDbGglll09lgO2+qkYkPRNRveT1v6H1NZrMJdYZeAWqnTvI5
	ULvIcv5I4aZPXZtJ4weJx/JAdUajsQkL2/NrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oq+6LYUxUqGMzh3Jz8wl6Y896EmqkJ+9dBQMgVzDKFY=;
	b=R3gX9+4RhYK/URoyFiifV6zDakqkWdoSMvA7iay8Ze9y//OLhljVfGPthZx4oW/zSc
	oIPgiRn5qWYexrkcZeyPDTLQjjkbWDk0gtfKTdENu3LY/JS7imkYA2T+ZBeZiTnfdCep
	pFucDGKnx1f/mLBiyy6sj5sXonk/ajYzRxCUTTvHnBYgi3XrI+VwVCanMwhYlN8NeqaM
	HR9eQqVTdMaCBeAhbRFt+pXr2mmCI/z/NHkdb3mmD6RJHVVhAvakgARtRrPA/p1S7wLN
	R/OR/xYCGRNAJId+14FjFX5sPbqJO+ZDTqa3N3OU5lDxqr6I/JDLXRV2TkuXzyGVnD5n
	LuIg==
X-Gm-Message-State: AHYfb5jUjb44imo8gB5qDwGheBopPdmAz9slG6opXY+OPBeJjC8Mkxlj
	ItVzITZXp5O5LMJPn4Tr4Q==
X-Received: by 10.84.212.137 with SMTP id e9mr28122pli.284.1503701316404;
	Fri, 25 Aug 2017 15:48:36 -0700 (PDT)
Received: from bigtime.twiddle.net.net ([2603:3004:4:2500::22fc])
	by smtp.gmail.com with ESMTPSA id
	o10sm14346641pgc.81.2017.08.25.15.48.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Aug 2017 15:48:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 25 Aug 2017 15:48:33 -0700
Message-Id: <20170825224833.4463-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22d
Subject: [Qemu-arm] [PATCH] target/arm: Fix aa64 ldp register writeback
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
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oSl8bexBXymY

For "ldp x0, x1, [x0]", if the second load is on a second page and
the second page is unmapped, the exception would be raised with x0
already modified.  This means the instruction couldn't be restarted.

Cc: qemu-arm@nongnu.org
Cc: qemu-stable@nongnu.org
Reported-by: Andrew <andrew@fubar.geek.nz>
Fixes: https://bugs.launchpad.net/qemu/+bug/1713066
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c596025b04..bfba816a77 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2217,29 +2217,33 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
         } else {
             do_fp_st(s, rt, tcg_addr, size);
         }
-    } else {
-        TCGv_i64 tcg_rt = cpu_reg(s, rt);
-        if (is_load) {
-            do_gpr_ld(s, tcg_rt, tcg_addr, size, is_signed, false,
-                      false, 0, false, false);
-        } else {
-            do_gpr_st(s, tcg_rt, tcg_addr, size,
-                      false, 0, false, false);
-        }
-    }
-    tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
-    if (is_vector) {
+        tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
         if (is_load) {
             do_fp_ld(s, rt2, tcg_addr, size);
         } else {
             do_fp_st(s, rt2, tcg_addr, size);
         }
     } else {
+        TCGv_i64 tcg_rt = cpu_reg(s, rt);
         TCGv_i64 tcg_rt2 = cpu_reg(s, rt2);
+
         if (is_load) {
+            TCGv_i64 tmp = tcg_temp_new_i64();
+
+            /* Do not modify tcg_rt before recognizing any exception
+               from the second load.  */
+            do_gpr_ld(s, tmp, tcg_addr, size, is_signed, false,
+                      false, 0, false, false);
+            tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
             do_gpr_ld(s, tcg_rt2, tcg_addr, size, is_signed, false,
                       false, 0, false, false);
+
+            tcg_gen_mov_i64(tcg_rt, tmp);
+            tcg_temp_free_i64(tmp);
         } else {
+            do_gpr_st(s, tcg_rt, tcg_addr, size,
+                      false, 0, false, false);
+            tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
             do_gpr_st(s, tcg_rt2, tcg_addr, size,
                       false, 0, false, false);
         }
-- 
2.13.5

