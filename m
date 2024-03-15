Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp986917eju;
        Fri, 15 Mar 2024 06:06:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQRQJd3G6SZLcbS3JX4ug05R/YXVnp9VQjAf3/iJ/xmQji7gG7l2zlanLZz9RRg/LVv423EYE2Fa3RxSFYawfs6M/GWo6w
X-Google-Smtp-Source: AGHT+IGG40Q5FCi693D1wOfsGpr+XDv2j1iwYKDmH4/FQymmDeokt9kT8FBPlvHnvSv743gXugUL
X-Received: by 2002:a81:538a:0:b0:60a:e1f:3594 with SMTP id h132-20020a81538a000000b0060a0e1f3594mr5260813ywb.32.1710508002558;
        Fri, 15 Mar 2024 06:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508002; cv=none;
        d=google.com; s=arc-20160816;
        b=Y01FKMSsJbLfA0H+TSGHygBNwWkuE5iZpcJvBShsQbUzzdV+fcen2+8yQbKO9YinQn
         TrJSW4nUII7Nu1KtI4L2jrOiGHuoKlFU33h/OmcowHeQRRVhQ0dz8ug68co/hpK/aDqb
         BzoN9AZKZqJ+835gPvZE8qULz3m6/tOp0/YBHptJmHdiSWdD8gWyBRhHtz8csTgvV9OY
         u01FQuId1J2rPH9oOAv382QTwr+lYk8Ex0JnjGRCAWpr8x/5cLfN8qErQuvU9JeyS3iT
         BLBt5T1VcGVpFv/N+sHJkt/hCzw/x9ghm34Z2XwkRhuHjwChNbk68a/iabwRQ8aNWHDS
         M7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PkDt8GM6nQ3pKknMgJXpLHP0C4rfjUmHwI1ZOZTyda8=;
        fh=uGcXrD5210VkmqrQURzS9Txl0eldLxl/g55OxRC+1V0=;
        b=eGv7KCgsK2hN2W1N/x1Ah+ekzsEEabjA83M+utpjgpTKQFkpQdojlPaIOHULf/6F1t
         AH0UbE5OY5cWHyKiUgT2Jk0tw+QVUoI1jCK08utzVVgnOTCBwAxrSZT6zTNg8pdtxgpb
         F7sQd6Tcfvh2pScDQlzvRb9101omYx1qXDqBfIECHIDH6sv86/wl/Z4EfvVfjPHPEwzR
         7ALJy9uovp0sAfUb9HTQMjE6Lt58bnszhotRAlqok7bsAuHD05HgZDtjWUDoy+03dNO5
         bWeFsacn1RvjWzSka6ZmlxEV+let3UKJvHNJ05pkp7jOP4RvAe8TW38M+WN4+/AcyMyX
         rSUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Og4TRqs3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r22-20020a819a16000000b0060a50312ddesi1620835ywg.245.2024.03.15.06.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2024 06:06:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Og4TRqs3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rl7Fy-0002mK-T6; Fri, 15 Mar 2024 09:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7Fr-0002if-3A
 for qemu-devel@nongnu.org; Fri, 15 Mar 2024 09:05:48 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7Ff-0006FZ-4w
 for qemu-devel@nongnu.org; Fri, 15 Mar 2024 09:05:46 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1dbd32cff0bso15497015ad.0
 for <qemu-devel@nongnu.org>; Fri, 15 Mar 2024 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710507933; x=1711112733; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PkDt8GM6nQ3pKknMgJXpLHP0C4rfjUmHwI1ZOZTyda8=;
 b=Og4TRqs3p2gmWrajxrKotIosWBcuRAAIwMAfsiKStUU9192FIbh76gt+ebeLCHwa4B
 wAPvoUTQdO9ia1abqtXxdKKUYzSXJAFeXrQWavfdg/T4m2uQpJoQRTmSSZVToiESOdc1
 IfABs+zj7V+7Ev0Lz1k0sU2WSCLGO7vXP89OwLxft31XCtb0F2AhrQgS4xwYjQ1bPMLr
 KySfNc/YKJ4yNpqJqFBQwnkvdaB9NN2hr0GB2Alv8iUw7lrqRMiX7D2urt/Pe3MfSWVZ
 rFAd6PcerCiT7NWOknhlISXJDe5CYyoa2FUMMrsN2VqJmdXIM4PwXfAEBPjzaJ3YmKld
 vK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710507933; x=1711112733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PkDt8GM6nQ3pKknMgJXpLHP0C4rfjUmHwI1ZOZTyda8=;
 b=DCylVzbOPI9D152Z4qeplUdowmfupAszBL7SYiP14ar4LZBFQenW2GnU6uskdkRSKE
 5dvPgoKU5ZQyNWQyC0dcgrj0nv2k7MpKoB4y02bC1FjG+kbkaPp1qnTbFazWSd/+DoMj
 3kV9YQE0lHpUUQo0HWWPq1ZmSbr/E1J1Rq3PutTI0V6oxXqzwOdqzvXIQiY+/lT2DVP5
 0q1K1m9pRkfCwmwrBVGCgJYexxt3MGBBWKEc+N/EojUYFcwesM31oAzZXJFrviiAclrE
 +jQcRY6rKiRLend5TsUO0h381f/lJxMHbPKHS6tiGnJXYSpyB0CSyl9fDm8Fa4YE2q53
 sOwA==
X-Gm-Message-State: AOJu0YwFHyAZF8Rd6g2U6OICekBs1Ie309QVEH5gtKrjeDMFle8XGQzs
 ACrEywDQWW86QL9/VisgzWu8moMhrWV8rbmxm7fF+sRT8THT17Hqyv8ZXHVQJqwC7iQu2aH7Biv
 J
X-Received: by 2002:a17:902:c401:b0:1dd:7de5:7ac4 with SMTP id
 k1-20020a170902c40100b001dd7de57ac4mr6697522plk.38.1710507932709; 
 Fri, 15 Mar 2024 06:05:32 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.184.12])
 by smtp.gmail.com with ESMTPSA id
 lh12-20020a170903290c00b001defd3e64d6sm182474plb.22.2024.03.15.06.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 06:05:32 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Haibo1 Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 01/12] roms/edk2-build.py: Add --module support
Date: Fri, 15 Mar 2024 18:35:08 +0530
Message-Id: <20240315130519.2378765-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240315130519.2378765-1-sunilvl@ventanamicro.com>
References: <20240315130519.2378765-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WpiA7ecQWDdn

UefiTestToolsPkg which should use edk2-build.py needs --module parameter
support. Add this optional parameter handling.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 roms/edk2-build.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/roms/edk2-build.py b/roms/edk2-build.py
index e564765aaa..3bfe200929 100755
--- a/roms/edk2-build.py
+++ b/roms/edk2-build.py
@@ -192,6 +192,9 @@ def build_one(cfg, build, jobs = None, silent = False, nologs = False):
         cmdline += [ '-n', jobs ]
     for arch in b['arch'].split():
         cmdline += [ '-a', arch ]
+    if 'module' in b:
+        for module in b['module'].split():
+            cmdline += [ '-m', module ]
     if 'opts' in b:
         for name in b['opts'].split():
             section = 'opts.' + name
-- 
2.40.1

