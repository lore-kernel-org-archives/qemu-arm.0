Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2210972lfe;
        Sat, 21 Mar 2020 07:44:30 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv5qvsMdqjc+gFaGBYGn74AbWm6onM87PsdYy5ZEyDb/UJlZfv+FfLFytBRNMKGbgv92Jo2
X-Received: by 2002:ac8:6d31:: with SMTP id r17mr2069443qtu.68.1584801870073;
        Sat, 21 Mar 2020 07:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584801870; cv=none;
        d=google.com; s=arc-20160816;
        b=kjwKeZ79apSabfQaiLJIt8j6IW9vDMnYAURcPLT2cWnRK2X6Bprndl6dNl1MWjDqpj
         cZuj2+sXl8HBGT0bmlEdDDS8j6jxVRhlanvJBh5Neo/1HomC8iYGlBdzZsHCYp4Cm2X2
         legw2OY4G41NTPrcPL5BsHagBCOGOLmeWU5zzBh5IdmwaExhoCJ40wGrQhbAic4OF/pD
         HFuO062zkBaKINeXJA65ee7agevl82fNpRrXBEa/WN+e8ys4EkTR6AXZYiLOZG2v8t1C
         NDypHcnaBpZOSd/rB7OfrRAMoHsnCfBO5DwTFfj+c8KzZzLHwf+GUon7/1TFAwVVmN3s
         eBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9RrFXtWXIAKlsNCj4fxVkxendU8386lJ6GdPQwHKuZc=;
        b=e/Gf9fPuwYXWRE8XiQAD/1VH9X8+AB80ddwAeUyoZwOT8jWg/Mal6TaHtAIQ1iZj/4
         1NLt2/diDEVHCxfmVPD1P+luWsbQvfPSAmKf5sCsuS13SxDUw5YFi2BuG3BaVrzd/hPZ
         y6tUuid68q8bkOIiQkscdUuS0bKZbqw14rOM9saii7UMvNJsJOmmThYXtdU5oOqljdgD
         2DEKLQDR8ZSLiiRV7gzFVp4S6DafcGpfDEIMPuOw/xs5UNYhpr3d4tPmuX7Fr/OAtMhE
         sPwy7/LU85kk9n7he9eMM6pmwnGsuJnNxbBZHNoJ/IG69S3IUR2ICyTDTbESMGs0yK7L
         L/Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E6394p6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c124si5676041qke.33.2020.03.21.07.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:44:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E6394p6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfMT-000176-DW
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfKF-00060V-Q2
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:42:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfKE-0007nS-PO
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:42:11 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:46545)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfKE-0007lr-M5
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RrFXtWXIAKlsNCj4fxVkxendU8386lJ6GdPQwHKuZc=;
 b=E6394p6ghhW55xLjE47JRiLsUDOd2/WTtWKwQ69jjAYtf04XNC25ebM+zmh/k9TyhGgOKW
 mdFCAQi2Zjm8a4fSQ9rGilDRU+jnPD9Cld4wAtNDTN1/P8gJGFvFjLiuLidYHJD3BzZ38x
 i0SBk1Spo4BMBmWDu6WSZPfd/bM6u0A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-qke2OC5RM6uW76M9l6pdDg-1; Sat, 21 Mar 2020 10:42:05 -0400
X-MC-Unique: qke2OC5RM6uW76M9l6pdDg-1
Received: by mail-wr1-f70.google.com with SMTP id v7so4414306wrp.0
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9gGzKQU/hca0N/HfH89YEyKKEwjuVATrynJmMDBqHuA=;
 b=F/J8UfX31flYm1oWv8XFlZ3dTqJWu5cLcpFmzqnOqR6uSBpxhVcVY3hGRgyMOjmP0l
 DP7UM/qBV7E6LeWRTFdeHZJfq0FK1U6g16s9/nfBNyJfiLFk3Y5mjLIGH8ToZQ1esgxH
 +93tjDkP6weQH6zfeQ3MX8eOJRYlLDnFLlnqRdRee9/oi6+I+55CIW2qm35BiDpnZP+9
 iKd398/YuiGOWfbZdtU2uIMTUkvmJau/NW8qYn2w11PIuUb05shL9Rqpj/eNIioNmXwQ
 sJ6Afx3YE3eDohbhCMX1OTDagG6pA4mlE/FDyaYtrfRRxUA5KzRkszYyK0Dg1+pEXO0u
 M68Q==
X-Gm-Message-State: ANhLgQ0qjoi6MSaWbU3a+6FXGZuKYFfXTQHX0oL+gVBscOKVlgpGRlL4
 BQKN0dRRQMinZIO3DTh3oHrtJdIgh+b06HnGFrncnzXccFYWPNe3SAG63HRaj3b1WBzbpl/f6f9
 0whTfnB4s0s+I
X-Received: by 2002:a1c:6146:: with SMTP id v67mr17275844wmb.78.1584801724863; 
 Sat, 21 Mar 2020 07:42:04 -0700 (PDT)
X-Received: by 2002:a1c:6146:: with SMTP id v67mr17275807wmb.78.1584801724661; 
 Sat, 21 Mar 2020 07:42:04 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id q4sm15551202wmj.1.2020.03.21.07.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:42:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2 08/11] hw/timer/exynos4210_mct: Remove dead
 assignments
Date: Sat, 21 Mar 2020 15:41:07 +0100
Message-Id: <20200321144110.5010-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321144110.5010-1-philmd@redhat.com>
References: <20200321144110.5010-1-philmd@redhat.com>
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /uvfq6XRUzqR

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

