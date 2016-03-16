Received: by 10.25.208.211 with SMTP id h202csp1120869lfg;
        Wed, 16 Mar 2016 04:35:27 -0700 (PDT)
X-Received: by 10.55.74.9 with SMTP id x9mr4280606qka.81.1458128127301;
        Wed, 16 Mar 2016 04:35:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n127si2891769qhb.71.2016.03.16.04.35.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 04:35:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag9ja-0004XZ-Q6
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 07:35:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9jY-0004XM-JQ
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:35:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9jX-0000sv-SW
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:35:24 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:33335)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9jX-0000sZ-OC
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:35:23 -0400
Received: by mail-vk0-x230.google.com with SMTP id k1so57748209vkb.0
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IVwuuOciruPafExtU7EkSLAakIYOAL+FlP3Bm0oLEYU=;
	b=WOlQcK6mWfZnPk6ncvMz2k6UNZDjikZgnk8zDHZNUppIfNDabv84BBbnn5cDs9nCbh
	apSHMUtcYcfrSRJA3LrFXpaxZV/k62ayzMwxtwBC99BR++bR0CxG2WRjIQSbcrroAjd7
	ICtCjKQHfadZCTtK7Z2h0sqlTVui+6z5b0+IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IVwuuOciruPafExtU7EkSLAakIYOAL+FlP3Bm0oLEYU=;
	b=Xb0C7hXKo8skNdHAoSNeUhKMxL86jbSROgVupbpPZUnjhwPnaBGFv0XddHZhBtQkT+
	l4DAoUTnvD3vY/N/LeRExefOMJScp71jUrl5RBeVhI1aNTx3yTVtCe6Rz/a5yjJxtMjH
	O8DNwoyUTLqBFzgAlO2SLhu/pSM6Nz83CCcKXmqeOC9ERQy9/bjSO4DjNgOOR8qj/IEX
	bBcIAyZXdnUw1z7y4VMEw2dF9dBESg++yrZow0nL+NPcTVO8RjmhQZUsZC24sd2eiL6X
	7S2VafEo2Jg75UqPpkxCZjI4v7KZn1iuKp33R9BgbgpbojIi+GO9JxjgHWLXoJPXLE3E
	7WmA==
X-Gm-Message-State: AD7BkJIpolovO7qw0Nkf2vFP49RumkXBuiwg7AqXOBQiODMXiWb5IG1TMgEDXwnAt4vjkZ8NKi0sImrdj1rWvEPP
X-Received: by 10.31.180.85 with SMTP id d82mr3208603vkf.83.1458128123164;
	Wed, 16 Mar 2016 04:35:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 04:35:03 -0700 (PDT)
In-Reply-To: <1457334350-5675-6-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<1457334350-5675-6-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 11:35:03 +0000
Message-ID: <CAFEAcA9KHcPOWJMLVqeXQ7P9t7FaW1F8ZxP1GG8oyk_FRVXMtQ@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 5/9] hw/arm: QOM'ify pxa2xx_pic.c
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
X-TUID: zPhR5xk0k859

On 7 March 2016 at 07:05, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> Remove the empty 'pxa2xx_pic_initfn' and it's
> setup code in the 'pxa2xx_pic_class_init'
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
