Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp1252041wrw;
        Tue, 6 Nov 2018 11:00:37 -0800 (PST)
X-Google-Smtp-Source: AJdET5dJPOvfELzIberyhLn3gUaG/j9D+OVluxCVk+F1rwnlRq7NLFmansRfoduSNDJwgLb9//BK
X-Received: by 2002:a0c:d174:: with SMTP id c49mr26649807qvh.231.1541530837634;
        Tue, 06 Nov 2018 11:00:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541530837; cv=none;
        d=google.com; s=arc-20160816;
        b=qskOQp0B5EGguj8X0lSU1aWqlOhMjM2SiHXFx/1xJTzOOKFR4CAdQPXP06XNz5ctIS
         ngvEiFxUceUCcHa7VyOy378UtAWdnxt650GHsBt9pivnvgwJIxRf8x/mz65YJu6zghiY
         +CxkP5xBxlbueRGuA+NztX0fi8e+6dlfGE4LWxTVVShftIzPMumucY1kn76NpKBOP/iZ
         Lld93UYc3stMXPDV5jpNuD/C52KXZhyTM5uANNRPSU8hTCxG/7hiOM7qr+u4kisdosxE
         i2yRLRF5FvELYvPvokxRxNRh13N/wk4wCCDH6V0nn01O5sZXjHW8agoN5XgI09bCkvvf
         w1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=x/h2a62yaQ8XPANLQfpVMG4VpkDiIlkg4d1In74VMT8=;
        b=fCu74c/xAGGRUujmfOXGgGI4kSaXZRjura+6y2X4IfqPACjpQgXdiRZHSXxY1ognYR
         H9eWEoqICA9KqCbzH+SpGExRfX3IksbV0xlTljnIHIj++LKiL1la5tuZ5RD7rdm/eC6I
         t3UWqourS3lP5cC+HTdr/cJ8iveypPBv1rfndV1wAd6yhZ8vJYCceWcl/FNL1jetIPMz
         vbtntafYWwrGi/97zZPrkgHZywarhKhyD2YQB5XMvtnTXpvekmSJGWe9qBxcVEW93gur
         wQNWhn6ND7dvNrIK2s1P4XssdYZ1qY2N2F8Tximpg9sMCbiY9je4BnqpwS7rJuAO5K0h
         Gd3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oibj36oJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k67-v6si3630796qkc.125.2018.11.06.11.00.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 11:00:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oibj36oJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gK6aa-0006l4-Qt
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 14:00:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gK6ZL-0005uB-HB
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 13:59:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gK6ZC-0002lJ-Tk
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 13:59:13 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42655)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gK6Z9-00025D-EL
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 13:59:07 -0500
Received: by mail-oi1-x242.google.com with SMTP id x63-v6so7960210oix.9
	for <qemu-arm@nongnu.org>; Tue, 06 Nov 2018 10:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=x/h2a62yaQ8XPANLQfpVMG4VpkDiIlkg4d1In74VMT8=;
	b=Oibj36oJRqtcyM9m4x7sDbM/q/GR7bK140fwjRSECAT/DE+TV6eXjeytQD480V+3cZ
	0Tt8Pt82NdK+/kw7Qu66+tQ6B837S+DzZ8a1ehDfr6KHd4DKpx1bgZ9Ip1ulhkNPrPGI
	t6XSZg9ZCPpISRG6BjdqFzsaBeH99tR2EXqPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=x/h2a62yaQ8XPANLQfpVMG4VpkDiIlkg4d1In74VMT8=;
	b=bAzEZeAtb28nyAKCdB4E2kBxFI6qQFwe9d3qMT/wj1t0RFzhRdvgQFTVvDG54EIp20
	+dPl6Cf5S1G1kzAv20gOTtINGmfblI16RgXHFBk+Y8IJuwWZGKjmDLQvZ5fcjrWagOyw
	v/0CPE6maHBnCHxBJzFolHCUqgNWREYiN/ShTQyNpvXRDENHyQ8BzDNHB0UIFQw4EKYm
	h/BVz3k4qKbh2yU7vI/XUmnrAZEefgPQaQMExqFVhlhPbAQinE2xnXGO029E5tqbvUMV
	PJY6ehyxISKwiKHzwVazpKF+HEZ/0Zw/QwpLJiGt+OwT4+AvAcaVgp47h6vDPhC7+DgO
	bqaQ==
X-Gm-Message-State: AGRZ1gLmJ1om939NJZrYQMlKAgVjb/2yUIBA7Ou9MoUwD6u5Sv0l+2X3
	oV3byxqw98UyvEoZfWjPLighB3wnG1eHZA76gJh3EA==
X-Received: by 2002:aca:b68b:: with SMTP id
	g133-v6mr4494535oif.25.1541530744823; 
	Tue, 06 Nov 2018 10:59:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Tue, 6 Nov 2018 10:58:44 -0800 (PST)
In-Reply-To: <12974ebb-09de-c6e9-1dd7-5199a8ae6b05@redhat.com>
References: <1541528230-31817-1-git-send-email-thuth@redhat.com>
	<c0febf9a-f098-112d-9c8d-c320cc66b04a@redhat.com>
	<12974ebb-09de-c6e9-1dd7-5199a8ae6b05@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Nov 2018 18:58:44 +0000
Message-ID: <CAFEAcA-B74FQgj3COyGZ_SAAvSUA6=OaLdy5--NoAgHgEGZkpg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] MAINTAINERS: Add an entry for
 the 'collie' machine
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
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tHu7Lx5LIToa

On 6 November 2018 at 18:52, Thomas Huth <thuth@redhat.com> wrote:
> On 2018-11-06 19:49, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 6/11/18 19:17, Thomas Huth wrote:
>>> There is no active maintainer, but since Peter is picking up
>>> patches via qemu-arm@nongnu.org, I think we could at least use
>>> "Odd Fixes" as status here.
>>
>> This looks more as "Orphan" to me...
>
> I'll leave it up to Peter for the final decision...

I think we're not very consistent[*] in our usage of the various
statuses in the MAINTAINERS file. I guess "Odd Fixes" makes
sense in that, well, if you send a patch to this
code and cc me I'll review it and put it in the tree. (This
is true of any of the arm boards we have.)

[*] We have one thing tagged Orphan, which is bsd-user/,
and some things tagged Odd Fixes with no listed maintainer,
and some things tagged Odd Fixes which are in practice more
like Orphan (for instance sh4), and we list "fpu/" as
Odd Fixes despite having given it a pretty thorough
overhaul very recently, and so on...

If you wanted a mechanizable rule, you could try something
like "every file which is in status Odd Fixes or better
must list with M: at least one named individual who has
submitted a pull request in the last nine months" :-)

thanks
-- PMM
