Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp881535wro;
        Fri, 26 Oct 2018 08:32:26 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fJkOQceCazsKQcG+dI5gSEiVfs4hbDGfcqYRZHlg58CgCNPFA99EAzLr6Ft/5pdNn2e5tW
X-Received: by 2002:a1c:b088:: with SMTP id z130-v6mr3025287wme.95.1540567946762;
        Fri, 26 Oct 2018 08:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567946; cv=none;
        d=google.com; s=arc-20160816;
        b=H+1nmpVLZPZB2a21noZQODOGnA1NQFLbfPo04CD8/8gnmr9Kgno2JlBl3srctcZtL0
         H4qP2GGBwAKDHab2RRH+5xYk/Sg0CcwyMOANFjV+Felmv03AIhQU+nzxO6WDvPxBd92g
         Xrth9SzD75ZhjkUsbyMFsJ+uUskSAYQ8/oZU8bs3ogmjTJEbWvGH51YeBUPjVak4nmyt
         ZmgGxK4/p2toC59P/PQ2SK5n58OnAXiVdPQ0gGZ6Z7NVSpgzHQlTLJGJIvnN2QW4KLfQ
         WZlPs5MT14zLrYYOYI97L0Iztf47OfF0JwMHS+/eNlJX/fSKq6BW1fUGcqCmZEiFqwYP
         wWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=GXkG06WTjDyvKDjj1SHe0ZHnqdsPYAQxekBKIWdOc84=;
        b=IfsxZYDPxCxAu52U3YKtqJnqVARjIVP0vVr2UIuIDj1Vc8stRXLigRAWLMvcP5gGhZ
         Mz3o1V8BTY541JgWGZ/58q+l6zM1m5GvR82JcAme1Mxz/sIH+s3RowTkkzNu0XvutGrG
         B+0fhIQ3Tqa5204tn9YeU1aaVcnngYCJO3qn2TsGifwjVTIyC6Hu0M7drafUKxvxGk3N
         XLOxA8PYaQrLBS+WZRHcH8LB3Q8IVtat7fxBm6hs6kMmkMR4lu0aVwyuekThDEhWOJiL
         2DpdXudWZ/K9pc9GRiqrDjww8fKlhSlNVEiTsi5GFAfAj35qG3jFdP+TX8XDcstxSiTt
         1ocQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.131])
        by mx.google.com with ESMTPS id y15-v6si8764484wrp.369.2018.10.26.08.32.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:26 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.131;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MyvFC-1fKVQL0l0M-00vyS1; Fri, 26 Oct 2018 17:32:15 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MyvFC-1fKVQL0l0M-00vyS1; Fri, 26 Oct 2018 17:32:15 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL 17/20] hw/pci-host: Remove useless parenthesis around DIV_ROUND_UP macro
Date: Fri, 26 Oct 2018 17:31:22 +0200
Message-Id: <20181026153125.24738-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+i9Bmgk1IwQUv0MsCRCyQhrt4v9377EbiyAgWwyN+GK3Ka67Uwc
 YTeH4mU8BLVpCOUY9aKO+ZRqTWJUjPIj6fxmgPwvxkX85DJcw4aKfnE9bphEJlQss8M1MDi
 9DS8GuY7l8dCB8ktIvBkdMv/8dXcs2DLiDuhmRZL/Yf7FnFuD3PvOPam/Kj+VW8ixwy4AG+
 eBFkvKCStAnisgNt+o9bg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:XmlXAmcRL4g=:KUSW9NWdAz/RjQzT10cBel
 oyM7NeKHFGR0Hi8+Lh6N2OI/21Q8LBP/9H6a+DZzk5PKt/9jf0l4iOajmxAnF3PgWz/xZodrL
 TA4BADz7pegVmfru0fTQ5aOZ2w5UXGvTPFI9tm5qNChVJ52VkOyVY0aDTQPu5RhRps9L2cBnF
 T1RToV3bACvarYCbYbAyR6ZC8GXB6iE4gSwokEnXm3zpWnJDOdugPwdkNkvPVul1g+KsLbgkC
 PsTxZaWA7zLknlcNLDBPg6kmhe774/k+L3EJMsTliBkzs7+JOWr4Qpxk24qTdUu8wqGrGAh07
 deWqSBxD3MAObcNWA9/n7E/0BI14dL8A3cyqCr6dWPP8xvTbLrFyCnWJaRAu8EsCaPFS2e5AJ
 kfGAZ1H2jsTBo2KuBp+41J+hdV/UNSBNLvT6vNHQlsBDbmjGEFImCzKLNNHWTsULk4SAhluFl
 fNjU9uN1syOseVb/R7oFsSmNma2u0B7lscb6SVFiQBAyKcyQXr0FjDNax8KT1p4xiUc1OO19f
 /n3j4QnwEncpmBVSGZhQ0t1LJQJlpD10Fyhrnh/SUA3Uyi8gkzJvtRuOccVGNjs+NI8cAylTJ
 Pru3W1G65yvNJHTtLvhZgRWj3kCBGuRvRTSyiXOX920vu/DBptYNxNX9FGgU4pqB7oCqsrJKr
 2WpciZlD5A+IyHYBns7hGfKI0RdAMhIYYgFDVHB9PhCImXzYvZGwaCPIgneLDi1PmgPix0g36
 pMJJEoDceB9fLR5n
X-TUID: tflyUQeIQ7E8

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/round.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-7-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/pci-host/piix.c | 2 +-
 hw/pci-host/q35.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index da73743fa2..47293a3915 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -144,7 +144,7 @@ static void i440fx_update_memory_mappings(PCII440FXState *d)
     memory_region_transaction_begin();
     for (i = 0; i < 13; i++) {
         pam_update(&d->pam_regions[i], i,
-                   pd->config[I440FX_PAM + (DIV_ROUND_UP(i, 2))]);
+                   pd->config[I440FX_PAM + DIV_ROUND_UP(i, 2)]);
     }
     memory_region_set_enabled(&d->smram_region,
                               !(pd->config[I440FX_SMRAM] & SMRAM_D_OPEN));
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 8ce1e09932..966a7cf92d 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -356,7 +356,7 @@ static void mch_update_pam(MCHPCIState *mch)
     memory_region_transaction_begin();
     for (i = 0; i < 13; i++) {
         pam_update(&mch->pam_regions[i], i,
-                   pd->config[MCH_HOST_BRIDGE_PAM0 + (DIV_ROUND_UP(i, 2))]);
+                   pd->config[MCH_HOST_BRIDGE_PAM0 + DIV_ROUND_UP(i, 2)]);
     }
     memory_region_transaction_commit();
 }
-- 
2.17.2
