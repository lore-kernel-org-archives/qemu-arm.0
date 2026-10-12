Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4498CA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 14:54:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHQT-0006Tx-F1; Mon, 12 Oct 2026 10:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHQ4-00062u-Mj
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 10:54:30 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHQ3-0004pY-85
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 10:54:28 -0400
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a02667ccebso13651845e9.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 07:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791816866; x=1792421666;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pWk7MV0WjBOJc/s9RX0ZBDFXEdiiCKZ4mANozxUHjQs=;
 b=rS3Lb6+1NAZv2ROvTgKkZP/oBrrbq2n5b3kXww663+g3kYfeVkn6SEAJC1RmShdy8c
 NWcKm+QnMT+CtMnd6E3BVSfAj11rt7ha9Xx6X0UB9Ndtzk0DYEkDy6HdhxxwsK+1lVTL
 ugOJ+ybJxcorwGBjtH4fgX1MiGu0PELcxiHkPuE5xY6gB/rnuTwHyss8TjJ7y9g9/rGL
 FkzqDhrdKaXUXQS9q747J7u5vZCVTm/4VV6A6IbYqFCZGvNSOEnEuXMiJHr2e2ujhfV1
 sYIRcpJxdLINiag57OlotZbddutyp4thzf3LBiib69W/yjA8gUPZsPM9cPSt9UpgH2dn
 sGQQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxFKPzWzFA156DJkXEXW+x78Tz4SjZUeNshkLCmU6Hx6pDF/vHa7hA/cQtK6n7rZpyCE0prkimT5w==@nongnu.org
X-Gm-Message-State: AFq9FYJbpBFgxOR1cDYWuIoYdXxzaJe6VKp9GNicoKHPkMaXoCngXO7G
 RQunEI/M+3Ten8XM3pooSXJ6CpyvbMg7l5CbX3aOhgDMGwbULLtxn4/A
X-Gm-Gg: AYBFou0/pcOlLC0vH6ZLFgiNk3O61o645HimlU++CRn4C/8lVEEWifxNCsyJiU2nyP+
 cpMhF1dz3NhffT2xaeTPtWy09Qj1J9KDiIMZdX7MA1ni8wgTLfkP0T978t9Gcn+V7iIJ4VRb5I5
 VYVj6jFFcXkFavYzmyKVOpR7k9p/vq4TRxcVXFhaEA8Zn1nHA7T1oe3JryTfIkBOIgRxz9/bJTR
 J6upO1TAyjEnhl3TRPwVcaMhyZCEInQrNTxnTsZ0CU3MEXn4MU7P11EhnlXJRdgxxhcd40dJ/vE
 tYBYLbDfcaBgPzOlT2fz7glshA8xL3XDDkztFiLSx/Z4xXCUsNYHPpCHCuIlnadXChNZkUCHLqT
 Srk9ZjX9oL8HlPsFjhB8vIIMFgcAcWHVikmJENr44ccmxZmjGb3L4Pd7DUi/xM2I2+RDsHX5UX6
 YzpRFvtNL3T++ahjONTueomX56TAGGUQ3fC9tYoXY+/8BMot9NMZEidljbdvdh4Evuf4ZMyMoxL
 yL+1KsydHFjJ2N+Un0zrPBHD2Vse9EBUiwkRtNc59os+Q==
X-Received: by 2002:a05:600c:3f06:b0:49f:bc43:9e96 with SMTP id
 5b1f17b1804b1-4a18e4a3bfbmr201172005e9.8.1791816865607; 
 Mon, 12 Oct 2026 07:54:25 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2343asm545123275e9.9.2026.10.12.07.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 07:54:24 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:31:55 +0200
Subject: [PATCH v2 02/50] docs/system/arm/aspeed: add the sanmiguel-bmc machine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-2-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815519; l=827;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=OuuDyLAyQiERaSazvNIfVs0crUzUw8PgfLhgJ7loAvM=;
 b=pDhb/aaq1Q7JVtjkYsscfH2BbmpFFdn+Egv5r4iRD6RKiUf10/g2BFeWayUp/whjJkXOprlY5
 a39annO85fdDkYxQr2IuDSUGmQGNCpjHT+fptASOKc6s7NsU5ok6MKe
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.50; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f50.google.com
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

The Facebook SanMiguel BMC machine is supported by hw/arm but has never
been listed in the Aspeed documentation. Add it to the AST2600 machine
table.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 docs/system/arm/aspeed.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 933df41f96..f38f33cbe1 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -34,6 +34,7 @@ AST2600 SoC based machines :
 - ``bletchley-bmc``        Facebook Bletchley BMC
 - ``fby35-bmc``            Facebook fby35 BMC
 - ``catalina-bmc``         Facebook Catalina BMC
+- ``sanmiguel-bmc``        Facebook SanMiguel BMC
 - ``anacapa-bmc``          Facebook Anacapa BMC
 - ``gb200nvl-bmc``         Nvidia GB200nvl BMC
 

-- 
2.50.1


