Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C963FCA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:15:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu55f-00073x-0a; Thu, 04 Sep 2025 04:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54d-0006Kr-Sb
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:04 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54K-00042M-7t
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:03 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61e3b74672cso1628479a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973502; x=1757578302; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zFtQwjlDYtTGsZLq+AG4NuX/K0Bc+UPJFpp7UfLUFM=;
 b=cuNVye+6+dBJP4eXBaJazhvrJrRoaj4b2NHW6sWh+KUQ5Wylq2Uh2E11NqYBGmkTkC
 GUhhU2mvy9M9XzAJ0p4XKENa13jucQjbrCPhrDQHFqkH31jWjUQb+KdYCJgl1PE9rVTo
 hFOFcuBGfWxKNQXPGWZKly1a7+evUfi7v5RJwjHS35WaQsKsAJkjwXU+8UeUdCos2mlv
 3bxupHhKHFZukjUU/R82tMn6HPwWV6K8krMrur3HjAdTVQNsHWQmwGO0YoISzZLQC24k
 hkBbRL8Vr0EXawbSDTQu5j3n40glF88Qmf+aqPXyX3tMFRruekr9Ygx124zAiHmKo8YQ
 yPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973502; x=1757578302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4zFtQwjlDYtTGsZLq+AG4NuX/K0Bc+UPJFpp7UfLUFM=;
 b=nBixCWJ51Rag2Sfo/d3ecd7XOamQ9lpMYdd4iMF2cniXaY0WZqN5Pi+NmhAoxsGQiI
 yAkfJoSKjqYfvhuVEskUFKpKLTy/flN8Rv9LgUD83Fd+sYwMYolqxsolecsZzBYDNpCl
 QFqIg3YMg3+Mi5B3QykrX7S2uFX2BmjD13ZVJqOviBy/Ycvb7MU6AnDSEnMTbA41ktz9
 A520xo2mudNa3BpiklL6WQg40jKd9ZDJ2QQaDOZyyKtBBOtL6Q+j2ELAW1Dz87pkxQql
 6ebrWcQQ4eufNuYQjRt2b+/2pnfr5P0kH/nP/l+L+4rwI/ueGKnEsDUYEBmnjbVwRIRt
 tBAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEfuuV9+egg22i1n3Xs7nBhPczahYsQcrS/eu8B79JnT4/BkN/9fzozSAcnwLqaT+TEMNbdVS37A==@nongnu.org
X-Gm-Message-State: AOJu0YyrrZGcC15sa6iBn8rcgDsTx5xf8JVdZbvh7QvrlS9y+J2blW9L
 uedfA2PTX6VcM6FhYugNuB001lX7Zn76z1RiMdTQhyRPB6hgotA8TcS2V/FLloEHU9A=
X-Gm-Gg: ASbGnct2I50Dg74Jggv0oM38NrJM8CKx5zlhpF0fh3gByGi8OwXM7pOJOTQVujLODZQ
 062mtbq9/CVUhM/JlwQ3YLEFCt4Or3ybtwiGi0twYf4Lbj6zfHyQnfX+mIX/BVD2K42Z5opV61X
 Q+EGdRFps48CAmqVX/Z49F1VwTEd0QsLuiYMyXQIH1VeSQD+wlEMhZGBo5g6UMgNdg6SG99jsgC
 shfkIAjlKb8xMBP+YEkv24s9XChxNBFOu0A0kTM+KFBwwUv4P7Ii8eWmJwUReL8fha70cpiLHDv
 yPsAWghZFfRamtiNyLvSfPrL1tTrwjudcZ1zRDL6IOPLare3jl9q4fRMqiEMxqHcX5lo3OGTuHZ
 9AHCk0FYZvjpSl4U9hEas01Ix80KTyJKe/a+5RLv6aFuB
X-Google-Smtp-Source: AGHT+IEAGMupQGzmQ7Dtgei91E1xVsJ0XEkW1FCuMtH0BwB9pNEHdoQerst6G0QZL4yGacu/nq1pzA==
X-Received: by 2002:a50:a686:0:b0:61c:b23f:417e with SMTP id
 4fb4d7f45d1cf-61d22dc77c9mr12751905a12.2.1756973501906; 
 Thu, 04 Sep 2025 01:11:41 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7a10sm14089075a12.5.2025.09.04.01.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:37 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 89E265F9F9;
 Thu, 04 Sep 2025 09:11:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Helge Deller <deller@gmx.de>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-rust@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 qemu-riscv@nongnu.org, Thanos Makatos <thanos.makatos@nutanix.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Riku Voipio <riku.voipio@iki.fi>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, devel@lists.libvirt.org,
 Mads Ynddal <mads@ynddal.dk>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Xu <peterx@redhat.com>, Jason Herne <jjherne@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>
Subject: [PATCH v2 012/281] tests/functional: Use more fine-grained locking
 when looking for free ports
Date: Thu,  4 Sep 2025 09:06:46 +0100
Message-ID: <20250904081128.1942269-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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

From: Thomas Huth <thuth@redhat.com>

Currently, we have one lock that is held while a test is looking for
free ports. However, we are also using different ranges for looking
for free ports nowadays (PORTS_START is based on the PID of the process),
so instead of using only one lock, we should rather use a lock per
range instead. This should help to allow running more tests in parallel.

While we're at it, also create the lock files without executable bit
(mode is 0o777 by default).

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20250821094735.804210-1-thuth@redhat.com>
---
 tests/functional/qemu_test/ports.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/functional/qemu_test/ports.py b/tests/functional/qemu_test/ports.py
index 631b77abf6b..81174a61532 100644
--- a/tests/functional/qemu_test/ports.py
+++ b/tests/functional/qemu_test/ports.py
@@ -23,8 +23,9 @@ class Ports():
     PORTS_END = PORTS_START + PORTS_RANGE_SIZE
 
     def __enter__(self):
-        lock_file = os.path.join(BUILD_DIR, "tests", "functional", "port_lock")
-        self.lock_fh = os.open(lock_file, os.O_CREAT)
+        lock_file = os.path.join(BUILD_DIR, "tests", "functional",
+                                 f".port_lock.{self.PORTS_START}")
+        self.lock_fh = os.open(lock_file, os.O_CREAT, mode=0o666)
         fcntl.flock(self.lock_fh, fcntl.LOCK_EX)
         return self
 
-- 
2.47.2


