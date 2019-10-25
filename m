Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3481124wrq;
        Fri, 25 Oct 2019 01:40:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTaG2Z0OMvJXb2I7gyDMIU46qQKvbCxf1cccEYaP6MYfFGEWjOR5RLGNxDvjCwDoJYdvKX
X-Received: by 2002:aed:241c:: with SMTP id r28mr1991196qtc.148.1571992821892;
        Fri, 25 Oct 2019 01:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571992821; cv=none;
        d=google.com; s=arc-20160816;
        b=Xme1eVb87hDwb8Q57uwNfyqHOMFUaG6ID1qtl1cTp1xzIoArNMGTKTxDNIgihLDe0A
         gar1dnoEr+zp+lQ9OJoDlCKiZdPqwnE0CU5N+VqJKwCKgYUJRwGib5bIHeCtfkTBeOOu
         N9PY7P8n7LgU3k9lkxWhue/rj4DfsytKCtOvGgkl6tqDByiCqvYbimEaVaZx66Vbr11Q
         pXhfW+LibZ5XNbjIJVD/MfJvei1qXUzXjEVc3+Zt6JfzgAX87zFvjdDJxH6tMWD7XjRm
         clV9GxscdCszwj9vd/U8mD8Y4G2shYulu3CfZjpVHa7Lc5W4vz0o/bea+yPJdeJnJWCF
         bppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=seX2+bOEjXxBqPQVWLV9R5uVUwFa96PU5xcccbDRKGo=;
        b=zP2ew2yjElXnG6MydQPNIeChsqw0YrGEdkext0Dsy4c00xb9f77iqwCbCTvQoOetLy
         TzCq5aaq8ECGSTCzhVSdVqzLJNnQ76JcayphGkvwFVDzYOO4xdTDa+3WW7o18DGNfLCn
         lJocYlpB8DdO+I14QXGEdzaPNtwXLEFZaPhJ/4OrjbcC5kNscAfO3yThQndaIUpFNolQ
         1zi6GdidQMqsIlRKRIP9KWV67IWHARrAZBGKsk/ji2DEmeaCITKFbvOX9be6Kcu8yQNb
         r1+PDxU6fpVJ+nBd/dITvbeIzjUtK10m46H+vN2z2ETLP2SjySZlmz5G7AXHgq7ayuQn
         ITRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si923474qvn.151.2019.10.25.01.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 01:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNv8t-0005am-Hp
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 04:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49831)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv4x-0000gR-JE
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv4w-0007pl-Ee
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:15 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:35073)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv4t-0007mQ-Ss; Fri, 25 Oct 2019 04:36:12 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M3lsh-1iNdol0HiN-000wFz; Fri, 25 Oct 2019 10:35:24 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/19] pci_bridge: fix a typo in comment
Date: Fri, 25 Oct 2019 10:34:54 +0200
Message-Id: <20191025083511.11463-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nvVQQgc5MFVS936/b96mGlWnp6Tpfu49XvmztenX0c3jI2d+viI
 jaDAhG24rGsfi/n7HEguVI50ChoJciRs6/9rgx5QO4wTx1ikdqINT0kzbVOmxfh1ljbqQIg
 YfGqmgWBTL5GvV0g9zvqr0QVQyt92YrOJwCj9ZBIgRkpGCUvJN+IOsgGFOW4pLTrECnB0uP
 iVIuFXn8KDmXzIKTb6gLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VMpSxzoT4u8=:Mf6ZWvjCI4hgY0rTAoQnZ+
 qL7W7q5AbP4MDJgdEFFboOEEA8UpT+iNTSwYS/T+IRvM+aRHV4NHmMjp7pG9wrjJr1IxjL6aK
 s+klWT2CBXpRO3Z4Gkcj4lE4zFvcc7XQb3Hugr/5OJhtf5uE7XjNCvQ9rPQUCHPDPvhKEHQlL
 kb1nq5rhH8eE7iu53KNGDggjCx6vUilur0UOivYM9a/XJBcUCDVc6khSbA4kZjh4bF7uyr9rv
 /jMSsD1z61dMLSBWU12BL5HfIvnnOyXWxBUvYyhp4gM8UE+QjNsDZrAOCG4MsIjZhnNV7dMpY
 bzeJiuYbktzz1Rv/K0kP+YG7xE2SKoDbLQZBQ1aeqQwCBuHBwJLyQ2qRRkBGv5fnp2Lisn5JI
 agCazTLNNmvSCfQAlLMGu+j0O9VyO8kOD8v6hSZSrOHIckSAf0YPfvS93KT1p9kdHRZDZhR1w
 MfaO7AWU9+znUIwZ5oaUR9GLG+txur6aoC9sVgi0BvJ8jDMv0/wz4/4lbUrSxyB0EeocjDSxX
 E9qm92Rdae3ojjsdK1lHbxnQ+NCqz0zw6RJSRL/xvh4A7bUDSGvtJUeR8rivlXsLGchmO510M
 oFQ4p5kTcgqEmU9MsOkNYYoc7wOLx1nqYlIr+IdrtaSqNVDQBJvhGbpKil+HLSviuRFby2J0r
 q6G0wP0jCaRWXL3oVYsa4YJpxqDAG0ZMG5Nei5wSImJOTMPJ3oMnlGcUU+/qHPKKhzWRVhnBd
 bNkOuXQH/3R90YN7SBQsQpVjMjbSD6k0QnyLBiw3wm5ymkg8p2wI/UgZF+9P0JeDR1J3r5MZs
 PGcBxraDQCzBhEFZPUCMmQ4ZeWNo0Xe9ZY+RvP1iRWtMjiDJRAk9RcVtkdHzIaytguIbyy1Gz
 O1OYTrD870cRe/7lGTbN8fTOmVWdQnN1aOtNuT+eE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8z88nm+5Y/0A

From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190909031446.1331810-1-maozhongyi@cmss.chinamobile.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/pci/pci_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 715b9a4fe616..97967d12eb45 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -311,7 +311,7 @@ void pci_bridge_reset(DeviceState *qdev)
 
     /*
      * the default values for base/limit registers aren't specified
-     * in the PCI-to-PCI-bridge spec. So we don't thouch them here.
+     * in the PCI-to-PCI-bridge spec. So we don't touch them here.
      * Each implementation can override it.
      * typical implementation does
      * zero base/limit registers or
-- 
2.21.0

