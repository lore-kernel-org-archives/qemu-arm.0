Received: by 10.25.87.130 with SMTP id l124csp538228lfb;
        Wed, 7 Sep 2016 16:25:44 -0700 (PDT)
X-Received: by 10.200.42.61 with SMTP id k58mr55579300qtk.122.1473290743946;
        Wed, 07 Sep 2016 16:25:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e93si26754648qtd.127.2016.09.07.16.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 16:25:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43706 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhmDv-0003jP-Do
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 19:25:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhmDs-0003j6-Dq
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 19:25:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhmDn-0002K7-VS
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 19:25:39 -0400
Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231]:34303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhmDn-0002Jl-LJ; Wed, 07 Sep 2016 19:25:35 -0400
Received: by mail-lf0-x231.google.com with SMTP id u14so9228900lfd.1;
	Wed, 07 Sep 2016 16:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=J0dvQ3nYoBhqMQYjx0mA8LvKBNI3JvYIT5df5WdSZdQ=;
	b=Shauj5PB/uDAKy2nEyNhagvHcSBTH0fED8tJJCq8IgO9bgCn4f3nU0YVx80Y3pFX9P
	l9SA1IPfU2FPTegLrjiOoIHjMiGlLcaAlIq76zADjW6EqMd0j9oslJ2zTe23J+NkHw0J
	8juwMB0/URkjph2DXmemo7D2FshACjq0SzAlJqBZI5nezH9fB9X9zPLx7c3ZUukyCzez
	hfTJlMDlqxFAA+HUHzciVThV1y58mh4XBOnU8ibRIf3hTi/eLvWKcsnwM/lxgSc/Ylsp
	J2of7FvhM6ehUlKQt28J8JIk623/gcsCmRi5b/RVUmpdWNdU3xsGVAsxQofMCrPGJu+R
	KDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=J0dvQ3nYoBhqMQYjx0mA8LvKBNI3JvYIT5df5WdSZdQ=;
	b=mc8wrIzEBGs5vXm09Jgk+5QDH1DokMYQ6KY5yxBuv1pmrMZ+RabOrTzxplMLsYAtqY
	BwHDn2OfaxhwOl2fGp21bGWNEHXoOk/UlpNf8JlM9AbXwbPPnqzHFCQm2NkevuGf41Si
	e6/RLPJfqY8urzOyhWX7IWU29yK86Ija/QMqr7N9h1u4yIFSuhZehKSwTm5LKstv3hEE
	8MrLKvyZoTvjirisZ6pjCWsAXCgiFsu3yVpK/9CnHRIYtMR3H9z6arXu6lQymS2fDaVu
	0aOLE2TIQuhbEbp+yFAWnjv5rfgJ3amij6+BkcUmDvCDJNLpeLWuLaRs4dEtjV2EpYkQ
	aAWg==
X-Gm-Message-State: AE9vXwNYqF1yBwwuKLnGonaR+UNGxwLPx1TMA9vujWU+Aq1/0Fy0z4/g1O6/nIekadS1kQ==
X-Received: by 10.25.85.198 with SMTP id j189mr695378lfb.31.1473290734608;
	Wed, 07 Sep 2016 16:25:34 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.googlemail.com with ESMTPSA id
	e39sm2883385lji.44.2016.09.07.16.25.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Sep 2016 16:25:34 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1473252818.git.digetx@gmail.com>
	<1de89fe6e1ccaf6c8071ee3469e1a844df948359.1473252818.git.digetx@gmail.com>
	<c5767f15-d7cc-932e-a272-4f7d990d656a@redhat.com>
	<555610a3-d643-1376-037d-4a3bb5090232@gmail.com>
	<CAFEAcA9LH9fXCj0z1+Ov4cU7y1sA4U6ZbP+buo6kzAbfvvyU0A@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <06525440-c347-04f3-dfd2-96ddd757413d@gmail.com>
Date: Thu, 8 Sep 2016 02:25:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9LH9fXCj0z1+Ov4cU7y1sA4U6ZbP+buo6kzAbfvvyU0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v16 03/16] tests: Add ptimer
 tests
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rGIzfgHmgvyl

On 08.09.2016 02:04, Peter Maydell wrote:
> On 7 September 2016 at 23:32, Dmitry Osipenko <digetx@gmail.com> wrote:
>> Thank you for the suggestion, I'll s/Author:/Copyright (C) 2016,/. The
>> consistency with other files is arguable, because that variant I choose by
>> looking in several files and picking the most popular.
> 
> Most files with an Author: line have it because the file is
> Copyright Some Company, and then the Author line comes after
> it and gives credit to the individual working for the company
> who wrote the code.
> 

Thank you for the clarification.

-- 
Dmitry
