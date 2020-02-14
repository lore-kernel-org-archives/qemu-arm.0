Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2208739lfp;
        Fri, 14 Feb 2020 10:02:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqzqeoFOq/XqiCRx7/VVUuGXQ3vq5dhyGspX3bhU40VkBv5i2xJciZqg2oSA1Ruf+HPa+y0Q
X-Received: by 2002:a37:e317:: with SMTP id y23mr3701698qki.431.1581703326444;
        Fri, 14 Feb 2020 10:02:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581703326; cv=none;
        d=google.com; s=arc-20160816;
        b=Mz4ZdscocxtnGbZ32/VOeBI4E/aCtIbsbKMjJ+BCuRYLh1+swuL3MWQfATDS9OFMEj
         xeZZ9V5tz/rqWZrBwiZ46ifa82tXEbvQ0cVJ9FaqRWCN/pnRxd8vuHvbj3Q0U1jpGEB1
         oFiIFNu5t3b2avW4ZRbBlhVC0INmkH2zN7wSBNllBi1gjGzzItcQ+g1AE1GzE5pS4qkf
         gfPtWUcLynzYF7wl2O+UjAF8ItfFwuudRM2CwjDqZxhVieY2j0UjLuYZ6AV1xO4eYfIQ
         wvIWcZCXHjK8GsSiOSgUlgNj8j3I75SK56T/HAWu6gwV54MoBky5GS9HxOXDmna69BIi
         RyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5mQrhAitCaw5RJP1dOPrlxLmDz4jgnDL2MRmgAJnH5M=;
        b=U0Gf+tZh+yU1upBonoixbGxctsoSK4Y+ZvkEn/JfD2SVZjM4E0Rysd9rqgiBrBVNY4
         SN0ZKkXiXU14EJ3r23MgqVDqdG1b4M4y2sj39F6uRSfCulkI1BMYV2HXVn2X3vliRpMT
         J7PB57NrB4MIkqGB1KerKNzcBH8Ikoc57z+TCpgiGrjoAAYG4ne/WXrjl6p+kc4I2V9d
         4tJ9L01mu7k6dv7lHeHMNdC79iHlGC/2cyIFYdHrxMYaZ7BRkL4p7KEOMP1lOgyfu1Qt
         1P52o6M/KmglAkqC3LDp9iYT2+k2yIMNt0TQAhq/d50FkTrtPK67BHVopae8kG2Lw1ki
         MTYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mhVWUbZC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si3037391qtm.13.2020.02.14.10.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 10:02:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mhVWUbZC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2fHx-0008Tq-GM
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 13:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7w-00064x-Cp
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7u-0000ys-B9
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:43 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38307)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7u-0000ws-5c
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:42 -0500
Received: by mail-wr1-x444.google.com with SMTP id y17so11883074wrh.5
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5mQrhAitCaw5RJP1dOPrlxLmDz4jgnDL2MRmgAJnH5M=;
 b=mhVWUbZC1r417E2WBJRppYnXh+oa3UhaBZaPXQ2um10Xhq0mDR/gQIll9X5WyBzlyA
 jzGcm33iRJu6CIaab75gZ03feDNF9W8K393MpXCTzbcLdfXX+hhuSZpHxoROw2ffwufs
 7fzQQtXtXuKtSaVoJLOhpaZzQ9BrNlZW0C7PN0HV7n3sn3WZnZOUZaYyLSAq1MtCUQ90
 iFFlmy7l/Fu82NEDs6qN3vlDB1RHw7/Pf2m+sm4oZZx1fE0Szpp09uoMmhpHaLG/hHZD
 cz5HvdcAcehr74vmH+TXhtzgrXkKq9wjUU2jZA+VzlKn6Ozxi9MSssUJb54/ZVeR9+Ex
 03wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5mQrhAitCaw5RJP1dOPrlxLmDz4jgnDL2MRmgAJnH5M=;
 b=Gg0x/it0PRxV+soxnISmWYxIkeXtMyIZbitzJ2B9l84mRGZvai4tsg0ZXVtU1ZD8pX
 viuRmVjp7xE5piIpyJDz9Q9vIlV3gOCOiZL7QKqJWNW2h4XaPuOW791scpIzUBoK4Vjn
 A7CEIOTvuJPxnfZrC2oFnnQ3RVF4CcdqyWKhRhjceXiYSyyFkYMuZyTdHIhfimBd1+Rb
 68tD0NA8sK/RcCcsXqC/kl8GHKKvtNPxlSv3D2wbmkpyogKMoR4mv6U3QsnWtMrbzwAX
 WwdyyadDPyPXihz7n5HJR67LbanjbF5gA1MVEENbnf+G2ZiXRoIg3BMzF+1+xg+j4EoJ
 kbfw==
X-Gm-Message-State: APjAAAW0bcAQ6KTXQZjt/rgmVlvc9rJmeMylN3LK4sekNstKbHVaNp/t
 IeNCQKWaJsBF888+TkYEyd47i+2KTtI=
X-Received: by 2002:a5d:474b:: with SMTP id o11mr5342789wrs.255.1581702701013; 
 Fri, 14 Feb 2020 09:51:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 16/21] target/arm: Correct definition of PMCRDP
Date: Fri, 14 Feb 2020 17:51:11 +0000
Message-Id: <20200214175116.9164-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jdNCtZzILFLX

The PMCR_EL0.DP bit is bit 5, which is 0x20, not 0x10.  0x10 is 'X'.
Correct our #define of PMCRDP and add the missing PMCRX.

We do have the correct behaviour for handling the DP bit being
set, so this fixes a guest-visible bug.

Fixes: 033614c47de
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2feded1518c..2ebfa6c6545 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1017,7 +1017,8 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 #define PMCRN_MASK  0xf800
 #define PMCRN_SHIFT 11
 #define PMCRLC  0x40
-#define PMCRDP  0x10
+#define PMCRDP  0x20
+#define PMCRX   0x10
 #define PMCRD   0x8
 #define PMCRC   0x4
 #define PMCRP   0x2
-- 
2.20.1

