Received: by 10.223.159.74 with SMTP id f10csp4118588wrg;
        Tue, 12 Dec 2017 10:04:22 -0800 (PST)
X-Google-Smtp-Source: ACJfBouK3ftk9xCyR6UCq3VfkjERQ9aBtL31WGHU2xXe9g2FoxKYO7DUJ47IC6qIbIZqqdi2nee1
X-Received: by 10.37.108.4 with SMTP id h4mr3492061ybc.109.1513101862543;
        Tue, 12 Dec 2017 10:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513101862; cv=none;
        d=google.com; s=arc-20160816;
        b=k0p5X++bZyyuyY8VbsdOX4tB9P6Tg/migMG5bL/hEWmW98GIC0ulxqzt20Ra3ZcnDT
         6/4fl3yo4OF1gQ8ZOFfVhgpYQbwxCH1e45RTrkIFoKrvgazOVzGB97qlkrOxRXKMaMmq
         EcOxtnr9o7ITg9SrJWRD7kAOC/332vy5xU5/vPG1bPwcPYwYA7bih/zFshzfTrQjqPCZ
         NrOgtGT8d4ko7RNO/b1fqTVViTmDa0g3c6rGb9fK732lTMYI7dFMJCakQNR0Y8YfsYYF
         uasuwhp24xdDYsXOZUm8C6mf9qc0A7uCPdjqCvVgRUyosz04yfHEJSs4/9UXl0bGQoNp
         ozuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Tftg1Zg6mi2n9ZH1FTjOFqxemV8gYHzkK8J7VVHAeoA=;
        b=Rb39kOMwXLR8oSMmWkIoPn3zWSwWJblzQGr/OXnPKgIliPMCSB6wDFQrAxQCQ6hVZ0
         7wxVK3BH4B8jFpaun6NNIzVfFeZRw7CxZEEHyJ/QrjjGydITjaxHhxoYcW4jkPNRMBdd
         o7oFDRpYi1kcXGZbgZ/nfvOI4gUz8GwQIpLfo6S6m9FoQ8yy7M3Kxa1sWzZJ5AxsbKkp
         NmNAmRXIM+/6Mcb/lMetbZDj6zm6wGLFmKo+sWSD4/4V1CH/qyCF/44PrWlZ3hdS89Lu
         P//DnEf07ESTrxIUD4GzzwjqAi91X0fI8H4GKdfRnTsTFyLSYhtMhntbieL+mDbAhbNw
         JmmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YaOwGNGU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d12si3664190ybm.446.2017.12.12.10.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 10:04:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YaOwGNGU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59839 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOouk-0001kR-1a
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 13:04:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOouT-0001j8-0s
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 13:04:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOouN-0000jE-8N
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 13:04:05 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:43579)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOouN-0000iy-2k
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 13:03:59 -0500
Received: by mail-oi0-x241.google.com with SMTP id f69so14589303oig.10
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 10:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tftg1Zg6mi2n9ZH1FTjOFqxemV8gYHzkK8J7VVHAeoA=;
	b=YaOwGNGUJlYrIDpZFqe393Fpu34eScQZ+yIIvLMTqsBwyenW98XFMeZmbsNMJVGLIy
	3WGdXxes4+h5n0k0GVXzHI0q6k1y2zXT3fS3EZZKPg0L+Llh/oT4vtRa+OTzUMHx8QXf
	oR4vzDBWUJJ2rnQJou8Ng+21y/vz5eUTSZHxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tftg1Zg6mi2n9ZH1FTjOFqxemV8gYHzkK8J7VVHAeoA=;
	b=ag1nxaQVtDZeKzHZk4ZrFZlq23+iWEExQu0FHVMhNEUqW0CSXPvjvmgDxjC/25SosT
	gp6nw+5P1qtZVwQIvcqkZLa9Mp8p20co74IRPbgrsBPWRFOoirRb2D7k88dawoqIT7cs
	uVdq9hZci3C6szGDrbP6Anjb1pu8yO7sEJEBbZMTzPaNMhj7bI64O7/ndm2MKxSp8VQ/
	XFH4XDTJlpT/QBU+RJWfXBPV1aU7ab9QfqBcnsJAnv+40+roO3x9kqlQvxrR4r98IjVP
	kQRa4cfySPPjcJshU0/F8RN6rysf4P6jv6J6ZuKW4nUHjrWp9Onb2VxdDd7R2+3pDPSN
	AQ0w==
X-Gm-Message-State: AKGB3mJyVT/0JC9N0XDuuddZWUuMZfA0HN4mruAjajcKMzgy2m1iMlYE
	vw5UiHsBe7J4JRnJT6hUpaNMCpl+4et0Fgt3VXMZlw==
X-Received: by 10.202.108.66 with SMTP id h63mr3465298oic.305.1513101837971;
	Tue, 12 Dec 2017 10:03:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 10:03:37 -0800 (PST)
In-Reply-To: <20171212041539.25700-1-ppandit@redhat.com>
References: <20171212041539.25700-1-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 18:03:37 +0000
Message-ID: <CAFEAcA8Vh=5mUi-0x0kdeKPed8so2GX+vCUm_hZoCDY5257DGA@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v1] display: limit irq handler index to
 TC6393XB_GPIOS
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, qemu-arm <qemu-arm@nongnu.org>,
	Qemu Developers <qemu-devel@nongnu.org>, Moguofang <moguofang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0od8/4kZ3avR

On 12 December 2017 at 04:15, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> The ctz32() routine could return value greater than
> TC6393XB_GPIOS=16. This could lead to an OOB array access.
> Mask 'level' to avoid it.
>
> Reported-by: Moguofang <moguofang@huawei.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/display/tc6393xb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> Update: mask 'level' value to TC6393XB_GPIOS=16
>   -> https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg01685.html
>
> diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
> index 74d10af3d4..0ae63605f0 100644
> --- a/hw/display/tc6393xb.c
> +++ b/hw/display/tc6393xb.c
> @@ -172,6 +172,7 @@ static void tc6393xb_gpio_handler_update(TC6393xbState *s)
>      int bit;
>
>      level = s->gpio_level & s->gpio_dir;
> +    level &= MAKE_64BIT_MASK(0, TC6393XB_GPIOS);
>
>      for (diff = s->prev_level ^ level; diff; diff ^= 1 << bit) {
>          bit = ctz32(diff);

Thanks; applied to target-arm.next for 2.12.

-- PMM
