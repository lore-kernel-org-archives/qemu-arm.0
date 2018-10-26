Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp880897wro;
        Fri, 26 Oct 2018 08:32:00 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dM/enZhe7Fojuig2GvShx/9vsSH7OQbIolWxLkp/fsijtjWxoSy41+/SYZvUapkE3gwtA9
X-Received: by 2002:adf:b716:: with SMTP id l22-v6mr6668665wre.157.1540567920270;
        Fri, 26 Oct 2018 08:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567920; cv=none;
        d=google.com; s=arc-20160816;
        b=vTcSclxE7wqP5OYO0XxsvkReiywN1ZlDfLRHDKdfy5m4xf8YifyXJ2PTiOId52AZBw
         SQc3STQyPb7fycsGgnMHFNzXauUIpoJWE8wNJWSwSobLZL0eNKbzmzV/5VMhvkKiTe2Y
         zbcKPs2A54Y6Hc9CCL4HjSrK1BAHVfh+Z90HQ5qU6qwihnqGi2Lo4uSU0d2SFfV1ftAu
         e0ECBy6+PgaMP6xyKKAi5CFLwasbWrmrf6dEI2gD2EYlUhwFBWOPukAJN8GKBDlRjEtR
         SC2wqSvbEClDHWsurTh3PtYd52ba3r/oK66uhyxKUsaV7qEgdwRYg9PFLWtn2ZDK7O1d
         U1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=W2YOHj5Pwm8aShV3wuWNO2BSWNjXz4ckeADk7WwbePI=;
        b=YrYvKiTtVac3ZcNkX/v0QwZim5BZrpgAHU2fawBFNxmJnrJejvFVpFVyTWksm0jSIW
         KiMz682hbdwagTa7xjif0aSpkYtUprnLEN59G8Qi1PRk8hCN4Fl8OAP8QdfitE3orMzz
         Y2xoBQWw2MavNOS2VhqhEzAjaZ7eNopQ0QxLYl/Fvj/LHI3SOn0kyj8ZwYCzhYQMgxiy
         g5YNKxEAWJa1dFTrXgRGpA0Zv3V2p90c1dcT7bfHDHr2rKib2++4oHJLrdM1OBk5/TBE
         8Xna70u89C2r3ukneMrHhcCJXU3DNXBlU7IPaAJ3BeEe0ac9LBz5swRmI6cFr8GSvoNh
         OtEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.133])
        by mx.google.com with ESMTPS id z140-v6si3640095wmc.78.2018.10.26.08.32.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:00 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.133;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N4vFE-1fZLOI3GmS-010wFj; Fri, 26 Oct 2018 17:31:55 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N4vFE-1fZLOI3GmS-010wFj; Fri, 26 Oct 2018 17:31:55 +0200
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
Subject: [PULL 07/20] scripts/decodetree.py: remove unused imports
Date: Fri, 26 Oct 2018 17:31:12 +0200
Message-Id: <20181026153125.24738-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:U9jVNabS9lDH6itzy1tIuUq3Dt7MRpDCm4Ceq17/qNHbC9X0h5c
 bdPdHiYmNSZxMSWmNkn3Oqhzdl41sly6mR5dEgnur0/O381eFifPyK1NhpaDAa083Hkd8D2
 4K2Ck0+J+3JsvqwaEfnY0RYawswXFFy0uDk+1ZcXjEOYrKcN3mE3bQ6uSDh2NuaUAyegpdC
 /tuwCWsdh3QnYJLvvelbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:Z8jlqrDC1/s=:yg0uejzoMUY3/zwEwpWOCv
 74RG8Fc4Ywkp5e2ZiVqgX7xtjDy/TJgkjLt+wtQhUYZCUNW66pUVPZU7XEgXV/GqG9z7Muwxq
 v/MkIOuluji8QQcgJhr+Yur2nO88B8Fc+nxpWjo5YNnhEIHDntW9iZ20AWpS4T2eussjUGM0k
 Q5C8F/Xcglkp738LY9a1P8LwbuLFt4WgWqtjsktBQdRIOrZh5ZBVWp2kfT88+QcAknWLdm80V
 90bk+YjQvfsvK/O+E/OKhcKT2ly6RVigg81LT7vkY4iXBD6QVKwGQUzQ/nm0n2voXCyhPbxbl
 WXverTlelHZ6YNHEp/J6OVopu+L0+ozxd4zoqLOQ+tkZG6Y3RdhnP7RhA1xy+Cr7jMzau4l8v
 9QoSsswgXq28vIT5miwyupdvHdro3BKZUIqskO8yI2Z4e81EPL+Fh++ksig1lhExdVKFGt9iR
 OWRaGHrkULfMA6mmcUp3boiLm23SnR4+fItTA8a7aTGqZJxM+nSSWnat5ROHHYpprvMmKYgWe
 uOoZjkxkgbuL6BWaABBkZ8ALzWw1NYADw/7ShPtvWVW4p1LyNVVepVkCKdXQ3MPkKL9P1LXIV
 tnOLr7pXDPHuA1WZYfyQzqqjze4WD7mPYMHo76Gmvq3Pi6b1KQn72pSZwq2b7pD39NyTmd4Ww
 AhAXup540d2yjasVFchKRMJHXhhHv7cACjL2vlRlfSCisowJRyVvSk5PRa9bSAMsQy5a2Dw7t
 lz9YtcQ6hycHLray
X-TUID: aw8B63nekShR

From: Cleber Rosa <crosa@redhat.com>

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181004161852.11673-8-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/decodetree.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 277f9a9bba..457cffea90 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -149,12 +149,10 @@
 #   trans_addl_i(ctx, &arg_opi, insn)
 #
 
-import io
 import os
 import re
 import sys
 import getopt
-import pdb
 
 insnwidth = 32
 insnmask = 0xffffffff
-- 
2.17.2
