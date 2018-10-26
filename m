Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp881143wro;
        Fri, 26 Oct 2018 08:32:10 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dDeaZJy6XfPLqeg0MlmNPyKkd5JKgL7MmdMJN5KqQ8Wy3v2WiEIiubYmrOmsWzwxXCfA4l
X-Received: by 2002:a7b:c00a:: with SMTP id c10-v6mr5785099wmb.73.1540567930787;
        Fri, 26 Oct 2018 08:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567930; cv=none;
        d=google.com; s=arc-20160816;
        b=xncRvq7FGPd6QNVyEOKV/XlAbiPQuj7JOYmYgQDX2HoPBTZNXGmrJplHAMj0ayoM1A
         RA2egOx0YlZAtVb4RTh/E6oRgYQfT0k/iTTI+CWkIomDo1KWlaMmegjsCWHdbWDPfMH6
         aBodDcd32lfiZQv10VDNcEeHe4i+n7RnLeM/i9kawm2gUPfPXIpumB++fj6ZPERRDWUP
         kmUpzqI8X0HNg+Dy1lZbggQF3YUzVAmHFZQMNjaJN8eOmWceI5ky6D7laqhoCrChTgqH
         h2fty8Tq83nziMaFtkjX67JtL+LfXMQ/qhsVPFX9Pq771ZxBUhnO+DkZ22ymAc5nUm2I
         2Nfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=88O8zWo5gTsUf5Y4ILIm1tH947c0Qcevkv0KFcaRItM=;
        b=pRVu+hnEyIJKEFLpuX3g8LIBrjJtxGqqe42Nk3KwODzCy/DVxKHmoCWa/sv1wfr+St
         Pz+crCYZSo7aH9ldEthQLTQUOjScBdAEHHWi9CO/xL9ZBzrsdvYEniJAXIkC0fWTqMCH
         /RanSNPjXKbxM2wMa7nks8lRSePCSlkvYLEJ4BcqzPwHHf+82RshHtDuEJRKojuqGEO4
         VDFGAkb1K4lkwyQTvmnVDlAyHsHkcck/+DC3o/p8KJmc6riI7Fulj26379MVgDfdVHc9
         WNnMa7iCw6hEU5n4xi+ru7qNvHFlxA+btH8FFmpiX77eEcLbyJ1U/HOHzrRHWVeQbkPk
         lFYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.131])
        by mx.google.com with ESMTPS id a123-v6si3990037wmd.70.2018.10.26.08.32.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:10 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.131;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MqINP-1fkWcM0r3b-00nPqS; Fri, 26 Oct 2018 17:32:09 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MqINP-1fkWcM0r3b-00nPqS; Fri, 26 Oct 2018 17:32:09 +0200
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
Subject: [PULL 14/20] qobject: Catch another straggler for use of qdict_put_str()
Date: Fri, 26 Oct 2018 17:31:19 +0200
Message-Id: <20181026153125.24738-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BYR+/FPhEvEIEPaEM5ke2EXSPWYCalHZ0Y81g7n3v3Tl3p//XTQ
 o6GosBJsTIKYw/euWRnKMWZD4sKg4mcJEFHpocdLHNonF/yZncm5xqg8lu93h6CYOkdBT/n
 D38fB3r0/AEutCRHTyOewRUmSkMX/pm+hxr3Ro9oCVuHeDRl9LWBcYc8HoHHTw+g0uS7n3F
 NBROm3ztSMeuMNBqmkFEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:Fvg2WalvKo4=:nBzqshRJOV20mzxB+QvkFN
 awi2dQnkDtBvX4YV3SSHdiONNwwKlL5XWpYI1YXMBQY7Mq5f3nfuGlNeXjGMUf3m+FEmrVaZJ
 11R7omVgLeRdzviaLZ5ZcqZRvc0nXXrEKTT0buFO62pMeCBpdMsyMw0w/gmKNALVQfD23w+Sp
 VHokr35LpzGOGVUQkh8ADFrQjacCzYnV8ILB4nuRevzd0nK2b54P1Z5Xuxo1UpMtFO8PvvJNF
 7qWw+oZ7MJlAXPpPUiQw8xqTu6NFDkF4oDbrqRqj2Ws8fkIBejOHIy/yUvURUIs+kXUMlwetl
 Du5AGvcQZqi036ahTuAGgtgN/eB8JdqY8bU+Tf0Wp5M0Uvz8kNbUWDfYetRK61UJXl5CZ7KQY
 dKnzy4QFZHxGKpHdzriIE/PPTFBKFp+mXMUzSuEoCIbT3frYSr6UdcviHwJcZphZXWsnHmSRr
 21Cg0SfHVlGn2DX/VvvMrPU8LyDespxfpEEmqxlqJgcnG1eRHxvUt0q/pFTuIWOMEEC9jkdKX
 b+d/gP9KS/yjb5qcRriqYA8oFvZKEsxM4zCuMWGHOgNaTq6KQnOQMZzy1vLVmwIW4dzh72B6d
 jeQsbdXwqPMWViEkobCI1qabdyGwFMWmlWYWOsCbGQCmHXXDLoV/vfDlHXpB48X2K2EJIQPM/
 OTY6fGK1P6BND3wLNryRETdhX2+2ixv0ux9lF/juSfNI66/PCgvjJELL26CFnpcVsM8USxNLb
 gzvHG8A8Zcy25FiO
X-TUID: TbRA9/DwlFWk

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/qobject.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qobject/block-qdict.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
index 42054cc274..1487cc5dd8 100644
--- a/qobject/block-qdict.c
+++ b/qobject/block-qdict.c
@@ -577,7 +577,7 @@ static QObject *qdict_crumple_for_keyval_qiv(QDict *src, Error **errp)
         if (!tmp) {
             tmp = qdict_clone_shallow(src);
         }
-        qdict_put(tmp, ent->key, qstring_from_str(s));
+        qdict_put_str(tmp, ent->key, s);
         g_free(buf);
     }
 
-- 
2.17.2
