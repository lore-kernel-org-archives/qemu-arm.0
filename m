Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp571130wrh;
        Fri, 3 May 2019 06:35:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkWvIiRdTn1ryqZkUrHrF5/U1H2U01XJ4fDSBW0UTFBX6sMfTjeAtaqWzYz/XXgk672dvW
X-Received: by 2002:a5d:6912:: with SMTP id t18mr2034463wru.17.1556890528650;
        Fri, 03 May 2019 06:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556890528; cv=none;
        d=google.com; s=arc-20160816;
        b=Nd0GKy6Zbi5T75XB5fabr9HP7TGkSZIhT2wqiaSr8G0BaITsEPfFE1s2/LqydOhkj9
         cMzDfbQY1y9oMJhje0GRDbTNjJf/JTbfrCGv/Zke1h/qwJOfQVzk91cJGPRlarTMkeZQ
         ChtEXrwlDZqbz5ZNmgPrr0B4iWXWIbty/00W5JiLXZc2Bim/UA1D6D4BvsMCtSIfqOWr
         xT/5NGx5o1FG0bScDO/uzK8OSkLdie8mQti+vLWZQpsUbUIhFTfWyzCd/1nfIWdIWeX7
         xm89FVJ1j65hOffy3avcBhibQ8FOtXSgAqM+atQULT4k4RbTEblxdSgxd+jX2dlUHZbq
         qZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mY5efbqDzo/n4wJM/Lt0T5LWk5kSu8VSWtK1bUhM3xY=;
        b=TAzDvkP7IcnKSXm2d9O8iVtKUwZIBjDPDh5Ns/udMZ6WHMpS6bT7kq0B+xWl+RjnjU
         ODi8HjVk6XLreyQslYY1CtOKYmvxAlf60tYEKa1y/wvuPWNS6O/1Ciy03sktf7hNwwyb
         tzGKlsIqVBSK7wlUdBwsPnYeEccznxVbpi5bmoLZ45SWNnoMkuK11JJP3XYEJrDgF3hm
         YdCz4cTAy2XOpOGLFUTUbrf/j6sxDO64sPmQGcD1I4MVGHcxzoo0AZWuF7J19MGT9aqG
         oS1xFUEdfH6cGWLAay35DX5gHNGABjoqQRnGjfnWlfpKqJNyZc1XC6O0LYJsuIG6oJET
         DRZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XnqNLL7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si1629589wri.426.2019.05.03.06.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 06:35:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XnqNLL7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:40842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMYLX-0002c6-Nb
	for alex.bennee@linaro.org; Fri, 03 May 2019 09:35:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYLL-0002Y2-4P
	for qemu-arm@nongnu.org; Fri, 03 May 2019 09:35:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYLK-0003et-6o
	for qemu-arm@nongnu.org; Fri, 03 May 2019 09:35:15 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41798)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMYLK-0003e6-1l
	for qemu-arm@nongnu.org; Fri, 03 May 2019 09:35:14 -0400
Received: by mail-oi1-x242.google.com with SMTP id v23so4404169oif.8
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 06:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mY5efbqDzo/n4wJM/Lt0T5LWk5kSu8VSWtK1bUhM3xY=;
	b=XnqNLL7AycVu5qukZW08bPeAlse+7XDSf8V1Bs2grziJ3bnwWQnOYc7BSspYHnN0WN
	KNy7hXjpjz1ti/Kt01WV/8BUuzqkKG6W6ZX+Oxxfo4A5eSqzXg6y/U3e5XYf5rCug+xu
	aQgIaWC6VmqjoDy6ZphkFnLHtT9qifhvjoovjW0rg4nIGhfYUjDAiYyT+Mk5KWMlc21T
	Y5vqSb6HC3ot5hrzPn4sxi/As/G83Tjf3+4KYheGknrFWKgt24UC5Au6D2MMcennNfcC
	omjtFJUA+/ZqoRgwSUj6+/VXciZ4+MJaUSc+/uLlvJtTG9acW50kIYWRT/oiZT7Bsh2X
	V6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mY5efbqDzo/n4wJM/Lt0T5LWk5kSu8VSWtK1bUhM3xY=;
	b=O9m1Jy/9ERPVRLnTtPze1Cq+LFzo8p6qB49ndX9ZCD5HK0VE1BfloaCC5Iy1EgP8kn
	BAXloBHoFuSOzSZHpcm3D02NfZAU6PrDFD86MsYNOE7X99XyTlXL5PI0CBM8XZ+rlZYe
	Q+G+Fnu1HibN5guvAnol9rRBRZBdUq4n5iaF972QCeRLP31FMyqzJ/TZu9/Qyb60Q7yQ
	WGDMXD9YlSDWYkKoIgrvQGCyn/xZsp/TQzTjvwHQ1Wt/13OUXnsJQaBIfBncwnnteaPx
	a9FS2lsoVp/B3Enx1nY3+GhZwsrgzpoTeHlc1G3OHFYgjlMT/smu3mWN4s8+tDOQE5O6
	TSCg==
X-Gm-Message-State: APjAAAVu02gvlq01eqsVWjl9qcXJYC70QR0tm5AK/iC9WNxQpycfwUMr
	+kVMr3ISnEehnRkdV6vhFUrpIxeeZLacK2qmEa8iGA==
X-Received: by 2002:aca:ab12:: with SMTP id u18mr5538127oie.48.1556890513381; 
	Fri, 03 May 2019 06:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190430044036.1144-1-joel@jms.id.au>
	<20190430044036.1144-3-joel@jms.id.au>
In-Reply-To: <20190430044036.1144-3-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 14:35:02 +0100
Message-ID: <CAFEAcA9HsxWxRoNVy+fpm_PYdiB+Ei6k7bbLeG-qG+KXkG8vkg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v3 2/2] hw/arm/aspeed: Add RTC to SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0O0AA63xr99W

On Tue, 30 Apr 2019 at 05:41, Joel Stanley <joel@jms.id.au> wrote:
>
> All systems have an RTC.
>
> The IRQ is hooked up but the model does not use it at this stage. There
> is no guest code that uses it, so this limitation is acceptable.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
