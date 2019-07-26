Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11676546wrv;
        Fri, 26 Jul 2019 02:33:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycaV1OUl2+bXb2JphjJdlkdoCAsIkZYTLOepKXANUisLlbzxfP6QycS4DCSg2g/2rTB7nb
X-Received: by 2002:a50:ac46:: with SMTP id w6mr84734467edc.238.1564133628490;
        Fri, 26 Jul 2019 02:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564133628; cv=none;
        d=google.com; s=arc-20160816;
        b=Td7MPlScXMLsKGCEQe5Qn/Nl+JFDN/9Ltr3u/rtcOj+JpBj3qlRa2t8Zn0wPeaQbDI
         okiXXEmUSaYYZvy0HJuMu2pUdy/sPq7VVKDOz6yHtWKVAbQcsNf4W0eneU0tixItyCjZ
         m1lVF8/EALUGzHKbghhzxfQCLSmEDKFjlLBLZklV2TVp7IJB610CK2Yu6ujQ33Ax8om6
         +xmo67VD9Vl60qWkX8e2EPRT/Txj/qlZR1SUOHkAU1NvtAxGBCja56N3rjHrv26Qlc/p
         5nXblYcuig9F6iSO0MCvO5MqEf20wnoIWW2FcwPFmG6SXseI7/VaYtUfkiW70spPJMue
         HU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5t9MzNaRZyb7fs71dgONIWnz3ayGI84GPEpcmxOheT4=;
        b=008hZT6fZWxCG/Nwspr7tZBSflS43Zi8EZH3TlDzoSyrc/zdQuyM7GyDh25e4ZQgwJ
         o8UfJfiTbuxJQw1LbFgaKIdW+mNTbzEU5404HI0C10QO2T9Dn1B4K3ARsagoeXGr15KP
         Ox/G8MHHYXxKPh1kaT4fEPcucsJL4zHdd/i9vK2z5AOljv9YOgOb9nFkL0RBQmA+lg0C
         5HYw7yq4zNhL9d8/99iaPLwZenb8E+gBKLkSCn5tNdLqJS4k8duBNCgD8cjerpv18aCa
         NgvZjjCflSLzTuwehWncZW/qX4io8gdic+bbI2sGAhiKwUKy/jvn4QdvgOgdiaz2JYRf
         1ntg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kn1d+mwt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si11147597ejt.123.2019.07.26.02.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 02:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kn1d+mwt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqwbj-0003Oc-9h
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 05:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41249)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqwba-0003NC-DM
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:33:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqwbX-00046z-Fa
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:33:37 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:41728)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqwbX-0003o4-7H
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:33:35 -0400
Received: by mail-oi1-x22e.google.com with SMTP id g7so39814159oia.8
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 02:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5t9MzNaRZyb7fs71dgONIWnz3ayGI84GPEpcmxOheT4=;
 b=Kn1d+mwt7NbwcQcX6CQZe0ige1GUuxVaZvu3t7U5mYILrBE0cA0fkAHzuA1V9aNp3R
 CIVmlWU1MR+Z2AEWI6y/SnoSqZbdcYuDiVv3Gzh/VZ6/vhmjoA11hsAVXqUGm/sCzF/q
 kZLGFoLOMuUpEI68pxqYzNn0XKfiwoy7BK/LBFyU4NDqPnyrmYIRf0P68RS+sW0+KDn7
 Sy5obdTWddgRAY6i6oZ1BPB8cvfxbaVaUqwVnb0Mh9lwFFte9hfVsGV6F2Y/K79c9XH+
 1zYwEzamrtSJmDs2Pc8Ax1VMzIFHsdLB0U3O1/KlQ1CqStAxKPPXiHRHrzPQHU4UrmkM
 X+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5t9MzNaRZyb7fs71dgONIWnz3ayGI84GPEpcmxOheT4=;
 b=cofWBth6adOmgXlrOvldyDc7lbR+hy+kxuokmvKbKri/BSd22qnMgjv/xZTMWm8HfK
 LE5YGib9LgTSsnZ0lE6LBPfi+U/gs8IiTCw8oHuNtmHX3NthpGT+3beYxDZea0pEZXiF
 FpGYW55/opJWNZUT4bofscX8m2nevNsEaSh5ckfEDn3/uXWdwQKh8cMLZkzWGfI+9++1
 cv4y9exSFxlL0Akh3soCQL/695fQe6wUKla6lGf3XNHAtsOv6RWj6R0s/1AwhWldu7f6
 uEnTBbaoyg4F/OSNASf2F+cq+166cZ7Tthwte/+iXIRXVnBAI2l5jpFXEH3wfti/e1oX
 ArVQ==
X-Gm-Message-State: APjAAAUGljMk/VN6CH+0BJNywByYm2bq/deZ39ExQJDqT3c6cneK7hyA
 xS6uo0X/BxX/R9o83mZvopuubABTVT0TzxkFNP8tzQ==
X-Received: by 2002:a05:6808:8c2:: with SMTP id
 k2mr44510084oij.98.1564133611331; 
 Fri, 26 Jul 2019 02:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-3-peter.maydell@linaro.org>
 <20190725172712.GM2656@work-vm>
 <CAFEAcA-jGvNS4N4qobLekHYdV82qSUWVQOvTRQbrpcCRF0Yvwg@mail.gmail.com>
 <20190725180007.GN2656@work-vm>
 <CAFEAcA8T25Fq5wj8a-K9KAyXdfj3+HtW=kTJ13zr+-iHFz4-GA@mail.gmail.com>
 <20190726093208.GC2657@work-vm>
In-Reply-To: <20190726093208.GC2657@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 10:33:20 +0100
Message-ID: <CAFEAcA9G1RmT-Ot4rYfqTa-xHfTPVq+RJ2A_EB9ufNrEhzyBCw@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22e
Subject: Re: [Qemu-arm] [PATCH for-4.1? 2/2] vmstate.h: Type check
 VMSTATE_STRUCT_VARRAY macros
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9YYOaNmeDX6e

On Fri, 26 Jul 2019 at 10:32, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > Would
> >
> > /*
> >  * Check that type t2 is an array of type t1 of size n,
> >  * eg if t1 is 'foo' and n is 32 then t2 must be 'foo[32]'
> >  */
> >
> > be clearer ?
>
> Yep.

OK, I'll fold that in. Are you happy for me to take this
via the target-arm tree for 4.1, given the two dependent
patches are both for arm devices?

thanks
-- PMM
