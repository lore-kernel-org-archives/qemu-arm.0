Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1430632lfg;
        Sat, 15 May 2021 10:41:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXtM5JZkkdidRVnAUh/plDEwGBXWBb+jS94ezHS0ntcPEZElbiCUzcjbD5W9c9cp1v6gy7
X-Received: by 2002:a05:620a:530:: with SMTP id h16mr19349654qkh.266.1621100517099;
        Sat, 15 May 2021 10:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621100517; cv=none;
        d=google.com; s=arc-20160816;
        b=gzhbmDi1vIkpGwd46VDDuvuisrKdRCtmdK8mixbagpalCSIQmH2dZr1qcrXFdITJ9x
         ZNwhKMWJimjSP6xBtVM0mNBwQUtcs3t1f5eziCdGtjME4RWBjAn96wZ8J9SZcXqCWC60
         HveFHzq3/w320NWnKv3wIDVfAVcoaiLr5TI/re6Bw90GXnXFtnssND/klWvMrhEHVAqg
         IfLcO5nieuGhLLlf/9jg76hS+zFBs4D87l82nGOQHNO50xuBOMnzsdJCr2WXa/ZkabwY
         EZuu3egcimZkoD7duU8BiLeKO1EyJti4SwotrLbcirFggmPz9sw6GVatAbSOIubJNY3n
         HIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k59OgyztQggH2BswEalrOvHA2AZsGsT7XfWLcKTsjW4=;
        b=oO0crwpYJjWTQEoX0GuvwFmEczpFQzXTDplgHg2AmgN/EWMw1d9bP1yQMsP9tUlryU
         gAOTgB2kcrKUOtmcjXM5JBKn5WxbpKbmHM3tSlClHYqBF93VxF/LE7x75u59qCp3vaoE
         S90h8ZYUjEatZA+isMqDuW06jPjM88ffjDCmVmzl/6FMDW5UQJUx9yotriTnJ7pCXbco
         mYRbNE4n4pUr9z7XxYzX90u4jL+enUvLypZSorXximgkRv5B8EqlQWxm3c4pe1QZxsu2
         Q2ixyF7Dekrp3cUoLuqraGPcaeDueKAXXUjIguQYCtPabgJ0kPgPHhMNhJlXc0ctVdfR
         dNjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HhzBHQ0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s184si8601537qkc.237.2021.05.15.10.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 10:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HhzBHQ0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhyIW-0007rg-D5
	for alex.bennee@linaro.org; Sat, 15 May 2021 13:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEO-0000Km-6Z
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEM-0006Bn-NI
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k59OgyztQggH2BswEalrOvHA2AZsGsT7XfWLcKTsjW4=;
 b=HhzBHQ0DVCfOlnYCeWCBFOUXrMp0OJjbog75MS/9kEKjk3Cp2WutNxFZjc91XLvlQvgA1f
 3/IHtuNu1ZJ3x8bk8f/KQN9AyVKjWRna5RmWkEd7tKKDAlExjpR623Svxsd8oooGJO2fPC
 iiLsT+k33GN/44Tz7DJpFDhXShKce5k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-g6ayLI5bNdOAXGqbOV1r-A-1; Sat, 15 May 2021 13:37:34 -0400
X-MC-Unique: g6ayLI5bNdOAXGqbOV1r-A-1
Received: by mail-wm1-f70.google.com with SMTP id
 b128-20020a1c1b860000b029015b52bdb65aso1655743wmb.5
 for <qemu-arm@nongnu.org>; Sat, 15 May 2021 10:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k59OgyztQggH2BswEalrOvHA2AZsGsT7XfWLcKTsjW4=;
 b=GPqLqZf50Tfq/ekcsw11YwhXBZShISeLKlwJMV8eeC8A1lAbHSTO7XEcl9wvbSuwwe
 leFTcbc3LsNGktNbAn33u35/9AvwEkct4csrU/O1M06+LUsJ5vJ9OS7j/NBhCTV6FgTz
 7RB8Xwaqi0GxGrNT5h/ndqtj63efjWJmuEILhrlIfKd75siKtl46axn42m+ObSpcBx+h
 C+GcpkW+DHANOnzWpe+J7/cAAIqSb/3pg1vlDHpf0qlhC3PhGfdU4HQ1Jk3irRpDpbmq
 i+IsiBKuGy2iWAXeEH5iH0PAvbLrq55RSuaUd9xsq2lhf2fXHkzwnDxiDjZHexoKeyNk
 BT1A==
X-Gm-Message-State: AOAM531BSnc+quz4SQQ2SRm6C+NdgIJEjGT2TRS2aRHC2K6Msvo0bS5U
 xTnvZE5wb9IU+9gYFWDVGHtaqvRggfsIxvgzCFMdDj3VOCImW5+eWtJTsTlo+Jjht3bZAPHbLFJ
 CIoKfeA9dfCbs
X-Received: by 2002:a1c:a446:: with SMTP id n67mr3743211wme.19.1621100253366; 
 Sat, 15 May 2021 10:37:33 -0700 (PDT)
X-Received: by 2002:a1c:a446:: with SMTP id n67mr3743192wme.19.1621100253232; 
 Sat, 15 May 2021 10:37:33 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b68sm2216685wmb.11.2021.05.15.10.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] hw/arm/Kconfig: Add missing dependency NPCM7XX ->
 SMBUS
Date: Sat, 15 May 2021 19:37:07 +0200
Message-Id: <20210515173716.358295-4-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ukVk67Towak

The TYPE_NPCM7XX_SMBUS device model exposes an SMBus, but
this isn't advertised with proper Kconfig symbol, leading
to an early build failure when building NPCM7XX machines
standalone:

  The following clauses were found for AT24C

      config AT24C depends on I2C
      select AT24C if NPCM7XX

Fix by adding SMBUS to NPCM7XX.

Fixes: 94e77879395 ("hw/i2c: Implement NPCM7XX SMBus Module Single Mode")
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 67723d9ea6a..85c6a1a088c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -373,6 +373,7 @@ config NPCM7XX
     bool
     select A9MPCORE
     select ARM_GIC
+    select SMBUS
     select AT24C  # EEPROM
     select PL310  # cache controller
     select SERIAL
-- 
2.26.3

