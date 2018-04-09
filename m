Received: by 10.28.71.155 with SMTP id m27csp3047215wmi;
        Mon, 9 Apr 2018 15:06:22 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48SELk/5YZHhL+F86ocvYuoZTER5grSeLGg7N0/x0eWh2kc9a6KwTbvwIPuYyRB03cyLdqb
X-Received: by 10.55.33.70 with SMTP id h67mr36016238qkh.64.1523311582337;
        Mon, 09 Apr 2018 15:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523311582; cv=none;
        d=google.com; s=arc-20160816;
        b=mmMJ66j7Q8V6Gfig3LfdHC1vJW1f3t93YgR4hjnNpm9X63f7cApbvnsxAY8SOBtDyR
         EXtbrNJ0B213RDIhjGE2DYYl6Ehe423dmiutzwe7eIU4wOPnNuVZCi5gds4b8GU3DbfZ
         0t4MVEIueduRmP4ab/l24uN/pmqgmS4NOpqYIYVS+qmpI6jJwbnWvQ+BLaTMg1uFsfcI
         N5MQU6hS6Kf9HgjPobCeG7OysbLAXEX+mTV5JZ2apSiOpgElwObGia6fzB80looojS0P
         8SfvmfYS+MEWqssuFO11TiG3BXdYTkCd0gs2Sy2xzYRw54o1Ri+zc0uTT7Ktbl3m5JwI
         xQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=pFt/FAXeIVI3MeJwabtkZ+N9pDoC4tuyts9Tbeu6RQk=;
        b=z/I8e+2gWEYvB5NVpLI22H35Weew2/OWozx6PNfe6VVUFim0SMYcTzXQUaMez0ZLHN
         lYMjkL4V4gEtbPn/8tYFZTF2VIabsqbqoTrpirAJNlA9v0fYeWgjrqPYTSHXXVprvXYn
         9p9+g4K46Slda0EvUGctp++0mSiKq+UtyZVJYCUTs28gK6MtllIuQYpT1zhp39kOG6mi
         uOhEdrYfmkhAkNICmmUgc+gJ5VzitVEIulgTDOqoSsc31cG7QJxZ55Lsz35UPtl2zqMH
         cotbItslZK3jvDhCnvrY0ymX+Hcqf1Atwxsi/e9egQelI0KvldaLopegRkOEBazJpelc
         ++Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hAU1bVnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w51si772564qtc.319.2018.04.09.15.06.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 15:06:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hAU1bVnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42337 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5evd-000428-Rv
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 18:06:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1f5evQ-00040N-NX
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 18:06:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1f5evP-00089J-Oj
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 18:06:08 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:41684)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1f5evN-00084r-G6; Mon, 09 Apr 2018 18:06:05 -0400
Received: by mail-pf0-x241.google.com with SMTP id a2so6542633pff.8;
	Mon, 09 Apr 2018 15:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pFt/FAXeIVI3MeJwabtkZ+N9pDoC4tuyts9Tbeu6RQk=;
	b=hAU1bVntzcs6CCvb0npKDVsylH38LIKYRgkMBEvhuAzP/EqVrELaTyfwZDnSKHthtq
	OGXmIZKX95pvC5zhL0XWMg0WmFcFsg5LBxNVBkmHMovrmA4nDGlVABpxW+vBfiKwkF1q
	CocDCKr23cVDWBYI6pUv/MDSGIZNoSWkUsnpXZEjUJU/+hfzBvoPUDR0xY+JL1+OHiOs
	hEOWqomcBd/8IAl0M7oG6cm7dCBVbCWzmy0CcaAjueKH1h91lcCxWhIFharXW2/Z6+P2
	ndwEgXkF+/KlFGOJHF1k7j5/88upS3M81OlXPoKGMzGdr6+3n5znbB+wHpJNpAwNIM76
	oy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=pFt/FAXeIVI3MeJwabtkZ+N9pDoC4tuyts9Tbeu6RQk=;
	b=ICx3kktudmyZKx8KJ96j1tIhWnZl9ssNEoi9xxAjgG8fbYJtfd1+OMmXyUekiH6ISJ
	fLTkSS9YaUq8NwT+IKNDCU1sEiFzMnPs7OX61rcC4cESsQmRkBG8x6XR1Q992EKx1AAW
	dRIIB7WGeOcHb0vBJAGJq4dd5JibU4ity2vVjXHrDggDwF8jNt1OQGP3NdGu6g1cmxF0
	L7tkblJxy9cdqNdyyalCja06labofiasw7y2h4K8Kdy+kWF30fpxIed4mKy2+kajlxe5
	kkHdAHfYaFW4BwnqL+n7sQRxNlHhYimXVKEo0pyCeXO9gN+okNFhVvvgXkaNmNFKf04o
	iw9Q==
X-Gm-Message-State: AElRT7HGdQSuUMbVL4j1pJiyG5xOmoPLd6EHe+w19GqsyyyXjosdvO5a
	5Li7OIj7mD0N5YpEjYEGSSk=
X-Received: by 10.99.5.137 with SMTP id 131mr25580829pgf.99.1523311564255;
	Mon, 09 Apr 2018 15:06:04 -0700 (PDT)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.googlemail.com with ESMTPSA id
	u68sm2059508pfu.167.2018.04.09.15.06.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 15:06:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180409140714.26841-1-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
	xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
	n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
	rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
	Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
	n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
	AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
	cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
	Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
	eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
	LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
	Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
	94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
	86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
	I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
	VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
	+PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
	AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
	Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
	prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
	/E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
	jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
	VcROBqvtH3ecaIL9iw==
Message-ID: <3147e65b-b6ff-a49e-fc40-21396dcbea0c@twiddle.net>
Date: Tue, 10 Apr 2018 08:05:58 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180409140714.26841-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [PATCH for-2.12] linux-user/signal.c: Ensure AArch64
 signal frame isn't too small
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
Cc: Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
	Richard Henwood <richard.henwood@arm.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tEZkzZS3ptMj

On 04/10/2018 12:07 AM, Peter Maydell wrote:
> In particular the dash shell
> would segfault if the frame wasn't as big enough.

Ah, that was the critical difference in my failure to replicate -- the fedora
sysroot doesn't have dash.  As you say, the patch matches the kernel so,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

That said, what the hell is dash doing that relies on this?


r~
