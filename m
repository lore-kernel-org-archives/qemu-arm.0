Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED5EC5DF81
	for <qemu-arm@archiver.kernel.org>; Sun, 23 Aug 2026 15:09:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wy9o1-0007Tw-5G; Sun, 23 Aug 2026 11:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wy9nz-0007TM-Tb
 for qemu-arm@nongnu.org; Sun, 23 Aug 2026 11:08:15 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wy9ny-0008PA-7F
 for qemu-arm@nongnu.org; Sun, 23 Aug 2026 11:08:15 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-38d489b6b71so2799686a91.0
 for <qemu-arm@nongnu.org>; Sun, 23 Aug 2026 08:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787497693; x=1788102493; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YO5tPXTvZnsSWgxbIFedFGvu6p+yK1KpPNY8fcd24GM=;
 b=Ra1julEJqkjAhTvGN8D9zULhbLXkar1EcCoeULN6udBl/sxzpOv1T/O5/Jhax3/Sk1
 uXX4gZ0Jv4rAksmr0uFtoY/8uz6RSFS/jAS3PU6jQsTm3oT9f+e4tmpTsIYtH+uzzFEQ
 SMh3Jjy0tSnrHQP8avGgfJg2sBLNLy3AA0aGicrFkWjS69gj1sTkUElnmiJKegeBaAbx
 w5bRj9ma/rRcqK34jToF+nBoj+5nREYmrfd48iV7mZM7oHtAcZOeyJij7Ci95vuv9sTq
 0TxlA1p9U7AkLOUykW37Qsh5Eh2IlEp0nQO/BX0CzCjXVv18fjK70ASOMbnSJgH9585e
 8/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787497693; x=1788102493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YO5tPXTvZnsSWgxbIFedFGvu6p+yK1KpPNY8fcd24GM=;
 b=nMPKsCoCsXwY0ooIIO1lOSRVcY7USOUkPQax43032Vwfyj5Of1Z1k9JQCYHzcBHPga
 n66NH6zYkExv94Q+YI9s976xbKl9PTT4DcCX5CY1J6JUTQQrTffiEcum+QHytGxCoUpG
 Q78HMCpTPFLyQhrtzI5vcz+Xpuog9Hh01YevyCORarjMPqRW78BG+GwNDK/LY+Zs/yb0
 jPu/uLHcTFu19GGOU4dnOXBwGgh2A39sf8MzTt1n4fO9ZnzFLCq69bcWT9TdI+IyOXng
 yu/uYwY2GjgnpOxfIN/+45N3Z9vRbGW1HMimKfHn6whI7e+tYXiIhBABSYHa0fns7NN5
 nHCg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrdtPbOHmYCwxgcAwRs0r54cEcsRJ5IHTMhhJzhlDEkp6GysyC51wJtm5sI7dH3ibsGvTHNWZHAyw==@nongnu.org
X-Gm-Message-State: AFuF++m03tqIivZ42PCRu5DFWmINO7UG6WCEhB5VlFyaBPDy5iyJoIre
 vDleHLRzgzIehGjO/t5DCcbW58vpk296EYqo/Xa+sGQsZMwCsSbMyIuH
X-Gm-Gg: AR+sD13UoYik0RZT+acyEoa0cOUyz8jJNWs7NQT0Cq3IacmmeFCHZtz+WPNqR21Ut5V
 k+jGtf2VIh4japHgJOy3USFuzKDmM8K5gHzL/Oq4CBcop63Xo7rbzrC/T0La2ZjI9j5v1PU/xlj
 /PdEg/XzE9MKmO5lF9AOEfW/CwJJkteYBM64bL/toxf9b7qhyk+QEIgZm1hZ+nXe42aOZSJSU/x
 3xUkuDR+Pt6LKWxowPoEP+T6ba+tVbFyKa8jchGEgI3i6lnMnQIYDbuwXCnW1VCoJEScuO+jG36
 0oQjpoWhYi2L1pvg3pMoLC2v+6RJZYZ8yD02tAdqbdxJjWPfWvFFmGZX4YwxgdIv5bQ1Qipp2pU
 e5sleVllaWhptPX3o2pYAGjU4l4M2FCKxPLYoNw7NTnz+ybLne6dWePlKZNzFa13fUOYLoSIt56
 NezSgRm68IpRmaezhFuD8xIzqPCAe7pgw9VjQUaUFPf/E9llUedHvxe2gBH8UTe6SBXoWkW7YaJ
 tKeRxqtIB4vwm/OiSgMzR8s0kGLE/RHaWSLaA==
X-Received: by 2002:a17:90b:530c:b0:395:5404:95 with SMTP id
 98e67ed59e1d1-395c35516a0mr36575704a91.12.1787497692854; 
 Sun, 23 Aug 2026 08:08:12 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1418619d6ecsm16024511c88.14.2026.08.23.08.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 08:08:12 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Sunil V L <sunilvl@ventanamicro.com>,
 qemu-riscv@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
Subject: [PATCH 03/12] hw/arm/virt: use unique QOM name and target filter
Date: Sun, 23 Aug 2026 23:07:21 +0800
Message-ID: <20260823150731.896-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260823150731.896-1-luoyonggang@gmail.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102b.google.com
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

- Set TYPE_VIRT_MACHINE to MACHINE_TYPE_NAME("arm-virt") so ARM virt
  no longer collides with other virt-machine types in one process.
- Register TYPE_TARGET_SPECIFIC with is_available = target_base_arm on
  the abstract parent.
- Keep -machine virt via mc->alias on the latest versioned machine.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/arm/virt.c         | 2 ++
 include/hw/arm/virt.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index daba9af79f1..c2ace7706f1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -4161,6 +4161,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
+    TARGET_SPECIFIC_CLASS(oc)->is_available = target_base_arm;
     mc->init = machvirt_init;
     /* Start with max_cpus set to 512, which is the maximum supported by KVM.
      * The value may be reduced later when we have more information about the
@@ -4431,6 +4432,7 @@ static const TypeInfo virt_machine_info = {
     .instance_finalize = virt_instance_finalize,
     .interfaces = (const InterfaceInfo[]) {
          { TYPE_HOTPLUG_HANDLER },
+         { TYPE_TARGET_SPECIFIC },
          { }
     },
 };
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 22e66d1a113..383ee320948 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -215,7 +215,7 @@ struct VirtMachineState {
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
 
-#define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
+#define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("arm-virt")
 OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 
 void virt_acpi_setup(VirtMachineState *vms);
-- 
2.52.0.windows.1


