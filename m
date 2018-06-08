Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp721656wrq;
        Fri, 8 Jun 2018 03:55:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLj7VVVKQQnlwWUXg9/spdd4ZQZ3O8XupAzClSEVhyHs0Ipy6hevfNcirl5VHhl+BMZaFeK
X-Received: by 2002:ac8:33cf:: with SMTP id d15-v6mr5521952qtb.261.1528455335901;
        Fri, 08 Jun 2018 03:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528455335; cv=none;
        d=google.com; s=arc-20160816;
        b=1F8v/hholSOwBxcorNpH93TzTlLuOUomRXkWBJW0NthMRbtSU/8I9db/pbXKlZHX+M
         pgtTitLXdrDHeSslDFgcwW1JHURLc4Cos1fE4uKcT/Ak3Ccglc98nbwWYs61f/8z6upo
         5HSfrS1b1IdjqxYt00DH+3rtcSPRlbMKQni/MtjnZs/vly4kRmdRt5MInt/VLmprMA77
         BhHqwtc4737thF3aniEfofFNxnLf0mNpi02r6jS96p3fACDPOAgpVfKQwIhDW90wG+pT
         0lhR8EurG6xDs0uQ3Lv7iwNR7SLn+NwTAc92Nq785XIKW1nmCpzv5N+scIY9hCBHZWbC
         hNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UFLkUni9t6zi2wZCpHNWRVoFPNaybg6D3UGDFqJ6FqI=;
        b=XkZPvNzJvvE7b+y68CZweWmFPKFD5uPP9spr+U2kVgdkahnCcAkZir05pHmbUy2Kn3
         qST6w9elDklkE0atCH9UTv5fX5v+8+g7xVdNsx58vd2sJ8+hmJrKIkbSYB7qsBJwb4hY
         ILORA4ZuYA70HSdJXJBFfZURnA5OeYxjNhf/Dmng0xj+69U2agwW7s51ItQYy7CWxymH
         rhzMoEfdlpdY2Yhmq1ChMZ3R0yOzC8RV2JOWgwP1RBa/a5CN+/6Qnk9nNFBaxyAEPAr2
         2DZ456pVYyJRNZHMvyu2vulafoM95TRoPN892SlzcEnKNRhAD6Lv8Wtwb7QqDl9am0Q9
         pLkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QS/VPXrH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b29-v6si1834899qvf.142.2018.06.08.03.55.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 03:55:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QS/VPXrH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34667 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRF3P-00040M-Bm
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 06:55:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRF31-0003yt-Co
	for qemu-devel@nongnu.org; Fri, 08 Jun 2018 06:55:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRF30-0000Rn-Lk
	for qemu-devel@nongnu.org; Fri, 08 Jun 2018 06:55:11 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33326)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fRF30-0000QO-GM
	for qemu-devel@nongnu.org; Fri, 08 Jun 2018 06:55:10 -0400
Received: by mail-oi0-x244.google.com with SMTP id c6-v6so10329194oiy.0
	for <qemu-devel@nongnu.org>; Fri, 08 Jun 2018 03:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UFLkUni9t6zi2wZCpHNWRVoFPNaybg6D3UGDFqJ6FqI=;
	b=QS/VPXrH8zmo9R2zUgLbriy+HROVrrS1s34TVhfb+fAQ9/KBHjoQO4mB1d3a47YJOV
	sxQOxPpy1+9Ej2iVdeUlDXwO/csMdjgzwqsF2RHW2gS0GJimb2opaYcrQ3Z6oMSKoifP
	E79OjVKowYOU13Kk0CuZR6r0RJmYt/4GE2ZGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UFLkUni9t6zi2wZCpHNWRVoFPNaybg6D3UGDFqJ6FqI=;
	b=tbuTe9oqF/2h/PGc7qY1IT86vrIUstdsX/qMgxfKtyZ8pt5SnEu1t0XjgrXx4DgFyn
	ipRX5VvrH8FUUFiFzm+63LxNC2vNtDNZJ9dsoE8z/Ym8K58FIbi3uFMtHQfpsCo+EhW9
	xfF1r7Uw3V3KSeZ2MtmrwstFaBZOoNZuTEdMWFyfrhtKXHbasdV0t7ePMowIXidqyQO5
	aihbLJ/muzgHRXknP8G+clU9L0Os2EgRyempqmKEKuseqmVHgpvY60Xv12LaysG7OhUn
	J/a8h4TXUFk5A3/CTWg5lnal0IGkQIky80OuIjd5opKemaXCOHK7HIcUetWp4D4kovIi
	1yIw==
X-Gm-Message-State: APt69E1BWVigJhtBZqPjnlmc2PyIlDftdeIG4vvw/zwhf/FnrY53EXWw
	4BGsx3OTn7uTPA/9sFICTwwxh4g6DdhBmMc5Ij29FA==
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr3056130oig.102.1528455309604; 
	Fri, 08 Jun 2018 03:55:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 03:54:49 -0700 (PDT)
In-Reply-To: <b4903491-f450-1a54-2a70-a084c30cd8c6@redhat.com>
References: <20180606152128.449-1-f4bug@amsat.org>
	<b4903491-f450-1a54-2a70-a084c30cd8c6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jun 2018 11:54:49 +0100
Message-ID: <CAFEAcA_xP37u4KMdvPe8MyU3y_6re88pAx3KTLY_DOP0qWQzqA@mail.gmail.com>
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH 00/11] misc: Add trailing '\n' to
 qemu_log() calls
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, Michael Clark <mjc@sifive.com>,
	qemu-ppc <qemu-ppc@nongnu.org>, Paul Burton <paul.burton@mips.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D/vae6yIcCmE

On 6 June 2018 at 20:43, John Snow <jsnow@redhat.com> wrote:
> so error_setg must be used WITHOUT \n and logging must happen with \n?
>
> If we're sure that's the way we want to have things laid out, we really
> ought to augment checkpatch to catch this -- because there's 0% chance
> that we'll keep it straight on our own otherwise.

It's a historical side effect of them being basically separately
designed APIs. error_setg() takes the "give it the entire error
message" approach. logging is printf-style and gives the caller
flexibility to compose more complicated lines of logging with
multiple calls. Consistency between the two might be nice but
there are an awful lot of qemu_log calls in the codebase to check
and change to the other convention...

thanks
-- PMM
