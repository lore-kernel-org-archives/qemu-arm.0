Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp662758lfg;
        Thu, 13 May 2021 09:48:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc0bPt1DJTGOaAo6n8zYD7t/a2nQfVRQhvciyZDK0vG4FnhhM57wxSiqm8YksG+EaEJr0A
X-Received: by 2002:a6b:f602:: with SMTP id n2mr31626790ioh.174.1620924501832;
        Thu, 13 May 2021 09:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620924501; cv=none;
        d=google.com; s=arc-20160816;
        b=QZnSTWE4/4EBimZYCkOhqUHpl4MsDwusoMhKRK/oQEoRujDjHNcTD5U39Ri0tGGF10
         tEuGSNUD/ykdp01O1vFp3WDEFlkkXFyggWOhYtnjI5F+T4KKcUhJ5E+xK4rBdCx93MQ0
         wnL4yjqF+0M4Oen4paWQb4X8suxpi+G5N4jUOp/oPiYLH5i8ZSrsuWofzGM+25DYPzUL
         XOISRIifIO+CWhAjhhAOzegV9fOqeU2OcO1URs+eFT9GnSkFVSh3GUKRd6yeWLvBWDK+
         fuNqSq4orI+fuKEyq/k/HwGnom+jP75iDv72padFdj8GuOi7s2BdgmSg1TYej60tXxIP
         QrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6C7WWutrNcOZs1K+Kika/F95HGC7AnV8YKzuCNwKf5Q=;
        b=N4K0XEZfQbfuQfkU72Ll6pQferc+WLhy+pszFIOk4MhXYqDV/U3Xvn2pi1kkPwHR4B
         bXTU2DP/Cfg2Zt36jvesn24oBcebGR5MIs1mrsKrYvEVk7tAlrTLzJwzF3ZKSFs6isZM
         0kJLN4EENnutgetPbGvDL/5Fo5j0H+8LqGarWw61ebZ5N5amhBNNjuyfxetvGt0MsXrI
         V7Y5KDEYQsV0DfFO2TovD4HvJ/AjuUULOWBbrOIpEYiNlQLB4/U6oDfvU0h8fy9VTfov
         29QwDzrkdacqfl3x6kUNhvBynskq1C6mmFfq3ZGEpOkHrKwvhsi6ZXRZm95289VC9MGa
         uTZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cHjH+1Wr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20si5174271jat.70.2021.05.13.09.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 09:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cHjH+1Wr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhEVZ-0003HE-2g
	for alex.bennee@linaro.org; Thu, 13 May 2021 12:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEN8-0002T5-0z
 for qemu-arm@nongnu.org; Thu, 13 May 2021 12:39:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEMu-0000qK-1G
 for qemu-arm@nongnu.org; Thu, 13 May 2021 12:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6C7WWutrNcOZs1K+Kika/F95HGC7AnV8YKzuCNwKf5Q=;
 b=cHjH+1Wrtrrxr1ADsrJIyujftM0sNPI+4zE3zxTDxyFcrqqHzCP2IJ+FFDoNV44CBtlXFX
 FBIqh7pETVjQpHM+NSJUISKdRyctMT1pzb2pTGlpMot6XTx7PQ2qa6f55bKxMA8iPyw8sf
 7Q51o/FxlgaVMz2/mSTEs6enEvy/DeE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-IXZIPgolPHmCpy0JnmCagg-1; Thu, 13 May 2021 12:39:20 -0400
X-MC-Unique: IXZIPgolPHmCpy0JnmCagg-1
Received: by mail-ej1-f69.google.com with SMTP id
 c11-20020a170906170bb02903bbefa04cd1so4871910eje.8
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 09:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6C7WWutrNcOZs1K+Kika/F95HGC7AnV8YKzuCNwKf5Q=;
 b=BM+3Sk0zhBl2Cbw2tCOuuTLg/M1MIAufMnypxuyO1Ck8pg0S/G3tz0g8ZQkSzUgcoJ
 SrY7gLvkrdrNM//aT0Oab0MqXPajiA4Cdzyhg4UrDJwMfX8fXUMrT4pgEXX/tdqJUjmI
 XWk1a15h8/jXDkwg98gG7Mu4z/MdUiM21PVDzOEhZdr2pB93KcwQPt6e87I/or8Al1Ng
 3izAKIA2BAP9QoYswjZJthIQgGQj29VlByzhggqTvE9ZMfLhHaiUOy2nhmmIrgERpzQm
 YsKKT+1SkCVRwNuixZzStya9bnBO/Fcu5C6EKjIlSwebh4vdV2YmWzAXp/AK6fK6/SuX
 q0wQ==
X-Gm-Message-State: AOAM533C2DJQTlMvTB5d6COOxuzA/r3ykUZcCV14/R2qYlMz2gFEXGci
 01cM87ODHCoc4xnHw/OftDCRlMdR+xtzh0BS6vVZzKYBVLi/SD8axF9wQgnuhzGpcl2PnurFMTi
 Jf3eoJvphP66Q
X-Received: by 2002:a17:906:c14c:: with SMTP id
 dp12mr44642600ejc.312.1620923959545; 
 Thu, 13 May 2021 09:39:19 -0700 (PDT)
X-Received: by 2002:a17:906:c14c:: with SMTP id
 dp12mr44642592ejc.312.1620923959396; 
 Thu, 13 May 2021 09:39:19 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id cr21sm2011294ejc.2.2021.05.13.09.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/10] hw/arm/Kconfig: Remove unused DS1338 symbol from i.MX25
 PDK Board
Date: Thu, 13 May 2021 18:38:52 +0200
Message-Id: <20210513163858.3928976-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IK5f1H/EHanO

In commit c4f00daa5b3 ("imx25-pdk: create ds1338 for qtest inside
the test") we removed the DS1338 device from the i.MX25 machine
but forgot to remove it in the machine Kconfig definitions, do
it now.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 85c6a1a088c..5827c092b28 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -386,7 +386,6 @@ config FSL_IMX25
     select IMX_FEC
     select IMX_I2C
     select WDT_IMX2
-    select DS1338
 
 config FSL_IMX31
     bool
-- 
2.26.3

