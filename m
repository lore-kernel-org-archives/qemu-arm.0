Received: by 10.28.91.67 with SMTP id p64csp819959wmb;
        Wed, 28 Feb 2018 08:48:52 -0800 (PST)
X-Google-Smtp-Source: AG47ELsGTSyiBM5WgrR+r4a2gMVBEJgSMqeJVsLvCyuJVEaLvGakc1TShdRujjjLD3KsymK3rK43
X-Received: by 2002:a25:684c:: with SMTP id d73-v6mr11337747ybc.290.1519836532838;
        Wed, 28 Feb 2018 08:48:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519836532; cv=none;
        d=google.com; s=arc-20160816;
        b=kSGR3BzWLstyr0wlDcpaMb3dRG/+442EmcxyFytPODv0zN+XmnTA9eBAf8lh/w78ln
         cSzb+B7GKauMC0CaORdh+Gec1ugFIY29Cs3YMqN44KBPG6atr6g6/2fkSkZTHhkwPsS2
         6NSzGDJY2bvCCKVgv8UKuAlBk/PzZkVKNs5+HQmx1T/ixGLDbXEeqUL7B0v7DXrwpRyH
         mc1f1TY0Qkr9zZTHFxyBzAEWzJMi8Ar6KL3s/4fZ1LxUJCbbSdvtDZs92hvYewfnGqk7
         bgSxQH3bz+CO13NCxVdR515dQf281sZyTGtMxDVv58MiLxrwc6XaU7zLqLvT+njr8jr9
         W2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=08y15+ahNwJBI8xqM1r6NIgh9yeaghjMLRrnTxZZVdo=;
        b=CKBxp3YyQp2gW8X4raVnTk8KR9wfrx7esrrmUZ9jacUhWeybxMmC61UucbrOZ2hcqQ
         JOBRNFjZeB2j4I7/iXUWT2NCC9QWnLGQAcUdL+nre3drB2bf2djCJ4IWMkISeEPXlFTD
         T/hHg9aSbPnlpDllT2jrXxcBFVqlm9hjmXs7yu7XwiiL/LBSD04qWx5z8dbhCh91+gUL
         My0sClfmF5QUhgqBqUsRS5Xk2LtDbdi5KEp0sSfb0N6vGUI8utFNX9uvWnzHHuOOqqqF
         6wCX7vFfVQj8mvXUFkOf73ZjA3ckU2cxh7R2NKKUYotT5GUOlB++s7FZEpQ3GiwDMucH
         90oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fe0HppRb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v140si326729ywc.460.2018.02.28.08.48.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 08:48:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fe0HppRb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er4uS-0000ro-8B
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 11:48:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er4u1-0000fq-7C
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 11:48:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er4tz-000759-RV
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 11:48:25 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:41501)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er4tz-00073w-LK
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 11:48:23 -0500
Received: by mail-pg0-x244.google.com with SMTP id q27so1145566pgn.8
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 08:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=08y15+ahNwJBI8xqM1r6NIgh9yeaghjMLRrnTxZZVdo=;
	b=fe0HppRb4tZS90mOHy8mOeW50O3SNaygDeEueHa4B+y6vGzX+gMOMUjF8A43BIQh6g
	hkNPGgOYnD9c6/0t4su8G5IPXrCWBV12ZWEGw4O6kN2qUurKNkrZ5cdWRIUvXcqiJKUg
	K5wxI1mk1VpBaz5GuWg79QomtMZ7ePZ1ytiJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=08y15+ahNwJBI8xqM1r6NIgh9yeaghjMLRrnTxZZVdo=;
	b=Q6jkVL1Vax5/CXT+DVOd2PTCZk8Pv7t3GldUcSTcAI+a4u6XPUTBOPHq4OwkLdYHan
	30HqJZTuTd//B6wxWaPw144yvEaBlphuVuyRmib2BaLv3bF/H8sEOt2w2LOq4/PDvJFk
	DFbSeBynaI7iFCPgllhu3UqweyYr5GnildeuFEfEKp9veBbTrwmzMGNoIPVsJ2YVCgGv
	eE+v9F7GT76sM8N2vIm5c2qkCr+cbuqwvvGMFe6Qy0//A8rDCnP/5n2aivW3Kbv2+gKn
	MP0JUA6TFizXBnUFP9XZJBOOF4AAkVD/0Vox3es7leFDwrNzfr5ZgDvQCQ5dQIqwF45l
	dqNw==
X-Gm-Message-State: APf1xPB0v6zIP8YDXXjTztC5NtuPiXFS0s7LTBPAj1o/x0NFpphIM1Qi
	cuY6/w99c7uvChHFPNmcDYzfVivKqCo=
X-Received: by 10.101.82.12 with SMTP id o12mr14562825pgp.126.1519836502732;
	Wed, 28 Feb 2018 08:48:22 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id p9sm4123698pgs.89.2018.02.28.08.48.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 08:48:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 08:48:15 -0800
Message-Id: <20180228164816.24110-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228164816.24110-1-richard.henderson@linaro.org>
References: <20180228164816.24110-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [RISU 2/3] Add aa64 fcadd + fcmla
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
X-TUID: 2FEp3PwBW3Po

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 aarch64.risu | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/aarch64.risu b/aarch64.risu
index c1a29f6..a5c92e9 100644
--- a/aarch64.risu
+++ b/aarch64.risu
@@ -2956,6 +2956,19 @@ SQRDMLSHse  A64_V81  01111111 size:2 l:1 m:1 rm:4 1111 h:1 0 rn:5 rd:5
 # SQRDMLSH (element, vector)
 SQRDMLSHve  A64_V81  0 q:1 101111 size:2 l:1 m:1 rm:4 1111 h:1 0 rn:5 rd:5
 
+#
+# AdvSIMD v8.3 extensions
+#
+@v8_3_compnum
+
+# FCADD (three registers of the same type)
+FCADD      A64_V83  0 q:1 101110 size:2 0 rm:5 111 rot:1 01 rn:5 rd:5
+
+# FCMLA (three registers of the same type)
+FCMLA      A64_V83  0 q:1 101110 size:2 0 rm:5 110 rot:2 1 rn:5 rd:5
+# FCMLA (vector x indexed element)
+FCMLA_idx  A64_V83  0 q:1 101111 size:2 l:1 m:1 rm:4 0 rot:2 1 h:1 0 rn:5 rd:5
+
 @
 # End of:
 # Data processing - SIMD and floating point
-- 
2.14.3

