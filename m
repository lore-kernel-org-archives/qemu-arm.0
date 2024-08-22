Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp702526njb;
        Thu, 22 Aug 2024 09:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW89chZMZuLq/8M8CjVSohreXuyhiBFXLLvkapz667SRoiqfsIVs2PGWN0XKq9F4TxKBlI/yeaXmiDGrg==@linaro.org
X-Google-Smtp-Source: AGHT+IHnXQQbvXFeMBs0eF9VCkGnMxLJ9T0PSeMx6DJW0DHkUBJMqzqDALdnicccO98d2bmoFJzr
X-Received: by 2002:a05:6214:3381:b0:6c1:6b52:5b90 with SMTP id 6a1803df08f44-6c16b525c62mr2948786d6.26.1724343749330;
        Thu, 22 Aug 2024 09:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724343749; cv=none;
        d=google.com; s=arc-20160816;
        b=JPhK0+21kA1GWXcp88QdO9XIcR4NlIPD2S+1mykeNQenRvQNOKtnqSNrYfZ8W0xMAF
         xuT0Mj3mCxAAO6tJf1yJ3ZMr2t3eE6NeJ0ag1teyfGmnxbQTk7gOi9DwLWfw33q1616O
         cxjp+lDGvx0CioAyZGtbgNpYtkjfkUyO6ClHNHPuIF+L+LM5gOPV/OGdpqbK/OSS1vv1
         8jqmDhZZHhvVeSagcPMhHMCTAGOk542Mc9Wxfk9Z6FDSbOMQLovEvRTKEmIhBmZka2hK
         12CZ+MAj0xQIitCJN9TS8BBlO6k9KFsbTqSShJrgVOoAIm3wPZObeDMm2S2QXxJoGYke
         u/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q9APIXuRLkKIat+l/rZBodPQDnkc/ZwrT5ldPMm81wI=;
        fh=eKvyMq82ozF2pexIVE339+mXcynob0ROL80gQzK9b2g=;
        b=HBm3eQ2ESofvIX3wx3s4qEDUjSqek5cnwKTT12xwQemJFugnJJob+qOtv1q5kJgcNK
         QlRlrXmTvjlKQI5u61oh+sTaeY2BexrE7KWlYIMmAOHj2kUeq8eqS70MWSMDhl3Jk58V
         n+il36GEjqOwk7Z1McbBRgX66dHrQBcyqI2Me5F22pvCO3zzLpg9t6nt7jw0tU3ZdqMG
         GCNNut50xsAXNCN1w37N2aGoeZCo5OUPKNjtmfz0wlb9eDNELhF3pmiCqErcoNTg0QAk
         c1kl1XQNoivFynVAdAo9pU/FQM2lssV5u6RildpSn7jlXC77M0HScWXuDoNNBo8psSDb
         WEiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dX4gtxa/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162dd92fesi20834386d6.398.2024.08.22.09.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 09:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dX4gtxa/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shAZF-0005H7-M4; Thu, 22 Aug 2024 12:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1shAZD-00057Z-JG
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 12:21:43 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1shAZ5-0007KT-O7
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 12:21:39 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4281faefea9so7266645e9.2
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 09:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724343691; x=1724948491; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q9APIXuRLkKIat+l/rZBodPQDnkc/ZwrT5ldPMm81wI=;
 b=dX4gtxa/fE4qo5Yt/TAdeYUd7Vjyz0nqR61MVZ1qxEvUR3bL4GEkbeyCi87HXiUd+H
 TtMHy/UYwqbJXDg7IOSe6U6vNVFXb2TAidq5nNjtKLteP/Gzs+SUs8x3zDtiQBAp4t/9
 EWMKVti032LHS8tN+s0UC2WPiJ/F/tW9vVZNXbNmLyeSMBjH7ryKl/7AvU77RG+xCaLb
 hd0kHxDd2Q6eb3ALBMIaWhg1PB+8bRe37UkMqIsNd1DJXz0bJuVjItxbjwFThssoL5GF
 sigcwKwK3DwDlV7WSekiKfVzDwtd7NZsgAZKJXvPFC0Mn6Mb52zgZlKV38Mp7bxHHZ22
 VGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724343691; x=1724948491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q9APIXuRLkKIat+l/rZBodPQDnkc/ZwrT5ldPMm81wI=;
 b=WBkQaISz5mIlwgDcLBGrq7rwTpkTsEjSTm1xnnG9MRgDQkbk9ZOKrDqa0yIwAu1Xw9
 Ij257B/iAmGTlxogzO7rJ0Mj7yPsqPTcBoe/FfjDSAWTSq/jzE/UKANPjiFZevYwipR6
 xEJwuon3LpYhP6IuBsTe3tyQ5/6HZjYMzfOPcm2ob5Dmb6oAA4EBhV4f+ekoMlcYrzUl
 uN2wlHI2rvdG9qT10Uu9CoDiQNUPAn370xQO6gPREI5+oNGiU1PMuatd6BT9cFpuhAJR
 JG+e5NYgGzba7WpY2IrfSwa3L89ZO5UVcoPfHKV8qoH+/wRiPhcPfDVmihB8KV+fnbtj
 3j4g==
X-Gm-Message-State: AOJu0YxOyoKDiqaNJlPQgwbtgba6fAT4VCYsX3esSjC+VPx20DwkHhfq
 PDfZoRjSs4qfoE+toAG0xfTRrBAYUoYVATuLIeISnj1POB7xMUuUCpo2dvUAhC5xr5hjWW1JdeX
 D
X-Received: by 2002:a05:600c:1c90:b0:426:647b:1bfc with SMTP id
 5b1f17b1804b1-42abd244b11mr38979685e9.30.1724343691475; 
 Thu, 22 Aug 2024 09:21:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac5162347sm28928485e9.23.2024.08.22.09.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 09:21:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
Subject: [PATCH for-9.2 4/6] hw/nvram/xlnx-zynqmp-efuse: Call
 register_finalize_block
Date: Thu, 22 Aug 2024 17:21:25 +0100
Message-Id: <20240822162127.705879-5-peter.maydell@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 26OqAVKBLYCS

The TYPE_XLNX_ZYNQMP_EFUSE device creates a register block with
register_init_block32() in its instance_init method; we must
therefore destroy it in our instance_finalize method to avoid a leak
in the QOM introspection "init-inspect-finalize" lifecycle:

Direct leak of 304 byte(s) in 1 object(s) allocated from:
    #0 0x55f3ff5839d8 in __interceptor_calloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/asan/qemu-system-aarch64+0x294d9d8) (BuildId: 23cf931c66865a71b6cc4da95156d03bc106fa72)
    #1 0x7f3f31c6bc50 in g_malloc0 debian/build/deb/../../../glib/gmem.c:161:13
    #2 0x55f3ff9b8c5d in register_init_block hw/core/register.c:248:34
    #3 0x55f3ff9b96be in register_init_block32 hw/core/register.c:299:12
    #4 0x55f4005e5b25 in efuse_ctrl_init hw/nvram/xlnx-versal-efuse-ctrl.c:718:9
    #5 0x55f40254afb1 in object_init_with_type qom/object.c:420:9
    #6 0x55f40253228b in object_initialize_with_type qom/object.c:562:5
    #7 0x55f402533b2d in object_new_with_type qom/object.c:782:5
    #8 0x55f402533c01 in object_new qom/object.c:797:12
    #9 0x55f402d31a2d in qmp_device_list_properties qom/qom-qmp-cmds.c:144:11

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/nvram/xlnx-zynqmp-efuse.h |  1 +
 hw/nvram/xlnx-zynqmp-efuse.c         | 13 ++++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/hw/nvram/xlnx-zynqmp-efuse.h b/include/hw/nvram/xlnx-zynqmp-efuse.h
index f5beacc2e6a..7fb12df3fbb 100644
--- a/include/hw/nvram/xlnx-zynqmp-efuse.h
+++ b/include/hw/nvram/xlnx-zynqmp-efuse.h
@@ -37,6 +37,7 @@ struct XlnxZynqMPEFuse {
     qemu_irq irq;
 
     XlnxEFuse *efuse;
+    RegisterInfoArray *reg_array;
     uint32_t regs[XLNX_ZYNQMP_EFUSE_R_MAX];
     RegisterInfo regs_info[XLNX_ZYNQMP_EFUSE_R_MAX];
 };
diff --git a/hw/nvram/xlnx-zynqmp-efuse.c b/hw/nvram/xlnx-zynqmp-efuse.c
index 2d465f0fc6a..4e2d1b9d1e7 100644
--- a/hw/nvram/xlnx-zynqmp-efuse.c
+++ b/hw/nvram/xlnx-zynqmp-efuse.c
@@ -803,9 +803,8 @@ static void zynqmp_efuse_init(Object *obj)
 {
     XlnxZynqMPEFuse *s = XLNX_ZYNQMP_EFUSE(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-    RegisterInfoArray *reg_array;
 
-    reg_array =
+    s->reg_array =
         register_init_block32(DEVICE(obj), zynqmp_efuse_regs_info,
                               ARRAY_SIZE(zynqmp_efuse_regs_info),
                               s->regs_info, s->regs,
@@ -813,10 +812,17 @@ static void zynqmp_efuse_init(Object *obj)
                               ZYNQMP_EFUSE_ERR_DEBUG,
                               R_MAX * 4);
 
-    sysbus_init_mmio(sbd, &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->reg_array->mem);
     sysbus_init_irq(sbd, &s->irq);
 }
 
+static void zynqmp_efuse_finalize(Object *obj)
+{
+    XlnxZynqMPEFuse *s = XLNX_ZYNQMP_EFUSE(obj);
+
+    register_finalize_block(s->reg_array);
+}
+
 static const VMStateDescription vmstate_efuse = {
     .name = TYPE_XLNX_ZYNQMP_EFUSE,
     .version_id = 1,
@@ -853,6 +859,7 @@ static const TypeInfo efuse_info = {
     .instance_size = sizeof(XlnxZynqMPEFuse),
     .class_init    = zynqmp_efuse_class_init,
     .instance_init = zynqmp_efuse_init,
+    .instance_finalize = zynqmp_efuse_finalize,
 };
 
 static void efuse_register_types(void)
-- 
2.34.1

