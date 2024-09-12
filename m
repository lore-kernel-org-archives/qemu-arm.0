Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422777nji;
        Thu, 12 Sep 2024 00:40:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViARmV7qqY48tXQAZQGwa2MmOYFo+Sbr30l5BlUNbfZV3EDqQaNj9+YwjpOBhG1PzhIFrD7jPayQ+lxw==@linaro.org
X-Received: by 2002:a05:6e02:1a28:b0:39f:5d13:9491 with SMTP id e9e14a558f8ab-3a084901b37mr17217115ab.7.1726126840501;
        Thu, 12 Sep 2024 00:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126840; cv=none;
        d=google.com; s=arc-20160816;
        b=YCzY52bpF4/ifLmev8NbuZd+3UknVawrwvtKWWIGS5Y9uC3FqX/KyTUVjYPfgCjJ1w
         TSroQvbnyd1EBZwk86daOb423HQwg8iwMrr9yX0Zag3CaCG/KR/FbV4SzigFpX+ZMPQT
         yoNhCi61quV6ItLiCCUMApV3TdxGrs6sjOewcRd82oSck1EtbaPFXw3x2mEsUfoqpWz9
         38c96hkyhoh47+tcpGDAejY3VggPUymDXcOpWZlG+0yGXBO26TtC+yAUTZd7MrKBk4vi
         glb+ZnIieoM2y7TkPfCbHhkkIIDQmRls7enVGDdtL4CIkFtaR6034bTJZZvLOeJkqKdS
         L3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aWS8WcyTWapQPcbM+bRD40JZ4f8WdoLt0xgMhn2PBmc=;
        fh=rjbE1SaV9qmeWfUlfSflkymUdIsUu7mKuPkWptSqdeo=;
        b=wEoAECUXHwoOaajWAzwYCNuT4OSFuilKgOSyZIrdhAZu1Y6SPxWVXi1vma9KOv216I
         ujnPvJa0ZLqYeKa5uNy+Ojq664vuitIxmO5vrYriQ+u8WU0dG/ElC18Z2A4uiFABnZ3w
         aPt6ICMyTBdlwc8y4UtDGgSW7XQh9I+ogVNr4cvnXATVwQ1aSTpC1WeYV2ln1NE/yjqd
         sv1uZbsVhQGakpM7JYt17dB0YwHIA4+vLq7NNoAD6xSMsxqLII+KJONM+jSeDTBjK8ER
         TPuaaBt9GJz1bRb0hM6NmngW1B+QgT6h3AfyQk6sYI371Lphbn39mIOto8guJA6FK8Me
         Q5eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fHi4xc5n;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3a087ef4c8csor859065ab.13.2024.09.12.00.40.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fHi4xc5n;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126840; x=1726731640; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWS8WcyTWapQPcbM+bRD40JZ4f8WdoLt0xgMhn2PBmc=;
        b=fHi4xc5nVWcVb3b66gZnxtQGXcD865vQfqPw7n2klpBWxchrgtEnZhzFpIW+Ar5pKe
         rCamb1jmZ1eajptCAbtjTZkNBS2Zw/2Tw/EHlU2MenjD/AQujCROW016ppRVW6Hi1rjn
         Gu7jJwmXEcZTshrwY8dOGs3pUU2hvbhDgYr3/Ad6H+0fp/mb2OBx5XwZVM0FfbAnXjiX
         DX39At2ODiR2+cHoGiMeI/F8pgPlBemITE/ac0SBTDQhZiGzRc1sYE5MN8cKr7BQ6RHQ
         vbY3Gk0eqTGHhS5KgII6W2EjAI+qyWmV1hNLu/heqjFlGP6Q9xHLtdCv2LNNumSxdK2A
         K7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126840; x=1726731640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWS8WcyTWapQPcbM+bRD40JZ4f8WdoLt0xgMhn2PBmc=;
        b=wj7D2huTK0ke+FHRe2At6D0CMgX0//FrLuBX+x1TS+crpNHxD9lo2Z+4f9ouw+JgBW
         RUjmCzNLGCuFtVmhoF21gHtHthEwuWTxC8UQJaZaZuk5S0wHrEwuc1gdq1jIbqTaygNM
         yl+8eaTZ7XQIP8UF+tp/iAuV3lnBRXXbboAz+Z9bRNr3h2IvsiFSMN5Q80EKzEFCrWHC
         JPjXCorc6rq66quQ3RscvmNgPqPOie13cotlcsHcegbR0LIExHuQ3xtboXk+ukjWL0+3
         +dhqztvB0zyBb50eeufjQxja9lks8CtPk++kasLZEUaNOhPdqmLjjV/mmcmHzuV6hcZO
         JXOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR9okUrcLVc2F+pjbv4gPxKKVXg96tJl+NsyCwPCczp0ZCaOtrqqGCaj6Zg+fVTlrj4CKsxc0K/1ur6g==@linaro.org
X-Gm-Message-State: AOJu0YwR61zj5k0WyWq2lVbQzWxEwabVWkG7YCLLcNLDfcM+9OqgqEbg
	1daABYHctLHfsumTKFBE6YGQH1RcGUc2dOSff0uTQlT0ENl+wi+2ztX5iRDJFI1gpw==
X-Google-Smtp-Source: AGHT+IFYzQhybkxo/re134Wva/li7Du5eyOeNHQCOj8YeNMIPHFJEF4Fg9V+twS4J8sKDv4Qe7CqZA==
X-Received: by 2002:a05:6e02:1383:b0:39f:5abe:ec25 with SMTP id e9e14a558f8ab-3a08495478amr17127215ab.19.1726126840002;
        Thu, 12 Sep 2024 00:40:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:39 -0700 (PDT)
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
Subject: [PATCH v2 28/48] hw/misc: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:01 -0700
Message-Id: <20240912073921.453203-29-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uRUVoM1+du8U

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/misc/imx6_ccm.c | 1 -
 hw/misc/mac_via.c  | 2 --
 2 files changed, 3 deletions(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index b1def7f05b9..fd5d7ce4828 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -301,7 +301,6 @@ static uint64_t imx6_analog_get_periph_clk(IMX6CCMState *dev)
     default:
         /* We should never get there */
         g_assert_not_reached();
-        break;
     }
 
     trace_imx6_analog_get_periph_clk(freq);
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 652395b84fc..af2b2b1af3d 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -495,7 +495,6 @@ static void via1_rtc_update(MOS6522Q800VIA1State *v1s)
                 break;
             default:
                 g_assert_not_reached();
-                break;
             }
             return;
         }
@@ -556,7 +555,6 @@ static void via1_rtc_update(MOS6522Q800VIA1State *v1s)
             break;
         default:
             g_assert_not_reached();
-            break;
         }
         return;
     }
-- 
2.39.2
