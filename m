Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp417197lft;
        Wed, 29 Jun 2022 05:47:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUIEW8XgqUGjuiF53JUgS0ovdFktaBxivrS4MH+E+YopAfMfvUGQbd+xazQP3ol+9JJvQY
X-Received: by 2002:ac8:5ac8:0:b0:318:1fd1:6663 with SMTP id d8-20020ac85ac8000000b003181fd16663mr2178207qtd.20.1656506868154;
        Wed, 29 Jun 2022 05:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656506868; cv=none;
        d=google.com; s=arc-20160816;
        b=G0FBbsiYGiZOp4iaevaEWhemsIVn5j7OcYuFPfCmCLwaEVj1y6MUENgURzfa3f6HdU
         p/Y9XMkumkVdxhf7Z6FNNxlSAHe2/eLy+q3/taAfeGKZt42/ScOaPcalFXi4yc3706Ea
         +pmBTMp0QB9S+tSjpQD5Mlso8DNEkiAVKJX+mMdQszQPhMRaoKj+m9IS4V5r8f7vOxae
         YAwig0uYw4M2Yep9HqqdCH9yZP1mykki5Iqjcfp9Rf8EhGsZevqKZ1cZarxzQFJP1/wH
         EHf/WId1SlQ4mTZXx9sTtGYsSLZv8tujYRQtVDsF7wA/SBwqgXJfTHNGvHL8iTv+5y5n
         XRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=U6eelMB55dLrnnotyACrYFBOUe+D4MNgeHqjT3Oicw4=;
        b=1A2uSZ4uy3MVpGd0LKm8DG9A+d/e0Qx95z0/3jtfqHTnhPKNvxzk9vOdCx6xLZ36Ng
         HmYZ4rHAADCY9joyE9rw/x5Q5KygRZSnce/c5ulh00Zh2O6L8EK21gNY5i336RpA5hRi
         BIaOZkwvBfVgbTDEr7Wt2BjSG7lHOIjq2ewKOZpww7e1NOtjmOaWU7GtEarX5CtmvKEY
         xY5r8+LlhJvPrHjzMvDvqccdQyH6gk38OKqHvgb72j3ASLA64edeT6JXUIIicQYGyWlf
         YkBGSOT1u9QytzbqHyIEftCAelmweXJ0nMXMRsv0rV2KGjKU98Uzkra2yX8IjQW3aGxl
         THSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Iqmxfgsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21-20020ac84e95000000b0031bf5ebaaf3si2347608qtp.47.2022.06.29.05.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 05:47:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Iqmxfgsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:39670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6X6f-0006ju-5S
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 08:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X09-0007ca-UY; Wed, 29 Jun 2022 08:41:06 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X08-0004eM-G6; Wed, 29 Jun 2022 08:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U6eelMB55dLrnnotyACrYFBOUe+D4MNgeHqjT3Oicw4=; b=IqmxfgsmDp+jBaVAbFVguICodX
 5w99smSWLwoWho1kv71LTYAS/twI5o9KV3ZxzaNByZF6G14WH6KTZj+bgrsIFYcMQUQCQAedw5izE
 x5iTl85Dfxjm4bzRJ03PlVWtIkIZHpgp3lt9lNvgZaws2sK4Muh6hZfs3oh3SPMoHacxy4oxhHKrW
 D7IAtu4F40NVZgXiClDwNrskRn9bvnSm1JsgIwyMOOId15dyNjhOVD06wbjtZb05aBiAG8PV/Nu9R
 wKGrVbHIjzX0rs9dV/gxIt/NE0u4v4id5AnJtsQAYPy9ejv41p+OUDmUrz/wFfTZgRTg/xweQoqcl
 kASGa8SaTxDT2I2PvxRMPquyQ2UuKd1jnyjUQzYehVpesnRG5fDqMuqgTmYK4bZ0wGes50nKJ34mE
 kuAqnXIGIWklQFomv43YW21q5qNVrDU5qfej9QjLqY4zT7nxw3Tnxe9rbEFC+gsDV5doCNyh02f3U
 nFB3ZQLz2Xv1k8fWvXm4bvojn8zbBMyiM6Ue6uiQ82JKYCn/1CfBJXYNIEYhlnWv1eF5WaRBrtyhn
 ZjYD4Hc67J1kycIXj4zl/UQm1xGXMYAJCtF9qS0wBv/k6NmNYTkGg2JcVehguzLVTQklquScWuGgL
 SAK3xyzKEfYV4KofBkhSvQ7s06306p+UspTeToz4M=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wyo-0002tZ-Gz; Wed, 29 Jun 2022 13:39:42 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:53 +0100
Message-Id: <20220629124026.1077021-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 07/40] pl050: introduce PL050DeviceClass for the PL050 device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: LiMrYNyEqFS7

This will soon be used to store the reference to the PL050 parent device
for PL050_KBD_DEVICE and PL050_MOUSE_DEVICE.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c         | 2 ++
 include/hw/input/pl050.h | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index e32d86005a..d7796b73a1 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -216,6 +216,8 @@ static const TypeInfo pl050_type_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_init = pl050_init,
     .instance_size = sizeof(PL050State),
+    .class_init    = pl050_class_init,
+    .class_size    = sizeof(PL050DeviceClass),
     .abstract      = true,
     .class_init    = pl050_class_init,
 };
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index bb0e87ff45..203f03a194 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -16,8 +16,14 @@
 #include "hw/input/ps2.h"
 #include "hw/irq.h"
 
+struct PL050DeviceClass {
+    SysBusDeviceClass parent_class;
+
+    DeviceRealize parent_realize;
+};
+
 #define TYPE_PL050 "pl050"
-OBJECT_DECLARE_SIMPLE_TYPE(PL050State, PL050)
+OBJECT_DECLARE_TYPE(PL050State, PL050DeviceClass, PL050)
 
 struct PL050State {
     SysBusDevice parent_obj;
-- 
2.30.2

