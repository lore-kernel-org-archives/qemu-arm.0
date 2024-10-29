Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp319728njj;
        Tue, 29 Oct 2024 08:13:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUyOKtEqh3QBy1AwrM5GMIb5seLLdQmYqHo8VZEqZEImiGxjcWG0/fjGhfGHvobPQ76tyL/wmX901hM5A==@linaro.org
X-Google-Smtp-Source: AGHT+IHhvHZvTuOsH2QK4RutSt888p7AKYUaKtHrF9eMBsSATpe5yC1aUdMmIIyhBVN+QkzKyMPF
X-Received: by 2002:ac8:7f93:0:b0:461:5d78:4a93 with SMTP id d75a77b69052e-4615d784f08mr70705721cf.22.1730214807229;
        Tue, 29 Oct 2024 08:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730214807; cv=none;
        d=google.com; s=arc-20240605;
        b=WfepBRMEYPw4u0cF961MkMBEEkaLXmUUoz3XsNDjzWrZkwkiIouAgaPOQeWmyPdazj
         lKzRiTk9gAhJvoIKGtUFpRrEcMdEZfxZ2FRxcQ84FK8sEinN5UAfAO1Od/kA4YrLfTZ3
         pgwsOcOC8HSusrV5Cd/ofIp2TbefGRqxzEQ7Dx7sOFeYEh9Pm2trO8P9+v4F8iytivWE
         SJwmnRNkSQvSOOK9JqBL5jtYVnybL3q2w6npr08+j+AZcUWkKCcnVBDooFA7sHf/1zdA
         v40jOqG1J/83Lc7aOGA1bl46OAFDRkDF5C5xJLqat1s4GoGmNPfkvVJmNTuLCa7LakQo
         HQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MGJ4r5UnfAoORr2hiUvGBmjp7lq01tEi3+8nwdqcv5E=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=WEuazWbAj184ARd5duWbPsqT1uxHaeDZI1xLolXMANgO+Mfxa9jvqx7F8fpuoqpBDb
         xCdFHV6j7bHtRwsxKUDYu2a3FKxNrvcgFPHJfI2rm4xbYbGhCvcf9E2ko0U8EGmIA2d0
         fGgDLIj9Tk/cq2TQ56BVb0dKwMVKhQhFVuuw7U2UKN8djfQJ7PPaTtSFerg194YNa3AC
         rOJ/C1sHz1iD3bK9EQZ7J35deMx5+NRvaSa/5KoE9/ShP5F17Tjyp5/dkr2dd6xdcSrD
         +SRR2A4HXa7y8XpR5hQ5tMcDH9FgXhSHOc/yu+rzvGfaEUQnosXzUsXr8fNhPA9y7N+z
         9RDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k827zQvq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46132359244si108076021cf.279.2024.10.29.08.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k827zQvq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5nu2-0003Gk-A5; Tue, 29 Oct 2024 11:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5nsA-0000ol-0g
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:09 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5ns2-0007hr-GD
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso51011105e9.3
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214655; x=1730819455; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MGJ4r5UnfAoORr2hiUvGBmjp7lq01tEi3+8nwdqcv5E=;
 b=k827zQvq3JglsVp4kn91oZlaoHApcUAzgXJUToal6dfQUTS+V3NNeO3JxvpKCUdvra
 n7UpiM+UsjctGTf7jU8ikeYor88EfCjdFWWByieLhzKQelCbTJhGH1UAiO3K8Ts6jWMe
 xmZ9hEYXXIIC4K3ucsW423OLz3buB57pyjYHeBieHsRR54sfmJ6JcguNcL0oxKcUdMXD
 0I9s7xo1AHSCT/2c84NHPk1y78+DOjsDLE9Wsd8jWhrl4ZbEZeUUvLr9hNPKN9HvuQxb
 JB6iqBeP1b+4YCx1pk/X5rdF/bOJ/GNt9m/6hYIEWRqBLTH798YYIXdQbyvVArJulqcG
 YGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214655; x=1730819455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGJ4r5UnfAoORr2hiUvGBmjp7lq01tEi3+8nwdqcv5E=;
 b=dOEQ4JqB/qBhRRSTsMOkE9UzEkS2dGzLEsx9s+hz1ankd5V2wiUAynmqfy2xANIoMg
 /A81rXp0yp49GKEz8NOiO65aFFnWDiZDyDe1XbYuXdCBYO6acSQI0KatG/ewSxAfVxIe
 qvzuP1FOT/hKhAOnjZYM+ums04ciSEAlXkkIvtgsXh+H1tmzDXJ6DU6Ul/D/fNFlfSDB
 6Y0B3rqecRlQJb43yk0pM3XFVR3/NjA/FLJ6bTlG/DYXyiymkgfKFVnaeWk3Md35h3RF
 jUtIfwsZkMGGdhBz3qw5GZvwEIt+I1ilYW7EO/p9Ew6BITurLokZS/9uFp6ySQWSGX7K
 GbIg==
X-Gm-Message-State: AOJu0YzchAAgpWkR/9dU4zNro2W65xYVKK9YwpWbOvnJubb2eoCPX4fP
 zfZ96g29Tg61lqjMd1JEtJdxbDkqxjSxnXIYpQfnLO9Rc8M9g+vrM+ls2tJ9Zgz1ic4b/x01KsK
 4
X-Received: by 2002:a05:600c:1d15:b0:431:4a83:2d80 with SMTP id
 5b1f17b1804b1-4319ab94761mr104885775e9.0.1730214655203; 
 Tue, 29 Oct 2024 08:10:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360cc2esm146835865e9.44.2024.10.29.08.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 08:10:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PULL 10/18] docs/system/arm: Don't use wildcard '*-bmc' in doc titles
Date: Tue, 29 Oct 2024 15:10:40 +0000
Message-Id: <20241029151048.1047247-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029151048.1047247-1-peter.maydell@linaro.org>
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: /YU2iidxTNvh

We have two Arm board doc files which both use '*-bmc' in their
documentation title. The result is that when you read the
table of contents in system/target-arm.html you don't know
which boards are covered by which file.

Expand out the board names entirely in the document titles.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Message-id: 20241018141332.942844-3-peter.maydell@linaro.org
---
 docs/system/arm/aspeed.rst  | 4 ++--
 docs/system/arm/nuvoton.rst | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 6733ffd2b94..968ba88b997 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,5 +1,5 @@
-Aspeed family boards (``*-bmc``, ``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``)
-===================================================================================
+Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``tiogapass-bmc``, ``tacoma-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
+========================================================================================================================================================================================================================================================================================================================================================================================================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
 Aspeed evaluation boards. They are based on different releases of the
diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 0424cae4b01..05059378e55 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -1,5 +1,5 @@
-Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
-================================================================
+Nuvoton iBMC boards (``kudo-bmc``, ``mori-bmc``, ``npcm750-evb``, ``quanta-gbs-bmc``, ``quanta-gsj``)
+=====================================================================================================
 
 The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
 designed to be used as Baseboard Management Controllers (BMCs) in various
-- 
2.34.1

