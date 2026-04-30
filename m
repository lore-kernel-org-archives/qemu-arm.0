Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BADFF886F
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 09:42:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wINrJ-0005Tk-2b; Thu, 30 Apr 2026 05:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINrC-0005Ba-3e
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wINqy-0002lv-8B
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 05:38:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43d77f60944so501389f8f.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 02:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777541917; x=1778146717; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R4M1+8MaNJJPZqDo1tunWUHC1iAqc51w+I18EtZXKXs=;
 b=kLCoc72uPLbYaNNZNYJN/9cIVYu0BYkw4FcdmysF1s6fTH4ufhczaAzLP8BJLvae5b
 GBUYpXA3ODqy353LtujKBjOXIZT1Pxcb0O8QcDxcpsE64pN2Iwuigr5Mv5cFFWglTk3S
 dR3W2e/rb1mUUzVAgKfooNX9/43pC0rrwLDd5F5qjgDY0FFhlW7Qm6IkPHtu3HZLkM4T
 4+gnY8yCdl1am7oYBvjTkROhJ40qh4m77FCqCFqaC6wN49Q7p0v73DEip2OxpW0b4uBO
 ah/uqTYTKqwbMfXXkXkPBMoBEvuB0GeOwibYw4Sb4js0ofukj0PX68HLQWnqUMg6Ajgx
 XkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777541917; x=1778146717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R4M1+8MaNJJPZqDo1tunWUHC1iAqc51w+I18EtZXKXs=;
 b=Tzo6OpOl0WZy2WuncD0OKRzs3Z0BfyiLI4aGAnuHAdgMcty31y7OxevF2BJcvEhpuE
 0IcTp/ELRNIrWAbAxoVS+rFKBln0WFdUasxlG0BkxN0iX/lFJyJuZfvVjOgJN4edZwwy
 Z8VUFrWoT6eo350YPOfS/MWrmkSHBO1hULkigY1LD1v/KmhTNQ6/owDJpDmx0es3v9Hx
 o+Z1Grj30ayBZOqCqRdH/mcfsQ2cWT3R8MWcLx+vcY90r8/BKOtDWb+YNqh1529sn6pC
 DAhUoGi9ScB4PjE0TDYKdsgQ45DWb1Un0xXyZa0dGSV9YWSRyMKO5kptFVotjYdxq1ck
 b0vA==
X-Gm-Message-State: AOJu0YzAtosWwiKHpuJBeHX8BwbRsN3oqO0d/ozE+b9LecTIuVn6pch+
 zr0x7/nsGXpf6Soyu88rVQn9+fipEAwGcm0YtNClf2RBwXMSquS0JgZ4gVAk/ATJa0I=
X-Gm-Gg: AeBDievAMEI5J6s9ojWntGMY9X2yX04C2XmkYebMkoXcxyDzNC5YN0QF6albi+zQkVG
 rFbrF393C88pCJs6pU7YUdyIUBBjWlacOnqo6vnP1ndBS1oKrD3Tj7BKZ43mXzPZ3gOVWNADj0n
 IULRwGNZHOrYVBov3ssxMapy++Lr6QoOslBpKuAtOhowCmfPAGWZ78X/c4ueenqjVTvT4xhviC3
 AwrLIQg9gC1QUSrI/TCOPbmq6WN5TatjXC/SdYoDq3b3fsFXHL7SyPK9gXSpMdwUppcC7TUjgru
 hoNGpXH3+oaS6uW/JxIP9IcbbMCFzbjpHVPaW00bzUcnhfYZidDVKaWVsWzOc7+k77JFFTq2XUI
 Zh8O0JERB6551+YFLnajetEzxfbfkA1f6Za1c75GnviW8ZuHkb6DBSrtF9IwDu5axfv6dciI/Nd
 moKH5G65QkTcy8SwaPvYduwULXGoWwZaNhu9iGN1vb/U0hrasop+hAgFJynZdsUcWyw4IreDkq0
 ppFPDUfuJxSYSDo30EBQ6idn64QPtSmf2pv3XnLgA==
X-Received: by 2002:a5d:5f44:0:b0:43c:ff58:35c3 with SMTP id
 ffacd0b85a97d-4493d02aaa6mr3458793f8f.10.1777541916662; 
 Thu, 30 Apr 2026 02:38:36 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b421721fsm10816795f8f.15.2026.04.30.02.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 02:38:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 19/25] hw/i386/vapic.c: Use cpu_translate_for_debug()
Date: Thu, 30 Apr 2026 10:38:04 +0100
Message-ID: <20260430093810.2762539-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093810.2762539-1-peter.maydell@linaro.org>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We would like to remove the cpu_get_phys_addr_debug() function, by
moving all callers to cpu_translate_for_debug(). Update the callsites
in vapic.c.

In the process we can drop the old "OR the page offset back in"
workaround that we had for when cpu_get_phys_page_addr() returned
the physaddr of the page base rather than the exact physaddr of
the input virtual address.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/vapic.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/i386/vapic.c b/hw/i386/vapic.c
index 225f19a75c..781bf2a7fa 100644
--- a/hw/i386/vapic.c
+++ b/hw/i386/vapic.c
@@ -161,7 +161,6 @@ static void update_guest_rom_state(VAPICROMState *s)
 static int find_real_tpr_addr(VAPICROMState *s, CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
-    hwaddr paddr;
     target_ulong addr;
 
     if (s->state == VAPIC_ACTIVE) {
@@ -173,8 +172,10 @@ static int find_real_tpr_addr(VAPICROMState *s, CPUX86State *env)
      * virtual address space for the APIC mapping.
      */
     for (addr = 0xfffff000; addr >= 0x80000000; addr -= TARGET_PAGE_SIZE) {
-        paddr = cpu_get_phys_addr_debug(cs, addr);
-        if (paddr != APIC_DEFAULT_ADDRESS) {
+        TranslateForDebugResult tres;
+
+        if (!cpu_translate_for_debug(cs, addr, &tres) ||
+            tres.physaddr != APIC_DEFAULT_ADDRESS) {
             continue;
         }
         s->real_tpr_addr = addr + 0x80;
@@ -292,6 +293,7 @@ static int update_rom_mapping(VAPICROMState *s, CPUX86State *env, target_ulong i
     hwaddr paddr;
     uint32_t rom_state_vaddr;
     uint32_t pos, patch, offset;
+    TranslateForDebugResult tres;
 
     /* nothing to do if already activated */
     if (s->state == VAPIC_ACTIVE) {
@@ -305,11 +307,10 @@ static int update_rom_mapping(VAPICROMState *s, CPUX86State *env, target_ulong i
 
     /* find out virtual address of the ROM */
     rom_state_vaddr = s->rom_state_paddr + (ip & 0xf0000000);
-    paddr = cpu_get_phys_addr_debug(cs, rom_state_vaddr);
-    if (paddr == -1) {
+    if (!cpu_translate_for_debug(cs, rom_state_vaddr, &tres)) {
         return -1;
     }
-    paddr |= rom_state_vaddr & ~TARGET_PAGE_MASK;
+    paddr = tres.physaddr;
     if (paddr != s->rom_state_paddr) {
         return -1;
     }
-- 
2.43.0


