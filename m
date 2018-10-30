Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440184wro;
        Tue, 30 Oct 2018 04:24:03 -0700 (PDT)
X-Google-Smtp-Source: AJdET5chjToBg6fmma3hPi60BIMB+/5hsusN5ytLIRZJom+qDdWefEh9O0mq8Bjq0bG/Env6l2Gu
X-Received: by 2002:adf:e7cd:: with SMTP id e13-v6mr19220925wrn.115.1540898643254;
        Tue, 30 Oct 2018 04:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898643; cv=none;
        d=google.com; s=arc-20160816;
        b=br2MDWD0F2Ru+QfVp/e4rgP9XAQGrMfiCURIshPpqxncQlSA8FTp0cFsRekXeqr4eN
         McZuP53iMvna+WqtcdmaT1vtVC8PCyt7BvfAsIrVd7uj7FVpJi/B6m1NJD2UeZTBqQ0f
         O3R9ESKVBcbfEzQOhvNcnAY4PEJbTUG+6Pe/ONoNkylq2iGTDU+IBkj6W/W6CmCk1FWX
         ENoiMMlIREgC2SuyvW751vnZIE6EA07qSZQpF5tZqEi9k5DuGKot9DxbjHz8iC2LuDzU
         HiZl9wmRlKW7oSvFa3cf8cah1W3peWpHYUvZYamXuuhEz/HJC7hIYezgFhJpOwaHFpuZ
         4GwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=W2YOHj5Pwm8aShV3wuWNO2BSWNjXz4ckeADk7WwbePI=;
        b=NWc7RD1nxyqqHHjtiz3mRr4VQYpPp+VdUsCK9ZA5dNqLZ2g7AAwe7fK3Q/KK0Lgj2B
         Qw8o6SQmc9Fppohe6R25wzvxXDR9LK3J3Z9uS2944shrAmfSC/FVMvkYrI0xERyszV3q
         U35rI+vdTzlFlyj2+oJNxtvmidc5IoX7Imt1xq4d0/7Ew92GXExFngWzZx3nwsd9dank
         NUIfzWXqDocSaMu5JtNODSWSD1hItk1aHV35zL9bzm8DeocBHRgo0nPDCe69x1fFeCgK
         vlpSbqOEnbZBC1YV9K7YoQjK8NVI6vXO+BBrdDPofHJeCTprNqrw7PKR4x08rfOpaqTo
         1r8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.130])
        by mx.google.com with ESMTPS id e197-v6si12923425wmg.125.2018.10.30.04.24.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:03 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.130;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MOQu6-1fuwMb3vR8-00PtOG; Tue, 30 Oct 2018 12:24:00 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MOQu6-1fuwMb3vR8-00PtOG; Tue, 30 Oct 2018 12:24:00 +0100
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
Subject: [PULL v2 07/20] scripts/decodetree.py: remove unused imports
Date: Tue, 30 Oct 2018 12:23:24 +0100
Message-Id: <20181030112337.17973-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Q67xc6fcWLfjbG7Ml7jpS1Aya7e9ae37lnkUty+YWGKEVwlvsPw
 tAf2OifniHA81i/uHFvQud+ZwGtJXJS5utKj0UMYz55wPI21InZVZCgYdHJEnDeOO0NW0RW
 pUPOgggjjd1m6OQQXuQ5yeN25RmxdabzLdgGY1/KGvCmLYzPOc509Bdy4NMa4FD9XlKiWKG
 vdtsb0ddP8BpUoV8wxuHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:B7DB0orcvlQ=:viB53D0U/y5OC/zItp+l8+
 jcS9reEAgNas082Zug1uXgfMTR7jJ2wEZVY9DPxEVHyzqrXGUcKLVWth5YSxo78DQuYnhEW4V
 kDejINzHR0M2rOXmsah50i7Alc5nA7gw/A0vAZI0439g4yM9pPiWn+xrqxBNFNcX498MOiN/h
 3nIqO3kWOLbpJQ6GCuQC/sItgAPLuRlD9WOA2tr3Vh9FoYvZTgQhh1A+hd5Q2EGzW34lb11hb
 tkxK3JVP7wfO1bu6hTYB22cpe2tuoUF+YHThzEHZseOCnLCn8QXWEqlLMRYIEVpvWCNBcvoGG
 S48qamGeVTtvoDY3N7mts/wCy5bp+qYRD8VmS9FW0xYDLMtlVIE5tSqIC/D6I9GRwn5pJU4+u
 b4Tj1+n/VgfF1TCTkkbaHqp2s4j0WAGkZegsvzBpZNVNHcNNFd6qe1anRMbdYN7Q2tdlQx48C
 iNWQYPgwZcDDT4norsuqgvVQbswy73i/m9+5a1HA8tUOjidJWnp/knIS7+QYg5LRNCDYVFtfS
 mQ9/q9k323i/UA41woCDG7eKHj/Iqq2mdU8CS7UY3tToyCCBLXClKbRO15yPsBOQsWEqhqPNi
 dTNYOTa+7qG5l592jJ/eYi8D6FcOKjNbkbOUVDK+0h7zWVBYdYSUaB+r1ykDo9ONWwrSkmVkP
 vP3blloWjqKCumjFRCC8vnp652kg4EUIYbmA1954S7W3zxWXmIfjXQ/Dv+CGOM8sX8HfykvHd
 9oWVpESufZ8Bsv+q
X-TUID: dE5k+vpdWjuc

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
