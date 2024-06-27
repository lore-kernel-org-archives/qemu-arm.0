Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp309591njb;
        Thu, 27 Jun 2024 09:23:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUI1Ig+qB5gQB8Yw9SNIHV3G/yHWobus2hxQZvSG1geMkWkVHM0pGoMN1j8Vlo4HrPPJPQu6xrPf0cB2YhthOIGzWsUDDJi
X-Google-Smtp-Source: AGHT+IGMiaJ/9FQf1eoH/QBMWFa9ynWuWWxAfddzhoAzWWX9ehQAFSqYLSeOKj9Rf4FyR37/4PiK
X-Received: by 2002:a05:620a:bc2:b0:79c:338:86d6 with SMTP id af79cd13be357-79c033889ffmr914940485a.22.1719505433977;
        Thu, 27 Jun 2024 09:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719505433; cv=none;
        d=google.com; s=arc-20160816;
        b=E4qeXpghMQ4JNSDCrdy5xXYfzss78Togn0s3wgMkaRFlxI8Q8WPg4QT4EOK5hsns5d
         89dlzCPTkvShYiiMEuph0yLQf9ZcVBMhaOmWEX8KNnULIOEQwxSysYUT0dKJtVA+IRyP
         aS5qW5bedK/dbQXPXsAf36PT8LXNPsdTpxeaXKpv8FvXrnWsUF5ZzACc+vBH5/siH3Hh
         bry99K3ux74yBI1hXkBjFvx/PpIzo8rmVkQhrwIpkiV2yNdO2G5Bn82J9MPb0u1/+DWF
         fq6A8NSDL2B4Xi1Pb5MTOJoeBihn/NLEndbCzjRbbPuf/EAZ5TjCCB3YRowhNcFoJjSX
         eHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q0dLi7LJeAuLomgAe/dqexun4vtTcne+GTOKHsnzMSk=;
        fh=J5ku+V592sifDRR0DP/LvVzC5VDqkDqR46Xlv8eA1xM=;
        b=cX9yrY2XXL8gKP4YfSJbptD0Z6Be4X2+qE8hnJGmFC5GxRrrmNZTHCKy2Hk0+HG+LB
         Hy0xNIUyc+NvoyB7iYiZr7IVQjBo+11vJ6AWfRCuXW1vfnjxHbl7aCBL7WbfAyGTrgru
         Tu3CjFygBxOR7FsPzffv6zg6lBmJ98Yz6e3IrOM6aIsUCPgWOTws/Ux+jolaSHmC7ptK
         BB5iafzz59Mwb9MuKb7rXb32eeDrpSbZyQda15TPNeZKU0KcZTa7aFKZQ4Ts5+B8w9vg
         k7nAPFm9NjN6ybRgbawWPNJa2IlL8l+OWAF4T0VXl73b+NoApIpi6StEMKlEvEGBkPMW
         e74g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lzD2F6en;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d5c8b6944si170429885a.504.2024.06.27.09.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 09:23:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lzD2F6en;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sMruE-0003nH-EF; Thu, 27 Jun 2024 12:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMruB-0003fA-W8
 for qemu-devel@nongnu.org; Thu, 27 Jun 2024 12:23:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrtv-00078g-OT
 for qemu-devel@nongnu.org; Thu, 27 Jun 2024 12:23:27 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-425624255f3so9581405e9.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jun 2024 09:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719505390; x=1720110190; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0dLi7LJeAuLomgAe/dqexun4vtTcne+GTOKHsnzMSk=;
 b=lzD2F6enAzhJRegKaju0wM53SrLxflvO/UuVhKnBrFJNmfAFEsua9SMbihahHVel7z
 ChPIhnZ7segn/XuKDayKU/yGsdhDVP6fTbFcHVxKG5I/YoS1KkOVWiLHDlSdGpPxwB7k
 4JbH5r2Fpg4dOVrgL7cHLUh39qxGmeflGa3Q+A9gpaH6ma9fHDdv/jF9e7uD8rgcp1w+
 qkqFI2GQ8UNd1EBAgAfqNgoBvW7CvCYfD4Pqav2gsMOoK0oBlUplqkumz3i+UZY0YIEg
 nO+DbUXW5zH/+QR7fA/02m3cGACfJXHEMKcuyIIpOAcc0ECz2MLrzCpeonTSFQEvyTt5
 DXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719505390; x=1720110190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q0dLi7LJeAuLomgAe/dqexun4vtTcne+GTOKHsnzMSk=;
 b=Xnrs6RkHCxW+vxriToCsaQjcmGecAZm5ASBpRnizf47JvvKX3OcNdj7W61dSrVaai8
 SzwqaPPaFhD5q4ETe6jkzh7r8a6vitjDqTQr4X6ZUalAq1T4NjgiVr58PbqCbnLFB0Sa
 zWah+VMPSYHz8oZclTTtsqbq3EoCUFl8/QcdkaDN9BKUF15IfwKBgwwqpG/T6JJ3VFaj
 iMBz/XljpFh4IS7MP1HY26Qiy7F8WK4+z4qfe+5b4FsPcD91B9nYyd7VO6UQCFAIlCL8
 tvwl+aam2Y92HeJodTOI0czsohFCElHxlH6V3WG5+GMuhJXc+aq3YKogH+2xt2zGiYHO
 hHWQ==
X-Gm-Message-State: AOJu0Yy7D2r+UYYPXxvv/6Ly8tLcA0Pkgzin+249sXOQub63O6pgCSPO
 PpEnETvTYqFh5e0XKq4SuMEbR8vAYnnREeFPR6noa4hDnQBYSkablQp58Q1t9f9PbEbIjp2j4we
 ugZk=
X-Received: by 2002:a05:600c:692:b0:421:7ab8:59c with SMTP id
 5b1f17b1804b1-425630fced7mr32156135e9.10.1719505389940; 
 Thu, 27 Jun 2024 09:23:09 -0700 (PDT)
Received: from localhost.localdomain (33.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.33]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564bc5176sm34793135e9.45.2024.06.27.09.23.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Jun 2024 09:23:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 devel@lists.libvirt.org, Luc Michel <luc.michel@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 02/17] hw/sd/sdcard: Use spec v3.01 by default
Date: Thu, 27 Jun 2024 18:22:17 +0200
Message-ID: <20240627162232.80428-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240627162232.80428-1-philmd@linaro.org>
References: <20240627162232.80428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /7YHnlDUkUoI

Recent SDHCI expect cards to support the v3.01 spec
to negociate lower I/O voltage. Select it by default.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a48010cfc1..d0a1d5db18 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2280,7 +2280,7 @@ static void sd_realize(DeviceState *dev, Error **errp)
 
 static Property sd_properties[] = {
     DEFINE_PROP_UINT8("spec_version", SDState,
-                      spec_version, SD_PHY_SPECv2_00_VERS),
+                      spec_version, SD_PHY_SPECv3_01_VERS),
     DEFINE_PROP_DRIVE("drive", SDState, blk),
     /* We do not model the chip select pin, so allow the board to select
      * whether card should be in SSI or MMC/SD mode.  It is also up to the
-- 
2.41.0

