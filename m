Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2405131wrq;
        Thu, 7 Jun 2018 11:07:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL+Gyi+/ih4chakZ+5WERlulfgoi4IKRM2zUXLNLAS1CCd4ly6v8WHmNa5HvBvg8glphOrH
X-Received: by 2002:ac8:503:: with SMTP id u3-v6mr2886175qtg.114.1528394870714;
        Thu, 07 Jun 2018 11:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528394870; cv=none;
        d=google.com; s=arc-20160816;
        b=pUAuv32t7cowlH2HaMxpew/azBlh4VsmPF8qcsnXQzQaD1gK7c3MS9jVknRhd3EK/k
         vtbS/GHQ4Q7PgNK5r57e48ik0ktHL5ZU1loxKpD9AF2oWCtqnWfQBAfuLcC4xp/mp/36
         kFMa07AIqb/u8lXG/bbNAg2XEEzi8WbMdVqSVh0ZlM1EAXIvvxCQJw8tN284LdjRT0Mj
         Yr//4t+EBozt2NcAZgaJrnRsmN0GaTWBFe+Vuk7M0VrV6GwA4LE6n0/2K2ILpzfKkWbV
         ZOrhWP1JkeuGszxL5BG8MkqZanGnHVi/KOAJAjdGAEpF8sgYEmD+Ba8VU/X/RZ6hB9WR
         1Iag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=p98FJDHXqtQFnoFIsChTFplRsIwsE6rDW5LxAt+70bk=;
        b=yiGZmY3cU0ttG1LtduTHv9g70h0xRaRED9Ta1n4sI0v8zIwC+Kzb4bfRXYNm3+TJ1x
         7UOWngUqXk0sxAZlRWluwmfCwSP8ZwUvRCysO/Oe9yR9wBGs/gMKRhbY6s9gpedRgeBm
         ThI5HPcffQtqAS38sY5cs9Wj0c3yE28Qz8SfcbehKR660Y3tXjMIfiVHNRTXQHxGmsa+
         v4NENtDhwmUjOvmXDwxQVCGiYstLxFPlEFA/YIvbpbe8FcP1jWXeJCIzB0Wu/I1PxTWT
         MiAkCBLtPzX6DZR5r2oDnEGTw246oa68uILDmLEqNwMfdRPJUwenCUwp2qOMNUL/0PdO
         yQSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eHKgHOD1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p23-v6si1388882qtf.216.2018.06.07.11.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 11:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eHKgHOD1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQzKA-0002JT-5N
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 14:07:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJS-00028a-QP
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 14:07:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJR-0004Uh-LR
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 14:07:06 -0400
Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d]:38214)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJR-0004U9-Fi; Thu, 07 Jun 2018 14:07:05 -0400
Received: by mail-qt0-x22d.google.com with SMTP id x34-v6so10792717qtk.5;
	Thu, 07 Jun 2018 11:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=p98FJDHXqtQFnoFIsChTFplRsIwsE6rDW5LxAt+70bk=;
	b=eHKgHOD1sFeaYlAO6ipnc86EjwDppKU1SaHdnK0PnxrhXneCQ+nls4p0gVvC1k+JKD
	H0fpSAl/EyujPkkm6rmdfZlmPj7PzEUMdNgy58w85NB/Cv71TsVCwxWYz9KmOhs6GKTa
	qpQaw3BLdeLvFLBrEcFvFSUjkfGAzuoEgGywKGE/0m0adBIocBprm9gCcLFlICIQldYz
	bDNWlBdXefBYqXFv4PTFtvgpPyGRStm6s5G7Tao7owIztSLCQ/XkI91ydD5fPupjGNQp
	jVCqH+YqUWP3wwGeGeckWwSkFVwCzqtGzCK5pqr0xr3kHEOE813nGRbjrL9IJtIWlpp1
	Blpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=p98FJDHXqtQFnoFIsChTFplRsIwsE6rDW5LxAt+70bk=;
	b=tdVM+8/mfluir7lhqbVXqAPWxWrEkz9LynAk4zKbBygK++DFAQBxFLsAg9SFProD6e
	FkvEJmxRKQHgbeQGYr5yuPaF6+kS7L9bhm4/8AmZGnNiBWW/zZHW3DBzfZIORvmqceLP
	xcnFUxsqJwJyUIyd+i7la22lQjoK4EdlY5PFUqLF1N78FXEG3dHUcyNXHhHbWhILdQoC
	YRabtoOBYq2l/QM/jy01UbvoEZ9gzx9U2MFry83x12jHT+Dn894xZ5PEwDM5TOYOiF2E
	BMXE6kwSB44UY1+oj59veY+EBomb26OGFXb1aJkb2U4TO6OXJWEUi5cSv3LvVTJiGQcX
	7gVg==
X-Gm-Message-State: APt69E2LLNKKfKqGMmHj7AEvxY+CR/RpY/DdYwth5A03h1UC4xX/bXNf
	5dzxe6bT9Q7xYi1TJCMvu9g=
X-Received: by 2002:ac8:358a:: with SMTP id
	k10-v6mr2752341qtb.248.1528394825013; 
	Thu, 07 Jun 2018 11:07:05 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s15-v6sm26838414qtc.81.2018.06.07.11.07.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 11:07:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  7 Jun 2018 15:06:39 -0300
Message-Id: <20180607180641.874-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180607180641.874-1-f4bug@amsat.org>
References: <20180607180641.874-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22d
Subject: [Qemu-devel] [PATCH v2 5/7] sdcard: Reflect when the Spec v3 is
 supported in the Config Register (SCR)
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dgvoM1eLadX6

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/sd/sd.h | 1 +
 hw/sd/sd.c         | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 7c6ad3c8f1..b865aafc33 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -57,6 +57,7 @@
 enum SDPhySpecificationVersion {
     SD_PHY_SPECv1_10_VERS     = 1,
     SD_PHY_SPECv2_00_VERS     = 2,
+    SD_PHY_SPECv3_01_VERS     = 3,
 };
 
 typedef enum {
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 3ec0f71f24..4e49a3827a 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -316,11 +316,14 @@ static void sd_set_scr(SDState *sd)
     if (sd->spec_version == SD_PHY_SPECv1_10_VERS) {
         sd->scr[0] |= 1;        /* Spec Version 1.10 */
     } else {
-        sd->scr[0] |= 2;        /* Spec Version 2.00 */
+        sd->scr[0] |= 2;        /* Spec Version 2.00 or Version 3.0X */
     }
     sd->scr[1] = (2 << 4)       /* SDSC Card (Security Version 1.01) */
                  | 0b0101;      /* 1-bit or 4-bit width bus modes */
     sd->scr[2] = 0x00;          /* Extended Security is not supported. */
+    if (sd->spec_version >= SD_PHY_SPECv3_01_VERS) {
+        sd->scr[2] |= 1 << 7;   /* Spec Version 3.0X */
+    }
     sd->scr[3] = 0x00;
     /* reserved for manufacturer usage */
     sd->scr[4] = 0x00;
@@ -2068,7 +2071,7 @@ static void sd_realize(DeviceState *dev, Error **errp)
 
     switch (sd->spec_version) {
     case SD_PHY_SPECv1_10_VERS
-     ... SD_PHY_SPECv2_00_VERS:
+     ... SD_PHY_SPECv3_01_VERS:
         break;
     default:
         error_setg(errp, "Invalid SD card Spec version: %u", sd->spec_version);
-- 
2.17.1

