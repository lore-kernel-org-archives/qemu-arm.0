Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp719179wru;
        Wed, 25 Jul 2018 06:46:03 -0700 (PDT)
X-Received: by 2002:a6b:8b84:: with SMTP id n126-v6mr16585832iod.124.1532526363018;
        Wed, 25 Jul 2018 06:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532526363; cv=none;
        d=google.com; s=arc-20160816;
        b=cZr6ZvdeiIckSdd/GGksBChYTBqYvynyTy0v3p09dnGd3iuFqqlD1TRwISkW4qG1LE
         Hq5ifZSLNeP7eQ+O2leMVzY8YfP4X27LYllzF5583o3goDH5gNLrJetevRHdT5btidrN
         pAtJLW6CHgQzL98rQiYWfY7pBfkG1f73DmxdsivhN2163iNsm7VPg5FGkSd4pLKGyiFs
         qKO/DxE/TFRd/mp6lIakn+FSx+P14gr4NfGfDeg/+Bdc0qRkUK5cC/Ar/7E8ZEboxmCn
         ds1jSCbcFrh8ow9QlFGLeaBn+/SZ9mKbBZ9rzq20X+SrNNogADyNcDD2/TFHm6sMIX1q
         ssUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=LLLZZm0aF5jPiKN4/P7bq0fKAVmllAgFvjDDxe7MQ5Q=;
        b=I2Tuh2uxBeS2/tSuRpH/J6scsJkJqbFtweIQM9hRfye9nHo4TwaZB507G/OBGx5qEq
         9IDTqE8XcBz0OhTrRaLAgVVDcVMCwFXxsn46MSEI5yscDpWv5lgF8I1ng7GkT9fpvaQ5
         PzE/AQt05pdQI81j7vy9x3b69ydAsZl7YMR+y0bkPpcuZ/whp9MM7eERQxDeaM3+ULXu
         bO0EHaA0gmYY1dBvhuszlhoVnjRoYpxOQSq57VGzzy1c5dYZqIkXxyUq4B5SnzI59Flj
         w9nRycgNn0OTIJmp7MdL+E+qr5qnu4mamaD37xj0d17b0TwT6JBEnxl54Vdag2q9rsIT
         qxfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=apFbil7S;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g8-v6sor1683930itg.17.2018.07.25.06.46.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 06:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=apFbil7S;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LLLZZm0aF5jPiKN4/P7bq0fKAVmllAgFvjDDxe7MQ5Q=;
        b=apFbil7SKZzroQcH2uOt49QPQCfaRzcTzuzWTDPzdo/ml3cVMZIAL1cMU3CQ0hqx70
         9S0XrNUwUxqTJmN4jAozPMuZYLyCGkd+U6M7NuzNh2AU42LQSTKYpiv2spfuVd0PoNeu
         Loc59PZxDgImmQkxl61Vd2CUdax6MZMnssVL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LLLZZm0aF5jPiKN4/P7bq0fKAVmllAgFvjDDxe7MQ5Q=;
        b=aPtx/xtedamofbbQYluHwdNEXtoKOZ81ZxQ3JEhZUjJSoo0SAd1tXz0Sdq1Uszth1Z
         tOsgBYzhUqIRaIHwGHYqGEutWPm1S4dd+r7yRsE/taWXnj2pMmtLm1LEp0DzbeGPqx3B
         BdQhRk8J2WCh4RA68b9MmFLe7BKl/zhrGkrhPG1jDdE6l1cr+NBpD5brMDANKGElz2Vi
         03W+BLQbF2RzNgxEpUzykuTCF0kA1xGNuaKK/r6S5hnBb7Kot1M8B7m0uDKfmvOjU0rb
         d0uDoDyLGiEIDjfXinQuz7avumsRKvUR3iFG26fwLursZAO0gw0E3F1u4WtUlXyBunqc
         H7fA==
X-Gm-Message-State: AOUpUlGvZc0XlxxYLONNoul0XYdmpLV6xoKYs3NHU5Ric+as3XuxmFjw
	dp6rFPJLvM6og13sS4VIWtVS7EIwWqgXOGxSLIIVsKdy
X-Google-Smtp-Source: AAOMgpdyNfeM1mdMdAW8zw9K9DEyMFBjo58zPd1uvl8DjuQE5gTGV5zdE1nMu//sEVlF+hoBAAkz+prO6/3WS9C9jZU=
X-Received: by 2002:a24:d7c5:: with SMTP id y188-v6mr6286883itg.50.1532526362342;
 Wed, 25 Jul 2018 06:46:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 06:46:01
 -0700 (PDT)
In-Reply-To: <20180725133810.gsgfu4x6emygu5o5@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com> <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
 <20180725124700.GF12855@redhat.com> <20180725125944.5nd5ydm4x4e3vvjw@kamzik.brq.redhat.com>
 <CAKv+Gu-pbJj59wH7wgZ6Uq+Uko9wYEBqSF=WaC3LL68CFkbxEw@mail.gmail.com> <20180725133810.gsgfu4x6emygu5o5@kamzik.brq.redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 25 Jul 2018 15:46:01 +0200
Message-ID: <CAKv+Gu_91nXP4TSvrLf0e8kfX5X3ZNPcmx5UzT1jf5A_rVj8pQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: U9fi+gTPwkzW

On 25 July 2018 at 15:38, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Jul 25, 2018 at 03:03:40PM +0200, Ard Biesheuvel wrote:
>> On 25 July 2018 at 14:59, Andrew Jones <drjones@redhat.com> wrote:
>> > On Wed, Jul 25, 2018 at 01:47:00PM +0100, Daniel P. Berrang=C3=A9 wrot=
e:
>> >> Would iut make any sense to call the machine  "refplatform"  or "refb=
oard"
>> >> to indicate it is a generic reference platform, not specifically foll=
owing
>> >> any particular real impl, albeit influence by the sbsa spec.
>> >>
>> >
>> > That would indeed stop me from whining about a machine model with an
>> > 'sbsa' name not strictly implementing a minimal SBSA machine :-)
>> >
>>
>> I still don't get why only a minimal machine is worth considering,
>> given that a real-world minimal SBSA machine is not capable of doing
>> anything useful.
>
> One definition of an SBSA machine can be quite different than another.
> If we only hard code the required [useless] base, but also provide a
> readconfig for the rest, then we get a useful machine without loss of
> flexibility.
>
> That flexibility comes at the cost of platform-bus code (since we need
> to add devices to the system bus) and a less concise command line. The
> platform-bus code may indeed be too expensive for this purpose, but
> we may need to see patches to be sure. I understand the desire to have
> a shorter command line, but this is QEMU :)
>

My concern is not the QEMU side. It is the code that we will need to
add to UEFI and ARM-TF to deal with the dynamic nature of the
underlying platform. That code has no counterpart in real world
hardware, but will surely turn up in production firmware nonetheless
if we end up having to add that to our SBSA reference codebase.

Of course, we can keep QEMU dynamic, and hardcode the firmware bits
against a certain instantiation of the SBSA machine. Bonus points for
making that command line part of the firmware payload :-)
