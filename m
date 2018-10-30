Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440572wro;
        Tue, 30 Oct 2018 04:24:23 -0700 (PDT)
X-Google-Smtp-Source: AJdET5coBkvjrU+RbIIIp2VffiCOF9cd5sMRy4n3vcRpUGfgdCHughiiTwbphkzlt4NDlCqXcEds
X-Received: by 2002:a1c:650b:: with SMTP id z11-v6mr1445261wmb.28.1540898663483;
        Tue, 30 Oct 2018 04:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898663; cv=none;
        d=google.com; s=arc-20160816;
        b=UqYLMXBzh1kQ3P9OMjl+GBLOdOYjgbfzMXfOVWzdmqNK5R0+O4WpY/Ba1ZbvzYhG3n
         XOH/P5aZCE1IWLOK0P4ewXOpN4eh9fkvwoQ6A88ZlrdvSVnez3aGBtkttlDDybnt3+/L
         jNnSNuBmz2MKiB4sj7QKzlkuDOAwGgs3zq29rSBkkkHT3IILXI1D13Gv30ePJXYraV35
         UB83efvIXSovzSMUP9UY+Zr/bdOpCUph0DVsq8TUzrVXsA9ohlhT4wnvHDOYBX329Kue
         LBaYu0UCB0PSbr8FdFhCZR+ViRP3numIhA8URjfB/I8Di0gioTnlGr3KEeIzjrNdS7JH
         hRYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=GXkG06WTjDyvKDjj1SHe0ZHnqdsPYAQxekBKIWdOc84=;
        b=G6ecauoQrmg3ZPXJ0UJpbxB8Y9FNwkgKeDCwYZ3yw/NbuOrbEycYkAPjOWfBt54OJ2
         I/iTvJC8gkoyNDkfGi9XTbgT/QZExTGLl2UioJY0QJ/0e1vAFaMGhg9lUenfbC5ffjDP
         OBQukT08Dtm75sbIbsytL6tyzdgwtfbveq7tLtk1CCsgxyB2iuO4PxFsRCKOb+4vE3KJ
         iJ6TlcTZgq2k4BNdyrp10NlhmmxCTEVl17KdIF5RVZLw8hml13mNQm4Nt15pRNvCgV97
         y7/26UJLwNyedsJAF2pmBhGuw6p6H++qfbzllNn2V7+YxOjLMl1uG6bbJ4t5QG9OswJ0
         yWvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.135])
        by mx.google.com with ESMTPS id r14-v6si12843940wmb.13.2018.10.30.04.24.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:23 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.135;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7sUE-1gDaFi25T8-0053ea; Tue, 30 Oct 2018 12:24:20 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7sUE-1gDaFi25T8-0053ea; Tue, 30 Oct 2018 12:24:20 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-trivial@nongnu.org,
	qemu-block@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PULL v2 17/20] hw/pci-host: Remove useless parenthesis around DIV_ROUND_UP macro
Date: Tue, 30 Oct 2018 12:23:34 +0100
Message-Id: <20181030112337.17973-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g0UQ27pPr0n6Gyo7LTiu2X1b3crfe9Pm3advV87kTAPQ4NK+fWJ
 Xf5appWG1VLn8k/+NN/WlIJdCitF4we8ARZSBbgZjCUBo9MzBEObQS8igCkGdA3ZjazEjzD
 XCyq7a86LpzUywGmv/CifZsacBvlToGprSzrt9oqVZ/6w6WKZ46XCdbaLn0GX66UZ+dgsXZ
 jhhqWwVQByojY7GTVTPpQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:mntFo7Cu7ps=:9qbwB0tB8iavhB2cnZRZV6
 R30MtderFv6PZ7irMB6ijohG3Vhe3c4X5W3O+FHMNMgTbayqVGurCXRJ1I8vRRWc1sT/T2ggu
 jvVeofrclBb7uiOFLO87v1MseYkSNkNl8AqPEj0f0POZyNgse24eUXv94VFOTZGKuhGlVB+rz
 gwg3eWpWEmtARaOWfw7GXWKPcWTdExERgFwGf89AybkWwhNOeBzQRQoV69Y8+1uCvaA28XQQb
 O58rrDhqRt6JLSCrqHUoIBmPV/qS+bTcTdFuoZIgpPM+krSKD8HWgR74r16A5Fq+sZD/ajtZd
 tHxvKYq6H1u/3VWnJ7a8q7scgTdMzX6+bTSoiMm9v8UmP0Z4pQHZ8UscWNWS0912jQSxyxjpc
 CYAaryo7LgutjbDe8CBR/WEZOxEFr2tHPZ/rliQiXF82hmPj5/8n2th/Ez81u3ozpf0GCrZLK
 VYAEvMINgtKkJ0rz6wS9QfklzoGgruNugWRicYBheTbSPGqBL4bERILoqrTtkXfDBUX1m9Agj
 jbGn/RN3PfZJvGxJgPD8FLbbOQTuGU43vQyRurxD2UvNjOsfP2hXLaFEW9ioRGd6EFvP3sGxA
 6c7BzsIWA7WGa7QtrmF7/KPVEfhbn/36sR8Gk+P9gT4IdZMq+JAFcHE9vjPUw7ZnlSg9X3sUB
 k7ZfXHDGL3O+Z0csxnMRdhXVMOzfFFhsqcO3MRF7BqNRbcbSicsmCTMlzevmSFo437/XQCtjF
 +eHIIdQTqYqEO3xj
X-TUID: uVxrbpvmfaT5

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
