Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1272975lfc;
        Mon, 9 Mar 2020 08:30:56 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuHKxXF2lOrLWq+cD2kYEjPunS6l1j0xrK3X9DYKQ+5mnOh0cfDkCr46d8XrLZJWi20kUu1
X-Received: by 2002:ac8:acb:: with SMTP id g11mr15057044qti.132.1583767856053;
        Mon, 09 Mar 2020 08:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583767856; cv=none;
        d=google.com; s=arc-20160816;
        b=eD1oa1lQcs1xlVpmbsBg/DjWmHsmqd4MVQzRtkSCgjegZtlobk2dngctduz9/39nBa
         4tOMo43wwoPdbQGUBrJ6Dp2az4B5CA6DKLUe/13WL87SrjMrFEpT3EpBZvql8eSW5uXS
         bELU1qZhRAfPRLO4sRsor8oe1AQXCCwLzQv/vkqpAa7L/OS2XN16Z3Z1ZPLR1hpNt2Ak
         RItJ0o5hpXizBamNCBij+iiLSK5QzCNycyIQ0k9BIHZy/3pUhXJZOXvV9cZy0FjMChpa
         fPr8K0uRWbkTEoJ0VkzoV7HsU64rOlW+PYLd2S/JhTRY4X1C9C0k2LFa08cc2FOmNu2a
         B9hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=LSF1YjCCTxdYcbhmAYW1icEfrc4TeHf4Q9tHw4Zco1A=;
        b=pTXihCA7ZzymJhWHxB53uOpa7EScLMIAlay3r4fuDj9Ak5G7iXQcKC3AWnUIgPT8zv
         ncuFjkMSMTMPzvRcyk1K8DD85dPfRyeox948eeaSb/13LowLYNwXU19K8e2YHXbMu/MG
         87SeRwXkQytP+MJT8greZqu3MRCT+tdz3T1zdQw1vT+QZ/Yf6dXZQoroADkx6D5Dne9z
         XO4lVGVdOLM6xhA/jGTajrQrDRFYgntuhPf3ktNqcQea4xWnXSUGpMwh0ZnRb7ITAC0C
         vuiW2vLen5Sht3IdXKc2vEBPaUVOTvA4Fko/1hB1iBI/Dj69zEem2MDr9NDC9NlroEdf
         iAcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si4850287qtm.105.2020.03.09.08.30.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:30:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBKMp-0005eu-Fz
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK3Q-00015G-KB
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK3P-0008TZ-8A
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:52 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:50775)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK3H-0008Nh-Vi; Mon, 09 Mar 2020 11:10:44 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MHX3X-1j7DQJ1NK5-00DXxH; Mon, 09 Mar 2020 16:09:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 27/33] block/stream: Remove redundant statement in stream_run()
Date: Mon,  9 Mar 2020 16:08:31 +0100
Message-Id: <20200309150837.3193387-28-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mSpcBTj2bTDlqfXdcTqlzwKJrASnzNpVL6kBP620e3BDhSzp/nt
 SCT2fJslwug8fAUIkbTgpLnzj4rJx3bIA87lX1JcuNAJL24xbH+HB3XsJYYGaFshR2lw3xd
 Crkl5nbnzTnRNt14eITHpNgRvlwCRvP3hBXlgY84WMKbo3QX3VglkhtgwLz4iU7x2GmmEOH
 px7VJllKx8ax5XwROHneg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+ZDXbp4X3g4=:hA3xFJcUFHe/dEK1jREM2O
 rmVrX8XkNiBeUws7gizDWtL7wK7Mek7F+51UjraqGjYN0HprYuVfqDY1pJGUC6wkm/8WX0wSS
 knpNnSl5RNG6zX+16WyWzu/cg56x9o3RcbT+O5gfktn/OIhmQxUG+JD6ppKSJPLCLG/7OJ96o
 eDUczil1VLOLJhuMlWya+I9P0Rq3+A6zepcNHWFP49cM31CGUaYN86bAJGv1nyPI9dUlCWpXD
 YEZJkvt2HNk2vHKkWPIvZBORG61UB/RyRd8K15L500DMC5XdRfavEfEAeCgHzgxoUGM4Eo5aY
 4NnJYSKCcCSX3CA6YQ34RUOSdsIXYFTq5h7qHxguDBTv9a7gVtMkmT+vfcvp+nmnbHPBSVj0R
 r+9BFMVhGuLfLW5KbnYaxAGoR+HKWj9Wq+4kIoJk+Uf+KatfZIQniHZp0WUOu1hud8ODUirRl
 ikmNjEKcbGjPcS9qPVCKsLHYuDiF02RYyatxWg9+KP+lZ2HW3cF7GkFPkTtci8Fh/eg+zSc6w
 HDUPl36hEUoe+WfhDxZNL+CVRuySNCSHqgdqlybRKDRDb6kVICxr+8sq4KP2ywfp0TV8/wf4Q
 ByInDX0/ugwEqDs9cgkD3ketYSbqgz1XakEUOCOY+L5blaMXzIFjcFINBmuJmc+L1T2YJnLZ0
 iyLMZNBJkPdl40DbK5M5aa8kjYgM+cg8P1A/6aD6B+X+4lfrBmaSbuSGL8opg9A2GMqrvdw1A
 hf3ooLntH3YWW7dXQOBiqzisToXI5Rn9N4Eh1NOlKR/IN6bADtGU3PKsC0CLQnJPIn/aPZKtJ
 Q+Kp4VxelDF7LtIX7+szE+kIFCdACmAr9Mt5TflfhjwARfidYYnIdx+PaD7a16+osWR/TWB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Euler Robot <euler.robot@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QzZanw6l62ob

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
  block/stream.c:186:9: warning: Value stored to 'ret' is never read
        ret = 0;
        ^     ~
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200302130715.29440-3-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 block/stream.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 5562ccbf577a..aa2e7af98e37 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -114,7 +114,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     int64_t offset = 0;
     uint64_t delay_ns = 0;
     int error = 0;
-    int ret = 0;
     int64_t n = 0; /* bytes */
 
     if (bs == s->bottom) {
@@ -139,6 +138,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
 
     for ( ; offset < len; offset += n) {
         bool copy;
+        int ret;
 
         /* Note that even when no rate limit is applied we need to yield
          * with no pending I/O here so that bdrv_drain_all() returns.
@@ -183,7 +183,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
                 break;
             }
         }
-        ret = 0;
 
         /* Publish progress */
         job_progress_update(&s->common.job, n);
-- 
2.24.1

