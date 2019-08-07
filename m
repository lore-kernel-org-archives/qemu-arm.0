Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6728118wrv;
        Wed, 7 Aug 2019 09:04:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwKqJ9uGCVLmHnK1ytfNgx3lNwGlVvDNrfqFfVl1FffhYKqnPk9mHtI/cr9R0+lwphvYei4
X-Received: by 2002:a37:9c0c:: with SMTP id f12mr9026821qke.442.1565193842021;
        Wed, 07 Aug 2019 09:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565193842; cv=none;
        d=google.com; s=arc-20160816;
        b=tqxrAGK5sigqDFnSAcAzZCIxP8NEnwOXSmoPKWD/zcllR7zUyiIDMWqyfjDXrJGzFf
         mTzmNeqeEOK+BqlxUVLztOQRpSehxcEA1yICgaJjgjkCm4QXHnib5NBkb/i9yOCKaWm1
         gZ50wRPJLO/63BxTr5v5+IIF8eLVHiMpOtGW+hceRfeIqw04/lfLSfoI3Xwe5iUrbtiL
         /iidNb62kutEerLeKaFKUvd1u9lmZ6jUiaE99DL2K2qH9sAfp0caOy3n/H9yvefeoLdj
         fyvPJnL3w65ocQlQICbX6dx48d+U+3gQLgP2v8ZtXoLPAiFgYJmY9NAxa5OIqxDDgUQk
         CcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JRp+GCBhRCvNVP/Ko71Bv5RLsa9azOABccrtfnznMFM=;
        b=nsiSXtSMDynC/aLjN9GE4f2wZIT8STG1BOuvN9Z4Hi6CpUpD2K0J1zyRSIz+ZA3S93
         Nq8sGy3gGNx6Hi95klkwy6ZOkKujv7vMf2Qwyq4ifKIksHZm9pK1XgDHpXxAhyVdJAa7
         lI1TXDdxEn+LjZlrgJ8P3ULTgscJ0vwDoK1dX+/EI/D9dOe42ergyfhSPwCmWqXNOr8Y
         cKd/pbx1gG+YZFF595rwPq0djaaKV8K+Bxx6yyGcnSSLwoL3WmnGLAvu+pRanLocByF7
         /FlwWQdei1CvQW3agySTsLJS2VSGjXBxaK1Uxj+Qc7IZO9mqEPzki+dmkhMKQ6OoY/7C
         JhcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NaloFjre;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22si61570823qvr.63.2019.08.07.09.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 09:04:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NaloFjre;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvOPx-0004Nj-Hi
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 12:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvOO5-0000mi-Ju
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 12:02:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvOO1-00068s-Oh
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 12:02:03 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44574)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvOO0-0005vP-JR
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 12:02:01 -0400
Received: by mail-ot1-x344.google.com with SMTP id b7so56139756otl.11
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 09:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JRp+GCBhRCvNVP/Ko71Bv5RLsa9azOABccrtfnznMFM=;
 b=NaloFjreMAMcG84k0+ZCWZGy/vgs+qon7TMAIa7UGyq/+pRaZByvToXFaLIOicEPcG
 UDKhyA6k3r4umIx8jhOrY0oo/BaYr737yaTEn+49SDraChk7NIuUFhPTucwuWI5Y/cem
 r/jxW+bXrSdOepnRIVExwUymgWw7VYGMAlpGVmjC8lUgRyaYU8jaEQq/hWpsYMLDel4h
 msX9Mvtd+nucMK74JSNIUBEc3Jy6rKlmMDzw1+S5CaBiyvdZUpY7Att8qkMiMZwhVoJI
 ZNWacTc/ciGzhV7xrZf69j2BBuanVH0N5+47W1d7js67HEpWYyTXLMVJjMHz86Sp8LJc
 QWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JRp+GCBhRCvNVP/Ko71Bv5RLsa9azOABccrtfnznMFM=;
 b=Kr+GtPn/JRW4G6iZ2wjiOvetKJ20hQKD8LIafOGyha01BacscpSWQw+sYMm5dD/b5d
 1S0G9fOSO1mTCKBinRnaCRdT0s1y5w9AxX4D/srT7SJHIbzIhCtn/3jDgOqYUDGVS75j
 WfVmxrYjUInB5tchsRJyc5/pH5U65v5EwD2Bg7XawRkpdZkkJqpULGh+hLITqI20xQPV
 b8xrTL3GgCdGImwRkEAmIaHOJgh5vrKc8DtLup0HSJZxAJkSpzeu+uUg4k6I18QOTEr/
 LNMZH//+4bOSCYiwBI3JK9xH8oaOc9LOBQKc5blj7eoZ1kpHVZWkgM/zAmg96sVFhb7K
 ukQA==
X-Gm-Message-State: APjAAAXZc1tjvtY+iqaW4TmD15TgNpuReQytVb1LWLSy+lb3Fs8+ngK+
 6R3QOOKclqXPLCWDWpn7Qhtozt29WZPGVUlOjus7gA==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr8913557oti.91.1565193713448; 
 Wed, 07 Aug 2019 09:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-10-damien.hedde@greensocs.com>
 <20190731063044.GG2032@umbus.fritz.box>
In-Reply-To: <20190731063044.GG2032@umbus.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 17:01:42 +0100
Message-ID: <CAFEAcA97PbDP3XrtHCXuiwZorC7B8hY_EGL+iRLsJeC=L=kekw@mail.gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v3 09/33] add doc about Resettable interface
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
X-TUID: ZIidEFoPGaa+

On Wed, 31 Jul 2019 at 07:33, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Mon, Jul 29, 2019 at 04:56:30PM +0200, Damien Hedde wrote:
> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > +For Devices and Buses there is also the corresponding helpers:
> > +void device_reset(Device *dev, bool cold)
> > +void bus_reset(Device *dev, bool cold)
>
> What's the semantic difference between resetting a bus and resetting
> the bridge device which owns it?

We should definitely explain this in the documentation, but
consider for instance a SCSI controller. Resetting the
SCSI controller puts all its registers back into whatever
the reset state is for the device, as well as resetting
everything on the SCSI bus. Resetting just the SCSI bus
resets the disks and so on on the bus, but doesn't change
the state of the controller itself, which remains programmed
with whatever state the guest has set up.

PCI has a similar distinction between resetting the controller
and resetting the bus.

Note that we have this distinction in the current APIs too:
qbus_reset_all() vs qdev_reset_all().


thanks
-- PMM
