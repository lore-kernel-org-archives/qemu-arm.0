Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2284494njb;
        Mon, 17 Mar 2025 07:29:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRrhXX5toheT2ZbyLVWriWktESApqx1XQsJStkGSkvBiMbMaXlRVb9UsHWAsy20dtkWkDvh0bZ5bhPQg==@linaro.org
X-Google-Smtp-Source: AGHT+IGiedtHENiikgZbFQVcGI3bg6PJRwp8gsKvaKBeLGDOajWhR/tiiqnTeWjxeiyewbs8w7WJ
X-Received: by 2002:a05:6102:3912:b0:4c2:ffc8:93d9 with SMTP id ada2fe7eead31-4c38313e0b2mr8619514137.9.1742221766674;
        Mon, 17 Mar 2025 07:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742221766; cv=none;
        d=google.com; s=arc-20240605;
        b=PrhWijwoY1Lb/EScyA/EEA6D72IgH02T/xKv+6cEX2nqdCNl4Ws1+KxM6I+iT1V4tu
         mXCFbWtlt5x6RmStRi6gyyOcWHINiD0zwvmj3p+Vm2MKN425c5f/kxJxGhmoni2lJ0Oe
         0m7LEjdoDbF0DvEyIYXv4rML8v914dvqpcEpENnLix3PEhf3S9p8mK7ufzR2bbMQcWvt
         jGcvod9E1miKMzSVvk96Y/dPI9bwKKjPX9GMI15CogKc5foyejo36V1DYg4B47lUY5Bz
         adBSi4POblInXuUBYxNhSp/Aj8kkqSuuDcV/hEY+XM6l4Uhrbwy8Rcqte99wFiu+m+s7
         w90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Ed58W98jyoaHONWfIN5+zo5mCzlrR5LF+iZM/WQf6LU=;
        fh=W1Qx9/lPVXXizIIPmjHHnCQgFeGxcjanG/z2r0aPDKI=;
        b=kv+xgbLrrs1gAf7TbofOHCB/0a2ROjMrNNvZzB4+BiKvr+Nr42mGQjiOHWgOpfLaKi
         GnxaL42FBQ1kQf9V2OWmNgiTBrooj301HrRdPYV/29INk/4l8C3ke1y9xtR3XB/Owxgi
         KtPg+aGUbSmiy1zqJ0JtZ/07cOLHGrWYPtNzEnqOzrxpwUTELLTDZ0L3TuSYhV+9oHw4
         9/iSCQI+tRYnZ+o8tRvmB7vz+XfcRoCEGDGOQpAEOXklFdCRtREMNmKWgcyOc9cgBlxo
         LmEgdlUsZXD8gUooAV1kSbrJ1EwUyFq2gTwbPKuSMEIygBRruGHQxbLVQdLvgmXxpPB6
         JU9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IK/7dh1g";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c37480ec92si2375271137.32.2025.03.17.07.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 07:29:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IK/7dh1g";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tuBS8-0000Yc-6I; Mon, 17 Mar 2025 10:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuBS5-0000XG-ID
 for qemu-devel@nongnu.org; Mon, 17 Mar 2025 10:28:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuBS3-00017r-NX
 for qemu-devel@nongnu.org; Mon, 17 Mar 2025 10:28:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso4136384f8f.2
 for <qemu-devel@nongnu.org>; Mon, 17 Mar 2025 07:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742221701; x=1742826501; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ed58W98jyoaHONWfIN5+zo5mCzlrR5LF+iZM/WQf6LU=;
 b=IK/7dh1gzcyFwO4jikW0ZvLGDfnBs0NHkENf/QP+pVirIw9rL3PwenvdwVjEolvEyI
 2bqWa1wIeYj7ZutxvxjLR26oqS9HvMAku+q6pcj2xbPQLaUe9y5rOFaBKYpM8W+0DYXk
 P15aBXgmiS++8JApPQ2VyFWvy51zZRkzO/JpJQ0B7n7pRTXtexJCdGM4qZq3EepsECWf
 x4BzIj0IFZeKr749mVd1cZPZFzU/0F2b/kAPK9G3f1U/Zy+LVYOGaVgM9JrYU8qrF/l8
 AQg2w3+z1KeItIm3xlv7RUUx3sFwFl7IkWAvuP4psf3KlxnMuNcz4kvez7snVIwWj5lx
 fnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742221701; x=1742826501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ed58W98jyoaHONWfIN5+zo5mCzlrR5LF+iZM/WQf6LU=;
 b=YikzMWTi0/ogK3LksV2uijGrMvK3x6OJHoAx8/rvOHediytCEyH4g6gBaAmZDVcJx1
 H00PiV1SmytqAJv+1XAbymFCyMh2/hH26Kwl8vIsPDtd7rS8AiZYr6S+lqdiOAP6TdLB
 R2oezJt35Aj4c4+YZganbaADsrDouu6rh9yQ46YiRg/9cjSLrdrhGZZe5rke1dkjzycn
 cWm5ulVT4s5kgGcL6Cha3nKBsxx1JRMDH32wC1DpRwk9yNEM5CnW3Rz0gb5VTxOIIWiR
 n1BhoVWEyj12Bz9UCKU826j0IMiILDtYnbKg2n1lpL/kXZuucwsGMEsYgTf6mIdnmMYG
 3Zgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw9VB8nUH2k+iWlCSeuE5wwAuYs/F92Ug6WZlcAAUVk+3Ou5sbgLfaKAD7pNt9D0jUqs2K6n9lg7TB@nongnu.org
X-Gm-Message-State: AOJu0YxIDtyc694cDFc0Ovf5HHV7EMoMCR93IEpL77gXf5AqXR93ErVC
 UCNTU30Wzc3UTNsghlX7637iI4l1Lvq0HQLLVYAD5/PxOCaSshdEC5OpGCxmFcY=
X-Gm-Gg: ASbGncsN7fbUzq2dgaVXvsLIi/zmKYnx7qN5N0NEHo1mkllRZwb7AJ2gcidwkudSeWl
 TUm6pXGbFojpQ4yH8rDaf6xuoGGJQ4LDp7JQTPcpTJSis90uJAPh3E8EBZt5dOvTyzDBeFI38CQ
 vkezgX+62xZQXG0SlFNssJtNNlKbySXj44UwZmBG1zwZNZC044jljfKwI3Wpg2oNISN787noEEH
 6bMQXlHaQ1UJQ1ALoZ6AKI9pd43sMHlb54/DXHFdYC7zC5SlItgg18B5PGxKRvMzzRT/6PtW+sD
 oTs8EytYahl6RYg3lH/V/9Kv5U/XHKZLJa5ZH8+9VyKJVTTr31m8B6dj/cD1HA==
X-Received: by 2002:a5d:64e8:0:b0:390:dfa1:3448 with SMTP id
 ffacd0b85a97d-3971f608b39mr11533511f8f.43.1742221701316; 
 Mon, 17 Mar 2025 07:28:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe60ad4sm107914985e9.29.2025.03.17.07.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 07:28:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-10.1 0/9] target/arm: Remove TYPE_AARCH64_CPU class
Date: Mon, 17 Mar 2025 14:28:10 +0000
Message-ID: <20250317142819.900029-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hQ5nHY5+gjSd

Currently we have a class hierarchy for Arm CPUs where
all the 32-bit CPUs (including M-profile) inherit directly
from TYPE_ARM_CPU, but the 64-bit CPUs inherit from
TYPE_AARCH64_CPU, which is a subclass of TYPE_ARM_CPU.
This subclass does essentially two things:
 * it sets up fields and methods for the gdbstub so that
   the gdbstub presents an AArch64 CPU to gdb rather than
   an AArch32 one
 * it defines the 'aarch64' CPU property which you can use
   with KVM to disable AArch64 and create a 32-bit VM
   (with "-cpu host,aarch64=off")

This is a bit weird, because the 32-bit CPU you create with
KVM and aarch64=off is still a subclass of TYPE_AARCH64_CPU.
It also still presents gdb with an AArch64 CPU, so you
effectively can't use the gdbstub with this kind of VM.

This patchseries removes TYPE_AARCH64_CPU so that all CPUs,
both AArch32 and AArch64, directly inherit from TYPE_ARM_CPU.
This lets us fix the bug with gdbstub and "aarch64=off".

Most of the gdbstub related CPUClass fields are already methods,
so we can make the existing TYPE_ARM_CPU ones redirect to
the AArch64 functions if ARM_FEATURE_AARCH64 is set. The
odd-one-out is gdb_core_xml_file, so we have to add a new
optional method gdb_get_core_xml_file to allow us to select
the right XML file at runtime. (We could, like gdb_arch_name,
simply replace the existing static string field with the
method for all targets, but at least for this patchset I
didn't want to get into that complexity.)

We make the 'aarch64' property be an object property defined
if the ARM_FEATURE_AARCH64 is set rather than a class property;
this brings it into line with our other CPU properties.

Once we've done that and removed a check on TYPE_AARCH64_CPU
in the KVM code that hasn't been needed since we removed
32-bit Arm host KVM support, we can remove TYPE_AARCH64_CPU
entirely.

(The rationale here is that I think we should be able to
enable 'aarch64=off' for TCG CPUs too, so this will become
less of an odd KVM-specific corner case, and this seemed
worth cleaning up.)

thanks
-- PMM

Peter Maydell (9):
  core/cpu.h: gdb_arch_name string should not be freed
  gdbstub: Allow gdb_core_xml_file to be set at runtime
  target/arm: Handle AArch64 in TYPE_ARM_CPU gdb_arch_name
  target/arm: Handle gdb_core_xml_file in TYPE_ARM_CPU
  target/arm: Handle AArch64 gdb read/write regs in TYPE_ARM_CPU
  target/arm: Present AArch64 gdbstub based on ARM_FEATURE_AARCH64
  target/arm: Move aarch64 CPU property code to TYPE_ARM_CPU
  target/arm/kvm: don't check TYPE_AARCH64_CPU
  target/arm: Remove TYPE_AARCH64_CPU

 include/hw/core/cpu.h    |  8 +++-
 target/arm/cpu-qom.h     |  5 ---
 target/arm/cpu.h         |  4 --
 target/arm/internals.h   |  7 ++-
 gdbstub/gdbstub.c        | 23 ++++++++--
 target/arm/cpu.c         | 55 ++++++++++++++++++++++-
 target/arm/cpu64.c       | 94 +---------------------------------------
 target/arm/gdbstub.c     | 12 +++++
 target/arm/kvm.c         |  3 +-
 target/arm/tcg/cpu-v7m.c |  1 -
 target/arm/tcg/cpu64.c   |  2 +-
 11 files changed, 101 insertions(+), 113 deletions(-)

-- 
2.43.0

