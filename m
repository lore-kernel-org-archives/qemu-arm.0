Received: by 10.25.208.137 with SMTP id h131csp1510370lfg;
        Mon, 9 May 2016 04:21:44 -0700 (PDT)
X-Received: by 10.55.91.194 with SMTP id p185mr36307519qkb.182.1462792904006;
        Mon, 09 May 2016 04:21:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32si3262199qgt.125.2016.05.09.04.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 04:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40645 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azjFv-0007C6-C3
	for alex.bennee@linaro.org; Mon, 09 May 2016 07:21:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1azjFr-00075Q-VU
	for qemu-arm@nongnu.org; Mon, 09 May 2016 07:21:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1azjFg-0003fF-Sw
	for qemu-arm@nongnu.org; Mon, 09 May 2016 07:21:38 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:33705)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1azjFg-0003f4-Pk
	for qemu-arm@nongnu.org; Mon, 09 May 2016 07:21:28 -0400
Received: by mail-vk0-x236.google.com with SMTP id o133so61413582vka.0
	for <qemu-arm@nongnu.org>; Mon, 09 May 2016 04:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4mcEN0h48uS76ZBrHZrYmjcay3Ukzz2dCiX1RtVuSz0=;
	b=BfUWBNUzlcbu+64qLOU4u5ISMGieib/mZdclYT7sSmE7Y7Cx/5TNKp1yfzW+/gA6V/
	miE6idg7ggBLTQb6JOmHBsXvvqINakE+7x3SLlrOJdrRDV+pCAVnPD75Wc8VA66RM2dL
	q2sYgDojh+FTpNJ+XRZ5O/U2Vl1lvjAIB9l+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4mcEN0h48uS76ZBrHZrYmjcay3Ukzz2dCiX1RtVuSz0=;
	b=gh4q8NLYro74gEZSjm4GQZqPPdWbDfJHkhxP62FgH47Ra4uqAiqsDQVYc/bDW63V1R
	jOya9WYnlBxw83yDalPetYeL6FWfhXFkn7jfvlgMB7MjzHzhyB/eLdZUHXT88z19V9Q/
	SvS47wsiE0GUbCaxDG8qUfoPmu+TlRhN+kKWM4xNqcA7kTEx1+M2W8+Dvh4PeIKHqjWp
	wqtXkM/S8zyuk7O/AlJv5RV1FOmicBZuzhl1B9QMgnfdtDpS/KiHTq5eP9UKpCAwkNAG
	B4FdThawLdzLGAQy+BKNJe3Pl86hJS+Uea6sQiOGroFZH6xvXFKyY9Bw6AyvVlsyHBYn
	F9UQ==
X-Gm-Message-State: AOPr4FWOEkUlezocNGrbTho+9ILzgG7s970QjCDLGBO/W2+/IiZgFJnBD74qEWV6k0ootl/K+b3SPjm5gcOIYvHI
X-Received: by 10.176.4.20 with SMTP id 20mr19743048uav.125.1462792887998;
	Mon, 09 May 2016 04:21:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 9 May 2016 04:21:08 -0700 (PDT)
In-Reply-To: <57306DA7.4010002@arm.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_0ssT32oNrgTHChKsAJNkjUfCHFGg2vPtk8-AWsRjVqw@mail.gmail.com>
	<CALicx6tM6__TWjVPLdNzMMpoyQYHZOnArFwz4E+QyyxN7TLruQ@mail.gmail.com>
	<CAFEAcA8T-90NFw_fMWRZ7JuQ4UpxRGfwsbHLi9cigsiD=zXupA@mail.gmail.com>
	<CALicx6ubAgfGJhGX5wRTeHfmj_RHX__hkJxAnBA8v=e8n=HgZg@mail.gmail.com>
	<CAFEAcA8pboFpZynTny60JRQYL0S1+HH6KoBy+de6iHOGOGBFCg@mail.gmail.com>
	<CALicx6vnEGxXA3yyzBg8VSHNns5kqvhFfVT23w_Hx7LLSkEq3w@mail.gmail.com>
	<570B7048.5010501@arm.com>
	<CALicx6u-LOA2gAc2f33a=VY0duHhtiHSZ=2+269daeE3YZ1xiA@mail.gmail.com>
	<570E1866.9010201@arm.com>
	<CALicx6saTB9giRqubF=kUkBihvZRoCVq6XVNxvi2a+nkmzMKXA@mail.gmail.com>
	<57306DA7.4010002@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 May 2016 12:21:08 +0100
Message-ID: <CAFEAcA_Kp+_aoe19PBJXDdn7HHX3ZCYbzaY5vsbYEwdyRwxdaA@mail.gmail.com>
To: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [RFC PATCH v2 2/3] utils: Add cpuinfo helper to
 fetch /proc/cpuinfo
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	Will Deacon <Will.Deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, suresh knv <knv.suresh2009@gmail.com>,
	Suresh <ksuresh@caviumnetworks.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LMUr33c0IwqY

On 9 May 2016 at 11:59, Suzuki K Poulose <Suzuki.Poulose@arm.com> wrote:
> Well, we have been waiting for a use case, like this, before we merge
> the series.

This isn't a great strategy for moving people away from things
you'd like them to avoid like parsing /proc/cpuinfo, because typically
userspace app writers are not very interested in coding to facilities
which don't exist yet, and will prefer to make do with what's actually
present in the kernel today... You need to provide the improved API,
and then it needs to get out into kernel versions in distros and
otherwise, and only then are you likely to get app developers who
will start to say "this is useful".

thanks
-- PMM
