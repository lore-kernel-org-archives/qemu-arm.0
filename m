Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444562njb;
        Tue, 10 Sep 2024 15:16:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKD5IE8Bbvef6RGIS7gmkWvcJG4UNO/7eWJHm4ZgHVTWRhP68elXM+AarSFnsAbF66FARAP0Co8fvkQA==@linaro.org
X-Received: by 2002:a05:6a20:d525:b0:1cf:58e3:2d1 with SMTP id adf61e73a8af0-1cf5e197fecmr2960310637.47.1726006616391;
        Tue, 10 Sep 2024 15:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006616; cv=none;
        d=google.com; s=arc-20160816;
        b=nCLBwC7GprWeoPfkRbDSPTbJf3qDm7PYWlm4RSCH4aLq+nP4FTgSYgzAcCy1qbB8Ri
         fvDj8Xiu8kq+1lrDbfzvT0GKHVEXr+UBQcz8QjTlVk1T/ExC9Z2G5bqQETZgjlQkvF3k
         pIprUDo9aEOrsjB5Dv9yV0CgUefFdgyV3zAQ+prURFWqUCwznTNOi/Pde/N11U7PsIKC
         yWBliazRRr0Wb/I0AP+79ysIaXlZcsuaogQWeEsBCXzfJYGFWVgXzjkrmPb/Z7FI1A4g
         PVSYdkPIBRg80uaZYjkoEFYndxkSe+YC3XlUB2OdtJXBs0oxB/kO0HNy1h8azQQpF3EM
         5rfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cAvzQslJtfBcWM7NZQthMrKt0WkAdMSo8X/GFMOx7xk=;
        fh=VroRd4X2ys7KAuhGqlvs+/Qjat+wpCsuMen0z5dBV90=;
        b=VamiJBvybobSUSgww9bQxm7CnAykKQx+BSgIGXUtmffjsV5viYiO2p8FFErwCH1g9O
         8fN77uILkPymq8sVQa0MjBYe6HMjvrI2aluBiMN+5ujXuTIR8fXgePAAhb2n5vmCzps9
         3D3Pb8imLxle48zJmwNAGG+EfPL/InET05jPlIWdQgCyRZCFicSa1gV1YI7LHi1Ud5/P
         ZDCV8agwzcVNhbBM25KvOGPAYNLqopOo5JYp60hIsKFwfJuZZEYAP60wEADLL3LxzaQJ
         O+VTX8uIfUC6xvPgJerFlOKOwRY93a9WhbwmzfEsXAA1ulW+TpFt9S3DCNla35vE60cp
         Ou6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wa7QwfU0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7d823b096edsor2820876a12.3.2024.09.10.15.16.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wa7QwfU0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006616; x=1726611416; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAvzQslJtfBcWM7NZQthMrKt0WkAdMSo8X/GFMOx7xk=;
        b=Wa7QwfU0NnFhZ8HASdMuUuWqdAJMRlezi0DaAkaTW/qJWXwPD599oWsn95j9GIIvoT
         3woa0h+jqfTox6yg6J6ePMq89ohGiJEsHZuBR6xFK74OsSX0j9u46GeOP4p8hSjXs7Lg
         zs2YQRp31QLGhpfBl4cI1DrTbQMxpcb9SVR2Oxo8PaCbG9v6YGCRD0vTh6OiJBnGXEN7
         DcowcbSzBwoiMWqTZE0Sw0rHzm7crpoZy9X+8+JRbBQVO4rHAjzvmg787c7WgnahNp8z
         98xYTv86UGKHadUMbqZetmBMker2JKQYezb0hS+aRrDuM9j7JRtdxue/hqvr6WAxZ2Pu
         JfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006616; x=1726611416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAvzQslJtfBcWM7NZQthMrKt0WkAdMSo8X/GFMOx7xk=;
        b=Ss2QKcx9GTk6kXCc8jD/hZ8/6l4qzHoh+HDMeGmd8hSURFPlhjB7PP04X0dthi2BkE
         v2T87kCMhI0Kd+2LKRwk2pfHAR88K1Mb5sQpm/6jRZm3gDYxwMtlH4+OeHsbZjJcQVYe
         II9KBb0kyNvqKImeGd7LPUI7SEthRrjBVB9n6rjMhWRcLIsub0iJHc0n8Ii7TbZQnt+U
         b4mhk8WXz/JLLQ7MxWFqVtU5dBcFvR5RLJd0RWtQdpswBHcELK0qy0Fv+AzTdgPGR5q7
         pOT/Oj+jTjRceTbj/8NeSmZfJMzCJuT8ncAz6QbrHu8RhQ+xAXXykHM4eHyB7/wBzWN+
         M4/g==
X-Forwarded-Encrypted: i=1; AJvYcCXnW82SxS+Zsvj0J6H0x10WyZ3CJAnQpO2V1Pa6yaiqRv5ChOf/Gk0xAOBI89H23G1QCEB+FTw3NpbDeQ==@linaro.org
X-Gm-Message-State: AOJu0YxyNN27fgdZkcVtlhe+UcdO9XU81a79bVj/7a80Rabup2vqWUd/
	UUGy9k54vWyN5yWitDh9L6IrJGNsEXv8B3lhq5eG0lpkYijHrMFlCiy9YKaTV66Tfw==
X-Google-Smtp-Source: AGHT+IE5hbdWS6CdkvBpTkLF73V6YsXkK3hpqDmltB7qoc29jRaoBm1Er3LHFhYvvN88E1vHLvAbAQ==
X-Received: by 2002:a05:6a20:cf8c:b0:1cf:3a0a:ae45 with SMTP id adf61e73a8af0-1cf5e156d0fmr3746837637.35.1726006615860;
        Tue, 10 Sep 2024 15:16:55 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:55 -0700 (PDT)
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
Subject: [PATCH 19/39] hw/pci: replace assert(false) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:46 -0700
Message-Id: <20240910221606.1817478-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5A3+59OFfCVN

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/pci/pci-stub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index f0508682d2b..c6950e21bd4 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -46,13 +46,13 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
 /* kvm-all wants this */
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector)
 {
-    g_assert(false);
+    g_assert_not_reached();
     return (MSIMessage){};
 }
 
 uint16_t pci_requester_id(PCIDevice *dev)
 {
-    g_assert(false);
+    g_assert_not_reached();
     return 0;
 }
 
-- 
2.39.2
