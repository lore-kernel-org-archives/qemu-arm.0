Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161250njg;
        Wed, 18 Sep 2024 21:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkuA0koU3aos+PapCJ0Ja6DQhPUUFVw21avCRLKLMXovn6DMpPo6t8BilJd3kqJK46Mvssjk3JATewvQ==@linaro.org
X-Received: by 2002:a05:6a00:1ad3:b0:714:17b5:c1d9 with SMTP id d2e1a72fcca58-71936a2f094mr29304998b3a.1.1726721213383;
        Wed, 18 Sep 2024 21:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721213; cv=none;
        d=google.com; s=arc-20160816;
        b=B1J29e8i7S9R1LlKHvGLak0AvUD2udNgdXAFFS+JroSXTpktq6D+Xvr0jLiQLY7cKP
         UCipPD6vdyHEp+Wc9X4obquJbRM+bfEhbxWGcfuJnb1hmr6I/hpDYoqe1LvD1J3BGbAm
         7YxCmrRKYLbO70tS5LSliNvO9cN2ssohC8AZXUsuIHYsyuXEuPK6O2Vc5VZ4MnIRKgrw
         JFZtkf47IOHLQxzdH5xV/00m3B8QXe5X8KamsqSEHGIW6wnL8UW1ycNxWLVmeuJPR1v2
         LpS+6U64Rftjj4Ywu5k7OGe4MXbBkFl2sxE3t3nkUZoohMsfvnv8RGTGSk8Qy1IGQUQZ
         L3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0/2IU4UYdfrAjMX4NizJG5E5V51UHXtFH8CwKGzIrQ0=;
        fh=4QElcjTSpyynBvYTqXEzhYtmI/ew8oWtUybhKvuMrU0=;
        b=zhuwrbtdGg4oycvpIKGP1adGJKLOqK/QrwgUhxmbgLokQ3kqEiI+jcmefophfpyUlg
         hQ/cfInMDgmSazLTR0uEJTZdLCsJsAPMB0Ukx8FSt3PEHXsJ9JUOX+u6UNR6adP2uFP5
         g+AD6blcnaiao1Qg6qzDYr4usdp9/nTYu/zrIpzQ3buTRULhJMSWutRhhOJVCVhL/ZPU
         yNCU2kgmGvWMBRGtilkg3xdWnwmw5O2FZrxkilksI6gTcVE+KBA5hl3XcwTIxEuoRaOJ
         S105OdBJcYtUIxgcdvCF/XYcXe4ZIX10kVs1xZyGsBKgfrh1a59rAhZAHlkE9Kw9pylq
         2R4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xTMQejhk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944ac9bf7sor6683226b3a.5.2024.09.18.21.46.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:46:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xTMQejhk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721213; x=1727326013; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/2IU4UYdfrAjMX4NizJG5E5V51UHXtFH8CwKGzIrQ0=;
        b=xTMQejhkTZ5STtDQirXjV1/xfN/0YeCYHXbKW+hmgwmFUPjBKd+X7I3AP45M5LDEq2
         cfiOOd6iVxyOjz8YF0FBDD0mL1WU8VUj9VH2qlpTUvtOk4ccv218XirosB1gZvtmDMIw
         NJcYvNp1rk3ms2ly5K4pzdtvk3ff0OuG5OC/5oi+yKaoDzK5YUWmCVPCmURf/iIPa73W
         26h0A8MTchC3ovqYBtywindwupLdkNMM95s4p0x3yGVqGSrqd1XdBcI5mTEFoKn2APR8
         Fgu4Psk9q/lhCcp06RLHH/cGCv2uJyudXiMxgzE/o6UW3BHvmNIDvw+8r2bXzSgAT+M9
         oBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721213; x=1727326013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/2IU4UYdfrAjMX4NizJG5E5V51UHXtFH8CwKGzIrQ0=;
        b=EhZxxNns8Irb3NsWOmkWBziizyVUGMH81iHxrYM6jmN1jUm0s2OjVQe/eBoDYKfEWa
         hvVsh4dWI1lHDTSQx8A8crpq1YdetFRpYU+vMB4yrpofojLtzEcD+L1rmtt7FBKQ65aT
         dWfQcvOiRBX61eJi1N/gqdR2LM7CwUHHkICqxC8I2D9VIhdBJYC4snRZSabBlrbZo7/f
         lw/JZ/6Xtdn8v8/9ZEYqj/MmCwEPHD+TdhiB/E7nNnddlTHA6FmgcwjuYjr4AexiAvH2
         L0i6eJvAcnZ9yOBusKET+TB8/3d3nO6979t59+IzJbfwJWaJZeXKkYI2Mbpxanivca8m
         NX+A==
X-Forwarded-Encrypted: i=1; AJvYcCW4MXSnXLJf2TuNZNZXpzYf2mO7F6It1915eRIKCHsRA2PdvJfa+T5OzGRER4G4V8p1/QuPhRFHDPVDHw==@linaro.org
X-Gm-Message-State: AOJu0YyyeGLuOfWevUpIwMXAnWpNN1vWtmf6r+S2N7ml+7t9eEUIw2ZG
	ywMTbrhp+uuCW2z9i3qHy1spFPaXqj99XtiUipmohURBCC8Y+TamBjvdgLyO0xYgng==
X-Google-Smtp-Source: AGHT+IEcE62Tv8QknJc8pTjVPHSXUbymb6AaYmeRJfTOhBz1uvzhH2wZstAOj+tMDYx/X/qUzXsWew==
X-Received: by 2002:a05:6a00:3c73:b0:718:ea84:3e50 with SMTP id d2e1a72fcca58-71936afb98cmr25001957b3a.22.1726721212760;
        Wed, 18 Sep 2024 21:46:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:46:52 -0700 (PDT)
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
Subject: [PATCH v3 03/34] hw/net: replace assert(0) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:10 -0700
Message-Id: <20240919044641.386068-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nZ9T8/ubATjT

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/net/i82596.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index 6cc8292a65a..cd416a00ffa 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -282,7 +282,7 @@ static void command_loop(I82596State *s)
         case CmdDump:
         case CmdDiagnose:
             printf("FIXME Command %d !!\n", cmd & 7);
-            assert(0);
+            g_assert_not_reached();
         }
 
         /* update status */
-- 
2.39.5
