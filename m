Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp953129wrv;
        Tue, 16 Jul 2019 06:07:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwcpUTFCXlwiY3jv18Q1iK03kOK14g+KuIDbzNhw2QIatYks/F7bBFHRemIkrmRQnIsD021
X-Received: by 2002:a17:906:7f01:: with SMTP id d1mr24611001ejr.310.1563282434882;
        Tue, 16 Jul 2019 06:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563282434; cv=none;
        d=google.com; s=arc-20160816;
        b=AjyKqOmPuEfaxGAOdsBtbDS98v/q6yrEieat8Dplb9EdgP/I6uB+8xUpNKqtQbiVxG
         EvRoKW1UoZze6uSdw3N+nhelJ6/LROdcfjPtIs/hBSGouyQ8+0t/2wXP2Oi4s+K2QVQc
         RUyvicLlyxq7JJmQv/WO6MxnUiPVWuiUBoSXenXmALKxXiYaqk9rGJULNJOTxXOJbofe
         xYRlSEkywS0VlYNdB76TvktV9FZnNrU6F1GbSlJ61spBY0LjBNQLQZVbI38aXlaNYmet
         u/LC/5OCKOApXQfmFOxTEYfhMytsJj5TWNl3I9ObNapzoJilW7yrNajm2PY7QL0xrL0c
         pt3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=6rfG2UuNmKZmAhOqD05ntLl8RXF1rOCdk/LW1zlA1fg=;
        b=kib9Jni2E1J6J59tj2ruePV3BVPwSpf3Gr16LhbIhk2qtn0c1Vdv6oc5q1gWrHyQSh
         OC/UI/iz/RqHxuGtFov+StlXc1R9MoR5d2Z9SZ9/8OQW7mcIJYKCl/HHRre6sc+prAfJ
         HaTmICalP/9pfKfPLPhK/t101hVJdg3L8EDcMxki0mWcssjRCsJAQUfpNx2UvWPO3nFB
         Uj0Vbr5wBi86u0JacJmY7LrYWjH8fAzQ0Q86OniXl6wl4Wf82JdfBC9HNwQC1kj+2rsz
         q4jqrnkkGwBfENzlxvBlxP5G5xUE/3Q7U6PXuVA3X/oSFtqBspoWaJbadMzh43fvbUo2
         Vd/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pk3si10431617ejb.88.2019.07.16.06.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 06:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnNAo-0002c0-0Y
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 09:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44266)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hnNAk-0002bg-Lv
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 09:07:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hnNAj-000113-QO
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 09:07:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45046)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hnNAj-00010Z-Kf; Tue, 16 Jul 2019 09:07:09 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6E90B83F3B;
 Tue, 16 Jul 2019 13:07:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 328F419C59;
 Tue, 16 Jul 2019 13:06:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7EA9C11386A0; Tue, 16 Jul 2019 15:06:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
 <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
 <20190715130955.4a117388.cohuck@redhat.com>
 <13fce62f-234c-1b13-595f-5910c066bc4f@redhat.com>
 <6c39a198-e951-c0bd-1ddc-5d227afe72ff@redhat.com>
 <87a7dfth4i.fsf@dusky.pond.sub.org>
 <20190715181206.3cb1db93.cohuck@redhat.com>
 <799aa0f5-8850-5caa-5103-e1cf3cdb018f@redhat.com>
Date: Tue, 16 Jul 2019 15:06:58 +0200
In-Reply-To: <799aa0f5-8850-5caa-5103-e1cf3cdb018f@redhat.com> (Paolo
 Bonzini's message of "Mon, 15 Jul 2019 20:22:41 +0200")
Message-ID: <87h87m2knh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 16 Jul 2019 13:07:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [qemu-s390x] [RFC PATCH 1/3]
 hw/Kconfig: PCI bus implies PCI_DEVICES
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Collin Walling <walling@linux.ibm.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?utf-8?Q?Mathieu-?= =?utf-8?Q?Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7yzdef7vaSPe

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 15/07/19 18:12, Cornelia Huck wrote:
>>> Is it INTx vs. MSI vs. MSI-X?
>> 
>> I think for s390x we need (INTx || MSI) vs MSI-X...
>
> I think MSI vs MSI-X is just how it's configured, not the actual
> behavior, so it should be irrelevant.

My best guesses from confusing information, please correct
misunderstandings:

1. PCI devices need to support MSI or MSI-X to work with s390x.

2. We want a way to Kconfig the PCI devices that work, i.e. only the
   ones that support MSI or MSI-X.

I don't like calling devices without any MSI capability "classic" or
"conventional devices".  I'd rather call them "MSI-capable" or
"MSI/MSI-X devices".

Since PCI-E devices must implement MSI or MSI-X, we could perhaps
configure just the PCI-E devices for s390x.  No need to invent a new
name then.  Do we even have device models that can do MSI but not E?
