Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp880906wro;
        Fri, 26 Oct 2018 08:32:00 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fY7rCttxMjfodl1vvL9Pk4NQDoAFMpnL7/dktlRdGyxUiMQ7w4gCq8shOI7YR4+BL4bN1U
X-Received: by 2002:a1c:a342:: with SMTP id m63-v6mr6167481wme.54.1540567920658;
        Fri, 26 Oct 2018 08:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567920; cv=none;
        d=google.com; s=arc-20160816;
        b=dlslHW3KRL87N62LsSPrnChRqAR6FB3sw9II4L6JPIlP82vxx6Ffm8zK802V2vJPLy
         76KFzwVQyge89VEaQP4RX3moSehKMabScUg3zS6ZP03FqvCbI3BwTYXmN7GiT2SwGAYo
         nEySSVxWpEoRKM7N3nkY634zmTuoQ4aCRqrRaVz9ky6e9+qDoZU8uYmFa4I7qran2RI9
         kMmWosji0iCVKzu3MbjHQ1ov74iuKu2xqct/ujEeJ+w0F28JAQCi5IYZPVnoF51hpi9R
         faPdCBGv1/qhfjWgesn/Uq+Kncnokc/iixuKS26dTeBBtKWLz+SdFAoNTrH1wCsmtnH0
         E5Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/CsIuiB+skwdhSrpe/BjT+1uzRIbua4QxtSgsnBKVO0=;
        b=knMuF+dLX6lPZangd73ENdjPZQjc20hRLlw3CptmWHIVss8M7vX3Oq+ysVfAaSyQz4
         UDmqevp2STeSPwofnmBto1QX5JyaOxLGbOvwVTZnv6GlaluJqdvZfLOkK0zx//A6+t5z
         ocF47/IZ/u+aHX0pU338wclbyJQ1ENDfZMr+JM07tCfCVpPf+MHCwh9NlcK5zB9W5yXL
         1gsHc/L+hAGT6Fs6U9Ew3PlH0aXjVgXEs4/UwT6k4RrXCJc3ZxF6CvINZzNZpj7xp7lO
         loIW/AAYHahU3Hi6B8bCZhJqaFZRAUvrJTZa2IoMeaTwhldDjSHU/qiWogMrFHtW08wD
         8A/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.133])
        by mx.google.com with ESMTPS id j12-v6si5586994wrh.77.2018.10.26.08.32.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:00 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.133;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M9qYn-1gCTaj3BfJ-005nJ0; Fri, 26 Oct 2018 17:31:57 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M9qYn-1gCTaj3BfJ-005nJ0; Fri, 26 Oct 2018 17:31:57 +0200
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
Subject: [PULL 08/20] scripts/qemu.py: remove trailing quotes on docstring
Date: Fri, 26 Oct 2018 17:31:13 +0200
Message-Id: <20181026153125.24738-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Y9ErdKazy18pRB4sG30VI0C2WaT1vuPEezP7oCLYrbTfLCVfYYH
 oNPCWNLcp7NXxcXxQQUjHLCr2pTZGohUEtfYpAr+KXetrMfFky2zQmFY6CXbKAO3fEh6ON2
 5DUKTcThUbkphkRoQYijLb1KR7+QzpeZ8kAU/ZS8C3nw1gz7r3+iRBRRj4jrAYJrwrUwM6g
 eo+1kef5MijhhbhuYk9cw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:Job3xHGt+as=:7GzYCbv+GfH3YLI0X+i0bY
 wBk2kGtdFyNPJOk0wnMLRyf3Fxaq3CUxJxXMTiJrb0G2IfIRl7oNmgnkrp85B8IbpB2xiL7S6
 DRzg18Y32vgrTfEBN3OBiZuDCQyhz6CT/M1ii77z5nAQ/lubRApo5R3+waKa3qAMsrq/fMssj
 Jm48HFZ9kTI/Hxq/mtS27YinTvQHfNEomASwXihOWkfZ7v3rknVRVc4FagcuA+zdSCA32OHVD
 Xe0bDQj9qz39k8aTVCFHQ/PnLJlBhef5acy5DOkO9ndrdiybST5mZ+cV4+cvMI8nibibVZAnW
 F4ySnL/fwtmqDVPPOjs9+E/SzBOiNEDBLDgc7GUaCmxBFmHol/fY4Xm6Epxp2HjpVKC91fsSw
 0qh9zye7bEc+pqu8E16KphS5YwDDhD7DOena0wQntAJJr75vNc8Uf0NwFAekbKyR0+rLVJUDl
 aaj3lJiNsTkCuzOIzlmW5VDh8q/zvafsSE4/5k2dZhEFBqwo1mERB5ikY3/fHmqcCYp0YfyA2
 ffqTjuYltCtgMNQT9z1jbJT7vQKmJelToPG43+WbOEGf4OPqEFHiWFshayRDcLw0txzrnDiGL
 2/cxafNSLLa7C0+VmJAPX1CmRNHH84jMYgRq+E7lrKUvkL9ABid1mNsemWb8DLccyJ+ENHW8h
 mFZStuKOYKnDyJ14ySTu9HDMpPTVz1R+KAsjrlpiIZTXbqhggj4CCh63ENWSYrnlBd65NjmOG
 3f6LrvJnLsHoQ4J1
X-TUID: EpCRYr3d1twQ

From: Cleber Rosa <crosa@redhat.com>

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181004161852.11673-11-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qemu.py b/scripts/qemu.py
index f099ce7278..b0b2f12ce6 100644
--- a/scripts/qemu.py
+++ b/scripts/qemu.py
@@ -87,7 +87,7 @@ class QEMUMachine(object):
         @param name: prefix for socket and log file names (default: qemu-PID)
         @param test_dir: where to create socket and log file
         @param monitor_address: address for QMP monitor
-        @param socket_scm_helper: helper program, required for send_fd_scm()"
+        @param socket_scm_helper: helper program, required for send_fd_scm()
         @note: Qemu process is not started until launch() is used.
         '''
         if args is None:
-- 
2.17.2
