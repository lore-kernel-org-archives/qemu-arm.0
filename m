Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3971381lfb;
        Tue, 8 Dec 2020 04:24:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRzDh5X5sV6wKx7FsPc6pfZwIAkes1lXMorfvhd+GUE7/coyrAlJDtlUEXAhqbTRuqTzZF
X-Received: by 2002:a25:abab:: with SMTP id v40mr13832287ybi.156.1607430255701;
        Tue, 08 Dec 2020 04:24:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607430255; cv=none;
        d=google.com; s=arc-20160816;
        b=TdsNXykxTOBQeO+4+rtJ+/Zvgnjlk26vq72Mh6DU35Xrd/6MzpkHLsfkjOAOIP8isK
         gYb/aN8XKqrf+c1j6X5c/qk/9CdjGzeNomd2YHddkbfiUupAz9Wnmbc76nIJBUCLzsxJ
         mf5VIQoB80/zrUJYIOiJe8NedS8MkEh2i9c1Z1lDBG07o7nVDY6yLPHWtqKnAmOfdt0r
         /cRhKhzsaS1lsnYryLkw8Nz+ixNGqkvnehFUrAFkUdP2bCxavWzRzZ6fS+BQarJcl7wh
         Vf559qfjxnHyUbqvIE2SQgczrZBblzQ7Tf54WiKsIA7ls/e0K38e13Hu5AEW52m0knXL
         5uRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JLaYiZYZl/bsjZLj55CynwbZmKbACJyAYHuZsdIDi6U=;
        b=BUP5NmKPjuV7Mq6sTESL88u7nsdpNKfBtB87u2bec3341Jj3SAnC1sd+LZTFGrqa2D
         I9jwNQ8dxs0VM+dKMgu2kAvLGBG3Pnftb5quNLcZHsE67G6Kkfmo3o8kKGMhJ40hqJ/7
         UCBKVnxykgg30UlocoGipmZvnz5fHhkev5IFz2oy04cC6sXGMfUL0EHw3MIWiltSpN4P
         sRTUnm9z+FDDqWucGHPSyyIdggMWITUxo+bnmUe323TVbXkddDEQTDRXdT5KQZOYIoSt
         /B6tNyg5K9r/4IyM1ywLuCSeXJKmuF1G0n5EGYoJZyRDzPIQNb2QoG9AR/CldKEsQkVj
         PPgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=kVqegPZS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si11297525ybg.241.2020.12.08.04.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 04:24:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=kVqegPZS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmc2R-0007RD-3J
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 07:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1Y-0007PY-7U
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:20 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1V-0005lc-05
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:20 -0500
Received: by mail-pf1-x443.google.com with SMTP id i3so10174608pfd.6
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JLaYiZYZl/bsjZLj55CynwbZmKbACJyAYHuZsdIDi6U=;
 b=kVqegPZSG0au64NAwjFIGhpXDLutg2GHL0E0vy1Za4Mgy2ePVIEUoH3rpvqLGiKaMg
 Y323UrfxrGZWBj9EiRMABb42NmGtO9uU15v6BdMXffb9TgRCkn4tRYkj7HhK/lnnLT9s
 lL6dOKKDNrHpGQXHIwXf5VnmVBlsLyr42WAug/Y9FnSyP6nUEHQFXhwLH/EOfKoNEK7z
 nO5zV9rRbL7fJNWu+C26Ypw51jAL433VRp2tB0dPFxgvH2G2KtRPjwjw3DyQ6J/zp8tm
 QYfw4o6f2BUUuHViwvpMvDAH/2/hfo0IzyRlYWlTM7fvx33a6mwkpSZxHu+lCBusgPOh
 U0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JLaYiZYZl/bsjZLj55CynwbZmKbACJyAYHuZsdIDi6U=;
 b=mrl+m/B3eA5+gC1RxpPB58VuPp2Hkhymj41cjtJ32xkFCV7CsAzvguYhcyTCtjowoH
 phHaWT2IffQoglYHPjes9vX0tn/Rvv/X1bGYnAB2f9CRR+Nd7lIu87rL5EKQhVfhIATi
 azae7W0PmCw5VNbmjTJmaLfYXg+CHmosOy+A3OM50SeuV50XtMZTf9bneZTHdoMDbdDZ
 oLZZ9uADec63nUgjFx8sBWv22OPyg2eGEBdpb+4o9RZNZ0V6MDJFCpgthNgoNo8sx7p8
 WAT5F5rWCXw1R9duYYAjAXap+c2A+LT7xWddHjT7pMvzIySjnUak3lScgaQVnvmS3ZSp
 tRow==
X-Gm-Message-State: AOAM530DyXxCqLFVJZtpBXBFbiZHcWJOcZkP5Ffoyo4DIG5Rw86XUDTh
 LuTmExwOkeubRAzBGZJuaqfQeQ==
X-Received: by 2002:a63:da58:: with SMTP id l24mr22486632pgj.178.1607430195871; 
 Tue, 08 Dec 2020 04:23:15 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b2sm3472377pff.79.2020.12.08.04.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 04:23:15 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 2/5] target/arm: make ARMCPU.clidr 64-bit
Date: Tue,  8 Dec 2020 12:23:03 +0000
Message-Id: <20201208122306.8933-3-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208122306.8933-1-leif@nuviainc.com>
References: <20201208122306.8933-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=leif@nuviainc.com; helo=mail-pf1-x443.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XmpFGkta6elU

The AArch64 view of CLIDR_EL1 extends the ICB field to include also bit
32, as well as adding a Ttype<n> field when FEAT_MTE is implemented.
Extend the clidr field to be able to hold this context.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6962ef05d6..b54d1dc092 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -938,7 +938,7 @@ struct ARMCPU {
     uint32_t id_afr0;
     uint64_t id_aa64afr0;
     uint64_t id_aa64afr1;
-    uint32_t clidr;
+    uint64_t clidr;
     uint64_t mp_affinity; /* MP ID without feature bits */
     /* The elements of this array are the CCSIDR values for each cache,
      * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
-- 
2.20.1

