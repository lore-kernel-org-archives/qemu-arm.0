Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11667529wrv;
        Fri, 26 Jul 2019 02:24:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJyad1PdFKuCk/SEBLzNEwo2po6zSoupDrXtlgJWauwOHMSv6XwnyUkf//MWeeBEPsOGb6
X-Received: by 2002:ac8:1750:: with SMTP id u16mr62012492qtk.90.1564133075406;
        Fri, 26 Jul 2019 02:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564133075; cv=none;
        d=google.com; s=arc-20160816;
        b=dM3KoSeZm2ttwtglQK6gNRTxRjIQGmt8E48MmB1dBA5CKeY9oX08dhYTV36vJWLGtA
         lgyUUsgybSjurLOvGUOq+QWJqJVCpyzp+1PispNMnJJBaUDpR8/Kyqdqm+Pbo9Pz69IO
         0IJXbjf0tzktbp0eVUWBZ4ZmJnzOggMK41HGrLC0WUPETyhkv4Ft6y0DMF0geoZv4ihA
         5tlJoOcm7FbOH+2yHHC2q3VpqPRKWoOCDedQTCa8tuoMEKGF+zfMFHrqdE3OcJAlkkZF
         mC3Axos8MH/zsWPccMic9fCdg7oSgHfbTQZz2mstxX7N/xG5k7051a7t5yLerSTjt8S0
         sh4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p0Qrs+wBe+yU3V1LUom8LdVwwr4/B1c5vMUwSH66/qQ=;
        b=A4nX4vzoL9eI6fWGj3r7aLy/8vME4rIVe2smR0yoHlpC/srUQpxCWvYoigP1bAORUZ
         5BgHK3oKTYGwylC0rp6nif6lua4uZgSOf8UZgOdXUmw6Hml7p4ldE0Et41rFnq0qa23l
         Cs5QwN4pDoa8OA9nYplizo/fGQwHYzvR/vwAuSWtM8jjWH20y1w4cn4tEbd1xNIU9IDB
         J2EOIkxbCJ2MpHaiCdf47V6M28Xxa4JQtojYAWgun6sWQ4itzKy+4X7Sv87y6NIDMz1m
         ZRfRO73zyYAYeOgNvRyFTCgln+9OtZEyntGPFfkLvLIDt+bM6s2aFvZB05igrBacjrUM
         BJgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fad+FAn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si12405534qke.337.2019.07.26.02.24.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 02:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fad+FAn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqwSn-0006jd-M5
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 05:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42988)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqwSi-0006dk-OG
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:24:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqwSe-0005xu-Mc
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:24:25 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37399)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqwSe-0005lV-I9
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:24:24 -0400
Received: by mail-oi1-x241.google.com with SMTP id t76so39828175oih.4
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 02:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p0Qrs+wBe+yU3V1LUom8LdVwwr4/B1c5vMUwSH66/qQ=;
 b=fad+FAn7waqUs7kCfB7g7hq6qY/OzrkmgtoK1I4y6TWPKWFsb1iLDGzvY4Rgxg9hXl
 LvZvAsf1wEH77aEX99hU69m0yEsFes4OZz3O0XMw/uCSHEAUjXgURzhuuCv6ixQ7g/Ze
 330RsObXqlvq68DRa//ztrYZhHujZfDUu0lxWgDchM+VzfMLkNVajkBUh2YSnmcjWZkm
 s2WyLAJMfz5sqnPIeUgnMMEay4SBX9ba53eKFxsWZx1+vJOokaLqO4JapqXfJMSMj7oI
 9y2jcHaMmuXyDNT1vrRDrog/AZCgp4+NDL7cKXgzBi/ivcuQI+zObzgAT+rTtDXJ2QsH
 7iVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p0Qrs+wBe+yU3V1LUom8LdVwwr4/B1c5vMUwSH66/qQ=;
 b=loCsKAGRMHUqc7oGOw1jObkzPFECxTQR7QCUiYxQTjg0XU3hdBF4IGkaa+HDXm0EB7
 eKt6Y+qQQjr0u8ngq6V29CXW2WMFzb4eQZSB0mcv1ULgCyNNSVtmJzCqpGozmSL8u7Sw
 nO57ZXeIiTrGt5aFS0xXcEZ8XYtCrv0JAtoImIHbRu+Sy/Ur6jScRa23/0NZBkARKs+Q
 xs4IigYtC+X4S1hMIWX6TwvYGxDSXPIwzOpsUrewc4ObWm5B+aRcPr3kvmZlAHfUQZ5F
 Q5+Tb5/WrYtz6dD5029zkXMDQNOk4F0NXetsqEBR77/23LYWyyGOpCtfCE0aEveIhbF6
 4dgw==
X-Gm-Message-State: APjAAAULQ9IL0lDQEMjV4ERN4tJ3rFCxHKTO9IPHgWXBA7ptLmx0R/TB
 7czi7asAe1aIh16Xf+Yk7f+eqOvjhEuBzIQe7Ln0Vw==
X-Received: by 2002:aca:5cd7:: with SMTP id
 q206mr41721837oib.146.1564133060523; 
 Fri, 26 Jul 2019 02:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-3-peter.maydell@linaro.org>
 <20190725172712.GM2656@work-vm>
 <CAFEAcA-jGvNS4N4qobLekHYdV82qSUWVQOvTRQbrpcCRF0Yvwg@mail.gmail.com>
 <20190725180007.GN2656@work-vm>
In-Reply-To: <20190725180007.GN2656@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 10:24:09 +0100
Message-ID: <CAFEAcA8T25Fq5wj8a-K9KAyXdfj3+HtW=kTJ13zr+-iHFz4-GA@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-TUID: e74+MVh17NYX

On Thu, 25 Jul 2019 at 19:00, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Thu, 25 Jul 2019 at 18:27, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > >  #define type_check_2darray(t1,t2,n,m) ((t1(*)[n][m])0 - (t2*)0)
> > > > +/* Check that t2 is an array of t1 of size n */
> > > >  #define type_check_array(t1,t2,n) ((t1(*)[n])0 - (t2*)0)
> > >
> > > I'd have to admit I don't understand why that does what you say;
> > > I'd expected something to index a t2 pointer with [n].
> >
> > Note that this is just a comment describing what the existing
> > macro does, as a way to distinguish its job from that of the
> > new macro I'm adding.
> >
> > What happens here is that t2 is a type like "foo [32]", ie
> > it is an array type already. t1 is the base 'foo' type; so the macro
> > is checking that t1[n] matches t2, where n is passed in to us
> > and must match the declared array size of the field (32 in
> > my example). (In C the size of the array is carried around as
> > part of its type, and must match on both sides of the expression;
> > so if you pass in the name of an array field that's the wrong size the
> > type check will fail, which is what we want.)
>
> Ah, OK that makes sense; what it really needs is that example to make
> me realise that t2 was already the array.

Would

/*
 * Check that type t2 is an array of type t1 of size n,
 * eg if t1 is 'foo' and n is 32 then t2 must be 'foo[32]'
 */

be clearer ?

thanks
-- PMM
