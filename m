Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5824198wrv;
        Wed, 31 Jul 2019 08:59:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwUUAHQWG3MT1c5Qo4TkdNOebztEcDXUMlC0AhDiEHmLZfWMRRVH0baisWsS4tcPSKwd+/+
X-Received: by 2002:ab0:30e1:: with SMTP id d1mr12875127uam.112.1564588779615;
        Wed, 31 Jul 2019 08:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564588779; cv=none;
        d=google.com; s=arc-20160816;
        b=fwYhTVquTe0vXkHppTzGwgeuT26hKFT2Z4+dzkdiVLsCEBsp+t+wnbeRB4Cz2Gbyme
         QB8Nzd2Lf+bjum+swz5KK021C1NrMXykzBwz95T/GF168KucH1hWbwPsKDB4Se8TMKx5
         8jdeA341mJpTJ8X/idgF5Mdhd6SvJwMU4OesLDIEOQ0jcMzZJpAQXuzQKrRGPkpT2HTh
         ZgBbsbDg2JFPgHOo/40NuzFDCPzB/Nq+xvaEBgFiisyDzAmndXBgxBI6V0MhMSPfh/Bz
         Of4CICPzC+DmxSJrR/4HyF9uvR2mywfGBapzynlZtcJqWIlTk/OHuGEMTaa2S1xdtpTJ
         obdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=GEBZu5cSpffuEdvDGxVxgzmDlm4HDdGoJ5sXd7LyXd8=;
        b=hn+wtyRQJYz7bxUnXr65CFC4QwMKlW0uexIeXMtpEa7BbpbKEhjb0JQDRxG8ADeU2I
         ONZXw2/6QcZ3qJ2xIIIXXcl4cPMpU/BNGedhc+BwPQt60Wis5Nk9bhDv3gYGY/GyysVC
         Q+GX0ghKnbWuRydD0QMdKh3plysaUrbuhW3YqNUdSr3num6o6MxdPgsilDj45yGmMvBq
         DjPcl8XGUNyMkJ8TrFMZUahBj0l88XQ2G+7lMb8WWBjMhir1EK2h8S9DSmhzn8XL+ztD
         c38y2NbO0g/l+E4MJFkamZhvVlQdJOTL5KYd0KjdWFW6uEpSekPMzwjvn6VlUnSye/iK
         UE7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o125si13245828vsd.140.2019.07.31.08.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 08:59:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsr0t-0002ip-53
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 11:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38318)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pmathieu@redhat.com>) id 1hsr0W-0002ic-Tg
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:59:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1hsr0U-0005O8-Sb
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:59:16 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34385)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1hsr0U-0005Mz-8r
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:59:14 -0400
Received: by mail-wm1-f65.google.com with SMTP id w9so1607283wmd.1
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 08:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GEBZu5cSpffuEdvDGxVxgzmDlm4HDdGoJ5sXd7LyXd8=;
 b=Mp9/1Oi1bdEt10bgGVqkCtxfuubBDJIRItT5hHWDE0w1I29o31+PijpwuIR7Lj4WJF
 XiXFb4MQpJimAeqcmbUZw7xgGeULi8jBjg+3pL93AQuTH16MOhG4c9224MkQQ4Esih4S
 M3TUrB9/RaM6/55WH0BXRm5RFvOXbfLZI+Ag9LE4vMv7TXreWiDOQ/UCEqCpLNJcajkC
 YvY3b9LwZcDFk0M6puoT9u1ww1XlO+B/RSMKAjW4Xfo+ph5EqoGCGZLUq6PBIN/s2Ct+
 tXL2+7vqlde7lY4pVxiXjd+Qtewu4BduOQx8Z2On7nJzg3hWGwlnu6t5UXuktXN5lIPG
 qY3A==
X-Gm-Message-State: APjAAAVFs35uFFVfoShfhAbtvpqSXEDk3y8CykHb6+8cx1S4TIixfm2e
 jqK8t2EtCL4NQiMLPyNqw9MPmciSCN8SouH3N1t2hA==
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr38900246wmg.155.1564588752291; 
 Wed, 31 Jul 2019 08:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190731075652.17053-1-thuth@redhat.com>
 <20190731075652.17053-8-thuth@redhat.com>
 <f2399005-cead-a147-37a5-600fda7eaea5@redhat.com>
 <b9bbf556-e2fc-8634-2238-9c1c5ead7a35@redhat.com>
 <18d71b10-6be2-b76e-54d6-76c0395ca700@redhat.com>
In-Reply-To: <18d71b10-6be2-b76e-54d6-76c0395ca700@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Wed, 31 Jul 2019 17:59:01 +0200
Message-ID: <CAP+75-Vrr5JcNd1tFhossrNDNEaJV4U4a+iyyDH2rgE5P6tV9g@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Yang Zhong <yang.zhong@intel.com>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [PATCH v2 7/8] hw/misc: Add a config switch for the
 "unimplemented" device
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /wrehI+GvAv0

On Wed, Jul 31, 2019 at 5:55 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> On 7/31/19 1:50 PM, Thomas Huth wrote:
> > On 31/07/2019 13.47, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 7/31/19 9:56 AM, Thomas Huth wrote:
> >>> The device is only used by some few boards. Let's use a proper Kconfi=
g
> >>> switch so that we only compile this code if we really need it.
> >>
> >> I'd prefer having the UnimpDevice user-creatable and always present as=
 a
> >> core device...
> >
> > Why? This is a sysbus device that needs to be wired up in code, so I
> > don't see a reason for making this user-creatable right now.
>
> Right now no.
>
> > Anyway, that's a different subject, so this should not be part of this
> > patch.
>
> Fair enough.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Err, you missed MUSCA and MPS2.
