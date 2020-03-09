Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1253259lfc;
        Mon, 9 Mar 2020 08:11:21 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtkr4u/dRr6izec772kGD7gBpz/kE+qW4AjcR4DS+n+EMQRRtpwxFaHBsNmOJ3LiH0Jgd0V
X-Received: by 2002:ac8:6708:: with SMTP id e8mr14628671qtp.229.1583766680718;
        Mon, 09 Mar 2020 08:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583766680; cv=none;
        d=google.com; s=arc-20160816;
        b=ydzQ2IsFcVxX6SH+WuCX+EYYzo6Q9yUA8rn4hW4duTp8shK/yjt3UZwTlf3mVvVLnr
         HF3dRw84Xwo4Z7Q318ndf4vxbfvBuUdfjivKxZhDAH5VA2MCBWFjW2addHo9t6BN8+KB
         KD3V+X0WFWj8Ersa6sFNtK4C4NbhSnk7DGt6fDkWHj/R/fNGu+rRtQcjUjyd3HgLVwKX
         nJA4KQ9ohYWAzwQeyk1ivRRwmU8TdIRowsCBDlDqQvP7MiOWgkYVEETEL0WEm7BSRv34
         rtF8rpI6so9mt+fDwlhDUsfHzrtF0RzSmwVgnD7YjQ61em3tz1yvEyc1059uVIoJaDI7
         ZQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=qqG5iQTfsZNIfan7wqwSH9OXIMZtyLz3gEo7r26j0h0=;
        b=ij5mSXYlHMCqT4Mta6904hB2ufw6e7Jhm18RUltBDJA4IKzMWFGuVQd3UrY09U9TFu
         NDvT4ozVk1rrXanM6HZ01Nia0N3v41p/JNZwrpWHFl17wj8+gpgV86MudU1FcP9Wfv0Q
         qQRpcJu6lyj8U08NYTgAalBe/qZMGzDO7NHcfapeYh58j15NB6hOf6Zw0fYEfY20XXq7
         YWRtM2SPgfZsL3yxgZn3pa0qGDtwctqI76T2mupLUOKNDZ6J7L9ZcmoiFmC+joJ26+I+
         B77EgxlczFijs2DwhIVQD9GrqZIHCIbf50SAtrtM2RL/CC/NMXDYYweXQcIXMHTEWhSi
         F2cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10si6059379qth.16.2020.03.09.08.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBK3s-0001DL-2b
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33395)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2V-0007xI-QF
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:09:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2U-0007iY-KA
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:09:55 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:36727)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2U-0007hq-Ac; Mon, 09 Mar 2020 11:09:54 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MGz5h-1j6f2k11LX-00E6BZ; Mon, 09 Mar 2020 16:08:45 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/33] dp8393x: Mask EOL bit from descriptor addresses, take 2
Date: Mon,  9 Mar 2020 16:08:05 +0100
Message-Id: <20200309150837.3193387-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+TAkKLV0CIXTz0Mr9Xhgny60rXsV/drmGR3EGLSIm7g4KaxGwJI
 G9/nP0tkn2RsIVSHMo3zDeqfWVPCU5u8OsIGMRp6MPT1tObWdaR5XhatwW5JtZaeoGsP9hK
 x4kCPcJkFNLak0tc9qIZe13RsQgC3/YogsfGkwe/EFem+BGe1d0vqnByv9dq45pLrNGFase
 PtXgyvDDGPTc4EM9+D9pw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EbA4j4yfY2A=:CQ09mVT0DAh1Fg/k4OfT0F
 6LewUgHUDckKH+qV1GR4e8ySJyFS1F7oSJSySzvqe1pZDaMq/gwHJZUO9vKkqtmatAr2YMbxD
 8wtxRXH5OLzWonGxXBjvP06irGV8X75YTFnqGz2eNHT1lscKjCr8Aum4uYZmnNu61tgvB+HVt
 DMg4yr1FCxw67WL4F+v+psjyNRYaDlTUXYiacTvmTt0MU7tp2JcCBXunQ8fVFOcTn8K63/8Hj
 iDKrAh03iCNYtO5eC2m+SKdG0Rit8Q3GkhoYamZIM7+ic4SAMuz4/lhTQa91awr7PXy0NHvju
 7TMhdWUFazTyb3aaln9guCY39fY2R9lA1QPa1L6BgDbcMYMKlUUWSavlLpUWLKa4uIL7PeWYK
 IrE4hFBhGe7hiYoeoyTrCaUvJv8AlX9mPx+rhElDSz0FtlSRjQeMXGlJNqkAGMvED1LA9qFBB
 NBn2FUVVXCS0xCY0JYy92aUsaHknmD9cn07xvHanGhdNPUpCptfqRMVaN0CiDKwBL0DzmcYBX
 mzcrlZHZWhOomn61U3vspLHyfDCI1Qz7Ukc2eG85GHDzezr5QCoE2A/q1ey+Ro7B5lEwRp9Zj
 VjZ8mGdEYlUJHo0o56195ermlFZRBL6gMwYY5+WX5rzHlxz8Ez5J09NbZ0ZOKWqfTmJPHiWzl
 XYagUH5AyC1100p+vwgrNaswbCDRG8CtTs7ZV4+sHajS7kFglMlwA8oR9422iJTGNNwrQDzvN
 /yLENPHNOd07Utz9nQNBYlK5V1rCRJQU7oLt/PDUTtCDJs2KJk8EEdqCApYJwJ0KqnbZmNAuC
 /Gua+Kx4Aguvwrfs2qN8wxRU80M0KqCWxNAdoXRN+EGBptf7dhtwdArDoPW4aAB9l9tOKEv
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
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
 Finn Thain <fthain@telegraphics.com.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tmxmikmL/C/F

From: Finn Thain <fthain@telegraphics.com.au>

A portion of a recent patch got lost due to a merge snafu. That patch is
now commit 88f632fbb1 ("dp8393x: Mask EOL bit from descriptor addresses").
This patch restores the portion that got lost.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <alpine.LNX.2.22.394.2003041421280.12@nippy.intranet>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/net/dp8393x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 8a3504d9628e..81fc13ee9fa7 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -525,8 +525,8 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
                                  * (4 + 3 * s->regs[SONIC_TFC]),
                                MEMTXATTRS_UNSPECIFIED, s->data,
                                size);
-            s->regs[SONIC_CTDA] = dp8393x_get(s, width, 0) & ~0x1;
-            if (dp8393x_get(s, width, 0) & SONIC_DESC_EOL) {
+            s->regs[SONIC_CTDA] = dp8393x_get(s, width, 0);
+            if (s->regs[SONIC_CTDA] & SONIC_DESC_EOL) {
                 /* EOL detected */
                 break;
             }
-- 
2.24.1

