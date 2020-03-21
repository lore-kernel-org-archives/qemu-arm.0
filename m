Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2208427lfe;
        Sat, 21 Mar 2020 07:41:41 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv+PTTHM/MshBWjjutQ+Ps1zq0Wl20TC5d/Y6KRnueAvQ4CXNE2oWBO+rPVCpaDl/HvOs00
X-Received: by 2002:aed:2605:: with SMTP id z5mr13644171qtc.240.1584801701030;
        Sat, 21 Mar 2020 07:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584801701; cv=none;
        d=google.com; s=arc-20160816;
        b=SgxVKW94f7jzLYWvJfqkjNnWUCYxp6tyHeE3jB79dVMYYiO+nWpmBSYO57PW2wUAcA
         apAIrAaidwI1yY9SxF0rwP+LyTvtZ8dKz22nvRCHrwHK7nNRMdk/jrvuD2FgLvU1ZAXw
         B0BTOTimfspLTOOzy339AQNQZpJNin9B20NbDY1Iw+N4hAwqGvanfLaG9aK22axA6Cf6
         3DVtAdYhiivjXOXFZ56/kMYILmHgTg4m0beKJ+3GR90oRmzgNo6g0Q2ijDZE9qUch0UP
         f5APHybmknysgcBgSH1RR18sZeRKnq/w/2jRxaf/gbbB9CvVYaabagKHEGN4QswPFI5h
         xzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6MeQLKCK+LuR97mOw2w6FbyM0pW3k0RrlHbblQ2lvrE=;
        b=qxqIZg0qyXRo7eD117P3/ps8XQ0whq3BOkrVi8j4WVi5uimPW2xhrgBheojgwSFsV6
         r5Ms4vTQViAV3mvAoZWb7f24Lg0Ur9XdZeONgF5yunBF+RPaiHAdDo9LTz57bAvBDw41
         qa2hyB0gqUB/D/3PykEyFvPzon2uam58vJVV/Z1Ukx7Rv8dtL0jm9p24w5rczMmjWqzc
         y+qb8xH1Wven7abV5g+6d/4FH/sWVxLfbUzfEAO5eOM2zr0M0Z7w30/BNgsBuolH7vBs
         hevLxvLlk9HvruCCnk1VA3YnnuWC7vvAIz3yfl+Z3Czo6L3HYppLp3HUQEyHey5JECpE
         2Ulg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LZoqKGeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23si5462605qkk.194.2020.03.21.07.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:41:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LZoqKGeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37443 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfJk-0004em-Cc
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfJW-0004Xa-S5
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJV-0007Da-RX
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:26 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:46420)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJV-0007DF-OO
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MeQLKCK+LuR97mOw2w6FbyM0pW3k0RrlHbblQ2lvrE=;
 b=LZoqKGePKUFn0llp9+tHMwZw61NmMlus/rg/9yF7KO94oDj7rRhAzPXU0FwJEsC558IdkE
 DNZx8UNJLSC1hjlSGQrkt+zXBIj2w1WDLbLicKB4z3QsOHwYrb4xEE0urmlKM5XT6wJMJ2
 4+D20uYn+bns4gObYWiSSKYd2CqqFRI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-gyD6P1-aOgWEsm7JIk1mJw-1; Sat, 21 Mar 2020 10:41:21 -0400
X-MC-Unique: gyD6P1-aOgWEsm7JIk1mJw-1
Received: by mail-wr1-f69.google.com with SMTP id v6so4323885wrg.22
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rRfIK8MnVsl+DYnTbm2DpmqG3rx4tJjk7CYNvTrwi2Q=;
 b=Lyl3/D5Vj132/mPo2hqRRuGk8TLUx79kukwoPfjxpTROjpKasB/bhcqZXPQspw3Wip
 xXaSxoFRx+k5clniwrjmkA4w805Jv9e4b3cPRXbPnjUN8TiSaupw8qL7lr044xx6aooD
 ufAZstZbHWf3Z2jnKQkhmVl7MqKHs+RllhiOgVi6Zgxz6yHcqekq6xRDbZssiz3WxVji
 PvPaitKCKoyBhyHiW8QbjwTjQ7oX3wGNDEEt/yH6z8XnNsbd08G0Z42u6swII1on6U1F
 MAMH1iLbBcELNDxAcrnkoPJFxBChN3gebnnURcEkWWwSnwXE3RdQZgZmvqP8taRkFjQu
 N2yA==
X-Gm-Message-State: ANhLgQ20BloKJh2ij8hIVhhbbNNEhSSmxUbAKMQoobRJW8U24R/ryfob
 nXAlP6j5MlVftHIxdQ9lQIOecwasde99eTLIeRW8XRhwvPRkm1yFJ7tJ51NptNOofaBtivoXo/m
 rhEFgc6qdLlYv
X-Received: by 2002:a1c:9a82:: with SMTP id c124mr14832204wme.22.1584801680623; 
 Sat, 21 Mar 2020 07:41:20 -0700 (PDT)
X-Received: by 2002:a1c:9a82:: with SMTP id c124mr14832189wme.22.1584801680439; 
 Sat, 21 Mar 2020 07:41:20 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id g8sm12548446wmk.26.2020.03.21.07.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2 01/11] block: Avoid dead assignment
Date: Sat, 21 Mar 2020 15:41:00 +0100
Message-Id: <20200321144110.5010-2-philmd@redhat.com>
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
X-TUID: SSfyyvAWlHR0

Fix warning reported by Clang static code analyzer:

  block.c:3167:5: warning: Value stored to 'ret' is never read
      ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 462f5bcf6
Reported-by: Clang Static Analyzer
Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Keep 'ret' assigned and check it (Markus)
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index a2542c977b..a6f069d8bd 100644
--- a/block.c
+++ b/block.c
@@ -3165,7 +3165,7 @@ static BlockDriverState *bdrv_open_inherit(const char=
 *filename,
     }
=20
     ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
-    if (local_err) {
+    if (ret < 0) {
         goto fail;
     }
=20
--=20
2.21.1

