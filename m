Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2515871ejb;
        Wed, 4 Oct 2023 02:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW0ib/4elRNNqFv9eIsSM/Azg4X2suvjjdt9lKgwJRiFe7xIeDeDQJex1FsIPK9RKPSfy6
X-Received: by 2002:a05:622a:ce:b0:418:2b:acb2 with SMTP id p14-20020a05622a00ce00b00418002bacb2mr2072408qtw.30.1696410664982;
        Wed, 04 Oct 2023 02:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696410664; cv=none;
        d=google.com; s=arc-20160816;
        b=QLC9qwYTuSve7Qg3NOvVK3I4mtJ29DhJZY1msCgirpt+AR/wvUh+/1+pvKrMDxm2WA
         q7Y0oEGIXBvaAi7MWsjymm/diObmyD0MBcfZOuWoCFCgN6QypgzbCC7IrFV/m7zhPvE+
         y8t9T+2M8OsrixpPVUSqB8NfX6U6N5RsOghDsNLxO4kWXLHbf1CdqEcvmg2ghUMUFDmL
         0JfiOOs9y0zRTqTapKcH4YMZNVlwPDnSlnlcBXcVFqjvsO11VW49izffzgVpRL+Ki59z
         fgFBY6ohRcWeNV9db+I8tNJRwGynxSi3CZSCDlHHYsdDw4amJUuzQHaKoSMAh+Bggj/k
         10yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GE4K3cclxwdi11+MNGgub3UZQqTqPuI5wyHW+6dSmuM=;
        fh=1x6gZqeiXi7P0qIsg4T/B/mAubjQVbyzVHzlIyNLAnY=;
        b=Vm6xIjZItRCO447SCZA5PA/xU1daLW+9sFjLfTOJgUMYT1MOjSbIhn0UdtPJ5XPOtV
         SDtsJOUS5j8RfccDbP/DAq8PPq2zIXWy9cAp8N0iFYjpFiCSIqo9wFTHq5pH4dKT4bkF
         Dl3MfhReGXKPkZf/0flPgQe3w7xdjAtJszLp284l9r/PjfqROgdnNEjQgAuh4a9ijrV7
         NtDvYf9L4RJHDpkygzpHBmx6M/ObPp+SZKjvFt4I4D0M9YHsG93N8dW0BsiyCvyeOJmz
         U2ci1DAtPKSoQ1/1THBPMRwldUXuthkxxkksTtEgWsMZhL6iby6nlLVnQmBUdonqKfK/
         8MyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TqEQCMgH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21-20020a05622a035500b0040fdcdae9d5si1328306qtw.4.2023.10.04.02.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 02:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TqEQCMgH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qnxsQ-0004Xp-TC; Wed, 04 Oct 2023 05:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxr8-000342-Gh
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 05:07:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxr2-0007ay-2M
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 05:07:44 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4060b623e64so3984975e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 02:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696410457; x=1697015257; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GE4K3cclxwdi11+MNGgub3UZQqTqPuI5wyHW+6dSmuM=;
 b=TqEQCMgHz18wD82Tf0wrBjhWk942g3Mgb+VaSCTMIdBnzY7ZLE4EHRa4JePMq63SGZ
 Zz/AW9ID0Z64Pr88rYqP20bELCJMZxabfHPlIZU7v+rmlT6u9pcu+4rCY98STQbvNxM0
 BrM0gmu/WkcudsQDBZWc24h7P/u5PgYYnMnVRKl+rBYmd/d4d4UpmeHqgkm1/QHiTlrM
 3I/fZ060+zsDIm3yrZsfuDdBKmEk/GF+J3CdR3flIBWu+NeA2hDg9z0pKrCFK7R67l+f
 tnY2jeM0wS5CgEcOcMQ2IWgRQkO1GlaOz6zZ2Ij9wVUiG2y543OS4DzU8Xvy0zyUYbzs
 vkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696410457; x=1697015257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GE4K3cclxwdi11+MNGgub3UZQqTqPuI5wyHW+6dSmuM=;
 b=wuZgoJK+x4KQwsELgDniUPXaTwpAGVawaYWPAhaoLEOwAuxz6c5HxNUwzplrWT5niz
 7R31zHmIF9wt+RgIfIrwl6iR6aNV4BZ2Sn4AR3FgSksejvu+HRwhO/LjrVW3nDi8kNzk
 z8yUGSO/76b2T8fuzkzrPkUHr1XZBH7jES40JJTfhx5giiamlRkogWSkDj4+bYFXUjjx
 MZUjMzntBBxBBQN+cfu8hDap8JgqeoBKzXBZiREUadMLzJE/BHJfnAw3xOP737+FtOIp
 QURMpgCX8JW96IvAE2cgIMISWKZWrzeEOlo3xh7LVgRFsvMg444UXyvD86703hjPvBA+
 oQmw==
X-Gm-Message-State: AOJu0Yw6gaL1bdN8B55GykMaHVEZ4wnihvEzoePWnTNHBFi6LU6ZoShg
 d7GSd4vIg+hl25vNH3P78h1gIwqEkoiV3NilWrA=
X-Received: by 2002:a7b:cc07:0:b0:406:51a0:17ea with SMTP id
 f7-20020a7bcc07000000b0040651a017eamr1229546wmh.10.1696410457632; 
 Wed, 04 Oct 2023 02:07:37 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 m10-20020a7bce0a000000b00405953973c3sm984629wmc.6.2023.10.04.02.07.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 02:07:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 11/13] meson: Rename softmmu_mods -> system_mods
Date: Wed,  4 Oct 2023 11:06:26 +0200
Message-ID: <20231004090629.37473-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Gn/titBUxix7

See commit de6cd7599b ("meson: Replace softmmu_ss -> system_ss")
for rationale.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson.build | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 21a1bc03f8..8890dc5748 100644
--- a/meson.build
+++ b/meson.build
@@ -3496,7 +3496,7 @@ modinfo_generate = find_program('scripts/modinfo-generate.py')
 modinfo_files = []
 
 block_mods = []
-softmmu_mods = []
+system_mods = []
 foreach d, list : modules
   if not (d == 'block' ? have_block : have_system)
     continue
@@ -3510,7 +3510,7 @@ foreach d, list : modules
       if d == 'block'
         block_mods += sl
       else
-        softmmu_mods += sl
+        system_mods += sl
       endif
       if module_ss.sources() != []
         # FIXME: Should use sl.extract_all_objects(recursive: true) as
@@ -3554,7 +3554,7 @@ foreach d, list : target_modules
                                 include_directories: target_inc,
                                 c_args: c_args,
                                 pic: true)
-            softmmu_mods += sl
+            system_mods += sl
             # FIXME: Should use sl.extract_all_objects(recursive: true) too.
             modinfo_files += custom_target(module_name + '.modinfo',
                                            output: module_name + '.modinfo',
@@ -3597,7 +3597,7 @@ block_syms = custom_target('block.syms', output: 'block.syms',
                              capture: true,
                              command: [undefsym, nm, '@INPUT@'])
 qemu_syms = custom_target('qemu.syms', output: 'qemu.syms',
-                             input: [libqemuutil, softmmu_mods],
+                             input: [libqemuutil, system_mods],
                              capture: true,
                              command: [undefsym, nm, '@INPUT@'])
 
@@ -3682,7 +3682,7 @@ common_ss.add(hwcore)
 ###########
 
 emulator_modules = []
-foreach m : block_mods + softmmu_mods
+foreach m : block_mods + system_mods
   emulator_modules += shared_module(m.name(),
                 build_by_default: true,
                 name_prefix: '',
-- 
2.41.0

