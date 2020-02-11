Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5357247lfp;
        Tue, 11 Feb 2020 09:42:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqzDkToDzSVVuDenlqBDgGygYOHTBjx461NkaMw2qc87YNcTCTIFeYxpm6DemAKThz9FM2T+
X-Received: by 2002:ac8:7299:: with SMTP id v25mr16054712qto.128.1581442955763;
        Tue, 11 Feb 2020 09:42:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581442955; cv=none;
        d=google.com; s=arc-20160816;
        b=hLKMNFV1crgQdgCPpNfHmpHg44NoXuHWxGlkXi8uHUplWvnz+yw93UK5XIG3tLt/JH
         ll+zIT1qjsA4Zh8QXkI9eezAHpZ4a9exsq68rJdk9ndm2W8YNfuer+uvKqheGPpXlyqe
         QOB9Jj8nKV6fkPFXP9tW7ll/hvZleZB3XhS8p5yQdX2NesHlX/npMSvkZ6ht74miKExk
         9YtkX/A2mKE8fn5+hES3r+LsmgN6gZKICpfhHdyRbs0ZBX6yMfXvPS7qorW1bTwsCRp+
         WKsiE12cKm2nt2P/BnluDaJYtm3v/ckPJFYEjfKC6MFd1SKA+SCIWcAAfOdNaU3Lvmzv
         4CJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=io9bXmaa0QYPJVSqKww1B9uAPmBiSE1Ya1UcsX2Idyc=;
        b=CKdxQKB5OiYLc5+SNPe4Q3pGTfpu9nDmMMV/GXyuXi4VWAm7/0aINUjDYEsJIAclpw
         Ni7xkbn2WwTST/HhVVXZFrFGtO/dngKZqARtvjxTvFQ0wrVXCLAQHXPUWvRgIhmKVKvp
         /mClaHbpxrzViZnxeT5xygfnOc6Moov+ut7M8D7pqQfugNdRgQrSsNB7jJZLry3y57iE
         1aAeZEnwoxCuivCNnrb221bX6SDTM+2P5wJbjspetq2N1dcMvFZDcfVhkxn9shh6A8KO
         q1j7/goxhZ6k+fAloHvc+Qwx4SHUGiv1fqiXoV1bdRhqspZaPQI9CmXfhFpyZcLt8A3a
         2c2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KF4l/ywO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b190si2294320qkc.180.2020.02.11.09.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 09:42:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KF4l/ywO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1ZYR-0005Bv-4i
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 12:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZTm-0005pE-2J
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZTk-0004FZ-Hd
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:45 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37310)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1ZTk-0004D7-6P
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:44 -0500
Received: by mail-wr1-x443.google.com with SMTP id w15so13493809wru.4
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 09:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=io9bXmaa0QYPJVSqKww1B9uAPmBiSE1Ya1UcsX2Idyc=;
 b=KF4l/ywOty3YpZ9QhWVHm4Sgoe8AApE7/HUdf8rwM94OMyAIsDmZPQCljsjMX1RGJB
 q7M4nl/eyUh6A7za0tysFLuGiY5ukdRJ4UT88c/o53DSU2Nzv3T1Bn3EanNQiAoTME0x
 wumgYLi0fe5anD5kCHKZDX1lC8kXS/QHrs9dM6idCrqO2RO2cOvNaeYXNkF8hnEWdS3q
 K9n0GVu8QUEaEA8ulcfBI3iZEG8z1nYzG3VsWaow0cIT2f875WiaSF/oyBbUXy5eHxiL
 +jHr8jXqHF7EZsjO4CbElFuRzrhYnZ95aarphF0FElA6/YcIFbA6g02tKmVIocD02xIH
 PqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=io9bXmaa0QYPJVSqKww1B9uAPmBiSE1Ya1UcsX2Idyc=;
 b=PYY5ec0nr4KZoyMi2NsZm3PKYWjtMIC7twJ73/kpmFHM+aIeiroF+HUte2UoTYcrAv
 sivk3t04mfgBzc5/qig2GfYg4UgMPEAyFtrlDJMjXfX9sI9LEAqqPr5CzdmzNXNFjqB+
 lo0exsnPdlx/B6MWS9GhAg6hzxnpU0O1tv7wfcxKp2Lsqe14kY8PYDARTFApMS0GXEqy
 8rRKNuCMfD51vCmwmuD+ZLxXnNnq/GbZuHaVn1UMRikZ8dVVQxCVWmIaigj+MD83IQQn
 dENz12GE++bxNvX+fwb7qKhtCiaRlBoVu+nVZ6RWQKeaXSnk8+S8joTbUDYw9yoXIbE3
 kP9g==
X-Gm-Message-State: APjAAAWOrt+x71Q2y2yh4yyBctIH4y8aTLxo7demI4ButL9tXGO3lTY+
 ASje7SoFOzTzZeHNlB0AaNMj7muVbGc=
X-Received: by 2002:a5d:42c6:: with SMTP id t6mr9548904wrr.151.1581442662986; 
 Tue, 11 Feb 2020 09:37:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm6109675wrq.16.2020.02.11.09.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 09:37:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/13] target/arm: Provide ARMv8.4-PMU in '-cpu max'
Date: Tue, 11 Feb 2020 17:37:24 +0000
Message-Id: <20200211173726.22541-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200211173726.22541-1-peter.maydell@linaro.org>
References: <20200211173726.22541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sqbNCFkLqiOL

Set the ID register bits to provide ARMv8.4-PMU (and implicitly
also ARMv8.1-PMU) in the 'max' CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4b4b134ef84..5b8b7a9d4b8 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -693,6 +693,14 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
         cpu->isar.id_isar6 = u;
 
+        u = cpu->isar.id_aa64dfr0;
+        u = FIELD_DP32(u, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
+        cpu->isar.id_aa64dfr0 = u;
+
+        u = cpu->isar.id_dfr0;
+        u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+        cpu->isar.id_dfr0 = u;
+
         /*
          * FIXME: We do not yet support ARMv8.2-fp16 for AArch32 yet,
          * so do not set MVFR1.FPHP.  Strictly speaking this is not legal,
-- 
2.20.1

