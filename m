Received: by 10.182.105.169 with SMTP id gn9csp529766obb;
        Thu, 5 Nov 2015 07:32:31 -0800 (PST)
X-Received: by 10.31.32.204 with SMTP id g195mr1277783vkg.2.1446737550792;
        Thu, 05 Nov 2015 07:32:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 135si4918607vke.173.2015.11.05.07.32.30
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 07:32:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:33060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZuMWc-0008TO-EX
	for alex.bennee@linaro.org; Thu, 05 Nov 2015 10:32:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuMW6-0007rU-Bf
	for qemu-devel@nongnu.org; Thu, 05 Nov 2015 10:31:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuMVy-00036A-Rp
	for qemu-devel@nongnu.org; Thu, 05 Nov 2015 10:31:58 -0500
Received: from mail-yk0-x22f.google.com ([2607:f8b0:4002:c07::22f]:33891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuMVy-00035x-Lz
	for qemu-devel@nongnu.org; Thu, 05 Nov 2015 10:31:50 -0500
Received: by ykdr3 with SMTP id r3so136556315ykd.1
	for <qemu-devel@nongnu.org>; Thu, 05 Nov 2015 07:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=f+KjdLhlQ05hPuv6xJMO6mq5opdmPDZQ26HehNkKdlI=;
	b=APLdhti6Cnj9R+bMeNCGG5HbF27hfs+TXAdKYwQIFrpmjaIpJJEQyMTnk7/FIz/yhO
	N7iNZ8r8ntREQK2R428zXS5W/01dSQZkPXyfE7NgJAu012V4euvGvXSJayXBkYl0FOUx
	FEsA6xaKGrrUS6ConzTKi0wuqw1CFrqvcKBZA/x2vBVX/UDHMqMxX9zAc7N9j25QQD1a
	hpSylZD2bOW8O+Ur6oiZF7GqN6Tr0b3bczdB+IR0hkBfHv/boPkgeIqcDU4qAflZeOOc
	YPKDp/chzteoXbdtpb9Qvii5kAWPdnOcQzOIpqh5kYr8+ZIrY6HJ7ManKOFhVhD2siOR
	z0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=f+KjdLhlQ05hPuv6xJMO6mq5opdmPDZQ26HehNkKdlI=;
	b=IdqbY+/Rlt/56jWj+enTtLYO7r6k+Vkit+s2socH1L6KTX6xxNgInd/uHFmoC9wqp2
	eWPUden7DILFazPQ1emTROUb1NSjWpB0mnhIRKCgGh9KxU3r3glb2pNhXUt9/+WO8xWZ
	dxS0kvJwREv/tYIw8VTrtD7CFxGsroK7g9opwyfgVAKqWTIHALvEgusZBB31irjWRAWb
	LbS3aG+ZIWDm4EUalDmcFWJTR8MtrA2R9ySnW0+3EFbKmRHNVpxhPNF2UvGuIaO/l55k
	NitM8Q26g54aMmszzVFBFQO4LBTOgYL+O8FX0rWzDZF80EauwMbGRq4snOdBHgd2iirg
	ejuw==
X-Gm-Message-State: ALoCoQmw0loQ3Ww1wK1mHPzD9truBLUcTJl6SBtiDjdZNXecdS9dYED3kMGGmrgIT8Mw6GgotymW
X-Received: by 10.31.107.81 with SMTP id g78mr1728238vkc.6.1446737510244; Thu,
	05 Nov 2015 07:31:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 5 Nov 2015 07:31:30 -0800 (PST)
In-Reply-To: <1446736357-17610-1-git-send-email-wei@redhat.com>
References: <1446736357-17610-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Nov 2015 15:31:30 +0000
Message-ID: <CAFEAcA_9bk0DONJPK3DtDN-_Ym53TDq-83pzGg9-JSt3LTdcNg@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::22f
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH Trivial] hw/intc/arm_gic: Use pre-defined
 macro for cpu_num in code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N2yPMmw3cnW6

On 5 November 2015 at 15:12, Wei Huang <wei@redhat.com> wrote:
> Given that there is a macro, NUM_CPU(s), defined for CPU number in
> arm_gic.c, it is better to use it instead of using s->num_cpu in
> this file. Code is more consistent after this change.

Hi. I think that actually since the NUM_CPU is just a relic from
when it used to possibly defined as something other than s->num_cpu,
we should go in the opposite direction, and remove the macro entirely
in favour of just using s->num_cpu directly.

(PS: you forgot to cc qemu-devel.)

thanks
-- PMM
