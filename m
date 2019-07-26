Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11701170wrv;
        Fri, 26 Jul 2019 02:59:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyieDgmeVwIH/Y93134rA4UmpUInHeIBhNnribg3kvXeUfcpvBKYx5q7iU9CMK7qc8AfsJF
X-Received: by 2002:a17:906:1252:: with SMTP id u18mr71652863eja.13.1564135193581;
        Fri, 26 Jul 2019 02:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564135193; cv=none;
        d=google.com; s=arc-20160816;
        b=tUC4EjzbsebTRB77ipBadw9V0og+jIOtQMztnfL9F2l6zzQApY4GdsC7xmWuAfBITS
         y4UZO/4zhJCOAAW7GSRiujdo+6kX5JLMiW2psdpYMUlExOT3HuMdGvgvb321/9HlyR2K
         RC+BJSoRYMbFQ3Belr3TYRfXhpKg2DSvuuXvVJSXBN5+N8y6IZL0YNRSul/UHv1Z/rVO
         o8ssGq+hBseLTfVok/pV93yaWOwFYRQSK9lEgNnEzv8Cfm095UqstbRRI0027hEjjxdi
         qVaIamLTJO0kHipYQKWmCgAhVUsxouz1K9iYdqVBGchxD9Vr+KvwGSRsjdVdG8LVmGw9
         6ETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=gi+XeD4Ucppe7tGVk5Pf3hb2gawXl7+bUa3lGBT/d8w=;
        b=IoVIfjm+DaiBQAjhu0ynQf7CiYJOa9arcH+2It/1psUYV4Z0IncoFNiUXhMxG9JkI2
         d2pizTkw/gRbeYpwY2YpOOPSA0ez/3Wx4TOy9r1ENRM0mAX53Asw88jbTYPJlAlSZekb
         5YpnJ/mIbG0+6WHrvlWBVY8FeB9HZvzIRXojKRBkhqrs2+S6CqA0nrGByZZsbPi7+I0N
         Yiw5x9UBwN8v652pddfG3emfZYevmdL1n789MZLquwuFrypvDtPX2r/lOZWQhV88q6zy
         Wb1gfJmbTEHsS2VThIs6m7RSU4qcyLcViweG1Xtwwv7VzmjTbGel1xDmjl56zwNJ5IF0
         Hf5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20si13360034edd.304.2019.07.26.02.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 02:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqx0r-0003v2-Nc
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 05:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51583)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hqx0m-0003u3-Bf
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hqx0j-0006ZJ-Ci
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:59:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37850)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1hqx0j-0006Rv-5Y; Fri, 26 Jul 2019 05:59:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CC0355AFE3;
 Fri, 26 Jul 2019 09:59:34 +0000 (UTC)
Received: from work-vm (ovpn-117-185.ams2.redhat.com [10.36.117.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B978E60C44;
 Fri, 26 Jul 2019 09:59:27 +0000 (UTC)
Date: Fri, 26 Jul 2019 10:59:25 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190726095925.GF2657@work-vm>
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-2-peter.maydell@linaro.org>
 <20190725170228.GL2656@work-vm>
 <c5a0799e-2ebe-5a79-915a-af52d471a589@redhat.com>
 <CAFEAcA8PROpFeKfxXFdVvVoZaus-MsX_EHGxw+yEUty_mnQdMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAFEAcA8PROpFeKfxXFdVvVoZaus-MsX_EHGxw+yEUty_mnQdMQ@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 26 Jul 2019 09:59:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1? 1/2] stellaris_input:
 Fix vmstate description of buttons field
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
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AK0ZuUtXqac1

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 25 Jul 2019 at 18:40, Philippe Mathieu-Daud=E9 <philmd@redhat.c=
om> wrote:
> >
> > On 7/25/19 7:02 PM, Dr. David Alan Gilbert wrote:
> > > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > >> gamepad_state::buttons is a pointer to an array of structs,
> > >> not an array of structs, so should be declared in the vmstate
> > >> with VMSTATE_STRUCT_VARRAY_POINTER_INT32; otherwise we
> > >> corrupt memory on incoming migration.
> > >>
> > >> We bump the vmstate version field as the easiest way to
> > >> deal with the migration break, since migration wouldn't have
> > >> worked reliably before anyway.
> > >>
> > >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > >
> > > OK, it would be great to change num_buttons to uint32_t and make th=
at a
> > > UINT32 at some point;  it's hard to press negative buttons.
> >
> > Since the version is incremented, now seems to be a good time.
>=20
> ...except this patch is for 4.1 and we've already done rc2,
> so it's not really an ideal time to put in code cleanups...

Don't worry; you can always change the int to a uint later without
bumping the version again.  Unless someone somewhere has a device with
-ve buttons it'll be fine.

Dave

> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
