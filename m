Received: by 10.28.91.67 with SMTP id p64csp987331wmb;
        Wed, 28 Feb 2018 11:35:42 -0800 (PST)
X-Google-Smtp-Source: AG47ELt/LPoY1ctyNWaUv9uP5j9RV6oQwvVBD3x1r2+dfeWPNp1usUN2gOLiCPyrLmOJ9URs8iwu
X-Received: by 2002:a25:ba4f:: with SMTP id z15-v6mr4211747ybj.472.1519846542549;
        Wed, 28 Feb 2018 11:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846542; cv=none;
        d=google.com; s=arc-20160816;
        b=Jnd4Z2S3NaMALEruw9bbWJPnr1pjOwGHLesFkFfbfgviaXkFSkA4VFp9rK1ODnGO+3
         3ruA0FbaSWMjTdyOpAHPCGor94riKvRViS1dFuthnFELGWGwS/hjantjMaV19j//dvOh
         vMi/lpc9N/76k0OJuR/fGGCjmCQjwRlXxmpDaWqHyhQ2hor2+5maZNxJ0PEcGTLZ9gMj
         SbDzIPW28fBmfp07h+y2FriiW8Tmu1EhHdweCAZdjuWyCSgofXzknsf35cv9QmfDuYl4
         obX7wMjyii0fAg8Eqyu9Tp+O34pxc8w0TaU2u3AmmUbS7v08bdGUid1PZlltYomDPtgI
         t5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=kWwcD1c9U6XB7psgG29oW99dgyeUKl095t2sNbp6oo0=;
        b=nayU2ICKRgGFhqUGSRRmH68xNybD6xCKnquc9Y+ZQzfMqWz6cl0xLjVB9L4dRtfVqr
         g8i/GOjKTy+weF6u6+psZ+Xl/nhZWlTTNtu46qsSFyhbKQbBN0q3HXyHVd0Y2Q1+CXuR
         zXsQHDTf30AsQIIplNujj4PwWsRLAa9zCNCZqliijl4j/t1BNFYcUXVSSvAfih+QgjSo
         r/4WWJKxZC35JPocVaDvNO4sGgievK4vuV82eCx/JFrZ0gLxG/Rg1pD4c0HcwUmqmo6D
         By8hKFYjoiSttl05BWeqgiSQQKbLlAeJQVNJRSdP+TutpTagEZxYdQ+tOLq4yFtq9xBd
         kuTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NYYPjfmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z23si377990ywj.539.2018.02.28.11.35.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:35:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NYYPjfmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7Vt-0006ew-Vd
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:35:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Rx-0003Iw-Rf
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Rx-0006JN-59
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:37 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:42081)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7Rw-0006Iy-WE
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:37 -0500
Received: by mail-pl0-x242.google.com with SMTP id 93-v6so2111561plc.9
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 11:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kWwcD1c9U6XB7psgG29oW99dgyeUKl095t2sNbp6oo0=;
	b=NYYPjfmgFdXmFM4sAaedEDppkzkRonN3wBJM0Xd9Ujw0fxzsedQGQuh5RtIZ8/yaQU
	h1A68SHbX0onkGLnhsvokqUXwpM//Hp0pGqEpr6vzzaEEgv3LyUhCXtFPtEeDi9blaCp
	CD8HNARHkEXj0qlNHDWwB1zHl3nsiATAv+7Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kWwcD1c9U6XB7psgG29oW99dgyeUKl095t2sNbp6oo0=;
	b=Oag2lU5+uw3/gXZyIVmQUDOzHaGp/qE9KDafa5UrPrw8bRH5wkSV7i2pFCivEuRNHG
	fKTkBCR1c8XXXv+g3uauM81R+A1yW3cF7W20SRW+i7mHSL0t8UdmwI54xGl5/8GkgzdA
	GCDQJQM4cymAfjzIS+J6n3n1fgPN1lvvR9ovtUUtmc2dU0EUX83+4sh4hBK2KhJN1U30
	hj0NCp0IfgB1/Zf8XAj5kuRyNVW507hqdS5NdGjDvSivVp7auS4fwYy6U9IB0fJJyYbu
	HJGgiiJJ93HQ5gi9qFh2ViV8s8FrvIX8EjKFS0eYEaEnAQtEpI1AEEVfkpP4haadx6jm
	SBYw==
X-Gm-Message-State: APf1xPBT4XL0MzzQCgp1QVWi8ExGoOrBqSm4OP3wORp/cYaJD4j3O+Qw
	hW9BFtN1EolSscHoulLO5nVDRQ==
X-Received: by 2002:a17:902:b7cc:: with SMTP id
	v12-v6mr11683389plz.249.1519846296124; 
	Wed, 28 Feb 2018 11:31:36 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:15 -0800
Message-Id: <20180228193125.20577-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v3 06/16] target/arm: Decode aa64 armv8.1
 scalar/vector x indexed element
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PbML/HfiCKZY

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ae16313eb0..e4d2d548ba 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11987,6 +11987,13 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x19: /* FMULX */
         is_fp = true;
         break;
+    case 0x1d: /* SQRDMLAH */
+    case 0x1f: /* SQRDMLSH */
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_RDM)) {
+            unallocated_encoding(s);
+            return;
+        }
+        break;
     default:
         unallocated_encoding(s);
         return;
@@ -12230,6 +12237,28 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                                                 tcg_op, tcg_idx);
                 }
                 break;
+            case 0x1d: /* SQRDMLAH */
+                read_vec_element_i32(s, tcg_res, rd, pass,
+                                     is_scalar ? size : MO_32);
+                if (size == 1) {
+                    gen_helper_neon_qrdmlah_s16(tcg_res, cpu_env,
+                                                tcg_op, tcg_idx, tcg_res);
+                } else {
+                    gen_helper_neon_qrdmlah_s32(tcg_res, cpu_env,
+                                                tcg_op, tcg_idx, tcg_res);
+                }
+                break;
+            case 0x1f: /* SQRDMLSH */
+                read_vec_element_i32(s, tcg_res, rd, pass,
+                                     is_scalar ? size : MO_32);
+                if (size == 1) {
+                    gen_helper_neon_qrdmlsh_s16(tcg_res, cpu_env,
+                                                tcg_op, tcg_idx, tcg_res);
+                } else {
+                    gen_helper_neon_qrdmlsh_s32(tcg_res, cpu_env,
+                                                tcg_op, tcg_idx, tcg_res);
+                }
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.14.3

