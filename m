Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp367453lfq;
        Thu, 17 Sep 2020 01:09:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5nCZcKNWGzl7PjgoElH7OnLSIdWg9u2JIr8HeiLsoo4d+yo6IdYK4VaaU0QE7RKJNpPW2
X-Received: by 2002:a25:10c1:: with SMTP id 184mr38048793ybq.407.1600330153241;
        Thu, 17 Sep 2020 01:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600330153; cv=none;
        d=google.com; s=arc-20160816;
        b=QUiBCeH61zgSg7AdnLZZ3nVGG/iqKkOiFELd0BG/rMtO/1c8mo+dXh+iy3CuIiXK1b
         4AN2lX86ue4FkmrsnkSQIS88nLETzX5umBYi7/VbnBg6Rmovd6iDb8G62rffQ+qaoVYR
         yWRy57otfrgucl8d+rESjxw7sLiY06vDC8J1gTQFJC3AXM2leLSxWtpiD+2hr4xPr+X5
         Z+ykrBRn6SFJs8qtpNl5S2yRRVSh3YSGedIFCrRaWaRa3fczbtwp1BR7i9x3Gfz1UVAJ
         ltBdOZxueGK3VcLpm7uHIuwp4OV0lmae0FSYTiQbX64nSyMm0OQVLMUkNkTo9aftC7rT
         7hTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:thread-index
         :content-language:content-transfer-encoding:mime-version:message-id
         :date:subject:in-reply-to:references:to:from:dkim-signature;
        bh=jOHv+hmuvt/5uGoDjBobzg6bO/i4rDlHoi0pXt+cGLA=;
        b=w/JpROtYTxbZRdJlpzvBz8qrJfQAotvJtywJHBiVWqjLDQedffe5AjHJo+AQ1hUFFb
         FZZsTkNFeUvnGHqQ+qDRY4v+ott4rtvTI0NHvbGrywPkLueyqG4XyVVeTXJ61qMcP5DJ
         Q2qEu32s7KwrzRW+muVnPru2Hmrjf76/bBAfm20BDeGvNQnkssyAhzzJaSuPA9ilzgdq
         LCesjCC8UQWNEgnk1OBxUpSP8KZ/6Ig7gNPv6BFNuJAmMMJUiFWnCW5rqiBQDdX59fUl
         WxQtySgh0eox83Z446h+sSQS5h1Yx1g/aGuIWCIUG5kDAhrX/5MLFWhpmU9RznpdJybD
         As/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oPuNTNNP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e131si8205792ybe.250.2020.09.17.01.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 01:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oPuNTNNP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIoye-0003yK-Ji
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 04:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1kIont-0004kC-6i; Thu, 17 Sep 2020 03:58:05 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1kIonq-0005yX-Q9; Thu, 17 Sep 2020 03:58:04 -0400
Received: by mail-wm1-x32e.google.com with SMTP id x23so999635wmi.3;
 Thu, 17 Sep 2020 00:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=jOHv+hmuvt/5uGoDjBobzg6bO/i4rDlHoi0pXt+cGLA=;
 b=oPuNTNNPUq9k7adNJ+MCxPO36a0TMaEGMwhQVoCdjEgN9Di/pFrH3R3Kg9uKvRWzDt
 LQtMj8yF7tVnUZfia/KsTwwUgajPbyrsrWhp15Rn2KCAWizUp2zKna0R1vNtGxfWIBs2
 lojSA+G2egiFwUux1JPYMh5hpKtzARQAXO7v4ar8607HWTWEdXCB/rIZBLrnsEhb4rLh
 DGZaCMAy52DDU/cCnlV852NTKhYLVXQV24fWYVTjMx5ZPKJ4kdMX6J0rm1IxSEv1XjhX
 2A/sebHgkgasZNFSfMgkMjkLT+Ij95fUmoj04h2GMWvg0Fm9J22XBvuazKaCh5G0zRTl
 GB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=jOHv+hmuvt/5uGoDjBobzg6bO/i4rDlHoi0pXt+cGLA=;
 b=c1CNGx7qToQzaCcibkPo5cs8m9VO/hJpeOSgHe5PAYC7UaESVHO3+lFoneNsY5PRMe
 VYRPZxdqW3Mb3Kq9C1itciJ1gNiSmN42H89UFrgB1oHFzo0WncMeutkEhXcBB6G4d1md
 GNnqcMOrBaxIAUhDW8jQbyl3XYPjkol/o4NBfzeAvBxgXVkFBrqOj/7wctHTSyLT0y/i
 5BNvMp/7Wg8xsmTljACMJ5dyb+47MoSrNcgNKauCRsNe+XiaZYkiD9GB3cL784bk7rVH
 z+abqFNA2kdFdkPucfAyApvQlAwmnCnrzBkUoPrA6mcSGcA4uuHtge5couR6fLGY/EMl
 29TQ==
X-Gm-Message-State: AOAM531kRvyssEzrPdiJcRZUn6SIvHhnWG6vg22bMv85RODxhTeSuNt+
 w/nDNEN1ujjaDzy8I8KX/08=
X-Received: by 2002:a7b:c44b:: with SMTP id l11mr8458780wmi.52.1600329479922; 
 Thu, 17 Sep 2020 00:57:59 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id c25sm9433892wml.31.2020.09.17.00.57.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Sep 2020 00:57:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Eduardo Habkost'" <ehabkost@redhat.com>,
	<qemu-devel@nongnu.org>
References: <20200916182519.415636-1-ehabkost@redhat.com>
 <20200916182519.415636-5-ehabkost@redhat.com>
In-Reply-To: <20200916182519.415636-5-ehabkost@redhat.com>
Subject: RE: [PATCH 4/5] [automated] Use OBJECT_DECLARE_TYPE when possible
Date: Thu, 17 Sep 2020 08:57:54 +0100
Message-ID: <007e01d68cc8$429bc160$c7d34420$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIelPz0+HUIa2jn7mxP/pozU40YBAGnf84ZqM8pawA=
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: paul@xen.org
Cc: 'Fam Zheng' <fam@euphon.net>, 'Peter Maydell' <peter.maydell@linaro.org>,
 'Dmitry Fleytman' <dmitry.fleytman@gmail.com>,
 'David Hildenbrand' <david@redhat.com>, 'Jason Wang' <jasowang@redhat.com>,
 'Mark Cave-Ayland' <mark.cave-ayland@ilande.co.uk>,
 'Laurent Vivier' <laurent@vivier.eu>, 'Gerd Hoffmann' <kraxel@redhat.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, qemu-block@nongnu.org,
 "'Michael S. Tsirkin'" <mst@redhat.com>, 'Halil Pasic' <pasic@linux.ibm.com>,
 'Christian Borntraeger' <borntraeger@de.ibm.com>,
 'Joel Stanley' <joel@jms.id.au>,
 'Marcel Apfelbaum' <marcel.apfelbaum@gmail.com>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 =?utf-8?Q?'Marc-Andr=C3=A9_Lureau'?= <marcandre.lureau@redhat.com>,
 'David Gibson' <david@gibson.dropbear.id.au>,
 'Andrzej Zaborowski' <balrogg@gmail.com>, 'Thomas Huth' <thuth@redhat.com>,
 'Sergio Lopez' <slp@redhat.com>, 'Alistair Francis' <alistair@alistair23.me>,
 'Beniamino Galvani' <b.galvani@gmail.com>,
 'Eric Auger' <eric.auger@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, 'Peter Chubb' <peter.chubb@nicta.com.au>,
 =?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>,
 xen-devel@lists.xenproject.org, 'John Snow' <jsnow@redhat.com>,
 'Richard Henderson' <rth@twiddle.net>, 'Kevin Wolf' <kwolf@redhat.com>,
 "'Daniel P. Berrange'" <berrange@redhat.com>,
 'Xiao Guangrong' <xiaoguangrong.eric@gmail.com>,
 'Andrew Jeffery' <andrew@aj.id.au>, 'Cornelia Huck' <cohuck@redhat.com>,
 =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <f4bug@amsat.org>,
 'Andrew Baumann' <Andrew.Baumann@microsoft.com>,
 'Max Reitz' <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 'Paolo Bonzini' <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aF7WtCJ820ca

> -----Original Message-----
> From: Eduardo Habkost <ehabkost@redhat.com>
> Sent: 16 September 2020 19:25
> To: qemu-devel@nongnu.org
> Cc: Paolo Bonzini <pbonzini@redhat.com>; Daniel P. Berrange =
<berrange@redhat.com>; Peter Maydell
> <peter.maydell@linaro.org>; Andrzej Zaborowski <balrogg@gmail.com>; =
Alistair Francis
> <alistair@alistair23.me>; Kevin Wolf <kwolf@redhat.com>; Max Reitz =
<mreitz@redhat.com>; Mark Cave-
> Ayland <mark.cave-ayland@ilande.co.uk>; David Gibson =
<david@gibson.dropbear.id.au>; Richard Henderson
> <rth@twiddle.net>; David Hildenbrand <david@redhat.com>; Cornelia Huck =
<cohuck@redhat.com>; Thomas
> Huth <thuth@redhat.com>; Halil Pasic <pasic@linux.ibm.com>; Christian =
Borntraeger
> <borntraeger@de.ibm.com>; Michael S. Tsirkin <mst@redhat.com>; Fam =
Zheng <fam@euphon.net>; Dmitry
> Fleytman <dmitry.fleytman@gmail.com>; Gerd Hoffmann =
<kraxel@redhat.com>; Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com>; C=C3=A9dric Le Goater <clg@kaod.org>; =
Andrew Jeffery <andrew@aj.id.au>; Joel
> Stanley <joel@jms.id.au>; Andrew Baumann =
<Andrew.Baumann@microsoft.com>; Philippe Mathieu-Daud=C3=A9
> <f4bug@amsat.org>; Eric Auger <eric.auger@redhat.com>; Marcel =
Apfelbaum <marcel.apfelbaum@gmail.com>;
> Laurent Vivier <laurent@vivier.eu>; Sergio Lopez <slp@redhat.com>; =
John Snow <jsnow@redhat.com>; Xiao
> Guangrong <xiaoguangrong.eric@gmail.com>; Peter Chubb =
<peter.chubb@nicta.com.au>; Beniamino Galvani
> <b.galvani@gmail.com>; Edgar E. Iglesias <edgar.iglesias@gmail.com>; =
Stefano Stabellini
> <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; =
Paul Durrant <paul@xen.org>;
> Jason Wang <jasowang@redhat.com>; qemu-arm@nongnu.org; =
qemu-block@nongnu.org; qemu-ppc@nongnu.org;
> qemu-s390x@nongnu.org; xen-devel@lists.xenproject.org
> Subject: [PATCH 4/5] [automated] Use OBJECT_DECLARE_TYPE when possible
>=20
> This converts existing DECLARE_OBJ_CHECKERS usage to
> OBJECT_DECLARE_TYPE when possible.
>=20
>  $ ./scripts/codeconverter/converter.py -i \
>    --pattern=3DAddObjectDeclareType $(git grep -l '' -- '*.[ch]')
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: Paul Durrant <paul@xen.org>

