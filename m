Received: by 10.25.159.19 with SMTP id i19csp710809lfe;
        Tue, 2 Feb 2016 07:25:34 -0800 (PST)
X-Received: by 10.140.25.149 with SMTP id 21mr36334267qgt.89.1454426734377;
        Tue, 02 Feb 2016 07:25:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k76si1394207qkh.108.2016.02.02.07.25.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Feb 2016 07:25:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQcph-0004vX-QH
	for alex.bennee@linaro.org; Tue, 02 Feb 2016 10:25:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aQcpc-0004vG-SP
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 10:25:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aQcpY-0003tL-L3
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 10:25:28 -0500
Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244]:35873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aQcpY-0003sz-9k; Tue, 02 Feb 2016 10:25:24 -0500
Received: by mail-lb0-x244.google.com with SMTP id zr1so3929159lbb.3;
	Tue, 02 Feb 2016 07:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=C+pjCQyKaiZo94G0fpQ2qlyp2YruJHavONgl3SXl61s=;
	b=p7VCZxc3x6WgBv5fW15s2hphO+ZkY4g3c7x5IFddCnfmafEL72dvU/QIoaqAQaAjn0
	EgpCvV+bZhD3OkrcxRj2r9DYz7zxZ+wcBHlmM1eF87diCMVh0a7QB4CTiPFVl43upkDw
	wmqQqMbz3p2YG4/GbBHUS+HW4WS1jHXtYWFSlLzxFfVTwHomJ+sSFALI7+Ck5Xc8FO7Y
	uSkVBHoA23f8p6EHtfbynpmPRwlr+6Q/cTliLMAI0QN3bgdkM9vhfc33al8uP7a5EwIX
	lY1+9mDKSA7pWXNcOkjykyylJ65EFosBXv4NqdMhZPI4MNqZIGPzw6zWUxurcjzf7IuP
	0Wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=C+pjCQyKaiZo94G0fpQ2qlyp2YruJHavONgl3SXl61s=;
	b=ksrw5EGlpL28btWn+41zDdbro0YEnG6xsCbOIFNEUcZY/g+Zo6B9TwKumudybpKmjw
	Jjpqq1Qi96ndP+bTTIMNO/f1VEKm7mFU0ZflB/D10BBwmUnseU5sW2JhsKSJ11Z8zbDf
	Ae1kRdewYdskXXXY5VPOWmoAxcCC0mSQxKBdza5CHtyvESaP878eikWymifk3a1rmy/z
	mDSiJYQeOMPkKUWPBiRc8+42dFSNPMrKVztP1n3ky1f0LNfTZQwUTl0GPydo3B4U1S4H
	WDhKlE2RVy76ZklqKM2kxEyH4BLnQY7IJG2sp4l3fiX5pGLEdBoa3kq5EgR6d5NrfHki
	SN5A==
X-Gm-Message-State: AG10YOSATvpPBGXuQGt3dDVP5tmHDp93Bfa9KFwzJfE+LuJaIAES9rtdhTEhGUKKUwH1+Q==
X-Received: by 10.112.170.200 with SMTP id ao8mr9076378lbc.84.1454426723515;
	Tue, 02 Feb 2016 07:25:23 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	eb3sm277600lbc.31.2016.02.02.07.25.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Feb 2016 07:25:22 -0800 (PST)
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
References: <cover.1454169735.git.digetx@gmail.com>
	<77d17ad13f7b20deb433ca7a7b3d7cf40429665e.1454169735.git.digetx@gmail.com>
	<56B0C90B.7000300@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56B0CA2B.8090009@gmail.com>
Date: Tue, 2 Feb 2016 18:24:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56B0C90B.7000300@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: Re: [Qemu-arm] [PATCH v12 7/9] hw/ptimer: Fix counter - 1 returned
 by ptimer_get_count for the active timer
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
X-TUID: VXSRvzwkU0hf

02.02.2016 18:19, Dmitry Osipenko пишет:
> There is possibility to return timer counter = limit + 1, if the following
> ptimer calls execute in less than 1ns.

s/limit/delta/

-- 
Dmitry
