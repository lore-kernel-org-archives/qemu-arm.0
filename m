Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp398697ejc;
        Tue, 11 Apr 2023 03:31:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350bshGNtSDIFRz6pwFnrZ/1/8K45PC22cfxc5eWQ+Ko9l8I28W1lQmDmlaFozbS6SovFK2xV
X-Received: by 2002:a05:6214:e48:b0:56f:1b7e:d87f with SMTP id o8-20020a0562140e4800b0056f1b7ed87fmr22323626qvc.34.1681209106456;
        Tue, 11 Apr 2023 03:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681209106; cv=none;
        d=google.com; s=arc-20160816;
        b=BUMK6tUmiU3c79PrvvH05LP84MKUZEkGZXOsn62HToE7oOAxil3LRqgPHvd+8MRzQd
         oqDckcEKJlVNM+atEb0Hj2x6V6rHoTpGd1pZufoqLhnrn94owJCtjEfj9vNovbcl6sEI
         HrET+I4CxZpUdg1VnbM4bfR3lEP7EEIwMHVeTxjT0W8LRWHwQyDKK/2aIDvbZRFexmDK
         kpCqY+dzt4wRJOVJ/EtAp7Z8BnzRAAZfh2SwER01JDR84miQ3J0xbpbDbjxyQX94CF+A
         +RO/F90MM8tSlKk3azqNRwpthdKe2s3mKUAc2Z4pneKC0nZF/6zj2G13yM0oW+jav6y4
         V6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=jQcPoZYF5V/WfEMLeE1eZP++W4xAxZxyW+eXvaRyFME=;
        b=f817RxiW+AliZ5YgHpaYOagpJ5pJ3IjKVq4di4boYxJ0JGePhZjtt9/4Mrvs3wAh5i
         8cBQ0Ah0ywz2pC0TCyRaNSSJLvQAW7u7YPEMjXr9nDmSU7onu+jMlL72boPivEXEfOre
         1hiLvns+MwUc+Eh317X+rBk9faZ606aji8Elzvk25wmU3Lfnf67JmEfLBt8AC56Om7/g
         PRgMmPvlotbyuBSH7LqwqHO0nMCMtyc5Sy/vPbZoMVS8rTFuQInFdxepX3Q7l5ClGw8M
         QVBg9GPZ8buBJs+obVcwL+e2nlyZ1SrwArBzx1JuLt9OJ+wX4nk/49zEKy0o/sG9+F1m
         g5IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ETXgwjv2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020a056214062600b005adb460bc9bsi8657149qvx.412.2023.04.11.03.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 03:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ETXgwjv2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmBHR-0005hx-8m; Tue, 11 Apr 2023 06:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmBHL-0005fy-MA
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 06:31:12 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmBHK-00083N-1m
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 06:31:11 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 d8-20020a05600c3ac800b003ee6e324b19so3982272wms.1
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681209068; x=1683801068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jQcPoZYF5V/WfEMLeE1eZP++W4xAxZxyW+eXvaRyFME=;
 b=ETXgwjv29GJ/if1mlpcP7ecsz3bTTJq798Nw3qNpR+TBGEnNBnIZCaH8vrZG8uuqFR
 C/ovYtLLaP0Wrshb12eICozPK+SZBKv9Dmyotg+8IpDc5RZUxF+ZtDqZaBwM4cUUcy3J
 7WTP69dm61y0JMqqDMJi1CJVMamaEdNdbgPinOWt+xR5sg43XJumz+UAaJUG2RIC9Qly
 4Y/mW/lpmvzFOwxxuZz3ia9IW9uLfaovzbiNPjGOXOgpFT3C3guPCkR1yygPO6bTbt82
 yCPLDiFJ3h85oP/8Wfe8ZgFg7qcKVssYlYXxMEkoWZeI1+vFnlILrf7JsGsHnRaxR6oa
 B7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681209068; x=1683801068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQcPoZYF5V/WfEMLeE1eZP++W4xAxZxyW+eXvaRyFME=;
 b=fT20SXcjCOF3ZodbW60CSOQHWv95qvi6qubWArTD9CxilNVZRryCaUEGRYX2HklVEq
 xsaF/zCGN7AlA+sEEPDJho5u31QDcebzHHBAVnSiKMqBy6tbATL484u72bw6WFL/GoFk
 qhldm1ty5xgLpEpuM3QrvmYnn3fLpWZUVzbZ+8AacQn+Fma2ks9wNzMvx1R+b0QJm/o1
 6aWI1UrSL6mqN5Sc30L69LAm5v++53Uzyye6ySQXzxAjxh/Xgvz36SlEsWVq8hr31a/x
 2nV1C9kv8CEw0CCPNWG8Hxg/5mSIXQ4BcnahfTjgf3fV1hzBwuV71CgN+LbeALBM/N4K
 6FXQ==
X-Gm-Message-State: AAQBX9fmGpG+1oyzRnxo40JZSLWRYz/E6gqW+WFgRnalSz26nY3gQywv
 6vnsdDDaH0PFslBtITlHpIwdSdkbcdOTFfL9TD0=
X-Received: by 2002:a1c:4b0c:0:b0:3ed:2702:feea with SMTP id
 y12-20020a1c4b0c000000b003ed2702feeamr6411343wma.41.1681209068126; 
 Tue, 11 Apr 2023 03:31:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003ef7058ea02sm20568516wmq.29.2023.04.11.03.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 03:31:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qianfan Zhao <qianfanguijin@163.com>, Thomas Huth <thuth@redhat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [for-8.0] hw/i2c/allwinner-i2c: Fix subclassing of TYPE_AW_I2C_SUN6I
Date: Tue, 11 Apr 2023 11:31:06 +0100
Message-Id: <20230411103106.3992862-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: MWXLQBv2wgql

In commit 8461bfdca9c we added the TYPE_AW_I2C_SUN6I, which is a
minor variant of the TYPE_AW_I2C device.  However, we didn't quite
get the class hierarchy right.  We made the new TYPE_AW_I2C_SUN6I a
subclass of TYPE_SYS_BUS_DEVICE, which means that you can't validly
use a pointer to this object via the AW_I2C() cast macro, which
insists on having something that is an instance of TYPE_AW_I2C or
some subclass of that type.

This only causes a problem if QOM cast macro debugging is enabled;
that is supposed to be on by default, but a mistake in the meson
conversion in commit c55cf6ab03f4c meant that it ended up disabled by
default, and we didn't catch this bug.

Fix the problem by arranging the classes in the same way we do for
TYPE_PL011 and TYPE_PL011_LUMINARY in hw/char/pl011.c -- make the
variant class be a subclass of the "normal" version of the device.

This was reported in
https://gitlab.com/qemu-project/qemu/-/issues/1586 but this fix alone
isn't sufficient, as there is a separate cast-related issue in the
CXL code in pci_expander_bridge.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/allwinner-i2c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
index f24c3ac6f0c..9e8efa1d63f 100644
--- a/hw/i2c/allwinner-i2c.c
+++ b/hw/i2c/allwinner-i2c.c
@@ -466,10 +466,8 @@ static void allwinner_i2c_sun6i_init(Object *obj)
 
 static const TypeInfo allwinner_i2c_sun6i_type_info = {
     .name = TYPE_AW_I2C_SUN6I,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(AWI2CState),
+    .parent = TYPE_AW_I2C,
     .instance_init = allwinner_i2c_sun6i_init,
-    .class_init = allwinner_i2c_class_init,
 };
 
 static void allwinner_i2c_register_types(void)
-- 
2.34.1

