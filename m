Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2352563lfb;
        Sat, 7 Nov 2020 11:35:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXecQxpzlvOLFoyqYUsF/BMgsHpiyedU0D/U1MCeGYLNriNCpO4cVbOWzCoj41gAeCHgde
X-Received: by 2002:aed:3943:: with SMTP id l61mr7125722qte.195.1604777724919;
        Sat, 07 Nov 2020 11:35:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604777724; cv=none;
        d=google.com; s=arc-20160816;
        b=Zj4ZP0hN7JVZNLcu/nX1X0tk6bfy5K/5Eeu4M7x+Pqn69ug7gLwAAdOa2edVzb9Gm0
         okuUhDPiG/6frFCZ0kWyagglY+i/RLqEMv59j5BZWuEkik3WRfRUXUXVPsWNa85ScWl4
         /fpEibek0dcnP081yNj3HoabaOOXYafPHpneR6PJpY/fMJ9oBKwyVNGXKoCPecY3Zaf8
         i5FbMFIE0XFZz4F5Ht/WimFwp4ONYQMHX3HmHZT8ItXY0zWpuoL/zUplwmazLQYT27mS
         MAjXpnXE6DWJgg8ri/yK3mpGl66Fl0XQmaUoJ93duMNMBrp8QQIudwlwkbDoT9EcYxsO
         Qoug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QOn2Yk5sEGXZTzwuGFFHfpa3H/VY3D0NQ01szmHIhVo=;
        b=zYL8043GkhXYh+oD5K0QKcI32wxAwUP60HV+R2BIZHErc8Avy+Tch1Tx98T5V4FFl/
         goXivkWQRO7QFm8lxwU/JjmYnxrFdoznzW6Ayo0u8N3BGrK0aDS3clxc58tjvu/HVNc1
         z8ZHFnDvPCEg8/OFbjnBO0dkgg/Kc4p+rVPHgRrYcwdh73WAubDZx6rA/Z3bqK1ZM372
         tLrDLVLxtLE5IWvLwaftoPeITu3XtRVQsDBzaMSqZbmaypjJtqqdCKY18IpfnDS2deWQ
         9RmJvDe9xf5KkjxmwCuQQepK3jPc5ujyDf3RN99t+OLgA047udpKM/YPoy8ZqKWTdeix
         v9qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jlud5Q7k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si2703067qtm.192.2020.11.07.11.35.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Nov 2020 11:35:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jlud5Q7k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbTzg-0007cu-98
	for alex.bennee@linaro.org; Sat, 07 Nov 2020 14:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kbTyZ-0007aR-1F; Sat, 07 Nov 2020 14:34:15 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kbTyX-0008LK-M6; Sat, 07 Nov 2020 14:34:14 -0500
Received: by mail-wr1-x442.google.com with SMTP id g12so4697301wrp.10;
 Sat, 07 Nov 2020 11:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOn2Yk5sEGXZTzwuGFFHfpa3H/VY3D0NQ01szmHIhVo=;
 b=jlud5Q7k6eQATQlh6MIXGRBdIMGkwhlkNYIWqj4aasCGq3sRmuX3LnDT3yqd9T4X/y
 T7CYaQPAjtVCdsxDeMnK3LyoupaS9zpaEC38edlYUEelhfyS3q9R6s0UPomrRSi2iCie
 WFTJPMDiooZrMSVQffelHGfoWlEzxWZj4o69AKt8D3PEbbzjIfJw92GNYfXoSh9KO3UY
 1ArXWTPiswFW1xwRMREWIfbVpz7ICCWFf2vqwslB7CTvelMXu/28xg9doc3F+1n205ya
 aK/78zuUTpyMLMC7fpGXpeC6k0/us6ISSOLDoKFG0ejg7ro4ZTP+xXc4WcKafgR2a7jw
 t08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QOn2Yk5sEGXZTzwuGFFHfpa3H/VY3D0NQ01szmHIhVo=;
 b=cA3kVFamq4aw5ZFlJ4WdjnC9YpbNaIkIkarR9vZTGuMPOKbTgSknWP5f18k1kxTsaF
 AqABzj0CDgSs/ki5bACpV9Iu3xtT+1K43p1Ik7R6bX2WY7QzAh55OYY8Fccjn4Iw3tn4
 JqT1AVtjjksFk0ISuoEuQZyjQ45xUkBxhkWIEu9w6gLvzb54wCZ/V876ySO8YH+lyAi7
 39eE2aKBbWzNL7NyZgnsSuSBp++/LUGI9k6yJ+9+WwShz1pb4tMxUTuwYWJ9uO6DI2Zb
 VAvn+rf3UOV+QNRGreT1NsS3OA+PaXoyMr+PNZgaJIK7ZzkQua7FdxdyWPB9ys4U3Jz1
 Lp1Q==
X-Gm-Message-State: AOAM532es721pU2bImkJ6PxNl87mbcdBf/febP8BMXiFTjcBJ45ESa7g
 0//eTMAnApI5QnC8JchcERCVavSlY+A=
X-Received: by 2002:a5d:4f8c:: with SMTP id d12mr9721319wru.351.1604777650856; 
 Sat, 07 Nov 2020 11:34:10 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t5sm7852016wmg.19.2020.11.07.11.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 11:34:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 1/5] hw/arm/armsse: Correct expansion MPC interrupt
 lines
Date: Sat,  7 Nov 2020 20:33:59 +0100
Message-Id: <20201107193403.436146-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201107193403.436146-1-f4bug@amsat.org>
References: <20201107193403.436146-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VBQ1Popl+NKS

We can use one MPC per SRAM bank, but we currently only wire the
IRQ from the first expansion MPC to the IRQ splitter. Fix that.

Fixes: bb75e16d5e6 ("hw/arm/iotkit: Wire up MPC interrupt lines")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/armsse.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index a93da37dcbb..baac027659d 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -1074,7 +1074,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                                         qdev_get_gpio_in(dev_splitter, 0));
             qdev_connect_gpio_out(dev_splitter, 0,
                                   qdev_get_gpio_in_named(dev_secctl,
-                                                         "mpc_status", 0));
+                                                         "mpc_status",
+                                                         i - IOTS_NUM_EXP_MPC));
         }
 
         qdev_connect_gpio_out(dev_splitter, 1,
-- 
2.26.2

