Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4225532wrg;
        Tue, 11 Jun 2019 04:22:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqhXkNJ1DS+HX43ZBJxagHdV4tvWSv5/j1UcGGzIMLlWUh7eI5A/8JNdU2rWWZULydEjbG
X-Received: by 2002:a05:620a:15a5:: with SMTP id f5mr21757296qkk.45.1560252145657;
        Tue, 11 Jun 2019 04:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560252145; cv=none;
        d=google.com; s=arc-20160816;
        b=zc4fazWojPNFJpAYWv0bCo7jydViHuax1pTuyoqrqWt5KnwIOrnw3d24leWSUtUIa+
         XyOJDWYEt4bhCJUhaPJmbV376GRSrO626C0UiTi/MNcpHvNvFDmqF0/J3PznI0nbnylc
         nflF3Ji70l+vDVoTgAz44GrRxZ+JbmMXb6IvPCpfVNRZnt+IhBBvmha52cvYaRA8VR2y
         kI0ntGE8DSE17h+FlEoOanQBp5pQExRhPHR8nJnJIiWkI2FcIb4/ZcUgFPfHnIek1tKV
         WHiiNWBq3k5H274OvdbMmAH7PPYNkw7c9+AyuY8KzyvrH3byxnbQYFTHXOHV+IaFdZvY
         P1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=u6koW8F7IGLYBhWLi4hkXE4YWzeq3RGbqG4uQxIjef0=;
        b=Xslptunn/cRdNyueDwNgCD/NjHXGBxeRV9bHS+zm5MMSRBY8gP5IZBTSWWkiKwNEEE
         patHRUBsL5OJV0OFCiiLxXPQvkEdvfgQkBHuFwyMmPNLKQpTYyi2LlIgjTAx7Prpwfxj
         pLG9uLi6T222Zj/jJwZGIhl/VyWFMNQI8R1U05S2G5BwSTiysfvIYmvEkY5u3/KR7v4K
         FB+nEtYPQP+ABvAmUhBlOLak4Qk7ltFT15JSfeNGirw967sCmG7VK0ntBQ9xye0LF8nc
         x5VoJQzqrL8ddwkc+y7veBn6j2TjBOHY5YGBuHnSOjGgWZG/I6cTxl0SDkbMmTeUPIw1
         evHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uiBUIWX9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n37si1918604qte.331.2019.06.11.04.22.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:22:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uiBUIWX9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haerB-0005xL-70
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39458)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQH-0007R2-Up
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQF-0007lW-7U
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:37 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40636)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQ5-0007bF-JP
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:27 -0400
Received: by mail-wr1-x441.google.com with SMTP id p11so12481109wre.7
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u6koW8F7IGLYBhWLi4hkXE4YWzeq3RGbqG4uQxIjef0=;
 b=uiBUIWX9CE3A3gtpLKCkEj9wi8N3WsoIRjqX3OR6DQkwLD2pccKsXeZyFJk/pggek+
 HHSwL/z4L298J0hopFiI8buAInr3v6u+M9ZTNz0QJAmkPpkYs8JeA4GPd+3CVL7mJWR0
 58R9RgL7lMn2ctppdc4l9d6IV4nQgzKJf0IlNBlLyvon/s0pIlflTizUn1eSwcOl7IzQ
 +qun+a5xs9MiwtgCQOr1dYE9sYtzs8YSFSCXRapfnouxixgE9OsAQ6QTnGFRNQ4gBeCm
 J9iu8QoVJOGCycuhS/QRQEqc2h+MxtZG7nhPJ8y4KKAFNXa+VVqjegzTh3MEKZYuUsrG
 VmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u6koW8F7IGLYBhWLi4hkXE4YWzeq3RGbqG4uQxIjef0=;
 b=L8/XlhXQXLIXDlRDnBggGBHzYpIFMneQMgP7GnO54vRMekOLjRhh3gZa874br/NNui
 XBoog1X2rAao2+jWCRaHzMp85d+dq+4NctGB1LiWF3zmjevzLKSwnNRu2YGLFz90S87E
 f2E/VMAL2ET5ONCYqL8H7LwKv5RLJSLqRuEWwgJnGup+Lk8g4BhXiHpwyxXoYzoBtNsa
 Ltb4ZPzP4+Crjqdet8k+3A0DgHf1sETspc6c/6ZJPdzBIPVM0WhSGDcNXFUaPJE6GZsS
 wtHpTwUo/BFIEeplcshjzz3v8POFGjBg6sTjj1JjX6dKMLDiyBbl+8iod63P5OJO22T6
 6gAA==
X-Gm-Message-State: APjAAAVETcqZoemwtg8oQK6NUbgTWQG9/6nc0GbUTr5ToHAMUORvKybb
 8JuX+WU8pdv7ill2lDccyTWDyKDTmubhHA==
X-Received: by 2002:adf:8307:: with SMTP id 7mr32563552wrd.86.1560250460995;
 Tue, 11 Jun 2019 03:54:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:34 +0100
Message-Id: <20190611105351.9871-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH v2 25/42] target/arm: Convert VSUB to decodetree
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o8pj7vdHx7H8

Convert the VSUB instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 10 ++++++++++
 target/arm/translate.c         |  6 +-----
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 14aeb25f597..12da3b8acb8 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1461,3 +1461,13 @@ static bool trans_VADD_dp(DisasContext *s, arg_VADD_sp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_addd, a->vd, a->vn, a->vm, false);
 }
+
+static bool trans_VSUB_sp(DisasContext *s, arg_VSUB_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_helper_vfp_subs, a->vd, a->vn, a->vm, false);
+}
+
+static bool trans_VSUB_dp(DisasContext *s, arg_VSUB_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_helper_vfp_subd, a->vd, a->vn, a->vm, false);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index cd1f24798b1..18d4f9933ad 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1386,7 +1386,6 @@ static inline void gen_vfp_##name(int dp)                             \
     tcg_temp_free_ptr(fpst);                                          \
 }
 
-VFP_OP2(sub)
 VFP_OP2(div)
 
 #undef VFP_OP2
@@ -3110,7 +3109,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 6:
+            case 0 ... 7:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3296,9 +3295,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 7: /* sub: fn - fm */
-                    gen_vfp_sub(dp);
-                    break;
                 case 8: /* div: fn / fm */
                     gen_vfp_div(dp);
                     break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index d911f12dfd0..de56f44efc9 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -132,3 +132,8 @@ VADD_sp      ---- 1110 0.11 .... .... 1010 .0.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VADD_dp      ---- 1110 0.11 .... .... 1011 .0.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VSUB_sp      ---- 1110 0.11 .... .... 1010 .1.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VSUB_dp      ---- 1110 0.11 .... .... 1011 .1.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

