Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2211362lfe;
        Sat, 21 Mar 2020 07:44:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvwGHWe4A9fCdziUSBey3yify2IBDJvC7qJnhxFRfXZznDJtY2ElkOUYkIFypQwMXgm2Tyc
X-Received: by 2002:a05:620a:12a5:: with SMTP id x5mr13128724qki.478.1584801899547;
        Sat, 21 Mar 2020 07:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584801899; cv=none;
        d=google.com; s=arc-20160816;
        b=i+vcdqA9OdlQcLrq+wrGSbaKNNICSUhGei5reh9UF1/xQ7xgEl0P1ysSZPmuaRZVlb
         TrTLXyRa+ROqOtRMyydhDmc5d7OxBtuK1U6n+P66GZ7bL/OHClvyYZ2Rmfq2r8BRiJa7
         V1ca7kJ3HhMmZhr6afo2+digmtqiDBoKTDJZAT20NVuC8UxGy0iARHKrSjBWqDJnEXAz
         pbwBAJczmMP1pPxC3bb8MpB0/dKJNrOjTR3yJ3+KZod7sZj68Ea0FnPBv2Ny52G8gavp
         22BDXUItqcZ5OKQsRQ+wSqaC+Q/J2AVqF7pQvcuqFNksMVL5G3owPkGqLPwyLLVn21f8
         0Ibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kQDd9EbUfb0uuK6iIsTzZMSp5qbZytglJrEh2QYroHU=;
        b=v7Wya3zWSFszAx3N+uS/SGLDXRm2pzwoR9uOzkM6+AeFGJiA4lzxTIIteeoiwYMDOF
         l0PYUQq7zIoa6A/C9kkjCXMC4xwOdSLe3ulSWVa5JeNTEPKGRYH3MMFj82C+nmcfsUSZ
         77Onpr+pJaUSbFtDB0mWibuYIgEOC9J3Y3RIy8XC/Nk9FEPuwOcDmyrNaJphdPJtLkKg
         zUjKiZ2JHTmgkZcVxNWTOCUBZaXwTz67dhmZCBlZO1AeSDFGja0oRhz3NDYyBBn8gx7P
         7dyplG9AFwzLpaUHSdQChSZ0rjRbbGxRgh8Vwtql/OROMkcglCt503/H61bZmcEPDYAO
         UOng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W3x3QkYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si6007934qkj.195.2020.03.21.07.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W3x3QkYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfMx-0001h9-0C
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfJh-0004vZ-Ig
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJg-0007Kg-K2
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:37 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:55069)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJg-0007KT-Go
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQDd9EbUfb0uuK6iIsTzZMSp5qbZytglJrEh2QYroHU=;
 b=W3x3QkYK0WM+fOKbcKtIivylpsnyHDVnbGG/PBqUJGbmcX6iD84gXy6DBs6qcGXXK5QX1l
 Ce4Wzd+DBu4PJV4yeuz0IV8hCBnjaIQt6oYX88p3EhtQ/f6JQSx4Nk/lE35yz9ik/tEzyW
 77Q5xLHJhYesQpFJKcUCGepw1S5PZfQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-H8x1NAI0MuiRuBw5UV380w-1; Sat, 21 Mar 2020 10:41:34 -0400
X-MC-Unique: H8x1NAI0MuiRuBw5UV380w-1
Received: by mail-ed1-f69.google.com with SMTP id c2so7593168edx.16
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7jHPzgLUxabSngeicFYbktzokTE6KbRJJJ5XQsCuGXA=;
 b=DhT4LQaFv1lLNb/Mt+yPdVRQoawwvbV5SnRZ5QCk6zyr7xU/gBVOSAFzEPo0VOT2AA
 RbE0fXYPeQBkGgpFcVmiOxsgBmQ+dmKEIAiX3g3JleMPoSkk4GRfwwDZkd6azN3ZG6c9
 9YUI5e5rvxWd6QLpANZExNoZyygiVRreltFilDApp6iEPquspXdJqmMH/afjSYNK3vPy
 /B7RHSln1q27JjSbFVaqF6WKXtTLxUt2fI7NugIbPBwveq4X0+aGcYf5+0k3WaAG1WqX
 reU9kxTT+RzW0rMG294WwLerZfU1O87TlyL5HO7+c9sPmm+CZVRNVajVUhlrQPuL8PfY
 X+Jw==
X-Gm-Message-State: ANhLgQ3ZmXkgLDd66dpBv+xav3RbrEcvJnGrU2+3kgHePDpEBootS3Fq
 e2Czpl7l1Ymh8FuBuEguoqazionRvLIIE0IcqKzhBBk5mMg2PWYWAuD69CW6FrAcHUt9W2RqsdE
 dh16rFW8Z2wwW
X-Received: by 2002:a17:906:7007:: with SMTP id
 n7mr13189132ejj.108.1584801693280; 
 Sat, 21 Mar 2020 07:41:33 -0700 (PDT)
X-Received: by 2002:a17:906:7007:: with SMTP id
 n7mr13189101ejj.108.1584801693035; 
 Sat, 21 Mar 2020 07:41:33 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id a32sm603046edf.46.2020.03.21.07.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2 03/11] hw/i2c/pm_smbus: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:02 +0100
Message-Id: <20200321144110.5010-4-philmd@redhat.com>
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
X-TUID: SwRS1jpfppp9

Fix warning reported by Clang static code analyzer:

    CC      hw/i2c/pm_smbus.o
  hw/i2c/pm_smbus.c:187:17: warning: Value stored to 'ret' is never read
                  ret =3D 0;
                  ^     ~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i2c/pm_smbus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index 36994ff585..4728540c37 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -184,7 +184,6 @@ static void smb_transaction(PMSMBus *s)
                 s->smb_stat |=3D STS_HOST_BUSY | STS_BYTE_DONE;
                 s->smb_data[0] =3D s->smb_blkdata;
                 s->smb_index =3D 0;
-                ret =3D 0;
             }
             goto out;
         }
--=20
2.21.1

