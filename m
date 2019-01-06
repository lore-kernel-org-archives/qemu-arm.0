Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2869425wrt;
        Sun, 6 Jan 2019 14:51:26 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4Btgu/0nP4yL7GX+lmFSz7tMF+K3kikho5+K9jKponQhNI1h9DjHZyYWT82EMyNAT0CsfT
X-Received: by 2002:a1c:8d53:: with SMTP id p80mr7564952wmd.68.1546815086291;
        Sun, 06 Jan 2019 14:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546815086; cv=none;
        d=google.com; s=arc-20160816;
        b=S5d/u8KZNWVMM7+F/ivkBGlLrbI39shAI4OISO4sNAuoGKYK3Veub3KXE+kZyuzR1n
         d9qIKTqbvl3VJJfyCS8krtEwH/ccga8Jof0JDwz5RTBVYnvkjYW5cGPiYkallqh2vHnT
         K67rEOIjHSL9huBHOwah4aCcUBqtHpmo+H81c5+cUeUjRh4ryR/yMpshzCmkfJMWom59
         LYF2t5n72SyYzPGu7HCQ2pdXRxM1YOr9yZFz9YfHEyDuhmkr+zL+pahUUC3bEhtIj+qi
         MMmO3rzdXNqV769KlC9W4salt/N7dLvbLNirBi9NqPJumlvQgC9AAw+hsKwbGMkLJCDw
         qs9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=kSo0oKSo1CsoY2QHLe3rTxnPQOT4r7h09gkl4JXYPGw=;
        b=nJ/8llJ60+uzTa5KhNLvw4XYaTmQz83LwyYn3onSKiTsKBwFx5Fg1Wy6hdWQfdKS9P
         x1T5TIgvWr3IjnGVxO78q5dVC/mGtEgekZ/refGFyihk1gTCEv+C+lg/m38oKrwAw78o
         ZBhKPBwQ2R6Ou4+w2rOPUGvuXVGYgEL+QaSh91sUsien3hNFJgI9SQDrLeAU0KstIIw6
         0Gs7+YVRA05us0Hb7D2NM+PDoSqLeeddEq8XFnmKPvgNkFq5I3ubEGkfHA8sFEUKxftd
         Kebg2nRN6qeeG1rN6yVhS8gE6VR+QAX1P8HrDkkMkhgGISUK3mVwjzitauKVKrWhG4VC
         b2DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Lfh/sl+/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si34723728wrw.413.2019.01.06.14.51.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Jan 2019 14:51:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Lfh/sl+/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggHGP-0004Cz-AC
	for alex.bennee@linaro.org; Sun, 06 Jan 2019 17:51:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ggHFu-0003u6-A6
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 17:50:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ggHFt-0004jn-9z
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 17:50:54 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ggHFt-0004jS-4E
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 17:50:53 -0500
Received: by mail-pl1-x643.google.com with SMTP id w4so19953478plz.1
	for <qemu-arm@nongnu.org>; Sun, 06 Jan 2019 14:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kSo0oKSo1CsoY2QHLe3rTxnPQOT4r7h09gkl4JXYPGw=;
	b=Lfh/sl+/68m//Y2YF1vDNRLPg+ceFxNSlF9404jjh0mTezBeeNR7Sh5ONIHrVeXYqf
	Ft0yNymMn585Df6cedqBrQaBaJphw70wDDP7BtHk0/IIXHIGcw5v9uvUuXtbnqxffOig
	RlGZgQIyW09eIT5mhQP3eRiC0TjMf+u3g/RrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kSo0oKSo1CsoY2QHLe3rTxnPQOT4r7h09gkl4JXYPGw=;
	b=fay6yVuuw6ujh1jgtYVxChIgrYLlGJCa289JJcGBdgd1Kq3s3fBw3fyuwbhGlE08g+
	RQcnQsvZqtJ4QjyM3O7B7ONg2g4gDnt1YneuQtj8QXgIWOBBFijGnT/IgqhzPits1ucK
	mH3bBDDnxqfkFNIS93TrF81OZD5+m+MyUluVu4k5RARdC1xbp/3uVMQwKXr4wznauMW3
	3Ds5EHpiKcnhYvtBgpDO8lzMvaGL7pSoa3yiygVG10wC1C/CKUtRF+r8urFMngFGqph6
	JLugNC9zdVIBESi0lEbYhwHNgw8Ed0Rngcz9IS+levz1tkkBR6Fg+PpA5lZwWRplZerb
	fUUA==
X-Gm-Message-State: AJcUukeqcgZmR9HE8JgcTlH9dpnC9cZ64mOk4+T0Se8EBgUDFvKijGdN
	kz7bR2F+5xTdjHk3wAON0DJaNNIhG8lPow==
X-Received: by 2002:a17:902:1008:: with SMTP id
	b8mr57215902pla.252.1546815052118; 
	Sun, 06 Jan 2019 14:50:52 -0800 (PST)
Received: from cloudburst.lan
	(2001-44b8-2176-c800-8cc6-2630-7d99-5ef1.static.ipv6.internode.on.net.
	[2001:44b8:2176:c800:8cc6:2630:7d99:5ef1])
	by smtp.gmail.com with ESMTPSA id
	n78sm45905768pfk.19.2019.01.06.14.50.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 06 Jan 2019 14:50:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jan 2019 08:50:35 +1000
Message-Id: <20190106225035.5671-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190106225035.5671-1-richard.henderson@linaro.org>
References: <20190106225035.5671-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH 3/3] target/arm: Use vector minmax expanders for
 aarch32
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
X-TUID: /RwDVNcDAVXL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 33b1860148..f3f172f384 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6368,6 +6368,25 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tcg_gen_gvec_cmp(u ? TCG_COND_GEU : TCG_COND_GE, size,
                              rd_ofs, rn_ofs, rm_ofs, vec_size, vec_size);
             return 0;
+
+        case NEON_3R_VMAX:
+            if (u) {
+                tcg_gen_gvec_umax(size, rd_ofs, rn_ofs, rm_ofs,
+                                  vec_size, vec_size);
+            } else {
+                tcg_gen_gvec_smax(size, rd_ofs, rn_ofs, rm_ofs,
+                                  vec_size, vec_size);
+            }
+            return 0;
+        case NEON_3R_VMIN:
+            if (u) {
+                tcg_gen_gvec_umin(size, rd_ofs, rn_ofs, rm_ofs,
+                                  vec_size, vec_size);
+            } else {
+                tcg_gen_gvec_smin(size, rd_ofs, rn_ofs, rm_ofs,
+                                  vec_size, vec_size);
+            }
+            return 0;
         }
 
         if (size == 3) {
@@ -6533,12 +6552,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VQRSHL:
             GEN_NEON_INTEGER_OP_ENV(qrshl);
             break;
-        case NEON_3R_VMAX:
-            GEN_NEON_INTEGER_OP(max);
-            break;
-        case NEON_3R_VMIN:
-            GEN_NEON_INTEGER_OP(min);
-            break;
         case NEON_3R_VABD:
             GEN_NEON_INTEGER_OP(abd);
             break;
-- 
2.17.2

