Received: by 10.223.150.237 with SMTP id u100csp3684727wrb;
        Fri, 10 Nov 2017 04:11:36 -0800 (PST)
X-Google-Smtp-Source: AGs4zMY0OfHJgvXWov4sP00/TrRX8tXyt8s/B9XJ6lklJcjT0pvCiYvMnz9HvZDgOLfBUDJ1+2nx
X-Received: by 10.37.91.135 with SMTP id p129mr102530ybb.366.1510315895997;
        Fri, 10 Nov 2017 04:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510315895; cv=none;
        d=google.com; s=arc-20160816;
        b=KmNsM0ovjPE2/s0/Y9naV8F8Wha3aOonvgtR0oHZ3T644txQCTavkRzIQhVxRdfa8P
         EBgHx3dZvvnBTsUSHh4v1z+JKpt0HPp79OHBe9B6rlRcaILBWGZq5xdTHW3dH8j7ktdv
         SFuRVnePRlboOGBAOjbvtQI2UPi10kpeUwBgkL6ZdShsB54DCo08wGD0FrVnWRZFGYSG
         ghzGai0+ZwKxpp4fpnZ5pOn/Yrx7nroQ3MvJd3Lexbx23ztiVfzpK0I1rlwl09r4doHt
         lU3us88pdhK++wjXpW80z+xbBXN+A51Or7twMv4Oa18FDly1a7LHq+tdnr/PlDRaLXVn
         uaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=txuwE/Sdlno2BDx6uk8gJ1vy5Rl2My35GgPXXcP1yD8=;
        b=A4Ve67eR7m4wqOK7qX9XAc4U8XlJrX1O6LGMrwn2hm+ST4x33HPrNlFnuaBnscUtp/
         DA7rpwP7X29EWl2yzRrRgQHSmoQJIKFNWHphRqLQguYL7bunFEAU/V3TZzYX9ywUGgfG
         ITqkvipGGaQv3oSfyeICJYvb6fA3VO7SXSzGlYLeQZmwyOBNQpvH2BDFwxpaW1+DCYyl
         GrD8c6t4eweo84Az85Miv2buH88hS5gY84rZq98JUi/zNBRvXILzXod72LVHc1VgeNzr
         Yl1BTWlO68EN8wzeuHC9+o3+d+2J/BWrZrQYzc3d5SmyAsGDEdovPmgwJOLpLZsFLKJn
         3shQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j8dV5mzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g138si2243923ywb.730.2017.11.10.04.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 04:11:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j8dV5mzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eD89n-0007Qp-Ck
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 07:11:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eD89f-0007Qi-2l
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 07:11:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eD89b-0006dR-Sl
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 07:11:27 -0500
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:49952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eD89b-0006bL-OU; Fri, 10 Nov 2017 07:11:23 -0500
Received: by mail-qt0-x229.google.com with SMTP id p44so1056432qtj.6;
	Fri, 10 Nov 2017 04:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=txuwE/Sdlno2BDx6uk8gJ1vy5Rl2My35GgPXXcP1yD8=;
	b=j8dV5mzCl+JxmxpXILscv1voflk7hfixjA7QaKlo+9UxrAT0elWBFLuIrXJMzLtDA2
	delmEpeW4SMXfc+qoZb5NnH1bD+H4phuvk9AhThUB5mJtCF+ZGOeMe76w7WhZIkMPTxk
	EqU1Gg6asni4l7CktvF96xUbnvjgSFxyMZ7V3q5Kf/IgYrCkQSw88st0vzA/IOcaFCCG
	Lml5AO5qa6Vr1X2GM2J84QAa92z6ZcQ4tlN9Y6NUf5fNpli4sWCuJH/jgjV2lS6HVdA3
	PZy8avvV+iQst8p/sVeDfv8xvO/jpJOviT+M/kjlVPBReY4Py1+wMyaHkgF0poVAPhA+
	AlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=txuwE/Sdlno2BDx6uk8gJ1vy5Rl2My35GgPXXcP1yD8=;
	b=kI4DcE3JPdofguyoTZyoG17vP+CgBoKsPeS4Xt4x2OliLi5w4BMwLgmkqInKq3d9+o
	2Y/V7kkbQS9+lItzSsJT3n+h7IA/dViKagvgojabhGrVMFsGYIsvsdq7JIOpRQz+ZE20
	1sDXkZjj2duprCKGmvA/Th5yqmMSewJV/MBq78fh98Gn/C1e9mZMmlUc1eFFvPNig25a
	CIab0hLYOpS0UoCyMoc3Ut5kwGiabqyyrXmuSO5q120GYKWPujBGmpdUoexOKlpntuZz
	97KGyu17kSdOMsRHgFojuQ0JZCbFbcLnwH2ndbv+Iw5ZWEcd1PQaI69YpqXUQrMJK2vr
	qByQ==
X-Gm-Message-State: AJaThX4qz5fv2RtSNMx9XndeOAcoDuxRxjtFLfBEX2rTo0+SAp3wOrnw
	YHjV8FojlKC1DYZq+aBxoSc=
X-Received: by 10.200.2.175 with SMTP id p47mr187209qtg.242.1510315882985;
	Fri, 10 Nov 2017 04:11:22 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id x3sm6080113qke.82.2017.11.10.04.11.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Nov 2017 04:11:21 -0800 (PST)
To: sundeep subbaraya <sundeep.lkml@gmail.com>
References: <1510228971-6005-1-git-send-email-sundeep.lkml@gmail.com>
	<4beb4e47-0ff9-8251-6502-23824779edbd@amsat.org>
	<CAFEAcA-ATtAougvALVo=48p+jVx5B+Ejq60TD9dGYEQU2ReWCQ@mail.gmail.com>
	<5a7b721c-fe04-921b-b9d2-986c9930b00b@amsat.org>
	<CALHRZuroyXXzxcWW0XX5fzQ9m8Zh0oZy8RivtiQjzKdHoxQ9WQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d3271bd0-41a9-90b5-c84b-e8ba9ec1585c@amsat.org>
Date: Fri, 10 Nov 2017 09:11:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CALHRZuroyXXzxcWW0XX5fzQ9m8Zh0oZy8RivtiQjzKdHoxQ9WQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dfzg5fHjky0S

Hi Sundeep, Peter.

>     On 11/09/2017 08:55 PM, Peter Maydell wrote:
>     > On 9 November 2017 at 21:46, Philippe Mathieu-Daudé <f4bug@amsat.org <mailto:f4bug@amsat.org>> wrote:
>     >> Hi Subbaraya,
>     >>
>     >> On 11/09/2017 09:02 AM, Subbaraya Sundeep wrote:
>     >>> add voluntarily myself as maintainer for Smartfusion2
>     >>
>     >> You need to share your GnuPG key signed, I couldn't find it using
>     >> http://pgp.mit.edu/pks/lookup?search=Subbaraya+Sundeep
>     <http://pgp.mit.edu/pks/lookup?search=Subbaraya+Sundeep>
>     >>
>     >> from https://wiki.qemu.org/Contribute/SubmitAPullRequest
>     <https://wiki.qemu.org/Contribute/SubmitAPullRequest> :
>     >
>     > I don't in general expect to take pull requests from
>     > everybody listed as a maintainer in the MAINTAINERS file.
>     > That just means "I'm going to be reviewing and should
>     > be cc'd on patches". Pull requests are sent by people
>     > who are maintainers for a subsystem. Rule of thumb:
>     > unless somebody asks you to send a pull request, you
>     > don't need to do it.
> 
>     Ok, please apologize my misunderstanding. I still think the M: entry

Peter: Oops :) read "I apologize"

>     stand for 'Maintainer' instead of 'Mail', and still don't understand the
>     difference with a "Designated reviewer" (R: entry):
> 
>             M: Mail patches to: FullName <address@domain>
>             R: Designated reviewer: FullName <address@domain>
>                These reviewers should be CCed on patches.
> 
>     "Designated reviewer" seems to duplicate the M: entry and is therefore
>     confusing. Can we simply remove it instead?
> 
>     When introduced in fdf6fab4df4 the explanation was:
> 
>     --
>     Some people are not content with the amount of mail they get, and would
>     like to be CCed on patches for areas they do not maintain.  Let them
>     satisfy their own appetite for qemu-devel messages.
> 
>     Seriously: the purpose here is a bit different from the Linux kernel.
>     While Linux uses "R" to designate non-maintainers for reviewing patches
>     in a given area, in QEMU I would also like to use "R" so that people can
>     delegate sending pull requests while keeping some degree of oversight.
>     --
> 
> Do you want me to remove M: and put only R: ?

No, it seems you are correct and I was wrong :)

If you agree changing the first section title to "SmartFusion2" and
eventually the second to "Emcraft M2S-FG484":

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Regards,

Phil.
