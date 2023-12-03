Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2330544ejb;
        Sun, 3 Dec 2023 13:37:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXHBdpHQDaKMgvfVGBlHIyxsnMCTfk6rEQfuDtyaRzqLMOivONUu1YN50FVKmwA40XWUk3
X-Received: by 2002:a05:622a:188f:b0:418:fab:2d31 with SMTP id v15-20020a05622a188f00b004180fab2d31mr5010191qtc.4.1701639450676;
        Sun, 03 Dec 2023 13:37:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701639450; cv=none;
        d=google.com; s=arc-20160816;
        b=QEJ+C7CqlzyFVMcTVmB3Yb3T385KjhmBN7Knzgdx1pYUDOa9VHTGEyhWAKdHmfYDMo
         uLTksj+bzKjeTbOh3DCcIRcWUq0b8K7j6iEpNVfPqJs/r0tcbWZXWZxPhT949o3KI3a3
         OEyNHYAdqgl4E8R4kGpaEq60SW8a0Q5VhC9dB5pieA+9XRaSjhZ2QvKVrvl4QP7lbkoR
         zcanVO26Gl3XHa5L7LaUPibETXWijQVfdv9IY67axhWYyT0K1BgB8oEvrjiwuekhzt1l
         tnjVx/GNevfiyXJNftUHNbzlcYI5yAQjegoKtrM7cxg1KLo7BesxCw9Yid4vggwba2nn
         kSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UfD0K0aibjreKo4OGd+o7D2cWSxh06lmc6TQmHfOTns=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=vhMo+MZuax8frmePtbjCOAMey8DpnMsInDbKso11BQLSEl5sKn0pX2v0P8e58HDFXt
         yiFrVDp4wAAwIJClNtB393TkvOH735cPgVe2lX8eUm6MA384nvIAZItA9nEatnslGlp4
         L6ST9c+NYhIyg1xk3evvAuVuNf2k9QExT4IYaH9hmHL4UorVW4OT8b46DPhx4v8yxAm1
         fdQWIaFoSG77FC+cWayvtoQOrkDL5oUzEm3glRKWjUMP251SrU0CYzEB0rein3/YnA0L
         chtFHGrUhpq5hbqbmn7Yx65Cvi4S0qoR4PC/uSMcT0NArKPYB05k2AbJYWXekp9lQD3j
         EIcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OBNaZe72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey18-20020a05622a4c1200b00423b7f653cesi8691643qtb.163.2023.12.03.13.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 13:37:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OBNaZe72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9u2D-0001wL-KJ; Sun, 03 Dec 2023 16:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9u1m-0001R8-Vx; Sun, 03 Dec 2023 16:29:27 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9u1h-0005Ps-7M; Sun, 03 Dec 2023 16:29:26 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5d3d5b10197so28732387b3.2; 
 Sun, 03 Dec 2023 13:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701638959; x=1702243759; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UfD0K0aibjreKo4OGd+o7D2cWSxh06lmc6TQmHfOTns=;
 b=OBNaZe721Zqn1RZ/WAfuLoVS2yDbJSfOhkcLdmCc2qNqvePgw1VjsjD0IwQle7FXBY
 Ct/bBbfFIy9O3geGiMJdW4SMBoJ4lcXWVVLrUn88oqSNusqNCpxfCfIpP+iJLiy6kLL0
 1W7PP7iQ9xN4HJn7ptpUQWPrQgs7Lg27Ohg9YmH8wT7q4Oi6GnzPelh39/fpnEOWoXi3
 T78O8eaS9764jMS3kOByHl/5kKlO5QejEDVhB2gksBBZ1DF1+LfI6KqleIwGtS1iNTbo
 3SgxVJ8kK+WtLEVi/5v4A3LPZx4Y75peWobl1l76YjEsho9/UJziZ7DI7J8/TqPxWLgM
 LpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701638959; x=1702243759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UfD0K0aibjreKo4OGd+o7D2cWSxh06lmc6TQmHfOTns=;
 b=uMXZJaT4CvmgrJCuqfvw3CvqumAekRaejJidrnyJlRf+EewpHzKwYqmuYo9v7kphAN
 tuki0R8gx6FsDtBag5K0nBouqp/G4z2ItpGDWN9dHM2u/A2nw55fcBtx4pUl8f/yulDO
 fQAXNFdkwsBJRFCRA8/ReBB7jBZFm6jJQoblpnWxBGnw8cSKrTg9XJYP1z5IGC9eonLL
 CwQW1M8vv95m9HAh7Ub9GgzRqZEXKDB3djWH0zlPfQdXU55IBiKIT+zWFgaNkKckq1TS
 R378U9Weras1XNLDnQTresoSyrHDKZPTlXJk78VHdlu1WCJ7kNpgnR2uAVZXqqj9bzOF
 HcrA==
X-Gm-Message-State: AOJu0YziUAdK/IuvdBaUjrOA4SuCLlrIdyQziYMqCnj73uor6LRMcpnp
 29uuR5E/SmK6idLe8hgHyHA9D3UNZxmI+A==
X-Received: by 2002:a25:8446:0:b0:db5:4586:c210 with SMTP id
 r6-20020a258446000000b00db54586c210mr1688355ybm.16.1701638959624; 
 Sun, 03 Dec 2023 13:29:19 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a25a291000000b00d9cc606c78csm1807318ybi.41.2023.12.03.13.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 13:29:19 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 10/45] Add BCM2838 checkpoint support
Date: Sun,  3 Dec 2023 15:28:30 -0600
Message-Id: <20231203212905.1364036-11-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231203212905.1364036-10-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20231203212905.1364036-1-sergey.kambalin@auriga.com>
 <20231203212905.1364036-2-sergey.kambalin@auriga.com>
 <20231203212905.1364036-3-sergey.kambalin@auriga.com>
 <20231203212905.1364036-4-sergey.kambalin@auriga.com>
 <20231203212905.1364036-5-sergey.kambalin@auriga.com>
 <20231203212905.1364036-6-sergey.kambalin@auriga.com>
 <20231203212905.1364036-7-sergey.kambalin@auriga.com>
 <20231203212905.1364036-8-sergey.kambalin@auriga.com>
 <20231203212905.1364036-9-sergey.kambalin@auriga.com>
 <20231203212905.1364036-10-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: J8b2ntiJHbYe

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index c147b6e453..196fb890a2 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -22,7 +22,7 @@ static void bcm2838_peripherals_init(Object *obj)
 {
     BCM2838PeripheralState *s = BCM2838_PERIPHERALS(obj);
     BCM2838PeripheralClass *bc = BCM2838_PERIPHERALS_GET_CLASS(obj);
-    RaspiPeripheralBaseState *s_base = RASPI_PERIPHERALS_BASE(obj);
+    BCMSocPeripheralBaseState *s_base = BCM_SOC_PERIPHERALS_BASE(obj);
 
     /* Lower memory region for peripheral devices (exported to the Soc) */
     memory_region_init(&s->peri_low_mr, obj, "bcm2838-peripherals",
-- 
2.34.1

