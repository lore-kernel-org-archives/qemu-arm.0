Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp318362njj;
        Tue, 29 Oct 2024 08:11:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+s2j5SbNMBdCUJkZkoc11aYbX9D98z2Ks1rRvAtjx8Vov7DlyEeAPjvmfMphngDvhXYx7tB2TTzTahQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGDhY+IBSFLrAEIDMBLwgjlQ2Cr3D/SIBp6sU1uyX62iJzNJYZFMYh1tQykZElVAeQ+xhUm
X-Received: by 2002:a05:620a:400a:b0:79f:b3d:bed1 with SMTP id af79cd13be357-7b193f3ddb3mr1657449385a.49.1730214702521;
        Tue, 29 Oct 2024 08:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730214702; cv=none;
        d=google.com; s=arc-20240605;
        b=jLKox8wUqJfeJ0SiOb74ZF4+yhj18/lbj1z6BofhkD41UgHAibarqszBmQDpS/haAf
         vqM/GglMaXIRfOQ0STYCLwrE3v0yVvTYKphKKviW0yc62JqKUnf3EPE0/uKY3ZDZwaUK
         LnqiekUkwPfba/gOFFDmrNNVeOP0t7d+RxKYdcB3ZRIp2a3PzZz0xB31nCSn9y2lTACK
         EzIVsTDU7tuwNyctpng3y8fufjHZW31ypia7DQN/pzGxPN2BPTeptbAHUaUv6EMwC1VU
         wRUA+IexX6Yz0oXAaPFGqmFvd0nrXVoXe/bMk6n6B8lwi3HddaB9KC4N0SrkF1j/zGri
         ThPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QD7klZQEYAvteWerIuPHuaPLuFXzFsaVkFjCQXxT8EE=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=hqB7aJJEaF4gMhkk2a90XvCq46p3MGU8HJ5IejKg/5opy0pqux92C+Aqp7HPpUVZ6F
         /Mhw+6I1UQHPn4J25P7PrfcUCiEzv9Ts/BtfmkIHUGU3WP4jFI3Sl8A3387uJ3A0rxVf
         nbXjA4aZKqSf84iFjhY5nIkSrAMicV7xeN/KgpiColtS/CAj6tcWijsruH1HY91VFBNe
         ZZEs25S1vpIO3Hc7Ol2uZVNyf9vJRiQQYqF1kUrxYpsIYQlh7Dam/M4enGCTV22jIppH
         z/96DuDiLzfRuEP2+2ICcHVEyjq4k1GaNxz0FK+Jm1BgHl9xEKUFs2m7/Fqxsi1BRSOD
         DTAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gKZ5Pq4a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d269fccsi1098975385a.34.2024.10.29.08.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:11:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gKZ5Pq4a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5nsI-0000ul-SP; Tue, 29 Oct 2024 11:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5nrz-0000aL-Tn
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:10:56 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5nrw-0007fR-NF
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:10:55 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-539fbbadf83so7227771e87.0
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 08:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214651; x=1730819451; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QD7klZQEYAvteWerIuPHuaPLuFXzFsaVkFjCQXxT8EE=;
 b=gKZ5Pq4adhHJdcarha+byvmh1LtU3lepymo7Nr0ty4VlaotXVzq6d9fTndGM+3LkWg
 hP55BTqUS2sGMJKyxTpR1/fYOUMlFi5tKtcGA+ANGeBNR2o/8GvzfRCRupQfw+WxzmCB
 E2/IjXDVjOOl/CDBrAAn3tLJ8CvbcLIeml0NIUwHYVV64oShNJMYAKk36RcPW4fsgJWC
 OOuf7Ia7a+Lz5vkFM/PSBgYo1cZp4WIuPBrkXtHsqNZgpHH6kCzWwV5B+3yvDWyMR8uh
 WrUQLP9Hymbv9cleMdHF7/r7Omn7MKvqKbWqWpaTTpJP5OuQ1Qh0Oq2F/qL/KP/NaaXA
 Pu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214651; x=1730819451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QD7klZQEYAvteWerIuPHuaPLuFXzFsaVkFjCQXxT8EE=;
 b=VHAzxouZk8CHQwf0gBrUYiHWq6xO5E0GOJY5Bamp+X/0rmrkhAY55BK9D0DGhNcGxW
 /tvrCNxmlc/TixpNN78ctLF3J6hJAqzzhYZPMq3G8k9QRaFeEpfpd+QERsGIWnTcX1Db
 jme/2JTjWlrlxgKVbOyoRtlgorYnswe+9TFIuztfsLY5N9Tp/gpSjI7rj1wOry41Eh7G
 lCWYH9b9Cnd1rr7xoAibVW62b9CKShO0LpCmwOPkD0L2vWUfHqNZGtsu5k3LhlJjYFhR
 udlpVrvWFJAN0m/dghhlntA7sWT8785iMxKhzx5m3K27aNC79CTbHOKIEzjUa/KWn7NZ
 Ya4Q==
X-Gm-Message-State: AOJu0YznQw8ym87Hz3BEc16zaP1QLKf+26Cp4/LxFg9x4WYnv46zysuE
 HEkviFdwGKgAmq5TyinJ8VRZzzdfR8uhHl0/e22OkPs4sCtD3w0A2nqCGuAKwPwHg3emGrkJ1TP
 2
X-Received: by 2002:a05:6512:2304:b0:53a:aea:a9e1 with SMTP id
 2adb3069b0e04-53b34a1afd9mr6639430e87.54.1730214650697; 
 Tue, 29 Oct 2024 08:10:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360cc2esm146835865e9.44.2024.10.29.08.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 08:10:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PULL 02/18] docs/system/cpu-hotplug: Update example's
 socket-id/core-id
Date: Tue, 29 Oct 2024 15:10:32 +0000
Message-Id: <20241029151048.1047247-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029151048.1047247-1-peter.maydell@linaro.org>
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
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
X-TUID: P+1hrz5aemm3

The example of how to do vCPU hotplug and hot-unlpug in the
cpu-hotplug documentation no longer works, because the way we
allocate socket-id and core-id to CPUs by default has changed at some
point.  The output also no longer matches what current QEMU produces
in some more cosmetic ways.

Update the example to match current QEMU. The differences are:
 * the second CPU is now socket-id=0 core-id=1,
   not socket-id=1 core-id=0
 * the order of fields in QMP responses is now in alphabetical order
 * the "arch" member is no longer present in the query-cpus-fast
   output (it was removed in QEMU 6.0)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20241010131800.3210161-1-peter.maydell@linaro.org
Message-id: 20240819144303.37852-1-peter.maydell@linaro.org
---
 docs/system/cpu-hotplug.rst | 56 ++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/docs/system/cpu-hotplug.rst b/docs/system/cpu-hotplug.rst
index 015ce2b6ec3..cc50937c36c 100644
--- a/docs/system/cpu-hotplug.rst
+++ b/docs/system/cpu-hotplug.rst
@@ -33,23 +33,23 @@ vCPU hotplug
       {
           "return": [
               {
-                  "type": "IvyBridge-IBRS-x86_64-cpu",
-                  "vcpus-count": 1,
                   "props": {
-                      "socket-id": 1,
-                      "core-id": 0,
+                      "core-id": 1,
+                      "socket-id": 0,
                       "thread-id": 0
-                  }
+                  },
+                  "type": "IvyBridge-IBRS-x86_64-cpu",
+                  "vcpus-count": 1
               },
               {
+                  "props": {
+                      "core-id": 0,
+                      "socket-id": 0,
+                      "thread-id": 0
+                  },
                   "qom-path": "/machine/unattached/device[0]",
                   "type": "IvyBridge-IBRS-x86_64-cpu",
-                  "vcpus-count": 1,
-                  "props": {
-                      "socket-id": 0,
-                      "core-id": 0,
-                      "thread-id": 0
-                  }
+                  "vcpus-count": 1
               }
           ]
       }
@@ -58,18 +58,18 @@ vCPU hotplug
 (4) The ``query-hotpluggable-cpus`` command returns an object for CPUs
     that are present (containing a "qom-path" member) or which may be
     hot-plugged (no "qom-path" member).  From its output in step (3), we
-    can see that ``IvyBridge-IBRS-x86_64-cpu`` is present in socket 0,
-    while hot-plugging a CPU into socket 1 requires passing the listed
+    can see that ``IvyBridge-IBRS-x86_64-cpu`` is present in socket 0 core 0,
+    while hot-plugging a CPU into socket 0 core 1 requires passing the listed
     properties to QMP ``device_add``::
 
-      (QEMU) device_add id=cpu-2 driver=IvyBridge-IBRS-x86_64-cpu socket-id=1 core-id=0 thread-id=0
+      (QEMU) device_add id=cpu-2 driver=IvyBridge-IBRS-x86_64-cpu socket-id=0 core-id=1 thread-id=0
       {
           "execute": "device_add",
           "arguments": {
-              "socket-id": 1,
+              "core-id": 1,
               "driver": "IvyBridge-IBRS-x86_64-cpu",
               "id": "cpu-2",
-              "core-id": 0,
+              "socket-id": 0,
               "thread-id": 0
           }
       }
@@ -83,34 +83,32 @@ vCPU hotplug
 
       (QEMU) query-cpus-fast
       {
-          "execute": "query-cpus-fast",
           "arguments": {}
+          "execute": "query-cpus-fast",
       }
       {
           "return": [
               {
-                  "qom-path": "/machine/unattached/device[0]",
-                  "target": "x86_64",
-                  "thread-id": 11534,
                   "cpu-index": 0,
                   "props": {
-                      "socket-id": 0,
                       "core-id": 0,
+                      "socket-id": 0,
                       "thread-id": 0
                   },
-                  "arch": "x86"
+                  "qom-path": "/machine/unattached/device[0]",
+                  "target": "x86_64",
+                  "thread-id": 28957
               },
               {
-                  "qom-path": "/machine/peripheral/cpu-2",
-                  "target": "x86_64",
-                  "thread-id": 12106,
                   "cpu-index": 1,
                   "props": {
-                      "socket-id": 1,
-                      "core-id": 0,
+                      "core-id": 1,
+                      "socket-id": 0,
                       "thread-id": 0
                   },
-                  "arch": "x86"
+                  "qom-path": "/machine/peripheral/cpu-2",
+                  "target": "x86_64",
+                  "thread-id": 29095
               }
           ]
       }
@@ -123,10 +121,10 @@ From the 'qmp-shell', invoke the QMP ``device_del`` command::
 
       (QEMU) device_del id=cpu-2
       {
-          "execute": "device_del",
           "arguments": {
               "id": "cpu-2"
           }
+          "execute": "device_del",
       }
       {
           "return": {}
-- 
2.34.1

