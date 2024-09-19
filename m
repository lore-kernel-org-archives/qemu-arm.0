Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161494njg;
        Wed, 18 Sep 2024 21:47:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIO4RKIHQUL8TIUfuWeYvpDid4ZP0sYX4gWwDn2qIRo6u6S+ZinZblWIXviUxsLNDU/nBXmGPesUVLgw==@linaro.org
X-Received: by 2002:a05:6a00:66c4:b0:70d:3777:da8b with SMTP id d2e1a72fcca58-71926203935mr30387171b3a.25.1726721262505;
        Wed, 18 Sep 2024 21:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721262; cv=none;
        d=google.com; s=arc-20160816;
        b=m2OQodpEkCHRmQk+ugvPIW1BGF6kHL8/Y0zw4JxCPNQl8KemoO5Hg3ZgjYeZPinigk
         ep02foTaOdNsEiLGWfrA8HlqOnc/Z9WeBnNrB8q7D+17s6Jb1kywYW8fBvYjbSqM0//M
         /WW4usliykyGP0QaANTzFkBZQMWe05+7pICEIVadZDos4DyQgUq8l7I4t5/Pa+wfwyeG
         tSmpbD5ye1qmRTMXGeJfCE+vAG4WIufwRcJaVeTevRy91YX9vg2bjkbmNeU2C+nBpbQt
         ptllgqZ32+38TbxKbzFjAZHELOJLq0mpavJv+JPJl0T/+amA7QUBHZ132CWa11YQBbUn
         qObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Mp3yl1TjwHpJ2DET+AsHEAo67XBOppY+FOew/7+eLo4=;
        fh=nQixIEcaB6UCwHsDTNsB65QBmZNffjOxZbKuibVyjDQ=;
        b=XjDComECUB6Gyce0q2NAfQdTy1dXN8iVLYK3xPMjEpTpTja5tUy0hZXtEKJZiLk/Kt
         c6yyxrAnK82vWYb+nwWWQJbjySP/p0P6rb4Xohu41sOE5KrdCKI0js7LlLi7WXCmm0DL
         0j56HZ7AIHIvujeLHXya8sZHs90/gSTSrl79saWYpJaeBdUYu0GSv6es69eW/CA8q7wo
         pRfK7TRLkNEF2ebdAf1prc6bFjhUx2iG9TYgcKbwBuU87GRUa7g7feOd1PpEhIqOul32
         VQ4lDaU7GIz8nkzEoIctzjtyNqWOFzMB9bzNrUiNpDnvBhxtc0u/tzK+NztumY60YfJm
         m1iA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dmWrtrJs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944abd2cfsor6655989b3a.5.2024.09.18.21.47.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dmWrtrJs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721262; x=1727326062; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mp3yl1TjwHpJ2DET+AsHEAo67XBOppY+FOew/7+eLo4=;
        b=dmWrtrJswldkCeCq68H98HHBwaLYuD8M83NThJZuo3D6pwxz7nQSng8y/UwNGwnXle
         TR3oI4ZtAXruImSo4fe1E1cufxoZdUGqzVYnBQQXg6LXgGR02mAKvAhkf0ZvPqI9f/fT
         313lgSFQmZEpgUKz2eKzE4MvJiVFkjty4lk1gn4PBb7SoZUO6Po7Uqqjdwg6MJtKGOJe
         Ej6XaExpMYp9WrzlXGokgjI59F8PRLqqWkJjiXK3DEUQHO2fuvzB+msTzejSZgJkE81p
         vA5FNUScd8xEiCMHDuWpxVJNbtPZS2KV3czlkGD7OmG5/NMyGFp7XEGaGUl5nnM9XwP3
         r52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721262; x=1727326062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mp3yl1TjwHpJ2DET+AsHEAo67XBOppY+FOew/7+eLo4=;
        b=jp0nMHQvKY5YrqLyM5+ux7h5aauEmeuHJqWy/0HLu8t/qvabbKAu34LWQm4iJCT/FI
         zdF4LII8VR4dO6Ej9SFWb97QXG7yoCNkZIIWFE3F21XPDHp4DHvODnSSma/8bVKzJgpp
         vcyZglXsoGClzPsUz8n9pHRP5IZn2PTUud9T0raVacE1+JIhswT8Vb3N+e6aRDACFOdU
         8vdv1jGx1DVoygvC6Zzi0VXINWpwDEDtsS2AjZDaaj37fLK4gXG3g8/8Q30lHbMw6AIq
         dd9l5X6+D62qPkMhlzSJpL99ydnxYYtk83cEfLj9DpmHdre/I5IzSVXEfDyvZcIHqw0J
         G+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpNlYWEilSqW81ZuYLLKV9dMo+CAKLn4BBxc50vVIsUAF0Q8no+kRiWvIEVktTYsMpfTBge0gYrznFKQ==@linaro.org
X-Gm-Message-State: AOJu0Yx3JjD0KaJ8B5QpEOeXBUaBh3f2NFDhm1RUiLnf0N8LeimFmI0i
	NBP3ZUFH7pDlF4wgVb16WkBN9enK/BTCNN86OmB/nMg27KmM7MB/tcsO+cIRjLiGXQ==
X-Google-Smtp-Source: AGHT+IGTH8Je8M6ejpwdBpT0Z6Qq2OjP8dnJm8Cntg/tnIi4gVE22oFZXABE3c3Lz1gX4VojsLrJsA==
X-Received: by 2002:a05:6a00:2daa:b0:717:9154:b5b6 with SMTP id d2e1a72fcca58-7192606ce9emr38950232b3a.7.1726721261958;
        Wed, 18 Sep 2024 21:47:41 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:41 -0700 (PDT)
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
Subject: [PATCH v3 28/34] hw/pci: remove return after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:35 -0700
Message-Id: <20240919044641.386068-29-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DumH3++OQYsF

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/pci/pci-stub.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index c6950e21bd4..3397d0c82ea 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -47,13 +47,11 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector)
 {
     g_assert_not_reached();
-    return (MSIMessage){};
 }
 
 uint16_t pci_requester_id(PCIDevice *dev)
 {
     g_assert_not_reached();
-    return 0;
 }
 
 /* Required by ahci.c */
-- 
2.39.5
