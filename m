Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp616604wrt;
        Fri, 25 Jan 2019 10:27:41 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7L6IzB0AEhEPC0rwv95f8dPZi7h3V5S4zzkjPnBpBaiIYRmEVrEyEVaUJ17i0K7qebuwVU
X-Received: by 2002:a1c:2884:: with SMTP id o126mr8132236wmo.17.1548440861652;
        Fri, 25 Jan 2019 10:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548440861; cv=none;
        d=google.com; s=arc-20160816;
        b=Em2AUvq2ZFs5/uvYBKZD+SbcZ3Nm6l94qAZwUIhyV5mBdKRGESgw7EwomIYjae+51D
         WGr3iuxyGIicLF3u0jppyUGaZiPnZtQTrEnlbYRmKaKylpYqL35NqsmYygoxRe5iBaRm
         vh50hG4XUTaj8mVFxOrkOufkyhLyC3i5sl8rJYQILQKKzPrTavFbjMahdRma9HI6vTc/
         uBfaAzOE25MZfeGxrQHAVTS4UZ4ESN65Lz6vMYUD24VVdRBWsjR87FsK35Y53PckXSWM
         b6b4Uxx3x7K1tZW59EmuwbhadfwEazCXQlIf6GhhhBFUQUq7+9q8mIVri/6f+g2uuy20
         Vz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=IBmjdnmbPu3JQz7KF3v9VAM5iOi+UcJ6hEdpbE5TjUg=;
        b=PDwRzfAmBnm2LjCI9JZ0Asxk/9COtFrWrwy515dZwkxXF/grAwSkq2SJ/FRp/3RvXp
         InUYndNO4oYIZPSC7pmwaHFcxMbPbrSoCPR01dQTmiP4yGfJ581z2Ljw0TOpbWrrbh61
         Cw3pQkJq+yrHbTlZw2wEbT7IpKHye2sf/7uNtjMV6Hldu+2aapUG9HlxgOJzfJgsTO5O
         u//AUmfw2bRHHX6Y6Stx7pH7JqUah18G5A0YQ4QiwqvoM4PTxXWLxCb1+7ZdUMiNglC6
         X18TVRx94HgAiAWl8Rez7oRC+5KWislJKFJfBRpocIZgwP3/R/5uzJlVwgP8wEV22vDa
         8tSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BvfkZbL4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si78135072wru.440.2019.01.25.10.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 10:27:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BvfkZbL4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gn6Ca-0004pi-Kt
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 13:27:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bj-0004Jv-T5
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bi-0002d3-6e
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:47 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37294)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gn6Bh-0002Tg-Su
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:46 -0500
Received: by mail-wr1-x444.google.com with SMTP id s12so11330459wrt.4
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 10:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IBmjdnmbPu3JQz7KF3v9VAM5iOi+UcJ6hEdpbE5TjUg=;
	b=BvfkZbL4zV5TYTORCJS9WvuejkESIRcxQg3syBI6+F875zYIXTn8JlZKEYD7AceuXP
	1gtBTpjMLLjbQ/xLbYCdOGcgnIFThTqJmm1m1DTpMqLG21itNfNsqLsEV1cD2PjXiZZR
	rXWZ2SkQUG5mPxZ3V5AWa02bx8Ow2MByFSWY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IBmjdnmbPu3JQz7KF3v9VAM5iOi+UcJ6hEdpbE5TjUg=;
	b=jetmIUyNq0zfPf2N5/yaxqy+f7tnai5/sY81/0ShgMjpwKBLavQ08pT3rNFSw/dW1f
	3ohb4ksAnBiborPMpI7TGzNPvWNaSEBjdiFoZy6AExLUWjCumSKbUAqDFF/Ln+YNHCVE
	cCqSL2wQSSx/fISsA9W5nyRGxX+6GDsX7440108jJyjvBEOBavcXsjMWDYhg/icLNZnQ
	Fva0Nt2MvWNwiQkYnZatE5RYVtCZqfPI3Ju297njOMCNPm/HkbKV+Q0sMgHSfXVFvZXT
	0Ci+QX5ISIc8GQsRLQAs8JlNT84xjU6cSaRMO9tijeIk1BHRfhZxDbFZcm8VgIDyH8P0
	a0Fw==
X-Gm-Message-State: AJcUukfc9ebQ7OU/1AK57dp6CN034eEQhW409RvsEXy29/HcJWiFltWx
	6Kl/d5cQVh+H4ckPtB3t0K5bugaDLZlMCA==
X-Received: by 2002:a5d:6850:: with SMTP id o16mr12837359wrw.123.1548440792575;
	Fri, 25 Jan 2019 10:26:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	t5sm45014921wmg.43.2019.01.25.10.26.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 10:26:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 25 Jan 2019 18:26:22 +0000
Message-Id: <20190125182626.9221-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190125182626.9221-1-peter.maydell@linaro.org>
References: <20190125182626.9221-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 3/7] target/arm/translate-a64: Don't underdecode
 SIMD ld/st multiple
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C+L3bKjY+yAe

In the AdvSIMD load/store multiple structures encodings,
the non-post-indexed case should have zeroes in [20:16]
(which is the Rm field for the post-indexed case).
Correctly UNDEF the currently unallocated encodings which
have non-zeroes in those bits.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8e081758e03..c1f0cad7691 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3249,6 +3249,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
 {
     int rt = extract32(insn, 0, 5);
     int rn = extract32(insn, 5, 5);
+    int rm = extract32(insn, 16, 5);
     int size = extract32(insn, 10, 2);
     int opcode = extract32(insn, 12, 4);
     bool is_store = !extract32(insn, 22, 1);
@@ -3268,6 +3269,11 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
         return;
     }
 
+    if (!is_postidx && rm != 0) {
+        unallocated_encoding(s);
+        return;
+    }
+
     /* From the shared decode logic */
     switch (opcode) {
     case 0x0:
@@ -3367,7 +3373,6 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     }
 
     if (is_postidx) {
-        int rm = extract32(insn, 16, 5);
         if (rm == 31) {
             tcg_gen_mov_i64(tcg_rn, tcg_addr);
         } else {
-- 
2.20.1

