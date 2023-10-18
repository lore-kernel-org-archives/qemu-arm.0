Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4669292ejc;
        Wed, 18 Oct 2023 07:13:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+H5XoDMSIuvX2ts5x7LQMRejHkSwpzkCJzJ0inMlDMEJtUju9XJyn6G1fY0r7wgFtephA
X-Received: by 2002:a05:620a:190a:b0:775:937b:c594 with SMTP id bj10-20020a05620a190a00b00775937bc594mr5823330qkb.58.1697638427757;
        Wed, 18 Oct 2023 07:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697638427; cv=none;
        d=google.com; s=arc-20160816;
        b=ydpHuWD8QT+4m/3ilU2eu+tLUeBUIcJ7jZZ8Kd7t2F0+Ao0yFMC+Lrk9SN20DMWkzh
         HBSJulPL/VJwaUbahGN3jsxb52rDAsSqwxIvqDEkxNK2FCjbftW+KwiqudsC73JFmvQg
         UwHHY9GPvqcnYiLVqPaXJ4bMueH1MUNDMxdH+hzi/7VgfRZ4xXT66iXJu+8MslbBvnON
         8KWOKf23D+By0aOW1zhuqppf6yg8kr1+e7tn4Yj+skdqmd3Ydjz+5m0Wykf91aNTKUOr
         BKQcILyiY3tYBDWmd4iINnxFpVFLx+1M68NNjUCBVGRrQkDV2R+f76ggu33QPAex/5zb
         ULRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=III6J63m6TXPzGkHNGeaIlMVjIpH5ItVsLY/wuEjMjM=;
        fh=ANIikQnX6ADG7FYuHYnQUKFZKV9+VnxLLzGv0RFOlfg=;
        b=WbBKCnYisZlUmgrdeGvesDAMHa9pO6n1YSU6slxpXXwdl5/CjacHRxmKZY8A/reIL2
         vQl3Q/ILuMwtTKBGSQg/rhyn1EM7/RiKEgbe3JOqgHwbfJZaZwz4MfQNDu+kMA4ef011
         hPia84sUomF5harV5HxGvdmsGU3Gt+4fgANoEIXd2cRVdgyibINo7JW892+xOtoA77ru
         Gv6UGQDI8QCUtk4AVweeFB1gmtS/UwyLbmJpQw0UdjqIAWPiU93aKwbKu75r/o7lMYuF
         8gnCbyfTViKzmszvusOy2VTKsefRylvnaRobUeuvtYg0ja6mEATiomsIoNs5lXBjtvhx
         ubnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WcRJDmg5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2-20020a37e202000000b007758fab8c64si482787qki.518.2023.10.18.07.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 07:13:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WcRJDmg5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt7Im-0002op-7O; Wed, 18 Oct 2023 10:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7Il-0002gK-5W
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:13:35 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7Ij-0004ys-Dg
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:13:34 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53e16f076b3so13148820a12.0
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697638411; x=1698243211; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=III6J63m6TXPzGkHNGeaIlMVjIpH5ItVsLY/wuEjMjM=;
 b=WcRJDmg5KTLuWJ+FhW+WLf2lwM8zZ7S5OCn+ylDZi2SN2LF5LLPC2QRBnIdb5FD/KA
 Rj1JEuVx3GVAihiK8Le+AL9WbqkIOWTEnUyHxP9wsTssX/cLAY+xvozGZdYMref/x33F
 +7g/rUzDGK7K1UL7fMIkb6ylwF9Var05F423cyJYDbcyjkv9nOCq0vdKZWyAaexTi9Yw
 ynH4z1cNH9F2yOP9yks9r9NZX/F9mTGbaAMPPbPl4B4l8AmU5Z7NYcjqusYKg/5+WIKl
 wJiz4lRQEvDeJSrTxhL7WQtgSLw+53M+OnfsCOtdWrFGivHp292Hr2isKJmen4sdli2q
 o3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697638411; x=1698243211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=III6J63m6TXPzGkHNGeaIlMVjIpH5ItVsLY/wuEjMjM=;
 b=tg++Yv9u0DZNTyVeD/h/ZtQ/+xQGY3pX0HNSIBETWGIhRLzLd2bkGxxeMIJwK2Xza4
 HgvBa3qh7pL2pPqApPlnQIHUkekDqRqUurfqGO9bGvh1cwKA+nsVFvhL/OCq4ZVQ+lhs
 HbaqzURjf7mBShMgVONaIFOA8PnxsuBG5bEGFiSpiEYazKf5PXNXdm9lYQqefbkdYkNc
 5aaLw11o3khzXAGjZhKw+NFR3ZcIIWB7m2CaOxbZbqBFQgrCWl2axpX0dPTSLwG8ss2Q
 7lL+T28ay7kXuP85WbhR/uOmApy6uugnpGbv8N7XBCoGFc2z2QZIg9gQK0BCu1TTcYuz
 RKvQ==
X-Gm-Message-State: AOJu0Yz/i10ElnvZB9ChGpCbgWx7VEBkP/zlNPtKp2/eCv/Dy4h4eSUq
 nQyOTMZIBCAXWnmSlUTdbJoGew==
X-Received: by 2002:a17:907:ea1:b0:9bf:c00f:654a with SMTP id
 ho33-20020a1709070ea100b009bfc00f654amr4948996ejc.24.1697638411390; 
 Wed, 18 Oct 2023 07:13:31 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 t3-20020a1709064f0300b009c3f1b3e988sm1734423eju.90.2023.10.18.07.13.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 07:13:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 12/12] hw/sysbus: Ensure device is realized before mapping it
Date: Wed, 18 Oct 2023 16:11:50 +0200
Message-ID: <20231018141151.87466-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018141151.87466-1-philmd@linaro.org>
References: <20231018141151.87466-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: i86o0pzF8HBG

sysbus_mmio_map() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/sysbus.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index ce54e2c416..a46828a808 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/error-report.h"
 #include "hw/sysbus.h"
 #include "monitor/monitor.h"
 #include "exec/address-spaces.h"
@@ -132,6 +133,13 @@ static void sysbus_mmio_map_common(SysBusDevice *dev, int n, hwaddr addr,
 {
     assert(n >= 0 && n < dev->num_mmio);
 
+    if (!DEVICE(dev)->realized) {
+        error_report("sysbus_mmio_map(type:%s, index:%d, addr:0x%"HWADDR_PRIx","
+                     " prio:%d) but object is not realized",
+                     object_get_typename(OBJECT(dev)), n, addr, priority);
+        abort();
+    }
+
     if (dev->mmio[n].addr == addr) {
         /* ??? region already mapped here.  */
         return;
-- 
2.41.0

