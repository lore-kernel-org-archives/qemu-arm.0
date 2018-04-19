Received: by 10.28.4.212 with SMTP id 203csp566064wme;
        Thu, 19 Apr 2018 04:59:15 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrw827MMgNbTGETGSWWU13zZVDNwuPmvrx0fxUmglccC1vCJtYuegdFPdRMIUgvDNeSAWmK
X-Received: by 10.55.181.6 with SMTP id e6mr5307264qkf.80.1524139155782;
        Thu, 19 Apr 2018 04:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524139155; cv=none;
        d=google.com; s=arc-20160816;
        b=o/LsVsvJmyEJpcCVDDgUGndbmoQ/cjWqLJXuCETMK7WT116dEnq0QsYWMw//NroIOa
         mWd/GDzJLTSSsCzfThTGi2ngyCDLJ4U8lCfosyEAgOPX6qFmaLEwvHOIW5I6hI0GUP+V
         3EsK3KKLAh/9Rsdf8fgGUg7e9/88iAb1NATK9F2sZ7MLWI/4qCOuQ0Mk7wYHjzNUL6vq
         wwMrl/NCPwvIWz/oSU+d9A+JQBnzlIF4IUOnXuMLyZmXgbNJhaqFeqTIE6/3VS/MMuIN
         7xaQ621iPqNF+P31EvkA2hxh1y/bUMOjW5RLAqe+mLuFM4ZRpRvBuqEenlCG52RgBPSA
         o2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=cwrkOj9ZxwcMjmq0XCtDcExTUzsY9vWUtRFwhAUaiFQ=;
        b=kAaRPrlmNOPy0dpxFgrBteaR9QWkngFGswa0qVD65ELwmz2N15G1jq8XEX0xCY8QhK
         IPZT0zLwekO9654woZOAio1Q9+bvpnwygoBUi/SKzX1tSwUKUCIGPHd6AnWmbKWpfFvr
         /IyMwjFun5KHbhNdMfc+gSqxlUjTgJMxU4Hyb27CMVWmJ0fEIj7WAUJkUXsDu7Mbif68
         bU70E+93uVQgYH/Qu+mFxSeSf+a3LeL4a8ZCe76mrT8xcwhyPNoPmWnwBgIOoBdfrIg5
         HrQp2CAm6dYL6F5OhWcAIPt85RwDZQMkNVAy+sIGcFeMbiolhtyTCAZ8RfVM1Zyg0V+g
         LlKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WmtFveKX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q1-v6si4667716qte.102.2018.04.19.04.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 04:59:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WmtFveKX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f98Db-0004KH-9i
	for alex.bennee@linaro.org; Thu, 19 Apr 2018 07:59:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f98DP-0004I8-E2
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 07:59:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f98DO-0003pB-ID
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 07:59:03 -0400
Received: from mail-ot0-x234.google.com ([2607:f8b0:4003:c0f::234]:35887)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f98DO-0003od-DP
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 07:59:02 -0400
Received: by mail-ot0-x234.google.com with SMTP id p2-v6so5518789otf.3
	for <qemu-arm@nongnu.org>; Thu, 19 Apr 2018 04:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cwrkOj9ZxwcMjmq0XCtDcExTUzsY9vWUtRFwhAUaiFQ=;
	b=WmtFveKXJmLZMg4Wfckrn2louK5nyznG2dcNSUzMkTfIT/dkD9511UkoOchD06nWgK
	+ETFEn+ovkassCdWqufZkAfIibZ702I5wPoL7ny1D3lGr7hcbQQLZu6mnHWHrb6BJrQQ
	pbPPKK4YG4LTcvwsF4MPSf5wpLYf6GXI3o8t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cwrkOj9ZxwcMjmq0XCtDcExTUzsY9vWUtRFwhAUaiFQ=;
	b=HTMZbFB7o4psccK/KW1QEBGwHtuc8IBImJZqc6sXPkgTc4g+00i7jgNT+hO3QsYZbH
	0JQQYYPvbodz0kxqzXwrMrfWKEsjLxr93eM+rC7aHFLWkxFq91rxNOSSgGf6J1gU12/c
	twZz1WwektMRijQ7oCzltxlq8g6crwQXszRCGHhOCM1Yc/qyj9wxfgDqC10EPsKQM4tn
	ssl6r8j+I5btlhhTfpcyyKig0+NTMEvrHlIusnq12boKxU1PuqJECSotqHQ9U8PmDpcy
	AMtRofRrrd17746yVfK6+R+5AxmEK7xEYXEdwPsh2yXX1FQ4iEDguF2NL/YFmIhfzkvk
	LLJA==
X-Gm-Message-State: ALQs6tBDVMVSJy5ewOkHFPxPYUk947tZjWEZbXhpRpm5a+ICJRlfhG0Y
	zCtpKH7RdAANYDMHIecjpaCNrY/oGi/Mu7oys5MWDg==
X-Received: by 2002:a9d:4a90:: with SMTP id
	i16-v6mr3961930otf.294.1524139141620; 
	Thu, 19 Apr 2018 04:59:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3128:0:0:0:0:0 with HTTP; Thu, 19 Apr 2018 04:58:40
	-0700 (PDT)
In-Reply-To: <20180419111108.GM10259@redhat.com>
References: <CAOuPqTF3nG157ShF-hW+poXbr25zODOz8pj+o9XdY=ZgU8qpFQ@mail.gmail.com>
	<CAFEAcA9d=oEKfnW0Jr2vrSD8mu0xPbUYk6PAk7dxUqXjJUTooQ@mail.gmail.com>
	<20180419111108.GM10259@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Apr 2018 12:58:40 +0100
Message-ID: <CAFEAcA-ZurVeZG3=WQJnBaLQF8CoTM7dXNCX08W7iqCZ8XuByw@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::234
Subject: Re: [Qemu-arm] [Qemu-devel] getdents patch for 64-bit app on 32-bit
 host
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Henry Wertz <hwertz10@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ir6XXqldXyFn

On 19 April 2018 at 12:11, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wr=
ote:
> If we can't even get something common like dirents working with 64-bit
> guest on 32-bit host, should we refuse to even build 64-bit linux-user
> emulation on a 32-bit host ?  There must be many other similar cases
> where the 64-bit guest syscall is going have insufficient space in the
> host 32-bit syscall structs.

Most of those are OK because you know in advance the size of
the structures, so you can tell the host the buffer length
is smaller, giving you room for the conversion.

Note also that this only happens for NR_getdents, not NR_getdents64,
because in the latter case the structs are always the same size.
So an AArch64 guest would be fine.

Thinking about the getdents problem, I was wondering if we could
manage to calculate a suitable host buffer size based on the worst
case. dirent for a 32-bit host is 12 bytes, and for a 64-bit host
is 24 bytes (plus potentially extra for the name strings). So
we will need an extra 12 bytes per record. The worst case is
when the names are all short enough to fit in the padding inside
the structure, which means bufsize / 24 records in the buffer;
so if we provide the host with a buffer size of bufsize / 24 * 12
 =3D=3D bufsize / 2 then we know the host can't give us back more
records than we can fit in the guest buffer. We would then need
to do some annoying special casing to handle the "host syscall
returns EINVAL because it can't fit a record into bufsize / 2,
but it would fit into bufsize". I think you'd probably have to
loop round gradually giving the host getdents more buffers
until you got to bufsize - 12 (or live with passing the guest
back an unnecessarily pessimistic EINVAL).

But I've just realised that all that is entirely unnecessary,
because the right thing to do here is to say "for the 64-on-32
case, use the "implement getdents in terms of getdents64" codepath".
This will have no buffer overrun problems, because the dirent64
struct is the same size on every host and always larger than the
dirent struct for any architecture. I'll cook up a patch...

(One reason we do still provide the 64-on-32 emulation setups are
that if you have a fairly simple guest binary it can work well
enough -- the classic use case here is gcc test suite binaries,
most of which barely use any of the syscall interface. But there's
also a fair bit of inertia :-))

thanks
-- PMM
