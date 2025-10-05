Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6A8CAC5BB
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Oct 2025 19:20:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5UFE-0001aJ-P2; Sun, 05 Oct 2025 15:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UEf-0008H9-Rd
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:17:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UEa-0006VU-Mb
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759691847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3aFxoIeUx803jBt31fbg+H6tlPcEQbGoaOIOlfDZlQk=;
 b=B6BbcwL7grvaSun6YhaK5P8O+29pas86O+Dcl7/RolmBpin6VhLg4STwLFIROcfDgLR1BD
 nv3GwEWNJ/DcjFhaiPSqdDY2O7ftP4NM2/W00RKK2VvxxZ3jR7MrtORsYxxVmYBuymfwPA
 89gYksYzfCPkEz3F1snTcIE6ykOJxY8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-h868qmj8OIOxUbw6IiV52g-1; Sun, 05 Oct 2025 15:17:26 -0400
X-MC-Unique: h868qmj8OIOxUbw6IiV52g-1
X-Mimecast-MFC-AGG-ID: h868qmj8OIOxUbw6IiV52g_1759691845
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3e997eb7232so1744094f8f.3
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 12:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759691845; x=1760296645;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3aFxoIeUx803jBt31fbg+H6tlPcEQbGoaOIOlfDZlQk=;
 b=Ge1fsEfQrr17sGsXBULTk6xurXajf2sdbLevlkNhNkztcGJ8OAXuTkqPBJYVILnE8j
 rTjH5eJ63PfjSdasXzmokwBQ8XSHS1b2FbSkrjPpLTmSEJClIjvW9qeAPzrbjQ+PdxkM
 xNykOcLG8cVsnDuky/JADaU2d017vMh/fWMLiFMYUy3mUhWM+BurOB5W2lXHUC/RGw/A
 ZISQVLBXslf3k5dKrdunrXh1dPU8suApjw3eP1wTEuwJASshmDZDiakaRJmtcpaW2wVn
 uollbtYYGxS3G96Ote06jrb0tKuNwAITzhIWLiywCQEJzk2x+21U5JQytsnk5ayGOH81
 770w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqIYuWzEPKNpTCe0m4IEJZWG7QORv2MIXzgJjtouVo4MyGQvt/ulHHKwM+TniZGlTxn0e8BT1A5g==@nongnu.org
X-Gm-Message-State: AOJu0Yx68e8q1iTOpSgbZFMM9q9EQ3bGpMtTyid1FEUmo87lpqTuZIbU
 jcQH8BEL240+lJLaXpmVmcDZdW0tT5njumm/ReZNnJX5cXWwwSXZX/cE1jlDcLx87qpfBeA9nUC
 6/m/qNFSelzIUg+omxmKyP8hjEdXwFREO8wyzUQsWvFAAvPScyzEraQ==
X-Gm-Gg: ASbGncv6IZzhAQx1N62hQ0WLTdOSnjHuGFv0yeZ1VrfWPTnoUxu5WULLS+Y5QZjaZdd
 v6Q/bQDXpNfEsqjaqDm7rW/QcAfgMsVXUPZiD5AkBDScSi1HM7s44sgs3svia/k1x1DigKjdcsX
 p3u4KyCZWrSw63uX0tCuq7IwC1YZgSOJLC3jvGZe+55CHTYqTiqZLT9ZSyE2iZgSEZY3q7LS0WS
 897qpicpeYA6MK6cLldxemzA72w7gabzknN9CMg0G0dmuTh5nwKYtf7dRZyEUdO33Zj8Wj8HlT7
 V0UtKaqlnvVBeO2YXSipDSUork0t7uoeG3vmWw4=
X-Received: by 2002:a05:600c:8b45:b0:46e:3dc2:ebac with SMTP id
 5b1f17b1804b1-46e71168aa1mr67453935e9.27.1759691844875; 
 Sun, 05 Oct 2025 12:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtSfa6Jgje5/BQ9bLxLZ5mbImqTOeqLt2mPARjKRMASsh58YgMsenlfLpaeNGUrpDk1crB/g==
X-Received: by 2002:a05:600c:8b45:b0:46e:3dc2:ebac with SMTP id
 5b1f17b1804b1-46e71168aa1mr67453745e9.27.1759691844328; 
 Sun, 05 Oct 2025 12:17:24 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1518:6900:b69a:73e1:9698:9cd3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6b77sm17443982f8f.6.2025.10.05.12.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 12:17:23 -0700 (PDT)
Date: Sun, 5 Oct 2025 15:17:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PULL 36/75] smbios: cap DIMM size to 2Tb as workaround for broken
 Windows
Message-ID: <fa82ce2ddee8208c83a5a10bf3ab7348ad3d334a.1759691708.git.mst@redhat.com>
References: <cover.1759691708.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1759691708.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z2XCAA_V-nmaFJQzDnu_sPhcNw3w0cmfUPZJ6fHyzEk_1759691845
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.43,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Igor Mammedov <imammedo@redhat.com>

With current limit set to match max spec size (2PTb),
Windows fails to parse type 17 records when DIMM size reaches 4Tb+.
Failure happens in GetPhysicallyInstalledSystemMemory() function,
and fails "Check SMBIOS System Memory Tables" SVVP test.
Though not fatal, it might cause issues for userspace apps,
something like [1].

Lets cap default DIMM size to 2Tb for now, until MS fixes it.

1) https://issues.redhat.com/browse/RHEL-81999?focusedId=27731200&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-27731200

PS: It's obvious 32 int overflow math somewhere in Windows,
    MS admitted that it's Windows bug and in a process of fixing it.
    However it's unclear if W10 and earlier would get the fix.
    So however I dislike changing defaults, we heed to work around
    the issue (it looks like QEMU regression while not being it).
    Hopefully 2Tb/DIMM split will last longer until VM memory size
    will become large enough to cause to many type 17 records issue
    again.
PPS:
    Alternatively, instead of messing with defaults, we can create
    a dedicated knob to ask for desired DIMM size cap explicitly
    on CLI. That will let users to enable workaround when they
    hit this corner case. Downside is that knob has to be propagated
    up all mgmt stack, which might be not desirable.
PPPS:
    Yet alternatively, users can configure initial RAM to be less
    than 4Tb and all additional RAM add as DIMMs on QEMU CLI.
    (however it's the job to be done by mgmt which could know
    Windows version and total amount of RAM)

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Fixes: 62f182c97b ("smbios: make memory device size configurable per Machine")
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20250901084915.2607632-1-imammedo@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt.c     | 1 +
 hw/core/machine.c | 5 ++++-
 hw/i386/pc_piix.c | 1 +
 hw/i386/pc_q35.c  | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aad557be1a..175023897a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3537,6 +3537,7 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 2)
 static void virt_machine_10_1_options(MachineClass *mc)
 {
     virt_machine_10_2_options(mc);
+    mc->smbios_memory_device_size = 2047 * TiB;
     compat_props_add(mc->compat_props, hw_compat_10_1, hw_compat_10_1_len);
 }
 DEFINE_VIRT_MACHINE(10, 1)
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 7b7a381b0a..681adbb7ac 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1118,8 +1118,11 @@ static void machine_class_init(ObjectClass *oc, const void *data)
      * SMBIOS 3.1.0 7.18.5 Memory Device — Extended Size
      * use max possible value that could be encoded into
      * 'Extended Size' field (2047Tb).
+     *
+     * Unfortunately (current) Windows Server 2025 and earlier do not handle
+     * 4Tb+ DIMM size.
      */
-    mc->smbios_memory_device_size = 2047 * TiB;
+    mc->smbios_memory_device_size = 2 * TiB;
 
     /* numa node memory size aligned on 8MB by default.
      * On Linux, each node's border has to be 8MB aligned
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index caf8bab68e..7b3611e973 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -448,6 +448,7 @@ DEFINE_I440FX_MACHINE_AS_LATEST(10, 2);
 static void pc_i440fx_machine_10_1_options(MachineClass *m)
 {
     pc_i440fx_machine_10_2_options(m);
+    m->smbios_memory_device_size = 2047 * TiB;
     compat_props_add(m->compat_props, hw_compat_10_1, hw_compat_10_1_len);
     compat_props_add(m->compat_props, pc_compat_10_1, pc_compat_10_1_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index e89951285e..6015e639d7 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -384,6 +384,7 @@ DEFINE_Q35_MACHINE_AS_LATEST(10, 2);
 static void pc_q35_machine_10_1_options(MachineClass *m)
 {
     pc_q35_machine_10_2_options(m);
+    m->smbios_memory_device_size = 2047 * TiB;
     compat_props_add(m->compat_props, hw_compat_10_1, hw_compat_10_1_len);
     compat_props_add(m->compat_props, pc_compat_10_1, pc_compat_10_1_len);
 }
-- 
MST


