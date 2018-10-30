Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440123wro;
        Tue, 30 Oct 2018 04:24:00 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fNcYpiJGWoRw6a4S5FyVSbrRDbn3gKPekBdV+KynOC58dH1wi1Hc2TgnUuDfoXyW/sj41o
X-Received: by 2002:adf:82c9:: with SMTP id 67-v6mr17047038wrc.131.1540898640860;
        Tue, 30 Oct 2018 04:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898640; cv=none;
        d=google.com; s=arc-20160816;
        b=ikkvWEKEbcXMzUJTV9dIGiSsiVetUNL7s+M7Ozl0AbCJG9N5OYPtUzplKRRfd5haNE
         XYtiFvzDnkrkpJx8OBWo6jJGAkWXFKX99G5AIj2BQdbT/GI+lEq1WnzUytevp3WLqO4h
         p5hvi+C9Q7aJEQZcA9VVhuEVTyApE9RnvbQvlXUt/ja3cM9lxV4Ol4lsaAQQxy5/HjJV
         bXuK/uTtBIYFlai7g+vqb49oKnEwA+Pji5atdB67bqSIKb1krk8wqRpvUa0wJDDb/rjA
         jB1a3tJWl6pKmVSJDB79YW91OMdUPBJnXMEqn1Fbm6Kg+MtndbliuPRpmWRYkz5FWdKU
         sNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=h8Is6ZlK6KghHO/McdY7YhiNvQhp4nrDR4TpXrDWhRs=;
        b=UaZyQjOF7p9cv11Ys0kUbKBF33zZHp9oNR9hPQUz0uIFz27YsMHVHrh7XUVE++UE2q
         EUWfUR2wHDdpMDuheX5XnfyCqHqk0xpBST4raxBuVa5Z3Mptj0GEE++SDrUS83LS5vie
         fKT6N8wG7QJ2rmY/trI1sacHCQLC63lXbMR7QIXdITeTRiW2lRikh/CmQJ9VYFbzRWwH
         By2UcUY+f88VFWSGjvkOA5eVyf+iWmbC7CTINIoSFEzcpxxrScGaZXS5meOklW6yzEO+
         0WnGipiyW2ZZ6HW1txyYEh/4vOBs/lCYhg8e+deAG2QpP4i7iWK6pGwvp/TUM4TadkbJ
         qhaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.134])
        by mx.google.com with ESMTPS id g5-v6si6603832wrm.253.2018.10.30.04.24.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:00 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.134;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MdNoW-1fiOQE08I4-00ZSig; Tue, 30 Oct 2018 12:23:54 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MdNoW-1fiOQE08I4-00ZSig; Tue, 30 Oct 2018 12:23:54 +0100
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
Subject: [PULL v2 04/20] tests/tcg/README: fix location for lm32 tests
Date: Tue, 30 Oct 2018 12:23:21 +0100
Message-Id: <20181030112337.17973-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F8l4smf1nL5W4DsrL/7cTra6H6sZJmx/uvzB/1jWx/wdKk/NVxp
 m/fq6/P0ALLGTaCdkdXooOLOe8GgI0XFOI0jqL6wU/uL32dCmmytmJOvG40vDdoivXgaMTY
 M4UmUveDPmCbjaUkB6SPRFzmAkBQ7ibaH2p90ew21v1SCeCuiT3cCz9p+K7+scs3WGgCzqc
 1kM4wMQC2oXZpiX9tZNjQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:OPbiJZFlUtg=:6UDHRGrOhs4uRU3/KtYvSw
 JPuR5jLG8ZkuaBXlmbxZ8h5Te0MlKiH1Sx9O8MbGT6Z0frkx3JC9bKvj/v3qO1oTwRu6/Lt2p
 +Mo3kkzwKoP4r3n2oZkuQDjVl+fvUtpdI19jyeG4Eblpnb7e5fdSt21hhhu8FgvADgAUlqTe7
 jYfDVl4kI9/CqArD5CQdKC2kd8xy0SzdqpyTrTuNBDwYtFLEEpngDGNDGBAftp26GqiExsGIX
 zzlBjrVD5gi0PXuN6jJQSI44BFgEgWn/m8MswbJXFMyyA6FZkccEpi2aNgUtAyP5tWlLb8ivA
 AQK7eTq7916LYMPAD+/bLYblvQ3Vw1VuMC4X8xTInVDfQl47b8ASDXSTzCKjEJZaXQ7G5bpe5
 8vzAlsOaCKeLJyOmSEODYlNJ2R5LPONDg7okAChcO5682rGabP4D1wEYeCyznLX/8ioMZq4tX
 d/0EYIEow0m/JKrKGeYs5aqGjN15l4aGDwp16ehnbBVbIkaHbgawNfl5INwQWMSTf6UyIfkuc
 bnkgdPtUBETO/Tm1DJlA+gtXb8w5TMX35TPmd1izoXoMzQWyjFXw+cISmGk5OgPvKhH7FJuwz
 g/RdPSoTYva8w+2/Qq93jWQstEOruf0zB5/bXlvvf4mi4CL+NR5v6wj/QJnyMngjvU02yN7K6
 d7XPWYuO6lv//2y430+cnd9rie9/F8D5R5qJDKMQjRsgz+QbPrpqX7WzIZNVC/g6UUN7AfLrh
 8a7Y/XO3wclCG/RS
X-TUID: tgRi8hp+Fzrs

From: Cleber Rosa <crosa@redhat.com>

Point to the right and obvious location for lm32 tests.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20181004161852.11673-3-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/README b/tests/tcg/README
index a5643d33e7..2a58f9a058 100644
--- a/tests/tcg/README
+++ b/tests/tcg/README
@@ -10,6 +10,6 @@ with "make test-cris".
 
 LM32
 ====
-The testsuite for LM32 is in tests/tcg/cris.  You can run it
+The testsuite for LM32 is in tests/tcg/lm32.  You can run it
 with "make test-lm32".
 
-- 
2.17.2
