Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7230E9A048
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:37:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt57K-0000Da-NC; Thu, 19 Feb 2026 09:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57H-0000B4-LP
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:34:55 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57G-0002zZ-7O
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:34:55 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4376acce52eso651986f8f.1
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771511692; x=1772116492; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hUapFwKk1B7hoKjOMc6Aky/R8hTLzdKuAY1fsScAA0A=;
 b=IIsmyRc0FkDAmC1Aco6/30zgfcd3y/rHlYyEUQbHJe6PSow7J4axVXKqEt/O79yOsX
 LK5DF+sU41a3TIq/wYlUTGsXLeKMIEDbq25H3+QvW4cDGp60rKwEaWJw7nMfeTt7D11e
 4AQ9gV7dnNWDM2mHkNuK/wgdFQJEKghBtNWUVvj3gRisXzuQqgY+WPsfTpZGKyYJel88
 AU24/4GNypwO9djY+WkTG4yMY9gcRynaNtPHDJJyBz8oX3/BQa0dtNGpUgrvHz8CU1hj
 H6E7ZD5B6rFPj50IhJo9+rtxxr9DB5bOs/PuvXZvXFmZ8EHCQawBWJeDmeVTHHB0xAPV
 elFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771511692; x=1772116492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hUapFwKk1B7hoKjOMc6Aky/R8hTLzdKuAY1fsScAA0A=;
 b=NtkQ2RhWqTSK/cWntljIbad46smPo2O9WkvoHiW/jh5JdvNaRXnte/BX3/RlNcA6ZP
 kSgedUGV/Dn6hKd3HAvxkXwPPEocOLvbRNs8R4rk7yR01DEMOHWq+ygVwf2M4kAzrQIQ
 2aeQKkTFGA/NcXnZxklZZu5N2mcLGMwc0tTxgckpuMeDCdQEi+zeMT4I/bGQpzB0/IhA
 Txe7KFO4A9v96elhNL7BfoY/om6chSOM/h7tJi5fuPeYYuQD9uP5B4Y2OkrtBybTe6vd
 5jvc2dVaCPipUP38PHKKi5uYtTVvuu2KjQw8MWYMhE3M59wm8FP00mJBh5rqC9JYO6D+
 6zkg==
X-Gm-Message-State: AOJu0Yx8A335dEKK2xYWiBB7Pipps13O/O+Q2Lc6R+nqPP9ojj8cPbG9
 4rsFnNSxT/8RA65MvdeJpnJqs3cyBDAJBuh3JHpQO6/Pvf+kS7IWidfkNG6A1vxL
X-Gm-Gg: AZuq6aJgk1Jy7/mM4OB67CNziaBNh1iJCcLpEAk8CDHRqDO0/kXoNYNTIM3ojPWe5io
 I70ALqF1PScXpqCCYq4JQ6XmMMddlulexCN3C14h8mkhf5y7BTkpgHdEZsJCanXt4cCps+M4OOM
 KvnVEOffV0nqAi2gFnorukPjDOqWL1N+tUVFctRq41FQme0FSPQV7bzxoD5SnwCS39t63lmOJHG
 oCgScZMX5gXtrpZTrSCRrDu898EW7RF0x6ie9du5KBBLnmhPnhSMlSjGer3z3EQaod7O4AnZOlz
 RXCH8JggqK4pSwy2Wy3LUrNGiMgvmAVsl72ZT8kBW5qFhNB17dwN7QeimUS0vvpuqn973XvqrcY
 iXN+9s+qv6b9LBemKdt5AhfSQSLpP9/c7+lfTt+c1BOuvlGLsisgL4aFuOT/92hrOwK+0xuCUgy
 R+Qv4la4s2RwdBKsYLsRKRG/MIoJA9iR9IW8AsOnn0ByyLZfwmhMq8s0kLJOhnNywG9NVG
X-Received: by 2002:a05:6000:1447:b0:436:14d2:5414 with SMTP id
 ffacd0b85a97d-43958e52a6dmr8967925f8f.55.1771511692230; 
 Thu, 19 Feb 2026 06:34:52 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm52022770f8f.24.2026.02.19.06.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:34:51 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v2 11/33] hw/core/fdt_generic_util: actually realize device
Date: Thu, 19 Feb 2026 15:33:10 +0100
Message-ID: <20260219143332.3316679-12-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Actually realize objects with TYPE_DEVICE after main
allocations done and properties set for qdev.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic_util.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
index 2a3862b9ac..43fa862f31 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -681,6 +681,30 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
         fdt_init_qdev_scalar_prop(OBJECT(dev), p, fdti, node_path, prop);
     }
 
+    if (object_dynamic_cast(dev, TYPE_DEVICE)) {
+        DeviceClass *dc = DEVICE_GET_CLASS(dev);
+        const char *short_name = strrchr(node_path, '/') + 1;
+
+        /* Regular TYPE_DEVICE houskeeping */
+        DB_PRINT_NP(0, "Short naming node: %s\n", short_name);
+        (DEVICE(dev))->id = g_strdup(short_name);
+
+        if (object_dynamic_cast(dev, TYPE_CPU_CLUSTER)) {
+            /*
+             * CPU clusters must be realized at the end to make sure all child
+             * CPUs are parented.
+             */
+            fdt_init_register_user_cpu_cluster(fdti, OBJECT(dev));
+        } else {
+            object_property_set_bool(OBJECT(dev), "realized", true,
+                                     &error_fatal);
+            if (dc->legacy_reset) {
+                qemu_register_reset((void (*)(void *))dc->legacy_reset,
+                                    dev);
+            }
+        }
+    }
+
     g_free(dev_type);
     g_free(props);
 
-- 
2.43.0


