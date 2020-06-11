Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1830952lfc;
        Thu, 11 Jun 2020 15:32:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAqKxhRbVFWi7DFVbdGQWtJXfTHMB4msL0OgOdhnsQqJTUWzyP3RnnLpr6sCjbZ/HbxyJd
X-Received: by 2002:a5b:cc9:: with SMTP id e9mr5399378ybr.287.1591914758834;
        Thu, 11 Jun 2020 15:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591914758; cv=none;
        d=google.com; s=arc-20160816;
        b=cf/Bh/1CJwNPFxwpYNYHpNaEu33VHqJsMHtpcV/20O6dTdLnLudomsR5N1BbNV7E/l
         JKOgJTKCgMe2p4kBhYfO8pVyOPXx5BF4qlTf4qK1mJX1RQGWGCf6D+WgqrWQj/MTRh6L
         6Dubz+Xb+RAaj6n+eRILQrzvkW3226LllKk1MV/+JL2L3IdMgZWbnYm9aBkbi79AY+ej
         m2eMh3kdVHX3jL9tjrg5W5yZN39HcbDgJ3AQwjHDlV/0AN9v2ius4qVTcyMw7qptcWUs
         Fn5oD/cNCK+/R8ASuDUypWDUttjaCox5d70YNCdJArm47p4BJ83Hnc3J0P0zPPd8766L
         Wt1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=IQsEaB5zb1n6vsfoAp6zXcRCVesUArc2Mv6NZg2LuPw=;
        b=Pc8dlLXPFic65TsejW/dnplOWud9mwzbkEFvO/Ihf9tcNiotrpv0aHyNA7JLoFAFhA
         oXHXqzorfrYmrU+kovLVyFJrLf3gXrg9MGNe2G93jXFgCfrZUrKWgsjk6CF6+ZdNk016
         kRe/cnOCIGM1BG8OTObFfx4enV3LZ2+JK9DaZDQS1oSlyz6TTnnor66OJosmiYf36zj4
         /TyD3OGt1mhnGoMFUUYgG9DEa9DaAr0nB0LH6owASdjhJcZK1Yy/zitZqMYxswlp178T
         J623G8RGMO08qu1mD0xU7TQ4xAwwVsQxjKWt3BHueJF/q6AK+Tb4+3t788+2bN+5pduv
         koGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=MYXcyWQ8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si3494340ybj.54.2020.06.11.15.32.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 15:32:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=MYXcyWQ8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjVkU-0005da-1r
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 18:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hbDiXgsKCm4TeWUZZQYaQZSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--hskinnemoen.bounces.google.com>)
 id 1jjViZ-0003sc-5n
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 18:30:40 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:36642)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hbDiXgsKCm4TeWUZZQYaQZSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--hskinnemoen.bounces.google.com>)
 id 1jjViX-00041p-0h
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 18:30:38 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id c3so8163950ybi.3
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 15:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=IQsEaB5zb1n6vsfoAp6zXcRCVesUArc2Mv6NZg2LuPw=;
 b=MYXcyWQ8nILs+/tnF1h6mYzKlCEpLGtUuV+ye62MtsqJ4JX9MdYKZAxFNu2Ib7eRI7
 jRqUYE0L91ddrhLOjkaV3DRdqiyIZBO2KLAepsjRL9gzpFzhFQeQIBW+h1teJVqr4Opl
 c0fXUsb1WnZ75rqkRpuS3l4Z4SayRumXYC0IqjVgFwDJWFhvETPErqCkQMpYBGZaTEyo
 cYEXwILmUsoCgjbZzkzDkZU/6MfJDlcaRKes7TLuOrmthEEM25t8pWkEuaiplIMNar0G
 ViPV2NHflxToheM6zSRwnoBpVwyogGRJTSm2AIHTmaBTRBP1TQYVYtcyAT9gRO4X/N8Z
 aGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=IQsEaB5zb1n6vsfoAp6zXcRCVesUArc2Mv6NZg2LuPw=;
 b=Ma9XYoLPAdMjFAvBbX3XHlkSxrIfjyrSvhvmg3OJeAS157NaYWcZDbSByl1pw0wE6+
 AzxHmXW6r79t5eEUaqDZA7zGDdBwCWZEDzkOF/gb3/K2EIfHRjo+IYO8CRftSf8zyp/7
 N17fWxKI7jMuFL6RdKc4QFs+F7gFT37UV4d7mOsTOoipR9ekxrouxZ+Oz3VA/Cw9CevU
 ANPvmqf4oS0V90pOxQH3/Q0Sd3RI9KqgWTIRc8tv+UB7xtgD8u8+1fDaLHP05KKuyl0C
 d75Nr6HS2ftgfmJKlL1S/dCBcDnyCiXO7b5HkkhjEjcRonzhFOXUINnIm9ghSo2G4Jft
 UO8w==
X-Gm-Message-State: AOAM531JSFy4yT3b3JHPHkCeo0y5nY7iUPBeXBuhBAsJrT5QeFNXYkJu
 OgjWg2sM7+ZHtaPkSp1s0is7C+gwl8qIb8w/2Q==
X-Received: by 2002:a25:3055:: with SMTP id w82mr17824647ybw.21.1591914629653; 
 Thu, 11 Jun 2020 15:30:29 -0700 (PDT)
Date: Thu, 11 Jun 2020 15:30:05 -0700
In-Reply-To: <20200611223016.259837-1-hskinnemoen@google.com>
Message-Id: <20200611223016.259837-2-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200611223016.259837-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH v2 01/12] npcm7xx: Add config symbol
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3hbDiXgsKCm4TeWUZZQYaQZSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YLFuXyqihcHL

Add a config symbol for the NPCM7xx BMC SoC family that subsequent
patches can use in Makefiles.

Change-Id: I6e4d5c58716cb6fe4ea5d06f148beeafda55f9a5
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
index 9afa6eee79..3738c1f5cd 100644
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
2.27.0.290.gba653c62da-goog

