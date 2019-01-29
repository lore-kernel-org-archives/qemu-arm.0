Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4490936wrt;
        Tue, 29 Jan 2019 06:04:57 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4iy5h5ZfZVTII6u+RHeOSRjwG0h4Hck82diDjcS8CCbaB+PkSO2FfSJarifMHoH7twI2df
X-Received: by 2002:a5b:3ca:: with SMTP id t10mr24399202ybp.304.1548770697324;
        Tue, 29 Jan 2019 06:04:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548770697; cv=none;
        d=google.com; s=arc-20160816;
        b=U+kGvhsSXwSd7Ma3gdqvrqEIkc4/QpdEvlgqSp9T/cDzwX0SjUfRvzGCXKldCzGA2i
         1VR+JlPUrRqGp2EakA0DCfqNVJmOeDn0sVF8iZdOTo1VMlCI6kZxL1e4eY7L62+fZj5j
         C3taXXWNulApLiA18xDRs4Wpx9dpBNGzJXKh+vJDlSrNpZ6sIStll0ASTOStAZrmLJIK
         VWcYLxvY4Wb5R9EmFYE4ikYEhXRx5vgQxpUiGjr+jLyMaY5eBz1Ld2jcJ71PTkAwT6ni
         2yU3plB4GQ29wiUVsv3rtIMJxLbyKXxkA8hDI+D5HJcu1OIyI7BI1NLtD35JIk1lM9Fp
         mnWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=b16gPjOm37PXIDeysu8Z+J6YDD/flIUhAejAbwkSsqk=;
        b=dfNPV/gN5iL95dfgE3nngjvipX2s/8bvqrikG8rPh46Z8rK586OEB/n58B+oqcAM3S
         miJ4jRWlGWYOt8awdwKrNnHPRHhDJAZBTNRr5EMjrxmDO73ci33fhCNa1geIo0PJHhjn
         KWfuZOLDgKSs6rZuboJyoeNZT7Ymviu2EffyFlBsoi5ZcirfUpxpycyRz0R15SIxtS7q
         YfG/nbwiJJqAlw8icjCJ+Nat2k0FbTImBbPXMcZ8yp7CIi1fqPRTyy0r77IL/KlJkcIc
         jiGiIOxRvxeTLtCAPEkVoYCpGY3WNsBZnz1i2fJjnMAMz2oTu3IWv8EdqTI6ivgLCXzz
         65Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R4G29lvB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si18890951ybj.351.2019.01.29.06.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 06:04:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R4G29lvB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50129 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goU0W-0004f7-Kj
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 09:04:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goU06-0004c0-KH
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:04:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goTzy-00009j-RD
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:04:24 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51143)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1goTzv-0008TJ-FO
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:04:21 -0500
Received: by mail-wm1-x341.google.com with SMTP id n190so18008747wmd.0
	for <qemu-arm@nongnu.org>; Tue, 29 Jan 2019 06:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=b16gPjOm37PXIDeysu8Z+J6YDD/flIUhAejAbwkSsqk=;
	b=R4G29lvB3fs3OrjkbH5WdzBLUUyFWsaDZ23LvbmiOdVYcozAO+95sVUfsZkKjMWAb2
	uvjt9OIfvkI89WBRTM2g0sX7jvABjAZVL9Awnv2ymFtS2KmFirq7iEb39hDTjP8aySnz
	75VdudNsAJSkP7IS4Wl4xb6OzWwvGR3bYPq0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b16gPjOm37PXIDeysu8Z+J6YDD/flIUhAejAbwkSsqk=;
	b=fdRlmdQTrZRKlUFS2Mn0AeGat23Ve9b24LssZLr5EvB3AuTQjlGBIXEbKEl5Epo1gV
	H+rCO34/rDioZ7muA2rSwSKQqHYQHKMl//MVZYzh0O/+60MUw8Rut23FwhaoRrrVkN6V
	fZngJ/gi73pxiF7x4AnfjWcvLOicewCHmOetsgnLFDq+SPbxfS4cOh6W3pFE2yWXGLkA
	Of/Z6JBR3WPmHGf4yzElC1wrv9lbkoxSrDaNOqtP6MNEmbuHFvuLm9kvJXu9qgrZ90rx
	JXR26oazfN5z4juz63xMRJtw2Qe7apnwKax0kuKmr+QXRAM5xI/cdjQLrKuaLaa14O2M
	jmNQ==
X-Gm-Message-State: AJcUukczA9iGNqNnPEZLby143cJNZ7/JkzmcgIE/YrB4ydJr5oW/s9qg
	6q7j8zLxSLZ2MdPKCthSizsNJ57Q170Tng==
X-Received: by 2002:a1c:e910:: with SMTP id q16mr20266474wmc.68.1548770656474; 
	Tue, 29 Jan 2019 06:04:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	w80sm3876678wme.38.2019.01.29.06.04.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 06:04:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 29 Jan 2019 14:04:11 +0000
Message-Id: <20190129140411.682-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190129140411.682-1-peter.maydell@linaro.org>
References: <20190129140411.682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH 2/2] target/arm/translate-a64: Fix mishandling of
 size in FCMLA decode
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6orV8BT5H9bY

In disas_simd_indexed(), for the case of "complex fp", each indexable
element is a complex pair, so the total size is twice that indicated
in the 'size' field in the encoding. We were trying to do this
"double the size" operation with a left shift by 1, but this is
incorrect because the 'size' field is a MO_8/MO_16/MO_32/MO_64
value, and doubling the size should be done by a simple increment.

This meant we were mishandling FCMLA (by element) of values where
the real and imaginary parts are 32-bit floats, and would incorrectly
UNDEF this encoding. (No other insns take this code path, and for
16-bit floats it happens that 1 << 1 and 1 + 1 are both the same).

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a7b999d2b5a..06418f0ac3c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12680,7 +12680,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
 
     case 2: /* complex fp */
         /* Each indexable element is a complex pair.  */
-        size <<= 1;
+        size += 1;
         switch (size) {
         case MO_32:
             if (h && !is_q) {
-- 
2.20.1

