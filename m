Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp880786wro;
        Fri, 26 Oct 2018 08:31:54 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dYF+0F8iwU1PCQwR4SLsTg/wZfs92XYzRW25jNge0gb94ObphSJLIlHz/kkJ7LG1HZsix5
X-Received: by 2002:adf:b519:: with SMTP id a25-v6mr5819234wrd.273.1540567914572;
        Fri, 26 Oct 2018 08:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567914; cv=none;
        d=google.com; s=arc-20160816;
        b=GuVuIeOgWHUDCF3cbnnsMBJUNbGhMW3zEQYQEZmb3vbWKGnDuw4DMXwPL0iHlxKNJ5
         fPVWGSpVGKX+vIBuNMRDdCqZFeQEqzuZ7twv/tk4Ptnz+gYjWojHDc9HxrbQKl/jLsWg
         UpvK0ha+X5la4HI2GqgwJ5LBMM9+DoIqf/KciEINApC9gruCENjdNTJa2Y5z1bdboMuU
         1g4cwEJr6+t12LwqLSESor4oEp14yHp20SE6RP1/A5hIOf7sYYeEFE82j+qqSzk+XPjI
         dX0vwB9hG2QnyHPpcdpNbUhLNdzQ03rq4Dtt7CTcGxIdQlHHi04V2sNLv2bpoAeUwn/X
         qC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=CueiWp4DGxQDHJY4etXxbM38EWqbHGQZb2TBCCD2mOY=;
        b=J1BPjcpwAA6s6/0M5hWIu9pwEcczWTc2vAkn7nrX135NzSE/jSY3uxE18/bHQgn9VN
         kmr66uWiI1hacAMBiF22MGZpIEGlDaGLfxUbbPLsHl3pRmNyP5omUnwZSnadce3UA25G
         Q7srK+GLrN/osFyeGHS+0Vx4vG50v1m4GOVKI7Vnh2l6vZIj9xljb62MejNey3aDYMlp
         m7XhRiM9pkVhTyM1TM8hIAsrUMen7hH7js0Lf2xGJiXn3xGB/su8O4rHgE9aImRga29r
         yIvVRcfGdepRbkMdER6gafHBaujBiAZKAHw0lAuWej11CxwddDBN6C71TYAB6AZpAMNE
         0iNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.187])
        by mx.google.com with ESMTPS id y67-v6si3737964wmd.63.2018.10.26.08.31.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:31:54 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.187;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTOZQ-1gAc183Rs4-00ToMR; Fri, 26 Oct 2018 17:31:47 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTOZQ-1gAc183Rs4-00ToMR; Fri, 26 Oct 2018 17:31:47 +0200
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Li Qiang <liq3ea@gmail.com>
Subject: [PULL 03/20] memory.h: fix typos in comments
Date: Fri, 26 Oct 2018 17:31:08 +0200
Message-Id: <20181026153125.24738-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:kZEj9JglbRW2FesANw2/HZOsdrHk8/OHFw64y91KTz11EYf+3oK
 7ZzeSp8mMDCAQ6bF3DuoD3LlgGfGQCH0lj4lQUWko1GcelP2Dn1zQiqhyL0IoQb6oYg5LJU
 Psxa4KPYBA2DrW6aDL91hamu7kHwdOcATSbSjLa1Yd0pW8bjLxc1PlW0P1MKykgm46Zoexm
 X3SdiZg0xVzI3npVN/nEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:bdivrMHNBek=:2ZJEsyHlCb3wurBMkhn7N/
 4nCEuOhazb+/j0d6nHmbFA2m3oFMAdSFrBE+GkHMhwG2IQestGZJV5YWA8fxOHLZCwFIM/knW
 x3zMmB3mn/SpN+qTUo4C2rodcwYTUwb1lkSqWZmW5Kc8JJK+hnBwXkWreIcrY55T20rgjGkck
 uAi0zE3iaglbYC4HdLiC1LXnoBwphBEkzD3ScjrBEFBlpszewEwSCwn1HBVKUpGeMUwAgJyji
 iPWnIxXc2XW2gLv8E2r7yKsUGLFrfJL1+KF+x4n0YDkT3G7/RCVo8nrYubQvA+zBURLPILNSa
 ojophlfSRbU1shzrqBosYIn2w9AwWm8+rc9dvMOcWSu52aY+L+ywC0M5yfA98deZnlLV5/tue
 TVbSpXbL7+7FChM+2+PX7xfif0RzmIcgw6HElc2fKTVAE/AR6od/+wfHNLu0o8A512RjFw3uH
 VGAVeOrE50jzdxvO3OG5EvcOQNJ90xRhxns2KX6pz38TRc8gf251X7qnI2X95ad61B6TA9WAb
 kZ+OWBxb6b1yvTdn/8WQaQ/Uq3N8fUxh9ZWAnbkEHV2IzK7xITH4JpbgMc/wFRIDKlQbjD6Px
 m6Wo0HeMfAi8TpdHfOr22t/r7AV1x0bJeGxavhfLHdPo9Qxjw4e0CMaD5M50geOF6s8o+KIuq
 wLqCMS6gdbWLQJQ3F/M+lTnMZnPVgmPud7xXenNkr46++Wl/3i9fRe6Xo4yiX0yFqWzo=
X-TUID: sGKjaQ0755fy

From: Li Qiang <liq3ea@gmail.com>

Signed-off-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <1539080467-2976-1-git-send-email-liq3ea@gmail.com>
[lv: s/types/typos/]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/exec/memory.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 667466b8f3..d0c7f0d9e9 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -935,7 +935,7 @@ uint64_t memory_region_size(MemoryRegion *mr);
 /**
  * memory_region_is_ram: check whether a memory region is random access
  *
- * Returns %true is a memory region is random access.
+ * Returns %true if a memory region is random access.
  *
  * @mr: the memory region being queried
  */
@@ -947,7 +947,7 @@ static inline bool memory_region_is_ram(MemoryRegion *mr)
 /**
  * memory_region_is_ram_device: check whether a memory region is a ram device
  *
- * Returns %true is a memory region is a device backed ram region
+ * Returns %true if a memory region is a device backed ram region
  *
  * @mr: the memory region being queried
  */
@@ -1161,7 +1161,7 @@ uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr);
 /**
  * memory_region_is_rom: check whether a memory region is ROM
  *
- * Returns %true is a memory region is read-only memory.
+ * Returns %true if a memory region is read-only memory.
  *
  * @mr: the memory region being queried
  */
-- 
2.17.2
