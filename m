Received: by 10.25.208.211 with SMTP id h202csp1642418lfg;
        Tue, 23 Feb 2016 02:27:24 -0800 (PST)
X-Received: by 10.140.242.16 with SMTP id n16mr43485851qhc.2.1456223244216;
        Tue, 23 Feb 2016 02:27:24 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c205si33233261qhc.97.2016.02.23.02.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 02:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYABf-0001el-Na
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 05:27:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYABG-0001MP-GJ
	for qemu-devel@nongnu.org; Tue, 23 Feb 2016 05:26:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYABF-00032T-Jp
	for qemu-devel@nongnu.org; Tue, 23 Feb 2016 05:26:58 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYABF-00032I-E6
	for qemu-devel@nongnu.org; Tue, 23 Feb 2016 05:26:57 -0500
Received: by mail-vk0-x229.google.com with SMTP id k196so158156597vka.0
	for <qemu-devel@nongnu.org>; Tue, 23 Feb 2016 02:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xxlWR1+gH5se8k2TwtHwDu3Y4uX/RCgOG/smX3jdlIs=;
	b=c5W+tEYyKmnh7tEGyCwnQsNn4KfDNgGFLiQGDE3ksFkIMBOERahyushiG/rJueyXwh
	2XIsh/Ifktr9sHiZGKsirjf8yoJ+D8MgNr/AS35ImLVVZr59npGEoBaUVc+KXIx6634C
	uFw+coR5HG6MZCEsQMO4QCvl2xuvaZHeshjig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xxlWR1+gH5se8k2TwtHwDu3Y4uX/RCgOG/smX3jdlIs=;
	b=MAB0Q3gHgVgDQxq0nHsNiOlHeCw3yfM5+PF3gp5xxSpA7J7ZLAXFcabr1+MhKqy+Eu
	e76aQaKCgVAjphiRxYSh0kDcN4IOtJZOtttGaedTc3q6BEkur6RI3bcZb/7ycqq6tXe5
	VR8Q5E6vq3aCJkodjCe0m7Lr1ITHLIniDrBwYSRWWZ/9yq7/ZggQeDw12mHOHCEx3qiU
	1Cpdc4CdVMumfrw+gxjOAOvl2ch6/GjIeA0haQvZSAhSgHVpjjwZNnwy+Q03M0Cg7l9e
	cZPyBCsuyn0Um3A/CzeDiBzFezq/xdy1OQelDvOgybnCpvODxu6Ee+e0PRu/u7WDRKZG
	aDxA==
X-Gm-Message-State: AG10YOTrb2AkRW6wihmFzZsuMKpKFD8bc7AKPM6wvHNqQtAzpvgSvxU//dngvFhBgz7YG6yGR0EZ+0jrClImoh9Q
X-Received: by 10.31.1.6 with SMTP id 6mr24172124vkb.139.1456223216707; Tue,
	23 Feb 2016 02:26:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 23 Feb 2016 02:26:37 -0800 (PST)
In-Reply-To: <56CC2E1E.2050705@163.com>
References: <1456132310-4826-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA-sDDj=kKmQnru0nfrjuHSjD8KDzO-PWGd0ia3GMZrEdg@mail.gmail.com>
	<56CAE2DB.3080702@163.com>
	<CAFEAcA-nbrRN7ecP9G4O-bj=K-NtKoOQXpxGygKMPgxpgxQvBA@mail.gmail.com>
	<56CBEA1C.4060900@163.com>
	<CAFEAcA86KRN5eS4p6frpP5XnxUE69nXB3aQ6=W3zKE+j1RV8nA@mail.gmail.com>
	<56CC2E1E.2050705@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Feb 2016 10:26:37 +0000
Message-ID: <CAFEAcA_2eLMd39Duufk-u8VZ9UFnjPfqDFHo=QFk7qJaK4bCKQ@mail.gmail.com>
To: hitmoon <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-devel] [PATCH v4 5/9] hw/timer: QOM'ify m48txx_sysbus
	(pass 2)
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
X-TUID: 67tkVAYgQuq3

On 23 February 2016 at 10:02, hitmoon <zxq_yx_007@163.com> wrote:
> I still can NOT understand your intention properly. Can you explain more
> clearly?

VMState structures should generally mirror the structs
they are saving/restoring. The M48txxISAState has an entry
that just says "state is an M48t59State struct. Your
VMState for M48txxISAState should therefore also have an
entry saying "state is an M48t59State struct", it should
not manually include all the fields in state. If you
look for uses of VMSTATE_STRUCT in the codebase you'll
find some examples.

You also need to be able to test that migration works
if you save data on a QEMU built before you make this change
and then reload the data after it. So you need to find a test
setup which uses this device (ie a working command line for
a machine that uses it, preferably with a real guest) and make
sure you can do vmsave/load.

thanks
-- PMM
