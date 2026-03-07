Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB394FCB63F
	for <qemu-arm@archiver.kernel.org>; Sat,  7 Mar 2026 15:43:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vytnn-0004I8-AN; Sat, 07 Mar 2026 10:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vytnm-00048W-8P
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 10:42:50 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vytnj-0002cn-TJ
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 10:42:49 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso151812095e9.1
 for <qemu-arm@nongnu.org>; Sat, 07 Mar 2026 07:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772898166; x=1773502966; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YxXcgTIjs3O9IFx8gABZ9Om88U+wQy7QKGtyc8xrz4s=;
 b=bHSTXC41eCO1fZhYWiunqf0MfcjmtfNkedciVsxoZIShmvUefcZ/8GA0WR2ypnVsLw
 WlJzXQOUGasFz4f/ULCJX37cGeUb5pMxdMg3bJ4LUMcy+zqBSDA9Vc49gQ7zN91icIdU
 5Px8vZZvhefXyaw8eRIMWfMaP81FuqtfBX8qYjaCcMbtNfXUv773jZhjid8zPZE3dWs/
 hts4N3XH+UzGiQZT2HqInRPNuUuTdhCo3Qk73g3+j5oHICayAay2atM/PpVbeqw833sG
 6QEKuXh+GZvvs/F4RfNbkZS8V18cm5bD9MH6VZL30X8Op+O6O5wuWcjEQPbSZFuBnbSz
 6hGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772898166; x=1773502966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YxXcgTIjs3O9IFx8gABZ9Om88U+wQy7QKGtyc8xrz4s=;
 b=bZ8UJeh1QJkaMwkjksOH+Lpfr9I9Ppis1wzIS80CMXpwrxw00biy5adbFXip02J1Jx
 r66rqkv3d/UAoZpcowpScjAR2X7sZrMxg4cINiDN0SvfKcFkkofBOgHk945dDc1H0M9F
 GoVK/DXdbc2CN5w5NEZdxbL1YChxFlo3j7qXFcj3AtT6jlZPMvbQueIMN8DDX3UO9R32
 AlYJivPnNRA8jbvxRAD1qrqH416Yg8J+NigiLu5HGO8q2aeEyy3VGUCAN/nJIlRsWbbx
 1+y6bwUom83tQpy7TU3R4qDGNgjboK937hYhH5dUU8hF02frLUFIWSCqAy6b+xqDHyIa
 ipuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8wGQ67hRoAhjDQHy1Mb3/pSLCyeehf7jo+97kNXyGiTt9ySLCxWfn1XOCEMVO1NdZ/2IDKO1bAQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzow61s9M4N6aFEksof9ytKBOD3Wm5Whf26qV9zrQ4fzqAUPsH1
 N+zILddHBHxO29/z2NxsUg0UO+pLiQJlPvc5700tWNxrBmRvhR/6ZzJYVK0i/Jx0tVE=
X-Gm-Gg: ATEYQzy7dX/sfnVa9vFTAV9Po3JScp6Tc06oDPMsqvxjzU1NuOSPXE+GFShyLw6fz3V
 pwrwROnnyiboAvLcj96rIOFytwUyLlzJYDan02DmtCN2Sez1pr9pVfLp9gTaelrpAakPcetTW/c
 5czJsYQnOMEOLlr9OtplSfp2phGavrgQL7D7ZtkSRzREgoLkIbQ3sAn5wREh0xPG2Zkm18qoK7B
 nLi5V0Aks1Y3e30cpv/b4qvUQS3l07AC8CAvHNPYfTfq8+w+2b9XEQyXeQRjatBrI+jSAyzNf6t
 kgLcZP90HodAvCnNHpLh+myxY5OHqVe9uwdMTsY+JAQMXX5H89caFakL14oogWVA6GSgRMLmy4S
 1eI3ZF8FaeRlE/hYTHSMwImz1210AYCOyTGE2o5ePciMWTtdTwbXKkIXdRWeoO6Stk4EMkPTjKF
 KcrdBb7eBtwp8bAzd3WPM0V1npVOt/X8LBiVmC7tucKhWzb5cGZWgi6VEDtx1yPajGsHI/9TwM
X-Received: by 2002:a05:600c:3b9e:b0:483:498f:7953 with SMTP id
 5b1f17b1804b1-48526966364mr100848005e9.28.1772898166167; 
 Sat, 07 Mar 2026 07:42:46 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485237dd017sm44629195e9.2.2026.03.07.07.42.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 07 Mar 2026 07:42:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH 6/6] hw/rtc/pl031: : Remove PL031State::migrate_tick_offset
 field
Date: Sat,  7 Mar 2026 16:42:02 +0100
Message-ID: <20260307154202.86309-7-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260307154202.86309-1-philmd@linaro.org>
References: <20260307154202.86309-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The PL031State::migrate_tick_offset boolean was only set in
the hw_compat_4_0[] array, via the 'migrate-tick-offset=false'
property.  We removed all machines using that array, lets remove
that property, along with the pl031_properties[] array which is
now empty.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/rtc/pl031.h |  1 -
 hw/rtc/pl031.c         | 22 ----------------------
 2 files changed, 23 deletions(-)

diff --git a/include/hw/rtc/pl031.h b/include/hw/rtc/pl031.h
index c8b26c2f00e..75779c63122 100644
--- a/include/hw/rtc/pl031.h
+++ b/include/hw/rtc/pl031.h
@@ -36,7 +36,6 @@ struct PL031State {
     uint32_t tick_offset_vmstate;
     uint32_t tick_offset;
     bool tick_offset_migrated;
-    bool migrate_tick_offset;
 
     uint32_t mr;
     uint32_t lr;
diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index b56877c3a20..09d1b15c779 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -278,18 +278,10 @@ static int pl031_tick_offset_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static bool pl031_tick_offset_needed(void *opaque)
-{
-    PL031State *s = opaque;
-
-    return s->migrate_tick_offset;
-}
-
 static const VMStateDescription vmstate_pl031_tick_offset = {
     .name = "pl031/tick-offset",
     .version_id = 1,
     .minimum_version_id = 1,
-    .needed = pl031_tick_offset_needed,
     .post_load = pl031_tick_offset_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32(tick_offset, PL031State),
@@ -319,25 +311,11 @@ static const VMStateDescription vmstate_pl031 = {
     }
 };
 
-static const Property pl031_properties[] = {
-    /*
-     * True to correctly migrate the tick offset of the RTC. False to
-     * obtain backward migration compatibility with older QEMU versions,
-     * at the expense of the guest RTC going backwards compared with the
-     * host RTC when the VM is saved/restored if using -rtc host.
-     * (Even if set to 'true' older QEMU can migrate forward to newer QEMU;
-     * 'false' also permits newer QEMU to migrate to older QEMU.)
-     */
-    DEFINE_PROP_BOOL("migrate-tick-offset",
-                     PL031State, migrate_tick_offset, true),
-};
-
 static void pl031_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &vmstate_pl031;
-    device_class_set_props(dc, pl031_properties);
 }
 
 static const TypeInfo pl031_info = {
-- 
2.52.0


