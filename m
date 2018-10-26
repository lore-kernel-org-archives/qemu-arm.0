Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp881397wro;
        Fri, 26 Oct 2018 08:32:20 -0700 (PDT)
X-Google-Smtp-Source: AJdET5f/MARQGkZ5Bsez4f735WnLw6QTR8JlluAUcp3PZG7uS+Dkymz06nHQV2QQoPYyAOxS9Esb
X-Received: by 2002:a1c:970e:: with SMTP id z14-v6mr5964230wmd.100.1540567940784;
        Fri, 26 Oct 2018 08:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567940; cv=none;
        d=google.com; s=arc-20160816;
        b=rf2SsfyKIumwY6gjpaEQUFbZBk/bA4psfqYRV2Q362GZo5y+Q/EyIXgdLZq1nMzbGf
         VCRPgRcUmUCW5ilyG+kBnPaJNqB1R61xd++9hDyJPIv0q2NEwMyRiqaeNiLugtdRi7fY
         fQX0HDa0QfggsVEhmHNQ4i7x616dfd4qY5zTed1Hs1Z28ilCp2rnP9NVs0SmnSFebc1n
         jVcp9RFgq4uLLWbck2iGmqWImguGELpGJlb4u9pTtGdvi5CpZgUsjZ3qYus//h7tVF5z
         SUfsr7PNL9fOikLA8crYO6wYhU/jnPxjiuNpFmsJ50+OB55Ok36EBGnvco5WmOHqhr3b
         bUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=WFc87kg9LBDJnpDmj44WyS7UWtkcUsACEih56d2kGZo=;
        b=KLDOg+YjMKb2UItYp8hUWpJt1b60SQ+6afz6Bw3S8911lhyLdWXeuDhzK7TnU6c4gL
         V135OI4t3Smed6D+otRAd8jkKTj1txyA6t3dzPMd37h64sx6fkfNN+s5nOQLKSbDgNTg
         4eEixMMimA+ESCoA+y0w35+WTmaCbje07B0qbUWR45RIN+azXq1T2SveG5zynb32TaMA
         uowkAvVB7fJi6KRZc/4SuR3H67OuhtYv7yYxGjiTC5+ARpL3KYXs9/4YwllbUqzC3tWN
         SNf8ab6FyTgzCMFf/8c7gnZiD5gHgli2XPsgbAGYUw+lzZYdKNACDuqFRHMZffbR+KjH
         axXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.130])
        by mx.google.com with ESMTPS id t143-v6si3877927wmd.37.2018.10.26.08.32.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:20 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.130;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N4eOd-1fYW2A0gTv-011lKe; Fri, 26 Oct 2018 17:32:17 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N4eOd-1fYW2A0gTv-011lKe; Fri, 26 Oct 2018 17:32:17 +0200
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
Subject: [PULL 18/20] hw/intc/gicv3: Remove useless parenthesis around DIV_ROUND_UP macro
Date: Fri, 26 Oct 2018 17:31:23 +0200
Message-Id: <20181026153125.24738-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7uzmE3hXAIS81p8gYH56fkh6UHOHziydz3GRt0kqKk+9lI6V8tO
 ymcxVNd2k3nNh5OSk2Pk/jxynYGCbtG21Hh/1CgAkkVIWi48rsrCDSx+W4i0sR1XGlWK5kC
 NFLNOXod/A5Ns+fCSGK2nX6J9jQuXZ1bP7IV0vckAO2dQYDS8esPHcMSEKZ+oges4O0L4eH
 Ro/pTH0X+jX3PNs37yFqQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:sMp6R0Un3T8=:UOJ0GTL/xFzLMW0oWfWIC2
 Wb/tFPUw5Dh4J/s5cNR5yAwXQDeWxdwkapc7bVXyEB7qk8b5KLPc6g6zbjOrT0HQ64QjHADx3
 Jy/eAX7Ibk1C3TV0pHnvhXGjf+ALK7PvjZZr6zkh604AcvqGmjNrrLAt605XHBvD1gocDXbMc
 KmgLzntqdGbaJGd5Rj3FZ2YInkY6Z7kjuvfWw3/alimzMA4osUNiXO2MK43tk9gCcThE2DZbx
 2fhGim5AgG9W4uOj0WJNef8Q+mzVEXdb8kdMAqDnRuiZfedp/GvojmlgPZnSn2TQ07vrz3UiC
 6XpBYFAyTaBQ7EWq5F9gK6Bx6nqzFCXrVQeq7KJcjBoutxxntMLX97AVILrCuzgb0cRrS6OcJ
 bLr1tHAhuUb9PpMInWchc417uZgHQrlvfi67OdLltNOW3z1UGSvS1QvDzeAzaOLnYammOejmQ
 /SZ4DFuo/vtcO/ObBniPTq7K39xFuXE/feMgl8RrMxNDSJSVmsiVnlmtQ9v0hwyTjQFoXxyB2
 QO993deYXeBHkKavB1yq98L+sUDD6ylz3m1MIr/hivJaZnHZ89YUApJ9IKC2kvIeIBjx1GkQ8
 h6JdeXvBuzHAdU7bAceIG9aVfoDHfXwJ+f6q9VlbJWtNQPf1Pg2U0PqQv8WgOV4O5VMJjC56z
 hbhvur6+k1acJnD2K45fVbP9dNiRZlWtB30XVCjH6qmiKZZw1t9e48srm2CnaKE7k73kGGdxW
 ngmAYwqy4WUPDYeW
X-TUID: I0mY43Kb3awI

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/round.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-8-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/intc/arm_gicv3_common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index b798486ecf..31ec9a1ae4 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -62,7 +62,7 @@
  * avoids bugs where we forget to subtract GIC_INTERNAL from an
  * interrupt number.
  */
-#define GICV3_BMP_SIZE (DIV_ROUND_UP(GICV3_MAXIRQ, 32))
+#define GICV3_BMP_SIZE DIV_ROUND_UP(GICV3_MAXIRQ, 32)
 
 #define GIC_DECLARE_BITMAP(name) \
     uint32_t name[GICV3_BMP_SIZE]
-- 
2.17.2
