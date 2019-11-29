Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp9426680lfc;
        Fri, 29 Nov 2019 11:19:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxbkf/YSqo16ZEwP82rtc4IErV47yiecFOfNcYHPQQv/sjPgPQq5KIlpD02gswYhPxhTTGo
X-Received: by 2002:ac8:610a:: with SMTP id a10mr43670587qtm.50.1575055171036;
        Fri, 29 Nov 2019 11:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575055171; cv=none;
        d=google.com; s=arc-20160816;
        b=hkV2HCM7gQpoZED3PoC6EmIhzYGOd3jOvAyA8RhtCpTpjDVwswuxiJ9KlnDCStszTn
         ZDyMN7bPy+LqGFyzBu/ROSYCfz8+I3P9t5yXhv06Oqirg5Ni++3T/+3b/29dM0iz3VFN
         3VG5wV4crwJ7VdPi8NUBgVHHvX6QRrSZTkVeTDdFmwrCnZZZ+89SQT4C0a1RQ88Jme37
         NEy+SAY0h5UcpOhaGY13eRhunvFv9lrrTMngdkVPBzRm7tqLnNwfEa/8tiF6cb/M/8kB
         AkJnBa0nyCMOGMLqDvIug9Q7vnK7RGr0dsFpTQaC2TsIii1sK8omnBHmfeSpsLewxX6N
         3UEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+FtFsuQtq3eVlLtLusxL2dw9FGxIT8kWy5OnLveth6I=;
        b=DYkAeotFV6gPte0dgGqqpCng1tyVt+PrN4Wc+ZKuCaS5xr9jJzabc49PM/zuXqCsm5
         VTAHyY0z+BwIbPP0rwcj8cOREj/Ycvrom2du9iBv74tcrvWhP9+2r1+4UZzybcfX0r3A
         KKo7/kLWo4PDlYA0VGS6HXmT5F9Ybtoz+lawNG8QIo0rMNLAlmCFi2VkC1/Leyu3VPfn
         TrapiZ5O/aOmt8ZL91PXFnWrd3s8Fd/38Lfvyd2LVEenMlfxMaLCh+//M8APxxwkMxmw
         AD4Lm5sQ4ps1y7pankwRgUgXqVkkc/Uvr4A67R1IpoaAm2H6uSXZzYb40XmeqSCDu2VQ
         Iauw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d2aGixWd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si7984998qvs.125.2019.11.29.11.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 11:19:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d2aGixWd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ialnc-0007Mc-FC
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 14:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ialbz-00014U-JP
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 14:07:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ialbs-0002VO-7L
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 14:07:22 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39515)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ialbs-00025B-2S
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 14:07:20 -0500
Received: by mail-ot1-x344.google.com with SMTP id 77so4412095oty.6
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2019 11:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+FtFsuQtq3eVlLtLusxL2dw9FGxIT8kWy5OnLveth6I=;
 b=d2aGixWd7g5bE3+AyqaOyriJ/3AMKr+cfuMkOT24yV/t3bg3VDL9KI9z/Jji5pD7CI
 FWZsy7kpuiVyQiCRCYyYsoNGppsjvQ+ZFswedEakglw6ma66mHdvSy5Rr5QRqy7f1oQW
 Ze6Xz7GdJvNa6eeC8jGbPj6PqUBMO5tAG/O9dyAtABsXvVEyVcA/H6VIVb+zIgoG+no7
 OHgFp5T92/j8q5k7hs58H0m6dF8crUHzbrfGj4rOTfjKUjYLRSg6Hnht4SgSJEe1VUY+
 YM1MAyQVJS08iY0/lLhL7ol5SUPck+qY1bZP2FS0ARFm7e7VhjBequn/PXU6jwewdsCi
 uw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+FtFsuQtq3eVlLtLusxL2dw9FGxIT8kWy5OnLveth6I=;
 b=Lp3ni5PJdxQgIpCKlV8+EkgtKOB39U+WDl24zb9tgbCGh20U0Y6cObQjdNwz1co4HF
 LBv/vL3ZRSMHlpjE75oiiWcPc53j3twEgMI/PZWJugb/y0H3f4ozY/Dycpvk27iMDsdY
 LS0eTp2fZbs5+JEz0uvleO6wXvUg1X9szkVy/UUy/JcGSyil7bogOU1efeNXJsMkAqHC
 3/laRdHil35yeBaV+ThvxLnY1hkTHzT91hYc84fFWzmKqTskszpgCWZ50x2i95hQXWnc
 R2afaj6Y/L7lAbrXMOXFOX7Ih3DCmNcjB2J7Wa1o4JxHjoL0N4lMl5WWEy6JFrTLeecp
 cjKA==
X-Gm-Message-State: APjAAAW/ulbG0VNsqbGE4forAiJBTJ9m1/Kna6qP1MX+7PBUJiP6P8pT
 smFqOiqb3u0YL4bpgPx0gs332TUDgl7DnGuOZGzt8g==
X-Received: by 2002:a9d:6357:: with SMTP id y23mr12375124otk.91.1575054432823; 
 Fri, 29 Nov 2019 11:07:12 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
In-Reply-To: <20191018150630.31099-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Nov 2019 19:07:02 +0000
Message-ID: <CAFEAcA8yMWyXyP08HWWkAo72KUQgN4JwbaSHA-Y8msiCLLrvzQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] Multi-phase reset mechanism
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Edgar Iglesias <edgari@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j7BR3T/NDJXi

On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Hi all,
>
> The purpose of this series is to split the current reset procedure
> into multiple phases. This will help to solve some ordering
> difficulties we have during reset. Previous version can be found here:
> https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg04359.html
>
> This series adds resettable interface and transitions base Device and
> Bus classes (sysbus subclasses are ok too). It provides new reset
> functions but does not switch anymore the old functions
> (device_reset() and qdev/qbus_reset_all()) to resettable interface.
> These functions keep the exact same behavior as before.
>
> The series also transition the main reset handlers registration which
> has no impact until devices and buses are transitioned.
>
> I think this version is way better regarding the transition from the
> legacy to the resettable interface than the previous one.
> After this series, the plan is then to transition devices, buses and
> legacy reset call sites. Devices and buses have to be transitioned
> from mother class to daughter classes order but until the final
> (daughter) class is transitioned, old monolitic reset behavior will
> be kept for this class.

Hi; I finally got back to reviewing this patchset, and I've
left comments on various patches (minor stuff only). I didn't
bother to comment on a few patches that I was happy with and
somebody else had already reviewed.

thanks
-- PMM
