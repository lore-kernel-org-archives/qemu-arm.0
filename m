Received: by 10.80.163.71 with SMTP id 65csp1137876edn;
        Tue, 20 Sep 2016 10:28:15 -0700 (PDT)
X-Received: by 10.55.11.20 with SMTP id 20mr27861150qkl.258.1474392495038;
        Tue, 20 Sep 2016 10:28:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m24si20189105qta.39.2016.09.20.10.28.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Sep 2016 10:28:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmOq6-0008Ui-CT
	for alex.bennee@linaro.org; Tue, 20 Sep 2016 13:28:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOo9-0007KQ-9c
	for qemu-devel@nongnu.org; Tue, 20 Sep 2016 13:26:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOo7-0005os-Di
	for qemu-devel@nongnu.org; Tue, 20 Sep 2016 13:26:12 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOo7-0005on-9K
	for qemu-devel@nongnu.org; Tue, 20 Sep 2016 13:26:11 -0400
Received: by mail-vk0-x22a.google.com with SMTP id u196so37091333vkd.0
	for <qemu-devel@nongnu.org>; Tue, 20 Sep 2016 10:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CTBHsoDiUfl8IK9z3JAzliZ2tGy0eyGcnN7X+JL0aVI=;
	b=MHk+aqez/K+GSzVO/YkFdm38gV2ZTiZUcRKwWsy0RYa45n2s9vF5Ixp4OboRJWhJuH
	Ep6hEPPm89Yo48J1MaTPcClwctrSvX5NzE+7Xj+DgoUiJzw71X5v30EMmeghjH33Owfr
	tCVmYSW2YE0ZjQASbIqqCESUmNSzbMrlYN+nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CTBHsoDiUfl8IK9z3JAzliZ2tGy0eyGcnN7X+JL0aVI=;
	b=AeNx42dOAjImMPt6HWFOH3BZZD1bmJnwbeQ19/zUeb+20m15hOjjK+O9ARPkX+l3HU
	rPSFyDLXymfOuQ/d8pV8jSMUMliEQ4Zi1FCRuUvhhlJOwVve3aIzSb28Yq0EOxYMh1zg
	Pnp6nUcfAmEXH9QDwliQeBzlTQJrPtjLfcoF0+vJdhtaIpnzlwfOl2Z99SHer+YeGz3H
	vqlSpUTSSguYfdrgFmzP1l0OkUhOuembBXSOEYaEJLyUfudOhyNCBiUPaHTKIvUf733J
	M9uu9TaMF/pVR1KOQPN6cPBQk03FcYOCib/PlnzdUPa7Gg4ATiZOvptB8MV+b0vy2d6Y
	+MrQ==
X-Gm-Message-State: AE9vXwNjbYyAF2X69OS7gpxtoRcMJ/Rm/sVf0KYmdJXmFEpM6u/QeUpMtUxSolMKerNMOtekH151p6h5x2QViz+i
X-Received: by 10.31.13.71 with SMTP id 68mr5278649vkn.175.1474392357737; Tue,
	20 Sep 2016 10:25:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Tue, 20 Sep 2016 10:25:37 -0700 (PDT)
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2016 18:25:37 +0100
Message-ID: <CAFEAcA90afnS2GjHbg+62eGr4D_aurAOSD7Sw2TU2xDH+kBbRA@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-devel] [PATCH v16 00/16] PTimer fixes/features and ARM
 MPTimer conversion
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BlsA6Rh5Cg5Y

On 7 September 2016 at 14:22, Dmitry Osipenko <digetx@gmail.com> wrote:
> Hello,
>
> Currently, QEMU ARM MPTimer device model provides only a certain subset of
> the emulation behavior. This patch series is supposed to add missing parts by
> converting the MPTimer to use generic ptimer helper. It fixes some important
> ptimer bugs and provides new features that are required for the ARM MPTimer.
>
> Dmitry Osipenko (16):
>   hw/ptimer: Actually stop the timer in case of error
>   hw/ptimer: Introduce timer policy feature
>   tests: Add ptimer tests
>   hw/ptimer: Suppress error messages under qtest

I've applied these first four patches to target-arm.next
(there were review issues with 5 and onward).

thanks
-- PMM
