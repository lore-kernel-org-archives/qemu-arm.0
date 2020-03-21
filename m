Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2049972lfe;
        Sat, 21 Mar 2020 04:48:22 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvzpQBlgbJ6x4pCccJl5CxThxIaS0NA3QZA6IfyTfM5bWX3VMbpwi9t5vAZ2Nyus6gW2qQF
X-Received: by 2002:a0c:f849:: with SMTP id g9mr570425qvo.108.1584791302653;
        Sat, 21 Mar 2020 04:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584791302; cv=none;
        d=google.com; s=arc-20160816;
        b=wU3kRa6Z0hAWDj8FyDlU1KPSg7MDusDCSJJn+oWQ5wAZ9lP+THfmxLkHOi+sKacBl+
         B3WbTXZMb987VewFmngcxcLTf+QmhmeUAxxTR+TipAS40sFH9SdW33MqBgEJ87yTXuj1
         1QOykksq6z8w5THPeNZtEa4ghy4PRBUBOl0zc2y1+SBnxWJKA2WU94ZdnuGXEo71kvai
         f/dIOJ3GSuGl+wiTxvBeLL/cq7x1vbFoqruZL7EGBTMsuv/DcmgR5ivj1OaZizjXDIs8
         IFxm1Ce/AvJBHOHNWHvKPMo9y/8mzLENc6kkAzlBMh6gylQVLeDn/LbIdsqJeAi2QYXG
         wr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9RrFXtWXIAKlsNCj4fxVkxendU8386lJ6GdPQwHKuZc=;
        b=rfFK7HWDeSCTbCIlnaefNXxeNxbwjTzK6/MIQdA0qaLyRCg4ZLJUFyNLhpWUKRUecQ
         hKUNoJKkioM4IdFR69G+h+afljLb+th4m/z7/elhGtnEsxmFJKZ9S6R5FaASHEBMBi4j
         xwxDwaCcgeHT0UlPLR1bFvmtWCPJd8L8EweSdkpr264AKtHFxGYdWjmPN97w/cSzcn9r
         uy2Lu352E8/EGFRlRGkV5RR7GkeE6z+cL36pNDWA+Eqzb0FxEYxM9p0LqvHCHSHe84W+
         2slmhXcMrKyWX5GqgjWpBRpQonWTMNZIB9fbbfCOt0pvuydwORuueMHy0COOS6Q/e8p6
         nE5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="YkUjYlu/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si5588191qtk.125.2020.03.21.04.48.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 04:48:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="YkUjYlu/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFcc2-0003mG-2k
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 07:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcbE-0002Et-6O
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcbD-0006yR-2e
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:47:32 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:31846)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcbB-0006vW-Iu
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RrFXtWXIAKlsNCj4fxVkxendU8386lJ6GdPQwHKuZc=;
 b=YkUjYlu/TrEERFw/pJKQQ/DEKAC1g7mG1s1JUKoOuI1m34ugPoQqJ+tcCXERzWzxMLy1PC
 RNGNMDpuECdAS5Mokry7iD6A8X3vIABkik0iobe1zgzncUZ/xDMWVCHgLaiiHi8BpY8zHu
 ZIA9PdJ/cQfv6vqRt8qp1FnZDxL72Aw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-Dgu6_NR9PB62rkbKy_JIfA-1; Sat, 21 Mar 2020 07:47:23 -0400
X-MC-Unique: Dgu6_NR9PB62rkbKy_JIfA-1
Received: by mail-ed1-f69.google.com with SMTP id c2so7394901edx.16
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 04:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9gGzKQU/hca0N/HfH89YEyKKEwjuVATrynJmMDBqHuA=;
 b=d+QPjpwqlB1BhDp+1bPmhLM9DFHifdgnNBsv/eCSge4XS8Ajb+Q7lKHJsIn1hG0ZaS
 hrtEYaUA7yl1FaKSKrKMZuQ+XlIwMOb1f48XLlPVGOXC5COAo3Ev6lxQJ2k+ExANHZ64
 40EpnHWCIw8suwUIQwYNOoqYgrvRx0RgnYRibZeuvw/Khl6hOVD1H8oDCNDUGikGwRsG
 MJR4dmQ1yXGyOtx8EosXwuVvmCZMGZr951j5fM1EBe4dODuw/WP4XoiZYnL7oLRnFLPB
 P5DLKTNgnUSbC5caXk1c21RRtFEEnzOv0UkSMAG46iaEHxd2PD8xNAcANEMHP6xastOu
 NPnQ==
X-Gm-Message-State: ANhLgQ1nHJQYRE5/Yi+iFCigb9p0GfsH9lFVLM8JJSKlzaQEIDrCzwyI
 dYhWjGbqoJ5EHDQANeBZOjpas0+a0nbqkMby4jutaCx9EFDTQnkNVTIu/9VxeoD1iq1+e6GhIaH
 8nCI1zG74x4a1
X-Received: by 2002:aa7:c0cd:: with SMTP id j13mr12145123edp.287.1584791242063; 
 Sat, 21 Mar 2020 04:47:22 -0700 (PDT)
X-Received: by 2002:aa7:c0cd:: with SMTP id j13mr12145088edp.287.1584791241814; 
 Sat, 21 Mar 2020 04:47:21 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id d23sm540531ejk.26.2020.03.21.04.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:47:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 08/11] hw/timer/exynos4210_mct: Remove dead assignments
Date: Sat, 21 Mar 2020 12:46:12 +0100
Message-Id: <20200321114615.5360-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321114615.5360-1-philmd@redhat.com>
References: <20200321114615.5360-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NdMTx+Wkq6On

Fix warnings reported by Clang static code analyzer:

  hw/timer/exynos4210_mct.c:1370:9: warning: Value stored to 'index' is nev=
er read
        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  hw/timer/exynos4210_mct.c:1399:9: warning: Value stored to 'index' is nev=
er read
        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  hw/timer/exynos4210_mct.c:1441:9: warning: Value stored to 'index' is nev=
er read
        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/exynos4210_mct.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 944120aea5..c0a25e71ec 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1367,7 +1367,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr=
 offset,
=20
     case L0_TCNTB: case L1_TCNTB:
         lt_i =3D GET_L_TIMER_IDX(offset);
-        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
=20
         /*
          * TCNTB is updated to internal register only after CNT expired.
@@ -1396,7 +1395,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr=
 offset,
=20
     case L0_ICNTB: case L1_ICNTB:
         lt_i =3D GET_L_TIMER_IDX(offset);
-        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
=20
         s->l_timer[lt_i].reg.wstat |=3D L_WSTAT_ICNTB_WRITE;
         s->l_timer[lt_i].reg.cnt[L_REG_CNT_ICNTB] =3D value &
@@ -1438,7 +1436,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr=
 offset,
=20
     case L0_FRCNTB: case L1_FRCNTB:
         lt_i =3D GET_L_TIMER_IDX(offset);
-        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
=20
         DPRINTF("local timer[%d] FRCNTB write %llx\n", lt_i, value);
=20
--=20
2.21.1

