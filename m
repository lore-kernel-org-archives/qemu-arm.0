Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp218903eja;
        Thu, 22 Feb 2024 04:56:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXadaMzETJUt4juxXSTd8e1/UaTCZA/v72ZCcKMdU+dQKA7z1PjbaLoQuN7BQoH3j0QKd4JW+EJ42itbe6vUKiQQxNUI2wu
X-Google-Smtp-Source: AGHT+IHbnJpXIzxbo9Sb5hFh6RNcd9KcjUyl+jlKHO1vfXUEJlnmPuypzWW262U151FRJT/TMdBU
X-Received: by 2002:ac8:7f07:0:b0:42e:4f0d:174e with SMTP id f7-20020ac87f07000000b0042e4f0d174emr1308373qtk.8.1708606580906;
        Thu, 22 Feb 2024 04:56:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708606580; cv=none;
        d=google.com; s=arc-20160816;
        b=chEbFZb3zjlhBAsp4/LxmZQvoCs19UXmlFlDEbcCkxZraOWvcWqeVQN5pnVBBcmJm5
         tRYhT3xfz5zubn7trlmozh9LzTmRX1Y+rZt84v1SFDilv/UMpnqcZcyAAHwrSK7oWj82
         IGb2ColZYvecwj20N8nYRpQgoB82QxSbd5cHUkUPOLF0H2FPbOQmWBtgQVsMw1w5+VeV
         U+B2dVNq2dHbhNDfR4+1bEI855fldSNS99RVPM923AFUFq+D9yfRItWyM1ThAJ2z4epA
         ZhvEGiXPHkSb0vDWQrGgJn6EGto0HuV6w8pmXyw5/74W5sgQx8w2noe99d0SuFs/suQW
         K04w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JspwhcdtiFe4E7MZg2XJDqNEWrT6NpNFHrvazz9D4TA=;
        fh=2lUTxGhOQuJFEL4i03yJqIg4t6CnhszK/1Q/w5vlV9I=;
        b=OCzdff+UA6xxg5c5ddzIi4FQAIGDuaPmfggwPZw2YBgUYSIH1OCSg0Vnx634mcvU5L
         UyxGYjtK7uMGJ7A7nF2JwG8YtPwmdKuP1rL9A+tsQqAEwqqEUxjpix3xTJ/Pt6Ix44qa
         peC+dcriqwXu3yOtqfnoZsB0va+KBghidG4lxXu88aMVC79EJ/2EqP/78qApM93Ya5FG
         NnnYKTQ7wbPuPf1H7eZiwoIx6BMBdETtRocx3nopXBsUSxQ/yrtRhSgEwjH+UBY0ip97
         RfIn3WupEbTgkfvu9Ftp0c8rB19X4/8X43ecTYeUqIzCJkZ2JesydIVLylIbfSmtLcYw
         CmaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yUMu3a29;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020ac841cb000000b0042e1260d4efsi8684984qtm.521.2024.02.22.04.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 04:56:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yUMu3a29;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd8cS-0006Lg-68; Thu, 22 Feb 2024 07:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8cG-00068Z-P0
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 07:55:58 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8bz-0004nc-Re
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 07:55:55 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4127a0d8ae1so8739625e9.2
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 04:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708606538; x=1709211338; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JspwhcdtiFe4E7MZg2XJDqNEWrT6NpNFHrvazz9D4TA=;
 b=yUMu3a29L2vgv4cUyyDs9KmC/hBnfCS2Orsr7vpoVMyk9pczuoIhTsB3ZePCykc7nD
 EDCjcL/ITudmpgV76u700Xl6m+kWhddLiJB9Pu168pDtWf8ZVmjsqY77sjplnzpp+AEW
 xjBz0AuFf5sgKw/HO2UMLSfdplJZRgVnawpI8fZetghiwDs5Xo3PZxi5ntJn2/GlE9EG
 MqXzRQjGI5SDaEvk6AzGqmak0mTEQLBWmVw9I7cUJnLv+NZSO4shL/xkniedc6cGJdry
 Ank2sA5Jcfp08O0+sANAkoLGZPYlOQBzpjdGeUDaKSQohugsokYEBHTfLZV2V4DROzLR
 rp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708606538; x=1709211338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JspwhcdtiFe4E7MZg2XJDqNEWrT6NpNFHrvazz9D4TA=;
 b=CXXyUaNns+ZoQ5E+jiaYY26e4s9v9QR7cRTGWe0zAbNCO+D4XqCBZLAm0pAeshTuR+
 zZ4CeWdWxGyGtDuZEW6jqX2vE4PzaJyP9i8aYVarbAyl53AWQkzBmTAEhuK/SS4KdeEY
 +lEEKFEIin9kAllcSwR82uNrkYJPEGAo91atL6cDrCAExburksleG7mfDOex00BTR+af
 TcZ7avnRLOyamFG4vx+SLxROjEUgte2ZPGeu6GvGJ4ClJaSv7jGKq9QE1OPvavgbunKH
 k9wUKdzBfCMZUrcPpLNr2w2V/JN2xSq7snAfCgFXn61ARkSk/0WVUXnt/VI8tvOr4hEQ
 8y8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2o8YUxITbqltcV2KBzbUsCtkqAm3600Vfv0r2/vPCAmhdUxaR8I/nMXNgnmZGXuG8ktwopP/t4sICt05ZCTCCmfWa
X-Gm-Message-State: AOJu0YwUJnNMMragY347+V5qsR7/gKKGVRzg01XCLkNnHYBAjTznSln2
 d2dK5B8w7znsYRerOD7ZVSrBCWcZpNy+hjEHJ9G6tEXvzvvmflk4MS3f9LEx4hA=
X-Received: by 2002:a05:600c:1c0d:b0:412:64cb:eff3 with SMTP id
 j13-20020a05600c1c0d00b0041264cbeff3mr8722712wms.3.1708606538147; 
 Thu, 22 Feb 2024 04:55:38 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 by1-20020a056000098100b0033d873f08d4sm3626621wrb.98.2024.02.22.04.55.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Feb 2024 04:55:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PULL 09/32] hw/tricore/testboard: Use qdev_new() instead of QOM
 basic API
Date: Thu, 22 Feb 2024 13:55:11 +0100
Message-ID: <20240222125517.67131-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222125517.67131-1-philmd@linaro.org>
References: <20240222125517.67131-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: tf2KWmPu+IPf

Prefer QDev API for QDev objects, avoid the underlying QOM layer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20240216110313.17039-5-philmd@linaro.org>
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

