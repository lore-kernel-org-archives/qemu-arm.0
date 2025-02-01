Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp942761njb;
        Sat, 1 Feb 2025 01:17:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXK0nKMQ++garZoZh3l77cM7OLl9TieEVqoq43CTN6bbEXEfrO0cyfipRl4+sWnBuVmid/rPo1TIxyYdA==@linaro.org
X-Google-Smtp-Source: AGHT+IFXWzlE1HEmpwxa0ZsunBczL8SpU4hZplBKKVFKL0pGgJxx2JgdhM5hrCOlEyzurnmyyBSG
X-Received: by 2002:a05:620a:1904:b0:7b6:da21:7531 with SMTP id af79cd13be357-7bffccca3abmr2136425785a.4.1738401430793;
        Sat, 01 Feb 2025 01:17:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738401430; cv=none;
        d=google.com; s=arc-20240605;
        b=YfcSGkzjEVj09hRB8HaumCYvWpZ8ry6DKRK8fs75WI7sH5ldAymKvJIDa4XPchAytQ
         TUvpZjXZcQC//4UqMMLjFjJr1oxDwsPYdUCaniu+SIk47GAg0YP6lslcgwKRok1n30hS
         zNCwchUALW2eUo3Eo3CVtgy10DvT/07Ez5kPiHIlBU3bnIfnoaWsYRsG0gisFoziFK6k
         yBmwCixTPxOGrRIyrW1hPYRk/+QpQBKNpYop5qfyvDeJtUer0exiYAs34GiM0CRoj12n
         EjIrEFzKVUQSW7zrQe6XHPM1HXd4/gtp30QL8MWZJIYdpeSf24/BTseeR3WzOEV9eXnD
         NGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T1LJZGDPBmQwNGoIT0EBNTzucOYXIeT9I+AbkFPx5nk=;
        fh=H4GbwdQ/2oIyPNlbjSTr+s+fsGzXnEOR03aP94txBto=;
        b=CcdFwFW2qG1FIISVC3aA6lvYfyFg0ZTH6iRfjiraJElnW3NJMykT9p+VfHYLvldHF8
         4Xp47/zAqsmgfDqdoWM/AF5avovaWyWkIgpiCOlzXs7l4wUcLmfYd+tfyDTeylib0SCO
         o4snLSBvSO9/lvWYyzm6Lsba1XuLqVcObwJcFOXqff8P9oR7zwE1AnO5n1pCyl0tq7Pj
         GBPSorZD0eiM4ft7uN4phpuduS0FMySWWEYuhN5p5miKMFZh6hUED0mvqIY9+HTFNP3x
         RhJS6b1UJbSK59T2nWwAK9Tb2LzlxunPxb/FuPPVo2+MMfelse270Xo/IBdVEH8DTlXy
         ss4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q1cDpUPV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e254818c54si50886306d6.67.2025.02.01.01.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 01:17:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q1cDpUPV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1te9br-0001Bb-Qp; Sat, 01 Feb 2025 04:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9bm-00018A-8F
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 04:16:10 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9bk-0000ln-LK
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 04:16:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so19347635e9.1
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2025 01:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738401367; x=1739006167; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1LJZGDPBmQwNGoIT0EBNTzucOYXIeT9I+AbkFPx5nk=;
 b=q1cDpUPV2OKheBAMGMoyEK/KAsMYMLpDp8uQbc4y8iOERgIWhClB2Nf721hhjA369G
 OKGIywXBoARe2j2FqHhuIJbGNJepOvse3V3BesQewZqCcM9/SONUTtqCMFth4TO1csY2
 HKUbKpAtZyld1ONXIwXt7IpgtfVzKBz/3ToLx5H8R7i11sHDd1j+aQ8KPl9if2CnrfpL
 z9kDGAS+oiPnHkC3hq3sAMrcZ9+60bZF8kjvCa4NkGtgu+8ujWZJsljsN2vuGNfb1AYe
 ac+dnKW3kwsXeXb2H36afvT58VP2DlnSsa9pIDLKwKO7MAXlUdIUO2Oi88ZLFIAQKy57
 eNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738401367; x=1739006167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1LJZGDPBmQwNGoIT0EBNTzucOYXIeT9I+AbkFPx5nk=;
 b=Iu3qoWai2qBpK3JozEhaGiLZN9Uj7b1mSacJ3PyRwfhklw0zdGPRgp3ZvlL2h7rs28
 +Tur3oxlIVXLnZB6QVB6JxC15O6fwvWDzytPz7S4KoROck5Lgt6VZzOmsCjftB/HCKoK
 xvjUmcUyyUbaj4Uwg7nNj5faNrUOwP0It8HYp/ZrDAm4dezugXflwBAt4YlxBuRL7MrF
 GWRk+64XAnnINPzwpLh9VlaJ9daKtJJmmxxQg2/T5wxhwUXje7D+PpeXsfTsJP/oPrd2
 9BVZllAAwSsDPVlI3OrEIpf7WjDK46KTChLeCjPL7cPBa5NTXmh1fWmfG5c0Eam3N6/Z
 0OJA==
X-Gm-Message-State: AOJu0Yxy1GNmupn9PiV2vmQn744k8crkjGmK2RgS8KWOh0uktqlNUjWj
 iHvCgoRHbBSrnUk4CkFU3lopONyMJHgED5fov6iW3sC1tWITV5dkDQVOE0rF5SXmRNmlnDZWidS
 1t24=
X-Gm-Gg: ASbGncuRTtIuR6IEyZU9y5CcoCMwMlcVSSHngtrK7NhCGxPMT0HjcQ9CDGXh8BmkfH1
 GJbZ7L2FRmT7UOBfbew0M2QtEf5nNhzhDh8vXrDBrm4EONRiVzqdZG7WVN5KJQwdWCFzKubiD4Y
 AVIj5Qywh5XsaQPgwQ5Q5HGLh0bKH5AwCJxpqodgx5hQW8FAmGYD2aG9S4GXJbeuDm9PQSlubRP
 bidgrLzJBhPwuPfO9jN0t64PmF5ltXNaYdnYqLrVH4MoJjd0xNnsgjXxzvTmcIXV15FB02q/i1P
 d+SoalC5G4+6WVV2ckfk/lmXYoRO5S7l5PkbNhBqbS7RGj0GvE/6ssG2VQFDqT4LfA==
X-Received: by 2002:a5d:47a3:0:b0:38c:4a05:c25f with SMTP id
 ffacd0b85a97d-38c5209605dmr11904138f8f.42.1738401366812; 
 Sat, 01 Feb 2025 01:16:06 -0800 (PST)
Received: from localhost.localdomain (232.170.88.92.rev.sfr.net.
 [92.88.170.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c102e51sm6925917f8f.31.2025.02.01.01.16.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 01 Feb 2025 01:16:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jared Mauch <jared+home@puck.nether.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/7] hw/arm/raspi4b: Add the raspi4b-4g machine
Date: Sat,  1 Feb 2025 10:15:27 +0100
Message-ID: <20250201091528.1177-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250201091528.1177-1-philmd@linaro.org>
References: <20250201091528.1177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6MJzfzHVGiGR

Add the raspi4b-4g machine, a raspi4b rev1.4 with 4GB of RAM.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2797
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi4b.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 59b0d2ced44..2cf8bc467c5 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -133,6 +133,17 @@ static void raspi4b_2g_machine_class_init(ObjectClass *oc, void *data)
     mc->init = raspi4b_machine_init;
     mc->alias = "raspi4b";
 }
+
+static void raspi4b_4g_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
+
+
+    rmc->board_rev = 0xc03114; /* Revision 1.4, 4 GiB RAM */
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+    mc->init = raspi4b_machine_init;
+}
 #endif /* HOST_LONG_BITS > 32 */
 
 static const TypeInfo raspi4_machine_types[] = {
@@ -147,6 +158,11 @@ static const TypeInfo raspi4_machine_types[] = {
         .parent         = TYPE_RASPI4_MACHINE,
         .class_init     = raspi4b_2g_machine_class_init,
     },
+    {
+        .name           = MACHINE_TYPE_NAME("raspi4b-4g"),
+        .parent         = TYPE_RASPI4_MACHINE,
+        .class_init     = raspi4b_4g_machine_class_init,
+    },
 #endif /* HOST_LONG_BITS > 32 */
     {
         .name           = TYPE_RASPI4_MACHINE,
-- 
2.47.1

