Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3394063lfm;
        Sat, 4 Jul 2020 07:56:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfyCD8OIIYxGYkA80qxPtFLRCOVZMMZJ/wr73Ne0WPJUMJIQ/73iVoVN86ZWkQeTuSlNbh
X-Received: by 2002:a25:7bc1:: with SMTP id w184mr64633044ybc.240.1593874579720;
        Sat, 04 Jul 2020 07:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593874579; cv=none;
        d=google.com; s=arc-20160816;
        b=v5M7r2538N1NPL+gNnGHx/lHUTqSXU8xsY6mS2P03ywcFYzDJrFjUcuTssqRs3Ahg0
         SbwHAKPFwNLVbMKHKQ2l0Y1iaX4ySQsg42BMw3+Qp4AxvYLsrBEG6qKELeexFkOGuGfN
         j69btJZzTlulHrAi9UUoP2WnzXB+xjxmG9zmVMryL69AfZ1dwvByGfEy9XHzpI6/h9j+
         cm4A6fIUnlMVvb89adEeK8ejEIFgcqYJgVLXWXOTs7SwlJTUHBQrkuNFkiUsRPn+lETF
         Mj8UKPWy9IeA+alGziiE/Ii7WV7/4wE5d634KciMzeUGk95L3o2fb8r8vd1rCgMtkXr6
         b0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xjjAqG2L8PiyECLv8vWl/nPN8wdvqzFPKnLDYj57EWU=;
        b=CtF73oMfy2eAn8wTaSzTBXj6YBJX/Z/YwNKitsQNqFjqG90P2QgpMAgSGwWVKzsL9y
         Enly6gVdECMaYhssdOqXxhcYInzvcV9fYcxWwieCc8qqh+PJDtWdbqXOuRM3ytHwY5Gh
         At/a1EQTvFQqbhTuZa3UIZreztsyazRXb5EbMCNmu7jnT8mFwPUdvV6J+GcK8K4/VpZx
         4BWPy267A3owZ/iuCQ+pQweHqiPFfm98tFd3J+3R38i9ttu9i3whuiwDlZdKOA88D0wn
         9I09+ZBDPKiMu+FtM6bRaNbUJAP0+e7ZLn//VlbI6o1MmPrCbakVJvpLRmWjgxF3G0BH
         Y29g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kGjxAbMk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si6855764ybh.33.2020.07.04.07.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kGjxAbMk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrjaV-00057r-2M
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 10:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUi-00024i-5m; Sat, 04 Jul 2020 10:50:20 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUg-0003jd-Fs; Sat, 04 Jul 2020 10:50:19 -0400
Received: by mail-wm1-x344.google.com with SMTP id f18so37074331wml.3;
 Sat, 04 Jul 2020 07:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xjjAqG2L8PiyECLv8vWl/nPN8wdvqzFPKnLDYj57EWU=;
 b=kGjxAbMk0Y+V1ZM0jG8F7zrUJeEpbEY2rUuWHyvQnUy2BC4TEa4D9G84sW8qU3Tnyi
 hXyLAakl5TAVaESh9mwcqIkW9kPRuFhF1CPBo0iqa9EzqOeUO8dcJwyom69eu1X7is1K
 GI/h4RCMamXhRltfPP+anRNrC4T3Xl/b+bRd7v5Nxqs6IBSrpiZ+NfMzkc3fyOz+zG/O
 qhZVj0cz4AUqg4attnXMbE/OWUZmlqtkxjHzNmmPiDdGXYHh9wyMp7La7dx/LG+WG1y0
 7hKot5Tx+EVBqxTjnBKGlFKxDUcrNR10Wub/RcuZ75CfRChXgIvTj2rJ1blM2eTTB1qV
 uPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xjjAqG2L8PiyECLv8vWl/nPN8wdvqzFPKnLDYj57EWU=;
 b=DsxGZ58tcbMVgprV0RiBT6eKszIJWBi0hweXYCfw5k6dxZrNUS3cieI3PF8lE5/YIY
 3vvWbcw9DXnz6evxs4GgB47G71m7L+VsQLuq7aORv1/RqsR8e0YSqtG8RmMAnbTBikPe
 Sqw2n7Q/LmmJkRY8z58RqRTZdFBHMlfiNOGWuS/dhfKHpFQk169TbRO8Mlf5hGMdqxy7
 PhFmrQNntpld09S8GKrZgBkanSB4uQNr8YZ3ZERDRpRGK5n/D+EmVwS5yOB+vvsplMdI
 ZFDD7tP0TCr1KtIHU1/DpCiP+qJGayqj2Z9uzfN8HYyiQKFNi/5N96wemyxQszL9vqNV
 wTwA==
X-Gm-Message-State: AOAM533kb4Xy5Crf8AtrEbfs/Eea4BGx2eXw8I4mxz/5zQFqVJahuJUy
 TMxs6efJ8Kuv30Z29pve1GNWUjge+4s=
X-Received: by 2002:a1c:6788:: with SMTP id
 b130mr42706142wmc.100.1593874216169; 
 Sat, 04 Jul 2020 07:50:16 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 14/26] hw/usb/quirks: Rename included source with '.inc.c'
 suffix
Date: Sat,  4 Jul 2020 16:49:31 +0200
Message-Id: <20200704144943.18292-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZtSs13JSaeqr

This file is not a header, but contains source code which is
included and compiled once. We use the '.inc.c' suffix in few
other cases in the repository. Follow the same convention with
this file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/quirks.c                   | 2 +-
 hw/usb/{quirks.h => quirks.inc.c} | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)
 rename hw/usb/{quirks.h => quirks.inc.c} (99%)

diff --git a/hw/usb/quirks.c b/hw/usb/quirks.c
index 23ea7a23ea..655b36f2d5 100644
--- a/hw/usb/quirks.c
+++ b/hw/usb/quirks.c
@@ -13,7 +13,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "quirks.h"
+#include "quirks.inc.c"
 #include "hw/usb.h"
 
 static bool usb_id_match(const struct usb_device_id *ids,
diff --git a/hw/usb/quirks.h b/hw/usb/quirks.inc.c
similarity index 99%
rename from hw/usb/quirks.h
rename to hw/usb/quirks.inc.c
index 50ef2f9c2e..004b228aba 100644
--- a/hw/usb/quirks.h
+++ b/hw/usb/quirks.inc.c
@@ -12,9 +12,6 @@
  * (at your option) any later version.
  */
 
-#ifndef HW_USB_QUIRKS_H
-#define HW_USB_QUIRKS_H
-
 /* 1 on 1 copy of linux/drivers/usb/serial/ftdi_sio_ids.h */
 #include "quirks-ftdi-ids.h"
 /* 1 on 1 copy of linux/drivers/usb/serial/pl2303.h */
@@ -915,5 +912,3 @@ static const struct usb_device_id usbredir_ftdi_serial_ids[] = {
 
 #undef USB_DEVICE
 #undef USB_DEVICE_AND_INTERFACE_INFO
-
-#endif
-- 
2.21.3

