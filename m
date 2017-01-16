Received: by 10.25.205.13 with SMTP id d13csp64968lfg;
        Mon, 16 Jan 2017 07:07:26 -0800 (PST)
X-Received: by 10.237.53.164 with SMTP id c33mr32070749qte.121.1484579246307;
        Mon, 16 Jan 2017 07:07:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m70si14419518qki.44.2017.01.16.07.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jan 2017 07:07:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cT8sV-00075k-ID
	for alex.bennee@linaro.org; Mon, 16 Jan 2017 10:07:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cT8m3-0002Ak-It
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 10:00:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cT8m2-0003cj-Rr
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 10:00:43 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33826)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cT8m2-0003cY-MT
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 10:00:42 -0500
Received: by mail-vk0-x232.google.com with SMTP id r136so74621780vke.1
	for <qemu-arm@nongnu.org>; Mon, 16 Jan 2017 07:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=COx75FlR8yfW5LIWL3K7LuQd8iFhOHBNsDKFKOmvvFc=;
	b=kCN9/8RwICrO62px6NHG2Wj2Vij7T37puPGpA2tcIjjVum4ZpIu1D9KIt6/9T2sQNJ
	Fc636Dt098AMxes0xs37BtJpZkRjAdhPWNOTr5q2aldBTyALeMs4Pn6F4CDn3lkxZu+2
	yVfjSa1E6OWjfZgIBKcdn91B1T19AtraiiKAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=COx75FlR8yfW5LIWL3K7LuQd8iFhOHBNsDKFKOmvvFc=;
	b=I/VOnDQAVPJDLyrbFE+zH32hQpXFlstY5UzALVQnx450Alu2DpjJY6bcoz8k0hO5Z7
	W6PZlusWCEZWP7OhBZyr5TWLKaTTG1ZcxeFgx31ndEPwdsBGFhtkJAfxMNST8uzEeNK7
	PLGLmZ4ksRbRuxg4hynRn86hru/50+/pdcV70TTBoRlG2vaRIGnzqSBKESS2ZV9WorGH
	nh+XfApshJKFrDYH8ZZ6zSUKIpi+e1vXSZkYVxa59qVq2sEFTEXEGiyl7D36K9bkZn73
	dGmTOTdK8JINPxlsEoMsTC9PDVIr/U5dYy21zx4620r2erqEY5ecKp1H5uYj8UBJKmzr
	y/7A==
X-Gm-Message-State: AIkVDXJoPO/2ECH+GAW/0oVGh0vjGC167EjYbrdM+gczNjkQCi3R3a6sTSgLreqG99st1mlSuU2iiouIVg7KeZcS
X-Received: by 10.31.165.202 with SMTP id o193mr15779102vke.95.1484578841937; 
	Mon, 16 Jan 2017 07:00:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Mon, 16 Jan 2017 07:00:21 -0800 (PST)
In-Reply-To: <20170105043430.3176-4-alastair@au1.ibm.com>
References: <20170105043430.3176-1-alastair@au1.ibm.com>
	<20170105043430.3176-4-alastair@au1.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2017 15:00:21 +0000
Message-ID: <CAFEAcA9SxUyT1_ztQ-wb4DwPAzmHcBkh8a=pQ76+7A0r5PHYFg@mail.gmail.com>
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-arm] [PATCH v5 3/7] qtest: Support setting named GPIOs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sQKW991RGxLA

On 5 January 2017 at 04:34, Alastair D'Silva <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> Some devices change their behaviour based on the state of their input GPIO
> lines.
>
> This patch allows testing of the variable behaviour by providing facilities
> for the test to set the state of these GPIO lines.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

I still think this is wrong, I'm afraid. The GPIO line is
already connected to something else in the simulation,
and injecting a value that didn't come from whatever else
it's connected to is likely to confuse things.

Tests should work by programming the device that is connected
to the other end of this GPIO to make it raise the line.

thanks
-- PMM
