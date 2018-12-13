Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1376801wrt;
        Thu, 13 Dec 2018 14:53:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XN8hsYgI3Ysh7/HPDc5FpxrC77NEOJTr/kjU4XKmB8gok09khgXQQaL4GkB6C7yN3WPmZB
X-Received: by 2002:a37:f706:: with SMTP id q6mr608274qkj.96.1544741590618;
        Thu, 13 Dec 2018 14:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544741590; cv=none;
        d=google.com; s=arc-20160816;
        b=gMbxqVyphVtvCMv6rD+LDdcLaLdTb2HTp/FTFBWyUCQE+C1opgc+6dGnLBjcmqIehv
         xy6F+ltXlY8C1R5AcRofc9PkLyifjdnmNTKanqqkvAonQJmSE/kKl+1Y3apZlfOSFPnN
         CxJ3s62weMMgeFz/8dyM5Kxj+eYEnZt61lcXcoveqqE/Alf2qzgUWwkOVTwMwY43YpXY
         v/+600iw5rq5UF4LuWNpepmCDrs2mkclkqMzxGUsVgheM3XWBATUHs9TvfhNe3oNh+Ny
         X3FdgMu3d6rkOZ9+ssHPNRMFalmTBCl+3Pdswo+vvlM9E61jgA48KIGEDAAPq81FLTVS
         SLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=ExUtziPbZ3bLGjxtwMKA0CwtFBKtI9rNWlnNXwN5uJM=;
        b=aYt5gXyf6s0X4DkIsdUvPwPcRgS9PRS5E1HH9x4/PvJ5HEY10ydKBjZpLavkHQzJdU
         hsKm2CmmiFKfbdKtT8qw2gcyPHgtLlmaluSpcAoKUeFxBMUmkpEt0f/+P/m6R8Vg6KZd
         LfK0QdJSTCsYeIFJgIzHniYa8EA4IOGtnqklRHVQGcx1sAz3DF4sSTMJjdVWv+7/PZIu
         zXHVGWVexLkC/o6V5TH8FcI0hD6fnLsojW7LJ7LebkK/RwYDYqYQ3ZoDEwEaDsNPJuhS
         plSf1k9a6BJKNUfTFYdjDzdfONm+onWGJ86eec0lYqf3R9bOxSVgG50v2+0vgmrLkaWO
         Tulg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aHanUtCR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f196si1922151qka.61.2018.12.13.14.53.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Dec 2018 14:53:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aHanUtCR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gXZqw-0004lb-5D
	for alex.bennee@linaro.org; Thu, 13 Dec 2018 17:53:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1gXZpg-00043m-7d
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 17:51:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1gXZpc-0003mJ-47
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 17:51:52 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33555)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1gXZpb-0003l2-Tg; Thu, 13 Dec 2018 17:51:48 -0500
Received: by mail-oi1-x241.google.com with SMTP id c206so3069737oib.0;
	Thu, 13 Dec 2018 14:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ExUtziPbZ3bLGjxtwMKA0CwtFBKtI9rNWlnNXwN5uJM=;
	b=aHanUtCR3WypJlu5263y8dkyeD/H8+ZjW12SOyIzfXiLtiSxH02YOV52d8LBgMt+EA
	ShWRE7QE4P37DdK6cSe+/JzOzZYMSLoJBb60Pfim5v8hIn641N4iwPIubiH+bEr/KA/B
	+pNEP86SCwBbbRnzoMRNcx3fikH2o94hShkT1dU7z20dd6fT6rZWCS2exjIcblscLYAw
	ULml9NdhlZFG5Dj43zLOOHTJZsV+RyeXLH9lfH+xy9zCjsqLKuRDNIKnN/9W8Rg0dO3t
	wo2NZTcfy48DY3e8ircE1HYOOWq/bqr8sfObVFZtC2L/EvTIxy+Dt9RGLQ2siHeYVLLS
	yjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ExUtziPbZ3bLGjxtwMKA0CwtFBKtI9rNWlnNXwN5uJM=;
	b=IrwL/i9O60984hKizbOD9QM2jBaCeYT7KmBrZmRMF6QtjD20zq9qLA3b6GPidyz/dl
	Vp8x4r6umXLlHdjQPYGSvyRCBZ9cTqTk2B13epqd2TO7O9D6ks/VQBiKhsys3X8YWfKg
	q17/r6EkCAvr9iUcb/h4M0VhMASzjQZmf+5Db+lzduDMVPdqqr7XJF0EKx6ZEZq6ai5b
	rfasQc++gwiTn7qC0mscgfj1dP4kNe55Du+lVyPvfyyxOJH/hQlj9U5Az0h7FPUtz4+S
	AJDukgij2vWBSVN9Bab1USlqEypUnvj8mdHdLNt+SV64Vr9spx8nFrwLJ238+A1f9YtK
	si0Q==
X-Gm-Message-State: AA+aEWZ5fC4MGPT71HeDh/gPtsk934Mrwji469FDxCSj6v1V3T/dlnO7
	YNP4LslPPlsXa09lapYJjkTVP5RK
X-Received: by 2002:aca:3141:: with SMTP id x62mr424754oix.194.1544741506577; 
	Thu, 13 Dec 2018 14:51:46 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.googlemail.com with ESMTPSA id
	99sm1457545oth.20.2018.12.13.14.51.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 14:51:45 -0800 (PST)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20181213223737.11793-1-pbonzini@redhat.com>
	<20181213223737.11793-2-pbonzini@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
	mQENBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
	n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
	rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
	Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
	n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
	AAG0I1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+iQFBBBMBAgArAhsDBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
	cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
	Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
	eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
	LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
	Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVuQENBFGuLC8BCACyEx3x
	94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
	86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
	I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
	VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
	+PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAGJASUEGAECAA8CGwwF
	AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
	Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
	prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
	/E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
	jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
	VcROBqvtH3ecaIL9iw==
Message-ID: <850d1216-a4b7-e110-e9b9-e1beaeeaf6fc@twiddle.net>
Date: Thu, 13 Dec 2018 16:51:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181213223737.11793-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH 1/2] remove space-tab sequences
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	"open list:ARM target" <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b0fmzmEiLv7C

On 12/13/18 4:37 PM, Paolo Bonzini wrote:
> There are not many, and they are all simple mistakes that ended up
> being committed.  Remove them.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~
