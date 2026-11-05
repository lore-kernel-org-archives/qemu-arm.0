Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E664606A329
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:28:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtlN-0006cu-Ef; Thu, 05 Nov 2026 04:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtlI-0006c5-U0
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:28:01 -0500
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtlG-0006uM-S9
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:28:00 -0500
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-8b29049d80dso93186b3a.3
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870877; x=1794475677;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YPLH85BN1FQ6/VjPz8nyN4WwRSjc/tOK4cGRVQRwlAA=;
 b=c5r+NgsGl35KxpCpqjE+yJ7g8BYYab2qcajdNt6Y9069YGeNFi9+G3/meNNTkRhWF/
 UzfVR1wT6lhi8XCmnVwEVo+/0BypKwMa/HS49fGRtgkjRvOQ3cQYS1in9UtjVovgtq2k
 rG0YRHYrndBKYpHK/tV8mABY4uXJOkTXy8/WzeU/aaotQjNKQkhmGCJG2OVd1JH46iq4
 ejw+XI6PVOf7MzHtzAurFy61OQuz6hXuv0JfCKri823UHiP349ZbE7zFc0qTWNFcutcO
 /HXiEoiMXSf3SOdlOLr0M5dp3knZEUw7otM33Kv/ZJOkyz8ksnaXrWGR9FbCfLdi5CN/
 hJsg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeCUtLTZMFjp5Z8PRIo0u2qDE4tW4vCNsTHj4Cd4gtSmBaZNgqsU5nNC1Aq5F6lJKKlhYsk4pDWQ==@nongnu.org
X-Gm-Message-State: APuU4Z+eBkDtBcCBNklltlqEhIheWIeMoGtOAi/6EjNgy94/ehY36cGF
 ZsoB4DjeG2bfNwdyH0mypzpcCoOOqNp1ZHCozK4Z2pj1c6Vh3nf9607W
X-Gm-Gg: AYBFou3y0PPn619MkdsXVwvguqOMqufz+ZNS837YzVSAL4xSzjQ1KeJedPbSdVtSVXo
 kJskwVj8VSsa28JAlT960WmNFejz+Umico3560hd3XX0AzeFRk9wKWD/MqoZ0Sa9FdJtayAxnMU
 tWmIH1HupdTkOI80YOcGLAcvUrpGbpFsJQ6HmuHokcz0rVsvAFUh3vIw0M7nNPLR7shzxfUmhFv
 OJe7SF05vQgqzne/i3Ab8vNcix3sJ7cYs7FQ0rurxE/lKYx5iw8AA4WBAv/Bl8N2GapYoOJetk8
 0RbMj5ifMMDxvYBhAQXuXVVtQlYPZoH5EsSOpKuA87I2vFmgxd6RjZbfwY2FAL+m4ux8JeoQPfD
 o9piX4TPK9N9MtN7GzMDNbmrI4yWy3IusvgLHx0whayiRep8NuKLx5eVYlNAxdh4ZWOPH+XBbDa
 xkQostGREI1KqfyTOIA+XM53VpzrJ3yLFd9sd6pUaKb15utDDeveupUsshbyqTaUf1+FkZb7HeA
 rzqKrs+ZAV59kvEwtArPp7HpdEN70E+zDy3r+dJ/QakJReIdmsQslqfTeDFqk5Rf/yWV6chPudw
 Bg3VJDrQYvISGprO//qHH9vVXTaJ4hkHA/5Zsk69kuT4WsiOkQf/opr/91fh0d+MvSpadYYp8oz
 9
X-Received: by 2002:a05:6a00:6301:b0:8ac:3a71:38a6 with SMTP id
 d2e1a72fcca58-8ac3a71603dmr8841515b3a.52.1793870877117; 
 Thu, 05 Nov 2026 01:27:57 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8b09c024a45sm1790162b3a.56.2026.11.05.01.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:27:56 -0800 (PST)
Date: Thu, 05 Nov 2026 17:25:40 +0800
Subject: [PATCH 01/16] hw/sensor: tmp421: do not report a stale errno on a
 parse failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-sensor-tmp421-v1-1-c46853f5e1f0@free.fr>
References: <20261105-sensor-tmp421-v1-0-c46853f5e1f0@free.fr>
In-Reply-To: <20261105-sensor-tmp421-v1-0-c46853f5e1f0@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, eblot@meta.com, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793870742; l=1336;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=GFEfhIFJh8BOQmlbaRUAQhaRBhXcQfPvzbeClZRBxBk=;
 b=SnUnMVbEDiOUUppxJSOZyrhMoIdPtXywSWLyUL3FSZ5SGalDeO3g4fEqZ7VOcLdlRarxUjrrS
 bqxyYgtDqFPDBVOzS8OQSE+LpVw23ryDYEF2OZjxhok5xds19WX3DIp
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.210.171; envelope-from=eblot.ml@gmail.com;
 helo=mail-pf1-f171.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The temperature property accessors decode the channel index out of the
property name and report a failure with error_setg_errno(). sscanf()
does not set errno when it matches fewer items than expected, so the
message is suffixed with whatever unrelated error was left behind by an
earlier call. The bounds check right below already uses plain
error_setg() for the same condition.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp421.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index 0e4d0d0ec2..84c6ebec41 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -118,7 +118,7 @@ static void tmp421_get_temperature(Object *obj, Visitor *v, const char *name,
     int tempid;
 
     if (sscanf(name, "temperature%d", &tempid) != 1) {
-        error_setg_errno(errp, errno, "error reading %s", name);
+        error_setg(errp, "error reading %s", name);
         return;
     }
 
@@ -155,7 +155,7 @@ static void tmp421_set_temperature(Object *obj, Visitor *v, const char *name,
     }
 
     if (sscanf(name, "temperature%d", &tempid) != 1) {
-        error_setg_errno(errp, errno, "error reading %s", name);
+        error_setg(errp, "error reading %s", name);
         return;
     }
 

-- 
2.53.0-Meta


