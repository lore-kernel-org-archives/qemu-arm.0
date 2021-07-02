Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1228288lfi;
        Fri, 2 Jul 2021 03:48:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWb9uoH2GRayfnln7QY6jQLqe4DPe5daYmJnh38M519W37gYYBJEPNt3ETLMr0ejZ4iXCg
X-Received: by 2002:a05:620a:4e9:: with SMTP id b9mr4701788qkh.358.1625222922887;
        Fri, 02 Jul 2021 03:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625222922; cv=none;
        d=google.com; s=arc-20160816;
        b=n5sYZX/VASu9R3zwLsJnO8Od1E55zhwcOIAyxm63rmZWJRqOkxeAoDv8bL3aatJ2GM
         drUPyPTf7ZClKB7CTYBKsiVJp+TWn1Zd1ctqs844CyXHXaOirFqZq0G0bj9YIPtBxMnc
         v8k7pADGKdfG1F2P7xvCXTmM2lY/I9tq42q1YNt1zwtb7gAt6Obh0M2nqVxfHgnd3tct
         V0wKRwNhTxutbgMfGtAJefhhIWetVUObTi7r/kM11qCCm79WMxg2R2kSJQ0HFN2BxBtv
         H+ZMVxNqRM13WXBdtGdwl6QND0GAgWAWU4yChOoDxyKGDdjsqHW6Wzi51WFnH11H1pyG
         oPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DIGZ1OnFIqnIhBTRUfPjwDd5CcBHiyNlzbgBPSbVdrw=;
        b=ZqeNpY+rxUmbKoWnPfZqyavTNhOnJXx8XCMY84GGXNu11L9vcX1WbMSgRMHqQwmDjL
         SC1gAHxgXypfGXHswA2gddAddqW9wvS8S9hPnNrzjrLJzZrQvOcH8gWJdrsg2Zmpcpu9
         InKFowAcurxLOgJxmNJJ/IbDwajrHt8mA42TSXJf7wK4W3k63rGYZEVk45Mw+7P7WXiI
         vQTAkON6RkCucVpshIR8OE2LDjBY5NFEKioZCSTrzCOhXuzazThbQjREKfOydx2dfEsP
         6VchMIpx3FkIeLsdrJhfLyjzWysf6ftGHApf9YH9dbHq7pgis7CdloI+XAYOOhL37XK7
         ghFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IpqWMlIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si2520667qvh.38.2021.07.02.03.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 03:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IpqWMlIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzGiw-0002rA-6v
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 06:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb3-0004lH-2J
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:33 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGay-0006eJ-9Q
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:32 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o13-20020a1c4d0d0000b02901fc90de999bso2073996wmh.1
 for <qemu-arm@nongnu.org>; Fri, 02 Jul 2021 03:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DIGZ1OnFIqnIhBTRUfPjwDd5CcBHiyNlzbgBPSbVdrw=;
 b=IpqWMlIuauj2fBX47HmfivH2y06YJ0rjzRziKQunFdvjyKzOAtdvQh7KALlbUYpY+w
 81/mdqajlzmxC1xXExmDNZbKaPrnADzgFEcoo79H4wQTyzm+vtZeqGHhH3KQ3dZZSKhb
 DXfwGJ/eYr5pbdIZM724imio3moC8YuEs05SNwmIjCXYK8xF0GG3q9eLaGHjrhQQg2W/
 OyLVrRF1+6DmecbHfvgKHVt/Zluxlhbh1drjAGD2WfXmAeos267rwDRuSoOHzoRoAw2x
 eL7kOmmHfwk73PPbqKHM+GqExswQEkyOIMT+6vS4cIyviwf2nnsyqjqrY3/yuRrdCxhp
 TVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DIGZ1OnFIqnIhBTRUfPjwDd5CcBHiyNlzbgBPSbVdrw=;
 b=YitDydwREUHrFIgCNPciMjyoQYZnSCTegtvpK+u28idKkLy3gD4NsBkDX4s6aLbSkZ
 JJNthx7nv/kbEg3qIOatT3uAdoLTAy6WAtLU7QzSMO3h5PztLNAH46I5dT1uZP+pw5xs
 RmN+ZQqRr6V0VIvLPKUG2Co/ll1Tc3ZBTwLZ/LSZy28RULeVTOg5rAYIn7hsn8G+DBAX
 BzhvGZr+1LXoNryrejMxnvTECMxUMF6axlGLQTVLfRXUcKNiga2l/Z4wEgd7YAxkvZX4
 dVe+IbtU9Y1JEjVCkG909UniHy5bdB3Nkqjgh0ITtFoREY8D+I50dkZ+1xhzXi6U3UCt
 qrGQ==
X-Gm-Message-State: AOAM531nASN04Xvl8ACRJVdNjNR4M4v0gFnnQxnvNdsV/y3QLgYoCOur
 WC8mc2Ur3QstFqDUNYamX6KCMLaXp8XUEO68
X-Received: by 2002:a1c:26c2:: with SMTP id
 m185mr15269864wmm.146.1625222426876; 
 Fri, 02 Jul 2021 03:40:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/11] hw/arm/virt: Make PL061 GPIO lines pulled low, not high
Date: Fri,  2 Jul 2021 11:40:15 +0100
Message-Id: <20210702104018.19881-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 56KoAgpL/Hbc

For the virt board we have two PL061 devices -- one for NonSecure which
is inputs only, and one for Secure which is outputs only. For the former,
we don't care whether its outputs are pulled low or high when the line is
configured as an input, because we don't connect them. For the latter,
we do care, because we wire the lines up to the gpio-pwr device, which
assumes that level 1 means "do the action" and 1 means "do nothing".
For consistency in case we add more outputs in future, configure both
PL061s to pull GPIO lines down to 0.

Reported-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4b96f060140..93ab9d21ea0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -895,6 +895,9 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     MachineState *ms = MACHINE(vms);
 
     pl061_dev = qdev_new("pl061");
+    /* Pull lines down to 0 if not driven by the PL061 */
+    qdev_prop_set_uint32(pl061_dev, "pullups", 0);
+    qdev_prop_set_uint32(pl061_dev, "pulldowns", 0xff);
     s = SYS_BUS_DEVICE(pl061_dev);
     sysbus_realize_and_unref(s, &error_fatal);
     memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0));
-- 
2.20.1

