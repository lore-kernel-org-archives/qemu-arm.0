Received: by 2002:a05:7022:fd0c:b0:75:a5e6:4add with SMTP id up12csp192290dlb;
        Fri, 16 Feb 2024 03:04:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUmopf32TkRhIkaBKPyHnzKVu74xbMl9l8bWIEl5q+MVSgOwa8pgeQlLIwkHyTDDAsgI4s0e4FxDaxBxvIUMr8l+j9Ai8kk
X-Google-Smtp-Source: AGHT+IHQPUmfDWNzq0KPUzNTdUEmpY+bif/nZHb1aNLKJGi0kGkmt91JTATSRaTMoXDx9khPNvs6
X-Received: by 2002:a05:6214:4407:b0:68c:8874:59e9 with SMTP id oj7-20020a056214440700b0068c887459e9mr5063147qvb.43.1708081440543;
        Fri, 16 Feb 2024 03:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081440; cv=none;
        d=google.com; s=arc-20160816;
        b=AGQBJSpGd+ruI2XFWGXg9UweO0qFMQGEOMb89Ql4b2y4xWXPWXWRnhovrWwgS8rmsZ
         dG4TAR9POhCFYay2VswzreD1P74l61xzhuU3XpDZ+KcGLr1ZH05jNLM6KluHGuqvhf1d
         pmIfCfx6yvVvr6+whuQ5rZXLZit8+I4Lu4WGD/PQZ4IKElLjYbBR5b6ZEZwREdpxdc0l
         8+57/9Ex8qzYoluM1RNhyV0v1onJKXUcteUqREtSiVkAf1i1Oj2l+aPgHUfXK76qQ4qZ
         EKjNRNw+qe1FgPiiOz2I8iy8PcV0NThOa0Cei1pHleoauqhzKs2srZ8ApDbujd/sFppz
         gYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kkGLYDX+GSE+ZJ9BSh+2Q16g0HNqBL3+uba9nDXc65E=;
        fh=yY3cfVrdTI0FQ0mqsz8xWWGdc7mdmBSyIIP51TRI9RI=;
        b=sBD6kPBJKnsYr0Zk5gYhvlGzcqcBrDX4/pEkWtSLkwkZPO19YhAdOaWag3NPUZrQ52
         RT6QfZhao57dJfPOkIrypFh7bc6Q/oW/RWTLOiL750XnJDZVuLiEjEtOtd90WSngOcFz
         GhoK1K8jcCDUx+LHseNpzsujzCn/YPPN8h4a0CNJhDK1TMD2QrRwsu/s3d0zUusfw+gb
         4iXrSUs7tBP80XlDeJ94Z2P41J+Ee8a03fREnVf0F6o4Wlgb94qV/zdVhqn1sbfzxI0y
         F6BJ/gsDILI2ZIlu66VIqrx2gZR4EfDbSLASl8t+VG4aAxeMmY21ya8OdJiB1qYusTVP
         44Vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qnm1dp3s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm10-20020ad45eca000000b0068c8ab72bc7si3808765qvb.112.2024.02.16.03.04.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:04:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qnm1dp3s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raw0U-0006PL-QX; Fri, 16 Feb 2024 06:03:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw0P-0006Mt-KI
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:03:45 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw0N-0000rK-CX
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:03:45 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41242be3460so3587965e9.1
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 03:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081422; x=1708686222; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kkGLYDX+GSE+ZJ9BSh+2Q16g0HNqBL3+uba9nDXc65E=;
 b=Qnm1dp3sycbUkM+tBK1UduQ6hTzF0RbdoXxMESGYgym/1Aa2naOY1aL2YYD32XicXv
 hOmC0FtBDCr42KliVaKivFtoIaMa53uaG+y3Q+TtpdublYzgKaSkfebOGAtZJV/Pt8gl
 DNIinS7b/JGDKlw9PEqXmbYyYFri5td98f97rS2wxzOMVrG2aDIVyVNLKahBVbe7R8Jo
 PJMHoAs5dSCCgTdy+53XsNRir+cE9BNuo5nR6dF0/LUGKKPuQDlCbD88ssBwmsiH9iTT
 acKTyG7g6zyMc1ShyhpeClrdUAUvtEpgA0Uvj4cDzsNuXrk1F3eGz94r79+7FGUqWjnw
 olgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081422; x=1708686222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kkGLYDX+GSE+ZJ9BSh+2Q16g0HNqBL3+uba9nDXc65E=;
 b=Cea060I0Lo+sTK75f2NjiR95PgLfkuYNR7k7RQ430Le9Cufqk1ReGHEHDgjPD/Zfdx
 e0omAkPUg5703uA2xSATMFUrE2Ueg+UA46ztQSUTPDX1mtpx+6uDAv/PyAtAxmZ0SAkC
 SLmKz05zp2xEDkqobf1bT9qX9ZEO9RPr1TabRxAdwCSxIvbNrgKm16pHOf+C7BUbMlS7
 Zi2USUVmzCgwHj+PxyzkXv2jg/ItQh4gLpuANoVy2xUWqCStysnAuCB0QqtdNcIChOmI
 Q/ko+nnWvLGVCpaNL8RHh8yI6K38jxNQTx2t8vj0grrxaLorI/aKW+wJ4YJc580YIEMM
 X6qQ==
X-Gm-Message-State: AOJu0Yy7DG1BHivbCq8tgrhYnNM30770hwiToiczv1MUD2e5PNCcyFBI
 aP3lgQbs0HQJjwao26QoNf3kQBncu5D7RlHS/WRNrfjX+pO1tzoOs5Ai6kh9Oqw=
X-Received: by 2002:a05:600c:1c9d:b0:412:3c20:5c67 with SMTP id
 k29-20020a05600c1c9d00b004123c205c67mr1395904wms.39.1708081422054; 
 Fri, 16 Feb 2024 03:03:42 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 jn4-20020a05600c6b0400b00411b7c91470sm1942118wmb.12.2024.02.16.03.03.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:03:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH 04/21] hw/tricore/testboard: Use qdev_new() instead of QOM
 basic API
Date: Fri, 16 Feb 2024 12:02:55 +0100
Message-ID: <20240216110313.17039-5-philmd@linaro.org>
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
X-TUID: +PumQWP1vnb+

Prefer QDev API for QDev objects, avoid the underlying QOM layer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/tricore/tricore_testdevice.h | 3 ---
 hw/tricore/tricore_testboard.c          | 4 +---
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/hw/tricore/tricore_testdevice.h b/include/hw/tricore/tricore_testdevice.h
index 8b4fe15f24..2c57b62f22 100644
--- a/include/hw/tricore/tricore_testdevice.h
+++ b/include/hw/tricore/tricore_testdevice.h
@@ -25,12 +25,9 @@
     OBJECT_CHECK(TriCoreTestDeviceState, (obj), TYPE_TRICORE_TESTDEVICE)
 
 typedef struct {
-    /* <private> */
     SysBusDevice parent_obj;
 
-    /* <public> */
     MemoryRegion iomem;
-
 } TriCoreTestDeviceState;
 
 #endif
diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index b6810e3be0..c29db8b451 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -89,9 +89,7 @@ static void tricore_testboard_init(MachineState *machine, int board_id)
     memory_region_add_subregion(sysmem, 0xf0050000, pcp_data);
     memory_region_add_subregion(sysmem, 0xf0060000, pcp_text);
 
-    test_dev = g_new(TriCoreTestDeviceState, 1);
-    object_initialize(test_dev, sizeof(TriCoreTestDeviceState),
-                      TYPE_TRICORE_TESTDEVICE);
+    test_dev = TRICORE_TESTDEVICE(qdev_new(TYPE_TRICORE_TESTDEVICE));
     memory_region_add_subregion(sysmem, 0xf0000000, &test_dev->iomem);
 
 
-- 
2.41.0

