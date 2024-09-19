Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161279njg;
        Wed, 18 Sep 2024 21:46:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwB48uBtY5PmUFNrsTNFH1UZc061OafD/91sca2R6rHNSS0oFemvYhqLO6lpW2A8PTjIKNJ0ZwNtAoAg==@linaro.org
X-Received: by 2002:a05:6a00:2e11:b0:710:bd4b:8b96 with SMTP id d2e1a72fcca58-719262077e3mr37711626b3a.28.1726721219069;
        Wed, 18 Sep 2024 21:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721219; cv=none;
        d=google.com; s=arc-20160816;
        b=zBct25W97cjYXeZfGNOqRYhqGi1sq0Aqz/P0CSqymW7r3LXBgd0b/h+RPaumvphqHs
         5iMQE6LAeyyxu7zK6SgAlXpttc5O8/zmITGG1i+kOF4TQf5Dh+GfUCjojCvvejKlTyDS
         anSBC1mbUaNsw60yoq8FBz0iYx365L0DCYnqYq+NY2toQ9eW9t83Sp/b1upkT9h5gKQA
         x8IZZL+Pn/JeBjpbbrzecpIS4OrDbvhbXOTKDkiBvNTPirmQKhcyTzU+T/i0X2QdvijY
         4kQYdgKT892lpYfjRlO1WWxPecmCaMsXZqiESjxfh6UpJZjY1wa1O0aoMdNfIVQbFv7Y
         mHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qqlshtAdWrkwK7VFTA+7O6AV+UQemh0VvOj30SlF0fo=;
        fh=zVKCs9OCHp7/wxf+yJpfOyIeucUbMiTFA8n9LwjHiOk=;
        b=mgym7yvc+hOxXLX8C8Z6Xe46QECQUcWVrsCzomLwn14FGxaZ5slb7nzri9pXAYR/XR
         gVzPjd02b+4TE8mlNfw2zKnIsPRIS5WUARjLOBV2MITDy4hwLyzzZBBbWlC7BnMPT8CR
         BnI5ZQxy5Pkgz+PsMnJ0Mspuxdkj3pNrMzk8H0jbTgbp0BdXzWnvocYIttStBCT1SA57
         dapiqARCzU0yc2lnlJkpqzeYkGZp8Q2K/HcY5iIubfbWz31Kj5TlRIPUSjATvvmgqWuU
         fAEPG/aVSUkIMXWUq0isFIsjLvrFnrlkpJsNO4Z9STVCxp60KvWnwWU349r0H+X7SXFA
         gddQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TZFw9Z6z;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71985ef50adsor2565338b3a.7.2024.09.18.21.46.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TZFw9Z6z;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721218; x=1727326018; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqlshtAdWrkwK7VFTA+7O6AV+UQemh0VvOj30SlF0fo=;
        b=TZFw9Z6zG4JywBV2/PcU0fFpMuvq8KLHx36nxx6SiU4i002lbb6yDAsNOyz7n47u2d
         m8SfaKoARiFsTxIOv0Xse3wsT54kgDn4rkrqkq7mO0EqQzGdZEDDVUrMaNo8O3uVrjwX
         WmylFcsAtRGpCAI1WaQ8q+i7Fq+y912yccLxizc7UhGvzEnQwc5sPu+gZqybf2vDXAP4
         Zq+9cRsaKd7dSugJFjN8gqZbcDgPxYc7tMlyg6QQ/iC5O6cii3+UfovuEFU2Si1a+woV
         7vuoatky2Lrxo8iq8OtoE6u0nlKkjwnExBuvqfz1gC8jnqIoXhGu8v0xQujyAo3VxQ0O
         +ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721218; x=1727326018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqlshtAdWrkwK7VFTA+7O6AV+UQemh0VvOj30SlF0fo=;
        b=uQ1T1aHsqBMRmKTrN5SB/CgcvCR6jZhq2qbQ7mMmEGar3+4sNf3PEs08nc5VwqTvnf
         8TdldJRJQw7Q7PvYk1slpmzdN9QpMIH0yRl2umNanYcpiU7FXg25Iro8wsE+5VwbHMLU
         u19MIcutvF76VIYXbFTdFICyk+tW1tC/TS96eHDYNXafEBkDfj1QGyioSfzgyH/wWcqz
         ClReEyjXbWoyZajVWRW3wR9l4OJX3P5w/8jAKPWziLMr49WN7HpIW7YE/S2yfzhOS7k/
         xqT1TcYjHvcuL04FLoYJpVfceOlDYuYnIHk6r8yhIbmAvzxMNhSW1SiZHLqhPWRnRX+g
         HBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEXlnJHzRTMMGd5fV+NlV8ZHBW+LyxI6oo0JoePgAM5bBrcdRRH+JG/T6PATR/f42aghdqCl5Uw10now==@linaro.org
X-Gm-Message-State: AOJu0YweEsOwXs+Mje1Znjys2Wd7tPrNzD2VLALQ4GgNIDQMCKEQ/i/U
	WNC4xKU9GspTFennSROSIAojOBS6Cd5reYUet7NvDzTF8nWEjsc1iPT9hyf6rbYyaQ==
X-Google-Smtp-Source: AGHT+IG0bmr1+1NNMTp9lkGEAqdgH7QtfGqFeAcXE6p0/9GQ6ISEzkrmQKWYgaOl03thN+dHJUIl8w==
X-Received: by 2002:a05:6a00:2d11:b0:714:2198:26a1 with SMTP id d2e1a72fcca58-7192620d8d3mr36118214b3a.27.1726721218493;
        Wed, 18 Sep 2024 21:46:58 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:46:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	Bin Meng <bmeng.cn@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Corey Minyard <minyard@acm.org>,
	Laurent Vivier <laurent@vivier.eu>,
	WANG Xuerui <git@xen0n.name>,
	Thomas Huth <thuth@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Ani Sinha <anisinha@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Keith Busch <kbusch@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-riscv@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-block@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Weiwei Li <liwei1518@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Jesper Devantier <foss@defmacro.it>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 06/34] target/ppc: replace assert(0) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:13 -0700
Message-Id: <20240919044641.386068-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XikDFAoy++9k

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/ppc/dfp_helper.c | 8 ++++----
 target/ppc/mmu_helper.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 5967ea07a92..ecc3f793267 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -249,7 +249,7 @@ static void dfp_set_FPRF_from_FRT_with_context(struct PPC_DFP *dfp,
         fprf = 0x05;
         break;
     default:
-        assert(0); /* should never get here */
+        g_assert_not_reached();
     }
     dfp->env->fpscr &= ~FP_FPRF;
     dfp->env->fpscr |= (fprf << FPSCR_FPRF);
@@ -1243,7 +1243,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b) \
         } else if (decNumberIsQNaN(&dfp.b)) {                  \
             vt.VsrD(1) = -2;                                   \
         } else {                                               \
-            assert(0);                                         \
+            g_assert_not_reached();                            \
         }                                                      \
         set_dfp64(t, &vt);                                     \
     } else {                                                   \
@@ -1252,7 +1252,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b) \
         } else if ((size) == 128) {                            \
             vt.VsrD(1) = dfp.b.exponent + 6176;                \
         } else {                                               \
-            assert(0);                                         \
+            g_assert_not_reached();                            \
         }                                                      \
         set_dfp64(t, &vt);                                     \
     }                                                          \
@@ -1300,7 +1300,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,          \
         raw_inf = 0x1e000;                                                \
         bias = 6176;                                                      \
     } else {                                                              \
-        assert(0);                                                        \
+        g_assert_not_reached();                                           \
     }                                                                     \
                                                                           \
     if (unlikely((exp < 0) || (exp > max_exp))) {                         \
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index b0a0676beba..b167b37e0ab 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -316,7 +316,7 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
         break;
     default:
         /* Should never reach here with other MMU models */
-        assert(0);
+        g_assert_not_reached();
     }
 #else
     ppc_tlb_invalidate_all(env);
-- 
2.39.5
