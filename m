Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1224001lfi;
        Fri, 2 Jul 2021 03:42:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9ReNsjIMf2N2fKqmMjzr8Q/Lqh0j00riB2U8MFl+xrLexqPoF/g2+GuUwvRhI5fQ/yVlH
X-Received: by 2002:ab0:20d6:: with SMTP id z22mr5556720ual.143.1625222543863;
        Fri, 02 Jul 2021 03:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625222543; cv=none;
        d=google.com; s=arc-20160816;
        b=kelkvyc83IwSoIT/9lfecVBFg+CnrE8Pfx2MbMnfGKkeDacCsvHPxqFiXJ2wcTGh+N
         qALUOmL8ZSwhegdjzlGgPBXTLOblN46RsZY8nM9BmpAZ9WNou++dmiuR1JBpynkhtaZL
         W4effC4XOXIOqpCZl6qIh2VKag76J9p3xjITsTrvwSujk1L6uprrIgR8Iz3baO/DXizu
         hE4S2kIEkFKjPKel3g2LKJ0mfm0G2BhOVooZ4W/DdOENHhnLCucLldqKJZn/aE69nYlJ
         OkVgnvOj2y5e0JNxTjxQK5adXR66Tc+M+HubopYiCeNuysstOBApVdAO8vKZKILPpCbs
         Ks5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hMxqgRMRaEeAuAomNzQfVfuioKmuSQPXmbHQvftFpp4=;
        b=zenR53SLQuWefPxfzUAQACrzxb1S/IaKbr/6fdwHrnaxMNfIctGUuxQkwDnKT1j4rG
         mm+Esyt1QfM7ERHGwKovwkOH1WSViqSCydgDr8ajgCRTZM4JYyNoNxjsvYxxATeN8a8a
         bj4/EQ8MqpBkig7sfhYBYFwV++B2j9/UL8hKzVP+RF+voO2qwISrBSlzNX3qMem0p4kl
         RbDPs7WH5son2oLrfAaXQ+sWfBKHNnCTge7fAchyFgz75Rz1OmKQN9VPimPGSQu4FfUc
         GWjeu3JN+1BxqatS/0Kl4VaiJz7Ln7n58rUzOCNUWunY8eIo7ieKZ4nE6wNeebCWfTv/
         wbUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=glOzzCDp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si24048vsk.209.2021.07.02.03.42.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 03:42:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=glOzzCDp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzGcp-0007U5-6n
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 06:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGav-0004aw-Hg
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:25 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGat-0006YK-Cz
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:24 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so6054625wmc.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hMxqgRMRaEeAuAomNzQfVfuioKmuSQPXmbHQvftFpp4=;
 b=glOzzCDpuBPmTjQb5ZHwS0fOGxVVg4IovFuV0otzdc5FAwLn3JNAEZfp4bBWi9FV1m
 D7SHC0qoVvS955HPIl+ZQeoHbGVSheVpetyPyU34RnkENNqcI4pvh9RVknh2r4GWho0A
 sUtdHGtwhevjXBeWSBQSfqYk6RUACkiukpwkvNqVyGjuSm6ppBE72b4vBHbblBr6ikYy
 ModlY6X9ahXFv+CX/PaQ8Sz8QifMdq3DLGq0yJ1z0l6DSe0c2U/YmqEB0amzeQMfO6+2
 xO7to8Kh/LqcabtyQrn0P2opQ0sEQCfRcnI+aq9GVIiLMDfpkvsI1Y+7/HtvUB5BVdUv
 bHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hMxqgRMRaEeAuAomNzQfVfuioKmuSQPXmbHQvftFpp4=;
 b=idtZ4VmoroddiPH8ECjXcrSkkYpEaoxBMfJct849DMkyuGwnxfojV0UgQt/sYQrTml
 KV++AgvTYbbqicYofC3R+EKakFxHKGSbvwxIkFvFUW1/zGS/wu5B1Uq0ytim8DfML2g/
 9a4KEVf6vebgMhDLokRclib425UJGExSJ2YP+NguhPv/IqUwLvkDoH8Mh+5WmdBNo36X
 3u+Kr2NxvHW4c5o4sV9AvUov76iBuNSbVH3+U13SZq6WI9ROImDZqtHQSSq/Q+90XsXd
 a80fblb9524dCCvY4SjdiqMVG1KfwFSRroK4rl62V213UrkjjuzOAICkAPTSagR+9GXv
 /3RQ==
X-Gm-Message-State: AOAM530dITjxpT/bAkUf1ZnAOqUzcYosEFTvfZWiA+U2u4D/YMVYo62V
 e/bNGXVPdVw0rdwHMa7oYLDjAg==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr15561780wmi.26.1625222421543; 
 Fri, 02 Jul 2021 03:40:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/11] hw/gpio/gpio_pwr: use shutdown function for reboot
Date: Fri,  2 Jul 2021 11:40:08 +0100
Message-Id: <20210702104018.19881-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IfsKE9AAe2q4

From: Maxim Uvarov <maxim.uvarov@linaro.org>

qemu has 2 type of functions: shutdown and reboot. Shutdown
function has to be used for machine shutdown. Otherwise we cause
a reset with a bogus "cause" value, when we intended a shutdown.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210625111842.3790-3-maxim.uvarov@linaro.org
[PMM: tweaked commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/gpio_pwr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
index 7714fa0dc4d..dbaf1c70c88 100644
--- a/hw/gpio/gpio_pwr.c
+++ b/hw/gpio/gpio_pwr.c
@@ -43,7 +43,7 @@ static void gpio_pwr_reset(void *opaque, int n, int level)
 static void gpio_pwr_shutdown(void *opaque, int n, int level)
 {
     if (level) {
-        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
 }
 
-- 
2.20.1

