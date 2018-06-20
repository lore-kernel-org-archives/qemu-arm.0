Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp955627wrq;
        Wed, 20 Jun 2018 09:22:17 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLnwyipXoGczSvCMAgCrndbJDm7k7UcDSlxlvw7rnO1obR7pHdmlqsZlLTETqYtrn81/q2S
X-Received: by 2002:a0c:86e1:: with SMTP id 30-v6mr18462906qvg.143.1529511736946;
        Wed, 20 Jun 2018 09:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529511736; cv=none;
        d=google.com; s=arc-20160816;
        b=aw9wWSMWau71a59MZObIflMCxPw8fC9xYZrqRe/tJ36XMA+C5M5OaCPK2d0uiN2P08
         9FYXacqxjW9HGFU8L2hyEzWVl2Vv2+G+LKgcbq4ORBWvI8wBf48nAo+Cl+isggFru/n3
         iWZ7VlMC8qvdwlrG4TtgbLxouHvtfXwggX/eC9HMzp0LN9Z3SP4CNZHzgrzK8mMbah/0
         aSVzEgOk/7UiCctMXkVDRfwoQqLTa1w41/cr1D0ayBwdWVVjgYK0XVGsznSrWtTY1fpq
         8lA8FlUNr6fbCdn5ljOnZ5gnS0nHxdUHgkiKypWwwV+FiMZc3JS+iLJcSLguf7v8QxaW
         +Oiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eh2/DUaNbGCZatyygiEQxAcYOT4ysf+1CYJYZ7J+pxE=;
        b=ww1aazbT4tfWoVjL1NFBnq3TgSrnSM6h669ApavnidhCQ23cHGdnohGBO7QnYfQuEW
         l60nCBS0Jw3tUqn7dPlaQBv6nUnkxMZHHb9jLFwegCsQxYPcTDawrBrSVY1qlO3Met83
         nQKPlDWlQiPSik2Q4G/QSfsvCJ0J6Ixotshv5SIn95Eu4iaj1CFNYNMo0bsXeAvAmYvq
         Jcjh/yOtwfk8Np3yki5ukY8OsDsxa0EanQyABGApprmImOr5PEPpCrulPxrBof4cwUqU
         2+InqvRxUhwVH0wKcfeBszeu4/PLzT0jUEfdAaHhMMJ0HjfNLA9MxT07GP6+BnnDKfYR
         WOIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zg5ffdDF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g39-v6si2583267qtk.36.2018.06.20.09.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 09:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zg5ffdDF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVfs8-0002yw-I1
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 12:22:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVfs2-0002yc-6J
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:22:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVfs1-0000sx-BH
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:22:10 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:44496)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVfs0-0000sZ-Uu
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:22:09 -0400
Received: by mail-ot0-x242.google.com with SMTP id w13-v6so141149ote.11
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 09:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eh2/DUaNbGCZatyygiEQxAcYOT4ysf+1CYJYZ7J+pxE=;
	b=Zg5ffdDFBxKRCSfQ4hVxNY5Avb0EekCqkWG7znwSxXkkXsypoR5rexZ6+fBdYV+p62
	/xwL9ear1d4Wwc0o9VZ5prGvQKTpNXdnDid2XPbpvhnO6UL7chI/6/VF0F6IrQma925o
	HWTc/X1vHnZGcYykHphxOzN2zSYsvtO42okBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eh2/DUaNbGCZatyygiEQxAcYOT4ysf+1CYJYZ7J+pxE=;
	b=miEzd4tnbD4mWGlLIBv1UHKpjqupNneMF7Cymp/Jwhh6y/rXBhXEEBT/rpbqC4Fc2V
	/PNzV9as5kABkPX1v/CmxYPLEpDmrMWhKAmgiJRMZ0X80UZ7CeeyJLgX+j1PaRq58Gx0
	+A6GjCgUydYofgWx4DBrIpSCFomNsCy80D+8uuG2j0XNNDAwSUNodGblh6sBcNVgFC4A
	Pt3yKbMOTlMi2l/dyrskgsg5OtA5yCUec/FB2ZcsyUPl2iaNfCHmAqP01TBEVqzp/UeL
	8+lDF5GJvqTzQTuLuQIfjBdpV36s/+aOIibFa5OJTxSivjRXyJ0EYI5E5lgtvJjeM896
	fxKA==
X-Gm-Message-State: APt69E0adtrG51LtqBxY7O+fMFJUj+qNmFecpSJklMoew0hF2lwQ4TZU
	OMpAXRwnbjV948WSl1bI/YHyfAjHeJZayAGQ+ti5HIkV
X-Received: by 2002:a9d:3fda:: with SMTP id
	i26-v6mr12617452ote.126.1529511728318; 
	Wed, 20 Jun 2018 09:22:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 09:21:47
	-0700 (PDT)
In-Reply-To: <dabacef8-081c-8808-d42e-ebb6fd0e6012@ilande.co.uk>
References: <20180620130619.11362-1-peter.maydell@linaro.org>
	<20180620130619.11362-2-peter.maydell@linaro.org>
	<dabacef8-081c-8808-d42e-ebb6fd0e6012@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 17:21:47 +0100
Message-ID: <CAFEAcA8fYtFxPTjOCLrf2CmeCwho1sv=vwrz=U_kdKW+51aayA@mail.gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] tcg: Support MMU protection
 regions smaller than TARGET_PAGE_SIZE
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f6lql+/fvqGx

On 20 June 2018 at 16:46, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
> On 20/06/18 14:06, Peter Maydell wrote:
>
>> Add support for MMU protection regions that are smaller than
>> TARGET_PAGE_SIZE. We do this by marking the TLB entry for those
>> pages with a flag TLB_RECHECK. This flag causes us to always
>> take the slow-path for accesses. In the slow path we can then
>> special case them to always call tlb_fill() again, so we have
>> the correct information for the exact address being accessed.
>>
>> This change allows us to handle reading and writing from small
>> regions; we cannot deal with execution from the small region.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> This patch is very interesting as forcing the slow path is something
> required to implement the sun4u MMU IE (invert endian) bit - for some
> background see Richard's email at
> https://lists.gnu.org/archive/html/qemu-devel/2017-08/msg02835.html.
>
> Presumably there is nothing here that would prevent the slow path being used
> outside of TLB_RECHECK?

Nope; we already have various things that force a slowpath.
Essentially all you need to do is ensure that some lowbit in
the tlb addr fields is set, and we're only moderately
constrained in how many of those we have. You might or might
not be able to use TLB_RECHECK, I don't know.

thanks
-- PMM
