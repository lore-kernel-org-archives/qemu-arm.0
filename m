Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6727155wrv;
        Wed, 7 Aug 2019 09:03:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwSBYvup/kNbl6E98AckTDh+4UX5kAtV15+CrFm0qH/WewEaEnj0n/SRP30rYKNsGF8GdHy
X-Received: by 2002:a37:a343:: with SMTP id m64mr8843119qke.75.1565193800441;
        Wed, 07 Aug 2019 09:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565193800; cv=none;
        d=google.com; s=arc-20160816;
        b=IeeAIL7uCHnQyi6/sn8AYcygZqzWqp3BLfoLkpZHcDdwcnUVhKBESQqNT7979tq+q4
         jW90JoLWITSjW+RxNAJIxNUPOgcAzO2a7r7BTar4KdC2KZ1j49Mb8CkmbeKu2IRza61P
         pTPqUyLajh+Ou69AxtequkrPlW735wfmVBhMyWOiprlfK1qevyr82YeewzTiw7gEDicn
         bfc5uIToaqunM5tuehrdnQOL4CB72EEvlNKGG2T3xPsmyW99+ENO/kHBe0Cy4texPxf7
         gOOM0OKpfUe/+d6bckU9BmF1uJHxmT14Ujp8vjKV2mutebwCO/X+u/RWW59cYhMrMQK8
         jAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LJwEbtQLWhV3k7QvClVoCw2Rk5mrtwJdm8oQM5wyapw=;
        b=XdhitTDt+boMMkKzWdarIKuPK6eITYnNtpC0Eda/lcM+QbC52mrA3EtUNw9G8Ff+eU
         R4V7pJWV6VX5R7W0zMR0C2q+wP6UisJ1bf6Ps31vzwQB37TcuDV9jdJq0Nf0cbvpIOOB
         2Oy+dQYh0Kus47wOL8DF/I0nE59dK5SJmdgZL3P0qd9j8vUJkdd7N+oTvpV4Gug1GeHK
         XOdiypsygM0ki76qlXi0kzbaVUZhPOCfnqDgGdypeOj6dCxLJxD+13jAb2NAh1f+x4vf
         ZvHB9lj4sN6LMMQlRs9BMHl5K0W/cd0PRYSxdAcKYf75tOsRTX+UjGeTNy1PGoG4XGUE
         6ZXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jDu31RDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si54035216qvd.211.2019.08.07.09.03.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 09:03:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jDu31RDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvOPH-0002bS-Rt
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 12:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37320)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvOP9-0002V8-1e
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 12:03:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvOP8-0007YN-5b
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 12:03:10 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvOP7-0007XM-W1
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 12:03:10 -0400
Received: by mail-ot1-x343.google.com with SMTP id x21so13053437otq.12
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LJwEbtQLWhV3k7QvClVoCw2Rk5mrtwJdm8oQM5wyapw=;
 b=jDu31RDIwyBWlJFgB1Kbd66DFi990MrCIPBK9OpDtn2xkKX+ZFOXyoDI6wi3VbR7F4
 LCSbB1Od1qXf6vTr2bGKngOiiugI19qqckgIlBUtHgF6r2Nh+3OaiEFQm5l1TASUn7d6
 J6ynsHai2k0YgGaSm3sbYVIaPuMjhjVlMUQl4kWTo27ksTfYdtpo28ZMQin7u/5gN0Yx
 xDz9jXQWuYVoS2q+pt7wkhGwNVWCsPtQ1zQy4R/VD2Qr/BdRHGJK0qIr0ERu4k9cRhsZ
 Fc+MzsNnPEX/DpIcp8uXVWf6gHeJ/HX4Gbm/bkfHPAYsBJVAT9Yl9nJfRew1lSuhOykk
 xTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LJwEbtQLWhV3k7QvClVoCw2Rk5mrtwJdm8oQM5wyapw=;
 b=ZPSmokC+0TPPsT9IlK6702pJJmxxOoAYktlaMGQR2VNTL+29vsJlQE8FB0W5BjAYO6
 EU1kR4mEWdSjUvti96aG13fA4O4sUUo1JzU5zYB0d8RJb0noSO98bsr/EfiCJj3EH7s5
 Wy2U8dsCFd2x0VhMJppyB8eoKyApA/MjAL9lJsEmiKeDQKBwsTlr2Xe96hWNIgGDP7m3
 hcyurZfVTZFG+pilhWvzWbWsQj0tLozvbSFi1IWuBpbfEdc3NVlPmaWcm6n//vR4t7fU
 lhAV/CfBnvYBhOBAUsqaDCqPtIdYffgAVJaLznz6N2m5Q1DC/dyHuvXWBVUbB6RXGlCa
 rTjQ==
X-Gm-Message-State: APjAAAUuQKpO4ZV4F1kfwTNcZAmFWOzcVlMaCxPfEST7YV0YAlK7/Xgn
 6R1lc0lhDFfEGhrf3XmjkcfdIYfXQk6b+Hjr8FcNRQ==
X-Received: by 2002:aca:ac48:: with SMTP id v69mr461661oie.48.1565193789286;
 Wed, 07 Aug 2019 09:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-10-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-10-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 17:02:58 +0100
Message-ID: <CAFEAcA-fTJ117Pv-LgQSbJ90qXxqj8vM9pm9rJ4NVb1MHJ1AwA@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dC4R3tqS12sE

On Mon, 29 Jul 2019 at 15:59, Damien Hedde <damien.hedde@greensocs.com> wrote:

> +For Devices and Buses there is also the corresponding helpers:
> +void device_reset(Device *dev, bool cold)
> +void bus_reset(Device *dev, bool cold

Just noticed, but the prototype here is wrong: bus_reset() takes
a BusState*, not a Device*.

thanks
-- PMM
