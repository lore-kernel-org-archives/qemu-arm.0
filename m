Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2196161lfo;
        Fri, 5 Feb 2021 09:23:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2bIxEHIqntZNWY7oNMM9C3LAy6pII5pDswQDJF0EI9MaKbLF4ilVfjzugoNpfFJ3loMkz
X-Received: by 2002:a25:7397:: with SMTP id o145mr8485877ybc.523.1612545814331;
        Fri, 05 Feb 2021 09:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612545814; cv=none;
        d=google.com; s=arc-20160816;
        b=zy0Qc+XWffbKQ5/btxOabSA4nR2d06pdYUvVkCEkFm58c1FgvPVg8P1pk0eUBXYW4L
         5yoOKD2XOuD1aQHXITInQeCvh653ol1HePt2ya2GqP+1u5SgLTbl0j+4MGawTv8RMY/w
         HdWpFxYZG02f2Fv2e2Jw/pVhUQWYQv0iUGHvCEZpen/VaIHhBSGhEcoG7HjaZtr0OOa4
         G+n6OTV/7VTBtjyeGnCvmwoQ51+b5BB85tOd6mmAxNQqFvfHLGQXRvXdhl2nuXtKikYp
         uhF5CVIdwRbksVGcQU8GmWFeeSC62CrpHMKxB0R/DPhbHVYkpRfeLMfhqN4gOhpbDQia
         GD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Xp3VtAOG1GswVbARvzGyUBGRaDF2ix07eBPCXFhqLuk=;
        b=PmfP90IBlFEHbizYUCwdsVJVLHcJTGDPTmYUjtn6JvK2mBACUpmkzEdTr/EZNkcFPe
         T+KJBDhE0oKXftg1CqLmy8WGdORuEfHujhknA++xOu6vGrGMJx+Zmo1jb1C5CIjh5x0j
         vdrhw7QeMFQE6JOJNenZT57T+O+J9FfLIud7stmRmfRWK5H8MgyqzU87GAz+pY/tAt8R
         c1z+5cse9S56GGmxPHxkuGwba8eER6hospf7iQwPPV/3d+G5oQNKaqA9q7xnfmCGSd/l
         82vQq9agj+gMiyS1KRTLZIGjPHnXQayA9OQ5LGZJYnKAecSPtz6KP4fGeQecByToakys
         Bj/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zzMjQ8kG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si8533172ybr.163.2021.02.05.09.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 09:23:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zzMjQ8kG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l84pR-0003f2-KH
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 12:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TQ-0006gZ-R6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:54 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T5-00040y-9r
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:46 -0500
Received: by mail-wm1-x332.google.com with SMTP id j21so3737828wmj.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Xp3VtAOG1GswVbARvzGyUBGRaDF2ix07eBPCXFhqLuk=;
 b=zzMjQ8kG+iiRuUcKWhuNiYn/oiaJh2lpMWqNQdJ5NtXsp0k3Ka3xqWvULtSgGTF1ae
 4ZgVphvW0q5Te64U5tmn0qNKGbVVPZ7WdeDWkCOjWX7m4AF6Tm585p7GxHc7CPIh1At+
 32bnD2skwB+RTPMIxKeioerKusBGAErIR1uUEImSQoYibiQrMu/1+kUPKarAOs26KDot
 W3VWzph5tagVSRzWSU2CxEkq4CfEPUN3K0Jt/KW/7ADgaRx/0x2FufLVz3EP1i1cQdAd
 To5TOK2y/vMn6G/FlRz83URtlbO//+81meUB7bWVowXPQ43CJiwWSYSYDwrtyxHYnKI3
 WNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xp3VtAOG1GswVbARvzGyUBGRaDF2ix07eBPCXFhqLuk=;
 b=ctVAs8mXYiBCV/pN+7Dkm4EnVidns5Oy5yzwYKgTGNRgV0Fn0Lrg0mvij+p8c+vb0e
 7Dq5h6ZnTN1zQ5zgmdsh44dmC788KmKdvezvJrxjUuhkPvcieokiHNoEBwSs92pfR9iw
 pioZvERAz3YM11cm2CJjQUEdQ0XfDHAGcOXx2QeCkdrtJqmrA7OtbhmnAqQb0Xvj1jtl
 fGHYzso0bt7V9rloqzRzL53kyPLrzRjeKOe04OrTDgiWiVT9omZeqmKsedNHOjLSRXBR
 fD1yixlWwH9FIYvELC7++83KHY27G+uOjJLx1ze1CnNRD/HlPuhitkJzhF0hkok2NP60
 2zzw==
X-Gm-Message-State: AOAM532AYBgyPvYXwSSvooXVbSlxOLs+SwvVlE5SuLIjhK406JYlIKYH
 JkXwPf2ozKlnWSDtXmEmofOqG2YIdwq5Lw==
X-Received: by 2002:a1c:d7:: with SMTP id 206mr4414038wma.68.1612544424256;
 Fri, 05 Feb 2021 09:00:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/24] hw/arm/mps2-tz: Correct the OSCCLK settings for
 mps2-an505 and mps2-an511
Date: Fri,  5 Feb 2021 16:59:58 +0000
Message-Id: <20210205170019.25319-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: m5rnFMopyEA4

We were previously using the default OSCCLK settings, which are
correct for the older MPS2 boards (mps2-an385, mps2-an386,
mps2-an500, mps2-an511), but wrong for the mps2-an505 and mps2-511
implemented in mps2-tz.c.  Now we're setting the values explicitly we
can fix them to be correct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 7c066c11ed4..976f5f5c682 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -221,8 +221,8 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
     /* This will need to be per-FPGA image eventually */
     qdev_prop_set_uint32(sccdev, "len-oscclk", 3);
-    qdev_prop_set_uint32(sccdev, "oscclk[0]", 50000000);
-    qdev_prop_set_uint32(sccdev, "oscclk[1]", 24576000);
+    qdev_prop_set_uint32(sccdev, "oscclk[0]", 40000000);
+    qdev_prop_set_uint32(sccdev, "oscclk[1]", 24580000);
     qdev_prop_set_uint32(sccdev, "oscclk[2]", 25000000);
     sysbus_realize(SYS_BUS_DEVICE(scc), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(sccdev), 0);
-- 
2.20.1

