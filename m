Received: by 10.25.208.211 with SMTP id h202csp427526lfg;
        Thu, 7 Apr 2016 03:56:49 -0700 (PDT)
X-Received: by 10.55.74.14 with SMTP id x14mr2634463qka.70.1460026609610;
        Thu, 07 Apr 2016 03:56:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c5si611721qhd.131.2016.04.07.03.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 03:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ao7cG-0001Tc-MS
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 06:56:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1ao7cC-0001TL-Uq
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:56:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1ao7cB-0005Rz-TO
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:56:44 -0400
Received: from mail-ob0-x22b.google.com ([2607:f8b0:4003:c01::22b]:34243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1ao7cB-0005Ro-Lc; Thu, 07 Apr 2016 06:56:43 -0400
Received: by mail-ob0-x22b.google.com with SMTP id bg3so50191765obb.1;
	Thu, 07 Apr 2016 03:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=T4TUfoGiXkJJxcch4EKoEhirgIa/RONDeiPKn+MFwQE=;
	b=jCB90+WUTZvKPdlD293DoxXBy2kIBYG8g4C9PO/23di+09/IMaWDD3HMRPxW+yfOWA
	c0mBMfSWXnYpa1c4YhNY53QPtJx7dka2I60q0UQlPE9W+Yjv4yS8zZw3dGcR1Qc5Nk5N
	WZZrs3o5JpqIgPqQvO3P1WSA1hJa11mKjTf127EwP72T0hdoB80snBOGcCDzaXh4qPgm
	xeRoHC8Ulc4LFfG2ClVu6rAc9liShR3xpvkcXSYBm8RYdCIfnaBDVo23o+Ulr1utNuh1
	vRNLKnO4nPXDQOTcoF20faj8gbfUnX5+/Hb9prWWxG8tHLqEzJYcpy5YaoCCy+HdDNgC
	bd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=T4TUfoGiXkJJxcch4EKoEhirgIa/RONDeiPKn+MFwQE=;
	b=fS5rqoEozjOnrM7eJYp0ZBCZEOZPGbvuVot9qmGg57RqUWMsdbmgxNuyhye5+WcgkB
	hCb5qfP8QsL1nC84mByyNn0o7sO6vzFDtEaK7Ntcw4CpyQc6WjDwmf/LwuDyEwzbMudJ
	c+lLsdhq0hBcVYHW3w4z/1ZNVghc6hhPmkk9ixbqMp55yISfZXNMJ8jZLIa8jXtLYxM/
	ltR+3OVb3wDgb1ocu8Ppi1B6a6sv4f3aH3v15r/hHfvMM86Wjp15y59IylEpWG3+Gp/o
	valFWiD0beXkCzqik0aKinG/RrLotc7EnLVpEPa4xLwKnKP49ZKgIL40hZ0fc/aKjOQw
	cZyg==
X-Gm-Message-State: AD7BkJKHIAKJRocGUJNmp9LNPWKit+fLSpVAMOXvlxpBXU5ro2x9XELtGjKBWkXzb0mvRp6Ni6omOYKA+/9EQg==
MIME-Version: 1.0
X-Received: by 10.182.63.46 with SMTP id d14mr1071136obs.64.1460026602283;
	Thu, 07 Apr 2016 03:56:42 -0700 (PDT)
Received: by 10.157.29.134 with HTTP; Thu, 7 Apr 2016 03:56:42 -0700 (PDT)
In-Reply-To: <CAFEAcA_0ssT32oNrgTHChKsAJNkjUfCHFGg2vPtk8-AWsRjVqw@mail.gmail.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_0ssT32oNrgTHChKsAJNkjUfCHFGg2vPtk8-AWsRjVqw@mail.gmail.com>
Date: Thu, 7 Apr 2016 16:26:42 +0530
Message-ID: <CALicx6tM6__TWjVPLdNzMMpoyQYHZOnArFwz4E+QyyxN7TLruQ@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::22b
Cc: Vijaya Kumar K <vijayak@caviumnetworks.com>,
	suresh knv <knv.suresh2009@gmail.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Suresh <ksuresh@caviumnetworks.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [RFC PATCH v2 2/3] utils: Add cpuinfo helper to
	fetch /proc/cpuinfo
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T4utUjRKF0HU

On Thu, Apr 7, 2016 at 3:41 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 7 April 2016 at 10:58,  <vijayak@caviumnetworks.com> wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>>
>> utils cannot read target cpu information to
>> fetch cpu information to implement cpu specific
>> features or erratas. For this parse /proc/cpuinfo
>> and fetch cpu information.
>>
>> For now this helper only fetches cpu information
>> for arm architectures.
>
> As I understand it /proc/cpuinfo is intended only for
> humans to read. Please don't write code to parse it;
> find a different way to get this information instead
> if you really need it.

  The utils code does not accept any dependency with target specific code.
The libqemuutil.a is compiled and linked before target specific
code is compiled.

  Also, utils functions neither have any cpu object to fetch
cpu identification information (ex: midr in case of arm) to identify the
cpu information nor utils cannot make any ioctl to read cpu information
from qemu.

Also unlike x86 there is no cpuid.h where we can get cpu identification
information for arm64.

So, I think userspace process can rely on /proc/cpuinfo for
fetching cpu information.

>
> (I'm not really happy about such specific-to-a-particular-vendor
> patches in QEMU anyway; we should have migration code that
> works acceptably for any implementation.)
>
> thanks
> -- PMM
