Received: by 10.223.172.38 with SMTP id v35csp4928404wrc;
        Tue, 19 Sep 2017 06:18:39 -0700 (PDT)
X-Received: by 10.237.33.67 with SMTP id 61mr1957437qtc.148.1505827119415;
        Tue, 19 Sep 2017 06:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505827119; cv=none;
        d=google.com; s=arc-20160816;
        b=JDwOZAtHYRvBfvuHMN8DQODhSzt3Sanne+Z0NA2vg4DveMXFLUBGYvfdouCdcqGFTZ
         XI/uQ8MsmdT0M8aoOOyh/qazYuA0E8+/Ij+WdCsoIitveVCO8UvghU5gNF+AnQheglOA
         VMkUJbmGEQ6o98GDAs6hJWmp2O/ftFztkB53V0N3NjBHlsEQOF4Ygst2yLtgCRxZcbjs
         B//XJGKvsHir5Ko1LHXGkkz8YfP06Na8qFoX1+lpEGIWGld6XJpDB7uQTv1s7fDciJfd
         URysCchob/Le8SPrWj6bjNbp8Kj1+ypqp8BKI/A+QqTqZOSNSXrFjZo+XG0nOOAsoGoL
         jNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=8uxlQ4F1MgQaT26RwIlitrGaSn9U9252P9aE7zCoVwA=;
        b=Sccp8Hv1iln4NnqEwlHsE/t0lcoHFOovHAoapoliXmMSOkdDwRg1bYPB1vXO9ZaFjZ
         ZCeY2d+tny4FGGDXS3monu7raLXVTITD+ZlAixl3V19nOhrQQZ9TydyRhWIn15fgHijX
         qQkHdjsaf+dbmdh7FPxW6lEiuJ5IXz6D/I3hfCXfdWYooo7mA46u9dGzfs5Xhq+CfBxn
         2BIF3FmPFRhr0+Q7zG/7PoJP/A7wyruhtzmMS1PQxB+8jXjS4ArQrI92Ibnf3KE3OHCI
         Pd9hVlwSmQt7NNgXte6moBDAlQbOhgC7REli1fVl5LGEQa6krLsoxfo388EKtAJYQFTM
         J8Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZThQf6p7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s124si2114336qkc.307.2017.09.19.06.18.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 06:18:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZThQf6p7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42811 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duIQ8-0003D9-Uv
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 09:18:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duHlE-0000oG-Cx
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 08:36:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duHl8-00017R-Hr
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 08:36:20 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33250)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duHl8-00017J-D0; Tue, 19 Sep 2017 08:36:14 -0400
Received: by mail-qk0-x241.google.com with SMTP id g128so2168753qke.0;
	Tue, 19 Sep 2017 05:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8uxlQ4F1MgQaT26RwIlitrGaSn9U9252P9aE7zCoVwA=;
	b=ZThQf6p7OqqIiloQVEomv8l+TKIlnvtmNeeSOvMUdwF0AcayPVAPgb7dzuxxwt8IRf
	xguAePhwzxrbaNL+kK4XQk01+XjnjRQ2xPSeM4kUUywaNCS8wNZna8SORuxWr3UHzIq+
	11xKNmBp3hhP3udHY21gfiprkNpvIBP+Fy6iTUpV7jP9S9S2EAPZkAJHH0m6ygSzwTmZ
	X774rYMOovgnO7t1L7Rn9jE0bCSn5oHacJlyRh6FRBgPUEtwoU0dX0g7AND4gQosPbf4
	hkOjgObJuTpqPTRwbWngt8avtl8I/th/yIOMzvUTBHTuGK0JN1fs81jGqWoDf+ol9Jja
	l9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8uxlQ4F1MgQaT26RwIlitrGaSn9U9252P9aE7zCoVwA=;
	b=WL8pfAYNFTy05ugLhCFrMqCaMxjRlK8QtiYGXCdGNkBzV4M0eEIRd4FF7PxeJYbhxC
	cSrnJrnwRsNbWl0nKZGYISeDpz4Y+o4gxSgOewG3fI1QqdwjZ49kukFsdpwMD8Ldtcw8
	oNStDBUcvSlZMIHKT8jmSzY6TsP0pnSoXTQdxGQwgBhSd7cmPy+2ue0zaQvUzFkqEsXm
	E46NVj7uIbkvEHge/yxdjl1vhpk+VtEfjMsHuLUbPmmS8xECKgXY37pKhC7zrQ/10Aif
	Uhkf7GaTRgu8WKVv7pnKpM40OMlHF9Tog4Ch6bvlA1o68jzeIJqQ+btPseAUOGgutRjZ
	SFww==
X-Gm-Message-State: AHPjjUg/XeA+El44Ssid+JJLVlI52hpVI5mK6axBreKMgDIGRJIePCzl
	Dyg91BozQFAz1Y4eElzan8mF+k37
X-Google-Smtp-Source: AOwi7QCwH6lLg16kHWmLKhT4y9ExVVTqYNyUlBjDazgRb62efSZJUOSun3FnLHVZhroIZk0mQEx/IA==
X-Received: by 10.55.68.77 with SMTP id r74mr1587473qka.125.1505824573613;
	Tue, 19 Sep 2017 05:36:13 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id 23sm6636923qkf.68.2017.09.19.05.36.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 05:36:13 -0700 (PDT)
To: Jan Kiszka <jan.kiszka@web.de>, Peter Maydell <peter.maydell@linaro.org>, 
	Andrzej Zaborowski <balrogg@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20170919123053.32675-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <da080365-a722-0885-5061-e27661fe9bb7@amsat.org>
Date: Tue, 19 Sep 2017 09:36:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170919123053.32675-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH] hw/audio/wm8750: move WM8750 declarations
 from i2c/i2c.h to audio/wm8750.h
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fjiGk/mcw0Xy

On 09/19/2017 09:30 AM, Philippe Mathieu-Daudé wrote:
> while here use TYPE_WM8750 and declare a data_req_cb() typedef.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/audio/wm8750.h  | 30 ++++++++++++++++++++++++++++++

Also while here I could rename it wm8750_codec.h

>   include/hw/i2c/i2c.h       |  9 ---------
>   hw/arm/musicpal.c          |  3 ++-
>   hw/arm/spitz.c             |  3 ++-
>   hw/arm/z2.c                |  3 ++-
>   hw/audio/marvell_88w8618.c |  1 +
>   hw/audio/wm8750.c          |  6 ++----
>   7 files changed, 39 insertions(+), 16 deletions(-)
>   create mode 100644 include/hw/audio/wm8750.h
