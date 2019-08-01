Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6692995wrv;
        Thu, 1 Aug 2019 02:30:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtUQcboQcEr3aWLojV+tdtrfyAOFvfFEhqrEhiWY9vhq/qD36SPsJg2RnOdadgAQdl4aFe
X-Received: by 2002:a17:906:158c:: with SMTP id k12mr100196471ejd.83.1564651854887;
        Thu, 01 Aug 2019 02:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564651854; cv=none;
        d=google.com; s=arc-20160816;
        b=OHTpFkPX6qb4U2LlBM4Y94/zfpmX2d8fpXSMXLU8vEZctSkM9qW1e/zXacmXjELFzi
         6q7BRsKmI6yc8zT+1H6odKay+Xy0Ggny6pWrU3PPhX6bioEw++DN++CcDEH3P1qMUpj9
         73m/QQZmNkYglKQa/O5A2EzHLqZ0EfgTmBBAD2Gt2ZrFM+/qTGDrNFD416EFSZ4GV8k/
         2KaWYxGX+aSjGhAm4HbEdnWzU1GtC3px/U3bJ0LtWufZyKYHbIjYWGxkuFNGbM86uq0Q
         pBg6GQdvTU+6MLJCDXu4QdxfdZ2DqQytgMzU90AAL2lEhrVYtNXeAf6Bdu4Tvj4FfK49
         SXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:references
         :message-id:content-transfer-encoding:date:in-reply-to:from
         :mime-version;
        bh=rSBf+hMp7mNZH0X3uZW/tGO01XaR2AGWxL6Qb+qfGB4=;
        b=EaHwggLIg7qCxKqDAkwWTD4Zt4Vs0U5rA449x1G3ikRgmPkVKr6E6BkTL9he1BJFvz
         6ilwxh1swU1RXRX/NV3cSnk4OoWqcAfTiHmxDl0wbPkOEGA+aUlXg6uxNmE+HbPGnbDO
         v/LpdevHmBj1FYXfZRLxHoEWrQqIN+kp5WOzfw6J0zyk80knsuJ8mdAbJYKBQGpaPabG
         JEMkN1FP3HYmVzqJ1TzcUp0CbN4++WZV+XnmiskwHJESy/F+rkV3Ma158Qfq50oAQcvp
         xgWUvAhPaHGGtfa3H/Mfu37+CpyMjVvmRkH2KnyuBZ4Vn6blyLA4LIFTAAFj6eFgY23C
         geGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si20785630eju.202.2019.08.01.02.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Aug 2019 02:30:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ht7QD-0007ht-Mb
	for alex.bennee@linaro.org; Thu, 01 Aug 2019 05:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37964)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dinechin@redhat.com>) id 1ht7Pr-0007R1-G5
 for qemu-arm@nongnu.org; Thu, 01 Aug 2019 05:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dinechin@redhat.com>) id 1ht7Pq-0004nJ-10
 for qemu-arm@nongnu.org; Thu, 01 Aug 2019 05:30:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39458)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dinechin@redhat.com>) id 1ht7Pp-0004lN-NZ
 for qemu-arm@nongnu.org; Thu, 01 Aug 2019 05:30:29 -0400
Received: by mail-wm1-f67.google.com with SMTP id u25so52172212wmc.4
 for <qemu-arm@nongnu.org>; Thu, 01 Aug 2019 02:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rSBf+hMp7mNZH0X3uZW/tGO01XaR2AGWxL6Qb+qfGB4=;
 b=SKG5wEZDVmBquHBseNosbDrrL8Vd7thSJOBA86dCoEWUKm+9cIwCSNdeRhTpsmELCe
 J39lwr0dfQShHd4dRNNviYRzmdfKUzdNB+5uDkD2xZEjnLFRalUoX6lNt1FnSMuupR7j
 8ILManxEkLNCbeZ3jvph8A/nqD36AX8wVK5ND3aBl9q+FATARs25nSUS7fn12inmNV05
 YYWpkevPZ8Gl4ROt0Y1XjbTtB9dRCiBPNa7qs2O+5wpE9b6DPi5kVoCk/n3IMRtTuOc5
 aWNXlLkSuePMF+1PlYFP7i2D1CJ5bO3LUCzMYvKnz7XXUnzR78y43JlrjnxnupG824wc
 Q4+A==
X-Gm-Message-State: APjAAAW3T5UXFuEk++7Ukgojn8Rqb/tzVe8raDB11M5l6QOQhzL8i79o
 Qn2bBFtIEX5jcLkQQwMg1qb7SA==
X-Received: by 2002:a7b:cae2:: with SMTP id t2mr35084915wml.157.1564651827890; 
 Thu, 01 Aug 2019 02:30:27 -0700 (PDT)
Received: from ?IPv6:2a01:e35:8b6a:1220:15bb:5ab9:f15b:4915?
 ([2a01:e35:8b6a:1220:15bb:5ab9:f15b:4915])
 by smtp.gmail.com with ESMTPSA id o7sm40949827wru.58.2019.08.01.02.30.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 02:30:26 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Christophe de Dinechin <dinechin@redhat.com>
In-Reply-To: <e42eac74-b5f7-badd-f5e6-4423c8608a85@greensocs.com>
Date: Thu, 1 Aug 2019 11:30:24 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <27CBAC99-48ED-48A3-AAFD-97BE9966C00F@redhat.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-2-damien.hedde@greensocs.com>
 <20190730154209.2049f10a.cohuck@redhat.com>
 <CAFEAcA-rwBiXkDEDuT-=KQVJ2A2ob16=P0obbZBPUfZeYXy+dQ@mail.gmail.com>
 <20190730155547.7b201f5e.cohuck@redhat.com>
 <CAFEAcA_BU3DECLVv2QD_RshR0OL3=GqGwsm0YAmEAE6_SpW=HA@mail.gmail.com>
 <m1y30emrsh.fsf@redhat.com>
 <e42eac74-b5f7-badd-f5e6-4423c8608a85@greensocs.com>
To: Damien Hedde <damien.hedde@greensocs.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 01/33] Create Resettable QOM
 interface
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Hannes Reinecke <hare@suse.com>, Qemu-block <qemu-block@nongnu.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IjdlQ86zzUwv



> On 1 Aug 2019, at 11:19, Damien Hedde <damien.hedde@greensocs.com> =
wrote:
>=20
>=20
> On 7/31/19 12:17 PM, Christophe de Dinechin wrote:
>>=20
>> Peter Maydell writes:
>>=20
>>> On Tue, 30 Jul 2019 at 14:56, Cornelia Huck <cohuck@redhat.com> =
wrote:
>>>>=20
>>>> On Tue, 30 Jul 2019 14:44:21 +0100
>>>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>=20
>>>>> On Tue, 30 Jul 2019 at 14:42, Cornelia Huck <cohuck@redhat.com> =
wrote:
>>>>>> I'm having a hard time figuring out what a 'cold' or a 'warm' =
reset is
>>>>>> supposed to be... can you add a definition/guideline somewhere?
>>>>>=20
>>>>> Generally "cold" reset is "power on" and "warm" is "we were =
already
>>>>> powered-on, but somebody flipped a reset line somewhere".
>>>>=20
>>>> Ok, that makes sense... my main concern is to distinguish that in a
>>>> generic way, as it is a generic interface. What about adding =
something
>>>> like:
>>>>=20
>>>> "A 'cold' reset means that the object to be reset is initially =
reset; a 'warm'
>>>> reset means that the object to be reset has already been =
initialized."
>>>>=20
>>>> Or is that again too generic?
>>>=20
>>> I think it doesn't quite capture the idea -- an object can have =
already
>>> been reset and then get a 'cold' reset: this is like having a =
powered-on
>>> machine and then power-cycling it.
>>>=20
>>> The 'warm' reset is the vaguer one, because the specific behaviour
>>> is somewhat device-dependent (many devices might not have any
>>> difference from 'cold' reset, for those that do the exact detail
>>> of what doesn't get reset on warm-reset will vary). But every
>>> device should have some kind of "as if you power-cycled it" (or
>>> for QEMU, "go back to the same state as if you just started QEMU on =
the
>>> command line"). Our current "reset" method is really cold-reset.
>>=20
>> Is there any concept of locality associated with warm reset?
>> For example, you'd expect a cold reset to happen on the whole system,
>> but I guess a warm reset could be restricted to a single bus.
>>=20
>> The documentation should give examples of how warm reset could be
>> triggered, and what it could do differently from cold reset.
>>=20
>=20
> Not sure we really have some locality difference between cold/warm
> resets. I think, most generally, locality of reset is on a per-device
> scale with different grouping level (up to the whole system). But =
buses
> are not always the way things are grouped.
>=20
> Inside a soc (and microcontrollers in general) it follows more the =
clock
> tree than the internal bus tree. For example on the the machine I =
worked
> here (xilinx-zynq-a9) and, you can control by software the reset of
> basically every single device and the bus too (but resetting the bus
> does not reset devices on it).
>=20
> On the other hand, there is some buses, like pci, which explicitly
> defines some bus reset mechanism with differences between cold and =
warm
> (some registers keep their values). (see
> https://wiki.qemu.org/Features/ResetAPI)
>=20
> Regarding cold reset, if a soc supports some power gating, you'll
> probably have non-global cold reset in the process.
>=20
> Do you mean "real world" example ?

I think that a variant of what you just wrote would be fine.
I was not aware for example that you could have non-global cold reset.


Thanks
Christophe


