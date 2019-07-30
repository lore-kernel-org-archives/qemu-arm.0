Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4420682wrv;
        Tue, 30 Jul 2019 07:00:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxiNlJf6rGGJqAe6f/tdfXKtiRQbehUMZn7CeoMA6CnAfiwS/TvBsxQh/WkYDpRTcxXi+YT
X-Received: by 2002:ac8:70cd:: with SMTP id g13mr76984737qtp.325.1564495213560;
        Tue, 30 Jul 2019 07:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564495213; cv=none;
        d=google.com; s=arc-20160816;
        b=0q7LeuQaIxSPH7WPiHMf7eKbfTJ/k0H2rpP26et8PbRqX/RKaK0Dbetiw3AKQgdVFi
         dmWiGcNPA9kQ2fGPOWdt0stdS2DD8CZvr5tuFefXgIygMYTnwP/9VC0Bl0PYad26dwAh
         ubd1ptkDwzZ7hI4vT5r1omW7sJiBV3XAkT2D9OYmNtb23ryvD/tk5JT41xVxmHpx7XwU
         Vw+bJPEKziL7T5g49dIfxUS79BKjJlV4nTtMOOPQkxzbNlTS+OrtJdGZiCxq5ZObNyuI
         uPi63T2xJFr+VQV+h38vB+1tuO4tlEW/2YDYxCEvi4aPvU9VcOsg8/18iPZ/TGfMvQhU
         IicQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ozn85kLHHdYbnp7yoE6ellLtbD6HtMj9acchm0i6WTA=;
        b=m/CIcbH7X/kVZ8yZ0Ke7gvXUw79ZjkAZiqvn+8wOvq59gNL0q/A3QEORbwcvG9Z0lH
         bToDwKJFnk43jRQz93T63KrHJlhy3joektP3IOlg8l8fjOpZwI1TZZBrWODNnE2k4+pb
         RsKW2kJBXwikSrUdcbAuJNBLrgLnX0Bl/Fo1mqg+lq10qY2J1Jbc1cFgqDpfUiFHybjy
         GxZ60/mQ4nz4HkvFxg8/9AJmSLXeB4WdCEJ3P88hXYGf2rnGMVdeCh9uFTc9iOUAdLG4
         0gip60Ym/23kU1/WqFYzcsGTarD6WbFsdp1Im2gwHBJGvpZMa0HMAZVTN+etqCYkQreW
         O8Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yeqhFwI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si12260053qvk.143.2019.07.30.07.00.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 07:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yeqhFwI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsSfl-0000Vl-1X
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 10:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54762)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hsSfd-0000VA-BZ
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 10:00:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hsSfc-00009X-97
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 10:00:05 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33306)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hsSfc-00009A-2O
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 10:00:04 -0400
Received: by mail-ot1-x344.google.com with SMTP id q20so66301047otl.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2019 07:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ozn85kLHHdYbnp7yoE6ellLtbD6HtMj9acchm0i6WTA=;
 b=yeqhFwI29UCqTGtz5SKWJNYgF8q2kwqzYFqe3FE4z/O4rtVK3+tKAqYAkGZfKpJ1yq
 yHCIwqWLpNeOnfOxBANGwy160WDHsDYhnMA5u7EFpfXfDAFS48l8/1jow7A1oo2fdM0u
 Yg1F3Q6pMO6GSp8b/a5q+X6/v7ih+adqKLaWQ0adBuiLtKnRXYfbBoSwqP/Nfx0riesr
 TyXtLj1PZl/okQsFojpBNi+PdQh6AVzLln2guxLSmP2jGSk2/uBOKZQKt9tSVirfqsGy
 k1mdhovZzAEGDzU9XaX+qHpVKNul6SnwUdKK31dxOoNxYwBW3bB0yKXsrBRPA1F9vCP3
 CHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ozn85kLHHdYbnp7yoE6ellLtbD6HtMj9acchm0i6WTA=;
 b=PsjNl/ERv/bBBZqfNZzTNKmhQ/o6zPLQVAXCJvBR/SSsTsjyFusDX4B96j2IvSlIdT
 gVUuq4VVZiTh6Z0b512r1ReFZaZCZNT67kvnbuXe+o3mY9ucZxWC5+9WJ0+5s7WLhkrx
 Z4TEUR46KykkDCe/HJvZ+pQi7oxxpklGjwpXJUaJnmGcHXFKS74yLclOT5Z4YSdrQgxs
 tNQfgIWzWZG2OKR0/38ZKPRRYLcrYTOraCiAUOuetrSWtg6ssSX1c8LSj/q6zYymNZvl
 MCqRwkhUq0+CifBGK8PSBaNdlSLrK1Czkm0jVEscHxLTbcfyszajRWo+ooRNu2zO8zCT
 yueQ==
X-Gm-Message-State: APjAAAXh6E0/6luFAw8oAnkWqmnVEArrFDy52A+QSlyYI78oZlWX78l8
 p5olS6Ik9IUWSIIps8NHD/MtTC2bow9V7DoAhwufoA==
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr56622087otn.135.1564495203082; 
 Tue, 30 Jul 2019 07:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-2-damien.hedde@greensocs.com>
 <20190730154209.2049f10a.cohuck@redhat.com>
 <CAFEAcA-rwBiXkDEDuT-=KQVJ2A2ob16=P0obbZBPUfZeYXy+dQ@mail.gmail.com>
 <20190730155547.7b201f5e.cohuck@redhat.com>
In-Reply-To: <20190730155547.7b201f5e.cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jul 2019 14:59:52 +0100
Message-ID: <CAFEAcA_BU3DECLVv2QD_RshR0OL3=GqGwsm0YAmEAE6_SpW=HA@mail.gmail.com>
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v3 01/33] Create Resettable QOM interface
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
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YJ/CQ/zfgDHN

On Tue, 30 Jul 2019 at 14:56, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Tue, 30 Jul 2019 14:44:21 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Tue, 30 Jul 2019 at 14:42, Cornelia Huck <cohuck@redhat.com> wrote:
> > > I'm having a hard time figuring out what a 'cold' or a 'warm' reset is
> > > supposed to be... can you add a definition/guideline somewhere?
> >
> > Generally "cold" reset is "power on" and "warm" is "we were already
> > powered-on, but somebody flipped a reset line somewhere".
>
> Ok, that makes sense... my main concern is to distinguish that in a
> generic way, as it is a generic interface. What about adding something
> like:
>
> "A 'cold' reset means that the object to be reset is initially reset; a 'warm'
> reset means that the object to be reset has already been initialized."
>
> Or is that again too generic?

I think it doesn't quite capture the idea -- an object can have already
been reset and then get a 'cold' reset: this is like having a powered-on
machine and then power-cycling it.

The 'warm' reset is the vaguer one, because the specific behaviour
is somewhat device-dependent (many devices might not have any
difference from 'cold' reset, for those that do the exact detail
of what doesn't get reset on warm-reset will vary). But every
device should have some kind of "as if you power-cycled it" (or
for QEMU, "go back to the same state as if you just started QEMU on the
command line"). Our current "reset" method is really cold-reset.

thanks
-- PMM
