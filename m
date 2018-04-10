Received: by 10.28.71.155 with SMTP id m27csp3155238wmi;
        Mon, 9 Apr 2018 17:36:22 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/Q80EQEBUDvblYz5OoOvQNcYLxgCLDpJB0waPp6ehucm7GFXHZz8aDyyICObfsDEbd4ru2
X-Received: by 10.200.114.83 with SMTP id l19mr21428825qtp.325.1523320582249;
        Mon, 09 Apr 2018 17:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523320582; cv=none;
        d=google.com; s=arc-20160816;
        b=w8NAnnI7rYvbBo+G4PI5tRL3TnF5kluqldVNUAgur4YyABq7PCvDiz80i9PY1zQC7V
         KYhgZSvq7L7zHi7IlzKq/SycjO+mC3zvhdnuyqNI80wlmeHgS+HJrl+2sNDXZA7rRHvM
         KCu1/uiOUuI0mlwWrGXv7X6pdEg2k9cCixWEZeKWZaKOMfDBuXE+kMZ27PntWvAnMtPh
         PxZ2p4WhEwfhodyKp+XVvm1tiRvFlpCT8uoER2gf4TR44WSF5XLSlmuDPXifFGRWBkZn
         vUNQzVT+XZqrpcXTHp4mzQYP6wLLHpSlzakFL1rGEly8ILh/Q6Pq0K0NoHJbwOCkyTpx
         w+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=N+7+nWgYcsOGP93QMezBChGx/w9u6Hy2+v+BgiPrEkY=;
        b=DS/ry3f5NF4jyK5nRuAdu+PS9ZU2yAJAM+FRJ8ESP/uUURD4xXVIs0ijRFMIAz9Rt0
         opLgfhpQ9lCWUk6HnzZ5O6TTsQo34mY/rAyPeW/na4ksBCmjojnH8D50UljKOgnbNMvD
         pIwrjODLPGmV2bvlPZ2ik9rMr/WkoGYT7h8zHOJsayJXSNS97zLXr7onmda+tscCxbVY
         F5NKozNWnWLcjJ+IJdTqn34mpl3Z8JLhmPG02CF7/qJo9upWF2WSF/gI0Jui4dd854GZ
         VhJ50UZglyF/MxWU2zjKN/tBf+ILdPKHaZJKaosJLGNKdK4lb+vk92eGYjOUVobV2tW6
         GOwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MM6B/R1q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 53si337105qtr.257.2018.04.09.17.36.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 17:36:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MM6B/R1q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5hGn-0001uO-Mu
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 20:36:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1f5hGa-0001re-UN
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 20:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1f5hGa-0001SP-3B
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 20:36:08 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:34970)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1f5hGZ-0001Rn-C0
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 20:36:07 -0400
Received: by mail-pf0-x242.google.com with SMTP id u86so6788654pfd.2
	for <qemu-arm@nongnu.org>; Mon, 09 Apr 2018 17:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=N+7+nWgYcsOGP93QMezBChGx/w9u6Hy2+v+BgiPrEkY=;
	b=MM6B/R1q/9talvuzXlWrbtRSW0QSvWCEBIUsvBLxsi6MxJzWLuqQq5qcC0F4r5Blzm
	8pO7LAoDzDdYnLAg5gcpTPZUN4vMyUwwvmdLLj6O8kmPafE+rPW18cWmLqbvNbj1qyt8
	YTc29MCLBXMP17sPtsaLt60NzJ6VrcQEPqioY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N+7+nWgYcsOGP93QMezBChGx/w9u6Hy2+v+BgiPrEkY=;
	b=E4hu2kWRTrXaTAr2JRUvAm5xH2QgfNrBwOGI52o5KAJ9fcwm0QTlFfxCqevGr+zw/s
	Af3QQjdEwZZn1DIgm66jtR+2q97zQYZJnikJr0r4eCiT4U2jnS/LgWjdyNyhQxe+25Gp
	ryP15Y53fwLT9k9stZg9ymkMFykstqdwj9vYx5o8kuhT7TLSIc+05GgOp4iye155ENbe
	Pti0j3hHn62RzYb9eXTVZo4p/9V8wDsanMYSYiU9D7/ZGJ/Uw+073QfEiP3NoTWIbbeK
	vdN8oa/i7EuCtpoZ/4ScKNAeRsF1jDrQP7pWG3bd+kEYNr9zfWOV8GN3WPE6FIIyR1QT
	unEA==
X-Gm-Message-State: AElRT7ERhr+bGjJTojwO3vNggA0PcvKNLG1eEW+qAryu4SCyVh6Mno65
	FAavAM59lggg6cBWOFi/egVyZKX9kcc=
X-Received: by 10.99.114.2 with SMTP id n2mr26868486pgc.274.1523320566268;
	Mon, 09 Apr 2018 17:36:06 -0700 (PDT)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.gmail.com with ESMTPSA id
	t25sm2641012pfj.187.2018.04.09.17.36.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Apr 2018 17:36:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 10 Apr 2018 10:35:58 +1000
Message-Id: <20180410003558.2470-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH for-2.12] tcg: Introduce tcg_set_insn_start_param
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6kq6t9bMG1Df

The parameters for tcg_gen_insn_start are target_ulong, which may be split
into two TCGArg parameters for storage in the opcode on 32-bit hosts.

Fixes the ARM target and its direct use of tcg_set_insn_param, which would
set the wrong argument in the 64-on-32 case.

Cc: qemu-stable@nongnu.org
Reported-by: alarson@ddci.com
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Peter, I'm not sure what the reproducer is for this reported problem.
I could boot my aa64 images both before and after this patch.  Perhaps
I would have needed to run an aa32 binary within the aa64 kernel?


r~

---
 target/arm/translate.h |  2 +-
 tcg/tcg.h              | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index c47febf99d..4428c98e2e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -120,7 +120,7 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 
     /* We check and clear insn_start_idx to catch multiple updates.  */
     assert(s->insn_start != NULL);
-    tcg_set_insn_param(s->insn_start, 2, syn);
+    tcg_set_insn_start_param(s->insn_start, 2, syn);
     s->insn_start = NULL;
 }
 
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 9e2d909a4a..30896ca304 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -825,6 +825,16 @@ static inline void tcg_set_insn_param(TCGOp *op, int arg, TCGArg v)
     op->args[arg] = v;
 }
 
+static inline void tcg_set_insn_start_param(TCGOp *op, int arg, target_ulong v)
+{
+#if TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
+    tcg_set_insn_param(op, arg, v);
+#else
+    tcg_set_insn_param(op, arg * 2, v);
+    tcg_set_insn_param(op, arg * 2 + 1, v >> 32);
+#endif
+}
+
 /* The last op that was emitted.  */
 static inline TCGOp *tcg_last_op(void)
 {
-- 
2.14.3

