Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp528319lfg;
        Thu, 25 Mar 2021 08:36:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjBuROwWfMh8gY5EAUJn61dsqP3xC4tMviqVflN/G/R9I7KHChUDiB/s4IOIO4ji7J1fXz
X-Received: by 2002:a92:7007:: with SMTP id l7mr6925491ilc.187.1616686591196;
        Thu, 25 Mar 2021 08:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616686591; cv=none;
        d=google.com; s=arc-20160816;
        b=t/sCjJJp45ugmzS4vEv7/XIgqSIBs5qRQ9GMXGkaO7yyCtHw8eODU/Ei91YaFiXTXk
         h7riALeph3OWU6pDiBhyBarMBtfPtNQoRtqrGgz9oMwz4PQgVEOWCXPvGJ/cAxphv2Tb
         +mSHhnEkC94dHUMdJev3V7/It8aLcP03rLqfSAUK5UBWw0f7lLZfg6kLbKJvfbbynubi
         xn7W33W94h/NA3RC3Zm17wqJi98+Ud/uJIOlqZI5o+d2zuF7bvZb8+tOxMK3n2OahXoK
         j8woaeRpKGoXAXtEFzMtHLpa+SE+GGCNKQJgqyEwBYk5MRSU/lFtdQUttzc5jZSdiDQ4
         F8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uZpAMMR+4O26S3vnkFRf0Ab3gTpOaqGRZy2FhEyixw8=;
        b=Rqh94Awa1o5z94F696Yg5iSzAFJoguubE7mmAt9oq6wml7AgWyiq8UthQxbLa3rIc+
         kRhdkI5DfKHUpE/00sDft9dJAb4muNvz+8JqsM7uplUCf3DZ0wNQjMRIVsEZsAST1+I1
         xC8ACtFUa0QpW6/T90KF4Y+SD2fwk//2Hhjup7AnaVzpIKERvsk8O7cvTzFiRe9UrDMh
         4P8MuSHVRULpv8dnoesKYCHiyRIS4zqiTIvmLla/peR5BtKs5EK4T+bGvVK78zKOwYzf
         FMgfHPIy6FlQREvwk+ZY4cl+z2bztkxCvZz2hVlBQGHTePC0TONNRq9DxKQPxH3t3Kou
         N+Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uaKeA64G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si3970176ilj.37.2021.03.25.08.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 08:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uaKeA64G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPS2A-00075s-Ht
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 11:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRzJ-0005Ew-Fh
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:33:34 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRz6-000579-Ed
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:33:33 -0400
Received: by mail-wr1-x42d.google.com with SMTP id c8so2700087wrq.11
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uZpAMMR+4O26S3vnkFRf0Ab3gTpOaqGRZy2FhEyixw8=;
 b=uaKeA64G6J1H5qClFpaUGlakuYR3pQWRl6b+/0ARN74Rr0FXpMspgBv8GzgY3uGO4a
 zACe0ZtSP2BLxvA4UwGnTYEAqhoiovBPrJzETGnkvNjsnXSz653oZyG3+QQWwVfSktPB
 OI7ljPQp/GJeWkgHvs1J0+WM5bSfymlrNqQKA9EoRrvSXqEdM43WHSnvhJfZ0fDTD1+w
 9PuiGavpUtJTqUjg/iYvsWjZ4qQqfPbd87l8VZPwB+uB0m2et5678ywfdmXa3LVpM/C0
 bFZHh1Eh/YSJQCLrUE67i+dIr5+drYU2TVcB6FI6yqqO5byRClLx2yO2aFjwNKJlCOmT
 9qzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uZpAMMR+4O26S3vnkFRf0Ab3gTpOaqGRZy2FhEyixw8=;
 b=oF4s72gJCuuaAvYXROZF12okmiit2aWWimE6Iz1bx4/3pms6hbnvltpt3rU/pgHFfd
 H/IDV6kG8tdS62TTFWZPetKaZfVS5SIJXFTFHL5GiSGCSappAqTLB8XS4hTrPKhKu3BN
 aXaOh2L6bitMmALjZ7M1jTilS7RzkuKQIDidb+GclCPboX9ebW6bRV+HVFS1CJIuO4Yu
 XUoluFeba1XJMW+Xs65FBBHZryXGOOu1sWxF4EaDnw/TvEsrzeEnq1+WtFr44FneKmzB
 IdiQB12l0KdemsZHRfQWe9QNpHn81wqAmhVqKiYPGou+KT8ZJYFCwpfZcDfW7CE6bth5
 eR1A==
X-Gm-Message-State: AOAM531jMqrFEXTxnkWoyq7Ou5prTtkG4TyTlhTQwmxTyQg5tNqTaqI4
 2QjjbWq0vSwnwnyP/ThukAZNOw==
X-Received: by 2002:a5d:4bcb:: with SMTP id l11mr6604888wrt.390.1616686397149; 
 Thu, 25 Mar 2021 08:33:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g11sm8004580wrw.89.2021.03.25.08.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:33:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 4/4] hw/ppc/e500plat: Only try to add valid dynamic
 sysbus devices to platform bus
Date: Thu, 25 Mar 2021 15:33:10 +0000
Message-Id: <20210325153310.9131-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210325153310.9131-1-peter.maydell@linaro.org>
References: <20210325153310.9131-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T8dFbgbkMAij

The e500plat machine device plug callback currently calls
platform_bus_link_device() for any sysbus device.  This is overly
broad, because platform_bus_link_device() will unconditionally grab
the IRQs and MMIOs of the device it is passed, whether it was
intended for the platform bus or not.  Restrict hotpluggability of
sysbus devices to only those devices on the dynamic sysbus whitelist.

We were mostly getting away with this because the board creates the
platform bus as the last device it creates, and so the hotplug
callback did not do anything for all the sysbus devices created by
the board itself.  However if the user plugged in a device which
itself uses a sysbus device internally we would have mishandled this
and probably asserted. An example of this is:
 qemu-system-ppc64 -M ppce500 -device macio-oldworld

This isn't a sensible command because the macio-oldworld device
is really specific to the 'g3beige' machine, but we now fail
with a reasonable error message rather than asserting:
qemu-system-ppc64: Device heathrow is not supported by this machine yet.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ppc/e500plat.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index bddd5e7c48f..fc911bbb7bd 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -48,7 +48,9 @@ static void e500plat_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     PPCE500MachineState *pms = PPCE500_MACHINE(hotplug_dev);
 
     if (pms->pbus_dev) {
-        if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+        MachineClass *mc = MACHINE_GET_CLASS(pms);
+
+        if (device_is_dynamic_sysbus(mc, dev)) {
             platform_bus_link_device(pms->pbus_dev, SYS_BUS_DEVICE(dev));
         }
     }
@@ -58,7 +60,9 @@ static
 HotplugHandler *e500plat_machine_get_hotpug_handler(MachineState *machine,
                                                     DeviceState *dev)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+
+    if (device_is_dynamic_sysbus(mc, dev)) {
         return HOTPLUG_HANDLER(machine);
     }
 
-- 
2.20.1

