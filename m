Received: by 10.28.71.27 with SMTP id u27csp772890wma;
        Fri, 26 Jan 2018 06:34:38 -0800 (PST)
X-Google-Smtp-Source: AH8x224FZsVaFWHDMKdHuwHKlvqeit11q8tL9EPTg1RgFRXr0ZXmJSJ5Fu+BNbqYql9Ups2Z0Jdq
X-Received: by 10.37.120.17 with SMTP id t17mr11357372ybc.502.1516977278092;
        Fri, 26 Jan 2018 06:34:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516977278; cv=none;
        d=google.com; s=arc-20160816;
        b=cEFzJpuFXTCQuag5NH3QXVO9moVUvnYsM9hQL1omob9vbeNqgdNca2rG3kpEf0muTe
         a0jkOiJRJhahiKH9pA0ziFyLlO+txTvVl43bNqEUQd1R4inbHbbGei22tD5UCmipJ3Td
         zW+Su5tftN1pdMcpJZaaT1/Hg72m39SRR/uXNiaNYcBHcNoqJ2kRxQFCc7bKCaqja8Bp
         gqgw1qTKlUIOdNceQ8pVyHnBNKFrj5+QikVofsLRpt+VOcL534Gewk8ooP8sxcQ1OgzV
         /25PR9zjdRTYJTsn2FlLbohk+fPnplX+eR9LC+kqpvb7K20MEve6exdGOa5sg6WP3NLX
         6Upw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=OUA6x4HBLQgGA2ALyyfBhraesu8Df8hQL5BsxiXYxxw=;
        b=tc/OvlaLLb/MXh23/Uw9r95SysiZn/YQhITCcbe9MvUaWpieymdkDpgrT14zDcu2SS
         HdzPKuyzRl4vVqaJm93mmdi7Ab5Qd2PC0MGdQBr8NiS5SSAUtj9glmY1U9uC34+Cr5ps
         qu2FrCwQxSeqRKC5IJTFJBKHNRsAgBh1yxsjnBZnDLMkJRzahQm/vQmNq6HVf6POVd2s
         4wJoKAZmZ9M7e9YtHYeFb+9okw7ZhSRPoUBLQoTD2xV+hmHE4iDzPULi6rdZg9zOfKpw
         f2wFKGJA7DmCdM4V/4fKk2hXtX6oVbyLinRGmQZGr62Wv0cs7zJOCX7mccygKbho30gK
         inmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=en4oqncj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e88si3676282ybi.41.2018.01.26.06.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 06:34:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=en4oqncj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef55R-000329-El
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 09:34:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef55J-00031r-2k
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 09:34:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef55I-0004M9-Bw
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 09:34:29 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:39830)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ef55F-0004K2-FC
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 09:34:28 -0500
Received: by mail-ot0-x242.google.com with SMTP id d9so558222oth.6
	for <qemu-arm@nongnu.org>; Fri, 26 Jan 2018 06:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OUA6x4HBLQgGA2ALyyfBhraesu8Df8hQL5BsxiXYxxw=;
	b=en4oqncjNDj92H1sBzhp9cZAD7DBBwCVdaobnbj7qw/HwRcg55ZHoD1pHjUU3SGZEm
	3Je6aNV7qtGrDKrkN3E4dKQ+u3KsywD6ScUoeI2uhsfIreaEPnVbf8cZluURCqX5kaLr
	4qUTJ49SDsXJ04bo/x1xei4gZpOERYbTO1O/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OUA6x4HBLQgGA2ALyyfBhraesu8Df8hQL5BsxiXYxxw=;
	b=dnpmslZTZfJJgIwn98BB6IJjmsAevfGsn71K2JVawLXCV0IeLnEI7QMbQR6jsWWEm3
	0Q4IC83vRBf9laeGYl4d0WnDPTiE8uXQWv5h02tBbmubvVLguTZX+d3Iays51SVzAKh3
	+HfMz57xIHO5u57yBKuhwFsJvCjrDAfEkaCXIKojMqj+R9ZpQFbNJZeQTQd0CO08azre
	luHFJiA531UZC8oOslf5dA4HpGNUQ7gB4yt6bRyaZ8AerjFI8cW81vkBHfcjBn4bidpL
	U5/KpGuhXxwyIpfJQGIZ0tRadhNou6I2EE8fa0sRoOQVQ5uJyim7Uu5q+wDRyYEFv98R
	m3qQ==
X-Gm-Message-State: AKwxytfnqcw74fUaSBdiZxq0XnxpwtItJsSW8Ec1wX7IbN7NFHQryOpV
	nPMWOLbclH9CA6SLHIetxB0FKqt7PiX/Fm+k5SYOkw==
X-Received: by 10.157.51.76 with SMTP id u12mr15327889otd.197.1516977264828;
	Fri, 26 Jan 2018 06:34:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Fri, 26 Jan 2018 06:34:04 -0800 (PST)
In-Reply-To: <3d73ed91-c1be-4d32-e3de-b945dea52ae5@amsat.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<1512670493-18114-2-git-send-email-peter.maydell@linaro.org>
	<3d73ed91-c1be-4d32-e3de-b945dea52ae5@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2018 14:34:04 +0000
Message-ID: <CAFEAcA_9H6UROaz=H91pyeSa_X11=YJHGpgnhp2H-4hujrAs7Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH 1/6] hw/arm/virt: Check that the CPU realize
 method succeeded
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
Cc: "patches@linaro.org" <patches@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jc5RYR5QFUhX

On 26 January 2018 at 14:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> On 12/07/2017 03:14 PM, Peter Maydell wrote:
>> We were passing a NULL error pointer to the object_property_set_bool()
>> call that realizes the CPU object. This meant that we wouldn't detect
>> failure, and would plough blindly on to crash later trying to use a
>> NULL CPU object pointer. Detect errors and fail instead.
>>
>> In particular, this will be necessary to detect the user error
>> of using "-cpu host" without "-enable-kvm" once we make the host
>> CPU type be registered unconditionally rather than only in
>> kvm_arch_init().
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks; I already put this patch in master (commit c88bc3e0dbe7), though.

-- PMM
