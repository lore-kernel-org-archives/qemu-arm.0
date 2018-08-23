Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1270913wrd;
        Thu, 23 Aug 2018 08:00:58 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZx2S/f+L0yfNZ6A8BmrKOyNz8IPVhT3fK8a82VK9pD3JbyLg6OSXw9unSPzno4eoTOS8UN
X-Received: by 2002:a37:3153:: with SMTP id x80-v6mr11809436qkx.75.1535036457733;
        Thu, 23 Aug 2018 08:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535036456; cv=none;
        d=google.com; s=arc-20160816;
        b=QrM07vA05xHs/2NnyyO7hVs/6JPwLj6ye0ZTY3MnOba9C0YbbV1xYnRJU37wR3kBwB
         2iGJOpJRimj6W1yPrE2I9ku84qOPHeJh+coduHQ99i9dX8lyud9tOqA98D4noDFo01P9
         oBttgifgm5MqqF+MRlv7uSnenklA0cfm2WIJQOfwOc9vLzhSu/GIQZx7H7WiGDLkVp+A
         o1TPKH8ryXmZdXqoqFx8pYPs0EU57b67KWAYnoxQDUrzM35jv+X7P6rQKNt5jCoLh07J
         HoL0itAwXgnzu76BBll2DIw3+y5BvJtNp6Fdtrk39dLWfzQBc9lRgLGHsjX4Y2pDBgmk
         YPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=u8ss/e/mvhsBIrsyR0btXOg7E1VPoaKwJZYfWMzlWiY=;
        b=SWl4GRdjdgCWhgOxj0bXAj2CtFvrYJvk/rAXyW2ibxUeQuV2nYLFjNcoRVWrA84ddM
         /004CZOWFQXDKoVBUpr1FwxcxnUXswWh94VnrJK5ORaM36BwTVLxh4BqmcgwB7ZH/hmV
         Y7FZ2rzZ6ySdY+4oKaXwgmP0SndzPiWp9+1XPlbhb5hbds4FB15oIPgKEIf93sy9Hv/W
         2a/SOR19tNIE66EEObaYvMEp6PJMft9fwGK/LIVAx0Gn0Fk8bBiSKeQ4axEVD9mvllXu
         J5ZWr1or1DAGZ0nr0vaxwwarPg+8FzVhu9Sd9RjFjbE+UyejYFbK+471Q3mcEWq6zD8A
         1CkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SHz5oO64;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z53-v6si314649qtj.337.2018.08.23.08.00.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 08:00:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SHz5oO64;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsr6W-0006WV-Br
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 11:00:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqXG-0001mb-Uu
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 10:24:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqXC-0007Kh-Nw
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 10:24:30 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fsqXC-0007KL-Ed
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 10:24:26 -0400
Received: by mail-pg1-x542.google.com with SMTP id z4-v6so2648501pgv.2
	for <qemu-devel@nongnu.org>; Thu, 23 Aug 2018 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=u8ss/e/mvhsBIrsyR0btXOg7E1VPoaKwJZYfWMzlWiY=;
	b=SHz5oO64/61HPeZyUQldK/SbloQ217fEpoG3MAuxPdvOSfbx5lqHsGcx+wZtG4yALv
	XAvA3hhnfAeYCWNAf/O08C9raiTMY2ifKrj04JK+hhFebb+cWvjm5tcCQU3dqGvyur9r
	fkBiZrZ5DwyAMtcgZGr7QN2uAS4BlAI3Y6Kvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=u8ss/e/mvhsBIrsyR0btXOg7E1VPoaKwJZYfWMzlWiY=;
	b=gm+TUFMzZ/HYMl4vfwRaWdTrQATMlpO5n8MQHDRDXRdjPKyuKAVjUMdzg6tltUPt8/
	7HSK7qnG7Ujrpiy52ZnOtbc1Lkfpf0V80e2sEcsKy3D0B537o0nTRUrj8sdp87KLgQBJ
	qLtnVwlz3aDob4yCS0sG8cYb8PR/js6FVD25VI/ZnwO51CNeWTZSaA/ETwLRf6F9MGQo
	nrAdQLfX6GYhsgGszoVzGIUR3ZaztJ9JcrIQnTwlExJYwtSm4nXsAo2M+qZFLrGQIryY
	J4eGKiV1P58rlR7hK5d59m5LcOzdE2l/+hsamQ5Yx4r4+JY1qQlOewTOYyDlGj/B3RgB
	P4qw==
X-Gm-Message-State: AOUpUlFvUFSbIs6fjRcxB7L4mJYwZetCmCaqSmlks5SuEREiJPnR9PQ9
	Ik/xTMyOYuNxCzNXZFwwMXritA==
X-Received: by 2002:a63:6604:: with SMTP id
	a4-v6mr55156329pgc.404.1535034265421; 
	Thu, 23 Aug 2018 07:24:25 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	d19-v6sm5559862pgv.61.2018.08.23.07.24.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 07:24:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c17853df-177a-b5b8-f8f1-8767b302c16f@linaro.org>
Date: Thu, 23 Aug 2018 07:24:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-devel] [PATCH 08/22] hw/misc/iotkit-sysctl: Implement
 IoTKit system control element
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4WFRy/cGwggD

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> The Arm IoTKit includes a system control element which
> provides a block of read-only ID registers and a block
> of read-write control registers. Implement a minimal
> version of this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/Makefile.objs           |   1 +
>  include/hw/misc/iotkit-sysctl.h |  49 ++++++
>  hw/misc/iotkit-sysctl.c         | 261 ++++++++++++++++++++++++++++++++
>  MAINTAINERS                     |   2 +
>  default-configs/arm-softmmu.mak |   1 +
>  hw/misc/trace-events            |   7 +
>  6 files changed, 321 insertions(+)
>  create mode 100644 include/hw/misc/iotkit-sysctl.h
>  create mode 100644 hw/misc/iotkit-sysctl.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

