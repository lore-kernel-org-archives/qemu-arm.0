Received: by 10.25.87.130 with SMTP id l124csp532208lfb;
        Wed, 7 Sep 2016 16:05:18 -0700 (PDT)
X-Received: by 10.55.41.198 with SMTP id p67mr37319982qkp.217.1473289518477;
        Wed, 07 Sep 2016 16:05:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p66si18541961qki.25.2016.09.07.16.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 16:05:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhluA-000655-04
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 19:05:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bhlu7-00064o-Pk
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 19:05:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bhlu0-0007Ji-9M
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 19:05:15 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:34340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bhlu0-0007IO-4P
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 19:05:08 -0400
Received: by mail-vk0-x22e.google.com with SMTP id v189so26295790vkv.1
	for <qemu-arm@nongnu.org>; Wed, 07 Sep 2016 16:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cP9BY32GhpvCBJyXpdaQUSTz7EqoA15ejb9Av3fJRwk=;
	b=Svc1lrKJCj2fBKaMNBJAK55orYRg9VoGub73ZWLxQSj+L+Y4CHGSvx+oPu7ebATkSo
	7f5WDsCr+j64KsPLbqwQ34Wn0Jnfgwms0f5MPirFseHqzL3Vj4Yf2Z45TqmIzVsCCO8C
	I0Wb6bfo88rUDkgSt0FAZMaxWQTjORP2YMoi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cP9BY32GhpvCBJyXpdaQUSTz7EqoA15ejb9Av3fJRwk=;
	b=XftZMIHYcmxSLah1Ab4cV+tPiWl+kVdf45NnuM76Z5+8q0j1mkFTRcQ3ia2ZkM+hs9
	CNwg9zd2eeemju/55aPkLea4X5NS7QhEu1qx3xcEBV+TJS+WwRViHTHv9foy6RrMB17+
	y9em8yH7r00lVBOaGu+WnUQ/mftAdTxfVYHJxmY+f2qJIimeeCUhLWkDeaCtt3mQIXw8
	P5iX8col+/dQno/1G+h41SRIyCanFkHqZniLNC2fUUomphl1lrNamFDbB5fBEa5dRW1U
	0554bM4P20hgOSHc6T/FehHKTOeg5CzNXI3FJ1El2mKE3pCxNzBgFNJn+kG9vQT1v4JL
	tzVw==
X-Gm-Message-State: AE9vXwNLNOjZe9HCoq8VGmA8DBbaZIDEJ8J2I8/zNahgo5QXTSQRw98VZCm7Qj9T2AYEgeXBMzKQpiLxLipvMfqW
X-Received: by 10.31.92.143 with SMTP id q137mr13848802vkb.92.1473289507651;
	Wed, 07 Sep 2016 16:05:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Wed, 7 Sep 2016 16:04:47 -0700 (PDT)
In-Reply-To: <555610a3-d643-1376-037d-4a3bb5090232@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
	<1de89fe6e1ccaf6c8071ee3469e1a844df948359.1473252818.git.digetx@gmail.com>
	<c5767f15-d7cc-932e-a272-4f7d990d656a@redhat.com>
	<555610a3-d643-1376-037d-4a3bb5090232@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Sep 2016 00:04:47 +0100
Message-ID: <CAFEAcA9LH9fXCj0z1+Ov4cU7y1sA4U6ZbP+buo6kzAbfvvyU0A@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
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
X-TUID: lDGj2dPsHRGi

On 7 September 2016 at 23:32, Dmitry Osipenko <digetx@gmail.com> wrote:
> Thank you for the suggestion, I'll s/Author:/Copyright (C) 2016,/. The
> consistency with other files is arguable, because that variant I choose by
> looking in several files and picking the most popular.

Most files with an Author: line have it because the file is
Copyright Some Company, and then the Author line comes after
it and gives credit to the individual working for the company
who wrote the code.

thanks
-- PMM
