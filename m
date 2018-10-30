Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440506wro;
        Tue, 30 Oct 2018 04:24:20 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d+rAdxc/tmg+VfDkWQYoCzNL1KFF7a7dreeZQ7Q3BNHCKYzN1LiQ7+V0uomk/jwglhjFXo
X-Received: by 2002:adf:ed06:: with SMTP id a6-v6mr16447376wro.262.1540898659999;
        Tue, 30 Oct 2018 04:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898659; cv=none;
        d=google.com; s=arc-20160816;
        b=UpT/3A2SLwXjaYoLF5lN8d09zSPtXh52rY14Xo2FJVvE9ZAdEcFutLw3HyZ/IFn7rv
         6kEr2GvGQF+6oimp8URZ9hFQNlxsnqkjBcOYjtNGrSSHQa/bcmw9bAVgIGb+6EPnbQ0W
         uHTBLmT21zVmrCyPxBGMnSBgDQ6iUzMiffMcGme7cws9U1BPnxYQGb6u7A4B+As0MStS
         FXxyfpZR09RshUsy+n08dllYougB3osAQmNjtpjjsd0Ngm1a1UPyiKUk4k2Et8zV06cL
         2czDbACZv0VFiQxyzUo0d73hmqRppWq2sVEzzsQx+3U+FSYptqnMEUbA6+mGmusU7y/6
         Fukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=5+FK91EiMz7zwPVdwTNxGbaLkyUtEHLv99gvZtsbh8c=;
        b=vx5HVhw212Zb6SdsarSjHrcBRj3EzhIKMFMpp0I9LD0ZCL5acBNmQ7GirasmGgZJ/G
         NCd2vpFItuVc5GfWIKbJZxOGmbAUbf1orSOnZrd9tTZ8DvonW5Cba1sZXNfWMWKbhv6H
         Ju5itWx7m3/UbolgoKHf5P2VT8Ta6KqTjPKWPOSFdEk/j66Tm4W0CDhLHSxYYKDhTZPG
         fK3hcnPdOiyWqaMZQXFIXvr8P4BlegfTqq7xbg8SGpERLhVXF0is9wMqZqOVRLS6uG5P
         9XlZ1NAkVIY2f5+c+b3SQ33DW89HfiWZoaAb6ft9uvLMB0O24+Xt39zM1cdGhSVh3/X8
         /6PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.131])
        by mx.google.com with ESMTPS id g195-v6si7605763wmd.139.2018.10.30.04.24.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:19 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.131;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mwfn8-1fKmk429BS-00y8DA; Tue, 30 Oct 2018 12:24:18 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mwfn8-1fKmk429BS-00y8DA; Tue, 30 Oct 2018 12:24:18 +0100
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
Subject: [PULL v2 16/20] tests/bios-tables-test: Remove an useless cast
Date: Tue, 30 Oct 2018 12:23:33 +0100
Message-Id: <20181030112337.17973-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EpruMGy6kLNFKcNKdwgN4oApQRq9Ua5ve0hSsyZevrvuEOLxFc4
 2Nqf2j/9dU3TPz80iNgSeRKlsezndeqcHywks0NFYU5MkfQSa4sYTUpO/MEKiUyCsPZZ5Wy
 ahYNkw12j6L2RNMPjMH9Riw9mYkn7mmgZXv7jcyT/X5+Yl1P/sBQZMCMIhSRAC9FDrELnp9
 SMnt99y5KYywok5bdaeJg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:9FQOfexKcM0=:NtcgCNiX0Z1re1GuN9rjrK
 +Di5n16IIA+qeSi26hI9XVjofW9P/dCUhBO7DsvG/fdHUxTD2pOyMebghEF4UhekctkDaUmzq
 7QUcDibk6QiRZ36TFULl7tHGdci3upYSRzi9nrWP9VdZ4WBuHImiFO4ehdw//o/kreCTL37jz
 Vi6NDclDy5CuekGaukehwTk7y1YWpz3CjI8bKjvuaFE6LrRW/Kp5YIFSVOxqlSVve/KaRekFi
 Utr0fl73GbrFGnTouKhcN1H4WWPseKJMsSXYEAoO26pVncs6vjoT1Z37A2WEfYCfS8n1bMFeE
 J5mN89PQZe9H8K/hbVQXDDYse5DVfu9oeePxuhvnEMD6nJ+L8NHMEzGHixevWc/yYqTeqADDm
 g54olO2wS0GXbfFA/Dh2vzRq8M8CYkZCy1Y1haneAnPThvJKgdMFXj1ONODYPoddgnDM3nEpl
 Qa8GcRNBN7vkb1G+NWGsmuJTc6ZhDGbtI3myru+jReYiSq3WvXSkOSRJc2U6fTXy227elrX6z
 CM8McIC1BIOIJCsCu9p9YSGMq//du/1U7EPen5aKOItr/hUxEGu+UGlw16ASuw9S/tdDuyUr8
 5MLWvf+SVoTKXpgT2TjmJBGj3tbbKKWh5eQXWYtHGal1mjzxzkrCSUZWcxfMr/Pf3zeLQtlaC
 a+dCer0bz6h9g8Y8ODaYLfm2nbpsh2wpimVhjC0y37wc1Gs6rw61kbAKFpRlfYvC2PnqDmgFx
 ButyD5EUhHUfybJQ
X-TUID: FzIUQeUxERkp

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/typecast.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-5-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index af4b1fb6bd..02e77ec811 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -319,7 +319,7 @@ static bool load_asl(GArray *sdts, AcpiSdtTable *sdt)
     ret = g_spawn_command_line_sync(command_line->str, &out, &out_err, NULL, &error);
     g_assert_no_error(error);
     if (ret) {
-        ret = g_file_get_contents(sdt->asl_file, (gchar **)&sdt->asl,
+        ret = g_file_get_contents(sdt->asl_file, &sdt->asl,
                                   &sdt->asl_len, &error);
         g_assert(ret);
         g_assert_no_error(error);
-- 
2.17.2
