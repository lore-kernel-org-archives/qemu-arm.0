Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2987362njd;
        Wed, 23 Apr 2025 05:10:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzs1rOaQhi9xOB1272Qrr/Un5f4WLVcFChM4zPLe00Jn1DpaQQpC/CfGXnhBNs+CzSC2eQnkihx5Qe5A==@linaro.org
X-Google-Smtp-Source: AGHT+IH4llWo3Is4HrJf4tAJBNGQEkWmTvhNUqBDfV01INzWqlgYHb+J/M+hbGAlUb4v0zIOPLF2
X-Received: by 2002:a05:620a:198d:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7c9280394a5mr2642970085a.37.1745410230464;
        Wed, 23 Apr 2025 05:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745410230; cv=none;
        d=google.com; s=arc-20240605;
        b=MTY1qoIAT5PEJbd3AuUU73U/I0l4xrK/52mzFRRzR8hDuPxJbK3rR3exJGAXdHIQuL
         UMmia2EF4bNmecokzjlFKJDirbtbEPVUMwAR+f8rJ9UFnip+VB8Yb+1IhSAfJdevR9jI
         4dWatqMpImZCJhNFSbBDoZhN8cv1YZ/i3s5z9VrSGK78Qs2W8VHhlK9qMal7oajUZNhA
         tIuxPtEafb9Ec9VFTqkXO+UifVQAYd8iKLQCK+vDWtbSKbWqA+4bG6eMZEsuLoQFdko+
         b7j/9dIPfzrt6M2uJlAG5bba0OebKXsQAcJgW6lwsHg+ddr1LBb9df+QcAMbJ56W3AXe
         gPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=FZgMkeN579lrvloaKRasUpMTcORD0XAWHQyNz1vd4U8=;
        fh=DKQFoSm5rvXVk6AUqpSavFv+IR+qPwKdgcCOIx8jJm4=;
        b=bDqKuzJj/lv12t8lLygMF8okSz1i/+oSeXPnjtwkAjlfCsKT95ooYBV64/OEH28P7V
         69WODM6+cBtlNIhgfyLz5D/9RX0WmzAR6DLUSe51GdauMKvADLTHbsBuqXuC9SdfjX2l
         Qe/aSM3VHAx/VXLQk13tV81tkjTlFx3EzWQcI5CgmT8wnurQVRmI2mbL3VdqNBev1XO+
         vEuz6O/jjGBONIICR9SbroVwvpm9tVPtxaxox1vnAPMaBBB8ba7KdaSQZFy9nvGzOkFf
         y5fp6MIlmoasmvbi5Xo5TVX6iItocSB/Fd6LWa97/F/b6VgUgnvylhKXo+4QyRIXWNrd
         1DDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWq1UPzf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925b813edsi1276719885a.317.2025.04.23.05.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 05:10:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWq1UPzf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7Yvq-0001o9-RK; Wed, 23 Apr 2025 08:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u7Yv9-0000vm-TD
 for qemu-arm@nongnu.org; Wed, 23 Apr 2025 08:09:44 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u7Yv7-0000nm-7x
 for qemu-arm@nongnu.org; Wed, 23 Apr 2025 08:09:43 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso47102165e9.2
 for <qemu-arm@nongnu.org>; Wed, 23 Apr 2025 05:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745410179; x=1746014979; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FZgMkeN579lrvloaKRasUpMTcORD0XAWHQyNz1vd4U8=;
 b=VWq1UPzfkVbNIgJNmUDW1hjrXevLVlahFVjoir0qzKulBseEUT7nPLANnDiR8h1Su3
 UUi7/ALRT3fGNXLgV+EKENBuRZ2wxbpTiVI6X9exJqW0dEl8sCpdednsdpfwB9j329JF
 UJmLmoDXesR6jplOlAo4Se0oZZnoBBK6v066Mk7t1oD9cMFr1JEd9Lyse78SDrNu+zrp
 AmcL6U+eAabAmLjChSRsQTtKminWh+ohVeXOsd+c8l7+ijakpkaj+pslvRFnWkL0TwGi
 mZTxz8JUZTBv4SKMglbQj6cdzv2ltn/tTnfbB0iCC6y+PoGGgV3Nj1eKQ/v7dpmdnhVz
 ZVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745410179; x=1746014979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FZgMkeN579lrvloaKRasUpMTcORD0XAWHQyNz1vd4U8=;
 b=krlhgOb/s8G28vjIykAylbKZIzzD4QovIxvIjx2SVSUNAg7PhpUwBbGnVlbYfyjxTI
 CgQMrrKfeVm0nmfcH0dm7Jvh/dWIbU7sSJAxS86CW2xHaLfCKf6pqzMUV8JQGJDpIsUd
 dtbCN6KdK/JLAlJRpcXH9PLj6SeFFH+faypqevKmCNWe5WezRpKZ8qOB9ccupO/JmIVT
 LDd0eXj9O/2mpxUaQni0VBTvvq6TDfK0mfg3OZsulpRCPR8Od/wPnjlGtIFXEZjGiNQe
 rzcbGhYQtInLJTQlT2LNvYcE9rEFHKdrsl2gpJvAgH5C9j/ECmatSzjAOAjCn9rD4dXG
 wKLw==
X-Gm-Message-State: AOJu0Yy6/7G7Kc4FNQFeRh7AmRSstCyvGymTD8mHPgKhLnwxqDHwHKgq
 A0Nj2ruZViQci9AQSwOdZb47TvytKJjxe7+Nr7c+s0ZJi9FdPxOTBj8FkfHVKV4=
X-Gm-Gg: ASbGncsByLN5LGN6V6goBgZKZjLiugA4SzFpRofX5jhSuQcKul3eBNGBdyn42NM67V/
 zjfF+70PB6fJx68sj/muopo7SXZOauGJ3t1N9rMQlof8DLtLUbPRlH4ZoM9NDehIbt+rlOpOW9C
 dsDL5RmViw3ooTnov2GjEhnUUliYsARcrAUAB24TeGrhpNBImwll2p9c4zKLXP0+XdgsovMQ81h
 gnDUYqvzyHt0QocqRgh3Us6F5MGnEhLzfE2KE+qnOdVl8MaIKxq02VCRn5ft/z6JaHHUDrmVaFU
 F70rEyI1FJY23/oBd+Qofuo50d7b07H9dp9NQRUYCEhGQZFoCE+BJCqrxZCFjyzCtC3trTHor0s
 P1hkzcxbRdVw2yI0=
X-Received: by 2002:a05:600c:3583:b0:43c:ed61:2c26 with SMTP id
 5b1f17b1804b1-4406abb2407mr163305915e9.17.1745410179144; 
 Wed, 23 Apr 2025 05:09:39 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2d558sm24277415e9.17.2025.04.23.05.09.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Apr 2025 05:09:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/gpio/pl061: Declare pullups/pulldowns as 8-bit types
Date: Wed, 23 Apr 2025 14:09:37 +0200
Message-ID: <20250423120937.21490-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: cVB9uu+069W5

uint8_t is good enough to hold a property "between 0 and 0xff".

Define pullups/pulldowns properties using DEFINE_PROP_UINT8()
macro, remove unnecessary range checks in pl061_realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/gpio/pl061.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 60ce4a7f628..25b7ae3eccc 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -79,8 +79,8 @@ struct PL061State {
     qemu_irq out[N_GPIOS];
     const unsigned char *id;
     /* Properties, for non-Luminary PL061 */
-    uint32_t pullups;
-    uint32_t pulldowns;
+    uint8_t pullups;
+    uint8_t pulldowns;
 };
 
 static const VMStateDescription vmstate_pl061 = {
@@ -548,14 +548,6 @@ static void pl061_realize(DeviceState *dev, Error **errp)
 {
     PL061State *s = PL061(dev);
 
-    if (s->pullups > 0xff) {
-        error_setg(errp, "pullups property must be between 0 and 0xff");
-        return;
-    }
-    if (s->pulldowns > 0xff) {
-        error_setg(errp, "pulldowns property must be between 0 and 0xff");
-        return;
-    }
     if (s->pullups & s->pulldowns) {
         error_setg(errp, "no bit may be set both in pullups and pulldowns");
         return;
@@ -563,8 +555,8 @@ static void pl061_realize(DeviceState *dev, Error **errp)
 }
 
 static const Property pl061_props[] = {
-    DEFINE_PROP_UINT32("pullups", PL061State, pullups, 0xff),
-    DEFINE_PROP_UINT32("pulldowns", PL061State, pulldowns, 0x0),
+    DEFINE_PROP_UINT8("pullups", PL061State, pullups, 0xff),
+    DEFINE_PROP_UINT8("pulldowns", PL061State, pulldowns, 0x0),
 };
 
 static void pl061_class_init(ObjectClass *klass, void *data)
-- 
2.47.1

