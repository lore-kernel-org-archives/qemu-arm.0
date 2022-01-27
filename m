Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4221681lfk;
        Thu, 27 Jan 2022 08:43:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKtH8wuqYaa1p7B0OSeGRJvhnUSDuAvPeqPn3ZOPk9iV8n20WiBsL+2P3MVjQ7DeZswUdP
X-Received: by 2002:a05:6214:e68:: with SMTP id jz8mr4377172qvb.114.1643301810095;
        Thu, 27 Jan 2022 08:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643301810; cv=none;
        d=google.com; s=arc-20160816;
        b=xIx+YZxEhHwY2D4szjOPKLvaL7X+9BAAr2tIm55QzIRp9MeTIlyGEWE0rH3pDNgyg4
         sF1O/B68cSM+sbe3hTjca3E55tVuclsxNvZnj8EcYklmSFq1OBk671CzAjCrLVR8RqV2
         diCUjv2/K3PBWKn7Yee1/BQykZOmupUvvWNCApwc7d8w7PKCtyK9NQM7ouxrnrlumRby
         lLiDij0svKErMFGa3KuH5FakKz6JyRnIiV4Vw+JQNnKrUMqfCR4s9Cj7nbtz6CgPenFp
         mYuVvvAbTZOvtS54/av0Y8qLqyY+ztPTt3W8rOC5RF49lNjQy49H4n/h0PFcMRQvfQZ9
         WKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MUqrd0qjKKbwcA4BpGGoWMvbKVeAVH+zXdgNV8IRg1M=;
        b=w11/xWFWo+w9dALvkK0/3wPFoY4o84aYL7hyN1mvRUkr4tdHz9EOxsKVGAskhpWXD/
         NaNdjdx0KNt5LbLsBBlDl+USCaOBkJSsoCOOluw8iSi3llmmdjohPJTbGaQtX+6OvwBk
         XefD4LdnpDKtXH7MjPmzcmVFMY/yj/yqn4oj2V2vq7LcEUOmEnSQqYjFHpQDoQ+2IfLl
         m2Wtc1UgiQKCx5tbUDwRr6jEfJL6IUXGGAHfcX/Mka7lfvOS+6eodNBeFB+9xrFRkIML
         1MZq4iLm9yRUyZxXa2YjbjkTRu6s5UMYln7qGf7+s1rgl0ZAmj35A3eZDFvDcFWySSw8
         38bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MpiQUuWY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11si36052qtv.157.2022.01.27.08.43.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:43:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MpiQUuWY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7rs-0006mu-1u
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:43:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zW-0006xk-Ii
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:18 -0500
Received: from [2a00:1450:4864:20::32d] (port=50808
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zR-0008PY-4S
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:18 -0500
Received: by mail-wm1-x32d.google.com with SMTP id r186so329543wma.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MUqrd0qjKKbwcA4BpGGoWMvbKVeAVH+zXdgNV8IRg1M=;
 b=MpiQUuWYdf8RgCJxJwU8ZI2PvZCFJzXI3qOTN4T5fs61j8yrsX5jKKekS4lUknZC8g
 gBzDuHRMOMC09RLEfvSjsVMYsyPMaPGU8hqiDo9gnHsZKeshQu4tiMJufM35eMkdStmY
 lldIDIUb9GU6kZKN3iUSNiyuJVywYGc3MkoU2olaJ8gJ29u6NoU9GcB4Ui6LHY1Xs3jS
 M3bJodZHZCh4MegQZ662kj45VIa1WEOhBC6wumcnNpkejr9RCpk62hOTedT201krBPek
 YAzP5THCJiO8wUqED7c6jlDVB863aULu8q5TVHtpYvPM6Nd71QmG6gF4IDKetdgSmoZR
 WlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MUqrd0qjKKbwcA4BpGGoWMvbKVeAVH+zXdgNV8IRg1M=;
 b=PDCRoDJK1kldFK0lzJO3dEBu8urKiRe50RxAzLVRVdtANKRTCHOzh9TEeMmkryfZ/F
 pmf1S2Lvla4DhZR67pzMo6MF0oQD3swY4z1hBQjPx7VZDx8fi8OpMlPZjobDxj0UMAYW
 0qEepo3mA7eWOeXodI4MgQNKmi6Fh1kl8od7lCJJdW5Vc8nxk4CgqmvlMt8CB4nNU4z3
 Kd/28PN36hbG4TTVu3W+f282/JsMJtkrsNTWuAqlLNYV4GIBTya0qHoknDdjio/zIW66
 T19Zr9ywnUd4Twc8NaX27ePubxEDJvwBalv/UI+LmDnGcVWZ0Y2IY4LV7I5Yh392XWU3
 zUYg==
X-Gm-Message-State: AOAM531mQSU2KBTWJp1WOEttQVMxlPBwnjiGqRkSsKdowCUbQFrzMxmS
 XAIxEOzz0UltrLUOGa8iw3TmRA==
X-Received: by 2002:a05:600c:3c92:: with SMTP id
 bg18mr3777365wmb.161.1643298431828; 
 Thu, 27 Jan 2022 07:47:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:47:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 16/16] hw/arm/boot: Drop existing dtb /psci node rather than
 retaining it
Date: Thu, 27 Jan 2022 15:46:39 +0000
Message-Id: <20220127154639.2090164-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3UheHmWiw3Br

If we're using PSCI emulation, we add a /psci node to the device tree
we pass to the guest.  At the moment, if the dtb already has a /psci
node in it, we retain it, rather than replacing it. (This behaviour
was added in commit c39770cd637765 in 2018.)

This is a problem if the existing node doesn't match our PSCI
emulation.  In particular, it might specify the wrong method (HVC vs
SMC), or wrong function IDs for cpu_suspend/cpu_off/etc, in which
case the guest will not get the behaviour it wants when it makes PSCI
calls.

An example of this is trying to boot the highbank or midway board
models using the device tree supplied in the kernel sources: this
device tree includes a /psci node that specifies function IDs that
don't match the (PSCI 0.2 compliant) IDs that QEMU uses.  The dtb
cpu_suspend function ID happens to match the PSCI 0.2 cpu_off ID, so
the guest hangs after booting when the kernel tries to idle the CPU
and instead it gets turned off.

Instead of retaining an existing /psci node, delete it entirely
and replace it with a node whose properties match QEMU's PSCI
emulation behaviour. This matches the way we handle /memory nodes,
where we also delete any existing nodes and write in ones that
match the way QEMU is going to behave.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I'm not confident about the FDT API to use to remove an
existing node -- I used qemu_fdt_nop_node() as that matches the
code in boot.c that's removing the memory nodes. There is
also an fdt_del_node(), though...
---
 hw/arm/boot.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b46f1fe889e..b1e95978f26 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -478,12 +478,13 @@ static void fdt_add_psci_node(void *fdt)
     }
 
     /*
-     * If /psci node is present in provided DTB, assume that no fixup
-     * is necessary and all PSCI configuration should be taken as-is
+     * A pre-existing /psci node might specify function ID values
+     * that don't match QEMU's PSCI implementation. Delete the whole
+     * node and put our own in instead.
      */
     rc = fdt_path_offset(fdt, "/psci");
     if (rc >= 0) {
-        return;
+        qemu_fdt_nop_node(fdt, "/psci");
     }
 
     qemu_fdt_add_subnode(fdt, "/psci");
-- 
2.25.1

