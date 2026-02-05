Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77ADECD99F
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 20:02:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vo5Ve-0006w9-0B; Thu, 05 Feb 2026 14:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5Vc-0006uc-92
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:59:24 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5VY-0003AJ-56
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:59:24 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4806dffc64cso11994915e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 11:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770321559; x=1770926359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4qhxa62Apjpg7nJHeZcMHBxhSVe14XdkTu3eXuhEWd0=;
 b=TaDkkcI2WCJC2FWtP87tphDk7qSXuMFxFQAKHQS6V8gPpkjFcFNhQ1veWrRh0EaAdL
 VnrSZsvBqgNO/gXiwJzRqnTZpgUFqzr+gMyPlNu0iKyElyrfrpv27VVnEYfUSnmPTi/J
 vSlW7Y04MqR5udsbHeDI33qKTnISMYYnddVXH4heq/RyuesPiKT3Z7y74GfgqcE1uupl
 sMUeUZHYvk7ezVq8ZSFz9lRYMY9EtMwKcvXIhB3zksFc+7VFRvf942zcN8/JKyAQnc3G
 AtBygJRW+R8vH4RaAd1MMexWeylH5xLcs8h7cqwXK1+civh9j8IijEtIksMFvujVowfo
 Niyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770321559; x=1770926359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4qhxa62Apjpg7nJHeZcMHBxhSVe14XdkTu3eXuhEWd0=;
 b=PiQOGWzId61oIAYyUU1PKKb+XUjsSbzenfXwsDB/7We/RlkRH5QJyY+ykWxUCyv+bI
 V566U4ZWMFAaU+BpzSGQdbhTuWGIjJqn9WW+JOu5HZI9rth5OOFwEENIqIyaEWhzxtOn
 187WAB9lHWbWNrUzRt7k6B8/kb5oeiwHydf0y0IPOanu4lbLxVdo0pB5ekOR/Gt2Uor8
 AecAbZ5Tne4Nd7h0BAZGOm3PA3UpbvyKhLfWYrpb/61kqxjq+R/yaGYdXv79ICBsof54
 kFmed8CE4AamDTtnV8e8hilEmMQ63ITSYrrDwfAHv/9YElFRIUL0z9JUwYwb/bUOXmu/
 zuoQ==
X-Gm-Message-State: AOJu0YzVbma/tvONxqIiJtQIKs2x+ipZMrW2NWVCJf76X6qp/ksQN7jK
 uToSaCQhHSZ5CYVr/gQLcQyZEiRgV5814B2N78N4pERENLN2MzqRlSLZ
X-Gm-Gg: AZuq6aIlrNlhzpPsBBw6iKnh59ICnatcxDRc6h4bBmC0HExcBYj13zz92sbQI+dLvQ7
 kNjFKr7nhjgUXT18HKSYv3HYZfY/Pgw+zysuAnd+mFoNW/L1WUcVdmvyAV97//BHeH4yrDqlG/8
 WvyOW9M8x5L+vigKRXfTcnFLEfgL2Zt++WA87SuRWDVK1cNR1XAF9256RqiYJqOLfS+TYD5BGzy
 eoArD3FOvBV7th9DtYwfRXZ6P9X/YFP/OA11prDkwuaLXXQ7wF+1qJ04fNs5MTj+6UYE/wECP3y
 vCdq5OwUqXeBkZZh52ty6BXlAX2yjol+uQy5NhLqw/qoLNL0HcehRRMPkXkuZyUo2weQREqsPzs
 5JcKPy0o8jYj1V3H0jANgj8ood4pAxSO3ScP5S2ncpGvmGiJgdScGNI1k2Y7LJ6Cbk2gyL+mQNz
 0ccZSyodQkR0SRApI1nz4=
X-Received: by 2002:a05:6000:24ca:b0:430:f97a:6f42 with SMTP id
 ffacd0b85a97d-4362968d49cmr546325f8f.54.1770321558502; 
 Thu, 05 Feb 2026 11:59:18 -0800 (PST)
Received: from thinkpad-t470s.. ([93.140.16.93])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-436297450b4sm514079f8f.34.2026.02.05.11.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 11:59:17 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 francisco.iglesias@amd.com, Ruslan_Ruslichenko@epam.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH 23/29] system: Introduce -sync-quantum command line option
Date: Thu,  5 Feb 2026 20:58:18 +0100
Message-ID: <20260205195824.2610192-24-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
References: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Add a new global option '-sync-quantum' to specify the maximum time
interval, in nanoseconds, between synchronizations with remote peers.

In co-simulation environments (such as QEMU coupled with a SystemC
simulator), time must be synchronized periodically to ensure functional
accuracy. The 'sync-quantum' defines the maximum amount of time QEMU
can simulate ahead of its remote peers before a mandatory synchronization
event (sync packet) occurs.

This value is stored in the global 'global_sync_quantum' variable and
serves as a default hint for device models and Remote Port instances
to manage their simulation time.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 include/system/system.h |  2 ++
 qemu-options.hx         | 11 +++++++++++
 system/vl.c             |  8 ++++++++
 3 files changed, 21 insertions(+)

diff --git a/include/system/system.h b/include/system/system.h
index 0cd012004d..f187544147 100644
--- a/include/system/system.h
+++ b/include/system/system.h
@@ -59,6 +59,8 @@ extern MlockState mlock_state;
 
 extern const char *machine_path;
 
+extern uint64_t global_sync_quantum;
+
 #define MAX_OPTION_ROMS 16
 typedef struct QEMUOptionRom {
     const char *name;
diff --git a/qemu-options.hx b/qemu-options.hx
index b7dd2a64f0..8ef0c57507 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -765,6 +765,17 @@ SRST
     Preallocate memory when using -mem-path.
 ERST
 
+DEF("sync-quantum", HAS_ARG, QEMU_OPTION_sync_quantum,
+    "-sync-quantum Max time between synchroniation, nanoseconds.\n",
+    QEMU_ARCH_ALL)
+SRST
+``-sync-quantum val``
+    Maximum time between synchronization <val>.
+    This value is used to drive periodic synchronization with remote port peers.
+    It is also used to set device models sync-quantum properties controlling
+    the maximum amount of ahead of time simulation that is prefered (only a hint).
+ERST
+
 DEF("machine-path", HAS_ARG, QEMU_OPTION_machine_path,
     "-machine-path DIR A directory in which to create machine nodes\n",
     QEMU_ARCH_ALL)
diff --git a/system/vl.c b/system/vl.c
index 4750b1cf69..467646c3ff 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -182,6 +182,7 @@ static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
 static BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
 static bool nographic = false;
 static int mem_prealloc; /* force preallocation of physical target memory */
+uint64_t global_sync_quantum;
 const char *machine_path;
 static const char *vga_model = NULL;
 static DisplayOptions dpy;
@@ -3129,6 +3130,13 @@ void qemu_init(int argc, char **argv)
             case QEMU_OPTION_mem_prealloc:
                 mem_prealloc = 1;
                 break;
+            case QEMU_OPTION_sync_quantum:
+                if (qemu_strtou64(optarg, &optarg, 10,
+                                  &global_sync_quantum)) {
+                    error_report("failed to parse sync_quantum");
+                    exit(1);
+                }
+                break;
             case QEMU_OPTION_machine_path:
                 machine_path = optarg;
                 break;
-- 
2.43.0


