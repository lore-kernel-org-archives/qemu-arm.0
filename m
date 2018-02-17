Received: by 10.28.71.27 with SMTP id u27csp2100178wma;
        Sat, 17 Feb 2018 11:07:00 -0800 (PST)
X-Google-Smtp-Source: AH8x2254YgY6zXBaDzPa8viLbRXiWk4FaJe0FLNBY9W3u0/idZrpDjDrQnvReIA62NfpmuuWmb+W
X-Received: by 10.129.131.145 with SMTP id t139mr1587939ywf.485.1518894420210;
        Sat, 17 Feb 2018 11:07:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894420; cv=none;
        d=google.com; s=arc-20160816;
        b=zuOLA8+P2nVh/tZ3esPll3QXF+MlSWiFjKqe54kcFhp4XU7jlbvwBc9Mc59p7QVO2X
         pZtQcmqil1xO+Ykjp0304LMTfoGi/TZLKCTzuiMSVG8OjhsGon360OAU6/eMyWvfR7zx
         yft3CYVWfyssuUx4w2HCxW6fDdooYiKmAScFs8vL6E+VXcNA6okdDmUukhoWAk6FnSEK
         h7J2fm96+vpieKgqmNvNlBAo31Lpe6GT4MGiyjeqLhXnQowCpD6CcxGxeOurTBihZPLv
         NyiV4/VVyh4Uh06NdIq2pBW3Hwbzd80ReqJZdz6W9mlzOTi278VxpaQrFO6tsXLuCTkV
         53aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=d4HbPykktVYLS4tE1HcEFAw5Qf7NVL1FMMy69rPPEE0=;
        b=KFmKWFcblkx48wW3A0AnIcdIAOH+HzUicjoJqK6/jDHik8TFJQjxdTNsJ6ojUMRmOr
         /DFM9dVF4BIGXk3uWUouePp5yhrMR8hbl00XhOpgZIgC14Owy9N3W7BmQKpP8RJt+Fx+
         RJDF2mSkn6dHoDWJHM0pREOr0xxDaXi8NYDQdzqrW1LjsmDPv/WyG/nZvrAVn/frceRd
         jIjeMmA95mOTXUcm6lE1CgbCJ4Mvqrh0h0mIJkNKt9ORIIhnYwsUMJnQ4+e5PzbVk0fH
         IcmYTYeTVKDrGL9UPSFqDaEa9D52tmWz3+8B0ItYNQjTqACd+gWK+wRqS8hHqzUbGXyq
         bUkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TnhRGHO5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v67si730317ywc.471.2018.02.17.11.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:07:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TnhRGHO5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7p5-0002st-IP
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:06:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AM-0001cr-H0
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AL-0002Au-EB
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:54 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:40423)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AL-0002Ad-8u
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:53 -0500
Received: by mail-pl0-x244.google.com with SMTP id g18so3435893plo.7
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d4HbPykktVYLS4tE1HcEFAw5Qf7NVL1FMMy69rPPEE0=;
	b=TnhRGHO515AMY9RNZj7jrkToPGL9H070saLqxSGas1cvhg9KJ0QIZanFDGXLYt+Fdy
	EmkG7fi6omiG23Z9YmNoQjC37e3FKDhsv/3vkN4wukDIslXiJiq7G3iCtCIFYpgEfyKc
	cxJlStYyhnzD8FTiT0cA5FeNKVeOMGDJy0lLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d4HbPykktVYLS4tE1HcEFAw5Qf7NVL1FMMy69rPPEE0=;
	b=HL9r2fIKIL42/J3UW2Ya8ddL/OFbJ1Sb9M2D9cYYU/q44Qteb21mygNIY+ri3b/E+T
	d+PPbF6F3664f75EfyM4A40NUh7kITz0kcTpRZP/u+ZFlB5snoFG4DO4qaTw2Y15KOuI
	q3mINQbrdrvz+HDRzMAsHATRvbnRts4ZUT/3KvZHULnfAV3ctMjdywCGWF8BfEoThS7t
	/0Dgr9S+PZOkAd7CfJ/JiH9GsJwcNY+Z1BwpbBbF9LHR7i6c60ORjE8MvtTPN++bLbMf
	bwV8X9znlA5ceQlYDJx3GdOWMU4J4a71hBSfWC/Nr1b05vaIReWYFiDqkTyznHuNZp1x
	5KWw==
X-Gm-Message-State: APf1xPDNRqsIQLKl1jKe68g6TGW/6H5EVmtMhf+K/wNcwxT3yTK69Li8
	St7RBbGNR5i3gdYb+ngG8SoHmL3hXjI=
X-Received: by 2002:a17:902:ab85:: with SMTP id
	f5-v6mr9594980plr.199.1518891892033; 
	Sat, 17 Feb 2018 10:24:52 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:10 -0800
Message-Id: <20180217182323.25885-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-devel] [PATCH v2 54/67] target/arm: Implement SVE prefetches
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
X-TUID: O0NCutgZ8pVR

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c |  9 +++++++++
 target/arm/sve.decode      | 23 +++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ca49b94924..63c7a0e8d8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3958,3 +3958,12 @@ static void trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
     do_mem_zpz(s, a->rd, a->pg, a->rm, a->scale * a->msz,
                cpu_reg_sp(s, a->rn), fn);
 }
+
+/*
+ * Prefetches
+ */
+
+static void trans_PRF(DisasContext *s, arg_PRF *a, uint32_t insn)
+{
+    /* Prefetch is a nop within QEMU.  */
+}
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index edd9340c02..f0144aa2d0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -801,6 +801,29 @@ LD1RQ_zprr	1010010 .. 00 ..... 000 ... ..... ..... \
 LD1RQ_zpri	1010010 .. 00 0.... 001 ... ..... ..... \
 		@rpri_load_msz nreg=0
 
+# SVE 32-bit gather prefetch (scalar plus 32-bit scaled offsets)
+PRF		1000010 00 -1 ----- 0-- --- ----- 0 ----
+
+# SVE 32-bit gather prefetch (vector plus immediate)
+PRF		1000010 -- 00 ----- 111 --- ----- 0 ----
+
+# SVE contiguous prefetch (scalar plus immediate)
+PRF		1000010 11 1- ----- 0-- --- ----- 0 ----
+
+# SVE contiguous prefetch (scalar plus scalar)
+PRF		1000010 -- 00 ----- 110 --- ----- 0 ----
+
+### SVE Memory 64-bit Gather Group
+
+# SVE 64-bit gather prefetch (scalar plus 64-bit scaled offsets)
+PRF		1100010 00 11 ----- 1-- --- ----- 0 ----
+
+# SVE 64-bit gather prefetch (scalar plus unpacked 32-bit scaled offsets)
+PRF		1100010 00 -1 ----- 0-- --- ----- 0 ----
+
+# SVE 64-bit gather prefetch (vector plus immediate)
+PRF		1100010 -- 00 ----- 111 --- ----- 0 ----
+
 ### SVE Memory Store Group
 
 # SVE store predicate register
-- 
2.14.3

