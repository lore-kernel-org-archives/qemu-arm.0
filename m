Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2049380lfe;
        Sat, 21 Mar 2020 04:47:37 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtWW22VS1oHTQMlBA6u4MP/Xan6RhZgrljXh78dRqGo4XjXroW2fUQzNnWF+DeZBUQ/8IDq
X-Received: by 2002:ac8:24a7:: with SMTP id s36mr12941805qts.357.1584791257377;
        Sat, 21 Mar 2020 04:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584791257; cv=none;
        d=google.com; s=arc-20160816;
        b=HPBn02Dbhzt7sjQIi8mEuN8jOBOKHfZS2MwtQ66ADRMGKaHQhWNn9Kc7UaMbRymZzn
         RPlFWArSv6ZNO+H+8DDDI7jW+xHohvHecs1A1LP4Nm5KZcuOVypBGvQVwJ1MLxPF6brz
         oU9ZMdOCCJ7ZsWr8uJ4rJRhm7y/OkGNc8/DiclI+Zi8vqGqP9KguNkBUQxUB7dKQ+0kw
         pvzgX9k4nVDe0cV6mlRcNei79+2D9MTSU6i+zHe2UMr9FDetYTbFZ0HbOSR4GpkamyZY
         H+8CiXJKZsW9a0GFv7Vf3x8FBsDSY6d8VHKBCmZRwk9R4weGt8KM/M9XoXt5XQ+Y+jQP
         GTaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2U6ARuvMvLKS+fqGTEoijz7r0B3fBwOwTnOOBFQNRAw=;
        b=IT5cnuO51vU14kwoIql/uMmYkl0wvtTybJPz7DEt/5q9sU2l3YRHIu3Gm2up27Lrmf
         XgoPzmAjwWsRdHk5f4ZBSktG2xAAfUx709b1fZGnWICF+bu6We1AlOhKPMSARuknB2tI
         HnAYeYNeG5yZGgFxTH004anXXcqSaCRNKbuVicXTgg8ICWOkJvG81Ccc4vlkjs6qwUAv
         LBRN7IBIvlGnNCXIOCXXQb8gCL6bpQ947V67YG78/sO0ZqIIjDpNo5Z5azBDjcnkxELP
         ybCGPHTnUdgxH8oJ0KEPkPu9nS549BOQR3QPEA+jADDl6X2jawjx7nJFViD8e7NYBMtc
         II0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hG0rl2bj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si5181867qvz.20.2020.03.21.04.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 04:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hG0rl2bj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFcbI-00020R-Nj
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 07:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcaQ-0000eZ-0M
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:46:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcaO-0006M7-Vx
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:46:41 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:58642)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcaO-0006Lq-RV
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2U6ARuvMvLKS+fqGTEoijz7r0B3fBwOwTnOOBFQNRAw=;
 b=hG0rl2bjnZjvxE4P50y5Ax9avstqt+14e6VKPuifVfdsJmMbHwnwA8mnytOUZ8uCHC0XF6
 AuC3kiLod4yzLfr5p9ID183qnCizLkHOUUXufosbiP/VT7j7DaOuTnTJ1rFSE9jQ18yXH0
 RyNxrcSnUmn9azrARJnwHwPW5nlGTeQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-wEJo6cJmNOCnIOo6uhpxeQ-1; Sat, 21 Mar 2020 07:46:39 -0400
X-MC-Unique: wEJo6cJmNOCnIOo6uhpxeQ-1
Received: by mail-wm1-f70.google.com with SMTP id f185so3067315wmf.8
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 04:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ez+E9s5mwrT8B9y8nVUYgFPf3iN6ckUcWWVa90evmD4=;
 b=cLPjUV1bHeWjtDdnbLFAkmBzdqcoKFb3BccbV5nw76rhclfH3BJR6LS6qX10mQV/2d
 TTbjR6zIx3IySojYyJhVOAw1heXqbOVQV8o6mcx/ODd38NxDyyrm2KQy34tPmuJXY8eV
 Cori1F6UCdV7OsZHEKwc51ncaraav1u3ngJhetV3RxpD0nMmIpj5jH3Z0VFlljUPCP3v
 iDmgs06Y/Dbtf4aAjubHx3UsMFdrMJ7C3n1wzLQE+zI7q1JH9F5cXAar5glKkSuN0Ito
 VFdGwely6cYkFtQIhHFfFpqHbSvlWmObplIA3/7D0emDk2LKf46EVsarJ4l0L0ebGU5i
 lWeQ==
X-Gm-Message-State: ANhLgQ3AcqkOuVBhqu1Oaxj2UKncHE6mXqMxbFhu+61qb+SRgL5E12R6
 J3jM4oT4rTRBLExz/9qvFoHeoU3oqqS9f0OhKPke2ohMafO7LO6JL/+8qabwTTH9tEdmVUI0xZD
 ebSb5w30g/3Pm
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr17443692wrs.96.1584791197954; 
 Sat, 21 Mar 2020 04:46:37 -0700 (PDT)
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr17443653wrs.96.1584791197777; 
 Sat, 21 Mar 2020 04:46:37 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id c5sm15737698wma.3.2020.03.21.04.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:46:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 02/11] blockdev: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:06 +0100
Message-Id: <20200321114615.5360-3-philmd@redhat.com>
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
X-TUID: SNLBYL7M5nTB

Fix warning reported by Clang static code analyzer:

    CC      blockdev.o
  blockdev.c:2744:5: warning: Value stored to 'ret' is never read
      ret =3D blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 blockdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index fa8630cb41..6effd5afaa 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2741,7 +2741,7 @@ void qmp_block_resize(bool has_device, const char *de=
vice,
     }
=20
     bdrv_drained_begin(bs);
-    ret =3D blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
+    blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
     bdrv_drained_end(bs);
=20
 out:
--=20
2.21.1

