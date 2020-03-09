Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1276023lfc;
        Mon, 9 Mar 2020 08:33:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvizD/XTG72JRpWLzzHE2d9A8QWL3gYvNuT7JT0hFyYztBzrxZB8BCB6XEKV5kmDJppd3WD
X-Received: by 2002:ac8:71d7:: with SMTP id i23mr1714568qtp.250.1583768028414;
        Mon, 09 Mar 2020 08:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583768028; cv=none;
        d=google.com; s=arc-20160816;
        b=q/l32X/v3kOA++JdRqoQ1U0PDD2ijvHWoRhPAWVwsYtf6wBEsM8Dogy+hLGPJWySdt
         I4MYAi2j+Pflf7u++TJrZ2CWZOCbj77HemRcDkBPePp20yL5S6HUvZL4es3SF/F6MSKa
         tLA0xqlStUeaIAufRecXaocP01pI7ZoueKQ5XrCB4K4zSN7DULNmQujS0SQq5sw4yOjU
         GPe7nl3vTJb90gyDM910hRU9LWGdha51t0ypcPJOeCiPmNBMDkzvrmFzVCG0gyxSTibY
         1Am04yxrsIQ63WAdHFU9HM88EPmusLQ8xvJpOXu08VgC9iMVJvBHS7h1b6sX70XrCjUn
         gqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=rPY32G7PUg9+JFoclFIBOfzMcCwZRnXogDF5jjCwGoA=;
        b=B54VrCli++KdL186dMHLDny/tdokfoGjQ5JVK0CeJEPNyOZbVi7SAqr7xZHL5LQJWc
         4ktqOCz9UbQUT+XnfDg+1vF4HuFGZI8q06ET8c2EmTnOXDD9grWH7cbQ1TIkkpSBK9+s
         OD1TnqZNx607nI/e3quw+0Cs606u8Ajt+Q+zpi2K1G7QV/0LwYvkCJb+8ujGeLkJoEEF
         fZ3syhZmebQNvcg09JwZ2ZWTl41855n7g8xrVy1n6967Edo2uWIssE7xY1SJP5IlDDbe
         iNkhPII9k73x9pPpccGH51usmUkCZmagceGBBAwpz+nq0sDD+CTUhvNAaFPgKcSS47mi
         Mkqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si992661qtn.381.2020.03.09.08.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBKPb-00089s-Qw
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK3S-00017C-3h
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK3Q-0008Uc-PO
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:10:54 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:43841)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK3L-0008RQ-IP; Mon, 09 Mar 2020 11:10:47 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MplPf-1jhdfT0Kcv-00qBcx; Mon, 09 Mar 2020 16:09:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 30/33] scsi/scsi-disk: Remove redundant statement in
 scsi_disk_emulate_command()
Date: Mon,  9 Mar 2020 16:08:34 +0100
Message-Id: <20200309150837.3193387-31-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6U5wEHkdFwT3kDr22VsD0fPTXG5OlUqnb2ZOctZu9kWAsabqMPX
 /lsz5U72zKPEX8SKZiKzfqb7OGburV/dBCDU6bo7WqyC+E8BPUckivUuhMEiR9HfOs9xcvi
 4o3TFnrXxHanpwoOCuJcIGS2XD7qdFGKi1H1PVzXALWeT+4mnoIqJu2NExqZ48ue1LEvuyu
 +et7iqnwBNGqjOIsuHhCg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EKnD7kcJ+Hk=:hC1YPwabFBImO5nS5mLgVl
 nOtTkJ7R+S3ycDX3BfxIEPA3JgfxL2pOuNqS7IxjKEVfmMWwvSY0uT93gdnPkRWF8tpmNovFO
 Fwfu8LfXuJSEPPs2/5qOa9MtOUgwvsew3t3Nx7wrSZ9nyqolYNR0cI9S8FEnLVFVOwDEZ5vlk
 h0D6/LVwym0nthv9tDfBNxLFlprKjjP5+juVlUWExS9ku5XY6FwYSgBF5oWdxJV8lAekbjUh0
 Fb6L1znfPbLYn4K3ueM/Wu2Wi7PVOY9WgYIQ6s0Pd2DC7JyyBCR6LWhdOhFD6/rqxrbYVruQq
 LskQm3AbbJmbHlD7NUx4a64H+KvW1wQzSfcMdMxitVXIvbH6B+gNjBJ40FuX1BF6fyojFxfGV
 c7ndvWn755btxIE/2DnGq1xnq/tCx9lyixwWQ0u8D+h67fyJvnN7KkKSSoJgFhd/8Ryhaah1g
 rBMq672qGOnOSArZ1T0Dj0udF9pR6vxPsVNaOCQA7sLdRhp+nYZveycScl+TmDhq5fnFPiywx
 +3BtjiBGVElddVZeIwPKh8zhbVqyUed660ZlfPCh2tSuGdHyLsr7BT1JuElr/SsM3ar6Sy33Q
 N6Os1qQ+zkKE6KZ+zCMEy4d7sh/gz3cFfw+Mr9yOecL3/9IHIAmhqBq8CgfwM3m6g8zULo5cm
 cWYsSN9geXwdImFXBmpyVdqeHZRoVPHoHuO8C25M6wVLidzsoTT8zTc9gTHgvxnV/EtL5hfQy
 AjQrIaakojbf4pdXe0KDgAfA4sTVB5FJZNfjpZMsKaAE2TMQpa7HodD4bruCI1hyq2PCxQLmQ
 DTSNR2dBp78JRVgOPVkOsbs+O2Ybp6MnSdlzPTWe/I2EGnb8TrfSBphOWYsqtCuLBo9Ru03
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Euler Robot <euler.robot@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bk2Azq/luewk

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
scsi/scsi-disk.c:1918:5: warning: Value stored to 'buflen' is never read
    buflen = req->cmd.xfer;
    ^        ~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200302130715.29440-7-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/scsi-disk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 10d0794d60f1..1c0cb63a6fe0 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1915,7 +1915,6 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
         r->iov.iov_base = blk_blockalign(s->qdev.conf.blk, r->buflen);
     }
 
-    buflen = req->cmd.xfer;
     outbuf = r->iov.iov_base;
     memset(outbuf, 0, r->buflen);
     switch (req->cmd.buf[0]) {
-- 
2.24.1

