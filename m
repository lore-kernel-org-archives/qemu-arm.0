Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp738830lfq;
        Fri, 8 Jan 2021 10:56:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFpwne9BMGU0nwhhW6U0tADyx5gTEce+VMrY22yOWpC/9vJ56qF++4L1By6OyeK4WYIkrj
X-Received: by 2002:a25:3ac3:: with SMTP id h186mr6891926yba.155.1610132166932;
        Fri, 08 Jan 2021 10:56:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610132166; cv=none;
        d=google.com; s=arc-20160816;
        b=QWuQ1mpFzMLLOpFt/hBBfWN+Ns4kD7lUkCQjM7mfL0gA2JgW1syFfKZi81umPrkcgf
         HyO0pH9Nk3W6RmoiZ08khtiiEN6x/raP0yG4xCdHnm5XOuEbyJGDvwGULCBL9ezdlYSQ
         wlIBx3TK46e4lq7oNijRNRal1DvQWJmF58uzzLsu42hQBDkHf5zuDGVDtY+o0ZUgWb5l
         8rFN0IPFa1PQzGdF3Epw/DSEiwgEkUnbmJ9uNamQnE8kc3xTIteYtll5GlLWGY4TapHD
         sLj2x4N5hwdAzTfQyqh52j8x886YIDOS5ySl6U+1bM4rnzusrsKhGTVF+HkP4eMR7cpF
         Akzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=puA6/puXorIWl8XVvGX9+7qdGtTAWfovzDg6hzeCqzU=;
        b=ffedrKgDE0UwkvnhWq7Xp+28wq9dMJ7FHBLxJDvWcimBmagHeRxmexP1V0YM+CCuqh
         yyeCpQTHf/e2cVSOtN7VFLXI5FbDRR/Nv97XyIODdUrHXyT60wCwtmOz1szybDvsIWID
         QpZ+5DVMheohKtg4Hh0mS0oLEE/OPa9dGSvdlNLcb8nQdEDy3Hh7Uy2oUxnkOzeExvgu
         N+kDvSM5ZE/Ui/ibyCRK8CXstEgBk/gdqKKtK5JbztWJdCb4q4uWJ1+/MehbFT1eCodz
         oXR//QXdfPw5q5m+vRFe4DzcP0abrJ1SjpdxLKlewrfUNx9Lw7vc/JeRYxFMLtDnBUil
         91yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=e+Y85H6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13si10523957ybm.455.2021.01.08.10.56.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 10:56:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=e+Y85H6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxwve-00087h-9z
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 13:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwri-00026d-3F
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:52:02 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrg-0000tw-Im
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:52:01 -0500
Received: by mail-wr1-x431.google.com with SMTP id r7so9956210wrc.5
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 10:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=puA6/puXorIWl8XVvGX9+7qdGtTAWfovzDg6hzeCqzU=;
 b=e+Y85H6iaUqPYHcxfNj7Djbm2xfNZwQsFBtoS82ht05TZkYZXVOO8TDYK6/day16BG
 k9mfawz3IrR9ymxLsklYsJgJWy/U0+1DK455mnAQYNgmqgyGlCgGjwkIho53xzEIWnsE
 Wkm5ow5ImbRAUwaMgQzNC3PvzWysDAn9LNe909u+IITIdnX1OokLEkO0vFDoZEZ4Qfji
 OQbm+sOKEQ8rpyfEanmoNlW3Jol/uS7Ngkrbt6TKWDzjXt6F3O6wABPTcfMNSH0hPXqp
 Lw6ulIesFrTm5yymV8pUJgZ5VZT2MG55UscNpivESY1IkTi4fKf1ifSU4DOtEpU5AuGp
 vpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=puA6/puXorIWl8XVvGX9+7qdGtTAWfovzDg6hzeCqzU=;
 b=iI1nnkIuEwUq2t4Zweha7sbWOwaHeLZtrLKw+NSpz14zME0BsmR7S3dHwEx97zkobp
 TfihAVWLP0Djn7NKPH4TMmrv2uaYOPy1ZY2xs5KxK5F+aVdpIm0mj+/5QYtPhY0z6dAW
 72frg49Rl4+VbyZ1ZF1rUlhX/kesSqtLY72P+67HUP4y9LxVysV5/uXzqJBSb5SEpMvi
 9YnuldqtT9yOW/pJFzpIqGTeidoxYl9hPTku+cgVAa1HDsiFXgmVGL3QXlrNPdlmRFTN
 TnvuvfX/rIxonKK7bFugOHUjov4ik1UniJJAh1aikiyGkjHItdNuym1ry+uAi3vZjrsQ
 iANQ==
X-Gm-Message-State: AOAM5320dk9gh8K5sApmEUxjLUsMoSKYmHplDizZpKwfURMLq5UldUdQ
 nqdmEpWiwA3mi9A0yD8iAYro7A==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr4970661wru.64.1610131919324;
 Fri, 08 Jan 2021 10:51:59 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:51:58 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1,
 CTR_EL0 to cpu.h
Date: Fri,  8 Jan 2021 18:51:52 +0000
Message-Id: <20210108185154.8108-5-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
References: <20210108185154.8108-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cLxoGdujVWaa

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 063228de2a..18c1cb02bb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1736,6 +1736,37 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
 /*
  * System register ID fields.
  */
+FIELD(CLIDR_EL1, CTYPE1, 0, 3)
+FIELD(CLIDR_EL1, CTYPE2, 3, 3)
+FIELD(CLIDR_EL1, CTYPE3, 6, 3)
+FIELD(CLIDR_EL1, CTYPE4, 9, 3)
+FIELD(CLIDR_EL1, CTYPE5, 12, 3)
+FIELD(CLIDR_EL1, CTYPE6, 15, 3)
+FIELD(CLIDR_EL1, CTYPE7, 18, 3)
+FIELD(CLIDR_EL1, LOUIS, 21, 3)
+FIELD(CLIDR_EL1, LOC, 24, 3)
+FIELD(CLIDR_EL1, LOUU, 27, 3)
+FIELD(CLIDR_EL1, ICB, 30, 3)
+
+/* When FEAT_CCIDX is implemented */
+FIELD(CCSIDR_EL1, CCIDX_LINESIZE, 0, 3)
+FIELD(CCSIDR_EL1, CCIDX_ASSOCIATIVITY, 3, 21)
+FIELD(CCSIDR_EL1, CCIDX_NUMSETS, 32, 24)
+
+/* When FEAT_CCIDX is not implemented */
+FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
+FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 10)
+FIELD(CCSIDR_EL1, NUMSETS, 13, 15)
+
+FIELD(CTR_EL0,  IMINLINE, 0, 4)
+FIELD(CTR_EL0,  L1IP, 14, 2)
+FIELD(CTR_EL0,  DMINLINE, 16, 4)
+FIELD(CTR_EL0,  ERG, 20, 4)
+FIELD(CTR_EL0,  CWG, 24, 4)
+FIELD(CTR_EL0,  IDC, 28, 1)
+FIELD(CTR_EL0,  DIC, 29, 1)
+FIELD(CTR_EL0,  TMINLINE, 32, 6)
+
 FIELD(MIDR_EL1, REVISION, 0, 4)
 FIELD(MIDR_EL1, PARTNUM, 4, 12)
 FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
-- 
2.20.1

