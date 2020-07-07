Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1201555lfm;
        Tue, 7 Jul 2020 11:49:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYBB0DT7W0V53xMnTMoO33HO+ex9AJ7o/KyfXscLJ0ltjGLIjpv7JImHXGUtq/NhO5nMqM
X-Received: by 2002:a25:d1ce:: with SMTP id i197mr92236081ybg.296.1594147743327;
        Tue, 07 Jul 2020 11:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594147743; cv=none;
        d=google.com; s=arc-20160816;
        b=IngIMtEXReQEGB2o2/RP7NKgsIy4kjqqWJJc7Iwdd7zzUygKLRla0bMUGoBIlogF7P
         C+73i2AsvLIQUrhT7XiQ+32v1r7wBVRFk68UPaqeKmfJo+JUX0hd8RjOGd/MUfDuWnHG
         HEzBEM7/J9NEAEd9eYkU7pPMINOysN+IpwY7y4lFfqbvrMLZH4iN0FpuXXTwSAVVIfSx
         DLDne2vo2vC/qD7zCiWYe6HqIgkWOs0kwNwIgexf5u3JimtMpwvy0MsAsQMcJadr0sX4
         OL/V7gh9cFJtJ4kfZiNxvl1+LCBxKpxsyDsl+YidcZuq16IeZrumT7IuAEiVIF4DVc03
         xe4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=x4zl2op1cKzABpWzOJ32Kyt+vBmeWcDSoujgoCFMWWI=;
        b=NtgyXWbVaVvHpKDGIikBdeNy0Hkt4cPfdI1PKBzMyt72Z4wSd6reE4qeDmbBlyNMwO
         aDN6+3hkFMiXmlbD1GJBqBS4QRdgU9wu6MaMmzE/rzybN9ioEiYE8qdS3C5TDUSwiseR
         QEw5ZRpnNtyi6lvIdwLcmjQVarWQ0dkApT+kQk5uP1RcYhyLeGwGNxT8u30C+j6eyh/L
         WW7VVhuGsjD5Ie6L81xShxw+GefRkZotstCaugeIussqP9IFuPESC1HFL6cI+lO9uf2/
         fpFnjBNzUOGyEePyxGGCbUVCHCbIjvxC5A79gwPhG2qIv2DON5KmfuzIWbgktlYtPfLF
         V17Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Fc4yKq5s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o65si10740621ybo.428.2020.07.07.11.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 11:49:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Fc4yKq5s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:33280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsseM-0002JY-MS
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 14:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3S8MEXwsKCOILWOMRRIQSIRKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--hskinnemoen.bounces.google.com>)
 id 1jssd5-0008Ps-68
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 14:47:43 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:41558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3S8MEXwsKCOILWOMRRIQSIRKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--hskinnemoen.bounces.google.com>)
 id 1jssd3-0007Xj-Ic
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 14:47:42 -0400
Received: by mail-qk1-x74a.google.com with SMTP id 124so20905259qko.8
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2020 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=x4zl2op1cKzABpWzOJ32Kyt+vBmeWcDSoujgoCFMWWI=;
 b=Fc4yKq5s3Ui3JTvioSaq1D9ezmZeTbO+onO8ukc1LzT6CYfY3bezw1nK6ThlSx99kD
 DcJJ9ALmT0yZaEoc/ebYuHBooaBkk3d9c1CkSWOD6pkba1rnqR3E2msTmEW0CH7oi1DI
 jaBqmkNuRd9RAHYZSy4fgV9+5WFrsibBKkic+y3TmH2QYbMQzxo4vG3JV/7fey5joWOg
 kb4X877wO9vbgI7Z3JvifQcbCEqwrLol/UIu6zi/2g8xbseaPIMQt5FNykh10kF9Bvk7
 SAOXluitt8NlE/9NSbIWhts5FG+63GWwaiGn2kORxd6WyBpGvn3rWO9RnjoWc89HXs1f
 BqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=x4zl2op1cKzABpWzOJ32Kyt+vBmeWcDSoujgoCFMWWI=;
 b=OUvoX2zCLucWwwzVXoWHmTCQ/8g8sEjRDROimM/CHCsL0JN2/XjmiTRGeUIRhupqMc
 rH39RW3Hh+OCFAK4X2jFPiwx3T6a+RvC/IUoPsObzlRyB2BI3wgV1YSEOFwf9XLr1nl1
 68Tw7l2gqrJJddBaCIOn5dyRqkx6T7WAFTVBjXDUvCfBM+W+i4jNuFd7ivWbfkHrosLr
 Ool8ssRMq9gpMQhfLFEbSCNNSprFJokEUL+B/0bWOB3aeMMANZCLYO0yQQeeZBekDLkN
 y+HqMHcZEqpOSNhqSMCIO2QhjOw/mg0g9oVwqSl2bcgFwEAT7sq7aVxz/nz8AqG4iYMd
 sHXw==
X-Gm-Message-State: AOAM532eldzegsE8nEPkRNpdQl8rwJORtQXF2J1f88wvV08mf2ve0Ws8
 8rU/AOWC0xa6lkTOllABWND4BQEX9NL1IYlXJQ==
X-Received: by 2002:a0c:b2d1:: with SMTP id d17mr43471302qvf.100.1594147659912; 
 Tue, 07 Jul 2020 11:47:39 -0700 (PDT)
Date: Tue,  7 Jul 2020 11:47:19 -0700
In-Reply-To: <20200707184730.3047754-1-hskinnemoen@google.com>
Message-Id: <20200707184730.3047754-2-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200707184730.3047754-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v4 01/12] npcm7xx: Add config symbol
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, philmd@redhat.com, 
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3S8MEXwsKCOILWOMRRIQSIRKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--hskinnemoen.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r950AGqHV7BP

Add a config symbol for the NPCM7xx BMC SoC family that subsequent
patches can use in Makefiles.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Acked-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 default-configs/arm-softmmu.mak | 1 +
 hw/arm/Kconfig                  | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 8fc09a4a51..9a94ebd0be 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -27,6 +27,7 @@ CONFIG_GUMSTIX=y
 CONFIG_SPITZ=y
 CONFIG_TOSA=y
 CONFIG_Z2=y
+CONFIG_NPCM7XX=y
 CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4a224a6351..a31d0d282f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -354,6 +354,14 @@ config XLNX_VERSAL
     select VIRTIO_MMIO
     select UNIMP
 
+config NPCM7XX
+    bool
+    select A9MPCORE
+    select ARM_GIC
+    select PL310  # cache controller
+    select SERIAL
+    select UNIMP
+
 config FSL_IMX25
     bool
     select IMX
-- 
2.27.0.212.ge8ba1cc988-goog

