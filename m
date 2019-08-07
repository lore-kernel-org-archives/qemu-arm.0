Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6373345wrv;
        Wed, 7 Aug 2019 03:38:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5a1LZc7YEFQX04Ruh/0IqcfjR285akDrhpt6aGZbovBZMSLVLy18FAof4WA+p/4jZq2Kh
X-Received: by 2002:a05:620a:15e5:: with SMTP id p5mr7613215qkm.409.1565174296486;
        Wed, 07 Aug 2019 03:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565174296; cv=none;
        d=google.com; s=arc-20160816;
        b=ckkYUXkKkOPlPKXJCX65BXskOksADP+MRhE57cR+bbynaOCIR9QiTznFgYQj8MwuXt
         RZtKqYWFGESROCJrlXCweHw6PEJ0/R+mgZQGzu9mft3qqnzOJLzeP0q0VYtDtk7ccvJw
         hkSJQFpRxBkwPjq/+h4whxiiMR1Bep6/t45XJSipsl6b6dJ2sjn25d5M7qF/g4dOaSW/
         5szqetb9r+c/95+B/klO1yL0AAC/uNCg87fxLy4ixvxIwwjAPOJY37OtdBS7KG0Al6GO
         RP14JriMirxud2Mgp3Zxi5t6t9pmbWsmz7kDR2rp3sri20r9gV67vmASkEZT1Wr6MXK1
         XbMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cCgd+I9d8IpQehwZ7OvjxnxlzdVf6lG4aTOJWZX8fHI=;
        b=04shr2OOQvkuBAnuk+M3IMo+4LgsH7AqSP+0rpyil2fyeis73IkceAPONkY0poPNvK
         QO9FQcnDkjzCSLQqQMSdrxAr/WXzzCrc+98uS7unoqsmbjMykk2/RZhIONfOqIbq6q/z
         RftXgyfyonsdkFApSvFsx3C/OpA9J8qf94WT6q0FgjgZLcSU9VQZ3UNYXi4Q8lGKC0Gz
         IqPGLBM2K76Ihia3PfwYXXp8D0p77XBZ8YeH2np/eJZwinRrt4b0rPDYYsJtZshSG88m
         ZpyFwwheCgug9RKPvvcCpqukSh/X+kapMxece8a9AzToEU4QcZvhsOeaexT7JlPm6jv2
         aQAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ek65IJ6n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si57743688qvh.48.2019.08.07.03.38.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 03:38:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ek65IJ6n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvJKi-0004RR-12
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 06:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45679)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvJKW-00045h-7U
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 06:38:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvJKU-0001dz-Vu
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 06:38:04 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45938)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvJKU-0001ca-Oj
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 06:38:02 -0400
Received: by mail-ot1-x343.google.com with SMTP id x21so9013447otq.12
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 03:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cCgd+I9d8IpQehwZ7OvjxnxlzdVf6lG4aTOJWZX8fHI=;
 b=ek65IJ6nU8lmHoMFxQsyW/BlyBr01XeDIqg0JJKXhdFXiplOR898QgCC88xPCZtFoR
 BEr6MrUyEzJ1Ha8M3cyi7lCsKnJAjrIQ9I/5GIgOStuQF+aCVlVSY43CBNwzz5kXxv7R
 LGQ/1UHuidItRoquEdm5lNYFy8My3R36Ugn5QR/N3fyjj8DAWl96veRg5icCHBR0RpNX
 +3d+ijoUnt8Zfdp99crqRgoMkDOverDCTHuxKYTUPPwQDJCrbFh2koZI7BoR1L1r7KF9
 wn5xu7Vkrrg8dZ3DDjbTIwNleXBS9YLm8OdG5mxH355bvWOsh5uOkYhT3fj9rTHTgzlq
 NDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cCgd+I9d8IpQehwZ7OvjxnxlzdVf6lG4aTOJWZX8fHI=;
 b=mPqIxbwoVgYNbncSKXLhOm1icvvEKVK5ifs8X0JilJwVkBp85s0Sq1OPGw6fC621Cc
 a+yAAhzTnFbDi310Q29IR+Nq+BR+c/RP8KkUwXnH1Y37S8Zpxgb4yT8gFtrEowMY2tpD
 2bK7dA+14bUnkpIFNLnh9HyQziXknPWNDOnS68yFBoWLSKkij/SD9P175daNVOUr+8j1
 wMNcXuF7bj5lmC8F1VtAVV8DGU6srN48YxX4CCvYRyOwqTsHZL+27Ws9aaOLET1Ima6m
 GVGqoYgk9y9v1fQbGdZttKsXXFGLKg0jf11/pgXnmT3vrqsY9E/9aPxB3vLLB4xhEw9Q
 Nn5g==
X-Gm-Message-State: APjAAAVWhwPeiCplyaCcz1wLapWU965hCXmWLpXqgucCa9dwRMkG6F7M
 OBiGd5SG/W7z+dAih+GJSUAzHChFZ9YT7gR9kJ+t3g==
X-Received: by 2002:a9d:711e:: with SMTP id n30mr6619569otj.97.1565174281829; 
 Wed, 07 Aug 2019 03:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-9-damien.hedde@greensocs.com>
 <20190731061108.GF2032@umbus.fritz.box>
In-Reply-To: <20190731061108.GF2032@umbus.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 11:37:51 +0100
Message-ID: <CAFEAcA-dSBpAVfjn7VnCRgnZabBP226ZVuSJYW1bwzEr5mNktw@mail.gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v3 08/33] Add function to control reset with
 gpio inputs
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FXuZtP3X4+vL

On Wed, 31 Jul 2019 at 07:33, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Mon, Jul 29, 2019 at 04:56:29PM +0200, Damien Hedde wrote:
> > It adds the possibility to add 2 gpios to control the warm and cold reset.
> > With theses ios, the reset can be maintained during some time.
> > Each io is associated with a state to detect level changes.
> >
> > Vmstate subsections are also added to the existsing device_reset
> > subsection.
>
> This doesn't seem like a thing that should be present on every single
> DeviceState.

It's a facility that's going to be useful to multiple different
subclasses of DeviceState, so it seems to me cleaner to
have base class support for the common feature rather than
to reimplement it entirely from scratch in every subclass
that wants it.

(The patch as written breaks migration compatibility -- the
new fields need to go in their own vmstate subsection
with a suitable 'needed' function -- but that can be fixed.)

thanks
-- PMM
