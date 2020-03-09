Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1266229lfc;
        Mon, 9 Mar 2020 08:23:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuAjjR+wCkxm12iBEvqQMLexXo6TEsHccwWZcYSo9Oe3vUDjpIvDBN1SIiGUlhUkqOOy4Ud
X-Received: by 2002:a05:620a:1325:: with SMTP id p5mr9914135qkj.439.1583767427973;
        Mon, 09 Mar 2020 08:23:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583767427; cv=none;
        d=google.com; s=arc-20160816;
        b=FQFinuQOEgHkhRF6JJp8hdQbcT8mrk5ojshSn2TLdh+Ktwa/Z9OsmHSa9v9KafsDwP
         adguC1ueVG3JlfDnp/2EefAe8PLjOyDjddotYf7YXRK2WTWboHr7jTsLdNBz7Nl39+JZ
         vcEmsirnntBJGsnErimEsiBcQCTzNgbbJcvc4hkp0gS5omDiWjiw/eQFhHbUFropAAJP
         WoossI5VwKjjLrLzNBfpk4r4DIDhfgSdjuOYVQJK5Uxr02b8RBLkNv0+sSrlRiqDinqF
         tuGrqfWqU9HwuWQYnzOQdCj8pui/fKCZHaA8EkaE5HAoKxwFNTwNDQX7nud1/MfHcEO2
         f4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=J+8YmVsbr/TLkJ/nxWjt24JxEL5jlF/Jvh1I5ecUUco=;
        b=W/iEe2aIassrXhg1A9Q/tJo49mdsKKzobSAWAlvmItFqBKUV6vy9eXTXH6sE6jVnvb
         M+smlPJtnVcIlWi8UIy5QC2YDqgOHBQCAAymWEHUeneItfAoK5p/mp9KWB9h45d0iIkW
         LrlO/h1o/2F1CeJSz8I4g1A+mz1TZUCSbad37z1psCxBPr3vOHRyoglaNPc7wc2WXlEM
         JcoSws2T15sPU0WOzQAEcsQZ/4F4IgiazKuZTB8m+0m7h0kiDC2MRzc2083AONGTnsNk
         6OqWBcBd/ARzS0TEIVuC+2L5C1PFxSjy+JYHqknfCK5Va1tPmhbeCHt6RIkBv0N2vHPn
         SHnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si2464637qto.399.2020.03.09.08.23.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:23:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBKFv-0002RM-BZ
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK3D-0000r6-Sc
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK3C-0008Ie-Ql
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:39 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:53501)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK3C-0008H3-HV; Mon, 09 Mar 2020 11:10:38 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MsI0K-1jUdN82uOg-00tkdQ; Mon, 09 Mar 2020 16:09:48 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 28/33] block/file-posix: Remove redundant statement in
 raw_handle_perm_lock()
Date: Mon,  9 Mar 2020 16:08:32 +0100
Message-Id: <20200309150837.3193387-29-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Z1z+2uvzah6PY75Er35bieKI0DVkZ/qwecDybg0W4Up90xA9oBB
 UWyhou1MLa2rR1SMr2VskqxNgEz7Ce4dxENvYMdsjiRr+KNv6DP6QYddVObNrjsomg46q4J
 feaO0F/UprkwD2cUcbC9Ep3ERpK6gdyDvzl1XPDHE2iM3IGO9bHo2+MSRh/0aqbFHzp2kYP
 dOFprsNvJE8DD4ZsfqVqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SYve0I3XV+k=:qCPiDB9Wqrg1ZnE3dZrhx4
 Clqz9XVT4xvb1bOKcyzGGLibntILJQ9YM6UdWh91SvXvDmruL8XwnvcFjKTDGHRZ0iZcgCLLX
 DJofMKBrR9/ppEJdAOXS0V9YvxyyJ/FhRYLW67C7C8hjTyshFFjdZckWIGhVuKhLUthzCiTn/
 ivc7vJeWTvubtn3h1Nyq0t726/A6sVfiltH/WWco3n6TgNuphPS9fL9EnepTymVc/YZ8cafCM
 7WOdGBQwGg2Uhq+sUZQnoR/9HrnA0EPklvtRDRHB39iGTFUzRXRCsT2eAArkbUTjqMQc/vPwi
 qvMf8bS4wtje/4FgLRS94Ezb8t8QPJhXEwRQR2VMtfVGKUh1sgtG1HyeZLPtjNdnWf8hr3mPP
 HvGEj3D1kCKH8L4YCYsu+wWemTHxJ+g6Hb/MHWnfpl91arMKlMjTOjb5/r+iog+cc1Mjc3PSf
 swJ9r6xZP5uLN8YBvhu2LYd9AL4sbOoXXAYHGQQkkuel3Zx+h+Lj3MXt9IvYZVIW2JJQtMgjM
 HAYmsm4QXpFFI58zIw5ovoT0lw4a/Yqa+gemBHWTDADcn4dIvKGGSAJKWgrMX9tgEVoOxcrfC
 uAPyfazKckzbgfI+aI4DBpxSZtNPOJKOGGtli19Qlf3j26Rj9ZOGZoieBpk97ZG8wp8E27PHQ
 spCsAbENLLx3if17S8Y0Owe8aPrUD+QwiqrDUc9iKKmlX++/9mCeSCUI23Tz4NJZ1KbtY+5hq
 bPSF+g4CVx2F7kS+cM47+mLSpqyGdcnUhfxXzoOqNCXYZIvfFH55uOGfp4Ny6AmdqzBCE6Y3Y
 KjFaFm9ORIzCLCSVlkaNQD6gFNWj3nmzAurmkju3djej8r8UahAUxNjtp6q68ZLnpHZH0o5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
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
X-TUID: YhH8YTV8urx1

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
  block/file-posix.c:891:9: warning: Value stored to 'op' is never read
        op = RAW_PL_ABORT;
        ^    ~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200302130715.29440-5-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 block/file-posix.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 634547711297..0f77447a25df 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -888,7 +888,6 @@ static int raw_handle_perm_lock(BlockDriverState *bs,
                               "Is another process using the image [%s]?\n",
                               bs->filename);
         }
-        op = RAW_PL_ABORT;
         /* fall through to unlock bytes. */
     case RAW_PL_ABORT:
         raw_apply_lock_bytes(s, s->fd, s->perm, ~s->shared_perm,
-- 
2.24.1

