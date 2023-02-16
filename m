Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp540279ejb;
        Thu, 16 Feb 2023 06:23:46 -0800 (PST)
X-Received: by 2002:a05:600c:4e43:b0:3df:e46f:c226 with SMTP id e3-20020a05600c4e4300b003dfe46fc226mr4975822wmq.16.1676557426573;
        Thu, 16 Feb 2023 06:23:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676557426; cv=none;
        d=google.com; s=arc-20160816;
        b=EoHUqvx6HNaA0veOezg3/jEOCUXPsMicpsnDEpBmsA/cldqxX0/BwYTmO9B0u+RLR4
         9b2MLH1D3+giJlWFpiIAx3GcvyvupO0yzVaO/t3tyQzIa3c+w3pFMjN8+jxc/kkSnwHT
         0zbV2b/AT4G43BJQeoz5VuPBRiegIkRTNqvBhIG0m8k/kQMNWh/OyoHdORn8sZXv+hgt
         9T8xXxmReC87i84yfHuzWuFFp0z9hlyfovoW6IO+6KsC8dqaTVnlMVWh/+ox8o1lMVNh
         bTv4dPOnQsg4zfXnN/SkdJBkXK4JFJLx77zPt+9lhhrpYzq8+U8vZ4510WNa2lWJeTD0
         BGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JNh8xTJOWod+s7ucBgmNWDci6dZ45Cp+WXSSHvSLoZ8=;
        b=ldJUoQ70k0v+JHGgp8KbdGBEzRaIqWqOLMIxt+JOvc6FTksStju0gAa9vnSn7mhqV4
         PKwcMmY+93t5BJiDUoH4TAaneWMHvaTBqAK3HN0+EHvixS1JmFBwlxFhdsm6O7cPiJqO
         EVTouQfJt2hCMGIQqdgba3rPvR7hBuEp1JNu41d7CoCIs8v0o7U1S1azI5ZWAaH+kG9f
         J3nu2ypEBAeGAjZy0PCpu9mpflJL61lKRfKBAJ4BwzGxKeSDEAU9eyLl//6uQu5jnkf4
         lacs38urcanBP5N/XSVP/uvUNqkywvIPVCw2HzfDrMSbCj/s6g1TuHaMXrp8WcThScxb
         NUbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tiUpkAAc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c15-20020a7bc84f000000b003dfeaafbb83sor757917wml.29.2023.02.16.06.23.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 06:23:46 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tiUpkAAc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNh8xTJOWod+s7ucBgmNWDci6dZ45Cp+WXSSHvSLoZ8=;
        b=tiUpkAAcnadyQJ+dVkubzde61bStnA0Kbi3UuyGWDQtEL6yLFqrBOH0YNEIXCeG2/M
         Y0ImUy3irOA9xnWN7wtRCpZ9wvqkgEm0ktfjlLCPHuXbNuuM03m9noxAnscZp7byCftz
         /vR0ZVULZUZbxg4dVuJP1WA4lJ04y4gUMi6fmzg4dCoa++Ir2Itb6A4Z06NG3iORGtCh
         24xIw7Hih7PmTbInUMPTtmACsstE5YJ2d8lhm6J54YzCr0gg0lxImnFJ193b3I9YRal7
         07/NOPhzbMMaFH9DORST7s/FRijumX0Ze217GCFHSxg12cxUcDCnKZ7n51Y15njjuil2
         RwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNh8xTJOWod+s7ucBgmNWDci6dZ45Cp+WXSSHvSLoZ8=;
        b=XVbUBdfI/2ximIZHkV5M4jKw0CZ+tavyOVayFg29qowb2wgr5JfOmuVyIOwHnJ8t4G
         juQl+LiWdq0GunCyWeYmEx0JK7i4GkUgTHMzEKRr33EJhyLFlM7eICxYvlb6T2sim13J
         SoyfZRoSqVnPzLI4iJ4Xr+vfLgyBS4xS4KT3MzHUsdDwTi2y3SlTG5TjdO8iMKb/JPM+
         8SWNtxKGv53UtPRNDlCXPH8LceEIYw/wPXXpOFn0krpJ2ueb3/ypzJrUa1HC9X3yvShM
         NoeEURWWeQgZXbhJj5UuAw/xYUjEw6jnqauVO5csQJc5H0cjJGsL+zde/RrWgXo19aWO
         Ctng==
X-Gm-Message-State: AO0yUKVYDilCNewUoCe7/YDDpFHqainec/z8OIjJcR+Wcp/Jo1ltHZ77
	+Ye+x3VRWiwJrrfyy3fMG53X9z5x
X-Google-Smtp-Source: AK7set8/mydYwX5wqEN5PJShPmAcaNUpSAjGQ23UJXmnCPwqodWLrCMYM+/CuCdzsBDiastEQkQulg==
X-Received: by 2002:a05:600c:91d:b0:3e2:668:3ed7 with SMTP id m29-20020a05600c091d00b003e206683ed7mr3871662wmp.1.1676557426291;
        Thu, 16 Feb 2023 06:23:46 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id p15-20020a7bcdef000000b003e21356bddcsm1966221wmj.33.2023.02.16.06.23.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Feb 2023 06:23:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Dapeng Mi <dapeng1.mi@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Bin Meng <bin.meng@windriver.com>,
	Zhuocheng Ding <zhuocheng.ding@intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Robert Hoo <robert.hu@linux.intel.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Zhao Liu <zhao1.liu@linux.intel.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 1/5] hw/cpu: Extend CPUState::cluster_index documentation
Date: Thu, 16 Feb 2023 15:23:34 +0100
Message-Id: <20230216142338.82982-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216142338.82982-1-philmd@linaro.org>
References: <20230216142338.82982-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zYMXrcqXVWjB

Copy part of the description of commit f7b78602fd ("accel/tcg:
Add cluster number to TCG TB hash") in tcg_cpu_init_cflags(),
improving a bit CPUState::cluster_index documentation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 13 ++++++++++++-
 include/hw/core/cpu.h     |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 19cbf1db3a..654aeec04c 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -44,7 +44,18 @@
 
 void tcg_cpu_init_cflags(CPUState *cpu, bool parallel)
 {
-    uint32_t cflags = cpu->cluster_index << CF_CLUSTER_SHIFT;
+    uint32_t cflags;
+
+    /*
+     * Include the cluster number in the hash we use to look up TBs.
+     * This is important because a TB that is valid for one cluster at
+     * a given physical address and set of CPU flags is not necessarily
+     * valid for another:
+     * the two clusters may have different views of physical memory, or
+     * may have different CPU features (eg FPU present or absent).
+     */
+    cflags = cpu->cluster_index << CF_CLUSTER_SHIFT;
+
     cflags |= parallel ? CF_PARALLEL : 0;
     cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
     cpu->tcg_cflags = cflags;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2417597236..d427db0bc7 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -272,6 +272,8 @@ struct qemu_work_item;
  *   to a cluster this will be UNASSIGNED_CLUSTER_INDEX; otherwise it will
  *   be the same as the cluster-id property of the CPU object's TYPE_CPU_CLUSTER
  *   QOM parent.
+ *   Under TCG this value is propagated to @tcg_cflags.
+ *   See TranslationBlock::TCG CF_CLUSTER_MASK.
  * @tcg_cflags: Pre-computed cflags for this cpu.
  * @nr_cores: Number of cores within this CPU package.
  * @nr_threads: Number of threads within this CPU.
-- 
2.38.1
