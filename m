Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2075983wrm;
        Sat, 5 Oct 2019 14:46:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzNIZbWCDeJkkZuNeGcbFKKjyUwN42MMI29nD1DvnAiTVhBl4qUhG1EqWWrttbPzDRnn0em
X-Received: by 2002:a17:906:168f:: with SMTP id s15mr17943444ejd.109.1570311994501;
        Sat, 05 Oct 2019 14:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570311994; cv=none;
        d=google.com; s=arc-20160816;
        b=sx/5UNEqVgyNZA5zwp4hbDqZ8nH4E+O7jCzAtfPDZ3AuHm/NoRqFuSZgVaFXFaC7XN
         YRFFCRQxLeRoSoLjszj1jEsdkhz5DtLVIDz3QGr8Ab6MZgmyq/oM0cu+l7f3TBoknKWo
         rgNGlxKZmVFJsw78wYGz6nujgmGjXH/Nmj7p9WJx1QeKOvb4x0FzCwPWODBJtipgtvk5
         tXcwtHolIJ1wu8WmPNWtjdK/kyrSrZzvm/EvV6nXOdWugdPpciMQT9Pwh+S2XrLtLVzM
         AwEdgoeTM3oO1Qu1ix6MBNaTwoyVzDkSc/Bx5FKNkO0yw7Ppr8EFGlWjrIdNFteskclP
         R4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date;
        bh=NFtYf8/TEiC6pN8ADvVxTGko/Oylst0Kh/aA2YurcWc=;
        b=k6V2jUR1alVbvLfVuqNIL1FWFvlpz+mwTLsMnJMtWcS3LkLLufbsW22q9mvQo212b9
         3Tt7ciqx5/1MQ7NcSLqmv0I91Ri7HvXquZmDSo5jUIxMRTHpvzNu+zLw9QwhNvgDfHmR
         DbAQE4nTPMdP5TFCEdH3AJUnqOfWZwBmPLtkeTADSveSJiggAdLQpfvevPTxVGQ/VX6j
         y6lZ1esCRKJekoA7YpOCjZgCJjoaW6KmDcs62vUakUFlhZNRMYxvquFXh7dub0ScrbKA
         e2LRHRnErLXqeYPVTxVX2fbA5ShW0DRmFt/0rPhDkH50wUAQvP1JDO5fUbNcVQiWjxXP
         Oj8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si5809160edv.304.2019.10.05.14.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Oct 2019 14:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGrsn-0008N4-3b
	for alex.bennee@linaro.org; Sat, 05 Oct 2019 17:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iGrsU-0008LY-JY
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 17:46:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iGrsT-0000Mn-0O
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 17:46:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47906)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iGrsS-0000Lh-Li
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 17:46:12 -0400
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B5264C057EC6
 for <qemu-arm@nongnu.org>; Sat,  5 Oct 2019 21:46:10 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id s14so10622220qkg.12
 for <qemu-arm@nongnu.org>; Sat, 05 Oct 2019 14:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=w9cp5WOMnA8f6hUE+AzPrHfl7EdcqEtT+8UzwMy/tUA=;
 b=oE7ACBxYHaLzYTa6NOhSkk1gPxyf+5VoMGnMJQx0UdDNvJpAlWhqkf6SxDGK/6ZgIP
 TuNn+wxpSxJ3/Kn6K2Y4U5aPA6IEqu5VoNosnjr1AQALt1qAOd5XGQ8IL+dMQn5bYVDx
 WfNfRRNZkk1RNLlGWU2zSu5prFah6k5ZStJ7pTVw5Zs6v+qHK28NB3d0qCyOAS9pestf
 IRHL5GPTK4gh0xP3z6O1ZMXAmT9Az+yKBtyuD6EdLVh7c1SEHPPIJOJGHmnU7uSUjsAC
 9CgkCCRYJrhk3mYYlnA0Dni2esTFMRBbpvvRSLhF5gnsQkgry9v5ZO6ikAuG5iY0umjs
 iV+g==
X-Gm-Message-State: APjAAAVljw56Y3irseunPQJFtm8txglHrgKoL7c6EsXh4EnoTopO9hsv
 9YNj0WHsFdI5gl95wOLTLLSjzwNHwQU0LZLPwgsC8O+tM+8yMLK8h2NdTfvUOE/T17KvU6MXWjk
 MopsKN7B5uVAD
X-Received: by 2002:ad4:5572:: with SMTP id w18mr20866502qvy.220.1570311969970; 
 Sat, 05 Oct 2019 14:46:09 -0700 (PDT)
X-Received: by 2002:ad4:5572:: with SMTP id w18mr20866481qvy.220.1570311969747; 
 Sat, 05 Oct 2019 14:46:09 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 i30sm7337786qte.27.2019.10.05.14.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 14:46:09 -0700 (PDT)
Date: Sat, 5 Oct 2019 17:46:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 00/11] hw: Convert various reset() handler to DeviceReset
Message-ID: <20191005174531-mutt-send-email-mst@kernel.org>
References: <20190926151733.25349-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190926151733.25349-1-philmd@redhat.com>
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TIQ1eT3g4N98

On Thu, Sep 26, 2019 at 05:17:22PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi.
>=20
> Following the thread discussion between Peter/Markus/Damien about
> reset handlers:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.html
> I started to remove qemu_register_reset() calls from few qdevified
> devices (the trivial ones).
>=20
> Regards,
>=20
> Phil.

How do you want these patches merged? Trivial tree?

> Philippe Mathieu-Daud=E9 (11):
>   hw/acpi/piix4: Convert reset handler to DeviceReset
>   hw/ide/piix: Convert reset handler to DeviceReset
>   hw/isa/piix4: Convert reset handler to DeviceReset
>   hw/pci-host/piix: Convert reset handler to DeviceReset
>   hw/ide/sii3112: Convert reset handler to DeviceReset
>   hw/ide/via82c: Convert reset handler to DeviceReset
>   hw/isa/vt82c686: Convert reset handler to DeviceReset
>   hw/input/lm832x: Convert reset handler to DeviceReset
>   hw/pci-host/bonito: Convert reset handler to DeviceReset
>   hw/timer/etraxfs: Convert reset handler to DeviceReset
>   hw/misc/vmcoreinfo: Convert reset handler to DeviceReset
>=20
>  hw/acpi/piix4.c          |  7 +++----
>  hw/ide/piix.c            |  8 +++-----
>  hw/ide/sii3112.c         |  7 +++----
>  hw/ide/via.c             | 10 ++++------
>  hw/input/lm832x.c        | 12 +++++-------
>  hw/isa/piix4.c           |  7 +++----
>  hw/isa/vt82c686.c        | 11 ++++-------
>  hw/misc/vmcoreinfo.c     |  5 ++---
>  hw/pci-host/bonito.c     |  8 +++-----
>  hw/pci-host/piix.c       |  8 +++-----
>  hw/timer/etraxfs_timer.c |  7 +++----
>  11 files changed, 36 insertions(+), 54 deletions(-)
>=20
> --=20
> 2.20.1
