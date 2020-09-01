Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4463268lfc;
        Tue, 1 Sep 2020 03:41:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdfqdewDRVuP6T/120Fx1/Z2XGkLXKj57WTtlLYH84ZG52bc2VhBToH5VH4PImB+FLrwl+
X-Received: by 2002:a05:6902:1025:: with SMTP id x5mr1752036ybt.58.1598956914062;
        Tue, 01 Sep 2020 03:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598956914; cv=none;
        d=google.com; s=arc-20160816;
        b=RHVqjFnl0E90RGB/AvQ2+6jLYNrBew8WmcuatvVtqmAPODS61HP30I8C3W8Wd677qr
         QsQj6AetUX9tGkP5kB8koXX4+riRrjaQZxaCGoNzLWw7hN5NivW11r880544RGTPIZVs
         U4xWd7Mb6pwJJHyMXOxWbM7ARgJYGDnuoEcQ+uCZCGsC0cA/jdozrhYjIaznMfYAbSFT
         ilVtge9xVam4P6X7zp2Fd5EgMRRk6TL6kPoi6ghPZQYE2F6w7O3wXRRyXMpuzURBziVB
         MCz5OAsy8UJC+JCyY45SOcMAKxSRio+cZ8jUbN89nS615TF5sFAgi6Z7BfCnnGqOESwb
         a9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hzm65kQvKrAgJRdgdcCTLRYl0kqFFHOY2vCCMJID1VE=;
        b=BWSSVrxDFqKr1vqB5LFz68zJM7BbAbD3sSRKtZq6soFUsmbqWAUAB8YrvUveWVEupu
         sZ5V77z+DuWxfDqY0RI08KYeZX8IP/czXjn5SdjXhNPqJyfvbBiQm7SYXBauUWEszbKL
         TapwspWuNOEBkrA0+74HcsmiqBVyIU+8I3vZe20LVWiCkLDyTjnrH/j3MHhabgQdWT0U
         Z6JAtJk6QOZ301MAp7v9Y4T8Kf/junrPxDzMXeWZX05bA5Tw3r8xwUhjSKun8hfVFq1f
         kl6yizY4X3ehzSuPzGg++mxa1u2JxdCiI+zb9uwCTtjjVmYuinXS4lH0e+0UbUXiMKsl
         YH/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="eV8Pd2s/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l193si654787ybl.436.2020.09.01.03.41.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 03:41:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="eV8Pd2s/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kD3jd-0006iK-BH
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 06:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3ih-0004h2-Gy; Tue, 01 Sep 2020 06:40:55 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3ig-0001sU-1s; Tue, 01 Sep 2020 06:40:55 -0400
Received: by mail-wm1-x342.google.com with SMTP id b79so657899wmb.4;
 Tue, 01 Sep 2020 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hzm65kQvKrAgJRdgdcCTLRYl0kqFFHOY2vCCMJID1VE=;
 b=eV8Pd2s/JWIFS4zIt5dXGLHw3hfwdNdS66j/QudRZnXb80PJCDKU0yctFfpyr+kjD5
 TFpYtzZm8b0BFsOFFcT+mipaNfmaW/ZhHOBH7fiCs12gfKgbEoalLnISXXJdNFF/Ybxx
 w42oiTur8Kt0YJYOaF9oyGb3H7xm2OJxCMLf+zpanHXbdmNEmb3rkqwBEjzx23g0EozI
 /oEgYduAB525/aohHixV6LkVi6mQx7a+QjIyXKBSu12RQcyZHEhzFAA9vIt42LtZvYFM
 pd6gCMB7WlcPWELWAtekjBOEIqbUBtiNwaAYxn26096ke1oTyBkhfhk6rfDyJeoCZcBi
 nvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hzm65kQvKrAgJRdgdcCTLRYl0kqFFHOY2vCCMJID1VE=;
 b=Voe16Ltwe3bMgXt9DS7wz4InARvIZA1Soxw8mRQjXd8adwGG5/ZG+g65z15WAeFWiM
 9GVAKP3YmdamgoZhXmM7XUt/3CTjgCUYFjrV5Ji/W2Q7Fs2nVUnDDTyRagDaYFQ9oZfU
 +QVVQKHnITMdqLhOecCODCuQWtZs9cyy+f8bZ7ZjjpCRcLK45hkvsBwfB6t3GpdfsQpV
 +rKs/tP3YRJh3W1f/CRlmst08gKyzh8Nynzkxz3vAyPN4+iNJIQL56p8w3DjasBAMiuM
 f0UlPu9amOwrof0ZhhUHxaxm3u9XSFAuopf9zCo/b5EmLUDm760hjwxx8qKFRiA3w4Rc
 ApQA==
X-Gm-Message-State: AOAM531mqoApbvjWFkbjH5JERcgtJ/YZSQgb2kAan95pjZilfI6l+bK6
 TdNYg8PoJXgRm1bkC/+pzBQzJwq0/rM=
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr1197405wmo.91.1598956851497; 
 Tue, 01 Sep 2020 03:40:51 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id o9sm1541461wrw.58.2020.09.01.03.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 03:40:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/ppc/ppc4xx_pci: Use ARRAY_SIZE() instead of magic value
Date: Tue,  1 Sep 2020 12:40:41 +0200
Message-Id: <20200901104043.91383-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901104043.91383-1-f4bug@amsat.org>
References: <20200901104043.91383-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8bF21ViGv3EN

Replace the magic '4' by ARRAY_SIZE(s->irq) which is more explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/ppc4xx_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 3ea47df71fe..cd3f192a138 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -320,7 +320,8 @@ static void ppc4xx_pcihost_realize(DeviceState *dev, Error **errp)
 
     b = pci_register_root_bus(dev, NULL, ppc4xx_pci_set_irq,
                               ppc4xx_pci_map_irq, s->irq, get_system_memory(),
-                              get_system_io(), 0, 4, TYPE_PCI_BUS);
+                              get_system_io(), 0, ARRAY_SIZE(s->irq),
+                              TYPE_PCI_BUS);
     h->bus = b;
 
     pci_create_simple(b, 0, "ppc4xx-host-bridge");
-- 
2.26.2

