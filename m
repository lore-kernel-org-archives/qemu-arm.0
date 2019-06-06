Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4761192wrg;
        Thu, 6 Jun 2019 11:01:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzf7CWoDb3fKk9ADa+fd/1vUdEJVnXAiFVeNCIONOlh3bqnumluWr7JME/sNkqBRZQ4Oscl
X-Received: by 2002:a05:620a:69c:: with SMTP id f28mr21431224qkh.274.1559844089061;
        Thu, 06 Jun 2019 11:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559844089; cv=none;
        d=google.com; s=arc-20160816;
        b=uHFm/HRx5DHdamdPkTRxh5S9sM5JhTCDHjyuzGIfU5G82/6rbg+rj4Aw6XgbCy7x8I
         A/mlEWLnmjl3C6y9X8lW8zyVNZVwA4VQqE5uqy6rnsKwsN0FuRc3jv9iJFWQCeBO6vNh
         5u75A1laqe9s4+isnxSFH+Fk6ztxWDqSytolSnoMS4a8mFckXEhVWyMFBq615EDeAP0i
         0vWzabzHswlZ9PVAUvvHAkw9PaEUF3uL8tRuwHkVcRrE1wbS5zHUJlpSQvRUgl9XeNrX
         M8GIw/8LLQujhJw0K40ZgUtv0SIA4CF1K4kUyscXS4VKSLchd76phtzL7meT/yQtHjLd
         zK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=kCydqH+FEckzIy4SdO9TgeD3fKBJOY8MRSuCPKdNzwE=;
        b=oSnzKrEVMz2kyGLo/cy22PTkcHWPqyUvnwLqFEQGNUgK+nOY1fb4R+vhXkBVCdP0Kd
         4yCch+GYDaPqCIqU5gL1d62Z3f/uI5H9FmZaFz7XXqmhBXVa1K64Twb/w2TvPKM7Um5y
         7ZVMj2BSBuOhKvmo2pcUpERMCgATLPMoPkBjy0QZSv8GzrE1wbBNl6+n4i7FPoKDYvLe
         RpL4Zqj1OpoZPfW06pGpDyELOGjmxmmUyqR9dgEuBc1HFayEcob6XYOwnzaplIWfC+Z0
         McAASihNbsSOepYyjTplGtRe0S/4mFhIXs0PYXE4ScqJhO7cSzUWgSnvEIlQKVQptuHb
         8V2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ykq12WR9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p71si2419022qka.26.2019.06.06.11.01.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 11:01:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ykq12WR9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwhc-0000PC-IH
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 14:01:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTx-0004Hu-B0
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTt-0003mb-42
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:20 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTr-0003Eo-6D
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:15 -0400
Received: by mail-wr1-x444.google.com with SMTP id d18so3338214wrs.5
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kCydqH+FEckzIy4SdO9TgeD3fKBJOY8MRSuCPKdNzwE=;
	b=ykq12WR9buJhLcv13TZUE5HdDi0v/cQdfbOouc+Mm+VaJNsmGmLzr+H6hbVUNm7Yxq
	B/ZiPTA0lEJ4KX2C/vTuwBJ2oWs3MJuhdqw9D+59/3OcMHKTKr9dJHQoPynCHpXI8euA
	vSC7t0lurG7BplozEm5FGamQ82UZ/qWIWiqpV6RLgWWMpSNQ9AC2sLxdPfvyDyrL6CgA
	Xd8hqG2itTgWIeYFIEDlJ66O1Jk8KnTUvASeAmUSBVd+2vHgCUgwIaZaXJR4TyD6oFb1
	erupPwuyAxIlCXC1U1qwVOQ9L2KO3jxDmB3sZhek01EeqmdE8QHGOsZHqTm+TjafVWZy
	ot+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kCydqH+FEckzIy4SdO9TgeD3fKBJOY8MRSuCPKdNzwE=;
	b=obsZqBS0Zd9EhnEh0KI0fhiyP144GTSwahQh3kBXqzboayv4Plsaj27im2apA1W2BJ
	eKgynQqwd5N9oiJbJOVBm8ibO6Uo3+sdk2M7mFr5N+kvteOgjhEtYDkBaCfx9HjirZQn
	FCa8trjzEl/91tMZSzryXsK0zdOA1rd/bE2gXTSi3uYWbWiF18ixz+IVOLuoU+u0vi/V
	AI5+XHu4EAxbP9hFwsca/ZIhVFAH+NSw8Nhp/ghZJ/QGEBdRE7+kj7J6PT6utYDxTi8J
	fPXlOaVy2UnrVe28k2HRnLSbmHYe1qPLJd1/e0oLkWMk3x39GCcI2DS3XStfYngeFFe2
	VSTg==
X-Gm-Message-State: APjAAAWLjOGWH6Dfx3TOKhmEqkJx3zJuNqglNRf/a4JwXTRhJeBZDsaq
	4GASENFtIHWm4yZF7igPD1vrjXzz/01y7g==
X-Received: by 2002:adf:db12:: with SMTP id s18mr6006866wri.335.1559843205858; 
	Thu, 06 Jun 2019 10:46:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:58 +0100
Message-Id: <20190606174609.20487-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 31/42] target/arm: Convert VSQRT to decodetree
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nUIbBNdbzgoJ

Convert the VSQRT instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 20 ++++++++++++++++++++
 target/arm/translate.c         | 14 +-------------
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 6e06b2a130a..ae2f77a873b 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1908,3 +1908,23 @@ static bool trans_VNEG_dp(DisasContext *s, arg_VNEG_dp *a)
 {
     return do_vfp_2op_dp(s, gen_helper_vfp_negd, a->vd, a->vm);
 }
+
+static void gen_VSQRT_sp(TCGv_i32 vd, TCGv_i32 vm)
+{
+    gen_helper_vfp_sqrts(vd, vm, cpu_env);
+}
+
+static bool trans_VSQRT_sp(DisasContext *s, arg_VSQRT_sp *a)
+{
+    return do_vfp_2op_sp(s, gen_VSQRT_sp, a->vd, a->vm);
+}
+
+static void gen_VSQRT_dp(TCGv_i64 vd, TCGv_i64 vm)
+{
+    gen_helper_vfp_sqrtd(vd, vm, cpu_env);
+}
+
+static bool trans_VSQRT_dp(DisasContext *s, arg_VSQRT_dp *a)
+{
+    return do_vfp_2op_dp(s, gen_VSQRT_dp, a->vd, a->vm);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index cc67ab069bc..fda0962761f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1390,14 +1390,6 @@ static inline void gen_vfp_neg(int dp)
         gen_helper_vfp_negs(cpu_F0s, cpu_F0s);
 }
 
-static inline void gen_vfp_sqrt(int dp)
-{
-    if (dp)
-        gen_helper_vfp_sqrtd(cpu_F0d, cpu_F0d, cpu_env);
-    else
-        gen_helper_vfp_sqrts(cpu_F0s, cpu_F0s, cpu_env);
-}
-
 static inline void gen_vfp_cmp(int dp)
 {
     if (dp)
@@ -3098,7 +3090,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 1 ... 2:
+                case 1 ... 3:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3112,7 +3104,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
                 case 0x00: /* vmov */
-                case 0x03: /* vsqrt */
                     break;
 
                 case 0x04: /* vcvtb.f64.f16, vcvtb.f32.f16 */
@@ -3290,9 +3281,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     case 0: /* cpy */
                         /* no-op */
                         break;
-                    case 3: /* sqrt */
-                        gen_vfp_sqrt(dp);
-                        break;
                     case 4: /* vcvtb.f32.f16, vcvtb.f64.f16 */
                     {
                         TCGv_ptr fpst = get_fpstatus_ptr(false);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 79e41963be4..2780e1ed9ea 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -166,3 +166,8 @@ VNEG_sp      ---- 1110 1.11 0001 .... 1010 01.0 .... \
              vd=%vd_sp vm=%vm_sp
 VNEG_dp      ---- 1110 1.11 0001 .... 1011 01.0 .... \
              vd=%vd_dp vm=%vm_dp
+
+VSQRT_sp     ---- 1110 1.11 0001 .... 1010 11.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VSQRT_dp     ---- 1110 1.11 0001 .... 1011 11.0 .... \
+             vd=%vd_dp vm=%vm_dp
-- 
2.20.1

