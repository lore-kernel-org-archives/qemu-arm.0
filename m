Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444443njb;
        Tue, 10 Sep 2024 15:16:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWR7jUWXLrprUVItLk3P1C4XbXq7R3Geth56Ce0Y7nIUQzQTvV9XHHRBKfjDk/728q8PiJ84s6/EpTYMA==@linaro.org
X-Received: by 2002:a05:6a00:91cb:b0:714:2881:44cc with SMTP id d2e1a72fcca58-71916e4745emr1073077b3a.10.1726006597046;
        Tue, 10 Sep 2024 15:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006597; cv=none;
        d=google.com; s=arc-20160816;
        b=bW333ALERKg9DLTqtUAHPcv4082MLJm7rsi3pF2K3GgpfCMZGgys0jfFP8aDu6nosP
         t02jgYs35gqKPBPm/yB7mu6hDf7RiCNhOYehjtXK5kChd6l63N4RzObS8Hw9mBSnoFFb
         3Bv3lq3TACSWZ9UQsFVkf/kB0SIWPwlGcQWh512MYLk1P9rtIMWevInVWW04Pt0FIWBK
         /+MxYJXstXYLfmMRoovaYh4ByMAiQ46UCmFRtjT54aDz+8UNGTLQuas9C0U408tXz9ik
         bi+9FwS7TuKpuYdGbUWN9ZAVEXu+8TDHFMI2asazjUHv2jkG9xCSfVMW4sr0t0GW/Q+2
         1SjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YnSUA+ALMkkUgp2nZaPD+gGHE2tL17OL5Bsrx2xXh8A=;
        fh=RYY9rQ2DxG+9liMoHboqY/lZ2sgljcsaT1eybmPbTck=;
        b=IQXPAsO4BRMWnXSgblz89JMuzf7zNhWnwemVPZL9NMluR7xJaQHTotEwmMUBPgde2X
         0NYzHGum+5FB2Szar2iIOYDfhtZ+8Le/kKrug7i0Plh6WC12GtUrXN4gs56OGrpmZJGp
         aQWDyAKJj4u41dRo98uhfWzFmHbHxmYNnBr/iO+9n0K+xquxqGa55IHXCFGVlvRyF38P
         6uDBln7X6Z68JBB1JY3wvTXz/irszNu7t/QskSx9uJvgNc/77won6WxXrpFpdgnVI38m
         IyPmKwBNbZtuywMRE0A4wsvq+tzTBe2fTXivUaTl62ifbmxNGVInRSsXNUm7IbcW7gin
         z0SA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PhsEE2fh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e598aa3fsor4627268b3a.8.2024.09.10.15.16.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PhsEE2fh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006596; x=1726611396; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnSUA+ALMkkUgp2nZaPD+gGHE2tL17OL5Bsrx2xXh8A=;
        b=PhsEE2fhSwWwSWof9fPDPPNcplq9+Yr4UK5v2ZkXODG1kS2lonsOzjv76QaHS6rdOM
         BRCK6p+ok/kaaye6vj3tmzseZF5F7a6SpqulqjXlVTBRSpsL3L0UReiiiMvaDl7/Bdl2
         XKQcdWzThzvwsUXLTeGhqsbzTBZPMyKKM5glNXLn0W7RtNBWdbtU4hAGdw0ZhXq7n9jI
         Gggks3JjrgwvpuJ92WDsCwkjJfo3EcLGH6bgNe+aj+3DD1zqPwI0G89ynEa75mgAAJxl
         7eJI5ILLHfgwWvVmgE5e8E5BucUNlXPOmfztE/AcU6LdVG61rSBtdXFHFcylUiH8qfyO
         6llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006596; x=1726611396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnSUA+ALMkkUgp2nZaPD+gGHE2tL17OL5Bsrx2xXh8A=;
        b=GJPnHQuZepAFbdNbhG39kuP7gWSf17rSBDVmtvxSs/3/LUBQdx86f1zoKvymeHZWm6
         Zf+lmaIvG+mbPobhXi4pb0JqghjIVvYlS1C8KEpTW+bT03N3dnRyv0RAWFL/Rl++XmSg
         1ZHE5Iiqsx/mWDktLj6HGB2/lCsBUGZjBGPjeegLVk1jMj08XDLhEbwpbDTP2g+1VBvV
         MMaX9ktqQMflz5bHqi28hmooWprKJRrraEhIlQfl8UkTztp3ePwJCGsgx5YP9Q8TbfKc
         ciZbJ7bshokzGHmbdAl4bV7N/mcDQFRgcjD58q9+VXEHb5X2kfeT3NR0gfhHd+A+xhOV
         1waA==
X-Forwarded-Encrypted: i=1; AJvYcCWVHx06taC1BIMf2eWAeeE4Qjp0QOvxzv+3X6UB6BXlvtUpd6BlMRXBzg7hdyfAWr2IH2Yq+XepSL/4Eg==@linaro.org
X-Gm-Message-State: AOJu0Yy1MiGqvS8ibd0P7M1+egaxt9TD1zsW4ozaRFvQBuu1WiWAYwsr
	4W5Ar6riapIzbk/WW19i9OpTGBf4Sk8vsz2QoSw9N0Dqwlk3xegMb+tIhjulTZ7SPw==
X-Google-Smtp-Source: AGHT+IFDzIZM3DP/M5OgAw1eZ3RYHrodZQmKcteQvXWpEmdrDFT50vvYruksRMQadCg93cKWdz6IHg==
X-Received: by 2002:a05:6a00:4b46:b0:70d:2725:ebe4 with SMTP id d2e1a72fcca58-71916e7a2a1mr1263422b3a.13.1726006596413;
        Tue, 10 Sep 2024 15:16:36 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:35 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Corey Minyard <minyard@acm.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	WANG Xuerui <git@xen0n.name>,
	Hyman Huang <yong.huang@smartx.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Ani Sinha <anisinha@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jesper Devantier <foss@defmacro.it>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	qemu-s390x@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Helge Deller <deller@gmx.de>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Xu <peterx@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jason Wang <jasowang@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 11/39] target/ppc: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:38 -0700
Message-Id: <20240910221606.1817478-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7IqQJC1NTdvB

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/ppc/dfp_helper.c | 8 ++++----
 target/ppc/mmu_helper.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 5967ea07a92..6ef31a480b7 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -249,7 +249,7 @@ static void dfp_set_FPRF_from_FRT_with_context(struct PPC_DFP *dfp,
         fprf = 0x05;
         break;
     default:
-        assert(0); /* should never get here */
+        g_assert_not_reached(); /* should never get here */
     }
     dfp->env->fpscr &= ~FP_FPRF;
     dfp->env->fpscr |= (fprf << FPSCR_FPRF);
@@ -1243,7 +1243,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b) \
         } else if (decNumberIsQNaN(&dfp.b)) {                  \
             vt.VsrD(1) = -2;                                   \
         } else {                                               \
-            assert(0);                                         \
+            g_assert_not_reached();                                         \
         }                                                      \
         set_dfp64(t, &vt);                                     \
     } else {                                                   \
@@ -1252,7 +1252,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b) \
         } else if ((size) == 128) {                            \
             vt.VsrD(1) = dfp.b.exponent + 6176;                \
         } else {                                               \
-            assert(0);                                         \
+            g_assert_not_reached();                                         \
         }                                                      \
         set_dfp64(t, &vt);                                     \
     }                                                          \
@@ -1300,7 +1300,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,          \
         raw_inf = 0x1e000;                                                \
         bias = 6176;                                                      \
     } else {                                                              \
-        assert(0);                                                        \
+        g_assert_not_reached();                                                        \
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
2.39.2
