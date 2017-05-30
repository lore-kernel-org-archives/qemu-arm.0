Received: by 10.25.0.6 with SMTP id 6csp1736967lfa;
        Tue, 30 May 2017 02:48:15 -0700 (PDT)
X-Received: by 10.55.143.198 with SMTP id r189mr19792312qkd.150.1496137695669;
        Tue, 30 May 2017 02:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496137695; cv=none;
        d=google.com; s=arc-20160816;
        b=P1qMNfoTSBsj9wsM6Kqky013V3ESGuAi1t6oxhYHKGOT8PJ9TzNwqylZcjHWzlun+5
         LVl7iU4vkO8vvzGo0urY5bY7Ph30HA114w6F4AoajjZ3Hn7L+X4bQy6G5twzHzhsYx5h
         9fiBTGR1Wx2Op5wze1g63LOlC71VZ8xcyoD8hkP9A7H28am8oyZMeNKPeTiWF6pM9veK
         AfxzSUyzXSSJJ7X6e1DayVFWt3hDFAopgrePx4aWw/7ybLOVtzdswaq48GEa/kD8Rhth
         6QR0NS2fAF4QiVS/w2+iZ2jusffeChhdQLj5Jqrf9AQYWXIoSCDK6kWZTjgPGwiPJPGX
         SUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=siyQ1A3vIi16QgQjtsQPIicndwWp1XpZgMaZ35FImHU=;
        b=ncEHnLUHXWlblS3dIJ8Kctr/YNhsA4xd4hpErZ1ojippvKF5aLqNbIpCb00wygHaSx
         hunMfheutD99vvjyBQj1tbOq5QVfadZK/tr6EBZw1Pw7obNRLaOS7HhjQsGlNdFb7Byx
         QDw+ezqJHHBH/zN+oLdJEqzVUR8iWlfW7h1COrjyP40g6POnJC1qktOUleI7l8CLs4pa
         tAtqLJQUt+Xul/r+ZJUxCg8oUq8/wc8/+nuWMhyCXPH+PMlC+jP5cTnJAoFN9IdosPGN
         LMa9aHt9q6XEc4nb/RZlYaICDnFIpoUieZeWHUtd+53S+IMFdDpblYVJx+n5Qe5wb0Pr
         kM0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u14si12426437qtb.74.2017.05.30.02.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 02:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFdl9-0004qf-3f
	for alex.bennee@linaro.org; Tue, 30 May 2017 05:48:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFdl1-0004nV-Ac
	for qemu-arm@nongnu.org; Tue, 30 May 2017 05:48:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFdl0-0003ni-DQ
	for qemu-arm@nongnu.org; Tue, 30 May 2017 05:48:07 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:38019)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dFdl0-0003nS-7r
	for qemu-arm@nongnu.org; Tue, 30 May 2017 05:48:06 -0400
Received: by mail-wm0-x235.google.com with SMTP id e127so92370078wmg.1
	for <qemu-arm@nongnu.org>; Tue, 30 May 2017 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=siyQ1A3vIi16QgQjtsQPIicndwWp1XpZgMaZ35FImHU=;
	b=CkLhpiumXoebIV4DgInC3497cNu/NwSlv7ZnOkZzijL5xekp48hVhYa9YFpg7P3T8d
	ek7utQdNJMU9ru3sFzN/UBNNlBD9XtstfYVNJ/e8VWsYoFH0HAU06Rkjmqq9kyxrdMje
	iZzyUJVJj8ZrAowR3aQNtNQdZxEJ1mMel5V5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=siyQ1A3vIi16QgQjtsQPIicndwWp1XpZgMaZ35FImHU=;
	b=hngYnM4BKKffHiIOOlx5bvAM5gFF9gFMm/DKyaaDNTdoDEVTAxCpMR1LTJQ5L+Fs1J
	KWZWP4hd38W3TU79tMoIonkvrx6tabT7ghD2sXMdNadbNxtJz0aEpYglE9OcPBVQ7Iw1
	aJkFPkYb7zDHT5Pi8/CdBZNhm5UP7fHhqy3pBiQq/1rTD6V7O000p6gKE1EB729cEgYl
	8Jm6JWoWQcbmvdh901WpXGZxMNwtXBwHhUlT/uel1XcK5QAO6JvkCXMtXeXey3uUUcEF
	JvFlugZuT9Jr4g3kwQME+uzNnj+KtS9ga7FvLQ7TEjQnwLiKo6mnKp7PO1R6SBGPrm9R
	A6TQ==
X-Gm-Message-State: AODbwcBzvXz4AmQW/ZgsANtvv9ZU7z2oDXvuVhE0/lGu1YklWPcDcrub
	yTcSbeY8CDhRn7zGW4/LcjsgrgxVLp3j
X-Received: by 10.223.150.139 with SMTP id u11mr10512253wrb.195.1496137685120; 
	Tue, 30 May 2017 02:48:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 02:47:44 -0700 (PDT)
In-Reply-To: <ce532829-b11b-7992-3fc4-3e21210c66f0@amsat.org>
References: <1493226792-3237-1-git-send-email-peter.maydell@linaro.org>
	<1493226792-3237-3-git-send-email-peter.maydell@linaro.org>
	<ce532829-b11b-7992-3fc4-3e21210c66f0@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 10:47:44 +0100
Message-ID: <CAFEAcA-d1oZazep6-HbKDJ7dY-gAZYf+MXghDPcKSHGKWLTnEw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/intc/arm_gicv3_cpuif:
 Don't let BPR be set below its minimum
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mRq2ySv1mf8p

On 14 May 2017 at 06:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> On 04/26/2017 02:13 PM, Peter Maydell wrote:
>> +    minval =3D (grp =3D=3D GICV3_G1NS) ? GIC_MIN_BPR_NS : GIC_MIN_BPR;
>> +    if (value < minval) {
>> +        value =3D minval;
>> +    }
>> +
>
>
> which is:
>
>     if (grp =3D=3D GICV3_G1NS) {
>         value =3D MAX(value, GIC_MIN_BPR_NS);
>     }

Only if you assume GIC_MIN_BPR must always be 0, which isn't
necessarily the case. (One day we might need to update it to
be a per-device configurable parameter, like the VBPR min.)

thanks
-- PMM
