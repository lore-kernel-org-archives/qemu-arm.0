Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D0ACEACC1
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:11:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK08r-0001Cp-Uk; Fri, 14 Nov 2025 15:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK03M-0007m1-Ed
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:05:54 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK03K-00054m-NU
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:05:52 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42b3c965df5so1575135f8f.1
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150748; x=1763755548; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4jVZL+EPfNSiEcUqc0mMtti7iz45SaUWfxueOvD5pC8=;
 b=PeZilM/uKaLX7BK3QMbtcpDeVRTgzGYPhMRToZ5NT1OSSsuS7BS6GYgX6n+Tu7S6Ci
 r1ziBkbdIYRjmjB/So9Hx8l781B1gwM3nabgZTrGI375L4nL/Z2FqdP8ZTdkONMtAjDU
 fZrrzDwqu/7xJzj4px34c49mQdbIp0n5rtzFjWxbxNCJ0ddj+jfO74KaHqW+7f964P/Q
 IkZmmIjT3/GqD2fJZQb95KGoimgnOuVac6WuCe7C5NDYzLQX3LD/pbZJXqwknOu//OHX
 hF3N5j75jaNy6tHAAUGQWG/g/DmdEXbN3WMqQJID4EOuQH1VDmzskiculdVsCrOCFW//
 EqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150748; x=1763755548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4jVZL+EPfNSiEcUqc0mMtti7iz45SaUWfxueOvD5pC8=;
 b=u/+DPekYYr0TkJWN3Qy3nT9GM0qjOy7DpvmM5jmRYDWexyh/ujMTsQKUsiD90x+cIZ
 qKLtKUNYmYcIJs6ajMf2B+iMryjtez0lxxodT5poAS8YRyloUg+EkQBcJg4yhz2w9Cpl
 kEWUaexANtpirVQvg+71yl3wy6DGfVQf4gDXX34QSZgEMRbOHANJyQAz4lvwuGVxqbci
 2TuMqZigeZ4YemcUCpsiYdcH2sjQlqMeHV9p+ouvoGFcaf85k4Rskcb3Y9E1mtOuZ7jM
 YlqKZ4XayVwLBGy37SDJIk2Fz91/Or3RH2LjF6dr3otG4eA77EEY/UGa3Oicb0+vj+Cn
 WIHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1m/9S13Mpm19Q9d6tS0hysYoQiqiOuERXEhLehVf4MwGv3XDwo0m8ieT6Z2ZDoTA2I5nsUuimUg==@nongnu.org
X-Gm-Message-State: AOJu0YxzdSwgeqOpoKWAAVXgHy/Ux44kpBSgWkkbVLv0ULJ7AYcbE63j
 FgR+JgB3vL6YWMUH0gQDmS9wrjPNZ+laMX+MAjIKDJIWytrGd7p973+RUOSCV6ZGT/o=
X-Gm-Gg: ASbGncsVoCsqSCw4MvjcXgjG9rIXx2CPCGOyAEBQ7qGbMnJrE3IwO8KVVmDWXLUJhFf
 xb54IH1TDik4Zkh99x59ipUyrNiE0uvECmnhBF5DOXTRTLwuRH1cN+IkX3UqP0/1B+2JsjooA1G
 iEg+XObwDyNLxpb5h8/RiGzI81/jecb5gzg7UY6Nlh+ZsMIuhAJ/rf5Vpm8NLqFwp19JThJVIDP
 xlHjWCngTFKedo8MX7xztHdGOCrIoFDBEcvJObmBLdI40BYAXu0Gjc0IihblFzmqcVC2cGMFHtm
 V1FHwp+RoeNbspJdW8ozCnIhqT72Kvl2O25p4HigLl5N4FZXHKXqYJBwAxXSB4rNCsoOXU8ygfs
 YxU+0Uy0ftLYWaLgHatdiorSPWUT9VsyuhhofdcmLSmoZlOcKq0eYjeqMsUFl2i9IOhZhFrrnBi
 2QkRbiTj/5vsbKReIh8qzRj+1rRrF/9fTPig67CQCastHwVDbO0A==
X-Google-Smtp-Source: AGHT+IE31UBENWH56bBFb/LwFIJ3Mu5Juk/lIMDKmufMAdYtBjIuDq375lsvdwCVy4G2r0k25sx9Bw==
X-Received: by 2002:a05:6000:22c1:b0:42b:3ab7:b8a4 with SMTP id
 ffacd0b85a97d-42b5938b4b1mr4063352f8f.33.1763150748421; 
 Fri, 14 Nov 2025 12:05:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e846afsm11942271f8f.13.2025.11.14.12.05.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:05:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Subject: [PATCH v5 11/19] target/arm/hvf: Implement dirty page tracking
Date: Fri, 14 Nov 2025 21:04:13 +0100
Message-ID: <20251114200422.4280-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Notice writes to pages which are being monitored.  Mark the page dirty,
re-enable writes, and retry the instruction without emulation.

Assert the fault is not from a stage1 page table walk.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 52 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index de1e8fb8a05..0f584b8137a 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1869,9 +1869,10 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         uint32_t srt = (syndrome >> 16) & 0x1f;
         uint32_t cm = (syndrome >> 8) & 0x1;
         uint64_t val = 0;
+        uint64_t ipa = excp->physical_address;
+        AddressSpace *as = cpu_get_address_space(cpu, ARMASIdx_NS);
 
-        trace_hvf_data_abort(excp->virtual_address,
-                             excp->physical_address, isv,
+        trace_hvf_data_abort(excp->virtual_address, ipa, isv,
                              iswrite, s1ptw, len, srt);
 
         if (cm) {
@@ -1880,23 +1881,56 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
             break;
         }
 
+        /* Handle dirty page logging for ram. */
+        if (iswrite) {
+            hwaddr xlat;
+            MemoryRegion *mr = address_space_translate(as, ipa, &xlat,
+                                                       NULL, true,
+                                                       MEMTXATTRS_UNSPECIFIED);
+            if (memory_region_is_ram(mr)) {
+                uintptr_t page_size = qemu_real_host_page_size();
+                intptr_t page_mask = -(intptr_t)page_size;
+                uint64_t ipa_page = ipa & page_mask;
+
+                /* TODO: Inject exception to the guest. */
+                assert(!mr->readonly);
+
+                if (memory_region_get_dirty_log_mask(mr)) {
+                    memory_region_set_dirty(mr, ipa_page + xlat, page_size);
+                    hvf_unprotect_dirty_range(ipa_page, page_size);
+                }
+
+                /* Retry with page writes enabled. */
+                break;
+            }
+        }
+
+        /*
+         * TODO: If s1ptw, this is an error in the guest os page tables.
+         * Inject the exception into the guest.
+         */
+        assert(!s1ptw);
+
+        /*
+         * TODO: ISV will be 0 for SIMD or SVE accesses.
+         * Inject the exception into the guest.
+         */
         assert(isv);
 
+        /*
+         * Emulate MMIO.
+         * TODO: Inject faults for errors.
+         */
         if (iswrite) {
             val = hvf_get_reg(cpu, srt);
-            address_space_write(&address_space_memory,
-                                excp->physical_address,
-                                MEMTXATTRS_UNSPECIFIED, &val, len);
+            address_space_write(as, ipa, MEMTXATTRS_UNSPECIFIED, &val, len);
         } else {
-            address_space_read(&address_space_memory,
-                               excp->physical_address,
-                               MEMTXATTRS_UNSPECIFIED, &val, len);
+            address_space_read(as, ipa, MEMTXATTRS_UNSPECIFIED, &val, len);
             if (sse) {
                 val = sextract64(val, 0, len * 8);
             }
             hvf_set_reg(cpu, srt, val);
         }
-
         advance_pc = true;
         break;
     }
-- 
2.51.0


