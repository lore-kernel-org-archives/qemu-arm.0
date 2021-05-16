Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp652879lfm;
        Sun, 16 May 2021 13:02:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3tz7m+Xody58MXIrfc63S4olKNl0SM/aKgjij8iMNZFnpMeXsGz67oSJN+67Uh/Rs23T8
X-Received: by 2002:a92:c7a6:: with SMTP id f6mr49286457ilk.17.1621195367362;
        Sun, 16 May 2021 13:02:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621195367; cv=none;
        d=google.com; s=arc-20160816;
        b=KzLJ7CSoNMhsP1zw5zP82RsRwmsgsHK1o4O19VREg5a20wGBotVN3KJOyNII/x39eZ
         5XDhp+jMoqNUYVoKx8Zcwke4NG9hOF+P0t5SzpBSm/zWsrqT7FX7/0tb24GhAYf52DQU
         lM/08XEybAEhg9b0srf6q9XEFgi3f2HhOoxVCeE6x4NCXVmvnneqlS7o4QaTQTANdBvm
         ls2Bk+jTc8hzn1//hmNVBzn51wEPoXR3YDPZZ2hEErG4dxrTnDmCsEr4bUOq7jTkJfrB
         f18j8445tJifJ4ZxVFaOPLjg86JjrFt99yCLZFEP36GqVdB9vrMxPpuS8AGm+Be2hNhc
         mZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=MKUZbfnb+VdxhRXyUXd8IBLsuNfiCX7o0fZIUBSIjlE=;
        b=w+GgJQrelLYpABOR8ltUJE6/HVWZ+SqlFnPPIIcvkTVOZxdltAXWRJ2nJrsEgLjVX0
         I4g2aBarhXn/lOtGd93qx23FiTFKDG0mcK7TZvg2bNqBG3kfrpH6czt1Y5g6GyJAk4FC
         jHD8HofoHiWsd8xSEHyN9HZ0ugEe5sZE1V9fTRcPMBUJHYkglatBcMWwt5xrYzEfPDhd
         Ihb6ES+m74jh2IKCyaw0EHxH7KXUkMy7AyOxfW6OE4O4fFx0bQ/Ehzo4kWRw7cNVvOYE
         21SX/o9oheIBqNAiXgpCMgGQNdzAkT5slulMbrNQafEMgezCuE7BGc3iDKLjH1uZoc8V
         62oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1si16395638jat.48.2021.05.16.13.02.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 13:02:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liMyM-0000NP-M3
	for alex.bennee@linaro.org; Sun, 16 May 2021 16:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMuo-0001zJ-Jg; Sun, 16 May 2021 15:59:06 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45390 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMul-0008Fx-Lk; Sun, 16 May 2021 15:59:06 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id A7D3960806A0;
 Sun, 16 May 2021 21:58:59 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 05/19] hvf: Make hvf_set_phys_mem() static
Date: Sun, 16 May 2021 21:58:41 +0200
Message-Id: <20210516195855.28869-6-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210516195855.28869-1-agraf@csgraf.de>
References: <20210516195855.28869-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bf0uZEyaNtk5

The hvf_set_phys_mem() function is only called within the same file.
Make it static.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c | 2 +-
 include/sysemu/hvf_int.h  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index c2136dfbb8..5bec7b4d6d 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -114,7 +114,7 @@ static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
     return 0;
 }
 
-void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
+static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 {
     hvf_slot *mem;
     MemoryRegion *area = section->mr;
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index ef84a24dd9..d15fa3302a 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -43,7 +43,6 @@ struct HVFState {
 };
 extern HVFState *hvf_state;
 
-void hvf_set_phys_mem(MemoryRegionSection *, bool);
 void assert_hvf_ok(hv_return_t ret);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 int hvf_put_registers(CPUState *);
-- 
2.30.1 (Apple Git-130)

