Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp881034wro;
        Fri, 26 Oct 2018 08:32:06 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d0WR7cB0q0NiuKDL9WNT3DPDif72b1xIIPRlYsij7MiCJSw2Zn+d4walXV+XU1JSFwvsbo
X-Received: by 2002:a1c:118c:: with SMTP id 134-v6mr5691105wmr.75.1540567926187;
        Fri, 26 Oct 2018 08:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567926; cv=none;
        d=google.com; s=arc-20160816;
        b=DHIWHcZTe9PT5MYj8iiRJk9UHQeHGAcIc43O9TQ3dgspdYt+wd8rARKzmWv3aNaxRU
         2jzQf5wvJmchyTVwRLwLNo6PLgojbRNt4gHm3suxio3JuJqr+oqJ56usVkW2aIAV6s4v
         /ZkhwkHfyK1TYZ+2D2tKu7Lb2wqQkTxTRZUix1C6vlyQKp28JD8R4jnDDwnyVOuIsbTZ
         TbqesiQ3S8B0+8T6zvhNAz2okPSkLwzWWmX6D1QVfNqwoN2LbnyC59TV0MuMfkg/JSaI
         HoLEK7DdGBPckHipaKXaHZAWbeIKwe+SNs8QhX4YAmshGlNx2sY+nQdGeM9HGD8PNspY
         R9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=H1g7uAYFfliUFwCjuIzZo0P6uBxcYGghcQyoLVgeGRw=;
        b=Vh5TiUh7YTw11EbH4rV0a4KuU0waJgo34yKA/TVFGUKLQemIm4JcGHPT7yttMDKyhJ
         d4uzYOZIXl5mVAWNpzi+nBk9Dj1gVxsEb844vZTQ4P/do7aXKHBEaN/W0HEI1d5MYwVd
         OSPOexiS72A0f74EZU1zk0jxlWyScTcMi+zG/tgBWgXKO3Ap8e4FuwTvMH8g/sG4cttL
         sNdfROTKwWmmfHPcWQeOoI9tzF3uWuI25+y7arAAvwzu3b4kUyXl77ZMhzGM1JSNDbb3
         anqABZjrlnRiVyvtfnCFxnkq0AvsP/ppQDzZSxbQLovIPxKEIeQYNWBVu5QMpxBTAc6+
         2t7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.130])
        by mx.google.com with ESMTPS id b11-v6si2121503wmc.144.2018.10.26.08.32.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:06 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.130;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MN67J-1fzMYQ07k5-00J2rW; Fri, 26 Oct 2018 17:32:03 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MN67J-1fzMYQ07k5-00J2rW; Fri, 26 Oct 2018 17:32:03 +0200
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
Subject: [PULL 11/20] cpu.h: fix a typo in comment
Date: Fri, 26 Oct 2018 17:31:16 +0200
Message-Id: <20181026153125.24738-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:Y9I56rcz2zqBUdx9sZmh5haNlZFYN90Tlg6dIVa2wH4bczZqV/I
 5dk3p8ZA0jjfSgIQr56tEVjM5iTNvvSsr0+f/UgDBHoajTSbJEZvjbzWNxn4VdEemIKmcSi
 zVJfYCRgPCdXZeD+qo7L27VnJMGH3J8WbPYuPT8Nj+UhBAUYlI5NXQUvZdZtMjHwc0qQBts
 irxmTF3hu/8A4/HDYnJpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:q7UIvLoxIig=:77i3K5nCa2NQaxpkSEfQEp
 xmB/GpNuSkOERzAV4BOqw3CNL86mSNgKG42SwdgFHGxE4YMWN347JI1HdeVV+g04HkNNSh2Ez
 8bgTZ+opug7EmeSqSOnYFiwTX76J4wLBuC7tNFi56Lr4rxTqBFTrXocnBn2u15Q0oKkwybdab
 7VAPUWenQ6ZKPvDZFI+gauaRuNq3gz6hXPe5gX2iE8uf2lC27lPJq2J8N5Zzj90Regqh9tdP/
 T0AUtM2JzVbNriGVgUOJTA83qhquAiByqROcOsN2VS1jivMwhBHwGc2gorARqRnYw6BNTFvEH
 D6O6w6UHHXV2AyOJH0tU4twChDdN/C7Kdz8k//M3bF0e8W4PnPPfXn8n5yP3zoNC99ojL5vRx
 9L6GCQt5BqLQ+S9XQMlo2mu1gudRp7bno3NTusou4COu/S2sZbpagAiBWqxChxsw5nkHBWyT8
 wReFd1kGd53aL8YQA+sokWdblwlZ0gRudVfazWSf+g6M+Tvs3IiVk8lgBKDIAY8Wh1tSwjZhf
 cVojfiJZD8bN2TYTFKtUXr8S+Fi+j+Nbv96OhpC13+wIHxEAyDMmGYW6/CNFYXb1wEE1fttOD
 mEIQ+oXxWNZdVf1R79ELvlQxzgc0LfBenSWviPXo/eMCO8unq/q/jT2VBl+l1Pc/dQTV7Q2+t
 r8cZwqeB5DA+W14t+80pkMPedHC8IYA+q7aq5ory7oDdD0J549RsHt1XYDpPHZeNZLbM=
X-TUID: 0207RRvz+vGK

From: Li Qiang <liq3ea@gmail.com>

Found by reading the code.

Signed-off-by: Li Qiang <liq3ea@gmail.com>
Message-Id: <1536150548-2797-1-git-send-email-liq3ea@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qom/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 4e238b0d9f..def0c64308 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -852,7 +852,7 @@ extern CPUInterruptHandler cpu_interrupt_handler;
 /**
  * cpu_interrupt:
  * @cpu: The CPU to set an interrupt on.
- * @mask: The interupts to set.
+ * @mask: The interrupts to set.
  *
  * Invokes the interrupt handler.
  */
-- 
2.17.2
