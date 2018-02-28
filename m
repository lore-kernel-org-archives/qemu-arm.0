Received: by 10.28.91.67 with SMTP id p64csp821549wmb;
        Wed, 28 Feb 2018 08:50:46 -0800 (PST)
X-Google-Smtp-Source: AG47ELsseNCd5HgoHKCv8ABfTK9SxvqdXIaqkmn6QGn1RsP3k058TuDEqRVQspWYYvpVx6hu4pJU
X-Received: by 10.129.35.9 with SMTP id j9mr1019077ywj.217.1519836646608;
        Wed, 28 Feb 2018 08:50:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519836646; cv=none;
        d=google.com; s=arc-20160816;
        b=klJO0IMWz7RiZWOnKCu+87OP75jYk/NbWd4gOVdbkr2C4HPps+XxSTF0Pu/l/QwVjR
         XdUL/EPu9rIr/1weMfgB/U3tmOCavQDtc+U0roMbRmPjCuxQYJvWYNID+Z1zhp91YJam
         Hg8uhtr1lgWuA/Ya+WfoqhKPg9TOkUimTITWVHYG6o6NttMKoOhGLx9x3WVSu3J4w70D
         VSy2DGefoZIDvBBzYM8468pxVTmt7/yswjpNbRsCvu7C5Ay7mv2bCc5Od2m4/Ajl6Kmy
         o37j78UtJcAkbpoC5OCp3MHPRmioATmFSfQFRrFwQhUSEtMFMTmofSdJ+0XfK3wsGsb0
         U30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Qyv7V4h0pVSz27pY8T3TlOZf7AIVP9a7Bm88uviW7zo=;
        b=gCcZiWMrwpF9Q/U+PigZFdimLHw4yyZuG8RX7tqirz2J+wadW+fJeFeV/gpcAPF8BS
         ErKqWl2QFznQjQB1lhZshEsv0dCNaM/UcaXK5MvvfXlzqIbO3OYZGvPXf3hMkVoIDatk
         /hdSnf+sjQaa5NMKfVw0A34YjmEdVC/6eU8SuSHPWRlEx5DnBixL+3Kfb5S1c2glgf8V
         hqt+vC36gj5ysanWfktOPe3gXqEw+l1r9LjlF6SpVqB2/y61NduEcK3JzV3STH/6PTjt
         GHNJOvl+yEBiGNVR2QUR/NuwW4u9UPFl9jPtpJAuJ1Rwai7ZAbFM2y6XVIO9awgYH/YJ
         Z5+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iFvj3iyq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b132-v6si328562ybc.264.2018.02.28.08.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 08:50:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iFvj3iyq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er4wI-0001vG-2Y
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 11:50:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er4u2-0000gQ-L3
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 11:48:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er4u1-00076y-Ls
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 11:48:26 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:39556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er4u1-00076F-Ey
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 11:48:25 -0500
Received: by mail-pf0-x242.google.com with SMTP id u5so1219285pfh.6
	for <qemu-devel@nongnu.org>; Wed, 28 Feb 2018 08:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qyv7V4h0pVSz27pY8T3TlOZf7AIVP9a7Bm88uviW7zo=;
	b=iFvj3iyqjJck25oUCIqiFfRXt6A22sDk+5epDUnyaORYTMqmflj9+LEINa3JA5LVcq
	DA/ML94YEhl9t47gWqopixblgl4m3cTdkiiCWqv7K9wFWlNdQJjuA4byQx8vn1cr/f3L
	oNh5QN8Y/YWnZqq0nxN1UpzPLWwEha9g+KlwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Qyv7V4h0pVSz27pY8T3TlOZf7AIVP9a7Bm88uviW7zo=;
	b=XjeetJE0foRyvL+DiZ/1X3bmObzMN1MTB8OtC+fhZdUb2NIY6KOd+GS/FxVHOLzpC3
	QHu+nonkuJM62FNIAP4W05SZPmQ7WXOgLJlkmzfDbVWTrEgXFQiWW6dMu4kIbRACBdlA
	niW087NuW7PTRSfSVRnGEIhQaqrHVmVXapXfZ65KwHatDyhpamWx51ULzN6BXXGOsecu
	sTSjanmfRPNuoPrt61WWYY4/tX24aW/v58/HG7OI8bJPNhYv8kQ2RA8l8ciSUFj3U22p
	k1l2w6Qyu4SLpopd2AsHhkqaJZuTsjUxAV4LuaqqtjMC6tujkxrNSQOeyPqMGK5t+CmG
	dHew==
X-Gm-Message-State: APf1xPCV5N5VzD9yUZlIsi7HnowEzgQXw6A+PllYFRLHuMCTnLmu98ts
	WWCUj9/89CmDPkW92UtlOxyL7ZyR4iA=
X-Received: by 10.99.183.5 with SMTP id t5mr15051957pgf.416.1519836504076;
	Wed, 28 Feb 2018 08:48:24 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id p9sm4123698pgs.89.2018.02.28.08.48.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 08:48:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 08:48:16 -0800
Message-Id: <20180228164816.24110-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228164816.24110-1-richard.henderson@linaro.org>
References: <20180228164816.24110-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [RISU 3/3] Add arm and thumb vqrdml[as]h, vcadd, vcmla
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 96NeGbIc3VrF

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 arm.risu   | 25 +++++++++++++++++++++++++
 thumb.risu | 25 +++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arm.risu b/arm.risu
index 13ea019..af73345 100644
--- a/arm.risu
+++ b/arm.risu
@@ -831,3 +831,28 @@ VCVT_rm_neon A1 1111 00111 d 11 size:2 11 vd:4 00 rm:2 op q m 0 vm:4
 # Note that sz == 0b11 is UNPREDICTABLE (either UNDEF, NOP or as if == 0b10)
 # as is cond != 1110 (either UNDEF, NOP, cond-exec or unconditional exec)
 CRC32 A1 1110 00010 sz:2 0 rn:4 rd:4 00 c 0 0100 rm:4 !constraints { $sz != 3; }
+
+#
+# ARMv8.1 extensions
+#
+@v8_1_simd
+
+VQRDMLAH    A1 111100110 d:1 size:2 vn:4 vd:4 1011 n:1 q:1 m:1 1 vm:4
+VQRDMLAH_s  A1 1111001 q:1 1 d:1 size:2 vn:4 vd:4 1110 n:1 1 m:1 0 vm:4
+
+VQRDMLSH    A1 111100110 d:1 size:2 vn:4 vd:4 1100 n:1 q:1 m:1 1 vm:4
+VQRDMLSH_s  A1 1111001 q:1 1 d:1 size:2 vn:4 vd:4 1111 n:1 1 m:1 0 vm:4
+
+#
+# ARMv8.3 extensions
+#
+@v8_3_compnum
+
+# Disable fp16 until qemu supports it.
+VCADD       A1 1111110 rot:1 1 d:1 0 s:1 vn:4 vd:4 1000 n:1 q:1 m:1 0 vm:4 \
+!constraints { $s != 0; }
+
+VCMLA       A1 1111110 rot:2 d:1 1 s:1 vn:4 vd:4 1000 n:1 q:1 m:1 0 vm:4 \
+!constraints { $s != 0; }
+VCMLA_s     A1 11111110 s:1 d:1 rot:2 vn:4 vd:4 1000 n:1 q:1 m:1 0 vm:4 \
+!constraints { $s != 0; }
diff --git a/thumb.risu b/thumb.risu
index bf7556b..b8afa59 100644
--- a/thumb.risu
+++ b/thumb.risu
@@ -437,3 +437,28 @@ STR T2 11111 000 0100 rn:4 rt:4 000000 imm:2 rm:4 \
 
 # V8 only instructions
 CRC32 T1 111 1101 011 0 c rn:4 1111 rd:4 10 sz:2 rm:4 !constraints { $sz != 3; }
+
+#
+# ARMv8.1 extensions
+#
+@v8_1_simd
+
+VQRDMLAH    T1  111111110 d:1 size:2 vn:4 vd:4 1011 n:1 q:1 m:1 1 vm:4
+VQRDMLAH_s  T1  111 q:1 11111 d:1 size:2 vn:4 vd:4 1110 n:1 1 m:1 0 vm:4
+
+VQRDMLSH    T1  111111110 d:1 size:2 vn:4 vd:4 1100 n:1 q:1 m:1 1 vm:4
+VQRDMLSH_s  T1  111 q:1 11111 d:1 size:2 vn:4 vd:4 1111 n:1 1 m:1 0 vm:4
+
+#
+# ARMv8.3 extensions
+#
+@v8_3_compnum
+
+# Disable fp16 until qemu supports it.
+VCADD       T1  1111110 rot:1 1 d:1 0 s:1 vn:4 vd:4 1000 n:1 q:1 m:1 0 vm:4 \
+!constraints { $s != 0; }
+
+VCMLA       T1  1111110 rot:2 d:1 1 s:1 vn:4 vd:4 1000 n:1 q:1 m:1 0 vm:4 \
+!constraints { $s != 0; }
+VCMLA_s     T1  11111110 s:1 d:1 rot:2 vn:4 vd:4 1000 n:1 q:1 m:1 0 vm:4 \
+!constraints { $s != 0; }
-- 
2.14.3

