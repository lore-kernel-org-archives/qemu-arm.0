Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1151796ejb;
        Fri, 16 Feb 2024 03:05:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcHnHCIjNirj1yB8Ux9PZjq8E0sTZ5aPb7PqlzOqMBOrHRLfP29n9J8A8R88gLOx6RlBsxZvYAk8QSkBJXKMRJAZ/Mgo9a
X-Google-Smtp-Source: AGHT+IFoDMFXlEUD5Tf4URaErQtBKBufWHwPCeJjlv8rJRB7nMVfp1WvUc2NemKSYh/uHhZp3I9o
X-Received: by 2002:a05:620a:12c1:b0:785:530d:14c6 with SMTP id e1-20020a05620a12c100b00785530d14c6mr11160700qkl.15.1708081519839;
        Fri, 16 Feb 2024 03:05:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081519; cv=none;
        d=google.com; s=arc-20160816;
        b=q/WY/3dgyY1yOL1jltUbRPxhH4O9nnbxIVZcV4tlnNFULwHd98xlXCtZ4S7Ty5TUIj
         Mw74OyAlN4wMQODq3eAKE7Jan61pcBxPoP+YAGmWYiF3kbFmuUrquNE6Un9hm60EhvHp
         kf/ESVVPSxFsuL8pW/Yo7m6GLIt4VjFTUiQos9ltOvOU7IABtyL8fhGtREr0L1toS+sk
         vAcyJ66oweDCa7SBpqWCzJFSrFf4rnYI3cG57hs9hcFSXUQftWajUnUpQrgjV7IteP3L
         KaHtAG+c9G3ET+a2kFU5QeexKqKczLBJQjWdmGdXlwUMqbdtB6KNICnWbXoVsS0h9PgL
         4Qiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NuItVagnX21LnnaFpIrCDiEh6nnybH9GKoEtwiotckg=;
        fh=MYr+tyZZlCa/Q0qkt125rkFGddyr3/nqWgQD3VNiOug=;
        b=T41yDpMeFd70dAZ2K7aDxaL+PVhRml3TvpHga6btZQuJC9U45LcLgjbEN4i3BLH8Sh
         SsMeRdagnE+D5t9RM4hYL5UvNDykoiaJD34dOMJGy6w3iyUz5aMRiwqxVcrWTaA3zob/
         fWDmrOjg4aXiUtMpYx+7T+yOSfKsB5EJsus8X3x0k5RnyuY8319dprBBGCNP44XGKPjJ
         XCngfXirag9hNyQzDuC2+tifl0Wej1JiOV3fiEV9DeqZNBI6NsU0oDHR44SII/sY9O2D
         M3cf11DhCiidvLCzVr+iI58BIPWpJq2Fv5llTxZu6URFrZiXnRUm+HJOOojwco1bBhCH
         6B/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNIr7y0E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sq5-20020a05620a4ac500b00785d52d1bd0si3504855qkn.785.2024.02.16.03.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNIr7y0E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raw0X-0006SR-AO; Fri, 16 Feb 2024 06:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw0W-0006RM-63
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:03:52 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw0T-0000t0-Kw
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:03:51 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-411d3c75026so14844195e9.0
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 03:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081428; x=1708686228; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NuItVagnX21LnnaFpIrCDiEh6nnybH9GKoEtwiotckg=;
 b=zNIr7y0EqNB2slVEoVD7JE/EWg79kDhOfze+vjPAGjuJ35R1MMLkDxzeIG9MuY2uTc
 teic7TqLhD7U17NYex5MxbWWKRrFY7mLll2gs18eQ5pdqS7v0IZjK4k8TuExWAyN1WYP
 ETooz96kVf67wAqZhv05YpAwLvvO3m8mRkWsXrb1Fll6N4/ISmgIsINOmYod0EHbmJvJ
 NI2JTpSHqi7DDFPc1+hnuylXIkr1dBEv3bqdc9IybqRfoMtGwKjIQcLII3Qo5Dy6hvih
 +jqIQAzq3wnKZkwCzefgEewZxjgxR2LZfedaGU/EDu+x52xWs9m8iPkpXEM/UqNteDio
 lEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081428; x=1708686228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NuItVagnX21LnnaFpIrCDiEh6nnybH9GKoEtwiotckg=;
 b=qRAgo9ZGj7O7CV519RHbPzhj/Yq89wncm3Mz+gQvyYXywXtFNVwdIbDTSmGdPSXuwX
 YdlIesPFo94xxgeJvfiQ2aVD/dLiKQYfDHjuEKa42yQTgRnSgQqB71wVm1NrK54ij2NF
 0MbSiF8xbjf9y126jy+yUEaBfv52bMYWcOKUqvXZ8ITTCtP6WPLWvhzn8TJr8+IcYSK9
 UfuOPdmZl9WSdxNXSGws9EGE1LiqV2jo5lgLmjek5+80d3JotG2b7TGG2Ett876NOzpc
 TKDY/8UZvd+lpd0AgyKECIxgS8qpOlUdkzV5fPptomRV0bx/4JefWOG32SrWi46dvdXe
 pTrg==
X-Gm-Message-State: AOJu0YyJPot2eOtCEiEo/95qxazv3Zbs6+JdYxOaYqb+9dcod1K0RM4n
 2G4aGCWp85XrQJpKfB+aBonJQcjNeFjpAeq2FJLSSrAhJFsC6uksJ5QmZ1M4Nzw=
X-Received: by 2002:adf:f34b:0:b0:33c:e1fc:65c5 with SMTP id
 e11-20020adff34b000000b0033ce1fc65c5mr3642680wrp.69.1708081428352; 
 Fri, 16 Feb 2024 03:03:48 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a5d5184000000b0033b4f82b301sm1942603wrv.3.2024.02.16.03.03.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:03:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>
Subject: [PATCH 05/21] hw/ppc/pnv_bmc: Use qdev_new() instead of QOM API
Date: Fri, 16 Feb 2024 12:02:56 +0100
Message-ID: <20240216110313.17039-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Jv1up2ZCqRHr

Prefer QDev API for QDev objects, avoid the underlying QOM layer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/pnv_bmc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
index 99f1e8d7f9..0c1274df21 100644
--- a/hw/ppc/pnv_bmc.c
+++ b/hw/ppc/pnv_bmc.c
@@ -269,13 +269,13 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
  */
 IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
 {
-    Object *obj;
+    DeviceState *dev;
 
-    obj = object_new(TYPE_IPMI_BMC_SIMULATOR);
-    qdev_realize(DEVICE(obj), NULL, &error_fatal);
-    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
+    dev = qdev_new(TYPE_IPMI_BMC_SIMULATOR);
+    qdev_realize(dev, NULL, &error_fatal);
+    pnv_bmc_set_pnor(IPMI_BMC(dev), pnor);
 
-    return IPMI_BMC(obj);
+    return IPMI_BMC(dev);
 }
 
 typedef struct ForeachArgs {
-- 
2.41.0

