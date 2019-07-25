Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10911036wrv;
        Thu, 25 Jul 2019 11:00:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx74+Rhzg1AQfOsC+PTbfdcleNSIW2q2GuRJkz6TK5EJn72SOY0Mj0gKBleZujEw4JyBQuJ
X-Received: by 2002:aa7:ca41:: with SMTP id j1mr79850133edt.149.1564077609483;
        Thu, 25 Jul 2019 11:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564077609; cv=none;
        d=google.com; s=arc-20160816;
        b=ArTiN5zIvJe3OWvKRj2kc9dJBvMhRIZ8QdXNMCM+kwtTdFTLiBtX1MYcLxCVSLbjCE
         8RWYu+IWuEtoBqiXi4gvG9QSIwW8pmJ/mr3PP3VSJLZM2tsQH8cfqGRy9Ol2/ycGlLSU
         AmjbnHkC04c0J5Y1RNjF5Gf6EDCvqIqmJMiWSbtdLjW5G3YadGDSNKZzDptDhHYXxz6k
         whVDHsuFO5mo+3guciuXkqk+aaR/QO2mmY/dQTUJFLHIjAM8QbqxKHuK4+1/bynarf8O
         TzsnLvJ+iCONsvHWj2dcYQCBhaA5syfIxespQlgkQNpcxgoGfka4u8wa5xGwpSTVPgBV
         PO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=elNNG/UcrQabTxjIvTIAJ4efMjiVM2QCOARro76Y5+c=;
        b=lL2gRxorspewy90pr6zwbFmfifIsZfmBRN1IjgIQTeSlMFv8/PvZ9PC+OtWOJQudQM
         iOw5v+xBCnvDenm1IkbKp8bKaXOIqtegKnAKRDfzRgftDE3HCXZGGEj67KnvqR8BlNvv
         UWvTuhi0VtP+EFMpM6qGfK/QUU+Ks2CtOtd5Mgb9EzUgQEB6UYHuqywCN6a+li4W6tCG
         nvXWS+NW8yCaBONt07gfh+BYshhJdyNMIIZDx9PurFEWM6QXv3ReFp0pqlqrzeZ9vIQU
         n4spJtK6J1AvjrQDkp81M6vlh/EEOhi2jEK/pryVorpHhvhjEXozLAgh/GS3JvO6iCta
         caLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=szp70NQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e28si12214987edb.265.2019.07.25.11.00.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 11:00:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=szp70NQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqi2C-0001RL-53
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 14:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44513)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqi28-0001Qy-8N
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 14:00:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqi27-0000ct-7o
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 14:00:04 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37789)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqi27-0000bD-1H
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 14:00:03 -0400
Received: by mail-oi1-x241.google.com with SMTP id t76so38332214oih.4
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2019 11:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=elNNG/UcrQabTxjIvTIAJ4efMjiVM2QCOARro76Y5+c=;
 b=szp70NQuHKhZ/Q4tFtrPyoFAaBTNbN8nAkBZ6D5Y/OffaklRgz/vqb4dTuOgsDjgx+
 RjUAD9Me6h9TjdTUAE8HgKWJvw348FpFd40vEqqIGiEXnXryj/w+dc3nmj/DRCfaIlGW
 cPxVq3VXRkMvl+C7CQUitjzp4kfmsHtsVTszPxnOBFG6OWzV3EZc3+msisOpOTBA+SlL
 Xdumfl+7HC1xQ8w6y0XWVlkUNnhkbZkD36eFlUaNCWYERAca7EYtS/GT6udojeAHzfxH
 LHg0KHCmzVufmiCi1/aJFQJrXEA4TGiHSX5ko0f+0kvobYthFECM4wUYVkqKXFQVCUIi
 iCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=elNNG/UcrQabTxjIvTIAJ4efMjiVM2QCOARro76Y5+c=;
 b=aEPQI72g6o0fdHLI2BJNEnoNDX5XMciSIYtv925Ar86XuZnv8HMqwU1WRrOd8vBMPR
 tqocgrfwa0/IG66W72WaZ6ZCGWNcU44mqa9T8t9w0kCuQ8E4lrRQj7Q6EOfLaEQ59rg/
 6E/PdpxwmIKFwRqr+7Nmlr0v37fDCKq6Jod9MqeBB1ctSY8/APojAHZy8Rx2khY8nGNA
 6v6WUwAOWOv+GiYf9DqbVb4v6LADjCzGQUpfCrh8YXxFaOJxdPZxHYn4XVGoghW5JYYl
 uKp6sV2S3u5t9VHuja+k333j02Ar1bRNh8zkWkMFC69P2+I3CffkCuh3kCNWfnYUhDTF
 doow==
X-Gm-Message-State: APjAAAWJVRsS3n5RAj2mdin6I23E0EVn4fqGahdgrQbxxbuQAQKTB+a3
 CDuFqwSxP5XEmIejIfrXt6w+anjxmDusY9s9SvEVlg==
X-Received: by 2002:aca:6185:: with SMTP id
 v127mr45544465oib.163.1564077601969; 
 Thu, 25 Jul 2019 11:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-2-peter.maydell@linaro.org>
 <20190725170228.GL2656@work-vm>
In-Reply-To: <20190725170228.GL2656@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jul 2019 18:59:50 +0100
Message-ID: <CAFEAcA9RQBz=t8F_nOTH9FZu_jKD0XVMJtPwmdnJBfnFR4G9oA@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-TUID: mw+ocSBYw/Rx

On Thu, 25 Jul 2019 at 18:02, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > gamepad_state::buttons is a pointer to an array of structs,
> > not an array of structs, so should be declared in the vmstate
> > with VMSTATE_STRUCT_VARRAY_POINTER_INT32; otherwise we
> > corrupt memory on incoming migration.
> >
> > We bump the vmstate version field as the easiest way to
> > deal with the migration break, since migration wouldn't have
> > worked reliably before anyway.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> OK, it would be great to change num_buttons to uint32_t and make that a
> UINT32 at some point;  it's hard to press negative buttons.

Is there much benefit though?

As an aside, I'm surprised also the macro doesn't complain
that we said the num_buttons field is int32 but it's really "int"...
arguably a different kind of missing type check.

thanks
-- PMM
