Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1430937lfg;
        Sat, 15 May 2021 10:42:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfwsN3tfAtjNyaG6FrBfCc9lmsziI+d1HP4IeAcbTkjC3MKbeUzWCwAhja36ImwEa1QlDd
X-Received: by 2002:ae9:e304:: with SMTP id v4mr50211525qkf.163.1621100558739;
        Sat, 15 May 2021 10:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621100558; cv=none;
        d=google.com; s=arc-20160816;
        b=QHpp2PCkWVE5CrDlgwjymWYd3vMScfrQlQfS2XYJm9EYMVJiosYMPgp9HQSnP6r8kV
         qNDkZ8XuAGG2QULjHgD0TkBvJxCGU9WqK1dWA7IlgN5GhlycESzqW2LHVsoX7czt6zes
         ohInXXtwfk3zgOkChq4TfiKz8DVEpPcmoxAF+ftbJdR4SdjB5hCEkt4xckeK6bVi/bz+
         UcEO9MpRHuPK6hjxfhC/BLT/bVxz7UOuhG2wyH7mkNxqj5rDhx4mDd73sM2obqbWDcCs
         IUkbCtkSgqU1IV6SQemuqmsdWM1qd1xbWpkQgeEsXAR/kBOOPF3SVdUIrREqSyZMbn2z
         zsAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=S7IAZU3SpuyZA/TPUu84zMTCi1tlnlEn7V9DtnfwMAo=;
        b=k0V6vGoHIWdebRaiqS27ozhWamKzsXgfcYN3EYP3CnXumtUvsUgw1uHlfUh5D9Yb5x
         Jhigi4KodRdFI8MAmhxl08FXNuaGgrG/rQSZSDm4qGuqxfDx9aoaRqtGsZaGXgPLOaw4
         xA5Cd8QY9AyUVv53eotiwIDsTH9ar59r5YMjFYaM3T/Nawp8RDtXIzQsRxniadrWCHvS
         TmMvLPL444mtbDKeaZc7CZRqJt0CxYbm0UKNJVzzSewY3I4n9z5Y8Y/RobQ6lIhEkrp0
         oktZP71BEdYIBVXhL7H6uUDwZg905ozXVqRcYzuyv1vHFTT+Ceo45QFd3Zb/2JmO3XM/
         Sodg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E5YAm38Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i26si3730919qtv.310.2021.05.15.10.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 10:42:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E5YAm38Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhyJC-00013e-3c
	for alex.bennee@linaro.org; Sat, 15 May 2021 13:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEf-0000pv-6f
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEX-0006Hr-6c
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7IAZU3SpuyZA/TPUu84zMTCi1tlnlEn7V9DtnfwMAo=;
 b=E5YAm38QHzAgmKd27PBH7F+wicQRUEA5xQ4VgYljkCz7wQtZ7ZdI6PqA6Mf80sap0aixPc
 saGUn5GJTcHIIPDS2X79iJ1WQqOYwL8bVlPQiaCiwexdN/aRXiv+NdUzoYCxWAWmsg51ua
 EpyKzDsHoWFV8ChduiuBR/SqwRbaAUU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-pi6XUNTDMSOs1vtCaf5NGg-1; Sat, 15 May 2021 13:37:44 -0400
X-MC-Unique: pi6XUNTDMSOs1vtCaf5NGg-1
Received: by mail-wm1-f72.google.com with SMTP id
 b16-20020a7bc2500000b029014587f5376dso2416330wmj.1
 for <qemu-arm@nongnu.org>; Sat, 15 May 2021 10:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S7IAZU3SpuyZA/TPUu84zMTCi1tlnlEn7V9DtnfwMAo=;
 b=hrZF/C0QBYJSQpGP70ml6HznKW6oU8kO4F7vxrbbFrFySrHygCDi4h9NfHYwD4EJ1w
 ibb1zJV21meLmKllVXuXsoRl2v5Y5a9RFOkroZSg9QDC67pctOdL0vMxX53uAf3+s5KA
 07Lcf/nHjNBZMEqcSbHxo2w1Q0bm1bZaDzhnB2felGOr8DUx2Wn0ppxrSartuy/zYKdC
 7rt/3lRoL41s2dYjSoDhP3UdtLgCShKI93kALp2PXEFOFJEj3N0eiBq6ZJT3sDCKbOl4
 oaArYUKYdPje8cPj319kF8Fobs2tLl0n7IV9kBNIb/W4oD1hR7cbOO//e3WzYYMWtqlr
 h2mw==
X-Gm-Message-State: AOAM530t0Rj06fJAue8jNPx0mTriiiVoL2qz6dHKfs/GFJ51GJiRlRdR
 VEWnshF8XuR5PC/vDADqtLmmD1UuLB/1e7zwhtaYUSx12bB2m1nd3+x+raiPn1m0dTIFK8AvN5H
 r5Eg90i21AKpr
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr17484726wmj.77.1621100262896; 
 Sat, 15 May 2021 10:37:42 -0700 (PDT)
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr17484711wmj.77.1621100262785; 
 Sat, 15 May 2021 10:37:42 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id 61sm11021853wrm.52.2021.05.15.10.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/12] hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25
Date: Sat, 15 May 2021 19:37:09 +0200
Message-Id: <20210515173716.358295-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OhndUcdPC8Q3

Commit bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
added a dependency on the TYPE_IMX_USDHC model, but forgot to add
the Kconfig selector. Fix that to solve when built stand-alone:

  $ qemu-system-arm -M imx25-pdk
  qemu-system-arm: missing object type 'imx-usdhc'
  Aborted (core dumped)

Fixes: bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 5827c092b28..6bb34926bb5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -386,6 +386,7 @@ config FSL_IMX25
     select IMX_FEC
     select IMX_I2C
     select WDT_IMX2
+    select SDHCI
 
 config FSL_IMX31
     bool
-- 
2.26.3

