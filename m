Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2049130lfe;
        Sat, 21 Mar 2020 04:47:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vspzL3JoZtNov5gI8THFqZU0+cEYh2vz7kLc0Frgyq3Vnk1d9VuW6Duo03UUbhgD2556z+z
X-Received: by 2002:a05:620a:53d:: with SMTP id h29mr12419044qkh.416.1584791238057;
        Sat, 21 Mar 2020 04:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584791238; cv=none;
        d=google.com; s=arc-20160816;
        b=oLxWt88mPfIZGEQZ5EDvg6BxsnPzEBtMg/h8xbA5ZnGass7REZAjb2MJ+wXTSeC3JP
         4brsBSk+x39FiLyqa/2ZOlAiPs3s3iu4z+y/EVpmCvTPs6sNfSZ7BATIiiMQD/ymsRRq
         81k3Vj7UaW1BsUnhmWoIiXJCA+BzkG4/zBZkP8OwQTiI7b5XgRCs0Py4LAREAgGDDxun
         k4Xs8G/wwLRxnKlRHl2CuwustlLJV3+CRRpyIfgUs8SQFBbo7Dr0a1EF5tbtoc7R4aKD
         9HgMAsTwJb78o8F/ZpePdShUhGyzH/YY4VQKvVsujc1dxcU+rF1iLKh1nFlHO5fr82HZ
         TJQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eMQ8dVIZnYJPrg4MRf01ROr1UWOuRMuavJ9h1G8fyNE=;
        b=RFzwCAORAxvnRDIBGg+b8+iyJyoYNl9u6xXCgIi6ap4izOB7UNh8FrVYOqLB2l+zkP
         Hf4BheY5/uOoe7oUlptC8griEZUe0ZcJB1ChqgR7M76XuCfSK+k7NE67NcQiUPCA8qhX
         pVqG7GlfTmeJ0ZmfF94qFIwiKkzwSG8HTYN0wdtjjh1d8a7JTKeGh4K6NHcQq6xCCqlB
         ztgOgy9cbfXbCOcjOOpKIejDloT/UFFBbY98RiOi9CjUEOIjPq7UKbEqx6nVjSjaVrvU
         L/tsoYTLp5aKXT5yhBCMGjGIlMop+HQ/+26cmHisQdwOQxladbPxFPlU2H5jw9TJegZs
         qRhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="IK/XH4I0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si5221521qtu.335.2020.03.21.04.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 04:47:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="IK/XH4I0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFcaz-0001SN-9W
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 07:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34541)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcaK-0000RI-Q4
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:46:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcaJ-0006Jh-PK
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:46:36 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:43847)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcaJ-0006JR-L8
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMQ8dVIZnYJPrg4MRf01ROr1UWOuRMuavJ9h1G8fyNE=;
 b=IK/XH4I0g77nd1R6JUkYDztTCERqdGSdamdUw5EjU5xzlBJze6d87K9eju9T2rZMDu2pUO
 gYuKe57FZGVMvPqKPkrWmX1zGfDhcx3g5bHB6dZJ1/88Z9H+hEQFd+ECDIJUd90BsCGe2I
 izDgJem/IPOlZrqToUgy0l4bzB4P/Z8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-CyS86oJ7OgSm5m-rGF99kw-1; Sat, 21 Mar 2020 07:46:32 -0400
X-MC-Unique: CyS86oJ7OgSm5m-rGF99kw-1
Received: by mail-wr1-f70.google.com with SMTP id r9so2048550wrs.13
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 04:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kX8C0eEcHvhI8rcexY79cvumv+xMMYTkKA4klDytxcc=;
 b=VFBspcr1pi7kPSESerzOpo7smyILa3Sm3rUK3z4i4IiyKnUyZdGiQOjUir8AAPyaEO
 dE8eFAjiKzzwl4Au91vAmCoslo1Kw1DiHJjXkS+rwqxsinMtLCjeT8Vq8xxH0vKs7tFv
 2BSNv0YL6LsdIwpITvo6VT/lEwKmNRdbj8/npQMmmmxa9q/O36gztU4sJ652kaoVChpp
 7jnRJPlgF2r7uZRtq47pkFi58xJdMght3F1/TDMGw6BVkCaF4dN0oIzrZVfF7PVaswAI
 4IVllg1rajQbaFHBCAAILNZf2NvvpUm/sMlY3cmPubhLsuuDMOlj3Z/AmRb2cS2sbUpa
 AXlA==
X-Gm-Message-State: ANhLgQ3Hx/NW22++EfjmGuy0ZlRWd1BnDKSjgp/nUzQH0wiiDYijJ2/L
 oUd+qoeIepwbPBmYI+izlJrf725Qh5TTkgFZgIGO3tVi9VQxZJZFTNWWQ13oJJyUWu09BdOFHoJ
 RtrdSRfCGEyAt
X-Received: by 2002:adf:c44c:: with SMTP id a12mr17986431wrg.172.1584791191402; 
 Sat, 21 Mar 2020 04:46:31 -0700 (PDT)
X-Received: by 2002:adf:c44c:: with SMTP id a12mr17986387wrg.172.1584791191199; 
 Sat, 21 Mar 2020 04:46:31 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id d5sm2667163wrh.40.2020.03.21.04.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:46:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 01/11] block: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:05 +0100
Message-Id: <20200321114615.5360-2-philmd@redhat.com>
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
X-Received-From: 63.128.21.74
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
X-TUID: xnpY1DMmGVh3

Fix warning reported by Clang static code analyzer:

  block.c:3167:5: warning: Value stored to 'ret' is never read
      ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index a2542c977b..908c109a8c 100644
--- a/block.c
+++ b/block.c
@@ -3164,7 +3164,7 @@ static BlockDriverState *bdrv_open_inherit(const char=
 *filename,
                                     parent->open_flags, parent->options);
     }
=20
-    ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
+    bdrv_fill_options(&options, filename, &flags, &local_err);
     if (local_err) {
         goto fail;
     }
--=20
2.21.1

