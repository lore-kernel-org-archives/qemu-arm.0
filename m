Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9053835wrv;
        Fri, 9 Aug 2019 04:09:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxlbWbsoQrJ/pahy8zbiYxLLKTQO2aN6nNXPCc1HAXS30Bn+SGUPyqlt2Uymd5vz4KVSyB4
X-Received: by 2002:ac8:117:: with SMTP id e23mr2583836qtg.18.1565348959491;
        Fri, 09 Aug 2019 04:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565348959; cv=none;
        d=google.com; s=arc-20160816;
        b=oEnEVcO4lvqeWLc774nlEpazV7RMT6y2xz418VxTwqN51PXqTbhyXFlat34oO5x6kM
         z+UNh5T50Lx2QniS1cv85HOO3AAHYee1kXir+3kjSW1haWRNejX1n0vdlVgxvygz5bfk
         EapwLrHecyiVfWqQT/9T1BJHSYTlsIb+r9vWC6G5D6Ta5Bz8Yv54bRuzTFETxrVlcns9
         5gDx9euH3EXXHqYjj3zgUF7HTCK16mqCITM/XS//7uMQjA1y8gwEtxtQhVXLdTLRJM3p
         m0OsctIyC0zb/1ggezw6v/+kBk2HqtxIB1LMXopUiQGJOv9N3s78M3Co+HLbGbORvxC6
         ndFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=k6FDJUKgqtLfqkjHPlodf1IirmKnAfD/EqyJD5pV45E=;
        b=pVbNPD2XEH73wggPrJgXHM9upg386ewwegSo8A/9db0syG8kxXyrQu0KeR52vNKnSp
         dpXLaK0HV8khZz+U/W+yZzfkWU/kICR7j+/svP+XFggD/cNsNm2Fdl/aJCU0z5icO9i1
         rv/fV69PmkA8BkxcpRarRvoTlihIhPuayL7TkSISsccrYkrDzdiM8Ask8b6RY5QQM5nz
         l94zJwIfi8jlFRSnMlt1AsPJQXi4+8lt0kt2Z5p3xCZvkotW9gVSDdO0O934Egs7FKd+
         +CQygLbHcOMn4bDGB7WOiEsRj1JyKQONhx8HoPDHHUq1XeW+uWGTOheOtl1FKqA7gtdW
         41XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CZUydwlP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d31si6930236qvh.114.2019.08.09.04.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 04:09:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CZUydwlP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw2lr-00065n-2j
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 07:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37252)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hw2lY-0005it-G0
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 07:09:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hw2lX-00061a-5S
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 07:09:00 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33970)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hw2lV-0005ze-3u
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 07:08:59 -0400
Received: by mail-ot1-x341.google.com with SMTP id n5so131151071otk.1
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2019 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k6FDJUKgqtLfqkjHPlodf1IirmKnAfD/EqyJD5pV45E=;
 b=CZUydwlPVK8XefwsAmeZnDDeZSBAeRHEtLmuhIi7behpfhTn7XiAD0mRo4471b9Say
 x6rYB/+6OOC99K3B60NhoEzVBisV5vZRtwKB1yFFEh1IO85qyhXrEB8BenVM2/qU67ZR
 6pY6vntTqscVosI4fXXC2DJJKe6xCyE0l7exwIkVNqIougWH4w2WdwtTVNJxXO0HlmN+
 i8WbRfp8ELdPGrHSoBMGjV1XPENtyj0jauQk1zU7FRKsuYN//JWE7uydVIPcF7JMVfH5
 C6CUI+Gzq4Vcji1y4gD1ASIhqH6kpdMU7zs8vuHL234zZy47ZTP1sU4rkNR/W1xTDWLP
 uIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k6FDJUKgqtLfqkjHPlodf1IirmKnAfD/EqyJD5pV45E=;
 b=BKKdWITyFgps/a+O3+IaiiYyWkCSOz8SbL3+M3WrwN2dlGa00sNpOErKMYbL6jIx9i
 AlHP//9XUqmrR1Xt4vDvTGxIkzlpiyYYBOrfw8bGqeyhXO9hffWGSsuVOp1ETsm3HB3R
 Mflq58QUIllDI4GQRMdIAufo5Lc5lw6bSAf1V1i/Ymo73pw4IEKehlJF309qSY6FpdDz
 1OWaezSLTe3M1HTcvSmCYIYHS2wbBT/i7akqRVv5LuVC+swuwAaROUgov451Q3Z1A/Ks
 77V3KzaxcCAMNwqiEXKPhrki3MRC33QENmV18qpBPakt+Qe86KLJUA5n5zA/1N9x+LNg
 o8gA==
X-Gm-Message-State: APjAAAVfdCYrmbQQ6Y6BcZ/mYywiLna16NxB8p7SLj/P6UNcDDhadOBw
 2E5Y9M58ntFUHkQCjR71ZOeEQ3rb7lG6mEfkcxGU8Q==
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr17882113otn.135.1565348934099; 
 Fri, 09 Aug 2019 04:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-6-damien.hedde@greensocs.com>
 <20190731060533.GD2032@umbus.fritz.box>
 <51aa7e6d-3568-8485-4b67-a598a24a1f3d@greensocs.com>
 <e7b05c24-ecd1-a437-7d97-07d69ab759ec@redhat.com>
 <20190808064712.GD5465@umbus.fritz.box>
In-Reply-To: <20190808064712.GD5465@umbus.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Aug 2019 12:08:43 +0100
Message-ID: <CAFEAcA-6GfpYPpafai1XX3u7d3RdTweEUqVwafcX+p6PvQJQpw@mail.gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 05/33] Switch to new api in
 qdev/bus
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
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
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
X-TUID: ljV9qYeCdLn5

On Fri, 9 Aug 2019 at 01:10, David Gibson <david@gibson.dropbear.id.au> wro=
te:
>
> On Wed, Jul 31, 2019 at 01:31:28PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 7/31/19 11:29 AM, Damien Hedde wrote:
> > > On 7/31/19 8:05 AM, David Gibson wrote:
> > >> On Mon, Jul 29, 2019 at 04:56:26PM +0200, Damien Hedde wrote:
> > >>> @@ -922,7 +906,7 @@ static void device_set_realized(Object *obj, bo=
ol value, Error **errp)
> > >>>              }
> > >>>          }
> > >>>          if (dev->hotplugged) {
> > >>> -            device_legacy_reset(dev);
> > >>> +            device_reset(dev, true);
> > >>
> > >> So.. is this change in the device_reset() signature really necessary=
?
> > >> Even if there are compelling reasons to handle warm reset in the new
> > >> API, that doesn't been you need to change device_reset() itself from
> > >> its established meaning of a cold (i.e. as per power cycle) reset.

So, I don't think that actually is the established meaning of
device_reset(). I think our current semantics for this function are
"reset of some sort, probably cold, but in practice called in
lots of places which really wanted some other kind of reset,
because our current reset semantics are not well-defined".

For instance in s390-pci-inst.c the handling of CLP_SET_DISABLE_PCI_FN
calls device_reset() on a device. I bet that's not really intentionally
trying to model "we powered it off and on again".
hw/scsi/vmw_pvscsi.c uses device_reset() in its handling of
the guest "reset the SCSI bus" command. I know that isn't literally
powering off the SCSI disks and powering them on again.

The advantage of an actual API change here is that it means we go
and look at all the call sites and find out what the semantics
they actually wanted were, and hopefully that then feeds into the
design of the new API and we make sure we can handle those
semantics in a non-confused way.

> > >> Warm resets are generally called in rather more specific circumstanc=
es
> > >> (often under guest software direction) so it seems likely that users
> > >> would want to engage with the new reset API directly.  Or we could
> > >> just create a device_warm_reset() wrapper.  That would also avoid th=
e
> > >> bare boolean parameter, which is not great for readability (you have
> > >> to look up the signature to have any idea what it means).
> >
> > If the boolean is not meaningful, we can use an enum...
>
> That's certainly better, but I'm not seeing a compelling reason not to
> have separate function names.  It's just as clear and means less churn.

One advantage of an enum is that we have an extendable API,
so we could say something like "all devices support reset types
'cold' and 'warm', but individual devices or families of devices
can also support other kinds of reset". So the relevant s390
devices could directly support the kinds of reset currently
enumerated by the enum s390_reset, and then if you know you're
dealing with an s390 device you can ask it to reset with the
right semantics rather than fudging it with one of the generic ones.
Or devices with "if I'm reset by the guest writing to a register then
I reset less stuff than a reset via external reset line" have a
way to model that.

thanks
-- PMM
