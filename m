Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1265198lfc;
        Mon, 9 Mar 2020 08:22:47 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtaA1tBC217ZjOO/3OLt288HrjzmkANf8h8GyxZabNONnSqHKCxJl8wZKNh9khTrji3IIWX
X-Received: by 2002:a05:620a:124c:: with SMTP id a12mr15248379qkl.273.1583767367113;
        Mon, 09 Mar 2020 08:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583767367; cv=none;
        d=google.com; s=arc-20160816;
        b=tLkGAk4spQuVSQOI1YiJNENYhi/bVPRoP6mOO3z/F1P+pGMoKFzG9yf/Cz9tLY3DpH
         p0G/9LRt0ryYFdoHA63qejgG3+mNqpeySLFSWsP6aE7f1w8I2Hp3mpZ6fAN60tWWJnkD
         G76ldP+Z0mX+yfbJWbpTOTLAXc6RpZJp1/mIpoW5FgYoz0HFxqQwe1AwNQ1C2jZMtEgn
         80jsMFes1oE4k+lfsdgCvkFq+a1Mx42+3r2qIdxgddRYepKLohw3FTr3hu1jl1zM/OK6
         q5BtcGPC5MuMhvM2RFCYWAiuVVnPve6bMU9DfcZikaE4OqtLcVoDY9eCMHc9p0+Akz6V
         vaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=m67wGqI8lmjX8HBY0nQqXmP32V6rEZrIFVGH3lhd8mE=;
        b=bJ5Gdy/dj5CFktMkyD2XMH9lgEUVPnwq/JRkfzHp9GEpjh/nIFj1252Jnre3HVRhyI
         CDsjfZRSYVJ1d+lospPVaxj2xVAy1KAJKxYV33Cmq3QD8sbCli/2gVU/dtLWKVQGtm/U
         dvkgSF8wiEo+FPUcZks7/HFodaPaqysKIxC+tTu5pSZTlZsfvcU2jMBajg37Lc+x0WvI
         LDQdoAmsG/7BY0JJCa00v7SQi8doetpE3isKKS8SZ8CvGIa6w0fOgmUqnoOy/dS6z7ZH
         4ED4VOAFx6/qENSAXEaPaLiGbr04NHu/6I2oRXYjQ+Cju/IswhnfaNu/x5vuFl2EHh/7
         /c5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si5737581qvn.179.2020.03.09.08.22.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBKEw-0001bR-H6
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK30-0000Pq-E3
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2z-00086K-8T
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:26 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:58415)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2v-0007zo-C1; Mon, 09 Mar 2020 11:10:21 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mv2tK-1jSzTQ44v2-00qzTi; Mon, 09 Mar 2020 16:09:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 18/33] hw/timer/hpet: Include "exec/address-spaces.h"
Date: Mon,  9 Mar 2020 16:08:22 +0100
Message-Id: <20200309150837.3193387-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:O5ktA5u/pvyBqK+lJEE+rKA/tVmNCUJ8OU4Z4k0rTqvuYlimz6i
 zz5oDt9n7A5K5U6qdBg+9And87yDAwyhK9O4lur6RV8vEajaOF+C8CsCQBL3n7+T3N31dTV
 G1pRP6Htz2hbJt7FWPJNyDHsqKaic4trqLzYucN6GzIBjQTPgCbRXIpJfnap/Zzg3Wg5mtg
 8EvDCJ+xA1OdsbxcQtiqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:515utrpxNXo=:RiGyt17IZdJ98n0ovCeb4p
 I3JIIC5TapNk/BxUyyZ0u33IlpH42C4UYBtNGtbHRaE3yLlvja2v6459g0Gxm7/3MPvwUBqqa
 XkSVXaZJevXpHFocvlkvuq967E/ppVlhjbhkmOJXkT0juDsvn2A0M+k58mFSC/6SleYLpYZaM
 9KfAdza59Gg9MINcDQ7wuI8HTB0AztnjO+nvIYM8sXO+X6+f53YrZKdvkbrfhs2Ytf15lK5/8
 k40qP2Ds8V9Or7ZPX6n8K2Xa1VDCTZJtrEqOElZZYG3jcUImQtiBJF/wRheSLdvbgCJd7/aE+
 ZvMc7WdfcJskgKWUWq5AJtk2URs6KbUeLL0amun2501bMehfAs/ocpXzT8joXm63webEMOBA+
 RyjaDCuk8zzuC9vXZUK3FsOtsVh2rfnZNgF9FUcgcY8QN7izrD/iI3efDF4vowEBHT5AdEvhQ
 OE3aNSR2hSCBZpXkifG20W1TJh8s1CUNXj1Qg7f0PGDA/qCOJDL1evsbD0eCavIOxju3mZZct
 MA+JjYpkvN9fDH/lwxemkkeAVLuRk2s+sGW8LmsdA9wwEMWRsbvD5q0HJo0Lk4sx8N8gITo2U
 F51qmdfWW18MNNLOqPN5EmnFsEzZZFBscuMUG17X4Ys5j+bXzjjnWfHDKB02o9fTAznEint5o
 aIm5DzlODVRAV+pjVZNq/77T0oKWTm2p4tgRhhdgQICnjbSbwCdIIBCOcWDZTPcBDZvFgWHk7
 Qi4P+WvcPAT6AOs3QxA0gGSoh5QPV+GEqT49Qp9FhRi1XR20q56Mq2O6324sHUXHIpBPKCoVL
 O71gEHKw5XxiBJpu5KDXqAg0KXGTbju2tdh+ILPGw8YxAXcr1T5uK6L4fBezgB805fE/NJZ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
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
X-TUID: 5CBInccJLLVx

From: Philippe Mathieu-Daudé <philmd@redhat.com>

hw/timer/hpet.c calls address_space_stl_le() declared in
"exec/address-spaces.h". Include it.

This fixes (when modifying unrelated headers):

  hw/timer/hpet.c:210:31: error: use of undeclared identifier 'address_space_memory'
          address_space_stl_le(&address_space_memory, timer->fsb >> 32,
                               ^~~~~~~~~~~~~~~~~~~~

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-12-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/timer/hpet.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 4f30dd50a40a..380acfa7c8a5 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -36,6 +36,7 @@
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "hw/timer/i8254.h"
+#include "exec/address-spaces.h"
 
 //#define HPET_DEBUG
 #ifdef HPET_DEBUG
-- 
2.24.1

