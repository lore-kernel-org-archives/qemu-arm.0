Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2543287ejf;
        Tue, 27 Feb 2024 00:41:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAFrbeBOb8yQwRtt/B/3Xb9TVuDY7lmOLVUu/RYDjZdF1zNk8gfLk0Jxk2L7E1Dbp51wgyN8osaaHp3O/VEiJSh0fwm8s/
X-Google-Smtp-Source: AGHT+IFGL3LGgdW/b6TOwrqU6bhto4i5VxImqf+FuxWOUJ2jhMakkJvzHQVBPwKFW+Z9izY1ANsZ
X-Received: by 2002:a05:6214:f2c:b0:68f:8b75:575 with SMTP id iw12-20020a0562140f2c00b0068f8b750575mr2912115qvb.4.1709023273475;
        Tue, 27 Feb 2024 00:41:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023273; cv=none;
        d=google.com; s=arc-20160816;
        b=wqw6TqqG6NvlLi9fP6PJHuKccYv2IMAbaSFPSSphHDzyuTARX1PkyI4AH79X26BYRq
         JUISql22i/gNGIFtA08QV7N5D6sqv33TYjmf46o4NBenChBDW93z17QX0NzfhNisB+WJ
         61Rq4FSUMmlHusWBSnVze2l/gM8UJq3XzuZnYDIInS3GPjXgmy55Gt3P6hmexhyO48p7
         iseuq3ZkLUF5b+N7P8nZNOgIEKRtCgG/eqm91ktdskOvYAFPOQBRZM8EG22ge3X/Lidp
         csu8eBWC2kWgPlgPHjtWmQ0/71bzInmbGkBFQt5pNPNq8zHMDoA/Xfaj1dL/MDA5HM8m
         RNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vsQjpNWm982u5XBOq7wYo0dWEjdVwmwHsexBrMcBwNc=;
        fh=Pyf53od/lODN6Bac5nl3fQKIy47zS46xbM61NZbaelA=;
        b=BwIL8MF616iDQh3Q/kp8P2IgI6xarZgriBqJ5b5dxj7dAlYjbe+S2eCiSMdaKlGVho
         VjrAffwSPbrzVjUOjToieRzwFlK0xCAa5ap10iVXJLiDDMPxZnZon0c5NjSOMSo9YAwp
         6fat/xLnyzu2wvwiKfrDjrzUsKLrDowKvJSp2H0lmQRLQ9ezSneOyF+M0yBlq9M7BtZN
         uox0uh1mqEO2zn7RA7xvAPs3Ol3wgf6ol4cUAA6a9OsC2SPhU9Sr869RUwScKOuKywyN
         vZ3UEPYfiq4nGkA9rcuP5hET/bJnUR8fYI9NUw78CwycFSjc5T6mfcTd6EcfhaluRxbO
         QZ6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rvjr6+DU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020a0562141bc600b0068cb3cbbbe8si7000495qvc.502.2024.02.27.00.41.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:41:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rvjr6+DU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret0y-0006Rf-Ss; Tue, 27 Feb 2024 03:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0x-0006PA-AZ
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:40:39 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0m-0007lp-6R
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:40:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-412a3ebad2aso15187375e9.1
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023226; x=1709628026; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vsQjpNWm982u5XBOq7wYo0dWEjdVwmwHsexBrMcBwNc=;
 b=Rvjr6+DU3dQC41Ae7eoHfoWyzEnJRjAp/YYZ3SbM/fUnZ3nyCG4GO/L4JiRL/XzM/S
 JG5mC4wmdYCGc8sm8j2GOAzY7q8Jz6DzA/8bjSaDyhM8g78K8q6KWNfs5ojgsJAImMNN
 65HCK3pdkmoE6PcZVPOPgJRR5wGGWJJyu51VhUmHhbve6FGq2XCL7dajqFRPmXrTLlT3
 7ub+AP3Gv50xYZPnWVL+Q0SBQaS/YsjxxhXpmmJTgmzlUuI/EcqYtJfA/qJ7/uVXeEl/
 RRZmKkbYKGjDWpoVqecc4of/VFgcQ9qVA3kXHCX0H5EjXtCoev+jScNsjIvgPlJFGoEJ
 nRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023226; x=1709628026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vsQjpNWm982u5XBOq7wYo0dWEjdVwmwHsexBrMcBwNc=;
 b=hG+Lu+jbZOHn5v3mxLCA8SrCpd0QDIZDUHUpfdCBWsv8SqZe8YUXgCdJHwqLbuMVEw
 MFuaHkOva6cyLNg1boLSQ6/zcO5utAXywlWA6AF+B+X80UB6kq1bBAczf2BlMGrCzEDG
 BqYCbTuCCARZjpvjna1mcxODh37RG4CdgbN28FzSEdPG5KpRvOZNWiWz3LmVc0Ut+R3H
 Yaoqu5gxuiIyZB4lXLfELUMBTiVMTCOs+kc8aIpCU9d9iMCz7O8JfCHuZxbFesgrbXyP
 3Hlr2iwW7QfTvxsltuZjJNCBASGhXIFb2ZJ7brAZks3F3NYrSVp6Okq90JCK4pII8yf8
 kjMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/YDjozki+WQS+98IQmnckj5I4kQcOJOCiFmEMdTLatOlomlZB7U/+WMkGcW89NVTwHt23NoTP4R1grR4G0CX8WbQW
X-Gm-Message-State: AOJu0YzDsZEkPwNaFS2ZhKuhx+HMl3FG0TSrain3UUOcWt5Thq7J4vSd
 nc22ER9xGmDfnNti852Ij68j3JXQAmUnbskoNMGPafF+9kDj36co4Ah4Vosx0RE=
X-Received: by 2002:a05:600c:1546:b0:412:a2c7:9d13 with SMTP id
 f6-20020a05600c154600b00412a2c79d13mr4064489wmg.6.1709023226656; 
 Tue, 27 Feb 2024 00:40:26 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c444d00b0041294d015fbsm10703245wmn.40.2024.02.27.00.40.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:40:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 06/30] hw/sysbus: Remove now unused sysbus_address_space()
Date: Tue, 27 Feb 2024 09:39:22 +0100
Message-ID: <20240227083948.5427-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 4+J71yIka66F

sysbus_address_space() is not more used, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240216153517.49422-7-philmd@linaro.org>
---
 include/hw/sysbus.h | 1 -
 hw/core/sysbus.c    | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 14dbc22d0c..3cb29a480e 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -83,7 +83,6 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
 void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
                              int priority);
 void sysbus_mmio_unmap(SysBusDevice *dev, int n);
-MemoryRegion *sysbus_address_space(SysBusDevice *dev);
 
 bool sysbus_realize(SysBusDevice *dev, Error **errp);
 bool sysbus_realize_and_unref(SysBusDevice *dev, Error **errp);
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 9f1d5b2d6d..ad34fb7344 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -298,11 +298,6 @@ static char *sysbus_get_fw_dev_path(DeviceState *dev)
     return g_strdup(qdev_fw_name(dev));
 }
 
-MemoryRegion *sysbus_address_space(SysBusDevice *dev)
-{
-    return get_system_memory();
-}
-
 static void sysbus_device_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *k = DEVICE_CLASS(klass);
-- 
2.41.0

