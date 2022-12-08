Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp462248ejb;
        Thu, 8 Dec 2022 08:12:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7p4bG0Q+Z6HqYgnra47KUvK/6DHAsvnXBqWWcUw+gkVOGOEyBMSzOgRp8+8vGgKziKe6lm
X-Received: by 2002:ac8:1099:0:b0:39c:da20:626 with SMTP id a25-20020ac81099000000b0039cda200626mr3418717qtj.48.1670515927526;
        Thu, 08 Dec 2022 08:12:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670515927; cv=none;
        d=google.com; s=arc-20160816;
        b=ACA2hf2e2LN+L3SvpYOFgxURIHy8a4fkdVoVqCvYNZA7gI6YCzx1+aHrzYG6QonRR1
         //PonLTIXdRJLrMMxvZj69pbbX0nAxnrMcqx+EBIlKbTD85cqTGs2Ta9AFYNGjTlP6p1
         1X4QU4Vsk0Oej4bdfr0S1eiokYz3aMfq0EfAh7MxL1YaLBBBBjCoZ/rH+CuTQ5TOTKVn
         cp3oTrN/p/coG611jL4GY99thxoo/4Cwtwq/KR8r1ay+nqXYK0++b2EvitfhrQBk2yOM
         QpHVXTd9vl7QcbHl1Y3NIcJ4gJ3UOPZYJ169/mgkxCewkNLduBAS0P6IJwd0WlOskIKU
         4SOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=HL8kBAmFQ6Fmcok8n57ZpvLDofuWd2hjqxNjJFRIOYY=;
        b=Jo9Q2t58t/MDR6tbFbn5VCVhkpwI5V7zeojCFLWudcj0AYwluvSiZSbFLU5NzAZWta
         9cKmyCMbcBXHt/JXJWip7enHRi9W+/QtWhcNBKaifaWmCcF+Ci1+1f1ktOOqPsMrKP+J
         j4cJU8yhCkvCB/Xk5M94KJA3NCWlacANmKm7P8FB0Bx/+7IocuB0707qpVu8p97SMj+i
         ZYlkKAmkxle/Us5AbgQBn9XVzd2BvuXbosUafZiGbHq7u5vAaq6rgrldCUFEStx4dk7e
         28mldMlk35EzUVRgREIBNHX0bG+PUFTwg8VbFXT4dKvAA+xrFsB1jqHQmcavZD5nep+6
         KMKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TgKfDERR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bt15-20020ac8690f000000b003a57645c04esi12607195qtb.590.2022.12.08.08.12.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Dec 2022 08:12:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TgKfDERR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p3JVA-0006tU-CE; Thu, 08 Dec 2022 11:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3JV8-0006tF-Ly
 for qemu-arm@nongnu.org; Thu, 08 Dec 2022 11:11:58 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3JV6-0005Xx-C8
 for qemu-arm@nongnu.org; Thu, 08 Dec 2022 11:11:58 -0500
Received: by mail-wr1-x435.google.com with SMTP id w15so2165552wrl.9
 for <qemu-arm@nongnu.org>; Thu, 08 Dec 2022 08:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HL8kBAmFQ6Fmcok8n57ZpvLDofuWd2hjqxNjJFRIOYY=;
 b=TgKfDERR5Ruo+uB+jlW0q0XtgDrpt7SdLis8DZxOZWDIET4fS9httCzSUGyLI1muBB
 wOH+0HuAwkLtQ7403nny6hrYLogzIsDKMqSfgMqidyMZoOCwyziQC/tjwEagtAaRwoM3
 g0oOg9R5Nllk0LmKybPwVk91dNBco5KEaB56ZFYa/XMCmuR+B370CSraOZTkThQDlV6u
 lP77C1hi4chBV63Jz/ozW/C+/UnYxKYVHutuWxcWKwwAQL+GYJBNS+gKXaLRuikvty1V
 CdEUTBmdgS5Xfu6e0KdSv39jmiVgqO3a3cGQlk8aC0b1Xd2oSzEgKsscrudb/+i3O1Kb
 dJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HL8kBAmFQ6Fmcok8n57ZpvLDofuWd2hjqxNjJFRIOYY=;
 b=FAULz5lH6ea67JI79T87PP0UVj0doHBry47ZKkJI0KKvXQHV6MKHIxLpbPYGa2RF3J
 fmJVZstA3TVmksCOcRhL8fNO04/RMt6OITz+YSydLzbshBUmCwdxRpQD+3sVhAkZgPcz
 k2wV1vtm9Q6n5Wb/9T1vqETJcu0xe9C2wmGitdSENamFAVuK9a2ELrzzSK2vhWRLZgrx
 JQZTdeBxQs4WJw6wEXk6gWci80atx8heRenVDsza3gp6d8GQcimjPVIRzE4Fs6jQG04b
 CgCGwuFwu+aeV416lzfZDG3eEWT765mYZfj4PjFEjY075jwzoi2vnH45RW/jyoubgmvc
 Pc2w==
X-Gm-Message-State: ANoB5pmaRLyN7mzu33hCHfols6liWp4gNoI9LDi1JTaxYFbfpTSpkSLe
 U8HQztoytMZJmISSF+CbkUBHZQ==
X-Received: by 2002:adf:fa0c:0:b0:242:1a1e:e074 with SMTP id
 m12-20020adffa0c000000b002421a1ee074mr1660506wrr.61.1670515914523; 
 Thu, 08 Dec 2022 08:11:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d424d000000b002427bfd17b6sm8323960wrr.63.2022.12.08.08.11.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Dec 2022 08:11:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Babu Moger <babu.moger@amd.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: [RFC PATCH-for-8.0] hw: Avoid using inlined functions with external
 linkage
Date: Thu,  8 Dec 2022 17:11:52 +0100
Message-Id: <20221208161152.28976-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: Z/dT588bFK3S

When using Clang ("Apple clang version 14.0.0 (clang-1400.0.29.202)")
and building with -Wall we get:

  hw/arm/smmu-common.c:173:33: warning: static function 'smmu_hash_remove_by_asid_iova' is used in an inline function with external linkage [-Wstatic-in-inline]
  hw/arm/smmu-common.h:170:1: note: use 'static' to give inline function 'smmu_iotlb_inv_iova' internal linkage
    void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
    ^
    static

None of our code base require / use inlined functions with external
linkage. Some places use internal inlining in the hot path. These
two functions are certainly not in any hot path and don't justify
any inlining.

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: Any better justification?
---
 hw/arm/smmu-common.c | 10 +++++-----
 hw/i386/x86.c        |  3 +--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index e09b9c13b7..298e021cd3 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -116,7 +116,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
     g_hash_table_insert(bs->iotlb, key, new);
 }
 
-inline void smmu_iotlb_inv_all(SMMUState *s)
+void smmu_iotlb_inv_all(SMMUState *s)
 {
     trace_smmu_iotlb_inv_all();
     g_hash_table_remove_all(s->iotlb);
@@ -146,7 +146,7 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
            ((entry->iova & ~info->mask) == info->iova);
 }
 
-inline void
+void
 smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
                     uint8_t tg, uint64_t num_pages, uint8_t ttl)
 {
@@ -174,7 +174,7 @@ smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
                                 &info);
 }
 
-inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
+void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
 {
     trace_smmu_iotlb_inv_asid(asid);
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
@@ -374,7 +374,7 @@ error:
  *
  * return 0 on success
  */
-inline int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
+int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
                     SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
     if (!cfg->aa64) {
@@ -483,7 +483,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
 }
 
 /* Unmap all notifiers attached to @mr */
-inline void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
+void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
 {
     IOMMUNotifier *n;
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 78cc131926..9ac1680180 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -64,8 +64,7 @@
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
-inline void init_topo_info(X86CPUTopoInfo *topo_info,
-                           const X86MachineState *x86ms)
+void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x86ms)
 {
     MachineState *ms = MACHINE(x86ms);
 
-- 
2.38.1

