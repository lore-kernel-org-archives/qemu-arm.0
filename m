Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422502nji;
        Thu, 12 Sep 2024 00:39:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWY7nTMLmwFfxNGa2a8hOPgMDNW+WUHRyX578BkhsX8ljLTwHdAe7C8G6oi371/Kq9LKGSmxrL6XxVoBQ==@linaro.org
X-Received: by 2002:a05:6a21:9218:b0:1cc:de9b:1ca with SMTP id adf61e73a8af0-1cf75efdf74mr2515809637.30.1726126779531;
        Thu, 12 Sep 2024 00:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126779; cv=none;
        d=google.com; s=arc-20160816;
        b=QsEzLARFEH2MyKaP3P13Tl+zmkTjTJxotqfdzHflGrZojhZov+ZSzQ0g7KRBvVKXKg
         rGHNJyTHwN82q/dnCwq1ctHDEcwooa6vAbxRcbYruIjBueGAghU3VqjO8JmuT8NYWBCt
         pzi7w4r4CcC4AktYw+oSu1sLeZVduTt81OeIrGhTJhENjC7nFrWo4zu2GiXD1P/ZOWA7
         BdBiki+wtP8ezDaDsWE/WiRMReGySxH14bUvHaBq2Aze+o8klrU5XLneusk14NpaeOMX
         4ZUPH2KmGjQoG1ebwWMJ2dqNEYbj8KcVkCmaK8MYx/kvTEAJ3Entul5dDX9twVkmq+XI
         Ri6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fLMdbuNc1S53EAbOcoLtqlHcp4TS6A8Qk4ILSrig2co=;
        fh=kqsyzB77Nm0VuPBoeVw5xUByiJAvV1rPiX1f+CX9p+w=;
        b=zeKkX7nHumV0kmi4ZiSNLcVZXqjVtB+qWav9BHRxHWOoTsYo8XoawVzWDVT0PgZlmB
         eNzfKeeCgHLu1FXNmrGuO9gPx4Ump/PTE+aCpucDEWYA2I8bIoPoVFOR4T9hhQYCjsxv
         7/FOVyAGTLU928NMCCmHBd/3ZgeqpoAN29ZkmVDqJeLE43RK3NEtjU57HTpNR9PFpT2j
         OPL4NOvZx3aXnMKJk8AIAjeQ7caDR21krN+cClzddt3E6DORKkYG77vljHZiSZG9cS1e
         vYaas1nQgtkzb2BHyq61xxPPaATYLzS0okwgH3mdV94RbOBC4V5JSoamR2hQ4uiQkpMn
         FJnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WF6vI3FY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e598b6f9sor6180954b3a.12.2024.09.12.00.39.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:39:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WF6vI3FY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126779; x=1726731579; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLMdbuNc1S53EAbOcoLtqlHcp4TS6A8Qk4ILSrig2co=;
        b=WF6vI3FYcHqeqAzczo6nDdO/oQ5mIdfk1ymrgfT7Xma9J5zGTqfaQ/+MmFL5194Wzc
         JDO/M+J+78w7Tl0IidkIBPmN67W0NTWsvuwq12yFlZelFCnTFUHYIK8zD76Egltyrvel
         7rpFWB1PJGDGEIykcbvWudSmVeEMoeiJx9Giv2D5mweFH6W4DM+4oJ/yNAPCiwhQC0Ke
         /MzItG73NToc5o3jGb7yQn5v5EWS+Z6R/QY+qhlwB5FzrkljzQXnn8+cguCtOsE9fDWp
         96xU87KWm5n17WShURroIzX54uB7NiXLd2tgTMQAs7qEx3sfnJEs6SDjCQw1SKwpWoWB
         yEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126779; x=1726731579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLMdbuNc1S53EAbOcoLtqlHcp4TS6A8Qk4ILSrig2co=;
        b=TufBdphdsv5h5KAUF/GMh1PYULPOn4yy96AjP9dtP/QqW6m4UuO42Wn5DopBiNzrOb
         nhwdTqkKc4mLuRXAiQe3m3MoPuQlx57n/HwldtRI+Yf8AK262scLJsgeJzVXp5/TzHN6
         73WH76y+aQGmCgCmEXxZ8aSo7Xl2n0yAEKL/177R0qRO2ggvg/SyHf+IQNo4QmTtG8lK
         tBcOsrpvsMZPWcxZJ58ti7yNv1bCHsKDneCSHWtn8MBMQPwtECjwrzNabGBhmMwBTLMN
         KotfjtVUUvsE/+7GyHqWug+FVNJGks4RUBGe63EvA4a+J9k41rHd2a8An/uXnP3KuYeg
         qYeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJYF0jkseYLgsAfrRHHpJh60z+IOmiCulvBxPbJypoY881QWLYKef+ImJDClz9hPlknH25oUSyJmI+0A==@linaro.org
X-Gm-Message-State: AOJu0YxkWkVUBUpHu4dcOciAVNG/FVHfr8eT3g5IL95v8QfRzRd/IiB9
	ZAI+rzti6+VH1smx3ffKA27a1OvSIVa0dfULNnCQ1nwdddFJEy2a5wtukZP0eJWq1Q==
X-Google-Smtp-Source: AGHT+IGsYfpgGMtUkJQV3ZoeaZnVF1kzOMAI4k+7EcIVricIQ5VNOKh5dVOAemjBCE1kuSKrF+5BOQ==
X-Received: by 2002:a05:6a00:1883:b0:706:58ef:613 with SMTP id d2e1a72fcca58-719262066efmr3042407b3a.27.1726126778888;
        Thu, 12 Sep 2024 00:39:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:38 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	WANG Xuerui <git@xen0n.name>,
	Halil Pasic <pasic@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Corey Minyard <minyard@acm.org>,
	Keith Busch <kbusch@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jesper Devantier <foss@defmacro.it>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-riscv@nongnu.org,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	kvm@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Peter Xu <peterx@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Farman <farman@linux.ibm.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Fam Zheng <fam@euphon.net>,
	Weiwei Li <liwei1518@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 05/48] hw/core: replace assert(0) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:38 -0700
Message-Id: <20240912073921.453203-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: l0hv6rJKWDYT

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/core/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index fb81c1ed51b..1b5f44baeac 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -380,7 +380,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
         }
         lb_data.data = node->bandwidth;
     } else {
-        assert(0);
+        g_assert_not_reached();
     }
 
     g_array_append_val(hmat_lb->list, lb_data);
-- 
2.39.2
