Received: by 10.25.208.211 with SMTP id h202csp1139578lfg;
        Mon, 4 Apr 2016 06:32:12 -0700 (PDT)
X-Received: by 10.140.105.198 with SMTP id c64mr10403128qgf.94.1459776732013;
        Mon, 04 Apr 2016 06:32:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d140si22259590qhc.7.2016.04.04.06.32.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 06:32:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an4by-0007Za-Q6
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 09:32:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an4bw-0007ZQ-6r
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 09:32:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an4bv-00066s-Bs
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 09:32:08 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:35775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an4bv-00066f-6U
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 09:32:07 -0400
Received: by mail-vk0-x22d.google.com with SMTP id e6so179459935vkh.2
	for <qemu-arm@nongnu.org>; Mon, 04 Apr 2016 06:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NJSr3bTO/m1STB6QjJH0rYPJqTOvYTqJPLmR8uyHZMU=;
	b=eLnNus50za0CfnREXyGrJ2cK8NxwT8e+XJE5dEAMTOM8DFuI8tkp4k8ReVUm6okLAt
	AUYTAItrvV1J7CHZunHYxii/D/eWdLHsltx/NsJje1yD0Z6tOct35gXrOcePTeu2vAPp
	Q2P+bLczelkK0NkTtdVjVT0Z40TY2kEOmE/Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NJSr3bTO/m1STB6QjJH0rYPJqTOvYTqJPLmR8uyHZMU=;
	b=F0aqmvqsnYQbNtfwSkpwkmd2fEB5iyYsP3P004Iiu+En1Cl/URA+Kr2IYv0Z7ltdGw
	pceLNMKHKJplEU4CnVBkdiMYSTsM4d7PavutPNhdgO/z/TfwBMwrT4U+oHtod+aJIUBH
	K6MeG8DOKmd7e0PaxL6jdioToJuyYd++rUvLW0HrZVfeRZ5iK5d0SHn4aq5barZi8McA
	0ezmJhMsNJT+Fr3pLrQeZS8WgPLXYtOAfk5Q0eH26q/s2Zt6onKnlIE7WtzEZ5iywUyo
	ZZ3J8NrOCuzbZr3lX6Bf41D9eGiaYWXOD1qSKcVzUJoxcrWJyt4ou6vCulVqMxjd31Ln
	EdyQ==
X-Gm-Message-State: AD7BkJIquBkGFkkGM4Pm1+bFiJztdEMMnEeUDyWMxTNNhEJFKVXLtT8Kym6ETVua9daq6hISSrelab/1dlo0vpwm
X-Received: by 10.31.8.17 with SMTP id 17mr3487918vki.139.1459776726714; Mon,
	04 Apr 2016 06:32:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 4 Apr 2016 06:31:47 -0700 (PDT)
In-Reply-To: <EF5FA6C3467F85449672C3E735957B859168FB0A@BADAG02.ba.imgtec.org>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>
	<56F9A3D1.2050402@twiddle.net>
	<EF5FA6C3467F85449672C3E735957B859168FB0A@BADAG02.ba.imgtec.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2016 14:31:47 +0100
Message-ID: <CAFEAcA_Rp+8hGC6sos3H3t2A8UDgLUf3KvrM3-C3zZAFCc_WEA@mail.gmail.com>
To: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"proljc@gmail.com" <proljc@gmail.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] softfloat: Enable
 run-time-configurable meaning of signaling NaN bit
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
X-TUID: A+HMwgEjombL

On 4 April 2016 at 14:21, Aleksandar Markovic
<Aleksandar.Markovic@imgtec.com> wrote:
> B. arm - explicitely sets other fields of float_status,
>       explicit invocation of set_snan_bit_is_one(0) added

We zero the float_status structs on reset, because they are earlier
in the CPUARMState structure than the 'features' field (and so the
memset() in arm_cpu_reset() will clear them). So you don't
need to explicitly zero a field like this. I expect the other
architectures are the same.

thanks
-- PMM
