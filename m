Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161431njg;
        Wed, 18 Sep 2024 21:47:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiafsEUpssh748rGUhiIHiyiUCKwnkKVPoSJP3AyaEoWu7ZSJG0N4a72bInu2PmwPo+i5v4CeG56tCyg==@linaro.org
X-Received: by 2002:a05:6a20:cf8a:b0:1d2:bc8f:5e73 with SMTP id adf61e73a8af0-1d2bc8f5fecmr25249182637.38.1726721250259;
        Wed, 18 Sep 2024 21:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721250; cv=none;
        d=google.com; s=arc-20160816;
        b=I7wjoVisQkisSwgYbRIfZWdhCp9AjqDG5WxqaXM/k8/1lA4A4Fp4ir1wfBsltuazod
         L2FMcWE/qy4ke2N1MOVEI9VMUTZ3pKKJUz3Wv06PNx7BaKhe06nBc8j9ArqLz5ectxvF
         BfWqnlfQzWNSOHF0hZsJVwJKh2E+h7mT3tucONiEcKCUIbMUgr04XCg7KvcMsaYixIWv
         kaN2bCXalRYAfUguA0zI11Wfo90kJlMm+x0dqc3mb7JY8pc1jXmu+NW1ZlwBmMWAXnEF
         T5vYT9ItgQkTvshcI6TSQd7+g7giR/+BtEdpEubJ5AgsMAMR2JPJWzJDHthBUvzzItOj
         rOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=l5Ewnrr/qjz52ggXP5z2OAFJ85TodMlAQJmzdk5fJ2U=;
        fh=a1jAAVHxBpPVqGoMgXvMQ97o57VXK5PiY44CmjJTVbQ=;
        b=fO6DrKKCo7LOK0q1VstlUlgVO4d7IaJfb+vR9jVar892CGUmS+8QyJ+o4kziEdTfUr
         iyIAfXX7azFuD6ea2AgbeJKjCopWkQwmpzcxhzrVM6l3WddPseaJ05m2VFJi8ZT/yGLu
         ZF8wESS4Zhc2xpi+ozhhhnBjhzySBf+HUihOpoSXDyJ8SokGtuePLcnZ3Cfp0qk8ml2J
         SrUodUsuzcSIOOJb+K/S3EPTn448TC4ARRgefAjLQSdywmboED9w0aMAlAoSIoHaSPCD
         rzIYHeCupa83j2dtY8wnftB59tVTMOjW8CWdUfwTqABIgSWcUCJ4HH6DqQwVk0jnijQd
         ERIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sdURonGG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944a992ddsor6634856b3a.1.2024.09.18.21.47.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sdURonGG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721250; x=1727326050; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5Ewnrr/qjz52ggXP5z2OAFJ85TodMlAQJmzdk5fJ2U=;
        b=sdURonGG0AtyKO8hn+5/LCdfNPYRo/vZVsGZPqFo40ydUTcuiFxTtHT5urwA1PnN5o
         tgWyC1p2VTMXjRjDnbXimVsERKcx1EHWP0tHFEpmA8H9EECldvqdHjQ0iS2FSKO6RK/+
         XON6D2HBCnNdMay4NvIrVsyMveV+Sm4xOqdomm0GnGChcnrq4b4SYmVAzj/fCAsVXjoi
         3E4ZU15T83co1K223lFFRymJZj9EMGPcd6PIqt1QwPhtyAMJC8SEQOdALNh+jNht1EB8
         Hrrej3KqtQldq3Y+g748dq2VXxo9IFXwKhcjPkzOAwKp02cPhfQejK5xiyAwAD+/TF0x
         7deQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721250; x=1727326050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5Ewnrr/qjz52ggXP5z2OAFJ85TodMlAQJmzdk5fJ2U=;
        b=l0TmfLjatqkK6qIeaIvUXML8H0TEjIE7+6ezH+p74vyE9Ncll5YVNzhSvg8nLGJMBW
         z7p4KJ7PUObSPz3Gv7tIyMLIwve37Yez5ejDxI+ZW4smz1iibyUaEmM83qJc38ESWeWn
         i9LWXwS+6y932Bw8pDfs4+53T/u2uIQOLvLcvIOacKT3fz6wAppZXpFYxOg77Le7fnO3
         VdYGQKnSDJl0e14pOkGs4Gc4b1bIt3kSq57LZNg02F/FGlDlWM4aONkvoI/VC5YOaswD
         r9uxCUT9SNeie5n1JzutgCrpG76ufcJp/KL5oCfFu1QobOadPxUyqykWTOpYLtoLAWox
         dMPg==
X-Forwarded-Encrypted: i=1; AJvYcCW0qX41wT7zo9VkiIiuqG5D2yzHf7GGtjQ9Xm5H0fqM0xlDrzjeu0fgwvcYwWzvaSe8/1WzwFBqXx7o1Q==@linaro.org
X-Gm-Message-State: AOJu0YwwCv1yPp3SgwZPeXXBWihJiel/n2pA4hZ0jvZ5YYo9sQo2cV99
	lOGMyoicwiLWgEYmgGb9ntR2cBGJ35sFt9WiHePOcJlmK6K3aL7MujWhImYCcMNvSQ==
X-Google-Smtp-Source: AGHT+IHOtMj/Kr5ExQ1Dywx7ERrNLhz2hVxVxQFKG+INI6zzOgF8wrQsA7qvcA3V9hiv+CFRCBs7cw==
X-Received: by 2002:a05:6a20:b58b:b0:1cf:3838:1ed9 with SMTP id adf61e73a8af0-1cf76239c73mr33120242637.50.1726721249781;
        Wed, 18 Sep 2024 21:47:29 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:29 -0700 (PDT)
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
Subject: [PATCH v3 22/34] target/riscv: remove break after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:29 -0700
Message-Id: <20240919044641.386068-23-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LzlQhwur60LO

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/riscv/monitor.c                  | 1 -
 target/riscv/insn_trans/trans_rvv.c.inc | 2 --
 2 files changed, 3 deletions(-)

diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index f5b1ffe6c3e..100005ea4e9 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -184,7 +184,6 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 
     /* calculate virtual address bits */
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 3a3896ba06c..f8928c44a8b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3172,7 +3172,6 @@ static void load_element(TCGv_i64 dest, TCGv_ptr base,
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 }
 
@@ -3257,7 +3256,6 @@ static void store_element(TCGv_i64 val, TCGv_ptr base,
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 }
 
-- 
2.39.5
