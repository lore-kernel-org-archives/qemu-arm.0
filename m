Received: by 10.25.44.15 with SMTP id s15csp4345077lfs;
        Mon, 24 Jul 2017 14:49:01 -0700 (PDT)
X-Received: by 10.200.11.67 with SMTP id m3mr25125925qti.265.1500932941660;
        Mon, 24 Jul 2017 14:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500932941; cv=none;
        d=google.com; s=arc-20160816;
        b=PLbLc/wPuU8Jl0LFeV3xuUfFu9vp8IcQ+TvwPD4hyfR6egXDa0S9J7v2GPMjopCune
         /WOUn6BtZqE+23iG8eMIfigrGx/SegfGk9fUyEXVk73y0XfVadok1DKd/qvmwBD/scrq
         Xl8jBqXEY608+mrxMeHL4WomqYzZbg3XNiDXDy7H6YhXAXTIrmnvDa2yl9BGjg6JqS2l
         pHYrj5orbdCpfd1NWjFJ+LU6ktFp5fPTHGDCk19UtxgsArG1W68WSCio/dDWBVCDPeod
         7sFXMrx9bBrtJjN+URyFCnHp+MjI3pECG0Mt+HSzUdnOcOguIGojSBhZKRYyIIJdDtSE
         AOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=P5ns4JHRArsx3wEtKJftJwfUmCef7QjqGRGai5FEHFk=;
        b=ixP+J4J6/OTsqJQYBUr6TAEqN9JkfqSxKfYKqbTU2MeL3CpvvB+gFyQTytUcz9Bke+
         +XGvhi81qMaVgm5H75FwrgDVeaUoIIEI8+ww0UAU/eGqqCGb7wVT1rKCnAuKwgCKYIYe
         NaUwPrrZMQ23aoqBtlVFzHMGeRWtlDh33wrB4orWA6aCvZNCVXjateRb8MDsS5Bb9V0J
         o/0mzxPmU7+svXML6dGMX8ZytVqjuUvPq+eQhwgVF+whGF1DbQviHXLaOhqh7B1PF5MK
         8H8fxFL5mrTBYE3hdr/iLH8v+YLyRtZ9XgFJo6uWigVWYiMuukXmy6M7SIUaMMbmapTo
         w9Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=JiRSKLkm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a47si9703568qtc.370.2017.07.24.14.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 14:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=JiRSKLkm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZlDm-0006yy-VN
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 17:48:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZlDi-0006yk-RL
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:48:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZlDd-0007FE-Uz
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:48:54 -0400
Received: from mail-qt0-x233.google.com ([2607:f8b0:400d:c0d::233]:37735)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZlDd-0007F2-QT; Mon, 24 Jul 2017 17:48:49 -0400
Received: by mail-qt0-x233.google.com with SMTP id r14so44385907qte.4;
	Mon, 24 Jul 2017 14:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=P5ns4JHRArsx3wEtKJftJwfUmCef7QjqGRGai5FEHFk=;
	b=JiRSKLkmSVGyudjY5wOGby3sLWkXwsEPG4ueR4/fuVYez7bg1N23tYCCSyAuPwKW/Q
	tHInLkqHnteaLaCDm8FquAU0q0Nf1rgrvsdRrW19h9LfHDMv8E2F5x1idi9N5KmPE/da
	8uLisZMdnEiUqHuxs1kKSnPmBo6NmhrQcNhwL8r95uiqougbty4M6UoSsXgzpfE9BBiq
	B3G+5b5qGZxM5S8bsxK2dKUgvHn7aP2mhy7iWpqnO3s4pmjgR7Ox1AlOIUliSB676E1b
	mn5NYo5Ls5760mslv13p66CChb3TceEHuavVb5dl12kSx53JVO5qwMxt7oj3TEhndcVA
	6W0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=P5ns4JHRArsx3wEtKJftJwfUmCef7QjqGRGai5FEHFk=;
	b=r1p4qUH4DAZbUNaV1F7aBD5gZ2jtVFuvmnMBDm3LpHPmPFuaI6McMloXR6hCIH7bsJ
	CK7jk6H3KvtjA896LXTJnV15FdIdsyPowrgy8wQjVUBFIvR52ijkqJwAUFbRIWTk6pIp
	lcaOWtT+GiLzxOUrQRRsdoSUiHk3/xUS3YHY3LAN8F2vX0Sxvsw51nJLbcxIo+XzbgRI
	lWv6agfKD9naHovWUWJlkHBJJHUzFmXvK6w2121IfxhbMA2UVs1W8XJzfJy9Z/SZgQG4
	q4em2MQW5g9WgAXfh/XbIsvaXFNwQb95+tx9NCbR12avYQ45Bcy/HXNcLiVF3jjE36Y6
	9zGg==
X-Gm-Message-State: AIVw111sGPosHcxeL5KGPq6XVbYRsGc7Z1HUiqzQwCGedcooU4lS8NRz
	WVwAKPQem7Al0o7aq6llPw==
X-Received: by 10.237.51.199 with SMTP id v65mr8719509qtd.31.1500932928961;
	Mon, 24 Jul 2017 14:48:48 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	p12sm9390435qtp.20.2017.07.24.14.48.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 14:48:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-22-f4bug@amsat.org>
	<CAFEAcA_PRH_BuUOTtC=cvRFT7Gtiwt50T6C3avm+Sy13aDS4tg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ae090923-3523-3e56-fbc1-65b270680939@amsat.org>
Date: Mon, 24 Jul 2017 18:48:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_PRH_BuUOTtC=cvRFT7Gtiwt50T6C3avm+Sy13aDS4tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::233
Subject: Re: [Qemu-arm] [PATCH for 2.10 21/35] arm/sysbus-fdt: fix null
 pointer dereference
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iDgzNHsXF/RV

On 07/24/2017 06:09 PM, Peter Maydell wrote:
> On 24 July 2017 at 19:27, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Use error_report() + exit() instead of error_setg(&error_fatal).
>>
>> hw/arm/sysbus-fdt.c:322:9: warning: Array access (from variable 'node_path') results in a null pointer dereference
>>      if (node_path[1]) {
>>          ^~~~~~~~~~~~
> 
> I don't understand what this warning is trying to say.
> We can't get to this point with a NULL node_path,
> because of the previous conditional, which is using
> error_setg(&error_fatal).

Ok I see, Clang is unaware than error_setg(&error_fatal) is a noreturn.

Patch dropped.

Thanks,

Phil.
