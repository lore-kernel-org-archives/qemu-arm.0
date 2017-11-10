Received: by 10.223.150.237 with SMTP id u100csp3770713wrb;
        Fri, 10 Nov 2017 05:40:49 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZVsPm3244uK0TcIP8bAaymLvNko3qELhGX3I6seSxbCRn1P6Rs209R2BqOSzNOAAK6xbCb
X-Received: by 10.129.179.137 with SMTP id r131mr286302ywh.286.1510321249172;
        Fri, 10 Nov 2017 05:40:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510321249; cv=none;
        d=google.com; s=arc-20160816;
        b=cZh9fYtM3pNiebocrUSawn2ZOoQnzzxZemS4Kp3cSDhlRFkU5bjpz52WZ+7UbAh0kB
         ZytFDs9dWzyhoKGZkBoyFlNEkOkPq/cDYLmPWRSVVAcRU+5lAYPx7ERQeR7gEm8SDDUr
         ZwLUOyJglbgbbLELQdHVPwkLtvjETRJSNioPxokEouShYfoH4fRTzHtNpCjzriFZe17V
         0YEoyGcdfA/dVRnPvWMa1SCATLQwx5eP6Fat8EdhiPAZ/1QjWAc0ZGI12CbtfEUr6Y/X
         5+CkrkKg1PbSwisiSSitD0Dda9bEnXyhTKfHMGX26LCy48y2Qt5p9gb0rMbFk9b33hUh
         LXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=7tAhAKyj6503d5dSdbyX+pN3PUE/RUTkvu7Ftbnr0fY=;
        b=r552xAch8OERgWAjmivAZOQbZHB/dE/E+zpHOfos/hPa+LOe3i/bizqMwKQDFMrtqy
         njca2XEm3qm+HoymhrjZnvN+OrAJEK61JbWv6bdWh6r/tGWxCpOak+bsNt8Zn6FJhV6T
         IfGKUXx3KjXG4i3bqy7TBQTQz79LRkk65NSJ7wNFYgii03rsUmrcfOR2h/dJa5VXKr8k
         Dk763/+hh+A0G0prPzGT6bW1e5FQW2rWKiomxuhQwUTjWygOzdleVwDyEUDd6WPXbtMS
         xX7hoQivFLP6zfudLrG7PnKtjQQ/6wI7RRcT4PyNX776k++t7/sOsX04Fj8wD4lWRY3d
         rLjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qmYZ6qxo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f130si2241297ywa.339.2017.11.10.05.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 05:40:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qmYZ6qxo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eD9Y8-0001Dk-M7
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 08:40:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eD9Y1-0001DT-4t
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 08:40:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eD9Xw-0001Bx-4J
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 08:40:41 -0500
Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d]:44173)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eD9Xv-0001At-W5; Fri, 10 Nov 2017 08:40:36 -0500
Received: by mail-qt0-x22d.google.com with SMTP id 8so11833523qtv.1;
	Fri, 10 Nov 2017 05:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7tAhAKyj6503d5dSdbyX+pN3PUE/RUTkvu7Ftbnr0fY=;
	b=qmYZ6qxoSowUdK4Ic7PliDzRaRl45u3rTYZEY06qf7+HfhGR1UQogIRHZieX3FKvht
	xcARC/LdoiVnrTU/mJLE9Xd59Oci+rEbTuqLmUlbJ5bH2JJtrd2OV0S4O8e+C8MFsTR+
	qn035qOUnqG+vD2N27AVgWIfmP0v1F/zSE/uqDXYqi2cSymk6v+iaj5uSH9gJhYnvxPb
	X4MVAzI0RUL1E4rA2A7ybb/m0Kf/0341Seb/HgPRlZv9RjrwK5OoEm345a2rorFRx5Qf
	Uzl1SGxZvENz0rHZGtECbGgfSS3JIz5sqJ43cYFFWfz0t77vRPQ03K7bDmiAmkp20xT5
	YtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=7tAhAKyj6503d5dSdbyX+pN3PUE/RUTkvu7Ftbnr0fY=;
	b=KqWd6SuZqnckG+8kk8FXCrdVOh93/lmvGCVtyaDF2uameK5I7cd71/0xoBX0bsmgHZ
	xadLiqZoPFV8a3fot8zVVb4cMkqDVoI0O6wLu5BroLqGAGTAGHhRh0his6k+v2bNI5m/
	OxrvWTxJBLFOkbpHSJctpNaejSxcRWRoWHGTfAe3g8GNg8uys1iqW1+w9CdsyVPQAGXc
	NYqarXrNaJzjUJTEzj6sGkkCcueEQQ6JfeDafxIQzQKZSTpX8pzqQ9Fsd1WGkn8IeRDM
	WbfZcLBtGZSZx2/L4lJhDbRSb+oG/QXi73eit/pgREYjY96Lz0uuOL7xx7TrOZzPX+uk
	eTvQ==
X-Gm-Message-State: AJaThX5OF68yaait1cc1x4qNZrtLuXr1qyARGGWotiWnPOqMzCQvowvA
	yPewsSKrXEDN0AbqENml9WU=
X-Received: by 10.200.49.92 with SMTP id h28mr617485qtb.340.1510321235361;
	Fri, 10 Nov 2017 05:40:35 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	x80sm6319782qkx.33.2017.11.10.05.40.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Nov 2017 05:40:34 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1510228971-6005-1-git-send-email-sundeep.lkml@gmail.com>
	<4beb4e47-0ff9-8251-6502-23824779edbd@amsat.org>
	<CAFEAcA-ATtAougvALVo=48p+jVx5B+Ejq60TD9dGYEQU2ReWCQ@mail.gmail.com>
	<5a7b721c-fe04-921b-b9d2-986c9930b00b@amsat.org>
	<CAFEAcA_0jvR90=N9Pd+oA2U6Yy=oF7vvNV67cEAsUYQFcup9KQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <7b0613ba-5efc-0fbd-1373-664838e6682e@amsat.org>
Date: Fri, 10 Nov 2017 10:40:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_0jvR90=N9Pd+oA2U6Yy=oF7vvNV67cEAsUYQFcup9KQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22d
Subject: Re: [Qemu-arm] [Qemu devel PATCH] MAINTAINERS: Add entries for
 Smartfusion2
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BcBk2l6kHgk/

On 11/10/2017 09:56 AM, Peter Maydell wrote:
> On 10 November 2017 at 00:22, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 11/09/2017 08:55 PM, Peter Maydell wrote:
>>> I don't in general expect to take pull requests from
>>> everybody listed as a maintainer in the MAINTAINERS file.
>>> That just means "I'm going to be reviewing and should
>>> be cc'd on patches". Pull requests are sent by people
>>> who are maintainers for a subsystem. Rule of thumb:
>>> unless somebody asks you to send a pull request, you
>>> don't need to do it.
>>
>> Ok, please apologize my misunderstanding. I still think the M: entry
>> stand for 'Maintainer' instead of 'Mail', and still don't understand the
>> difference with a "Designated reviewer" (R: entry):
>>
>>         M: Mail patches to: FullName <address@domain>
>>         R: Designated reviewer: FullName <address@domain>
>>            These reviewers should be CCed on patches.
>>
>> "Designated reviewer" seems to duplicate the M: entry and is therefore
>> confusing. Can we simply remove it instead?
> 
> I hadn't realized we had an 'R:' tag in MAINTAINERS...
> 
>> --
>> Some people are not content with the amount of mail they get, and would
>> like to be CCed on patches for areas they do not maintain.  Let them
>> satisfy their own appetite for qemu-devel messages.
>>
>> Seriously: the purpose here is a bit different from the Linux kernel.
>> While Linux uses "R" to designate non-maintainers for reviewing patches
>> in a given area, in QEMU I would also like to use "R" so that people can
>> delegate sending pull requests while keeping some degree of oversight.
>> --
> 
> So, my view, based on what happens in practice:
>  * "maintainer" means you are in effect accepting some responsibility
>    for the continued maintenance of some bit of the codebase, ie
>    you actually will review stuff
>  * "reviewer" is a bit weird but I guess is just asking for cc:
>    without promising to actually do anything
>  * somebody who sends me pull requests is effectively somebody we've
>    given the ability to make direct more-or-less unchecked commits
>    to master, so that is given out more sparingly and for larger
>    subsystems

Thanks for clarifying this!

This is more understandable (to me) than the "QEMU Maintainers" section
entries description.

> But MAINTAINERS is mostly about what submitters need to do (ie
> who to send patchmails to), so it doesn't particularly document
> how patches flow onward into master, which varies. (For instance
> the block layer folks have a two-level setup where some trees
> get merged into others before they go to master. ARM devboards
> go through me, and "maintainer" just means I let somebody else
> deal with the device specifics if possible but am still the
> reviewer of last resort.)

Ok :)

Regards,

Phil.
