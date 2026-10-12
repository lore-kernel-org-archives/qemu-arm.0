Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B1BCA9ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 14:54:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHPr-0005wC-3R; Mon, 12 Oct 2026 10:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHP6-0005g1-G5
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 10:53:32 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHP3-0004ji-Mn
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 10:53:28 -0400
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso26290415e9.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 07:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791816804; x=1792421604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yXN++fw5zgOO6Nzdt5aDXW+w27r6GydROb+GJyYC31Y=;
 b=PHVJPsGBIVHDWuM2OmxlRRUyRcFq93xCJddiJ8r+8NMiT8I1V91vt2kAEr3qfNdc6i
 5MF6YmLgAMkor+QAGk5c5i0bl0lTDatZodj/TDFS2udo5gOVcN7hYnUi+y1mlsEL2tB2
 /r/yTuKq2pbMgG9zZd4BYxAt+s1Sb34Coa13ra8Ljz1DGUr4bxBtkgwx28Pkr4cCmZjl
 BkcvZlsHeva79sWytTBloQAZsvwC0sD545o3xAInzyl+7h/gHg/Ls27IBLYyNiz/1hGW
 hMyL1LbdysM6SGmqy/fSH682Gj2NG2mM+wDKyzrQViYNBfjaivi6xmhACVYDjosX/GrU
 iG3Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxVBMoZxzsENobp924IOCbDXU1q+e43KxXENZ18RNfp2oY10hfrpHecQwcVzT45PE8iKpl5hFvg7Q==@nongnu.org
X-Gm-Message-State: AFq9FYLxHDCrFZ/XtaElZwYkGGf9nbpa87merOYYnqbMQerk3EOx87OV
 DEh9sR7RHmAnlzo1g6lExVxfRYe/wqpiSEptsS6KHevBD44yKDmgP9F5
X-Gm-Gg: AYBFou2+8bQC/RES7MnjxTDANFm5o6bdmzjdAT85HXDAE+md6etz4eDlCfoAlR6vB8G
 nyiMoUsG6QtuqLCRUotM/jBAisZdZgv3TMdz8NOngejimn6hVMfyAUS0WSsIGTRbNbPTEpztQkq
 exXiWw4ptNB8C7FyieELsUEc96GbJPuD5WX7diLxw93z4oC3TpjjayYou4cPq+kdIUkI25joC8q
 CG0tx+fswLTLUSRj5ey9ZGOh9EwAreHo4Ufr5fPrhiigLkTBjn/b46Paadyv61wiXgiGw4sNJfV
 avyXa9F9Y1HDjjegL6ut06P0qwedqesG2UEpRdHiIqQ7ThXIuZPG3u2Eov71vqf6nnP92hCfLrr
 PIEjQ5scsRIuWyXnii09M1h6mpdItt/FYHLlxQNFy7cj1IoucdTrlFYVkheZdKAZDdx/Q6K0XcD
 tBR8nEcZ+YFnSAeRTu8raZgmEv/ZTg5d29axoHvnxFz+XZqabt8tx5Nt00iwL0oL2n3dvqCC3fW
 oY56aYxyStVLBHA0EV+mkD+Kc8tZXMyO+yEfKJIGZ0uQeVSUmRaWMNw
X-Received: by 2002:a05:600c:c3db:10b0:49f:fe89:efca with SMTP id
 5b1f17b1804b1-4a18dcde66amr145444135e9.19.1791816803828; 
 Mon, 12 Oct 2026 07:53:23 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abd3aasm19296117f8f.32.2026.10.12.07.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 07:53:23 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:31:54 +0200
Subject: [PATCH v2 01/50] docs/system/arm/aspeed: add the catalina-bmc machine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-1-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815519; l=1992;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=jOGxphM6i2yuU0VVdWKJiaxsh0O18wnvUcN3/3+xhQk=;
 b=BndPsP7EPmKREvNz3huXhMaogYdbZ2XWQyFcgAHmOv4OvtApr069o6KfEFX904R/m1h50qU0X
 sIuOVxop7ATBZznxmEHi1kwyMIHTNHjSxsT2wMUHJo2W82YNuTRofrS
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.42; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f42.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The Facebook Catalina BMC machine is supported by hw/arm but has never
been listed in the Aspeed documentation. Add it to the AST2600 machine
table.

While at it, shorten the document title. Listing every machine name in
the title duplicates the tables right below it, and made the title (and
its underline) grow past 350 columns. The machine list stays available
where it is readable, in the per-SoC tables.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 docs/system/arm/aspeed.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 2d51ceeb84..933df41f96 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,5 +1,5 @@
-Aspeed family boards (``anacapa-bmc``, ``ast2500-evb``, ``ast2600-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``gb200nvl-bmc``, ``fby35-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
-===============================================================================================================================================================================================================================================================================================================================================
+Aspeed family boards
+====================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
 Aspeed evaluation boards. They are based on different releases of the
@@ -33,6 +33,7 @@ AST2600 SoC based machines :
 - ``fuji-bmc``             Facebook Fuji BMC
 - ``bletchley-bmc``        Facebook Bletchley BMC
 - ``fby35-bmc``            Facebook fby35 BMC
+- ``catalina-bmc``         Facebook Catalina BMC
 - ``anacapa-bmc``          Facebook Anacapa BMC
 - ``gb200nvl-bmc``         Nvidia GB200nvl BMC
 

-- 
2.50.1


