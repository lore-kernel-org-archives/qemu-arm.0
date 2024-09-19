Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161414njg;
        Wed, 18 Sep 2024 21:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBX34UZT0iuPwRMs8oWUFKFw9i5Qrni0Q14HsiseNaLR8MACxZPGVV47husalJN23muR6/4PI081FOQA==@linaro.org
X-Received: by 2002:a05:6a20:cf8f:b0:1d2:bc91:be9 with SMTP id adf61e73a8af0-1d2bc910e0emr23766153637.44.1726721246411;
        Wed, 18 Sep 2024 21:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721246; cv=none;
        d=google.com; s=arc-20160816;
        b=stwH/z9K2mjdBViYYBDNW73Ku1uz17wwjckVdVMxgskZXwkO+SUO8uSRBciKkiWR2C
         FESL8lgKjWfb1oI+rldE2kEzIpH0vX6qR8LqR3nhbI3IWkgD87PJUkYtPRZ6RYhi36RX
         Fppm7U8fu0UwHhS8KzgvoVAfI5xuVHz0xopVloCovESJpNS551mJaJe3uHLGjcrofGfx
         /aDHbSMaHadxg8WUHWaRl3wxfecGan8yBkLQMbfW10HVQ0BUCXSYwFMCzE7LEIJLlIDK
         NUCF02vPVtJbauAORJtg3frnILthHSl1XGSxBqnksFHOAXRe80Tt+bX77sbZBYs2Q+5f
         DB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kRUr7Rigd7KXsxIxUKl75LNzfJl8HLKhUx0dIIEBKEI=;
        fh=z9ZFYx9T+v0kGAImTL4Wqb7XqYuNbDIotUgH/gfIrtg=;
        b=lx0Gl/2sACbF2LMSdlymkRHdXh4yyXdRKjMKDmU8V66BGFkXXHl+aS30XM0ELzxgRt
         vQ3gbx0RdqhiPS/jz/Ill7z6+4f9iUvAdydswISHBbA2Wu2z5XdIZqX/Noaidah05IQW
         zDgK4nU6wqjPjYLhE+xmjvnpeHha1kc81COJJ6NCuD3tuyvZnKaOzMrgGyVWNpaRRVgV
         /O5evFZhoMCiG9v0efZUGJDD4rw79+5XNm0/K6ElTlKwv/Lcvw/k9sippmfmYG69Uz+b
         rSe73bOZnkPzI4BN2hJEgM6DW001J3PoqArlKju7HkmSAUBpZj6Hxw1oHXk8/M8iW4+h
         WPVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KfAIOliz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944ab6c18sor9146576b3a.5.2024.09.18.21.47.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KfAIOliz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721246; x=1727326046; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRUr7Rigd7KXsxIxUKl75LNzfJl8HLKhUx0dIIEBKEI=;
        b=KfAIOlizxMxhHtkz4Y6gb4GsNg/YCe7ZyogCyjxmjrJK6chDQAFea2kZbOyNBusP69
         GoSQp/U1kTJUTRph3VThBgvDtQGZ4+xcy/o19GMMX5jLoqtGIEQgQ4sdcz7L7pcEZwAE
         G5E358RnGxASo41WmjLyCAiAaWkSvYgNj/X1HXZU0r1LpVEbClmRRKH2lBrW/mF7IjiN
         JILUdWbLjfsZAuaxXDWGACzyddA0lcM0bfyLG4a+x0mLpDAYzdb5/g33dVkBluyNF5F1
         KrdOz0+/gDASsvR0Rt791YHy2qRUKQdXZlESit+Td48AAnCone8ae0VmqJzYtw1/36DT
         GQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721246; x=1727326046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRUr7Rigd7KXsxIxUKl75LNzfJl8HLKhUx0dIIEBKEI=;
        b=vwIPjxYeIWMiMg89KsF2mpJ4Swc5yJQROGSgHM3E4MkM0Gg9sP3zBLbkFBGrjEInoJ
         GpD1VkqcpPaBsjchxJ1sELgiaQNgD1gjCWig/+qdwhDvW2d8m5jlahnTgxMKrYSZeiPz
         lRGGnLAqD7KQ7mjwQCWK6JLOzzc30JrRnFFjvOV5iZ6YuT9t2wGPIDOp5EbhJT7jToie
         PPwT9/U/VbB33hq3y3iRG7dRXWpxyfJhqnGGm2wE3SuracWL2kBLvsm0vtteycazMrlY
         bedMuyaIzrIsYZrWuxzcMB6hg8WF0V+cMJf/8EP3xwphPBA0T5LPWGvHNBlgLtFpI+wx
         i0qg==
X-Forwarded-Encrypted: i=1; AJvYcCWcqgQJwQHX7Z05gfel1N/AIpv6WOziOtH2VGuFq/XrvUbL2j8dXR07jpvLlKeAA+yMgFnBtgoAqDixaQ==@linaro.org
X-Gm-Message-State: AOJu0YxgCHJnviPilN2cJ+zQWii+yPsaUt4ZSVOFqBIiLw/wwktOdOfu
	OaMnUXJrkR3FotPaf4fNnphjS16nhse8/wPH/ghS8VQ6hyQ4IWnM8nrq0eZKceDNoA==
X-Google-Smtp-Source: AGHT+IH/FIQf5IQhPyXOoAeAod0TK8mpE9ZpDATxxMEhePCSvOyFGL8wr8yUWnyqTIM9Ik9UbYX11A==
X-Received: by 2002:a05:6a21:2d8a:b0:1cf:1217:ce87 with SMTP id adf61e73a8af0-1cf75ea2251mr39237052637.2.1726721245964;
        Wed, 18 Sep 2024 21:47:25 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:25 -0700 (PDT)
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
Subject: [PATCH v3 20/34] hw/tpm: remove break after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:27 -0700
Message-Id: <20240919044641.386068-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9hz9MTe7Asqb

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/tpm/tpm_spapr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
index e084e987e6e..5f7a0dfc617 100644
--- a/hw/tpm/tpm_spapr.c
+++ b/hw/tpm/tpm_spapr.c
@@ -206,7 +206,6 @@ static int tpm_spapr_do_crq(struct SpaprVioDevice *dev, uint8_t *crq_data)
                 break;
             default:
                 g_assert_not_reached();
-                break;
             }
             trace_tpm_spapr_do_crq_get_version(be32_to_cpu(local_crq.data));
             spapr_tpm_send_crq(dev, &local_crq);
-- 
2.39.5
