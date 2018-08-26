Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4177680wrd;
        Sun, 26 Aug 2018 03:57:48 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbA1nT/jvycdN8otHRCBxeU83rBRqM/sS0gvqrYIoAixu3+ctVYTYznfyyMbMg3ygJw1ppG
X-Received: by 2002:ac8:2d8b:: with SMTP id p11-v6mr9627221qta.0.1535281068336;
        Sun, 26 Aug 2018 03:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535281068; cv=none;
        d=google.com; s=arc-20160816;
        b=OksQEHlDIwQNQIoa4XBVe8E+dv0SSt80gAjlzEaHoq5aM7ud3tdWAJymC+7q6237lN
         u8jlzHfSrL8bioe6LlL+RC3QHgxKGOrvSwgYz1Lc9UkOt/AsvqTRrH+aZLYvH5XzbXYX
         wOqK1rB+Sl5l5Ja7DVMddoSfcLzBwCmbkN8ww5GTn5BELGnL1HF1o4IlJ7p/BqMnoX6O
         T4pvr/PPPJ7MjwAQ4jjisCBB7h7e9Vg/fp9pcEHB+5R9sjHOT3USv8N6sqViZqUHFcQX
         ZfZ7jeajFGwEIy0/So498gcD4b5PlPHiIQgreq4RXtHcNPxMGf8KkldKKutDjpuCQUAw
         rPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BOgp2VOjtaUW95X19WntqSXHHod557C3kkBHyAlk7Gg=;
        b=m2b5+UaAwzViU7Lk06o2MpeCILQ4MQjMd9rOB2zRGrC0w3v/QwZ8jdVGQbs6c3k5iR
         J0k7QLGQCmCJtMAkIOqfNtf5RE/6OAbh3Frj8eMukxCzVqKCizLQKzwsXv09/Vg6CiET
         ru9C/RRYaCvV3dfmhXcFT5DX88yv/AYcbcKKWi8zk7JQz0PIE2ZEeKIQI7oaCXtqTK0D
         USl1W1Fm7l1xLIcH9ykDYxpqlCxvRJ5wCV+B2xh2IAI9Fmx7pGrETgofsLgNL+JDjcL/
         pw3uPPxyeoKOInFqmwEqDF/8M1pEXmsi2NUO7TdKNlLymZvkUxitwDtI/x2IM3uJWpgw
         +12A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ICqPG3w3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d75-v6si2661247qkj.254.2018.08.26.03.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 26 Aug 2018 03:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ICqPG3w3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ftsjr-0007cP-Qs
	for alex.bennee@linaro.org; Sun, 26 Aug 2018 06:57:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ftsjh-0007c9-Vh
	for qemu-arm@nongnu.org; Sun, 26 Aug 2018 06:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ftsjh-0004FO-16
	for qemu-arm@nongnu.org; Sun, 26 Aug 2018 06:57:37 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ftsjg-0004Bb-IF
	for qemu-arm@nongnu.org; Sun, 26 Aug 2018 06:57:36 -0400
Received: by mail-oi0-x243.google.com with SMTP id r69-v6so21961229oie.3
	for <qemu-arm@nongnu.org>; Sun, 26 Aug 2018 03:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BOgp2VOjtaUW95X19WntqSXHHod557C3kkBHyAlk7Gg=;
	b=ICqPG3w37hJ3xOULcy8vtzWTZCw0HXMNFy4zz7rRJDe/PjayNDBkWh66y1JD7eOR6y
	5O0a69w4ovaJyMNA5jUU3viickRaZSh+R0LhiDGZn+G94Du0GXmoIIzGCPD1yC6DlnRr
	mBfS2t2UDZwCyXgLJtacG6E1hBKy7+ti4KCys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BOgp2VOjtaUW95X19WntqSXHHod557C3kkBHyAlk7Gg=;
	b=jqfXyJElBfmBrPGEZPIOeDm3Wp36GCgEe0yvFY/QMeevdczVFu9xE9Xad9Sv01Dq0/
	bSvWKEMzsHA1CbxQAl0ibNBZHDDb2d7UkgemZSPGMdmkEObigUSH/c+jJxpX+D3MX/mm
	cXFOSpZSMNOBS2U/Rdcrnlh8X5WJVTBBMQk4J1tACjDf0D0S0Gu2z8Ejjyg1XfbO3EZ3
	5KZQaf/OEThwc2TICgkU+xlIfd2/WSMLuoQ6C5cXUqyN8jooJAimwv/YjRTp4L4GRgXy
	7zVfvE0rsrUrh3O6nLgfbHWp4ZEL7oKZSEFcVumgksCfdb0WedKQZUkc0d9kqRonGDnp
	VQOA==
X-Gm-Message-State: APzg51Dr7WWOYh4ezEtsWuChnc1wouawc5vJ0sl8LTkTILeaWBAEFO49
	oh6sov7IRPtsmAO+dvust8LQCJ+eqoZjEmnI91lpIw==
X-Received: by 2002:aca:dd0a:: with SMTP id
	u10-v6mr8515809oig.171.1535281055896; 
	Sun, 26 Aug 2018 03:57:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Sun, 26 Aug 2018 03:57:15
	-0700 (PDT)
In-Reply-To: <CACPK8Xeqaq2=Ey7cDxjQZrS1nw9mvbVsWd5ObOCDVVAuu0T8eA@mail.gmail.com>
References: <20180816141303.20518-1-joel@jms.id.au>
	<20180816141303.20518-3-joel@jms.id.au>
	<CAFEAcA9N_H2PqVUP-W=Sp-SQ4WYpbu5fqyN5hxkHdHGocX59Mg@mail.gmail.com>
	<CACPK8Xeqaq2=Ey7cDxjQZrS1nw9mvbVsWd5ObOCDVVAuu0T8eA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 26 Aug 2018 11:57:15 +0100
Message-ID: <CAFEAcA_oQ_6Gx2jWAsv1pL28SocRP+TiSEN6Q_6Nj_9deKGAUg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v5 2/3] arm: Add Nordic Semiconductor nRF51
 SoC
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ke8flLoPVxh5

On 26 August 2018 at 01:48, Joel Stanley <joel@jms.id.au> wrote:
> I agree that it would be neater to do this. I didn't as the flash is
> part of the NRF51822 SoC, opposed to some external flash that is on
> the microbit board and connected to the SoC. This is mentioned in the
> comment at the start of the file:
>
>  /*
>   * The size and base is for the NRF51822 part. If other parts
>   * are supported in the future, add a sub-class of NRF51SoC for
>   * the specific variants
>   */

Oh, right. I'd assumed it wasn't fixed because it was specified
as a property on the object.

> What would you prefer we do here?

I don't see anything that seems like the really obvious
clean thing, so I suggest just doing something that seems
reasonable. I think Steffen's patchset also had a change in
this area, which might affect the decision.

thanks
-- PMM
