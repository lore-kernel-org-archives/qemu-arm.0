Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422960nji;
        Thu, 12 Sep 2024 00:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPqDiwYUMz+T3EB2sdvBwyauxF7fUEbLVqlBQSVxktP3ImSEshq5thYpH6iUKhamtqQVjb5QqFAroBSA==@linaro.org
X-Received: by 2002:a05:6808:189e:b0:3e0:1299:4dc with SMTP id 5614622812f47-3e071aad7a2mr1006424b6e.25.1726126880538;
        Thu, 12 Sep 2024 00:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126880; cv=none;
        d=google.com; s=arc-20160816;
        b=M8MvnFazqrdVs9dQZpfwdCP2GtnPQeOknqZ3ln38cKsejCnMw7UnGJhYKGYBWxMZz+
         Jc3O9cce2EbiARTl2Qp2ZuPFEiuF2Y0kYS1oFftXuYnXnyMI0fcQGrqZQeUqmIQ7cOuS
         q/VKFCzb0xpHNWS1T/dnYP7o1T1vKt/ptmEmOzYJ1B9j9hpLIXXtnnz1MRIwZ19rp8Kl
         M6L+ZwuEIl0OIq3yYZV4TRxkUixLqU0az60WniCfXGMXV+z+bbtkVop0LZXypv4MCKa/
         S0N8MDzKkeWeboRpET4u7qyuQVp8seX4V3faXepfuTWk0DMtynIIIQJ9u8fZVrgEFKcv
         mk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ufez9dB+YBOc+7iflBPh4kX/ooB3/U9U7kq4P7lOFRo=;
        fh=4Hkf1AbzZy7ERtR7omumSYfVxlWF5XTkzlBMZXZl064=;
        b=NOJCuS0rCH2mzkEOxgiP537/r+Pn9FjNH70MxhrkXCP8z2nyExbMok7bWiVmDdOcdt
         Du+5zYpD/VLePCmALc+shenFX7DGCfc0U9I1ycZZx0tDxFJwPUuS4BGQWBVznH5r3Ob9
         AYqXp5ZXB1St7atSwS1FUkwGTJLQXPLUV3U0ezMB8oGrN3yQiWcQre3q0SavPMK+eQ/6
         O5Utq84Y85/YCS13au96E+r9PfRI81HS5GhiuN76Q7JTyLU2JHi4X5QUL2DDjEMrxJQe
         cIW6lXpfkNM1OiuwtakndWpRh4/aQzNXF4W8pGHT7lpkXV9TuyIUBbyc8VFYMrVaZmAa
         yieg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FVtaAs5D;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3e04817ffcasor2721266b6e.14.2024.09.12.00.41.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:41:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FVtaAs5D;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126880; x=1726731680; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufez9dB+YBOc+7iflBPh4kX/ooB3/U9U7kq4P7lOFRo=;
        b=FVtaAs5DBxfb6ExSwGt1U6VCPOGQWe1kWavk9M1NGtCEYVWfdoB+tZHgPVp2+YsVdP
         Gfzezuv/yo2n08CMNvUUdhVuEwlbhGJ8jYXF2AgWPJOzOjLHHEc6drtnWz20a5TWNUrd
         yJKQzff7oMLlWh9te6uaJFAzskCDE1J+QdAkeQNvkkhDEUa/fZKLW1yn3eUJkV6cM1Zc
         E4WS4iV5kLKBkMOfzvG63M4G3tTdJ8B+ihXdFBV9sRhbFWHOROw8Ob2cm9CvCTnMj8Fr
         S4IxZRqS2jMnCjudXR+NdJgyWHY3EUH7D15LNU7hfaUWVSt9WN/xkvrxXU1+8rgB1LJq
         W9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126880; x=1726731680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufez9dB+YBOc+7iflBPh4kX/ooB3/U9U7kq4P7lOFRo=;
        b=n8s5k1tqvALPyHY2r3npZ8jtWvRkKzJmVkKX4XVF51NLBcElGv4+2AuzBciaLvfGlr
         7ld23sFFMHQzKzUn0ETPON+ACdM0aJJqRroSmhojaidd7aG/TgDbEscuB7FXcmjQcu5G
         0TF56b/59GUKx8Jp6OI42Z0C3/rZksgG4MEr9Pb+OwcDSyUicDGHCOszeR39xIprkqdg
         XFxi79StJO/8ZQAGbBncnbIykFolzohS1JP3+3+ZNgvEdU4lxLeqmGMsO1JLJPWdvBAC
         aUYtl1rf88BYaO4t9pl+oI39nzUNKyA5gRtXlfyu+VONC8Evt6qWMBRsBED3zfXN9EAq
         Ecfg==
X-Forwarded-Encrypted: i=1; AJvYcCU6tZQCaWZ5Okgf32CxMTa4C0cdZuytXIYhHnxV8ZC/Zkk0kC6ND5F147yxiQ+qE0Vtn0RdcCOCurHGqQ==@linaro.org
X-Gm-Message-State: AOJu0YxtNQkY4Qv40WfOCSyF6krfaV9To5MKLF57eK3xCWHyNfufP5v6
	nemtzSCN3+tbkC0LCYsicpTIHQr5w5u1UpfTSTWI1AA6NfJosJ5ePZyoQCNIQuhfkg==
X-Google-Smtp-Source: AGHT+IEahP6jvi2FuHplutVqQN81TXossfZA34JXn70LhsQgJakrG7hFdv/bnJa3CeA2ta6y/uKqJg==
X-Received: by 2002:a05:6808:159f:b0:3e0:4faf:242 with SMTP id 5614622812f47-3e071a9a5fdmr1180584b6e.19.1726126880116;
        Thu, 12 Sep 2024 00:41:20 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:41:19 -0700 (PDT)
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
Subject: [PATCH v2 43/48] hw/ppc: remove return after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:16 -0700
Message-Id: <20240912073921.453203-44-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: E0CHfe6DR9uM

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/ppc/ppc.c          | 1 -
 hw/ppc/spapr_events.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index e6fa5580c01..fde46194122 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -267,7 +267,6 @@ static void power9_set_irq(void *opaque, int pin, int level)
         break;
     default:
         g_assert_not_reached();
-        return;
     }
 }
 
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 38ac1cb7866..4dbf8e2e2ef 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -646,7 +646,6 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
          * that don't support them
          */
         g_assert_not_reached();
-        return;
     }
 
     if (hp_id == RTAS_LOG_V6_HP_ID_DRC_COUNT) {
-- 
2.39.2
