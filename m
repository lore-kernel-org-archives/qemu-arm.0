Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2710035ejn;
        Tue, 11 Oct 2022 13:55:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5+8EJ6pi/fvV0779o9UkHZRNNUKBKboQ0mZQn10btvBpZemH7HZJVVK6MmzR81WfHa4J4h
X-Received: by 2002:a05:6214:224b:b0:4af:b412:2269 with SMTP id c11-20020a056214224b00b004afb4122269mr20350617qvc.54.1665521759639;
        Tue, 11 Oct 2022 13:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665521759; cv=none;
        d=google.com; s=arc-20160816;
        b=riL9JWTw2yK0G/TznUijMRNGo5BvPs+l3IB070+Wbzkf2x6iFaK7XMn56zslOcfxlp
         WyYRdYq4YyhtLpTF0u1XSidf2+l7Lwhi6GHwyexjECD2+H3t+nXhhFArf4IfliTh6KM/
         NcHzkxhxOBSkY1x0xM7Bfu/1AGgd6Cvcui5jZtiP9EB3F4fGz3Y0+Tv9C7i/J3W4Dn1Q
         uxe84bZvCfi95rnZvthMLLq6CBAz6+J908MI0VhxqOrvNvSnjTvPxWstTGhbRia8sW3q
         n81p/c79wOILi1+ECMbuLIwaA6WS9K6Swn7EyymzkIdIrG7z3Wt35D4F/eBDplPOHlwL
         6xbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=49FxQV60TFmBCPm/S/dzlRLa4PG449vmaa8+eDrLBqM=;
        b=EaeGJtopmB4ryzdPxNWp2Di96y9P77/I5smSqsCOjqRxhKvcJaQDlPuz2Iht3aJnBS
         YJ14falJTmzzdmONld8TIDvYduIWfuR1r4WoQmtTJR0fxnNQ2YdP73xY9rKifPVslP/u
         mG+ds7yXkdsc2d8fffRC5tfuAJm+bIa1Nyq7dqstqx6eoT3X6J2E5wbBWm8vBgOnsZhV
         xwYkTYI/HTos/5JlwcAgxeGXXI/QvEnLtGluPABCaAGOx5zn6fbYoDfX7TSjxa2PahsG
         PV7dRqaeV1fHiXa7aX3X5Y3Pb8Us7UfUrPuzgCwUsdg6kg7dQaI+7sQyZkSPWHbHxFBH
         cF2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@zx2c4.com header.s=20210105 header.b=NrzWXDVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18-20020ac85452000000b0039777e80070si6202729qtq.282.2022.10.11.13.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Oct 2022 13:55:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@zx2c4.com header.s=20210105 header.b=NrzWXDVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:48494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiMIA-00072D-Vf
	for alex.bennee@linaro.org; Tue, 11 Oct 2022 16:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiM9i-0004Z3-4A; Tue, 11 Oct 2022 16:47:14 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:57984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiM9e-0001Qo-Q3; Tue, 11 Oct 2022 16:47:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44B53612D0;
 Tue, 11 Oct 2022 20:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423EEC433D6;
 Tue, 11 Oct 2022 20:47:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="NrzWXDVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665521227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=49FxQV60TFmBCPm/S/dzlRLa4PG449vmaa8+eDrLBqM=;
 b=NrzWXDVEGF0osvwWfwXgoLPLyGoYU8tXHQyf/rywkkYhT8Ab18GkqN87c9+ZSd7BqV4rAC
 u7exINkO60VXfgnN6vmFrATXlINAin7YD/8pukXaMXa1Z727S9WATUOPEaO9HB3nTHDbm2
 Ky01CZv9ETF5aqkjeWFOKGkPIe1OZkc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6cc055ad
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 11 Oct 2022 20:47:07 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 2/8] arm: re-randomize rng-seed on reboot
Date: Tue, 11 Oct 2022 14:46:39 -0600
Message-Id: <20221011204645.1160916-3-Jason@zx2c4.com>
In-Reply-To: <20221011204645.1160916-1-Jason@zx2c4.com>
References: <20221011204645.1160916-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=aME8=2M=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Siz75tnVltOM

When the system reboots, the rng-seed that the FDT has should be
re-randomized, so that the new boot gets a new seed. Since the FDT is in
the ROM region at this point, we add a hook right after the ROM has been
added, so that we have a pointer to that copy of the FDT.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/arm/boot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..6a6f4c92c2 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -683,6 +683,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      * the DTB is copied again upon reset, even if addr points into RAM.
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
+    qemu_register_reset(qemu_fdt_randomize_seeds, rom_ptr_for_as(as, addr, size));
 
     g_free(fdt);
 
-- 
2.37.3

