Received: by 10.28.71.155 with SMTP id m27csp614703wmi;
        Thu, 22 Mar 2018 10:23:55 -0700 (PDT)
X-Google-Smtp-Source: AG47ELu3f7v7nEIWQzBnuDDfscBVNZDb/+5oWG44mO+Ad+kjrOHnGdqzdN4KODEOd4X9Yy32Vwyj
X-Received: by 10.200.4.9 with SMTP id v9mr35207282qtg.69.1521739435403;
        Thu, 22 Mar 2018 10:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521739435; cv=none;
        d=google.com; s=arc-20160816;
        b=HniBKujjF/tTUxdAiVogRgHSRUYne0dTY+cAGoyaTAoD/dtmrSBni4VFUGb8KwMXhG
         7aFGL4rW3zpaGjRYWBRg0bJdSzh7C1++HcKpiOTG3io2D4G2p3fwGnzZ1jQ65nIYHVtN
         +WZB9lTXhCNRsv66OJARqW2DiNRYiPvbAfnvlqlA+0suFWw2qCa2IWI2KAZKRAFf0gqd
         TkRj30L7gx3VAr159+DeCLfX9NmJbXYMEgoNXUB2nU5HHDs19/MelnrIQdwe6EzK5IqT
         jGPorAoWIQX9BzwsqTz+f9yjX1wvdBjHhRQgwfoUARGdeEqRTkKnwK0aDm/eG9Q1SkA8
         E5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TohuQrZ8hh0OSjq4v96Bg1ahElj6lVZOp+pKGTG7sto=;
        b=C4vEsqZctuu5i4Jo6dDyH159RwmI+vR0yn0lzAUBN46ZZpRUe0ehJlLT19dARrJj5P
         UP+mwa6nn8yLQqOM4ey1y30AVhdubeBWoIsho2+1lIzIjN/KyueVx20VvSAUXfV97i2Z
         bO77VZXqZrozkyX/ZmWpfsuhUgzQFRcLSqxr3SnhkXKb82tIBz08cYw91rQevoxcjfm2
         VKbc0UvEhJoC4ylDjLE1i3VLJqm/AjUJxCoWEgpDdwKEsBB+a28iDoTtRWX+0lj37GM5
         kv2MKYygzR2XPphMAfIXsqKMBr4+K5/6Zuzt7xpHgfqt1lAw17thYBmKaHYrP52zm+1a
         0X+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c8oxz5+z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x129si5815287qkd.421.2018.03.22.10.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 10:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c8oxz5+z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33887 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez3wQ-00088i-T2
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 13:23:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez3wG-000884-8j
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 13:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez3wF-0002Id-5k
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 13:23:44 -0400
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:37354)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ez3wE-0002Hz-Va
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 13:23:43 -0400
Received: by mail-oi0-x229.google.com with SMTP id f186-v6so8034205oig.4
	for <qemu-arm@nongnu.org>; Thu, 22 Mar 2018 10:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TohuQrZ8hh0OSjq4v96Bg1ahElj6lVZOp+pKGTG7sto=;
	b=c8oxz5+zCGPkX/iJPRH14oIQSQ1mRkLsF8y6WIf8qISGvRB1OwRpOMaI6soFuxiIfm
	5tA0iUiSJ/ocEjngX35AHmrAzo+ptom4tm3ax8/OS54VvjVyOpzDQ47hMcjwnreJdnwd
	GDhSd67titIE2/WgGmfPnp3lpJkQuGZziN7T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TohuQrZ8hh0OSjq4v96Bg1ahElj6lVZOp+pKGTG7sto=;
	b=nEoGwIuHGceSgycFWPfe80+IpHC//YVtQWxZMtqLNjQkmXQP4N2qxLqQbjhhBdgoTV
	XXHJiv5SbzMiBiJnETO0jtLXFGyFaxvdHwfFm43/1nKGTJ4tL7eKnU8lkT/afKmrOnBC
	B6f9z/JF/t+GBFm8/glNt1zH0irj2gLjn+B21IXaggUwnnplt88pACeEaPrfImi7iLrM
	5h0eC1z4PrqUEpO4RUw9g8BGEFKmhVE80t1diLzhMvF4DSHLURmgcAP2oQm0T94R/FGI
	M83rOgLkl8vMehOPXEOrTyDq7pzWzC9NMcOqCVbJBfN4er80q715HI7wZJFm7vYOtvD9
	v9dA==
X-Gm-Message-State: AElRT7EQ2Hevzn1blXwVWsCF0EtX5Uen9m0fMprpjZH+2c9K6DaC1JCe
	CO8g2MFRDG+r/oQJbBFvsfiws+svRU7HASX0deAEZw==
X-Received: by 10.202.63.85 with SMTP id m82mr13357686oia.252.1521739421946;
	Thu, 22 Mar 2018 10:23:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 10:23:21
	-0700 (PDT)
In-Reply-To: <CAMo8Bf+K_XCsZ2tLVT15v5v0ssEbGSmYj+HuT-x5UMYZTKBZ4Q@mail.gmail.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
	<CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
	<6fd26097-aa7e-38cf-0d9e-09d0d36bd88b@redhat.com>
	<CAMo8Bf+K_XCsZ2tLVT15v5v0ssEbGSmYj+HuT-x5UMYZTKBZ4Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 17:23:21 +0000
Message-ID: <CAFEAcA8iVaYmnCgQ9-2D=3w_sf6Zs_oAvXBDPL3KVBpomA3PxQ@mail.gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-arm] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Alberto Garcia <berto@igalia.com>,
	Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Eric Blake <eblake@redhat.com>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KMIjQgNdBKuE

On 22 March 2018 at 17:19, Max Filippov <jcmvbkbc@gmail.com> wrote:
> Ok, I can add a fixup that changes #include <xtensa-isa.h> to #include
> "xtensa-isa.h".
> Adding #include "qemu/osdep.h" there seems pointless to me.

Every top level .c file must start with including osdep.h.
Other headers that it might include rely on that.
It looks like these files aren't actually top level .c files,
but are only compiled by being #included from some other file.
Our convention for that kind of thing is to give the file
a .inc.c extension. If you follow that then clean-includes
will skip the file rather than trying to apply the requirements
for a top level .c file to it.

thanks
-- PMM
