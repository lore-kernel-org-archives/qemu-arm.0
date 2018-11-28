Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1084514wrt;
        Wed, 28 Nov 2018 06:10:25 -0800 (PST)
X-Google-Smtp-Source: AJdET5ecJvWF2x5fvePXY6trxOxtVDRjs3Rozv3YZc3TewH6oMrErDMIWFQATKFORvjoJ8CIP0gp
X-Received: by 2002:a81:af68:: with SMTP id x40mr38671817ywj.372.1543414225569;
        Wed, 28 Nov 2018 06:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543414225; cv=none;
        d=google.com; s=arc-20160816;
        b=O4oA2tq4zDuzh4tu9XtBLoujiYFZFyV/slHCJt8O4/STfS+IRl+T5D5LcfF6OJeZPV
         p657EB9CzkpWkFp5d2ZX7PgTFM9Q0aJfEKh4anViC4QLr40bz0592SyMBay9y8K+Tx+M
         6b2sa/eHg0AcxEg+ylA1zCsPYZJtsQ6skUgth/B4fPqq4td/q6wJ+aAP2y5eye3JFhpv
         a/x5f+d7mMWGChzLZPmd3m6JFBz/3Ipspo579WbHET3aVPjqLcQ+r+XsZd0WmGBfKDMA
         8mubTb/pYPgB88h1J2UkpUGdEu6I3maPAaxN/Z7H5uNZ310zCSyvItm/Ti8IJv1HSKGb
         W9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=yUo6iM654mjdXxC5nuHrJKtcdVuHCiFIliNRMfzodLA=;
        b=EQxxav+XMkqYfF8Kb8NaYJ+CSp+Dh8PEsVAEAhj+0L3VT7p99h8wVqBmUEtZtgMak9
         KOUomrnFQbX0ERwaO5nSWwJ2gbtMBxxubjZWYqBWF5BUa66vYNnF5nCzkJU/RoPZAaAF
         DURc7C2s1017a1/BwJpEtHyN+Gj0MZR+OKOX3rujSzz2pK2qTSt3VoGOogrU7/bLH3yg
         PUENjlTOZiFItehShcsbQdD3Ykw45l6DFwoco8PQvYIkDOr8OTMkNYco86WEWs7iv8H6
         JEdNQctCEta6JPlt6hiCrx0ro0GxbDaetJRjIsVzyj6Xc4l72kUc4N2YVP3eFQkg54AU
         gJ5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CaHMK2Lm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s3-v6si1422195ybe.339.2018.11.28.06.10.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 06:10:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CaHMK2Lm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS0Xo-0007wY-Fs
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 09:10:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1gS0Xc-0007wR-Mw
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 09:10:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1gS0XV-0000PL-L1
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 09:10:11 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43030)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1gS0XU-0000Ng-B2; Wed, 28 Nov 2018 09:10:05 -0500
Received: by mail-pf1-x443.google.com with SMTP id w73so10214041pfk.10;
	Wed, 28 Nov 2018 06:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yUo6iM654mjdXxC5nuHrJKtcdVuHCiFIliNRMfzodLA=;
	b=CaHMK2LmZqkFVS9bZKAqfMdGPuDJ8hgJR+Ira3gMkKkl88P8sDTo4HprzDekJqaNxZ
	Kqgl6EAXajU6sLqJLgXJMeXGMNVlMTsfsxbW6bj1jeZr1dVR+Z80M8JNKTXfKfSzNn08
	KHFloYB3PQYoOhaotRZaGVyqE2Owfi3HzCFc6sP0KMdU/2xcAXzLvG/P07r4rIJUFJD5
	SUalwcv8IbnBz1gBIbvAYNaXhyxj2cmI3foUJ8sNCxenO5nS+r8LCyzVO0eONm8IgXKi
	4bik88stCYi7mTCGw9oiK9nWFlaNnEDPkPpxarDmAtHyGZEZ/TGNi6VCAABp6UpbbK4y
	mUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=yUo6iM654mjdXxC5nuHrJKtcdVuHCiFIliNRMfzodLA=;
	b=oYGTtQHXF+ljo4qleg0cdQr4fj4MJ0aVddczTrOJ7e0P1o4XVv0HU+7YHP8E4e2Bta
	pkWLLuigBqt4BAjDCMaD/3k9xvm2jZv//y3fewgwTsxsdn/+NQmTvjTaj6N/fmPVRGMq
	FWB7enoyeTXzlVJKBqSeR2lOm9DzdtaCaHbxZ6+3m37+2XDpRr4xMclr7F6/CyDH1/86
	UJiAfqvFrDT7yb2Mpjv0g3Q4e5nNXOv98mxf3tCX8cLtxTPtpu3jR9+yYT9IHCA4+hBF
	v9HvTf888jByE+Yhy+Mn91Fe+WDdGCknHEuLxWs8W4XNnQ3tDj1xRMHspOhmFOM+P4AB
	ZrDQ==
X-Gm-Message-State: AA+aEWYRmGC9fKXZly2BQ9ByArTF3ScRkqoEcXe5aqe5xSHCQSv64mVd
	uuMiNDyC5N/RAjm8ocNNBOEtPJEx
X-Received: by 2002:a62:30c3:: with SMTP id w186mr4942798pfw.39.1543414201599; 
	Wed, 28 Nov 2018 06:10:01 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.googlemail.com with ESMTPSA id
	y6sm24014192pfd.104.2018.11.28.06.10.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 06:10:00 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-devel@nongnu.org
References: <1543399094-2260-1-git-send-email-thuth@redhat.com>
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
Message-ID: <cd4d71e5-e24a-17c6-d49d-27ed87bc7f9d@twiddle.net>
Date: Wed, 28 Nov 2018 06:09:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1543399094-2260-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [PATCH for-3.1?] target/arm/sve_helper: Fix
 compilation with clang 3.4
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aVIlKU4E1axe

On 11/28/18 1:58 AM, Thomas Huth wrote:
> Clang 3.4 does not know the "flatten" attribute yet. We've already
> introduced the QEMU_FLATTEN macro for this in commit 97ff87c0ed020c2,
> so use this macro now here, too, to fix this issue.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/arm/sve_helper.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
