Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2084028wru;
        Thu, 4 Jul 2019 07:20:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3cFFFKFEjRS2vVL41hQxdw/PQ9xx/PqFhwipb1DBAlajEqLM6bKf/SMKf5cfgeI07Nmz2
X-Received: by 2002:a50:91ef:: with SMTP id h44mr49116656eda.276.1562250035830;
        Thu, 04 Jul 2019 07:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562250035; cv=none;
        d=google.com; s=arc-20160816;
        b=f61htEaO73u5THYhSmbnPY0inWSd+cwfxyP4Cgen/i7z4ogUu9AGL+4yEvXJN+Lju3
         PAmBCqRfVuzYmQWXS2lKY7WEOiVIkTkwz2Gv+027l+VVB7YaptVwQf+lliIw5M5WriN+
         D6D/gxgEsZ0SEsVnA8P1b6tsH2FrVrBI5LbYdQ5myPOszG8tgZkpxf8BbMp6kcrAnVGA
         pxM3kc9ipLwQCnpKt42gt69luMd3F2yTrmlNQ9DBbSMcPwh82HHYwIFOIscypsFlEKhQ
         kbPCmTHpG2RNpJr+OL85VxZZUIRCVQu+eWh/nUv2RQi8/zvMidsXCkfKoVeZN0YLy4FA
         180g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=y2vuXrmq/JT4NCIyF08AXa1zIQrKXhKE3HksSwRif84=;
        b=j0z5UHZK8bM4Uau0EBxnD0h0xFD6GXjNtPcsjVzcJ1S1QNoJNK9cVV8nFWWXD7D5Gs
         je6cOXwyABoXmR9pWv+s4gg6EMZdjPc+EWldL+gd3pBlUrE8zA9OpbGIdbcs2hOiIMLs
         g66ZRVNge1INO76dPYKmAiNKE37jtMalHXUY+1CgHh+QUOWlEM/QcgSpJGjrd2rb0qIm
         CorrxhX5+rJSTTyqu6dTQ2yGqGES4Lpr+jLZWyDJK9U9hZARRiqB/s2A0f8MJdhyEuD6
         5Y5Hh0VmRuUScAsDiYxbg6cI5IBhUZ6jhTpr7xiQKpPQchxRERt87p2SqKlW8J9arwK3
         awEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jotr24d/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si5286891edc.372.2019.07.04.07.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 07:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jotr24d/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hj2bC-0003CX-Si
	for alex.bennee@linaro.org; Thu, 04 Jul 2019 10:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57569)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hj2an-00037l-1l
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 10:20:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hj2al-0006kr-Ux
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 10:20:08 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53483)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hj2al-0006kX-Nv
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 10:20:07 -0400
Received: by mail-wm1-x344.google.com with SMTP id x15so5923180wmj.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2019 07:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y2vuXrmq/JT4NCIyF08AXa1zIQrKXhKE3HksSwRif84=;
 b=jotr24d/ZHImENcxd5LAOPtbpUgTnqn5wNT8asuaodhkC54AjrSl+/Nu5cN9FDMaGt
 2YD6zvlf9yrEXFOTTZ/Hb0QTCeWd+n/+PN7OpSBMRiBEB7t0n8b1G78jwoemJVN0ZGTV
 xy5pn1YPTEXirxcM49g23aT7AGUgKmaGuwpMxFEV7p+wzjKzLIWl0cMXDhv2xRPUekRB
 XHPzPWYhvBeCxeCVvNzbMhaZ1v3c+uiMLlT2Ci3TW4ogVVBGiDZpCcEbEso69/495aqB
 MSUact+9SZXzRHgJPulmwUDdfT7dMHVql+zKDawlER10LxdU3z+GoaaVOo9235aCc5XI
 BfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y2vuXrmq/JT4NCIyF08AXa1zIQrKXhKE3HksSwRif84=;
 b=tZHl+zRjjyi3yvJzdSY8KfbRxeMeTiqxzpjyifZTGVpFCC+OcZfNlssXgkCoKusPM5
 4KW5WAcHGVnugZZzRQn2ikLXGYdVX48SvXhb0LF71qs0UZt93DblfxRui1+nA70yKzyr
 ceaef7w6tC4tqnCoiExa8hBoDTkdZsz9Clnkwc4Gwb/TazKRaqYUyDZSOFE5UmBhacin
 8nWabFZ3OjUm/mQniQM+vs6VrYrjiUTFaAE4fiBUpWLn0QOdHQGVcFKgNQ7gsJRvh5nG
 hrn1ypVkH3jAkCB4+ssRaGvQez5MjknZJUgjANgShbBl76qmrnFmUB+Yv8ezQD0Gdbr7
 GnjQ==
X-Gm-Message-State: APjAAAXDYgxS99w1vEWOmqk6LVS5yT8Eub91OjcFeSgUAoarLauYFBic
 5Npeu3zcIzPvSAX6IXmzx6dtfZ/Dc/ZfGQ==
X-Received: by 2002:a1c:9696:: with SMTP id y144mr12844133wmd.73.1562250006394; 
 Thu, 04 Jul 2019 07:20:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c1sm8917572wrh.1.2019.07.04.07.20.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 07:20:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  4 Jul 2019 15:20:04 +0100
Message-Id: <20190704142004.7150-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH for-4.1] hw/arm/sbsa-ref: Remove unnecessary
 check for secure_sysmem == NULL
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
Cc: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Leif Lindholm <leif.lindholm@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dw4m0t1SV3RI

In the virt machine, we support TrustZone being either present or
absent, and so the code must deal with the secure_sysmem pointer
possibly being NULL. In the sbsa-ref machine, TrustZone is always
present, but some code and comments copied from virt still treat
it as possibly not being present.

This causes Coverity to complain (CID 1407287) that we check
secure_sysmem for being NULL after an unconditional dereference.
Simplify the code so that instead of initializing the variable
to NULL, unconditionally assigning it, and then testing it for NULL,
we just initialize it correctly in the variable declaration and
then assume it to be non-NULL. We also delete a comment which
only applied to the non-TrustZone config.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not a bug as such, but we should put it in for 4.1 to
keep Coverity happy.
---
 hw/arm/sbsa-ref.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index ee53f0ff60d..6f315b79445 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -254,8 +254,6 @@ static void sbsa_flash_map(SBSAMachineState *sms,
      * sysmem is the system memory space. secure_sysmem is the secure view
      * of the system, and the first flash device should be made visible only
      * there. The second flash device is visible to both secure and nonsecure.
-     * If sysmem == secure_sysmem this means there is no separate Secure
-     * address space and both flash devices are generally visible.
      */
     hwaddr flashsize = sbsa_ref_memmap[SBSA_FLASH].size / 2;
     hwaddr flashbase = sbsa_ref_memmap[SBSA_FLASH].base;
@@ -588,7 +586,7 @@ static void sbsa_ref_init(MachineState *machine)
     SBSAMachineState *sms = SBSA_MACHINE(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     MemoryRegion *sysmem = get_system_memory();
-    MemoryRegion *secure_sysmem = NULL;
+    MemoryRegion *secure_sysmem = g_new(MemoryRegion, 1);
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     bool firmware_loaded;
     const CPUArchIdList *possible_cpus;
@@ -612,13 +610,11 @@ static void sbsa_ref_init(MachineState *machine)
      * containing the system memory at low priority; any secure-only
      * devices go in at higher priority and take precedence.
      */
-    secure_sysmem = g_new(MemoryRegion, 1);
     memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory",
                        UINT64_MAX);
     memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1);
 
-    firmware_loaded = sbsa_firmware_init(sms, sysmem,
-                                         secure_sysmem ?: sysmem);
+    firmware_loaded = sbsa_firmware_init(sms, sysmem, secure_sysmem);
 
     if (machine->kernel_filename && firmware_loaded) {
         error_report("sbsa-ref: No fw_cfg device on this machine, "
-- 
2.20.1

