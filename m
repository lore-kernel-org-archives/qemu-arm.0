Received: by 10.28.71.155 with SMTP id m27csp634597wmi;
        Thu, 22 Mar 2018 10:42:34 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsIKQdWOcHdj27WdyOxaiiLYnqfSoq/6pyxX8zVn4JfpKlrrFRT51kza78z4vC/aEbHAjfo
X-Received: by 2002:a25:6ec5:: with SMTP id j188-v6mr15298907ybc.94.1521740554644;
        Thu, 22 Mar 2018 10:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521740554; cv=none;
        d=google.com; s=arc-20160816;
        b=mkdw10Ah79LwwcETjajJItxvspSVzCwrLIIhoz5DmJCJURYX0S45PVcMcZJZClH1mK
         pXn5jAvMkzKze9XBRKtsT3jb8+Y5mVtelkv0xZOEc5jEGqENLeD9lR40fysrDIpZ1Br3
         eHLDozDT2vWx+j9lOoB9vBGQq3+0IgDJTaXgxzQAurH2gFFbviPPs34Uv5NNh4GRXFZ8
         hkSm3I9L222EJ4PeS8SwgHH4L8uAt4IAeoAxjuLtpvixMeZfE4y+rHyRahM96IpS9gqY
         7SIJsl4QTz54QdM8nNIUeojQDv0X40FYjBF1SQQPtJEC6MRkraP8JrG5qXucXdSGr6Ci
         t7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=53Xrb8r2MbypbpD835QHDw+xwptuXVUTEmstOZalxRo=;
        b=mtKNEiFLymCgRn+8v7FnVXvFJwcM4RKsB9o1EuHnUT2pXrPjz9/zuLkYiW9zGN5MTJ
         v3CUlP/y5A9hdBVFMj6mmAclns9ShyZb1qBMsq7nyfa0O1KN/45eHMLBVNJ0v+jMmBAN
         2+JFrHc8oJuzmr5/7WtC/y+39zTi1+HculPK2d3f562o9gAo2fvqnD/cKibE6oGuSDNF
         awXxs9NacIHzNS5SH7hgGL55rmCpB77Gih5SW4n1aUKWC1G2NaxOdn5W/Sr6Y2Edg5+v
         /RBHZE3NGYYpOYHta7RM4u1dioi8sVf9ygBz8cD0KpEeT383/gPF91/cb2zywJqWgfO1
         NNhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nn00tKwN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z65si4498058qkd.279.2018.03.22.10.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 10:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nn00tKwN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez4EU-0000Ls-53
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 13:42:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez4Co-0007x9-7y
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 13:40:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez4Cn-0003dV-8a
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 13:40:50 -0400
Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b]:41201)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ez4Cn-0003ck-33
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 13:40:49 -0400
Received: by mail-oi0-x22b.google.com with SMTP id 6-v6so4610078oip.8
	for <qemu-devel@nongnu.org>; Thu, 22 Mar 2018 10:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=53Xrb8r2MbypbpD835QHDw+xwptuXVUTEmstOZalxRo=;
	b=Nn00tKwNhLk4thz8iOMb4fy5TUL2LSUm29YYOrRqSAR82xySavU04dZAAM/CyU+wCQ
	M0397iNL3p27m/x3CHC9LXHwR/rpMBwwkAtMwG+GKKqFdYWEMjg8RJZai/gzg6MzYH/P
	oPkOOjCysyA75X1KYbzO5cVWCRR0GpDSJSUwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=53Xrb8r2MbypbpD835QHDw+xwptuXVUTEmstOZalxRo=;
	b=ZBMYEVIgInF0++6NesCEW4HYUOGq5QV/FD5K0SfDiRp+rotJAWtrwfBKVzSeBc9Xyf
	fRhu5lUz0WX1lPbepE0svcchDSIB4P+QOfDQQFLpdJUK5riEiYbnVf3ZOoZHmHlyIaDj
	yR9hqvUVJ/ZDCqOlwLR9MFUhQaBirHl5D52H/ytr4N+nDX+eJhcYFYFRNIHPCs4jdVWN
	4+3ktdJ0q0SkeTLvNnsSQaClGbqaQM4IarjkJoHdKXj0lNH+eSwrD8tCe0uzfDy+vWq6
	vgKi/tWCROqKA+wYXCcXsktpSqzWKbuT+Vv4QEgs0cGCJAhYHlEw78lrvZpKjYMS0gm5
	ctoQ==
X-Gm-Message-State: AElRT7E5mWuqUNe1lrX8F6fDAUsnSTxDfPY/jSpBvjb0ykPuU04F8WNH
	lyKftVkhrzel+3DOPORa4UNP8/pTnhSWsQhFHcdXVg==
X-Received: by 10.202.178.195 with SMTP id b186mr13743297oif.337.1521740448239;
	Thu, 22 Mar 2018 10:40:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 10:40:27
	-0700 (PDT)
In-Reply-To: <4886c0dc-e017-8e39-649c-058b5f7b65f3@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
	<CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
	<6fd26097-aa7e-38cf-0d9e-09d0d36bd88b@redhat.com>
	<CAMo8Bf+K_XCsZ2tLVT15v5v0ssEbGSmYj+HuT-x5UMYZTKBZ4Q@mail.gmail.com>
	<4886c0dc-e017-8e39-649c-058b5f7b65f3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 17:40:27 +0000
Message-ID: <CAFEAcA85YZB3_k2o0QQtbboaYr=t5k5=ePUwuc0qtcq3ioDwvg@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22b
Subject: Re: [Qemu-devel] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, Qemu-block <qemu-block@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cN5eoFaN7DaT

On 22 March 2018 at 17:30, Eric Blake <eblake@redhat.com> wrote:
> I'm less certain of whether our Coccinelle scripts have easy ways to exclude
> specific files.  We already have scripts/cocci-macro-file.h to help
> Coccinelle not choke on some our existing files, but I'm not sure if
> Coccinelle has a config-file like way that is easy to maintain as a data
> file in-tree for blacklist files to leave alone (right now, when I run
> Coccinelle, I have to manually remember to pass a long command line cribbed
> out of the commit message of an earlier run to pick up things like
> cocci-macro-file.h, instead of an easy formula that points to a single
> config file to pull in all the usual options).

Coccinelle itself doesn't seem to have a config file mechanism.
We could probably approximate one by using a wrapper script
that skips some files and run the passed spatch file on the rest;
scripts/clean-includes has some "skip files we don't want to try
to run on" code that could perhaps be generalized.

thanks
-- PMM
