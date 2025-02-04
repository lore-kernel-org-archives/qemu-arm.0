Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp407432njb;
        Tue, 4 Feb 2025 10:29:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVVbZmQyDJkTFWJtSOtuJwYeJK8QPXqWRTU2QcNHW0Zh/qoaQiXAjH88RZSlRLLnItpiQjQ/w39iOJ8RQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFixmmYkr0iqvsIAHduDRTR+dixlWqwz8NeiMvcMKNKSm1o0laCsFaUBKWUIwC/G8EW+4ib
X-Received: by 2002:a05:620a:261b:b0:7b6:d826:40ab with SMTP id af79cd13be357-7bffcda12d4mr4233189585a.51.1738693780962;
        Tue, 04 Feb 2025 10:29:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738693780; cv=none;
        d=google.com; s=arc-20240605;
        b=Tf9SndiRr8atVysF+t/Erl4L0cPvgoWJ4MwPwKwWMY1006oA2+M1eE0e0UxwCtuvPm
         aBkVD8g1l3AvK9SYirI66fe38pJnDepsijBh9aYgiFBjacb9DdsVy7m6S+RCa4TvGuhg
         5p4sraOyvl72CHsR4dFryIbAHe0l+bBnudWINziDfNO/txKWvI6lxgO61ydks8uefOkS
         zF5/GcTbuaVJ3IJRjim/orm1d0Kk/9IUWvtIqqSCTHi0P41Y0rvW5BP3mLY9nmrFbPpI
         HqsUM7+gMb4LuYLvcmX9FBx8iOXnEVbLoQXM2T8jHCWyAr16chJfj0mtcNFRwfbfdUXc
         PcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BrfjnJSg9CX0l2LnyeLtW/bJrqIZsHOwQ9P6gpzmndY=;
        fh=k8vw49BRwGRmkNm7+OtLErI3x138KY8bkvhmWXNHGsk=;
        b=UAtDnBdwvhDl+fkeuJQ5C3MU3w7mRyHaw6I6AYfH+IMIaHMiV2lJ46G+WbqoeNRh7Y
         tJZPEPtG8q5JWdoGwZNRzcWl+faCJ8KrKjkhemUWjhCQRDMCBOhDITzyx6qCmj9nPwd2
         RoLFyCJimIpYUmx1V8b/kPjXeHSQmodUOyxlFku0QSZgZGkyR1elS9NaQIO5f6Ku0ODy
         qF755p7dt7t98EfHM7iKNyMuQeQrIbt/BFLWwumGMuTCgdplsRpQz0UHRUY2kZvE8z0g
         2PA6xxsxedpRCloYZ0A8EoywQE/POHQtP+hoX5SHQCMnwSv6eAcJ1l+oJgDRxAvvTM06
         qJzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qc1pJ6w5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02dbe7cbfsi327740385a.379.2025.02.04.10.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:29:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qc1pJ6w5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfNfk-0000Mb-Ve; Tue, 04 Feb 2025 13:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNfh-0000Kd-Au
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:29:19 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNfc-0004oj-IN
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:29:15 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso44368485e9.2
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738693750; x=1739298550; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BrfjnJSg9CX0l2LnyeLtW/bJrqIZsHOwQ9P6gpzmndY=;
 b=Qc1pJ6w5ZvdK0FenAiwexlnLFHGHBn9FYZ+VjSUrTjq8JJHF0MHHQelzGcT+vekAtQ
 m8KXpDMNdrfZOAEA5FsQamJ/MS0qXvvbEUo04X1MkVeJuDpQWx3KwzDpQcmVO4CmfCId
 leGeSCvZzSNvUtbGEKLeYNL+gkCnW9m7l9A0ANQEzj5ECU4tk/NcaM0DyVHudv4hqdKX
 Ctd6lUrlng6dyzZTqDKIptXahNa/p5CYhJGAjfAktmfcT8eYjj+kcnCEkD/nAFNOqxaU
 a/+bhXigtKoHxf3z0hRc+Nhki7ky04rMxoxbbZ0oHYRRRM4FsZxxsfaTdIdHYUsjgBBM
 hu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738693750; x=1739298550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BrfjnJSg9CX0l2LnyeLtW/bJrqIZsHOwQ9P6gpzmndY=;
 b=TI01Y/3ZBOhK/luaKrOqalRpa2jss/2hPH9SrIbC+TDTzcVAnTVzZ2rTQ38M2GKAWl
 O3TXaNI5Z8hwWn6TPng/Qj67ZdRBGmF1K5jMD6yYx4CuHd56v1cIsUOnNcTuXTKKUJR+
 MRWN4SKW4NqLQYsEadA+lqD/xpu9w/cb/CnBkCSmCjCTe/22skFTZBOA6MIBJGFbx0Bm
 T8ViGeTTyhTnGu9ASNzlYdVmGAGExEXdzHHTz1XVZCHZKkiURohHTo/i4HLzt/Sz/x1K
 Fjdz+pSabjh8SaCmSyKqTfWn3Pg3IhVC5ShC8Ax7FQVXFk9c8UGc7Tte2ys+MyD5o7aX
 Hd0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwckCRMPqzpjswTr1nnnQl6f0L89JHFw3gm30m4C3RkcDjJIDaCAwGD1VoMcEp7WeDXzeAxu+30Q==@nongnu.org
X-Gm-Message-State: AOJu0YwjZrqVU3q4YcFZLtPPFmBQLvZsxljEqQZ8+0HHNU+LgtwAEa8X
 HXQPB/CG2iaJnWIZLZ6i/GH1TkhN0uG64+Tpypa+xfFXEW4OGB2uM8vtSbHsyb8=
X-Gm-Gg: ASbGncuvm2ypS7VP8VowILyB57SQGFDM1ooup0kOZMwpT/evIa142Po4Mkfcn7ex4vT
 LDkxs62t+d/wsJCbJDDHE97szA6TLQq82V4H9RCXOXmQdN/ty3nuRIMG0IsSJeYFOJX2FUHAAPM
 UzhCYqxQL5QYtqldDqNGWscP0B3vNSRJap3e8tx2gPFTkH9Bca7QmX9Ttyr8a8SPnQkZEYZ0OQr
 98Ig4dTPfyoENyE7PyBKVhiolVtE+71Z5PmOIra6IcJxUuaCi4uT8vnXwaDxFcJdc+Te+EGhtMO
 kA1/kFeL8BndaQioGMGOHJuE/MzkuYPHaGtWWErL+C3cDvVFwMNCr1cddOVTS9uA5g==
X-Received: by 2002:a05:600c:3b94:b0:434:a929:42bb with SMTP id
 5b1f17b1804b1-438dc3cbb71mr246227075e9.18.1738693750148; 
 Tue, 04 Feb 2025 10:29:10 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244ed3fsm203163145e9.31.2025.02.04.10.29.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 10:29:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 1/7] hw/boards: Convert no_sdcard flag to OnOffAuto
 tri-state
Date: Tue,  4 Feb 2025 19:28:57 +0100
Message-ID: <20250204182903.59200-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204182903.59200-1-philmd@linaro.org>
References: <20250204182903.59200-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: sRzUf6uvwF3V

MachineClass::no_sdcard is initialized as false by default.
To catch all uses, convert it to a tri-state, having the
current default (false) becoming AUTO.

No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/boards.h        | 2 +-
 hw/arm/xilinx_zynq.c       | 2 +-
 hw/core/null-machine.c     | 2 +-
 hw/s390x/s390-virtio-ccw.c | 2 +-
 system/vl.c                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index e1f41b2a533..d61b0a47780 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -283,9 +283,9 @@ struct MachineClass {
         no_parallel:1,
         no_floppy:1,
         no_cdrom:1,
-        no_sdcard:1,
         pci_allow_0_address:1,
         legacy_fw_cfg_order:1;
+    OnOffAuto no_sdcard;
     bool is_default;
     const char *default_machine_opts;
     const char *default_boot_order;
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 8477b828745..12418094f9d 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -463,7 +463,7 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
     mc->init = zynq_init;
     mc->max_cpus = ZYNQ_MAX_CPUS;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
     mc->ignore_memory_transaction_failures = true;
     mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "zynq.ext_ram";
diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index f586a4bef54..b93056c0f7b 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -53,7 +53,7 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_parallel = 1;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
 }
 
 DEFINE_MACHINE("none", machine_none_machine_init)
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index d9e683c5b49..5f78c8d20ff 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -817,7 +817,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     mc->no_cdrom = 1;
     mc->no_floppy = 1;
     mc->no_parallel = 1;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
     mc->max_cpus = S390_MAX_CPUS;
     mc->has_hotpluggable_cpus = true;
     mc->smp_props.books_supported = true;
diff --git a/system/vl.c b/system/vl.c
index db8e604ebab..2940c865b19 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1346,7 +1346,7 @@ static void qemu_disable_default_devices(void)
     if (!has_defaults || machine_class->no_cdrom) {
         default_cdrom = 0;
     }
-    if (!has_defaults || machine_class->no_sdcard) {
+    if (!has_defaults || machine_class->no_sdcard == ON_OFF_AUTO_ON) {
         default_sdcard = 0;
     }
     if (!has_defaults) {
-- 
2.47.1

