Received: by 10.25.21.96 with SMTP id l93csp322856lfi;
        Sat, 25 Jun 2016 05:47:46 -0700 (PDT)
X-Received: by 10.55.148.67 with SMTP id w64mr10730416qkd.134.1466858866554;
        Sat, 25 Jun 2016 05:47:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q131si8892503qka.276.2016.06.25.05.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Jun 2016 05:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGmzy-0005P7-1V
	for alex.bennee@linaro.org; Sat, 25 Jun 2016 08:47:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bGmzu-0005Oq-63
	for qemu-arm@nongnu.org; Sat, 25 Jun 2016 08:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bGmzp-0004S4-W9
	for qemu-arm@nongnu.org; Sat, 25 Jun 2016 08:47:41 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33276)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bGmzp-0004Ru-NW; Sat, 25 Jun 2016 08:47:37 -0400
Received: by mail-lf0-x241.google.com with SMTP id l188so24454154lfe.0;
	Sat, 25 Jun 2016 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=5e1lZMYTTSw8E2C4QH1cmZ/wWyI8plyWJiB9bUFucV4=;
	b=0paawko5Ry71V2Gc7XGgjE6oBxl2usJIWtolt2hdW/QxkvjIBuL9I1i+BuAUO6q6tm
	xYoEVAZ8H87yHYGbV8RxNzdYHee2oUOHeKtCoBekbDP1a24G9S3eCZu6ZYENOpcp03rb
	ZThnQCqdM00UJMolapqbo3wZk2UrMoWmXqmLDc2OPEDN9+BX5XS6Bq8RSMxch1ym/mga
	lhqfOhm/1sTQ/t9wEGnqTxA2fn8z8eJ+zbZcq859/2JVlv3vtXplXmmBIuKrNUVRVH2u
	QpsMOfX6ea4szrEY7dVSnrGxzg2/54gC3/xt9klcX3RqjNndAjIUQ4gJ3MuOno8Spv11
	rp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=5e1lZMYTTSw8E2C4QH1cmZ/wWyI8plyWJiB9bUFucV4=;
	b=PerwITDZUJltbUTdK+mPYFc1sy4/VxwLSPVlQAonpWqdqRKK5ofV4TckXNlhxtLCfw
	FPnDe0pbzEU5B8bfSHBYQjoHKB7Xz2iACdNPyNWYBdpxFIu61aZnjXhM+VqVqCB4umYn
	kAZGCocHWRtRAsXRsOnx6IRHrZOZ9HSiaJGYOhnuugDzD/Oh2pyREICtyNyHBP5wIplV
	Yn+dDnqe2GXt5F5qTouW+IYGkkvw0f7yoU7ffB4CTtVTjThZ/49nlXaMH3eVyIGpmOgP
	m6/eH72yr1n+hEf5nYGL1r6UqxG8FGzTOW2/lgtQyww8ma2o4AQO2Fe+J0NPM9pfP7nA
	XqZQ==
X-Gm-Message-State: ALyK8tKWrz1cs2Zc1ahjzkRQ7Cel8GOrgcAAwqvRRvGMLuaw6MoodtLS8joHaAHNaH59JQ==
X-Received: by 10.25.16.210 with SMTP id 79mr3008205lfq.127.1466858856739;
	Sat, 25 Jun 2016 05:47:36 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.googlemail.com with ESMTPSA id
	76sm1703156ljj.3.2016.06.25.05.47.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Jun 2016 05:47:36 -0700 (PDT)
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
References: <20160625123521.16752-1-digetx@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d1ce3b62-6c9f-c86b-64fc-9e2ec4d53274@gmail.com>
Date: Sat, 25 Jun 2016 15:47:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20160625123521.16752-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH v2] hw/ptimer: Don't wrap around counter for
 expired timer that uses tick handler
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CM3JCL9oV10q

V2: Patch applies cleanly to the QEMU master branch.

-- 
Dmitry
