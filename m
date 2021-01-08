Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp737438lfq;
        Fri, 8 Jan 2021 10:53:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIHTnk6CL3vOJsctNlfLyfQm63K+3FgrN7cFj8BcaagFPuM6UMrNMSMtk1F8yAYs0lVgx2
X-Received: by 2002:a25:538a:: with SMTP id h132mr7068799ybb.247.1610132014800;
        Fri, 08 Jan 2021 10:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610132014; cv=none;
        d=google.com; s=arc-20160816;
        b=YBg2L0GBCmg3ZKkghuldbY/qxQ2H7C/VJdx3bj3GhXWDZJ2yM41UOGfTdsMGIxwUO5
         llNHhkowUPeFq4kdBoan63WdkRAFTapD+Cg/6nvcEbdch9m2ggMZj5rhfALByTuwB2ug
         Fi1AQUtsYxyPqtTIvSIMJVMPVX/7tn3HyHV7Dg4W0DemMEeBuMzMPCQBC1mKkmUIjS+e
         Jqd0ttzFi0KbyQvNVEk2HHceuDacDasrpi/U6gY0dEVqUj428QseWrEFMVNBwwGRvW84
         S9wPjFBRuRTMioYPExt4OAqYjNQUiwaW5Hi8nPiQFDittZVvJ4bUN1sksXLVo8h9Gsnz
         lO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=E6mZPiQraiTh4Bg0YyL1OAnwyrTn4m3pw4jIvmfgdr8=;
        b=SLgjxO/o1S2QCvv6SYKAIUf59RHsao9iFSOZ/WQGcjxFgjJ4sRJEOK4I/uXsBYLXvW
         67Ajp5ghX7hA27IOaD1x/qFsMCQVvzBjX9RIgLFK8ymiQCJbovUINPZPrOvUcTFopwG5
         nNatZhdTmXa5fsi2oNOr6ug07OIf8aSexKwgUZcFq6cvAMptwX/exmHqo+8sgCcmzKcI
         2YANBVyOvF/glCAHgcB659iQSaQNuADrOYfX8SMj8lianfzEJ7SGFuUU7SPcykKif6xg
         tLUGRE73bfkE2pHgxRatSsdMOSJoWyyy2yHYuF7NU0q+D6+kQvFILyD/BTGz3uxHk9C7
         kwKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=OJtJfz2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si10064719ybs.204.2021.01.08.10.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 10:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=OJtJfz2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxwtC-0004GO-5Q
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 13:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrg-00023Z-4w
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:52:00 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrd-0000sq-PL
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:51:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id r3so9987606wrt.2
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 10:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E6mZPiQraiTh4Bg0YyL1OAnwyrTn4m3pw4jIvmfgdr8=;
 b=OJtJfz2cno5qxT9BC/EfF1BoMXPJV/wgmu3AliPwQcl5NOwQ8v19EwpX0Rw2IWjnza
 D9akoSh28WwyLxMt1qbJKIKD1rswYXBddIaeQoojzGjJ3mcafi/p191MezPgw/pqpnMy
 aqhVOf6cfgwB5I5vZKCcRMmJb6XFOotPYV21BrOrE1l3arg0OMltz7uSzp3xwmIzuheC
 FMOihFoj4osKVy7PbkJViSUB264+2WlqBPH8n5iWfyx8eDpmmjTPUSAwCZgEjxALZJYJ
 QqLt1UJ+6soELKCmN14DDMe5nu7sZeqczdkgOJ1yZafAR8R17mMLop+MLJx2A0jcUByS
 bcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E6mZPiQraiTh4Bg0YyL1OAnwyrTn4m3pw4jIvmfgdr8=;
 b=Yw8lPFgAiy72ga87p2JWMSiYYWI1oqTHmxSena/PN7T9oMNdSYffxyCV/PVGsh6jgk
 cThQFQB/kMhTHjVaQIX0rhwEljgsBSZDulM8vuz84k44BR7MNdz/eiKvzG24UXauOsMz
 5nkTKBml0HP5iW64CRFGnlEN9zupIASJRRdEKJGuGmWjcOtevcHsge1hDerz2fyQ5g9/
 eC8MQzEEfGo/GONUHGSXwv5VlCOAQhuwiebyBuM0VZ9DXkKFnVa4gO9zjrFmcBx77MES
 uB4u2M2nT1AsUYAYVqbPAqbogQgDLFxoLWIDcRP2h/hkC1vZeEziTs7C6WbnEjNHp3Bs
 NZRQ==
X-Gm-Message-State: AOAM530l9STaQRoJmE+HB4V9m+xe1MCreJtd1ca39wK+9fwR/SScZCs/
 D9MnfKnf8KBkPZIw7s/ZZsO/ow==
X-Received: by 2002:adf:f6cc:: with SMTP id y12mr4967155wrp.35.1610131916364; 
 Fri, 08 Jan 2021 10:51:56 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:51:55 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] target/arm: fix typo in cpu.h ID_AA64PFR1 field name
Date: Fri,  8 Jan 2021 18:51:49 +0000
Message-Id: <20210108185154.8108-2-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
References: <20210108185154.8108-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: caClP8983rmE

SBSS -> SSBS

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7e6c881a7e..5e3cf77ec7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1883,7 +1883,7 @@ FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
-FIELD(ID_AA64PFR1, SBSS, 4, 4)
+FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
 
-- 
2.20.1

