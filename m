Received: by 10.25.44.15 with SMTP id s15csp5483657lfs;
        Mon, 17 Jul 2017 21:58:25 -0700 (PDT)
X-Received: by 10.55.74.78 with SMTP id x75mr1086128qka.254.1500353905863;
        Mon, 17 Jul 2017 21:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500353905; cv=none;
        d=google.com; s=arc-20160816;
        b=liKqMzKN13V/CX4b24qPoBCQafjyvCbRvNjm28V9N54/RLtJT+g3YteelEaGKbpvKs
         xutQ9wF7lA23GWXNbo+T8pVGJh5QBgltiiHJX3OgQqkMgixH0pWfTBZL0fxs+1TVCW5P
         dmZr/YEiAPOEZK4pwJyiMM6kW3vW8dS6eIlfTNmkmBrqqC4PGnSiIa0ss1BQGCzKIRjS
         CuTTWphRV3k4zIQ3eaDODXLR5JeSDm+NP+47drZeQcyAa3j6etpBsnmH3QL/ofmLotnR
         EZLVrjJ5/MEdoOzNhY97NVWztCdg7uLMqBnH+yJT1G6C9lbdB0m7FdiEdGwx7IClaVOw
         OUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=jADw3En3egwY8rm7+Ysl4mFgnXpGilTku4AAI0IBduk=;
        b=jJceCiKzv+NXEJ4xBS0V7KPPZnyj4RWXDFa+aMi/03uuQU/RHC4HgrHYo81BLPEVgp
         uluaNij2cUQwsa8oGryJnwWRFcvhDnWScvsy9qTIJQz2PnjkUtr8d6ApbXx8Q4Ju1QYa
         a0mq/w3Ig22BsZtKrzJ9es1kEL2/pfFi3qID0m4wv7y+vcftdtfOUtVxnp7KUcaKF/Jh
         3Yl1Fgo9hzP5JmtzZYjd0FQXbKhNXZdD5lxEN6TkbYzOEKbM8iXaJo2BSXQMQFMGoTFc
         mcrHEkyFRHgmjPraxxlL1bpCE8ggVo8T+zJ5+5mB7XCItA4O4ggL4OP6foa8mFlncrpY
         BJTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=nf0v9yK5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7si1175539qtb.189.2017.07.17.21.58.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Jul 2017 21:58:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=nf0v9yK5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXKaV-0006CV-6l
	for alex.bennee@linaro.org; Tue, 18 Jul 2017 00:58:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXKYF-0004dJ-EY
	for qemu-devel@nongnu.org; Tue, 18 Jul 2017 00:56:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXKYC-0004DB-DK
	for qemu-devel@nongnu.org; Tue, 18 Jul 2017 00:56:03 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33098)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXKYC-0004Cz-8r; Tue, 18 Jul 2017 00:56:00 -0400
Received: by mail-qk0-x243.google.com with SMTP id u126so310134qka.0;
	Mon, 17 Jul 2017 21:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jADw3En3egwY8rm7+Ysl4mFgnXpGilTku4AAI0IBduk=;
	b=nf0v9yK5oJP40LltdNJUpmvBR6A++UTp4bm7LJNlYsjUYxYmYiaMZAmvfxtytt0oiN
	erD+YQ8G//rIEL1EKHJo58mNphw5odC+kXn6g2JsRIQeGbfTMJa3kV0S4aqdK5/sCdfe
	ytYnS8vgJFzFQbay/jLYcLabVU4ZH11V8y+aJWgrqEsdnFGWeFHz+86uSQueZd6IGdMs
	2Ufrn1Z9RQXkw9NdxFtJRqEBcXEusYjbwPBNzyAM6kz4TzoFY5aVDUtpkRYLdF+f8y6G
	hXgRCo8KSz/LvGQiuHKHFFiAQ3xtm0NsEPvEwuu5eNTnZzMAlQmxBzs/WkTDovFLUXKu
	uabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jADw3En3egwY8rm7+Ysl4mFgnXpGilTku4AAI0IBduk=;
	b=K30KpPLTm1rGL7VuP4bYP+7YHoByJMvg+vCetigYE3ekMTxOqgBErUEai+pumo2BuG
	tXkbVXd8wkgkRseWOzWw8iFCtdPY3BrbKFgf2rhx2LGZOu7gC/pOhHP/MK+l/jKCUdj8
	VnLMzL/6CzulBu1y7TCYgoDLUV75hDCQv9GVuTn+rWfJTptpdBbpjmUKMuLuz9JLKoUs
	ff/GWLi0KIPDll8PY/MxediRyWxIYzrbzdc7ubzKppXYIgBxs4xCsPJXDIBv3DZUlSI8
	kEir5oMcN4fOnfzXFGJR8J6bGBIlqDikquPQXMANLuGPGaPqAfrdle/9AhCQRDZ9wg10
	xyMw==
X-Gm-Message-State: AIVw110V8iNXvswWscSGHL1sq6JyO0paSnG14y+Zd5kLCS5zGhZuLPnm
	Y0bsA0mqZ1vATw==
X-Received: by 10.55.19.138 with SMTP id 10mr1017189qkt.34.1500353759742;
	Mon, 17 Jul 2017 21:55:59 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id a62sm863698qkd.14.2017.07.17.21.55.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 21:55:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jul 2017 01:55:33 -0300
Message-Id: <20170718045540.16322-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718045540.16322-1-f4bug@amsat.org>
References: <20170718045540.16322-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH v5 03/10] target/arm: optimize aarch64 rev16()
 using extract op
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
Cc: Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IiHbBD63O1DT

Aurelien Jarno denoted this function could be implemented more effectively using
the aarch32 rev16() pattern.
  [http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg03180.html]

Done with the Coccinelle semantic patch from commit 58daf05d07dd
    (see scripts/coccinelle/tcg_gen_extract.cocci)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Richard: maybe you need to update 58daf05d07dd to your commit...

 target/arm/translate-a64.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e55547d95d..8ade865481 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4046,14 +4046,12 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     tcg_gen_andi_i64(tcg_tmp, tcg_rn, 0xffff);
     tcg_gen_bswap16_i64(tcg_rd, tcg_tmp);
 
-    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 16);
-    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
+    tcg_gen_extract_i64(tcg_tmp, tcg_rn, 16, 16);
     tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
     tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 16, 16);
 
     if (sf) {
-        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
-        tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
+        tcg_gen_extract_i64(tcg_tmp, tcg_rn, 32, 16);
         tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
         tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 32, 16);
 
-- 
2.13.2

