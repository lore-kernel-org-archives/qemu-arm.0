Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp702486njb;
        Thu, 22 Aug 2024 09:22:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlpsk4RrNmU580c75gKFgnvbtz+rmZLEZym0pG8vE312Ts7yaBDrNegHf+Xa0Jjp8TjWQB3myjAnJ3OA==@linaro.org
X-Google-Smtp-Source: AGHT+IG+WDTlw1wIog0+WO1mGS2e68NxZ6cBNTzaOiQ41AOL8d7/4LEXy3K7jI6V50qYmLfgfNPo
X-Received: by 2002:a05:6102:5120:b0:492:76e9:961a with SMTP id ada2fe7eead31-498e21da544mr2910632137.1.1724343741143;
        Thu, 22 Aug 2024 09:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724343741; cv=none;
        d=google.com; s=arc-20160816;
        b=c0XuewcudCSfVsa4huvN1EwGxnPl980DpFPhtQh7ycQ4WG6Zkzn9QoOhfWgTgQ3KwK
         1ZCIYCAx8LFCOhcBKX2IikOW1VkfESjSecrvRdulSBpYAxDrYAodMqUltW8m7QFU5/UI
         wqAF+IViU0VkbEe0sHNiekDJuKKXnhc/377Ye4Hs10CHAwo4mrq05wq8BCpDoOYRnayC
         Pjpl8C7errHO8Hf4IXriSktmkIfB+h8BjSPrUqPhzoVZD4baTuvAN4LykwYP44YuqmIh
         2bZNAsKq+r33rxDprZBVv09qfqTlHyQAuC0CXCFlojwj2GxnMbXGY6zkXWnTW/+QWbQy
         bK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AY1IW4T2DNcuGaXu8tbq///494SrbvPqRCnm6aioH7A=;
        fh=eKvyMq82ozF2pexIVE339+mXcynob0ROL80gQzK9b2g=;
        b=cLLv+6qbwZVHAbCr17Yc/at+bPxGVeQbR52rsXQiIlVD2SdKv5h4eFD+OdqSd2m8c1
         XjU3rP5z8+5jUXa20y0sKwxVt93RcmsXrtmPgjunsm/B4uvFC6OYyRIVCrKFpEG8E3Gv
         unhY6cYqRj9gQXFlLA7pFVzg5aMDNhvk5ZQNrZyv+rjDQAd7tstb2RSEO+0f4n8e+yUT
         Ek0gnkNcqKkA3YutzHsVb02Fq6xEDEhtatSeQS/rVgUulOrrTkshsyLPuimUyVI26/4N
         F1BwK1ZLfH9mGOdeceGoi7dGOaDRvx+gB+IErRy8ShpKwHgWnz7ezqkXi1dk/KSqO3sh
         NhaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fl1OuYOW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-498e491350esi456796137.460.2024.08.22.09.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 09:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fl1OuYOW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shAZG-0005JS-90; Thu, 22 Aug 2024 12:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1shAZD-00057f-KE
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 12:21:43 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1shAZ5-0007Kp-Nz
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 12:21:39 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4281ca54fd3so7975975e9.2
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724343692; x=1724948492; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AY1IW4T2DNcuGaXu8tbq///494SrbvPqRCnm6aioH7A=;
 b=Fl1OuYOWFDeQlOlcI9XVmcXAxU309m/nzgchKo+6ZRffcwtUQgsljiJ6V8Oymsigw0
 uKTvsbXz5si2DB52mBM8hFsfIIZRrhwagUS9/SCpQx9wEqxFzXhI1vYRsS2VF2QJ2EH9
 0IIEs5DY/RByp97UQOrWANDntiTGlo1cuuTe1pqDTXboqhtJOMCZonUBA6jYLMWBoB4k
 qzQKO0UbLhdY59XZiLWNFWEOWxbk8TWZEekLbwuBm41iWOB1Vpf/VdbuSH+qicQjQf6O
 KCkcD3UErJN5bUoDzkbninizZndayvFaTZ4WZSlvqbAlaf2pu97ZGvuzP09avNtVlThS
 wdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724343692; x=1724948492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AY1IW4T2DNcuGaXu8tbq///494SrbvPqRCnm6aioH7A=;
 b=MPHjlN4dSA1dmN8JPdlCHc6lz1BQIiv+Dp49VT6VlFY44lh+gees6dgDVijZSBbXKR
 choBx/9KvaeWD/Z8/2YSi2QTxQnuxcN5YuNTdKSgwpIhgxXMP51pZ2jroq0f47F9w/Qb
 f3VDfz2q/gxcm8MkSP8PNHtm/MCNpWlpKbAmdFnaJ55oAfPbaObdFHULYCReMiNXoZey
 wy7VnywtWtze3ctMPYWuYsWuiMdpLk2S7PvJhbNRw46/5upMY6IAS/c0UYmBa2CPd238
 DxClhKFCWmXhrcnD65FiGJ5JBxW2EaEzsc2W/48Fikp2XxgOPLym71dWscIpGD9C9/es
 Ox9w==
X-Gm-Message-State: AOJu0YzTMTcmmd4yr7aBzjBtjh4sph2d3y9HDLIyb8yVAjz2ENrtNqee
 efk0I7HE5N/9fojbd7noYfrM7+4c8V4x5asqkOwsThG4JukbjbLKAw32k4dOmxnrg95Sib+A8b4
 x
X-Received: by 2002:a05:600c:468f:b0:426:68f2:4d7b with SMTP id
 5b1f17b1804b1-42abd1121bbmr47556815e9.3.1724343692582; 
 Thu, 22 Aug 2024 09:21:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac5162347sm28928485e9.23.2024.08.22.09.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 09:21:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
Subject: [PATCH for-9.2 6/6] hm/nvram/xlnx-versal-efuse-ctrl: Call
 register_finalize_block
Date: Thu, 22 Aug 2024 17:21:27 +0100
Message-Id: <20240822162127.705879-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822162127.705879-1-peter.maydell@linaro.org>
References: <20240822162127.705879-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8KiW0LB2+s8g

The TYPE_XLNX_VERSAL_EFUSE_CTRL device creates a register block with
register_init_block32() in its instance_init method; we must
therefore destroy it in our instance_finalize method to avoid a leak
in the QOM introspection "init-inspect-finalize" lifecycle:

Direct leak of 304 byte(s) in 1 object(s) allocated from:
    #0 0x55f222b5b9d8 in __interceptor_calloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/asan/qemu-system-aarch64+0x294e9d8) (BuildId: 420
43d49e1139e3f3071b1f22fac1e3e7249c9a6)
    #1 0x7fbb10669c50 in g_malloc0 debian/build/deb/../../../glib/gmem.c:161:13
    #2 0x55f222f90c5d in register_init_block hw/core/register.c:248:34
    #3 0x55f222f916be in register_init_block32 hw/core/register.c:299:12
    #4 0x55f223bbdd15 in efuse_ctrl_init hw/nvram/xlnx-versal-efuse-ctrl.c:718:9
    #5 0x55f225b23391 in object_init_with_type qom/object.c:420:9
    #6 0x55f225b0a66b in object_initialize_with_type qom/object.c:562:5
    #7 0x55f225b0bf0d in object_new_with_type qom/object.c:782:5
    #8 0x55f225b0bfe1 in object_new qom/object.c:797:12
    #9 0x55f226309e0d in qmp_device_list_properties qom/qom-qmp-cmds.c:144:11

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/nvram/xlnx-versal-efuse.h | 1 +
 hw/nvram/xlnx-versal-efuse-ctrl.c    | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/hw/nvram/xlnx-versal-efuse.h b/include/hw/nvram/xlnx-versal-efuse.h
index 86e2261b9a3..afa4f4f9960 100644
--- a/include/hw/nvram/xlnx-versal-efuse.h
+++ b/include/hw/nvram/xlnx-versal-efuse.h
@@ -44,6 +44,7 @@ struct XlnxVersalEFuseCtrl {
     void *extra_pg0_lock_spec;      /* Opaque property */
     uint32_t extra_pg0_lock_n16;
 
+    RegisterInfoArray *reg_array;
     uint32_t regs[XLNX_VERSAL_EFUSE_CTRL_R_MAX];
     RegisterInfo regs_info[XLNX_VERSAL_EFUSE_CTRL_R_MAX];
 };
diff --git a/hw/nvram/xlnx-versal-efuse-ctrl.c b/hw/nvram/xlnx-versal-efuse-ctrl.c
index def6fe3302b..8252a5cabe0 100644
--- a/hw/nvram/xlnx-versal-efuse-ctrl.c
+++ b/hw/nvram/xlnx-versal-efuse-ctrl.c
@@ -712,9 +712,8 @@ static void efuse_ctrl_init(Object *obj)
 {
     XlnxVersalEFuseCtrl *s = XLNX_VERSAL_EFUSE_CTRL(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-    RegisterInfoArray *reg_array;
 
-    reg_array =
+    s->reg_array =
         register_init_block32(DEVICE(obj), efuse_ctrl_regs_info,
                               ARRAY_SIZE(efuse_ctrl_regs_info),
                               s->regs_info, s->regs,
@@ -722,7 +721,7 @@ static void efuse_ctrl_init(Object *obj)
                               XLNX_VERSAL_EFUSE_CTRL_ERR_DEBUG,
                               R_MAX * 4);
 
-    sysbus_init_mmio(sbd, &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->reg_array->mem);
     sysbus_init_irq(sbd, &s->irq_efuse_imr);
 }
 
@@ -730,6 +729,7 @@ static void efuse_ctrl_finalize(Object *obj)
 {
     XlnxVersalEFuseCtrl *s = XLNX_VERSAL_EFUSE_CTRL(obj);
 
+    register_finalize_block(s->reg_array);
     g_free(s->extra_pg0_lock_spec);
 }
 
-- 
2.34.1

