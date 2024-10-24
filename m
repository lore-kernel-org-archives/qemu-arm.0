Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp226805njx;
        Thu, 24 Oct 2024 03:29:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXq9NytAwkSf1Ad3TWphX1ANyRwFPh3aZ9FquwwoB7okMOu1zwvqO+jeZChC717Z1IeTiD8okfkQ9EDJg==@linaro.org
X-Google-Smtp-Source: AGHT+IEZvVIdydu8sTYlGdlCoAZubcf+krj4hM+pi3RwNPJItgleHD+yxq15ISlq66Su0JOF+lK8
X-Received: by 2002:a05:6214:88e:b0:6cc:2cd6:24 with SMTP id 6a1803df08f44-6ce342cc5a5mr65015236d6.36.1729765757034;
        Thu, 24 Oct 2024 03:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729765757; cv=none;
        d=google.com; s=arc-20240605;
        b=ZPk/y/mTSsoWj9QwQHCzNCCx150VkJPzK7JhjWoDEvAPIWomPe6ZSmeDWLINM2pqG7
         zu0w/EC6QhDd8lQaCrExyju08c0HEEqUMpzD19FZ5xPuWoDK/H8iIAYx6Q6KXgbcEDuQ
         ChPiJAiEDZb5cq3Aasjg0g2uP8wv3JANOsnzFxoXqTRT+gC8UCUnscXzOtPNay69yDMM
         hkoEPJnBNd80QvV2fDp2QxGp89vWQPWvPaZ9ULBbx7EWIuNqsVRBnNUkS9tN/g6TXWST
         CanuHHxNgUT7NKuyhnvNBPtYBH0W+aD9kZxIYKaDzCP7Ygy2rbBDF+MMOpWUru14xyP0
         1D6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=43Rqa3rSbEjTn7/M1pMockmjAAn+2b2pe334Yd8EcZ0=;
        fh=X/cEeG0IecOcbktZzhggOUgW8rnsW2Y9KQE40BZHOoA=;
        b=G1tWLHurZXJyzoJuuJvMoZ1niEsKS8QDt5gmN9To3AZa+PakCjtf6CJLpiM9DMXV+J
         IU7nYk5z6vEe+6pWg4AfAR710uIhFmK+NFVHGUt7EIklF/A02rvTQSDRBhh+ld0QclfT
         KSceLlBSsBNIxBloGdVs5gvlnIQmorzMsbTma31JnVVcawu6CLaftggmxepTMHqQnLQF
         UWuTi/N5BDzRY42Ft7YrL9Vrg0EGL17pDi4hOhdZPMY+4vlQh4WhFUD6zlYFilre4MbL
         FKGlzfBQ+pMIJg8GdD3an9jWaAfLLfevmyU/lkrK+AHBHnb1VP7l9A1Y3lpWiYHGLC7Q
         zbJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=W0Mqz4T4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce009ce9f9si125723376d6.321.2024.10.24.03.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2024 03:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=W0Mqz4T4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t3v59-0000rV-Ud; Thu, 24 Oct 2024 06:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v57-0000pd-8B
 for qemu-devel@nongnu.org; Thu, 24 Oct 2024 06:28:41 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v52-0008B4-3U
 for qemu-devel@nongnu.org; Thu, 24 Oct 2024 06:28:40 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso91020166b.3
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2024 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1729765715; x=1730370515;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43Rqa3rSbEjTn7/M1pMockmjAAn+2b2pe334Yd8EcZ0=;
 b=W0Mqz4T4S4R6tkeOLRFstQLj0Sy5WUh0poDANHG2wWSQqZkV1Z+6wILSCWUTOFY85Y
 nOpL1EGjoD0Zsbmph9Yqs3L+lqumRuuK9JzaMNG4t4jECUB97XyfTDsZkiWuN11vTVAo
 fqrMhWmZIycVMWUGR0C2+TP3qphs/uI5ujn81m+AMQi37EnTbKTMNnraUFgVySNt8fds
 v7SsHPBBvD0MAeybplS4pFBf7LJ3aOOgmsQEv/4xnMeKLSHZa8yBLB2M8AQsH3TKPeFB
 P2K5T8pX9eY+GrrM0QxQnnDRc5K4zUgFD7Lm7bEDXzUjuEUIz6HA7bQVkR/pB7PP5SHR
 dvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729765715; x=1730370515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43Rqa3rSbEjTn7/M1pMockmjAAn+2b2pe334Yd8EcZ0=;
 b=K+B4zumo7320k5HT6tDCp50KTiTzWewzhnmNGei0MpPu6wYjUygcgLeJbxEciaJpZt
 6WpnG0wUuP63KBBe66nER8SaY4AKeCYEMzWAyU4L1/zFKBcUav3pGZdxVKRiskHL9bas
 A2aarf85yxZVxSqoMKUVIYsw9Fix5OI83DIlV8sPsIlofxUbCvtwuhynpbGywwBA5WCi
 O9tFJwLgBi9kCoJsoEsAtUIQ7DA4sfAlTkL9wMwNWinvMydGENvvCbuIEGzxxyNRCaJQ
 gE9eDkDYH8KYL4ugYkkvPU+APp/uffLu8UD3Y+XqmY4gevmW2SJ/zeGYaalSzlfGK1+7
 MiYg==
X-Gm-Message-State: AOJu0Yw5MqY7vzzU12ABDfvfp2Lc2e2NXaj/TgF8OyfgVogf2uft5X39
 KcyyWve2hkNmJ5fk1dP1X5ERnPhhn7f7JWtX2JYUO52Ip0gP96qh1xl15GQQWFyh2YgT2c3f3CW
 oHw==
X-Received: by 2002:a17:907:7216:b0:a99:3318:e7c3 with SMTP id
 a640c23a62f3a-a9abf94de69mr532170966b.43.1729765714570; 
 Thu, 24 Oct 2024 03:28:34 -0700 (PDT)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913706d3sm601019066b.134.2024.10.24.03.28.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 24 Oct 2024 03:28:34 -0700 (PDT)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Thu, 24 Oct 2024 12:28:03 +0200
Message-Id: <20241024102813.9855-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241024102813.9855-1-phil@philjordan.eu>
References: <20241024102813.9855-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::636;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x636.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: UNDWdLvrhYGm

I'm happy to take responsibility for the macOS PV graphics code. As
HVF patches don't seem to get much attention at the moment, I'm also
adding myself as designated reviewer for HVF and x86 HVF to try and
improve that.

I anticipate that the resulting workload should be covered by the
funding I'm receiving for improving Qemu in combination with macOS. As
of right now this runs out at the end of 2024; I expect the workload on
apple-gfx should be relatively minor and manageable in my spare time
beyond that. I may have to remove myself from more general HVF duties
once the contract runs out if it's more than I can manage.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3bfa132fd6..16ea47a5e6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -505,6 +505,7 @@ F: target/arm/hvf/
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
@@ -512,6 +513,7 @@ F: target/i386/hvf/
 HVF
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
@@ -2580,6 +2582,11 @@ F: hw/display/edid*
 F: include/hw/display/edid.h
 F: qemu-edid.c
 
+macOS PV Graphics (apple-gfx)
+M: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/display/apple-gfx*
+
 PIIX4 South Bridge (i82371AB)
 M: Hervé Poussineau <hpoussin@reactos.org>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
-- 
2.39.3 (Apple Git-145)

