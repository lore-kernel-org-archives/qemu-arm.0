Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3345220lfm;
        Mon, 13 Jul 2020 07:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiZ1w2gfnu+ljD50TCPyKwE6IaBAbHVN+90PO39Dmd/IXlLwZpSzmkmj6ohDqyh2EYHmly
X-Received: by 2002:a25:570b:: with SMTP id l11mr483962ybb.246.1594651054918;
        Mon, 13 Jul 2020 07:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594651054; cv=none;
        d=google.com; s=arc-20160816;
        b=V9ReVlyGihJB/CWyqx+b1z9ZBTqCp4dgNjgF2l2vOQ9wgwfpiu119AZYGvf2tbnlUY
         sCJT4Dlw/5c/mKpSFXQjkkbLnA7m2pQ3RcPpbqXP7e6pSupOaJijiVoSrIGvqyzkB11C
         Y/A+kH2Lmcm0TOfdbLJQufl3i8NN3re+Lnve7hl91zCpOm3zxHnSwXskdW3FIsGTsSH+
         9VlG5PYvkUidJMoUHaK8kBuoy5TPvtjgauE/eikl3OZ3ut14SxFQOEY6PRKG7NXVzt/R
         qqbee/fmFFbUyGlrqL7fRjQ6PKt+wXr1LfyH427/2DM6ko5DVI6XIV1tNBOC8hVyZAh0
         fO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=nB/5rC0VVxktBcVawvErd/qrg+KIJA8SmLqeHRRk/Lw=;
        b=jXMysArlM5NbvCOSiBYzjsJ+fxjhdyJISjntCdj3drh7/Z2EZvwFsWw6ZdGKZ39or+
         bBtPYb20a80PTA6Zxz0Wrb1QFah0XVdA2beP8zDA85ohsSajKYS0NdUEHOEdVkBhm8XZ
         4yf1f3mjFaG0XB0g7Huvdt9lq7z8sJPRZBFd9nyJMcLaxuq3T7yjrNl3BdZPXUKmv20q
         hCbXk5MZKPb2QNgR3GgXFgRn0TE3CukrGfTmZfryMiw1ZOk7hPOt7E0+urTWLHEnTaWX
         p93RdvIcsSp/FFuiC9zTDCTb5Z3xBFfVcpnBtDF8GJW9YH4dMNmEhyaw5/frj1+y38Hj
         azcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jztX9O/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j194si13808938ybj.243.2020.07.13.07.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 07:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jztX9O/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juzaI-0004nv-B5
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 10:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1juza8-0004nK-2b
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 10:37:24 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1juza4-00023h-Pv
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 10:37:23 -0400
Received: by mail-wm1-x344.google.com with SMTP id o2so13405523wmh.2
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2020 07:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nB/5rC0VVxktBcVawvErd/qrg+KIJA8SmLqeHRRk/Lw=;
 b=jztX9O/7Tm1QBLswG/KSEekcoGrtP1uoa3C5mQ709P7uaI9ZUgiBvt/FrcQH1gORb1
 TITwNct1XaEUQCO+j0epMYjNjyVV/DSuYKJmJAkgCpb+B7NVMjyhInp7Oim5IBrT0uft
 FjWBZu4o7c4L5dLsujcPY9TlBcbNAuWdke+n1+0V7GZhyIXdQGh3eShdx4tCoeEdVJSB
 2v5wa0Hfc00gA3yy17OtE6mo814RGaFdZmJfgtqJhQiyjZnUISWgINeEQJOqKOfykZUd
 2xGb1Q6ICWG+mTXyngl9hAOfTp8F6vezq0Wu21Q0szAUJHbrbJGZmAHLbAefzKiGt37D
 pu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nB/5rC0VVxktBcVawvErd/qrg+KIJA8SmLqeHRRk/Lw=;
 b=FzAvoyCNnhXvuYnird5mbzOCGSYNwBen/Xv5B2hI7fkpEXcmZN+its8RBVuUtluQNV
 DccvHkTYJWiW4lEoMPrMIxRTXL1FLEiVlHkbUbaI1lhLIApYfMW2rxTzy77bALhuRsgp
 NBY0MRg0O12ueyaz504szMHEamf79GJlaFxQ63AkiG9bUZ2nvQsu+pu8Qt+BeqJn+7o5
 58CoNQ/69dDuUMHCX7R0lqejNEXGVsn9Z6CTBW1fbW9Qq9MJ0YO+XV80kEzH70Lf90UV
 7t0/nFt+C6n3zRALQb6LS28bfeA8dTZssycKdYXrXWfhb0H2M1iZIAcYXPGOidtDGSje
 qsBg==
X-Gm-Message-State: AOAM531pGZwSZ0YDib3PjpuswPKNiMq7d3B6AcK9I8Cf8gzEC8egJDhs
 bQ6Hv5C5oHv083Y08AWMXXm4VhWwfNGpIw==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr256888wml.33.1594651038602;
 Mon, 13 Jul 2020 07:37:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t4sm23464334wmf.4.2020.07.13.07.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 07:37:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] hw/arm/armsse: Assert info->num_cpus is in-bounds in
 armsse_realize()
Date: Mon, 13 Jul 2020 15:37:16 +0100
Message-Id: <20200713143716.9881-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: yTnfoLw9rpLM

In armsse_realize() we have a loop over [0, info->num_cpus), which
indexes into various fixed-size arrays in the ARMSSE struct.  This
confuses Coverity, which warns that we might overrun those arrays
(CID 1430326, 1430337, 1430371, 1430414, 1430430).  This can't
actually happen, because the info struct is always one of the entries
in the armsse_variants[] array and num_cpus is either 1 or 2; we also
already assert in armsse_init() that num_cpus is not too large.
However, adding an assert to armsse_realize() like the one in
armsse_init() should help Coverity figure out that these code paths
aren't possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 64fcab895f7..dcbff9bd8f4 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -452,6 +452,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    assert(info->num_cpus <= SSE_MAX_CPUS);
+
     /* max SRAM_ADDR_WIDTH: 24 - log2(SRAM_NUM_BANK) */
     assert(is_power_of_2(info->sram_banks));
     addr_width_max = 24 - ctz32(info->sram_banks);
-- 
2.20.1

