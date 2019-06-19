Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp121455wrg;
        Tue, 18 Jun 2019 19:16:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2aF/dZf/byPGKR7BzvI8h4nrpRxfk4u3nf0w/Tn7bacDk1qX7kYwlwOGJEFT8t3ORDt9J
X-Received: by 2002:a17:906:c0f:: with SMTP id s15mr8903003ejf.122.1560910579561;
        Tue, 18 Jun 2019 19:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560910579; cv=none;
        d=google.com; s=arc-20160816;
        b=uqNBMkIdl0nrssKLRXxbFb5CHRjN/YwB31ubCwjqMZG7PD9mv3b/hRVUlPLxQyr8HE
         o1ve8ht3YTTj6owfCj8SU/QCQ+dB2DvZ7E9YBSVTpz4Ckclh+wHZ7U43RZlZBbrGPKTA
         jBd7Q5DXuUifSFjpkSXpiyFaqg+oY3D/eFM3ewTF3RHLbEYmDfdDkVbWtFB0nlO8RQOR
         Xj9NG+21SlMPeLZSOiIKTtFZZlJf7ok16xp6gPwsYqt3tLzoxHb5BntTqxx2ANyRbnUj
         cSyvJ+SJIYsS+MvHb12vyTouw0e1M+WwS8WO/oFP8iuF2V2JyxkNLWzf8CVCE5HjYo2s
         ymnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=XDrO1MtUPggarGj30KvTtRIqNt/7BAaBcD8oaDktB7Y=;
        b=kos6fOVI0jjgdJxqlTje35q0UgZyEQsKz3Y45YwAzUchzPQrEAuejYsgh+0ZjDy9Mo
         eTAXZH+j6HWU+y7ewe6xzwfwFT4sTmcNx1gMYYlHhGDhVb+ysVHD7DPl/xQqOuodvEMT
         Pzyd/jThYz4l61RRhNBvf/8wZu6KYPMbNNrdwpQLCw68sa8fGctTHDab0t1dbtVc732L
         dzYi50sXAw0Go3024ZfeLQrsenUqgBxRo4ZEO+cYXQHcUlQp2H+os0HUp969SPiOhl7S
         usd4R8UrxixNIeZ2uRufaaPDpHUCkaHZA2ljWcynIn690aW6PR82mw2fx/CvECdLZRq8
         x9ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=i4rJwgdD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si12498837edd.129.2019.06.18.19.16.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 19:16:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=i4rJwgdD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdQ94-0003nL-Kr
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 22:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35261)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hdQ8v-0003lk-7R
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 22:16:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hdQ8u-0007AE-7q
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 22:16:09 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:42551)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hdQ8s-000796-Am; Tue, 18 Jun 2019 22:16:06 -0400
Received: by mail-qt1-x844.google.com with SMTP id s15so18025973qtk.9;
 Tue, 18 Jun 2019 19:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XDrO1MtUPggarGj30KvTtRIqNt/7BAaBcD8oaDktB7Y=;
 b=i4rJwgdD94omQBG0OHc5EgZNCd55JR8D1z9nQZGcJRSG34uKMkgDaVcOTCOLVj2Bbm
 z/GodDSbB/hJjYXClOOBPIDqnnqTF7jGi+4d3JniHsUbMrHdvq5LA2iLDO1tgrdOTnXM
 TvPzZpplwl6VHalLtY+XYFGexpGxrvp/ZqE2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XDrO1MtUPggarGj30KvTtRIqNt/7BAaBcD8oaDktB7Y=;
 b=XCcY1qbMm1kY2uKU2R4nZmsG2i/E+BelfEf+XnBfTe+TGo9SRWCqjJ8cmGzaZAjUFH
 H+OQZZq/rRoz9uuoZjH26+bpiUVWUd1zGKEEfjKgIl8RzS/sRHPanYlHdQ+MlrqJplBO
 ip3v4pGmG9Lp6yRvI+P5QfzA9KM8RmwSbqAYjA7fUF2TUFwe3c214YmO4j4n7qV9zaT8
 ZMV3Kb84R4jqUUJH1dcWpTz90Kc/3tvYf35TZ76dKym+OpQYX9HXGwzmatPNJK8zotIa
 +N8z/fRkJKMIoGGEoEv8w5/87Bj6nhaOdhedJawOPj1xo710yiIz8HW1CCgXf07bbepm
 ov4g==
X-Gm-Message-State: APjAAAX5VUFpF3HPf0eiNceh9AdwUohYfNi2g/npUNMumnuQfPmbwY2Q
 2cP0Ux7hdwrFgXtojLrtmwYh7/CGpijLwIwnz2A=
X-Received: by 2002:aed:3e36:: with SMTP id
 l51mr102492320qtf.269.1560910565684; 
 Tue, 18 Jun 2019 19:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-12-clg@kaod.org>
In-Reply-To: <20190618165311.27066-12-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jun 2019 02:15:54 +0000
Message-ID: <CACPK8XeJymipv1BF0YcgAJWZAvh5awPY4WUL4fNoMR5CUGW87g@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: Re: [Qemu-arm] [PATCH v2 11/21] aspeed/timer: Ensure positive
 muldiv delta
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Christian Svensson <bluecmd@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WFe83Q6fRSEV

On Tue, 18 Jun 2019 at 16:54, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Christian Svensson <bluecmd@google.com>
>
> If the host decrements the counter register that results in a negative
> delta. This is then passed to muldiv64 which only handles unsigned
> numbers resulting in bogus results.
>
> This fix ensures the delta being operated on is positive.
>
> Test case: kexec a kernel using aspeed_timer and it will freeze on the
> second bootup when the kernel initializes the timer. With this patch
> that no longer happens and the timer appears to run OK.
>
> Signed-off-by: Christian Svensson <bluecmd@google.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
