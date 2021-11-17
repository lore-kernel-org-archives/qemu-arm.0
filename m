Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp8354978lfk;
        Tue, 16 Nov 2021 17:10:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+J3BfVR0x2Nw0sBRlf87En8ePJALuVCdJbucUti1gsCIFFlTURFu3qdI7k9VGiqVTl3EA
X-Received: by 2002:a05:622a:11d1:: with SMTP id n17mr12753482qtk.154.1637111450492;
        Tue, 16 Nov 2021 17:10:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637111450; cv=none;
        d=google.com; s=arc-20160816;
        b=Lev4/xCt99bB+wv/+1aAnNOkrs7hpTvlecCKURbaSL4HqTY1vkrh7RvOtnGx4r+Si6
         OCVBOcSubdSiOZCOuQZo1/Ble97Z+aCOSCW2QcHm8nkA/TPr14VjKUNO624ednEwnzfY
         Ro4rkNDXoAWA3f3uJaotiPIU5kn6q40AGNBaahnly74+vKDjOcS3vvbSnUwQ0jqEDx5q
         GxNYIq78DgJKswtK5vrvnLTLOpbb8wasJwkFg02fWxmf8vhBel6QJWGDI4B00E7/Jdja
         Oh10/ZtVOvDlvzq5LO5LN5aV5SgFtFlc2veLVh+WZwP1lcWKZ4obayFV1I3a05OjVi5U
         3Bqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T94hNqM/dX6rkSEP2mqASB2IXztGyjR5lNdq+2drn1c=;
        b=MHHiCdG7wdHp/HJIXt3E8yf8qmv2Nl6r9xUTt1RsrMPioFf3LJfSuAr2o7PdgwFsSk
         OGUW7Y4T1sN6KBEljFo5N3te6COGg1hmAmmWCU2oZ0LZpfZInm1jzIzEcSCCE9yiIKNO
         2GQSocc1SApeSykzcS5vCzQOfUzZhqCBjKhMW4/mMdVRqe/sYIkkSnxr93ULoTPx9c4x
         jLzijubz90cat0b/YZz/jgDLathlffUyZpJngwT3OHpcct0Q75xteG0qTBgud4YU/U5s
         6FmIPaKvKXtE5hLpPKmi/+P8PsyflKCPcW8A2gfM2IZcJZuaEMrke/7T+L43eWYbS4GY
         KbXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Qqw+gdCV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l30si25531898qkj.13.2021.11.16.17.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Nov 2021 17:10:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Qqw+gdCV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mn9TN-0003gA-E4
	for alex.bennee@linaro.org; Tue, 16 Nov 2021 20:10:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mn9Si-0003fv-GC; Tue, 16 Nov 2021 20:10:08 -0500
Received: from [2607:f8b0:4864:20::42d] (port=38531
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mn9Sf-0002hg-9z; Tue, 16 Nov 2021 20:10:08 -0500
Received: by mail-pf1-x42d.google.com with SMTP id g18so1039400pfk.5;
 Tue, 16 Nov 2021 17:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T94hNqM/dX6rkSEP2mqASB2IXztGyjR5lNdq+2drn1c=;
 b=Qqw+gdCVvyYmA6g+i0bM24gL/DVpUlDG/TaEZDJe35EeItjhseLVnXMQwpcoJ0y7FP
 Nxs4re3LMpxp76jfC82zmrQovEmnG87OU+tHbf2d3geNjCXLK0wrzkmVty0O4Dmi7sFg
 gM5woRpdi8vaSMNkOqAipKib4zPsPWGyY/tY8RFejhoE+8/5qH4oG5+Y0yn2ePlHsXWL
 HCWb76JWolm37ctcKnjBu6DP6z6s7jNlKPqz2AEYJHolml9YfPKPoWMOydu/4Gun98uG
 tGSl+Dq+bwDPWOtBF2GRl68GeGrnDJhpqdXHSWrGPjjfXbSXpe2NCmDLvQZtddsHvkYT
 fdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T94hNqM/dX6rkSEP2mqASB2IXztGyjR5lNdq+2drn1c=;
 b=b1+oJjuzGHXnmTnYb40KQDVZ7OYI3ZNMB1yx1/JolupYuDqHZV/6ojEPd26a1xwNjg
 /CZeZ5XRJ16Z1UTh8NC2emQm608bUUuyG4gsjUHwrslUrF26b6g0SvBjExNErdGwCRsf
 MOT3CqioMpuL7FSi9PhACzYlnOm6o4YPO8vr9mtxHqDGhKMEy1MFgWw/lcICYNH9XaW3
 eX8iD6QBd4RNjUPy4KDdNfPvLPQa/oOM83vwnzKqRZVmfJ+Pgypl82MorqPDaoX+A8yY
 bhF3NCWQtqjDXVcQbC2F3hzarVt0FrWDny/a8RHzYgtdIQZofsGg7LU8I6afE5COsuBz
 QD0w==
X-Gm-Message-State: AOAM531GJM80/vDWXAwkyNY/E0NPO/StVgzZvxxeexDBPs8Syh2D+QTP
 I2rq4YaFzDpbDvsL9RENpOQ=
X-Received: by 2002:a05:6a00:13a4:b0:49f:add2:3c83 with SMTP id
 t36-20020a056a0013a400b0049fadd23c83mr3460251pfg.28.1637111403377; 
 Tue, 16 Nov 2021 17:10:03 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id z16sm15211376pgl.29.2021.11.16.17.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 17:10:02 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [RESEND PATCH 1/3] docs: aspeed: Add new boards
Date: Wed, 17 Nov 2021 09:09:45 +0800
Message-Id: <20211117010947.297540-2-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117010947.297540-1-joel@jms.id.au>
References: <20211117010947.297540-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bxSFeeGKnLJu

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 docs/system/arm/aspeed.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index cec87e3743d0..b091c0c61dec 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -14,6 +14,7 @@ AST2400 SoC based machines :
 
 - ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
 - ``quanta-q71l-bmc``      OpenBMC Quanta BMC
+- ``supermicrox11-bmc``    Supermicro X11 BMC
 
 AST2500 SoC based machines :
 
@@ -22,11 +23,14 @@ AST2500 SoC based machines :
 - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
 - ``sonorapass-bmc``       OCP SonoraPass BMC
 - ``swift-bmc``            OpenPOWER Swift BMC POWER9
+- ``fp5280g2-bmc``         Inspur FP5280G2 BMC
+- ``g220a-bmc``            Bytedance G220A BMC
 
 AST2600 SoC based machines :
 
 - ``ast2600-evb``          Aspeed AST2600 Evaluation board (Cortex-A7)
 - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
+- ``rainier-bmc``          IBM Rainier BMC
 
 Supported devices
 -----------------
-- 
2.33.0

