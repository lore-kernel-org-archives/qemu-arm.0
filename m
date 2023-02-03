Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1462371ejb;
        Fri, 3 Feb 2023 06:56:17 -0800 (PST)
X-Google-Smtp-Source: AK7set8MrN5eT1xJnmAEtmHp5ber00eAeKi7Bag4gMP9KlYzl39UrL3VyFbHVbQhDaQfwe8OOMYT
X-Received: by 2002:ac8:5b84:0:b0:3b8:461b:4134 with SMTP id a4-20020ac85b84000000b003b8461b4134mr20598860qta.68.1675436177275;
        Fri, 03 Feb 2023 06:56:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675436177; cv=none;
        d=google.com; s=arc-20160816;
        b=NM4JlaqpEI/UDO2cjZzbtspvMPaGHiYlzdvhnVTh9uTu/q9U3laC+U/tbx15RXDHRf
         /br082hxL+NDn4kFiFxixMLyl1pXU3MRJHxjmMRTfm1N7zfPA9B6SemMtmh42C7qtyNB
         nzuMvxP2+nwwklRijnec9R08zm7Jx6V+fuEe/t5CKd31Brxpt3bu9E0JTXuLJ3wVEjhl
         FscouB9VZNcsv5/4Y6UskyvMS7I79tSnetNNtQvNyBy+K9DevIwN+CxxNNiOmjE4wIzn
         OX9lzesmaarTVtgIJFQSbt6dfap3pllGTF6maKSvZX4SqqZNWM38hJ/n5A9iQszOOTUl
         Y3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+umTNh0pbiZOqriKf5LBKbWjyWBQDWdA/pzjCDYec3I=;
        b=v9aSeQa764sHzbSVchB/o2wD7hc4gJBGZVH8IPBuzXSeD6MxpAldVqSsKEAQdFwUqk
         p5iV0K56kpJOCDx8kprI8GLA8LiJdZ7zDS+T3kCO+M71dJ1q2YUYUftD9jZn3H5zTMNw
         xdrrSjjGWmNiieYI5ArrZiUt3NXftStVegVhvO5qiSw3iIiGJYPpFgxRYFjjmi8l2c4T
         BH4u5ed7hix2O6m6InTPkTR7Ra7DybF/MaJmeiMzIydpJgPPb6W6PtiM/oTEDu2W5fIn
         +EkRons4SlfdqA9BUylnmq7f8/feQ+slbzqZ8L2eujmYZvsp8EaNQo0ocdPmPXgxNgL0
         XabA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lPgZ9n5K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7-20020ac85807000000b003b9db24c4d9si2067882qtg.55.2023.02.03.06.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 06:56:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lPgZ9n5K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNxTh-0001o0-5E; Fri, 03 Feb 2023 09:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTe-0001gF-4T
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:55:46 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTc-0005qt-7I
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:55:45 -0500
Received: by mail-wr1-x432.google.com with SMTP id q5so4929320wrv.0
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+umTNh0pbiZOqriKf5LBKbWjyWBQDWdA/pzjCDYec3I=;
 b=lPgZ9n5K6CrRTxxEvSmCqY3ghiogDX+rg/hCCPZOkska+sJM5KTqot5rIAqQeeMbEQ
 9CYZPKlEaD1JEVEF+kffMJtFgVlO8oOgwhEfEfHmCk07Afv/GiyZrYS2/Zm3O1T7lm7B
 RB1tQMNLC8i1ObzebgXpBUa85iEhQvn5OKyH1oSAkAmo2R1nQfojrEj4k8KgL9HUbApg
 o0DMjNiDWI5mbBsEn6fLg6qwfmi8U8Gdgc9YaCwJnzO1v30khNF6OZZgmRXFcRoLp7Gh
 YPLJ2hHcAiiwQT6kw2GT+eag7pUW8LUb9B1kMXe2x+1eBVRweY4Jn51ExYzsFyvWpEKH
 1OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+umTNh0pbiZOqriKf5LBKbWjyWBQDWdA/pzjCDYec3I=;
 b=eUdBFFoS0AwKGuQZijw2/kxw0WgBilj7bEYFGQjXjVCxm6iQQANkQHIUbv1yD4z9Uc
 prip0QzscSlfASoFN3cVHYPj7EPaBzO4L4SQBGM+aNBYsWZfzWX9rnsj8S86DR3/P6Ry
 YL5ScvfM6bkyGl0Y0eV5Xrtp6MWI30dF0byq1ltX8yV1R0Z7EmiO024/fZeSWrlxWsVh
 UFmRrRCx121fsaKc13PQZ8Y+L86HqLtcSiEgsPaIDszxs5YTMdGN+NEBuqDn9XfB8iMw
 AGypNHHLXZ4c7Ioop2EzqrR4vHRH4wVYSWIPpHrVSTlo8c+84HnhHk7NWdSe8RePtmgS
 ToIw==
X-Gm-Message-State: AO0yUKXiQ7LM/j513TFd7hrQUwStzI35Vx1nkFnl3+QRAWFGYSTrbib3
 UJcBPZLwzBb/Bm/UvxJFpYv99GVzlXLUc8jx
X-Received: by 2002:adf:a102:0:b0:2bf:942b:ddc with SMTP id
 o2-20020adfa102000000b002bf942b0ddcmr8142730wro.55.1675436143513; 
 Fri, 03 Feb 2023 06:55:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a5d690a000000b002bbedd60a9asm2175645wru.77.2023.02.03.06.55.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:55:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 01/15] hw/pci/pcie_sriov: Replace fprintf(error_pretty) ->
 warn_reportf_err()
Date: Fri,  3 Feb 2023 15:55:22 +0100
Message-Id: <20230203145536.17585-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rmqR8HOKC4zL

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pcie_sriov.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index f0bd72e069..93b0624599 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -196,19 +196,17 @@ static void register_vfs(PCIDevice *dev)
 
 static void unregister_vfs(PCIDevice *dev)
 {
-    Error *local_err = NULL;
     uint16_t num_vfs = dev->exp.sriov_pf.num_vfs;
     uint16_t i;
 
     trace_sriov_unregister_vfs(dev->name, PCI_SLOT(dev->devfn),
                                PCI_FUNC(dev->devfn), num_vfs);
     for (i = 0; i < num_vfs; i++) {
+        Error *errp = NULL;
         PCIDevice *vf = dev->exp.sriov_pf.vf[i];
-        object_property_set_bool(OBJECT(vf), "realized", false, &local_err);
-        if (local_err) {
-            fprintf(stderr, "Failed to unplug: %s\n",
-                    error_get_pretty(local_err));
-            error_free(local_err);
+        object_property_set_bool(OBJECT(vf), "realized", false, &errp);
+        if (errp) {
+            warn_reportf_err(errp, "Failed to unplug: ");
         }
         object_unparent(OBJECT(vf));
     }
-- 
2.38.1

