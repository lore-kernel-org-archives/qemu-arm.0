Received: by 10.25.21.96 with SMTP id l93csp469365lfi;
        Thu, 16 Jun 2016 12:43:10 -0700 (PDT)
X-Received: by 10.140.109.198 with SMTP id l64mr6642537qgf.65.1466106189928;
        Thu, 16 Jun 2016 12:43:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e74si21934778qkj.11.2016.06.16.12.43.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Jun 2016 12:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDdC1-0001nj-Ch
	for alex.bennee@linaro.org; Thu, 16 Jun 2016 15:43:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bDdBx-0001mU-QF
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 15:43:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bDdBt-0007uw-ML
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 15:43:04 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35290)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bDdBt-0007uE-HI; Thu, 16 Jun 2016 15:43:01 -0400
Received: by mail-qk0-x241.google.com with SMTP id b136so8926541qkg.2;
	Thu, 16 Jun 2016 12:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=pLIYAZc4NdqhFy+CGXpfO6Zz5bcekCQ7tEu3w4APFag=;
	b=cWdVMgOug5FrrTd0DtguXW/9W6ObtqRLrFA0XcLEALkQN8QYqWbc4baTdUiD+4/mC9
	J6ybvOMu+WNkdA4mpjNtnZB4AoFurgEWAFaZy1nwHjX8+iNOJz0CcKMuNtqhNlfn1hhW
	FMnh/ts+kI5lThFD3kE0zzPpQLeUanuo/F7j6uaGXrvTOz2eStJG3eDavhFD8Z3N2bIM
	1R89YwtkjOqzQN/6BA5jfVLZs/jZXvIWQQwYbrx7zaCImUXHE2H/zhp3lXFiTBp8s9VQ
	lEd8mF/xDC1l6TXi3km/RZ51G0T/+Jfzp6j2MYq8fFTctss560jcn0kcKRu0Q+8g+RyY
	VBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=pLIYAZc4NdqhFy+CGXpfO6Zz5bcekCQ7tEu3w4APFag=;
	b=Ck0bY6GCzzZ8gViqiahy8UzYJ4psWvDMBY3ZlYiAvKoxV1EStL+G3SECtvN2HxWiOF
	KWYvjfWvLrv0vUUfMV+AmL872vRFz1gN8bBnJW7/wL4ULdsN7THIUB8jGYijSDzIBi1i
	Ez43u2/noA0RPuCvtG34mzFaNkYpjiNwbing2/sSZUVJrOrEZCl8ysdlgZGGPGLThG0J
	u8TmQ4V2sxVYodEbtX+7LEmSo45IiHOTXISEpLJ/+qzCVxFGNjIgoQUgROslGdtytECp
	GFO4HtEciSPv7Pq0yVbr6oQv9E76tsN1/jstoBbx9/TfbxnJdTwzHO8b/gfVVjr3wIsx
	yFlA==
X-Gm-Message-State: ALyK8tJEDvmz2kRM/ztcLB0SNkhVwTPeewAgzgRxPpFBs/UzWgjG+0ioth0AGMeDc6Hr6w==
X-Received: by 10.55.214.194 with SMTP id p63mr7284690qkl.130.1466106180932;
	Thu, 16 Jun 2016 12:43:00 -0700 (PDT)
Received: from anchor.twiddle.net (71-37-54-227.tukw.qwest.net. [71.37.54.227])
	by smtp.googlemail.com with ESMTPSA id
	96sm11700706qgl.29.2016.06.16.12.42.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2016 12:43:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Vijay Kilari <vijay.kilari@gmail.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA8+qWep8E3+k30n1gTUexoTrqipg=bnxS5yYPNvfFpTYw@mail.gmail.com>
	<CAFEAcA_dBDhUEZr+mLPJkiiMRyjqUuXMaaYfZX3PUwZdKFk9uA@mail.gmail.com>
	<CALicx6tYEX-6u7anPb=kgvOtg4HQriC5oRJPQtZiMipeBJazVw@mail.gmail.com>
	<CAFEAcA-=iT1r1mJgr94JUP9XfMJ2XxxW47pMF3vZ6btdO=MnUw@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
X-Enigmail-Draft-Status: N1110
Message-ID: <c551cc85-ba31-63bc-9c23-8457ec4a6c12@twiddle.net>
Date: Thu, 16 Jun 2016 12:42:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-=iT1r1mJgr94JUP9XfMJ2XxxW47pMF3vZ6btdO=MnUw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH v1 4/4] target-arm: Compute
 page size based on ARM target cpu type
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
Cc: Juan Quintela <quintela@redhat.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <vijayak@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TyZL0EAiGHsR

On 06/14/2016 04:36 AM, Peter Maydell wrote:
> It would be better to delay the point at which we allocate
> the data structures which care about page size, rather than
> moving init of the CPU earlier.

It would be *best* if we could re-initialize and re-allocate these data
structures so that we can follow the current page size as it changes.

Yes, this might require flushing just about everything, but it's the kind of
thing that's likely to happen only at system startup.  After that, everything
benefits from having the correct (larger) page size.

> Also we should consider what happens if we have decided
> the page size is X, and then a CPU is hotplugged which
> requires a page size Y where Y < X.

Is that a real possibility?  Or trivially true because the new cpu has yet to
be initialized by the OS to use the regular OS page size.


r~
