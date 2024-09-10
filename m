Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444820njb;
        Tue, 10 Sep 2024 15:17:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUdkeY/BzKEjoORV8InZ6m+HaRaCwJYT9KGCBiAV2VFw0OUDNveeLNpUwTZt//USEuJ2y3MhuVogsb9A==@linaro.org
X-Received: by 2002:a05:6a20:2d24:b0:1cf:354e:93df with SMTP id adf61e73a8af0-1cf5e0515c1mr3189800637.4.1726006670414;
        Tue, 10 Sep 2024 15:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006670; cv=none;
        d=google.com; s=arc-20160816;
        b=lCWFX3nlBLOZxMNzILNOnsIn1y3SHTZpxkNZ06FyqQOeKqpy+v/wd1ow91LmLPxaNh
         xMt+7P34GEOybGSU+gCXPpO4iQVeI739pdLwNEMvWMXM9NQh5Cu9kbT9DOOrLWGll/hW
         rgR7jzeJT9msAwnxoacTpDJda4beem64PWTqAvLpApkA151yt9fFUaEqlCMjkzVi4BWF
         VIFwfOZegYWCoGtg9PdI06cwuO4KmR8X58EeZGlq2HC/+sBLAZljUguWkCLe77dzPAV0
         qNciRxZqrME4yk+f09Qm0AZsuXL8kXfXtCWnAdR3+BRCz3iLhMgZPpkcpEcBF29afU2k
         Qx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JYUGVuBQPVEKq8uP3q9x4VvG+Oea4tuw5RjsMn3QXjQ=;
        fh=NwKeoNExF6Huj7vTmMK8vjktWlAmR85VtxMCz2PGW0s=;
        b=rTEgKmyL4TufOXE35Rf5SbomGzNvZy06X3k9QNMN6eV0AAmimjSXAiCcg+cvd0eMAg
         e24PaA1XJIxnS7P3nJ8BJOODQBb++b7cZbm/uVauZ6tnSHl0D8cPIbMTgxSyHZxd9jwh
         nfU4yfQw5QX8AKg7U5pymKqXJ26jEoSMKp9VuSN/WFmwJXG9xdxgsp1QBkMV4DGSwCw7
         XtIrO0+ZmNLDdKPX3jGqovDocCpnKcNLHTgB7M8Q9A+DALU7C/sBBjtQfCOXwuPJ1t1Z
         oJj6ibpM+7nlPTxVdCQahdWqsmyYBrZ5c4zby88qFUp2fp+r8Z7RVwbLze4chBHjbaDG
         cAlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VnlDE2rU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7d823641764sor4172648a12.1.2024.09.10.15.17.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VnlDE2rU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006670; x=1726611470; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYUGVuBQPVEKq8uP3q9x4VvG+Oea4tuw5RjsMn3QXjQ=;
        b=VnlDE2rUbZIXmJi6QhGJ9NGjRW9UzUWUn/McC7MAb10HWw8C5afeCilkUfi7WHSL+C
         nOEJs80A1cm5Jyo8wLaSemhZ3KYFk9KDdrpG/uplWnELMhwPq9fNZZ3vHAgKt5vBbi/8
         AbjArTvrpZsH1rOnECr8xmGV9bz31jOa8gdvPdxYJCRgdEq8um8CjUUeWOnvMIqhGhVx
         MOUkwkkGk06KlCY/3J4U3q4i2SZu4qYaVHZUZPjhIlr+vwxbLzZP0+f0EPZxOr+Crna3
         cMPomudt+4EFFlhdk0o/a1JVajcfIXTrBXRXq01HmaQ8VQLKjUcdSQT4I76jjBRcv4sD
         SXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006670; x=1726611470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYUGVuBQPVEKq8uP3q9x4VvG+Oea4tuw5RjsMn3QXjQ=;
        b=LT3i5mpxQUa8XbapdTJ+Rxnb3RYZP/Mi0mKSuu1LpklJAZFuF07jJgjc31lh+U7Hq6
         HD1cEiwVO6jK58pvNZBS0LAA8brAjptYgtKVXHl5AP3/yVotDx3bB2BdnYGEHHkTdaa2
         zvHwU0XMUqbzMG0fAuTUJBuL/cKiTRPEWucAO/2+vhJ/fsLpx4/LmA3y/bqg82T++Fte
         ERTwViDekha9lygFSF3hRAPUnyWdRroqbZhDwQmC7K1DR7OUpx/nS6Pfe+HtkJhHaNv1
         IhvWEuKfl9hhP9zCsBcOBl207ApgqHrGXi/wp+oYSpYvqOgQlCib95cNVcYiv3JNRpiv
         5Mmg==
X-Forwarded-Encrypted: i=1; AJvYcCUmhcH0YeuagV3YF1Q9PB0ZRLUhgwzfzJki5mvhwvwKfbaL5f8/U61YK19wlRuG7eblnhsFZ0K6D3fRRQ==@linaro.org
X-Gm-Message-State: AOJu0YwdCDToqizkJYR0vBaABW97yRbMBe07xfvySWOATJCAucxCL8Ns
	2UJgbTVdznPZzN1JhhXvX32zmOEIq0+XNo6sNZVQ857XJQI+MHx3AEwG33/7r5T0rg==
X-Google-Smtp-Source: AGHT+IGvdYbUxOn3oVTMiIOAaos8t5NEoWDicsVQH4rvVkTo7ZcM156Q62Eu90CVjvFHEgcLmkFROw==
X-Received: by 2002:a05:6a21:3a44:b0:1cf:284f:778d with SMTP id adf61e73a8af0-1cf5e0ae114mr3221600637.16.1726006669948;
        Tue, 10 Sep 2024 15:17:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:17:49 -0700 (PDT)
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
Subject: [PATCH 30/39] hw/pci-host: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:57 -0700
Message-Id: <20240910221606.1817478-31-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gzoabbbjxuvy

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/pci-host/gt64120.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/pci-host/gt64120.c b/hw/pci-host/gt64120.c
index 33607dfbec4..58557416629 100644
--- a/hw/pci-host/gt64120.c
+++ b/hw/pci-host/gt64120.c
@@ -689,7 +689,6 @@ static void gt64120_writel(void *opaque, hwaddr addr,
     case GT_PCI0_CFGDATA:
         /* Mapped via in gt64120_pci_mapping() */
         g_assert_not_reached();
-        break;
 
     /* Interrupts */
     case GT_INTRCAUSE:
@@ -933,7 +932,6 @@ static uint64_t gt64120_readl(void *opaque,
     case GT_PCI0_CFGDATA:
         /* Mapped via in gt64120_pci_mapping() */
         g_assert_not_reached();
-        break;
 
     case GT_PCI0_CMD:
     case GT_PCI0_TOR:
-- 
2.39.2
