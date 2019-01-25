Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp616446wrt;
        Fri, 25 Jan 2019 10:27:27 -0800 (PST)
X-Google-Smtp-Source: ALg8bN41bC/WgzU/dc2mLLhlVW5u0WDiKZ9qfDUBd5Os0VYbnZpVVTI5ztMdd8PJ5E6Q4kTbnQ2Z
X-Received: by 2002:a5d:45d0:: with SMTP id b16mr11997374wrs.86.1548440847242;
        Fri, 25 Jan 2019 10:27:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548440847; cv=none;
        d=google.com; s=arc-20160816;
        b=fvozVOgyqoPRKEveHJ8z8sMnWoj0yWKuqaK4z0Nt7zcQ57Wx+6Dtm9cI4wsyTfaWNo
         QZkpKyGIQUGoUD9GRtdCKSs6hRdWi7UTMoDhOanRHhykdDJy+n7Jbylaoil2zoezRa39
         9QM+wvo/c3e8oD1ND22cjjdh3VcaAc9kreIV9n/ySTj08m7mHspFPQ9hlSjXQEHu3e3K
         YUNYARVlkxU8xWVbwX+UBTdkA5s/O4BvPHwEAferT4XW5y5Rz6cyaNJV+uMdz/UThnfp
         FJ7blk5ydUqayECnQUDlopKYF97OqxhZfMJ0Myu4nq4eTTO9Wte1W+xtFORLVihbqIMy
         3Dzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=mPazcmGG1PcX/ZPAULBWKJ42pMvpB+sfJKcCkrgpfpM=;
        b=LZO9RCMoy9D6h2sJJpxTZmeXSRb6JUwYeO69JIlal0wJknrS2ewWZjkLO+9nfiMc/e
         zdmHaz6b0wUOPgSQFTvXjssvXJx8ez8YsRr76zLsC4Y7nbs8/aX2Mfyu3XZzuRRHhNUI
         HwTsoy5CqXeC/RHPr7jN+Jiz0D2OdYNAYReUP+0TvsD4gVjS0wMdoOkVlkUoq0gI5fK3
         JWQCzuc7RHFmNO2cxBLPmq/mbcAvl4NEw4zoEoQwHYw42BpHQXnepenOd+qCqba+l0gf
         UBhn4F+mko9lOcar1TM15vxe2l7USf71rMx3m63b+X2Ifxhnx+dPgB0H8J+teQkbYf5U
         cbkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hbeztnB6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12si80288490wri.216.2019.01.25.10.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 10:27:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hbeztnB6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gn6CM-0004ew-9r
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 13:27:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bk-0004Jy-9t
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bi-0002dp-F1
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:48 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41817)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gn6Bi-0002Y6-3z
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:46 -0500
Received: by mail-wr1-x444.google.com with SMTP id x10so11308049wrs.8
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 10:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mPazcmGG1PcX/ZPAULBWKJ42pMvpB+sfJKcCkrgpfpM=;
	b=hbeztnB6zuDp7b1IxHGnf/D5cNn38PsRVQYS+PMAM5CrHYEXqEldPzTai2OEcDD9Lv
	dwa6+eEZtwhW/IyPKGvodqICSLbnNB5pfoavAYrrkejPUcn8k8Jzum3+PuLr3nfj1gp4
	owotCIM1j9SEx5ZqoStnPpx6kfV5n3MS/HhuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mPazcmGG1PcX/ZPAULBWKJ42pMvpB+sfJKcCkrgpfpM=;
	b=Z0jB2bRcPEOUigSJGP5AgAs+p4RDnkngJz5IxH4bOGW3ScsfegfTku3LZ1wl9/Pm3M
	eb+mGDlKvnYNNoWccFf147Gnaf2rOYejNqmPb3MFo467TksRwE5oU+kEHFxufTaESGWf
	6C/tOYlCLZWKShqlnVYRsTwtvflBmSR0c7ECDVZyJG08eh7vYmtchUmyTPdK/tFYpRGC
	n8DkRJFHhR0Wh/07UMtt6upx9H42HPPGF2h7G7rC9wJYzpEf4O27mhB/rdSa87N4zrhI
	QKNGWWkGeSR9rPHCWv/yCaD7l942QQUZqHO3uCNrb0f5wHJg9ewcxTy0oSXgYtAts5Hr
	TNnw==
X-Gm-Message-State: AJcUukcG1f7pPkCmFsWQA7JDWbJ7U0kEAX3zLq/6V1oBnkVsDv52+yJQ
	PfHYS5u5cdSr1E6Vctkc/3wYE7vzjY4rkA==
X-Received: by 2002:adf:b595:: with SMTP id c21mr11967853wre.125.1548440797167;
	Fri, 25 Jan 2019 10:26:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	t5sm45014921wmg.43.2019.01.25.10.26.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 10:26:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 25 Jan 2019 18:26:26 +0000
Message-Id: <20190125182626.9221-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190125182626.9221-1-peter.maydell@linaro.org>
References: <20190125182626.9221-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 7/7] target/arm/translate-a64: Don't underdecode
 SDOT and UDOT
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
X-TUID: dPU+urgCSWrv

In the AdvSIMD scalar x indexed element and vector x indexed element
encoding group, the SDOT and UDOT instructions are vector only,
and their opcode is unallocated in the scalar group. Correctly
UNDEF this unallocated encoding.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 474d9bfb5f0..30bc2412fc0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12641,7 +12641,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         break;
     case 0x0e: /* SDOT */
     case 0x1e: /* UDOT */
-        if (size != MO_32 || !dc_isar_feature(aa64_dp, s)) {
+        if (is_scalar || size != MO_32 || !dc_isar_feature(aa64_dp, s)) {
             unallocated_encoding(s);
             return;
         }
-- 
2.20.1

