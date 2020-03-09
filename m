Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1258158lfc;
        Mon, 9 Mar 2020 08:15:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuIOTdQOFMuKM/5Yy5FLiKbKCod1/jacIhFBmeUtbX+M22YdHBQS6p9j2+lmuwaz2xVU7dv
X-Received: by 2002:ae9:e003:: with SMTP id m3mr15959767qkk.250.1583766949913;
        Mon, 09 Mar 2020 08:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583766949; cv=none;
        d=google.com; s=arc-20160816;
        b=il1ZIo4fZiQ49wiclWX04D7o/Lkc1hrsuDJCW7iFlg1ky0XbihW8eXm/JXly1LlOBk
         iajickgHyjeiQaA/cFqBWGz/Da76ZioaQsp4bXW9Bg4toBV8XElXrHK3IxkMBDCDREOx
         DiOhymBUFZ2bNhtFS4gcwHk3nKqx5sTYE6VoE+upuZ4+CgoYpTKA4tpVMPXzI18bIOdq
         rmLZH1DpAiCO+DpvW07ABQfQj11h/xeLSWU/LSU7uLDSK1m22QDvRXr0zjmuLkZaYIOX
         fhiQpZcWjPfqx3CEr/C+qQ7TWs1oHCxS8hrEWXBJlfHySOHSNWUufvWNRrk2aEAaBR7G
         ILFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Wxxq+RX2MssInL0adNo1z61cwIAT6WQXWyIXo+GuJGk=;
        b=lS3Ddda+EpyWNCeqtieFciaME0yWjsa9k2yPTvcJG/0BDsJBjS7ouZ6Yc5vr4/GULX
         ZelIePOGwwhv7DB+ToYBBJTUDtsgT69UENXXCbdB3tW+urPlgUos6QjAtTySdUvCOSM+
         egmkTCQfR2TYBW+QJjoKCvtmpUK/w5HWJ3gesQ0lQRWI4QV4gRpf7OmFpjWxehx/Pej+
         Vfn0CT00QMnp1aYTKFuss5qiMlwuz5ua50h8aR1pOYlfxeaEJBu1W38rXGoxhXVdvANH
         o47rMOqCZ8h2m345QlFo4RFht/eFleusglyRd+6di5cpmy5gWmwsbuGYf0UCrwIR3rCv
         syIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q23si3910317qtn.361.2020.03.09.08.15.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:15:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBK8D-00012J-8P
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33338)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2S-0007pB-Fy
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2R-0007gX-EZ
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:09:52 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:42163)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2L-0007bH-3U; Mon, 09 Mar 2020 11:09:45 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MLA6m-1it6gQ1PvO-00ICtI; Mon, 09 Mar 2020 16:08:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/33] hw/audio/fmopl: Fix a typo twice
Date: Mon,  9 Mar 2020 16:08:08 +0100
Message-Id: <20200309150837.3193387-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UW5nFl3f49l8EiqWcfH03Ht250um51CqWYk29wqkrHzC4CE9/8v
 yvNVfXE6dwOJmOKLhm1rMwsd2FKEPF8KExXy1sjgLYb8o7YUNLn0xL5tObTiul3rg/iJ3R8
 yZrQgO/JHzMPIznk/T8XviRYpr1UopbO4Ledubv6MxDlLgoeQ7EqB+GOtiu8WDJEMoEK1Tj
 SM0ey6TJpqQa5oAMnGufQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PKcDQf/GEU0=:NYOCc4WQHMU5AT87QeR0WP
 wgmyeLkw8DoGQnnPhw2UJ1tHCnK/DR2s34/VLUlp2KZE2Jd9IucAAAGCxqa516KS/qVEU0cXr
 xcarRNVNjequblZzPzs3o5jsYpaU/W94DqzginImn1mWNpWBCVdi7RIG8nKdU8IghpEqPuh/1
 XEskxxrrrcYX9w5kGqASWqlcIEW2Vq74d7ZXK6D6RUb4YyBkQGnBtZWVpgfQVy/XlNTimp+ni
 ytabDwqgN5geI99zsa+YsOavglqs+Z+Cw1smyI4BoLfecKSj6BeReyUhlJxlD8T9ubQ1Yv3HS
 EmTaAWH2SenB/Ngjv5OKdHj0YJMm15BLf9pCTavl6Gp21NR8uZZdfTnezukBkZ2nZu84f+IVK
 wRfSsz8peXfxV5G3IXfB31zbE3FZ2LDrooOGw0xM5OITcpgD1tyvCb781RrpwFZ6wzK72XdHm
 VzV9gEk1LUkENAPZIG6w8IfY/0BM32DJM/s7CyPOdfWiIrwdTipWIX7ME4IfubbFdBK7hrupn
 Y+cVnFnrjMMNkgbrX7zTgF25xm853uDyTnkJY5tqoTxH8d0xJp5wkXVvTBVpm4RmwDUxblC7q
 dvTxBCEykduxUMj440r1JOT4N1xYWJw6jgNZIQb1YUZFuAtM5tMONI9rjNa3E6cbgEGk14S4P
 bZxXgBqPBcUG0DCbe4L3ofcvOA4ZFDEUJIOvDWlfWdYVV95ak68XJycOGzKystn6w1nDBmZsO
 v40onrSU9yo6MMLktRWK7OU8ZAjFbu1RUVLeW+HiXCqw770JLYMynKpzfJCEOTJc4UUtD8BM4
 Irr26i1hFfbJOI0z8ApQ3mU77QjcQbF44yrulu64Z8Iv6VMo84dhTUzucd/m3LeaH0WsZ2I
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
 Stefano Garzarella <sgarzare@redhat.com>,
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
X-TUID: 1rQmjXrY2eJ7

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20200305124525.14555-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/audio/fmopl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index 9f50a89b4a88..173a7521f2a7 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -1066,7 +1066,7 @@ static void OPLResetChip(FM_OPL *OPL)
 	}
 }
 
-/* ----------  Create one of vietual YM3812 ----------       */
+/* ----------  Create one of virtual YM3812 ----------       */
 /* 'rate'  is sampling rate and 'bufsiz' is the size of the  */
 FM_OPL *OPLCreate(int clock, int rate)
 {
@@ -1115,7 +1115,7 @@ FM_OPL *OPLCreate(int clock, int rate)
 	return OPL;
 }
 
-/* ----------  Destroy one of vietual YM3812 ----------       */
+/* ----------  Destroy one of virtual YM3812 ----------       */
 void OPLDestroy(FM_OPL *OPL)
 {
 #ifdef OPL_OUTPUT_LOG
-- 
2.24.1

