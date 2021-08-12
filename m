Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp194202lff;
        Thu, 12 Aug 2021 02:40:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTG/67ypamJ9IfYwV4d6DNCynu2Msj8SQkkmezPfDSQVf05XN6XxZ2conOgqpOxJ4rvgal
X-Received: by 2002:a37:42c9:: with SMTP id p192mr3706975qka.60.1628761241806;
        Thu, 12 Aug 2021 02:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628761241; cv=none;
        d=google.com; s=arc-20160816;
        b=qv86Ext+LXq7+npiH9FDHLeBAvlkDg88lodxXALFTuzUoZqx8DKglvxxcVl5zJ402l
         KoPRVXcXnyWOI6R2g/zW2FG/vkRBakFCTPoseK0GiIujMzJv52DHAfKVB/+dNWh/pfUa
         nkJ2fFe2Y1AZTzqrezYokVXgYETkr9BkEMiXzYCXrWYRU3oKBaPmeIhhXALOf6OVWbAR
         p8F+CgQgAuvqjAMQxVld25pcAmPTnkNyRc0lFmoqFvZl9LVjkNPbfpk3xSoFs7ww+IjU
         w0PnkRCJx8/YSQ8mH8j5MPO/4e0LO46Pam2wiAwYeUqGtyy4XmOJassJC1j7dvz3KLOm
         mhfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3PDN4mKTf0zYjcvH+MYD67g3sSoLMbW7iWecHpCgpiM=;
        b=bosJkr+Lm443i+mW05dFQNPAf0O3x+URp1D8PEDBlLKGABYiejfc4+lVI80Zj8oITM
         TCy+Xncr8BHJE8is72Tsvs1etmpqZ/bbmNxegUvhTzzhLROvu55aac+ZglGvnHjsfdWL
         xhpiHWdC1S3rG+K4q57eo4hUhoYpj/Gi2pIpMH9m2M8Qez83I4gJjIi8Lwdpn0U1/qcJ
         nKBvn6W7XG98CNTeGRmhXGk9HsEq/W3Lw1T5deZTznRwk69IBqMTWguCkhXrS41aXTPj
         VKMjp6W58LRjNVb14w809Qe39inSMS9YrN1VFOIX07ZENbf32KLuTpARAtS4BSX15v8H
         Lq0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VYTqU7Zk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si1502104qvb.197.2021.08.12.02.40.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:40:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VYTqU7Zk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE7Cb-0000EW-30
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76P-0005Vo-Cb
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:17 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76L-0007vi-Uh
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:17 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso6609541wms.1
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3PDN4mKTf0zYjcvH+MYD67g3sSoLMbW7iWecHpCgpiM=;
 b=VYTqU7ZkZXuCe43Udu+Fyb+3iKVd9q9QEo09fE9N/yzB6sW+sg1CWSV9sx0wmkz7hM
 ZNyY66vSBRomLi/oQod9ycz9wCqJFH0Vb8xHSf/7nFOafDEMxzsdnqSR28yjznQBt/vL
 SnBpENRhG/TS9kKtW3crz9so5zclaUFvFHu/row1IacNDbj5HLvrGyahLi4pLz59wXe0
 W9nlmlte6NCrogH7QUuADUmC8xByXBBkQ+gYxZhWvOg//ZqixonPwERhOqIkFhNCrWQ2
 7nVirjf0I8gD8t5je9sXtD3EHtu3HY7pXatD1Q2IxBsGn5MxpX1x3wq8U0kvmPf74czO
 kXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PDN4mKTf0zYjcvH+MYD67g3sSoLMbW7iWecHpCgpiM=;
 b=Us1voNy/TU+9TUVyRhxk0UKKKsk4fcaEg248Y9/coPxg5g5+QwTLeNiaDrQ99LEQbg
 ddoPHvgQgTzygKUgKtnHZRrz+Ae7fD/Kc2Vt2RuE5+TVOV3Cq+y8ZViULEP7GCwRgD9o
 RnsSOWO5czwrneMlW0dCdmQZ24pEHE9GnhBZ1JnHUTf7FJctzjQ4HK1HOq8RhJ2S6wmh
 TQKwNhp84jDaxTLgRnoXFm6EheNwbB/+1iG7y+zM215PMq1tV+ieHceotw2atRQTDGsX
 nSXClnsvhECcY84wOQMRffjg3ghVaojO1X0sDUYW1arDwV2hoXLT6BUrrdj8E8jc7YLQ
 JVqw==
X-Gm-Message-State: AOAM533VfRRde0t6pnKGpLP4fEyqCshzQ8vfR8fMzM+DRSPWkKWm+gU0
 yHQBL6D3T7DnyklqklviR9URrBUrTHaPaA==
X-Received: by 2002:a7b:c309:: with SMTP id k9mr3104887wmj.48.1628760852323;
 Thu, 12 Aug 2021 02:34:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 14/25] hw/arm/stm32vldiscovery: Delete trailing blank
 line
Date: Thu, 12 Aug 2021 10:33:45 +0100
Message-Id: <20210812093356.1946-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z9GXOqDuENdV

Delete the trailing blank line at the end of the source file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stm32vldiscovery.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
index 07e401a818d..9b79004703b 100644
--- a/hw/arm/stm32vldiscovery.c
+++ b/hw/arm/stm32vldiscovery.c
@@ -65,4 +65,3 @@ static void stm32vldiscovery_machine_init(MachineClass *mc)
 }
 
 DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
-
-- 
2.20.1

