Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3076913wru;
        Fri, 5 Jul 2019 04:54:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyObrp1wW/ZuL7qYBM+6FlAqmuRAw+N1PMcUZv/w25ZLIL9eqnd8bW9bY+02Hk0FWwW9V6c
X-Received: by 2002:a50:aa14:: with SMTP id o20mr4007577edc.165.1562327644745;
        Fri, 05 Jul 2019 04:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562327644; cv=none;
        d=google.com; s=arc-20160816;
        b=FZp5gDdMHl5k2BgOw4x+lQTk7Ji4NppbDiAguZxPHAeHcn1nnMdWkCB57vL6ynQcOB
         nLLAxuXepleNtCADpvH5W4sMug2kYx/UXR2Jw0WXxEblabzfWbERREVI8aqbnXi+a+yh
         sjLeP4ft7wnsfQq7rYedEk9EtEDkth/u6ywpBaUexf373n6fNscVal9PTzpQNK2++jl/
         +3ZmkyeZmJogfrFNpAiD5Mb7Rgam1SNNR0YsND8C+8ZMggruLiJygyet2JMIzXK1MMiF
         P1Zl3HPFY9MusaZRCULtfMkOEmeNWCUDgOZ080P2A6byJSa7gDgE6zv+LOIUnlXUHWis
         A7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :message-id:in-reply-to:to:from:date;
        bh=6mR8eyXkOcRdh2vFs2G/jxr8MLewm84mYiHYdlsyFrc=;
        b=k34yhdUkIv4+Sfa1vogbYPAxMSKeXloTKb1/kj8E1exOpSi8I2hTROwIKa0v9SoAJv
         MTYvXW3awA96biGvcfLS/4VMOIFDgB2g8hOerX5dnS1rZj3VHiCbWIs0d2O89mpIRxn5
         aNRcNEA7jSxTFBwnjeUx63xl56905SY2d0AXoPH7wkYgj07PlNTd5uPti7pCBkcey6CP
         MOJcw9pJZt7nGEJ0aO91YeOWxM1EF52era1ZOr8KwcWrtmKk/vMdMHTsXxk0DiKolzVk
         vnLe6F5v+lzI3Fr1yXtnExYh+pgiLQ4G8rOtnnYunQVgCc54NP5QQsA9PEuMxOV7dEdK
         sq1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si5405564eja.335.2019.07.05.04.54.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 04:54:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjMmx-0002V0-Ro
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 07:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45783)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hjMmh-0002Ul-1S
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 07:53:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hjMmg-0008TC-0Z
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 07:53:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54046)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>)
 id 1hjMmf-0008I6-R1; Fri, 05 Jul 2019 07:53:45 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 539F359451;
 Fri,  5 Jul 2019 11:53:34 +0000 (UTC)
Received: from kaapi (unknown [10.65.150.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB3F76961E;
 Fri,  5 Jul 2019 11:53:28 +0000 (UTC)
Date: Fri, 5 Jul 2019 17:23:26 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
In-Reply-To: <20190705104255.24027-1-philmd@redhat.com>
Message-ID: <nycvar.YSQ.7.76.1907051714200.15068@xnncv>
References: <20190705104255.24027-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="1091214742-10836493-1562327613=:15068"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 05 Jul 2019 11:53:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH-for-4.1 v2] hw/ssi/xilinx_spips: Avoid AXI
 writes to the LQSPI linear memory
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Lei Sun <slei.casper@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8ezJTXYya2Fw

--1091214742-10836493-1562327613=:15068
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

+-- On Fri, 5 Jul 2019, Philippe Mathieu-Daud=C3=A9 wrote --+
| +static bool lqspi_accepts(void *opaque, hwaddr addr,
| +                          unsigned size, bool is_write,
| +                          MemTxAttrs attrs)
| +{
| +    /*
| +     * From UG1085, Chapter 24 (Quad-SPI controllers):
| +     * - Writes are ignored
| +     * - AXI writes generate an external AXI slave error (SLVERR)
| +     */
| +    return !is_write;
| +}
| +
|  static uint64_t
|  lqspi_read(void *opaque, hwaddr addr, unsigned int size)
|  {
| @@ -1225,6 +1237,7 @@ static const MemoryRegionOps lqspi_ops =3D {
|      .read =3D lqspi_read,
|      .endianness =3D DEVICE_NATIVE_ENDIAN,
|      .valid =3D {
| +        .accepts =3D lqspi_accepts,
|          .min_access_size =3D 1,
|          .max_access_size =3D 4
|      }

Looks okay.

To confirm,
  When lqspi_accepts() returns false, guest will see an error/exception?


Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
--1091214742-10836493-1562327613=:15068--
