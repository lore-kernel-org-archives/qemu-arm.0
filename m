Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp541250njj;
        Tue, 29 Oct 2024 14:01:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWt6Nek1gaZ8J6PytHQ/Pb6tVLVBJAbwbaJ88kbvLQOUGBoYA39BkNonXa4+c+NS3Ry48Udyp8DqLtLzg==@linaro.org
X-Google-Smtp-Source: AGHT+IFJJXk28szESakYsKOsA9cyFUt+DbPBi7bvNiJMr9fBf1Q9enyR/OxXSO3xh6HfMzpjTto3
X-Received: by 2002:a05:6102:ccc:b0:4a4:97d1:aea0 with SMTP id ada2fe7eead31-4a8cfb5a0f7mr10691538137.11.1730235708622;
        Tue, 29 Oct 2024 14:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730235708; cv=none;
        d=google.com; s=arc-20240605;
        b=bVAPix+qu+I9k7kMftHkpk9jwafuSZO7uKjKiv+3dDMe+gxnjV4jm0V2GAECh+t4zR
         V7BTjPQWvrZqSvzOT/wiPgj1wT6ivfpNeW0xF01neCznLpPkByGdcPHF2ytHTdigr48X
         +k+k4/C0sa1tYmbw6e0GmKrYsEkOenvmhVCxivoqlhBPG++qtYmaRhTqrQ1yXzotAXhJ
         0GBVnuGDYSBvDDT95Dx9/eE+V/cnLdL8L697cLnAoiCwGyimBcOOKi+ikREh4itDKtN/
         zi5THNxrAu4UdmDhZyyjYSuEsJ7qaY6I8F2sp3xU/14UwoCYlUU5x0vv1YHTmz6JEgJX
         uPYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VbXMc698zLmSQlXfITKK2kLCf84tzdIkZNkqr/UZe5I=;
        fh=Cz9mr7WFxiYKJBC2Bqqst74qbX4rU+wpTENwEkbsku8=;
        b=RO6SGpcs1Gu53o2S1Hha2Q/TopbW1OiLCW5yGeBDusWH934NjdeUlieIMHsDkKdo8b
         TF6oJY+gevacFecLTwngOQDHE39SfOpArUeiQcEoDv2hz7o5UAtylWexSYJyfnpSXQAe
         1JHHcOZq2JC6xxZnnixhzP18/+mpPZX3H8FzGbkHNvFWtMjBoUug0UFAvb4GQgyWM3oh
         CPy/fG9+DfmGxO44R6UwxPbvp5CraPGe+KLvdWZJmqGPHUCAWtMyme2R3lfwb96wVsQR
         KbQEuvvOHywUdBToiY7bBPXCdIlJhbB+y2rJn1i0H0X12w7ImfMcTv+e+bJdOlWZpJdr
         FCOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=sLD3dEzb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a8c5392973si2267668137.581.2024.10.29.14.01.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 14:01:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=sLD3dEzb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t5tIq-0003hl-Qa; Tue, 29 Oct 2024 16:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t5tIm-0003cq-6B
 for qemu-devel@nongnu.org; Tue, 29 Oct 2024 16:58:56 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t5tIj-0005Yn-I1
 for qemu-devel@nongnu.org; Tue, 29 Oct 2024 16:58:55 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99ea294480so411925666b.2
 for <qemu-devel@nongnu.org>; Tue, 29 Oct 2024 13:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730235532; x=1730840332;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VbXMc698zLmSQlXfITKK2kLCf84tzdIkZNkqr/UZe5I=;
 b=sLD3dEzbz6nZhfFzjIP7BpylPBDdTAy+ChELMPMiv5NWdRv+OsiNd/yDJlRuhhdsqJ
 bGkr0jHy0bdv+A+/0j399C71Vq9rpbIHNUjLAv198OQq+1OxxeFf27ZWgBx2cxtiyyCD
 yhoU32K7e2wMEN1/3t13qRFaM9Ltg8/LB94JEN3x94tUtDdMPg/Kd0mELbCmUbeYM2mw
 1RChB0b5IGI1i4QW0kZUkMPj36cFqAjUbc8f6A9uDjSzgyS/8Sja4Ry+zJAA4ZpgCWjm
 QBmk228cuItXPJNoRUNm9OkAwPXmYo7YHJA2tvN4EKHHI5GuLGrPUAAP0xVIOOWHv3Sq
 W5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730235532; x=1730840332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VbXMc698zLmSQlXfITKK2kLCf84tzdIkZNkqr/UZe5I=;
 b=F4XrWdmnL7ZZp0SJ1N71YW5zL6rfLoG/rmxBkCAUwkEVTq1r7zngiwJgAcOVXVBBv/
 sZpLlaBgAG/bpVm8GuhHalUH1GX8trMNmyw0c0VSJkh1oSiooF0Sdi6l3oDHAxhdcXaL
 iicfoO6eF90O2KWAwos3T0hEwK6hfnb0Kz8J3Ejva0zxp90I/mg+fguD2sgdh7KOBhxO
 0QurBZOOrvf85GQYKv7vIRQXWSb5+68htJcN7u1N5f4KUhXxbTUmz1oRrYtbhpuiH5vH
 HtNZgu4Je51+8/cOy87VPCGK6v8dPo3A0BWddmJ/LF06eZah38nbklc9nJrn47EAXN29
 fC+A==
X-Gm-Message-State: AOJu0YyHhSiITGiMuUufRUndg785rKr8U25i0e5ZcRs6Ol2kA8miqhxY
 izeQeU07W7XJERGxtsv/tG1hOXxrH6HJHr78LxFmUsse7PoI56WOF7emZlIqSaE+G4SM5QAAzSc
 CxQ==
X-Received: by 2002:a05:6402:2808:b0:5ca:efe:10de with SMTP id
 4fb4d7f45d1cf-5cbbfac3ce7mr15177508a12.30.1730235532037; 
 Tue, 29 Oct 2024 13:58:52 -0700 (PDT)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629d5besm4217341a12.33.2024.10.29.13.58.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Oct 2024 13:58:51 -0700 (PDT)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Alexander Graf <graf@amazon.com>
Subject: [PATCH v5 06/15] hw: Add vmapple subdir
Date: Tue, 29 Oct 2024 21:58:10 +0100
Message-Id: <20241029205819.69888-7-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241029205819.69888-1-phil@philjordan.eu>
References: <20241029205819.69888-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::632;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x632.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: NUc/pHcbW8mj

From: Alexander Graf <graf@amazon.com>

We will introduce a number of devices that are specific to the vmapple
target machine. To keep them all tidily together, let's put them into
a single target directory.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS             | 7 +++++++
 hw/Kconfig              | 1 +
 hw/meson.build          | 1 +
 hw/vmapple/Kconfig      | 1 +
 hw/vmapple/meson.build  | 0
 hw/vmapple/trace-events | 2 ++
 hw/vmapple/trace.h      | 1 +
 meson.build             | 1 +
 8 files changed, 14 insertions(+)
 create mode 100644 hw/vmapple/Kconfig
 create mode 100644 hw/vmapple/meson.build
 create mode 100644 hw/vmapple/trace-events
 create mode 100644 hw/vmapple/trace.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d95b9c9e53d..0437568973a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2734,6 +2734,13 @@ F: hw/hyperv/hv-balloon*.h
 F: include/hw/hyperv/dynmem-proto.h
 F: include/hw/hyperv/hv-balloon.h
 
+VMapple
+M: Alexander Graf <agraf@csgraf.de>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/vmapple/*
+F: include/hw/vmapple/*
+
 Subsystems
 ----------
 Overall Audio backends
diff --git a/hw/Kconfig b/hw/Kconfig
index 1b4e9bb07f7..2871784cfdc 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -41,6 +41,7 @@ source ufs/Kconfig
 source usb/Kconfig
 source virtio/Kconfig
 source vfio/Kconfig
+source vmapple/Kconfig
 source xen/Kconfig
 source watchdog/Kconfig
 
diff --git a/hw/meson.build b/hw/meson.build
index b827c82c5d7..9c4f6d0d636 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -39,6 +39,7 @@ subdir('ufs')
 subdir('usb')
 subdir('vfio')
 subdir('virtio')
+subdir('vmapple')
 subdir('watchdog')
 subdir('xen')
 subdir('xenpv')
diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
new file mode 100644
index 00000000000..8b137891791
--- /dev/null
+++ b/hw/vmapple/Kconfig
@@ -0,0 +1 @@
+
diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/hw/vmapple/trace-events b/hw/vmapple/trace-events
new file mode 100644
index 00000000000..9ccc5790487
--- /dev/null
+++ b/hw/vmapple/trace-events
@@ -0,0 +1,2 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
diff --git a/hw/vmapple/trace.h b/hw/vmapple/trace.h
new file mode 100644
index 00000000000..572adbefe04
--- /dev/null
+++ b/hw/vmapple/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_vmapple.h"
diff --git a/meson.build b/meson.build
index 5eab46f704f..3b9a0188d4c 100644
--- a/meson.build
+++ b/meson.build
@@ -3492,6 +3492,7 @@ if have_system
     'hw/usb',
     'hw/vfio',
     'hw/virtio',
+    'hw/vmapple',
     'hw/watchdog',
     'hw/xen',
     'hw/gpio',
-- 
2.39.3 (Apple Git-145)

