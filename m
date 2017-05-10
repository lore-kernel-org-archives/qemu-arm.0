Received: by 10.25.0.6 with SMTP id 6csp467290lfa;
        Wed, 10 May 2017 13:08:12 -0700 (PDT)
X-Received: by 10.200.56.88 with SMTP id r24mr318234qtb.174.1494446892159;
        Wed, 10 May 2017 13:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494446892; cv=none;
        d=google.com; s=arc-20160816;
        b=ipErsuuc0+rX/8fAkypjETndchy8fEi1jJNLiBrGQ/0VhBzqPr2ydOPPTJ39Wir1Ox
         ZSjuJ2D5eI3UrF5BowcAI/BSJtXRRVVCAqqO93sENw9XrvvIin6Dgjf0MQzC8hKmVD8T
         xg+1YxVvSGdeBZWR2eGH201IGW5o7uaWKNgcd2uZAtEeWUX+VpTq8f7HfzYjFAIHRdHF
         YzN1PkdS8WOqGtQPU5x88Zmn9OUHWw4AmbvjDfFi5NIO2ghoEtZh9my5wzehOf1zABp3
         UvfCwSrslDK42yEGh78dfbbs5tt/+AG2zntqcfyey99GESfMXHySFCgKksXaa+jlmJLc
         aFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=CUtuhwotTcUgfxDileQ4JAC48wEk/mlZ5pDz05j4+8k=;
        b=jBFYiHgDhMaCClqz8D3DX2AO9QzdSlpEIXqWbojHV+XAOuIoUbeh98HXIZpqtftQdM
         QaEDkaGMN8nElEgMCTfQDUVHPZ1eY2B9zoEL9HG/xanQp6/f1oTLxkMjEG5MJOuD9xNf
         96529NhLvkb4LmsZk9UgkfnLrdWLbJ5/JDiw1QZ+SRUuh1gCH78uq6i57vuHkBVYwAgN
         hje5JorulI7jzBXB94owQkpqpRtJXsV7aSjWEVQ6mJ42abBShQWwSg1fyVqeKDlnR2RC
         4/iDHdxg264t/Uy6USBCRMZZecVBjIHjN0ODCDXU1V6mNS0XtPQXBxtuHr9nkmlDl/x/
         H5VA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14si204qte.15.2017.05.10.13.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 13:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44587 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Xu7-0001Bb-Cm
	for alex.bennee@linaro.org; Wed, 10 May 2017 16:08:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8XsC-0008Aw-Qc
	for qemu-devel@nongnu.org; Wed, 10 May 2017 16:06:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8XsB-0006Sh-Mw
	for qemu-devel@nongnu.org; Wed, 10 May 2017 16:06:12 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:36784)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8XsB-0006SN-Gi; Wed, 10 May 2017 16:06:11 -0400
Received: by mail-qt0-x243.google.com with SMTP id j13so264863qta.3;
	Wed, 10 May 2017 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CUtuhwotTcUgfxDileQ4JAC48wEk/mlZ5pDz05j4+8k=;
	b=pGATNv47uqxnzp531GYbfYMMr8ohYIc7++5BNz4OSZwvMcunbqxFvsnashbgGEpivw
	vuayFUbmftwhTOEA6X+/snQMkdjvJcpljWUYbk+bqBl6/cqPiEpfGxmnXZPt1s9s6YRk
	LDXfL4cSqkKoMqADSE6aj+PmcI2GzvbA8u3i4YU3SZxS7Z2ALSup9L04pgc8U6iMAXNO
	44wNwy7XZlSoay4pKPpPyjAtSkl53HKj4ZFV9LyERz3CAkEyRdFNZVi9ckR3O2Xa4FOR
	nOdh4WskYzBQYG00Zmnas+0xfQTWwEIaUiihF973dDYdwyFXSSsIddQXm5phbXxwx+Wj
	amLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=CUtuhwotTcUgfxDileQ4JAC48wEk/mlZ5pDz05j4+8k=;
	b=kfIk+uz3/x7mXDVxv876qUgbtyb6lw5bcEb3Iav5zf3gfwvzZa4ddzMvZKySMKcd2P
	q7ykKkoHrk7bm0BNtQmxT9eDSOAnzCS/PHdhRreqx53qS7pJ9USa0CImdtbzc8LknlKY
	IGWpWpvMAyx0qaGMaaFCPAkzIHH9XibdA7EpTs9bP2m3Md9ffEKVWdW56kq9VIPSKGIf
	0CoX9Y2AQMj0oeB50NgGcF4PRthwVEOBpV8DFF2YM8WQ8PKxbrKW4V3TZXjhRhaPlvTu
	RaXdXEr1M381iDMzCtrQQpSwcp/ipf88Ug7tytq+KN/7Z+NcSooOvNIKr+cAveGj+Gcq
	GYtw==
X-Gm-Message-State: AODbwcDEIa6KZrAKiF0pYOYDrZICsFuQqRq40e+OvzA/e7JZx9JrwnTj
	LiaZUTtMBIuw8Q==
X-Received: by 10.200.43.217 with SMTP id n25mr307105qtn.190.1494446771064;
	Wed, 10 May 2017 13:06:11 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	s190sm377398qkh.57.2017.05.10.13.06.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 May 2017 13:06:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org
Date: Wed, 10 May 2017 17:05:30 -0300
Message-Id: <20170510200535.13268-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170510200535.13268-1-f4bug@amsat.org>
References: <20170510200535.13268-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH 3/8] target/arm: optimize rev16() using extract
 op
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7ocu3JBAanVZ

Applied using Coccinelle script.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate-a64.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 24de30d92c..7ea130107e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4038,14 +4038,12 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     tcg_gen_andi_i64(tcg_tmp, tcg_rn, 0xffff);
     tcg_gen_bswap16_i64(tcg_rd, tcg_tmp);
 
-    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 16);
-    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
+    tcg_gen_extract_i64(tcg_tmp, tcg_rn, 16, 0xffff);
     tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
     tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 16, 16);
 
     if (sf) {
-        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
-        tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
+        tcg_gen_extract_i64(tcg_tmp, tcg_rn, 32, 0xffff);
         tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
         tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 32, 16);
 
-- 
2.11.0

