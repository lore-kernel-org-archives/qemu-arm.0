Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp986912eju;
        Fri, 15 Mar 2024 06:06:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCYjBB5VyFx0c312H41hUyZbQ9giJCka2a/n5hAq66y+ANmNvJD6iQoE+8seY+ydalAnRr0M1QQr+1LxPivGcFEDlhLsva
X-Google-Smtp-Source: AGHT+IFRJHPG7eidF7lqjpgAQAl7WQj3UiG3J5pA8xUfSVEDHYMlgZ1ANpuUSL74hwZOfWINg0L4
X-Received: by 2002:a05:6870:6389:b0:221:8b50:f1a1 with SMTP id t9-20020a056870638900b002218b50f1a1mr5056204oap.40.1710508002469;
        Fri, 15 Mar 2024 06:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508002; cv=none;
        d=google.com; s=arc-20160816;
        b=YgGL/Icl8dJei/oNeuAmBL87eKD3rjU0HaORSp896kz3q9BnmEpuBIN0i/pGTEptvK
         5fj1gTfVJ/LX25BaUks3DfyvBG6BeDWLt0IWvS/l3jCLZrd8VS4znRjDu58JhO9SL0se
         qjYpqDCFiNtCPCqnqI7rBQvnzvOjgI3CljlCKp0CGvGe4vs3XZowVn1LDjMIvvE+CnLR
         Zsm/dbsbqwodY0qug9neCfozcWzNa9+0qqofXZ2ICUnqd6jmzlnVkvgxotHiUEZ8ne25
         jmK7OdgSM20188ssWEH/hO5ANhDAnxcVgrdAxgWOeq/VcGfPcPzE6dk0kItEk0ZWDJbt
         Cp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XJnPsHFmkVMUnscQauDvD3T+tPj+dvrsErrOjqviBzw=;
        fh=uGcXrD5210VkmqrQURzS9Txl0eldLxl/g55OxRC+1V0=;
        b=Fu71YjaAGns+i73LfPNoyv5RTNgz3Qy50Tzvc7kXqXdSl5tipKKq7c2BfWfbWmVb6b
         J6qUTDoBIoC7Q3Y3/wJlQdifBQXFtUrAoAT3fPdYA9INbNcRjgwNJgnlWeIRy8xs0avv
         Mb0Cu5OQuOvJcr894s3IOKwVz8v06RwWoU9/g367RWkHnQHCxmLRAUjRt7yq5UvC1VCZ
         qQ1jczKRwvLLpjEdB1kEnPtXxIDCBU26yFT1v3iKQOEl9acpcrCnOMhGhftEECpR6IXg
         TR9CQtJ0QT9Bhzw/lbVIrLPKtJN4dwdsZxel+1RxjtfC/vcHYBK+zTj9yoy9BffrPWSv
         /BqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=OC0REzmU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a67ad0b000000b00472a9a14723si503640vsl.180.2024.03.15.06.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2024 06:06:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=OC0REzmU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rl7Ft-0002kN-S2; Fri, 15 Mar 2024 09:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7Fr-0002iy-VV
 for qemu-devel@nongnu.org; Fri, 15 Mar 2024 09:05:48 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7Fl-0006H0-RG
 for qemu-devel@nongnu.org; Fri, 15 Mar 2024 09:05:47 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1dcab44747bso13864015ad.1
 for <qemu-devel@nongnu.org>; Fri, 15 Mar 2024 06:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710507938; x=1711112738; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJnPsHFmkVMUnscQauDvD3T+tPj+dvrsErrOjqviBzw=;
 b=OC0REzmUwSB0rpJcWVZ9MnDz416DTkFBIs+MZjrtmU/1ac+rEQAznreadnMfIPwEWa
 jlVJgNRg/KaTGt/1YjxLAexMdOvNXDi3EDwRgSEO4oCAQs0T4uYQaSIraD59/xUjqGRJ
 AM4Uwy9X4c3Mly0G94f7Ci6lIcjWVPt2TgZtIoEEvjP43L+ngYydh4aJ3Q46zQNnf3Z9
 0OJ0QkRAZ9j1BNSkFIrLB8Jh/iIUpFd93Z6DvFsLA4ScOKDtQtJLfCbpcfN0cMuON3t3
 tn61EPGxEd6TxchkqleXnuMUAwO0meDNUfmu38PuhEhl+v9GxkdwJ0+x+eLOso0CsOzf
 x5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710507938; x=1711112738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XJnPsHFmkVMUnscQauDvD3T+tPj+dvrsErrOjqviBzw=;
 b=w5/8Ccismm+hK5bny3jZaMnyVqBOp1FDiS8BAWDg5y8n1boM6crvUJ6+LXkHR6XmDB
 xEkAqRNqYaSST/bK63YU/SaQth5MPqGoNReH36Lt5XjinlyDvKY/7o4fF+2xDMLoIdAi
 DgK0PClnCLD2uDqISBKzKML6/ILnhVMyk2HChCAwDuTrtWWEkeoKkVQ0sbj5aSuDXuLV
 Cr2F2cC3fJW07VokjwzBHRun3CH+SkYarJFkW32/05o+sEr3iVzGvVr9NSUFavMqCBZ+
 xN4EpTQqBGz37TbfNHFnBrOhOyvehmm/eAgAvXoZSWJGviv5zrWflXL5UdfL1H4iqXE5
 HeSw==
X-Gm-Message-State: AOJu0YybbtcKhF0Q1KUUaZHuHPOZlYNI0iVfI1u/UiDgfnwmzByQhqeS
 Q6i5yyYgW5n8V82CJTZpzAwklowkrHWip+2OzGp3ntGNRoJ3772MK3MH6nHsht2Iz/B7Kf7LFCN
 p
X-Received: by 2002:a17:903:503:b0:1dd:bdf6:3746 with SMTP id
 jn3-20020a170903050300b001ddbdf63746mr4177077plb.40.1710507937931; 
 Fri, 15 Mar 2024 06:05:37 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.184.12])
 by smtp.gmail.com with ESMTPSA id
 lh12-20020a170903290c00b001defd3e64d6sm182474plb.22.2024.03.15.06.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 06:05:37 -0700 (PDT)
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
Subject: [PATCH 02/12] uefi-test-tools/UefiTestToolsPkg: Add RISC-V support
Date: Fri, 15 Mar 2024 18:35:09 +0530
Message-Id: <20240315130519.2378765-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240315130519.2378765-1-sunilvl@ventanamicro.com>
References: <20240315130519.2378765-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62b.google.com
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
X-TUID: hO/p6nP+y7oq

Enable building the test application for RISC-V with appropriate
dependencies updated.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc b/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc
index c8511cd732..0902fd3c73 100644
--- a/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc
+++ b/tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc
@@ -19,7 +19,7 @@
   PLATFORM_VERSION        = 0.1
   PLATFORM_NAME           = UefiTestTools
   SKUID_IDENTIFIER        = DEFAULT
-  SUPPORTED_ARCHITECTURES = ARM|AARCH64|IA32|X64
+  SUPPORTED_ARCHITECTURES = ARM|AARCH64|IA32|X64|RISCV64
   BUILD_TARGETS           = DEBUG
 
 [BuildOptions.IA32]
@@ -60,6 +60,10 @@
 
 [LibraryClasses.IA32, LibraryClasses.X64]
   BaseMemoryLib|MdePkg/Library/BaseMemoryLibRepStr/BaseMemoryLibRepStr.inf
+  RegisterFilterLib|MdePkg/Library/RegisterFilterLibNull/RegisterFilterLibNull.inf
+
+[LibraryClasses.RISCV64]
+  BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
 
 [PcdsFixedAtBuild]
   gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x8040004F
-- 
2.40.1

