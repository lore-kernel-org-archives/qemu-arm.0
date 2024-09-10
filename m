Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444886njb;
        Tue, 10 Sep 2024 15:18:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXI3caQSlz8+dupTIPOhm76wY9EFXhJmIF4p7G9k6TELbRAdi4JeWBtVdjA2C5q+B44iz4cibdaEhHoZg==@linaro.org
X-Received: by 2002:a05:6a00:b87:b0:717:8ee0:4ea1 with SMTP id d2e1a72fcca58-718d5c311dbmr28603843b3a.0.1726006681865;
        Tue, 10 Sep 2024 15:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006681; cv=none;
        d=google.com; s=arc-20160816;
        b=b3Whi9rIKF2/oKYTROl0zOmpgx9q/Iu1Osu3ecEiA23NicDR//2Pp4EaBfk8yQv5hQ
         n58/tpTSjCqILiYS3MevyLuKgNB70wK4g8oFCtUeVp5z1XjrMSy9Ly1nl1H1CGKxkwvT
         ptA/59iC3pCxAGiC+37hHia70Lju8+tRR69/j4Y1Us0rt0V3iU5T/JQasN5i77bZSp2l
         xPqY6C6u7v2XuKQPMzVeiqMou0COutif/6gb9eTGV1t9JraNzgmSFCzr9FDyzN+cdRYq
         udy93G2y7tj9MbsfUlUbMnfAO4wmpBMXm0E84+xEP80Bl8r032X2jy770UAf5Tzs5TBh
         5tJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Nc9MGfuSCocWwKVEpmreZE3UNjtG/w4I6s0g9X8lNJQ=;
        fh=dARNq4O242rurCG8m5J9DKlH4D/8Elmmr/gJewoW/Iw=;
        b=IrUye8QU7zwOKfWNkVpjFqhgs2cDJbCeAMKhpKdJwVY8dJnErxeGEHlfyAggmTKbUG
         gCaXSu10GyTkCf1ZQUCNAjI2AeP3x+sW0q98CBr9iLfmC7Mso9xt1F+zwbZB6/DmGzcj
         j92tepKucs/XT0ABsaGU+S0YQRp+mMqI/+gknQJcUUA3VkNauTHCcF8KCShWE82vROf6
         B3wXX9qu7S6LgBNQJu5+Og8HqI4vq87Qd+KXwCKU1MWd5JQqqdoO/N/AFS6El8rBFYfR
         95iSbUMApT2nN+8Tq+J6HTaff6tcQKqj/hy00cqfE+9HpDN2ajGI+rhiHyuXzcO+kTGt
         Nhkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zsp40l7L;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e5899113sor7359968b3a.2.2024.09.10.15.18.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:18:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zsp40l7L;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006681; x=1726611481; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nc9MGfuSCocWwKVEpmreZE3UNjtG/w4I6s0g9X8lNJQ=;
        b=Zsp40l7LYixMnkCFpBsM48GWr971ca8YxOqCE++scKgGsE6j0gcAtBbKcMOh5jExgC
         HhibPt5ftyNMFUfph9ToVXrEDtj9c4afgmJ1ID3wiveRH7+b0webcJ1yh8KR+UGGNf0e
         5CF+lCrAvm4HkRxAjbVkb6NeiRwx9WVflY4BRfxwLeot5HP7yxWjuBPRCxmsmOjPbYFS
         lFUwqUVTwo0898HfiPgN7W5ugpf7ATKksv4aMRGb8FPEggC3LrXprDFxWvurVGRRYEAj
         zEnJtlPDrwJCn/wVdpe40Sjqm2lIqSx8V5w6dGbEqAzGBIlglqLUp18oQM4vU1eM00c5
         +w+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006681; x=1726611481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nc9MGfuSCocWwKVEpmreZE3UNjtG/w4I6s0g9X8lNJQ=;
        b=pX8UsSwC3ti5fU7CA7RWyBKRvU+TCWpwR8LdwpLUe5uXLSkET7FBcL+dq+uMOiPWzX
         Yb8tguFsy8n+sq60z7r9b6R8V1CkKaOQnH8E9CL1yBLpvGWc1PwKzrqSH1lyzsb2Td+I
         Dcr4R0VCzS5TwMX8hih1BgCwuOnWRwEgXAtFqrNKWxbyFZhz88VvCRVC9rErw+lA5Xgl
         cLOw4DTiRvfKZe8wZy2csr+NPWUH2oYD6JGLF8vR6EpKXTVq4AQ7Q57w20389QM5QnZh
         mwVwTUuElYSx93rp0pH8PsJHrjxicf5eBOEUmKEkd8DdNRy6TviHcAQq7R16rNYtxVaI
         y31w==
X-Forwarded-Encrypted: i=1; AJvYcCXh5U01vNdgqsSc1NAx2Nee8xE7S/+RCqMOAWHpSIktJGeuweJfKp6OO8IZVqXGTEhPyKl9NgNdTTt2MQ==@linaro.org
X-Gm-Message-State: AOJu0YyQN3gB8qUMwPcMODJ77w0Fz2EifFtRogCwSF2aAcJJ/36T4T0D
	FfZ9pxPiCeUybXHF8H4xDkuwyKBUYhQyhSLWzvdeiPsr9IDjqyBTPy0SIs/0bGRioA==
X-Google-Smtp-Source: AGHT+IEWKrlPdcL0ciOz6xX9tzB4Y5/ftvFt/m826lvbOpwq+zPCmtbQUUnnI0rtApLLAhne6XqzYw==
X-Received: by 2002:a05:6a00:919e:b0:70e:9907:ef75 with SMTP id d2e1a72fcca58-718d5ded0a1mr20600690b3a.4.1726006681287;
        Tue, 10 Sep 2024 15:18:01 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:18:00 -0700 (PDT)
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
Subject: [PATCH 34/39] target/riscv: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:16:01 -0700
Message-Id: <20240910221606.1817478-35-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8P+BECACs3FE

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
2.39.2
