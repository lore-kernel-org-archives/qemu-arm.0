Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp616170wrt;
        Fri, 25 Jan 2019 10:27:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7WDVreJ3TNtcXf73v4XhA5Zl8DMAfeRVRkqq6pF8gS/kmgTo6+Tzvogd7KTBhE0QEaSOUL
X-Received: by 2002:adf:81c6:: with SMTP id 64mr13102014wra.186.1548440826476;
        Fri, 25 Jan 2019 10:27:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548440826; cv=none;
        d=google.com; s=arc-20160816;
        b=T9f1SO/94iBHMV/39XrLJtWO5Gyor21va2JlbclqHT8bkXQ+rCeq2teUrxUfgR92FK
         26Q7gnpTY4d/rTkReOATLEszi+R1PS744lCLZ6oPcVw1SoiKoaKnpQRJJBZsh9PiOqRN
         vce7ec4s5fZM0wIYPUx16afSIDmSqSdssvAxcr5O60zC18ufmkD0wcmLkaqr8ud1VPDR
         Fu4B8ryO4Pe1NGUQyg5XlRRrAUhTjWk474Ue/8HI2LDdy/FUok0+8rZdWsKRcTJbElwW
         hyrXDOTPEnrpdPUKPMNpYvLo6j0+SgAckUZbZlLl+SDTz+ddZUJ35ky/trVYNJJZLC3n
         tNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ux8QnJxJ6UvqTD3RS+ri03Z+8tArGuUjGhPYKu3EKSc=;
        b=Fr0keFNrg8UAufehuHVpPFfEanAB/VSrIbawD+BTXH9J1nAcYApmmtYdw9vLrC2THc
         7EBsWEhsNaZOwy/6Y1sOswgVYOHSlNKuzMnIX60jsgM5Lt56xpOHQ+zAk46IDMO4cNSz
         Z7+9ofJXEMCW9VLKwVhn+kMmF/KvqLnVv15RcpbPa4OMIJ6NcuOARdLieraQjkwwNMwI
         MqXfNKN2Iug/HmOD8Zvk4buvaMe3Oldfr8tX399/a3AT7dCPJ6SeLbwyPQsD2ioIY3Ib
         0f4z0M0iWEJs5htYWykgljV5rdetEBSNRcASVmE1//vd3av/pPsPo2ML+dDEbYiXqH0g
         Cpiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZcD1mjQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s26si83711661wrs.72.2019.01.25.10.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 10:27:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZcD1mjQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gn6C1-0004M4-GJ
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 13:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bj-0004Jt-IZ
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bi-0002ci-4C
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:47 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37039)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gn6Bh-0002S4-Qd
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:45 -0500
Received: by mail-wm1-x342.google.com with SMTP id g67so7519238wmd.2
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 10:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ux8QnJxJ6UvqTD3RS+ri03Z+8tArGuUjGhPYKu3EKSc=;
	b=ZcD1mjQ92jJfQPQEXjiSqEB8/87BHecT2vKObPpUFLpbWa7UzHCLotizZzmmPmNyxZ
	MoqTwLWPNmZP74rpiJu8Pdu6i7P2Dd9bqGbrMRwTZPOG0V3jkg9RNsVLselezbnjbkiD
	4M/ZsotwUhi6RBgqEEAwCckMrKAtWbO/Yq7Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ux8QnJxJ6UvqTD3RS+ri03Z+8tArGuUjGhPYKu3EKSc=;
	b=R8vJWpRfZYk2PYL7EzGrI3vMO5KgZISgHCn5Sc+dc2Y8PPzatB9wxJCg74J4+C7B42
	vJ/Z0S88wfPRj0qSj51XjlRXrfAgpLZ/DVciGA/S0uVjNXLm1NBbA61iorNft9ckiqLo
	fqJ2zd9NjyJtKCEJpkx30cThhQHKA74hYNpqgUZDgRtX4/INcNAxZkschlpes5Q7IEHY
	FlCsRB7WETzOy64HwP7dgAtUt9yK7iNES8PfPQdJ8AMH4bz/jQq3BphwiHo2/ViU1zHr
	XVv8OfDbiLSYZj9ZpRBZALSxwm0YPm8f05ju8GkNzz6AabzUcvPAo+yn3l1Fm8kYe5kl
	cAXw==
X-Gm-Message-State: AJcUukf2NJtzYG1OsPJCubqDrYbENyIWMedYG6q3JTA/dbeqLyt46CX7
	Q/6wts7XxWfm0snMvjRBsmAJkNqslPGNAA==
X-Received: by 2002:a1c:b10a:: with SMTP id a10mr7669266wmf.148.1548440790092; 
	Fri, 25 Jan 2019 10:26:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	t5sm45014921wmg.43.2019.01.25.10.26.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 10:26:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 25 Jan 2019 18:26:20 +0000
Message-Id: <20190125182626.9221-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190125182626.9221-1-peter.maydell@linaro.org>
References: <20190125182626.9221-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH 1/7] target/arm/translate-a64: Don't underdecode
 system instructions
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
X-TUID: +pKWGzP5JsoM

The "system instructions" and "system register move" subcategories
of "branches, exception generating and system instructions" for A64
only apply if bits [23:22] are zero; other values are currently
unallocated. Correctly UNDEF these unallocated encodings.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4d28a27c3bd..e6df303e321 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2144,7 +2144,11 @@ static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
         break;
     case 0x6a: /* Exception generation / System */
         if (insn & (1 << 24)) {
-            disas_system(s, insn);
+            if (extract32(insn, 22, 2) == 0) {
+                disas_system(s, insn);
+            } else {
+                unallocated_encoding(s);
+            }
         } else {
             disas_exc(s, insn);
         }
-- 
2.20.1

