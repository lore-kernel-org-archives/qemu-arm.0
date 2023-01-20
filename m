Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1087910ejc;
        Fri, 20 Jan 2023 05:44:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuMGGrVxTZy/1P8HClw8xN1zcPPiUzemwNCYcQV7ZXwKsh6PpiKLVVb060ZkrvLKPfDUf9S
X-Received: by 2002:a05:6214:3311:b0:534:ba17:9e71 with SMTP id mo17-20020a056214331100b00534ba179e71mr24616006qvb.9.1674222243286;
        Fri, 20 Jan 2023 05:44:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674222243; cv=none;
        d=google.com; s=arc-20160816;
        b=Ul8rZ8/LuXrMmggNqoWMFuuJq1/53W90yMZcQFUbiguKY1B2TXvoA0N8fVRuEOT+Fi
         DtKRdCAQVs0xHzyNII8G0tyclnsqplq9CpFuIkyNYzuNGD5y84M3d2hXQQs6S4hYMCZJ
         uVPObVHMItYnNMRRqwfVKF6B7v9Xgib0IptVTkxwelOZnwwm/AFVB3FwWSEM3tkvWw9y
         ldQEXm19Ww/gZWe9Yco5hX9mEnKSVAf5X75nrHmUZ+gBgmlPZ7eiG/l002uTtwKLpf6O
         PPPt8Zz+N+do1f95XT2C+mNlJ7gxO6RaZWiJ4FbwgJll8gwSw0KXJVYGx+JtXRwNYIO6
         T6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UNHd8/T89f0TRHea37adZgQvQ+f5+hWer7661K7hDXI=;
        b=Zizx63YlePKZRPJ6JDVs/hkEfN8NdUyFE7fp8p8rhyq/CVdEaYpFkz97icxUWV10j2
         SMy7blIUSTGAQouoSJGbKrKtqvYrR+Hm3ELvbvkloUp5RLlNzlLNW3CU+vLteyBBK+wy
         Gr+MFNrqLt2QM7GpU9p+pRKwn16GzY3+Mj1QocKhHdFEdubJ2Onp/AOoIvLJ4Q9t3T3H
         UrPEvvkUEsOQX4X5ATc0PzRwmF5FHzDwE9mdGkLWpNCsBAan+/0U5wmwAD6tbU4zoncE
         uJ72iDLtEGfzVuugfmg9dFkBnN3MuvoiVTqR1hBZDd7q+Z0Q2Ur0VHt4TGbuQK09cPdJ
         x8LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qHk0TYqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc5-20020a056214230500b004b1ca99019asi25140235qvb.333.2023.01.20.05.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 05:44:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qHk0TYqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIrfx-00013U-RN; Fri, 20 Jan 2023 08:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIrfw-000137-Aw
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 08:43:24 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIrfu-0007Ww-P3
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 08:43:24 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so5879950wma.1
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 05:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNHd8/T89f0TRHea37adZgQvQ+f5+hWer7661K7hDXI=;
 b=qHk0TYqXYGW8iALXaE11M3MlMIxhkCjmG4yJZismQtXQG97rzmhRqZ5r0GoMLNgsZ7
 CN1qJ8bGYYWss5i1LGDomJnR+6JsKMZkqPzHOSqeAtLFWcLmHZA7akjkYXE4sqWhCqwt
 IdQ5sCwaQgWNmhy4XkOLQlXbU2mMvKczMjhJasZfEjXQhivjGnnALEgMqZZPrQD84rLD
 QBao2M9nkpE5JhiLb/vFWzUddlmrJ2/gN5Blhn9fMGz4SbOUh+NKA2hAVXREQujAiH3m
 bJx4SII0RkieQnjQAFpZHUOWB3zdMJ8lU78T78YQMUpCj82hSpkjIGrBIKVP6X6bWp7y
 Bs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UNHd8/T89f0TRHea37adZgQvQ+f5+hWer7661K7hDXI=;
 b=OFCpKNNEsUTduwBZV4F4DPd4N3Vmc3xfZDqIsCDtK+e7jb6BZOeh6pU7sNF+t1fu7k
 BbM7D6qmXFtZT7TKLGrps9iBV5lHam5B9MRMPdTXGOM52SC0G+ow40/cF4wyDYv30krW
 /iyIF2yXXYo6jN7pekRX2DzcfJsQmShIIHujzi5GxAJ3NdS7XK2ZY246lyi0Z+9ZdCDX
 cTzIgas2AqkhPLlEOwE44PjYmpbRabdy51W4A53Km2uVXo2MfsitRKXC+NwJa9dWdZnX
 08CHB2p7TUZsRHYNRkQ0T2pD85x0mC9na9GIp4heXi5MhyvidKZIFyFdcHk6GgypPnoV
 Whug==
X-Gm-Message-State: AFqh2kovxSTXtUrQv5MIHDndGXZuufHdDrZKZCs7+utVHc5RiVPFOJ1Z
 ZV53CUkeSYq840PkqYAlLkbq/Q==
X-Received: by 2002:a05:600c:1712:b0:3d9:a145:91a with SMTP id
 c18-20020a05600c171200b003d9a145091amr14158241wmn.28.1674222201108; 
 Fri, 20 Jan 2023 05:43:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c2cad00b003cfa622a18asm2691725wmc.3.2023.01.20.05.43.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 05:43:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Subject: [PATCH v2 1/2] tests/avocado: Factor file_truncate() helper out
Date: Fri, 20 Jan 2023 14:43:13 +0100
Message-Id: <20230120134314.81956-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120134314.81956-1-philmd@linaro.org>
References: <20230120134314.81956-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: JSWbsVA5+NEm

Factor file_truncate() helper out of image_pow2ceil_expand()
for reuse.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/boot_linux_console.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 8c1d981586..8a598be966 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -30,15 +30,16 @@
 def pow2ceil(x):
     return 1 if x == 0 else 2**(x - 1).bit_length()
 
+def file_truncate(path, size):
+    if size != os.path.getsize(path):
+        with open(path, 'ab+') as fd:
+            fd.truncate(size)
+
 """
 Expand file size to next power of 2
 """
-def image_pow2ceil_expand(path):
-        size = os.path.getsize(path)
-        size_aligned = pow2ceil(size)
-        if size != size_aligned:
-            with open(path, 'ab+') as fd:
-                fd.truncate(size_aligned)
+def image_pow2ceil_expand(path, size):
+    file_truncate(path, pow2ceil(size))
 
 class LinuxKernelTest(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
-- 
2.38.1

