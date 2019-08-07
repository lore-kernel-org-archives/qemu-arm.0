Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6370035wrv;
        Wed, 7 Aug 2019 03:35:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwKYGMEGji0xqayB7YaWHpb7XcdNInZUPYAUr+GdBvmtdyuptbYOX0GEOX6Do+d7LiYNBQ/
X-Received: by 2002:a37:6f82:: with SMTP id k124mr7413799qkc.463.1565174103244;
        Wed, 07 Aug 2019 03:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565174103; cv=none;
        d=google.com; s=arc-20160816;
        b=Ax9+oeNzbJRD32gUxPHA1Qxx6KZ0FZuV4t7wQggiFx6PS8ZVG1Z7gTIlwhI5J8D2mU
         5wgTfAnTBSVd513+aOpmgs1OXyeBzm2JlV9wCClMDudf+o5UoYOV/lce/YcqpggWaV2F
         U75sN8hhXKbwgFGBgtzoxzPo6pY4FkVQAywuC4aglO2CSVF82HKVC8rlq34S7tEEANWA
         D+5yQctmwKmHq948pCb6slRTolIVPGlLGbJJCFc6owHCa7AE/GEyXORQWVkevrL0BsRV
         yAQ7jA7dq/RpEejWMWhBZSLEkUbE2WJdM33uOusNfVHBBZxVhFQcLknjqm9LgIlS751F
         tILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GHi1f+voEbXN8hKlRxap0utKOX1Tjporwl0c9C0XDl4=;
        b=AUcQnHCwWdiPsJYN0ll/czeNxPialX60xH7+BI5xqofjejlKlvfZh2lRP5Dz0B29YC
         iGf/m7uHUpnyVUFBmp3aIHKLLaIFy5goXNM0o8LPwv/JLik2mSI97c0TAYQigV7EkwK5
         oI/mL2rllJxvsnbG9tJc7G1+dpMI0VDbVNIxgCgBgQCrHNj4v1gupEBBnfPtT6eKA6Ch
         wfv4Ze7bqoaAehxRJ9TxEqogKysoKYbBsgW0r6GqJ6zfHQ6bmOmaNfGHZvITJM8NRr4L
         N2BIOfOrpRt/Xe9nSWOwD+nXiRKNnVasSCALLYumSZF0bJVCkJwu/SBwYVjDBj9dWKvS
         /biw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cpDKUiw1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si49782939qkm.345.2019.08.07.03.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 03:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cpDKUiw1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvJHa-0002nD-Qg
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 06:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45025)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvJHT-0002hT-DC
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 06:34:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvJHR-00006X-OC
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 06:34:55 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45828)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvJHR-00005V-He
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 06:34:53 -0400
Received: by mail-ot1-x342.google.com with SMTP id x21so8983312otq.12
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 03:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GHi1f+voEbXN8hKlRxap0utKOX1Tjporwl0c9C0XDl4=;
 b=cpDKUiw1I/jyIsGTm+dDejVGNs94pPIqMuqaOXCMaBHSDS9cchAV+uye19rqEnDQpe
 VHk2UVwa2JadUGiFnUQgMNzlafT+8BTb7mhNUepAHiSQGz0KmM3cB60SdYp6DwBA97LR
 mZPX73Cl3/ZLthzBFgX7tEkMx5ibJVZiKQWPmrlJhx6DhT4T0F2uxefQtlCxhyU2sLQn
 StUMCgnHaygIDZjGAK0RkVvlZOXqUPa5pDbUPbz5jOavbRgABH8HTsp58Hf/aohI63V5
 49T7/cC69N1HjLFABicgvPhgNsCVQNSOy4NuyjISiQEqpaOZZaejL4OmVtsJx61QvRhZ
 0H2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GHi1f+voEbXN8hKlRxap0utKOX1Tjporwl0c9C0XDl4=;
 b=BH6joIg0Q2jKlbWGiepD4dCSAgSrbARHxsMNCU45ceEbIkMEQepY/52QIxE7Hv2XMa
 XPK+WELPw2udQ/+zJCninYBzYMC0cq+G8OODmsGdxURIWazZV9vS9MG+X3NAWGJosnyF
 ZuJof68lIYmhMpxx44nheu8HRfrAYfQIXrxybdR+oe0fQH5maGaHLsjfJ5EIM3Hx2pku
 UHeS1OeKBzuh+jF7vYDbASUX0EZ+P80d2+uc3BlmtEV/dqOw3qNWeZqL4Oarq7x9Xv0n
 lnH6qnrjAwqi4rLt3k58TDGExVxJdpADKa9ie7iQlgSTm5jVredkZUIunpf/I0KX3MoI
 /dZA==
X-Gm-Message-State: APjAAAUcH/Y6MNl5hTVbCVCBHvPLX9Flieg1sTQHMujjbKklBAYjlLrO
 hgOVEVV9C6Qkp5lc4hVspmfOvCondJhuXeJtlkIHBw==
X-Received: by 2002:a9d:711e:: with SMTP id n30mr6609741otj.97.1565174092162; 
 Wed, 07 Aug 2019 03:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-10-damien.hedde@greensocs.com>
 <20190731063044.GG2032@umbus.fritz.box>
In-Reply-To: <20190731063044.GG2032@umbus.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 11:34:41 +0100
Message-ID: <CAFEAcA-=rMgKuhtq4AT+QohRXf71biNFDRQaxMctrro7mTV4kQ@mail.gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-TUID: cm0dER3V1clP

On Wed, 31 Jul 2019 at 07:33, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Mon, Jul 29, 2019 at 04:56:30PM +0200, Damien Hedde wrote:
> > +The function *resettable_reset* is used to trigger a reset on a given
> > +object.
> > +void resettable_reset(Object *obj, bool cold)
> > +
> > +The parameter *obj* must implement the Resettable interface.
>
> And what happens if it doesn't?  This function has no way to report an
> error.

Trying to reset an object that isn't actually resettable would
be a programming error -- I think asserting is a reasonable
response to that.

thanks
-- PMM
