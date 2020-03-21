Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2050329lfe;
        Sat, 21 Mar 2020 04:48:52 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuNhHCfyRHQOE3axvoBgv2njddssMjuHtOqRT6DTRjuJ3MHC3/Zb3fJZO6pVvSk/E+CE7yL
X-Received: by 2002:ad4:46d4:: with SMTP id g20mr12593877qvw.179.1584791332435;
        Sat, 21 Mar 2020 04:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584791332; cv=none;
        d=google.com; s=arc-20160816;
        b=B+/6ssrmp/veuYAzlDtYXWUAOvq0H52tamNPLChMs0nUM1uPUjFqc6wTKNg4YNM14H
         dt98NxdzP4CCiWHIBxPLfCl49opXcgVukO5HceqOpPW+cj5WMgYtxDAqx7gDoPT5Hxor
         JhXhQi6gLcwVcbP+MncBY7fTxZBpqOXwVmrtFv6cK/zjJY32v7qr0+mY1rqV1+A0wt85
         Uo41r5nwIEoTUcvHuIZHb3osmh+lt6ovyiimhKQG4SB0cuIKrTzatovvcfqDXb8lp4IZ
         BbDbPJyUBRZcOvQgk1MXOq2Thc6NkeWPSL8AZXKPQjkrv0OxV3wjtWigfGiA1YWbXVPJ
         1X+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=s1bdYGQbWSZ25NCXl0o2KnO8CKQKA2aULoROOMscDe4=;
        b=bjU/ocse+ABtTh+5vjMs021PvRpZHkOYF9XSy2NNH7SEj+Q0nHhgKDAgTqgH5BkQcc
         DQbO4SgJkDM17xhHtmou0kNsxSq4qeRjx+bp2wL1hxA2wwrYKu1qI4PaC6np4aumPUFd
         CaejRcDYLESknaoyIGutGPyxzzuBq9hWfOjo9rycv/FwoXjncNDZr7dzLNjSb5Z1Ce15
         u0r38BHDQje3gja6MtfOPY1aEOHurK/xjD+/kQlzHP1BM0pG3BiTw0I7LEHODWzHK6fn
         ZXc9xb9oan+ktSFuUOJVoDdaQu9H1nShsHMy2GrDkZXk2+iRiCsWY20Ub+36ev+DQ2Hl
         PNOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c5NOgfR5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si4764498qvu.198.2020.03.21.04.48.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 04:48:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c5NOgfR5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFccV-0004MX-Tv
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 07:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34885)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcao-0001fR-UE
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 07:47:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcan-0006fm-T0
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 07:47:06 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:22165)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcan-0006fV-Pc
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 07:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s1bdYGQbWSZ25NCXl0o2KnO8CKQKA2aULoROOMscDe4=;
 b=c5NOgfR5zJb/C4n2uoTRrL5ETE/i5wJXzsjqTb6l7hhsoL3CKJvDAgTz/bRUHjJfqDN9ry
 bS+huaPGr0zFFK1Dhu75ddAKKPmk0K3hicu+0z1Y2Ga23ZuSdGPG2h/jPlw/W+AdAbc6cb
 Kf5Ie+36WPfLHoaiNWKRTCYEwQhnsko=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-ddXbYuH5PSuwnYC3VSHbwA-1; Sat, 21 Mar 2020 07:47:04 -0400
X-MC-Unique: ddXbYuH5PSuwnYC3VSHbwA-1
Received: by mail-wr1-f70.google.com with SMTP id p2so4174504wrw.8
 for <qemu-devel@nongnu.org>; Sat, 21 Mar 2020 04:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dMq7n4VIHa1l961sBoHohhv0FobQ6UHjUiSLB6JZ4j0=;
 b=S+rI8wV/lyiiO5aCVmEPrIImr3rIGmTSD3OnGgwt1wjU+vMHaKa8RT5LlMjClyqG9T
 GLCy7uyrMiFD2Yxp8JMhOGlAf++SSFcswPU9c3/zK3nb7UpoS8HFT2k/YLs7RserLFC0
 Q2D0UM7Bj1jnGnNlz69ECfUsMR6687IHc/d4SDPBUieeDrmoDGauY5qoyOdPerPnBwBw
 Go20UHetgne1WVqDVhppAJ4PyQGNPVFzPFBSIE5q3ixw9RJC80WyoR2JJfwBe0J17sov
 Ygy6IjNiueSXXI8qsbASAUzoWAZhYbdsPavTAjVzZZO/iBbswCK1lpwwO/IMJyzzwiy3
 yMlg==
X-Gm-Message-State: ANhLgQ1FQPyUbBGpp2kHpOJOhzfURHz5Z9i05MIkeo/zvJRHIm8dkm2L
 PFrkZVEYxvoAorDAORWg7xVsZJn0JyYF1mqfDiwjcDgpGg/pAshY4njcPDxXrjvFcxj5VYx1xa2
 Ckeen9ztS2Ew7x2A=
X-Received: by 2002:a5d:628f:: with SMTP id k15mr10381935wru.404.1584791222591; 
 Sat, 21 Mar 2020 04:47:02 -0700 (PDT)
X-Received: by 2002:a5d:628f:: with SMTP id k15mr10381909wru.404.1584791222291; 
 Sat, 21 Mar 2020 04:47:02 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r16sm2136019wrv.33.2020.03.21.04.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:47:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:09 +0100
Message-Id: <20200321114615.5360-6-philmd@redhat.com>
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
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MH51riH58dSV

Fix warning reported by Clang static code analyzer:

    CC      hw/ide/sii3112.o
  hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is never read
          val =3D 0;
          ^     ~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ide/sii3112.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 06605d7af2..36f1905ddb 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr a=
ddr,
         val =3D (uint32_t)d->regs[1].sien << 16;
         break;
     default:
-        val =3D 0;
+        break;
     }
     trace_sii3112_read(size, addr, val);
     return val;
--=20
2.21.1

