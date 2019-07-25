Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10942607wrv;
        Thu, 25 Jul 2019 11:32:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwmHiQY/5SC2e176vjHiqx7ADw6PNoJbEPoULfdQ9msT7+DFwNeVfw6R+bANFsfy1n9eHkg
X-Received: by 2002:a17:906:c785:: with SMTP id cw5mr22665399ejb.215.1564079568114;
        Thu, 25 Jul 2019 11:32:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564079568; cv=none;
        d=google.com; s=arc-20160816;
        b=lFQ2MHGLmP3Y9kVt9jxSU3Pe+7KDA1iAWVBbW9oT0UOtHrxpvWMBPydv+I6nejEofk
         8hZjeZA6Dv+6UCmKQx0yGn4hfLrGFfoKhWGntNFhdc5KoQLCbvCASC9IwnXJcJqinphK
         +d4vBt/rv2uPSP9nJNiOU8WwMWxGM7gXATXw2xBDziVLUbmJAyoo2NCZtGl4ay5QXbUj
         ZlQb4kHKiIZ+Qa4kdVBIaJ3awCfbEQFhdfMyUlEPU3zdIdSPV1OBMYu63sJBdNZBeXRT
         DF3fCeIIVW2syagwk/zbK4l3JXGunaxn1FdfUh206PBOmHaJkay/sT98xqVF+OAZT4HB
         HHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=XFaOTfK7v3wTewarL4TAEn8mlS61s3Ag88QZ9VnpL0M=;
        b=lS/pv5DWqW9GQui2IEtt2sIQo5gVxtukLHn2Y19GyLOeqMBJz8ZNwTyexKpBEMiups
         EnhFnITZwkX/VnDxA2PWq7J8AYBM8EoxifOI4qF3Evo+zX17b1DcWkyVdmlWOZCQlnq2
         8cTw83NWyNx3ArgatGCGWVVqzj6Y7jIk1MKcoj9k5W+uFpSF436h7dkEd020kW6kAVUm
         mfd9W3Cpx0/1hWiTuuMUfBiCgaa9yn7WOur0YdldFZvFschslFEALmt61grTOJURTMx2
         BV9RApgmsGrifyw4mBTGF9OQW7J/prMl+Ttr52mY4z6FYZCmVZpkOhIrgYIK5UaObdp3
         dwtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si11534588edc.233.2019.07.25.11.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 11:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqiXn-0006ti-7Q
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 14:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40269)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hqiXj-0006tZ-IJ
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 14:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hqiXh-0006mY-1F
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 14:32:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55706)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1hqiXg-0006lS-RW; Thu, 25 Jul 2019 14:32:40 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 24D0B859FF;
 Thu, 25 Jul 2019 18:32:39 +0000 (UTC)
Received: from work-vm (ovpn-117-187.ams2.redhat.com [10.36.117.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4AEF1018A31;
 Thu, 25 Jul 2019 18:32:37 +0000 (UTC)
Date: Thu, 25 Jul 2019 19:32:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190725183235.GO2656@work-vm>
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-2-peter.maydell@linaro.org>
 <20190725170228.GL2656@work-vm>
 <CAFEAcA9RQBz=t8F_nOTH9FZu_jKD0XVMJtPwmdnJBfnFR4G9oA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9RQBz=t8F_nOTH9FZu_jKD0XVMJtPwmdnJBfnFR4G9oA@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 25 Jul 2019 18:32:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.1? 1/2] stellaris_input: Fix vmstate
 description of buttons field
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
X-TUID: WUsR0l2NgVsW

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 25 Jul 2019 at 18:02, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > gamepad_state::buttons is a pointer to an array of structs,
> > > not an array of structs, so should be declared in the vmstate
> > > with VMSTATE_STRUCT_VARRAY_POINTER_INT32; otherwise we
> > > corrupt memory on incoming migration.
> > >
> > > We bump the vmstate version field as the easiest way to
> > > deal with the migration break, since migration wouldn't have
> > > worked reliably before anyway.
> > >
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > OK, it would be great to change num_buttons to uint32_t and make that a
> > UINT32 at some point;  it's hard to press negative buttons.
> 
> Is there much benefit though?

Not much and it's not urgent

> As an aside, I'm surprised also the macro doesn't complain
> that we said the num_buttons field is int32 but it's really "int"...
> arguably a different kind of missing type check.

I was just concerned what would happen if your migration stream
had a negative value in.

Dave

> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
