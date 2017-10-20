Received: by 10.223.197.9 with SMTP id q9csp8177226wrf;
        Fri, 20 Oct 2017 11:16:07 -0700 (PDT)
X-Received: by 10.55.19.228 with SMTP id 97mr7916148qkt.271.1508523367700;
        Fri, 20 Oct 2017 11:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508523367; cv=none;
        d=google.com; s=arc-20160816;
        b=zJc2rumnU5tcM6L8jh4MNQcXnKVyoQK+Whn+vXSVzlADZpmdNwvmgUwk8n//adke68
         uCqfsJD3itoqLKIzYlcgaPa0kaqfLTWb8IEbc2OVClGOe8Xo2/ajTkCKMRaBVZD94T/X
         n8mOUyWrCmZo2YKnT43SQgyCiDib880cw2zAYdlB0rOF1lIzNVwZuuEP6ito9Kayhg7j
         6azRAUbY6swZo0qP5cQqlILwpdjlJw+i8+qIzb2kzaUx6TuIaZafOrnoIeo/oj8HT8WT
         kGoQrlqGMurlegd+3tzCZsKiuXOKuWYRx1dSq8mA3SN35u4l99QQM5tcw/+SIEtuXWWV
         RJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=hokeDt+CuTzD49TtJAa0vpEiAI9H1KqAbySQ5PTLX4s=;
        b=n4SX7jOBRCkzN1h60REhuonUps/b9j4z9lIw57vT33mLJ2Uio4rRIR3SqwClo0VwcY
         MrBkrbj6LVmfwl+M7P2aj68z315/rzN65LXEKMff/TDwYzc1CvABD5C/ZYpfk3HdXAPt
         6Lx6mb2PMLg4Ja6lF3bqORIy3p7oBAjDq0GkURgGHuPpBn+eWC9DuGLVFlys8gVn/4zk
         aywy2YKk8wl5gaqCRVUaRHUt0lOnuw6qXuQbm9W0E6er2Zovn4s9MC+OTp6ImoJqwXAe
         b12K6G7R8808ktfhta/PeI+V7zSt0Bu+Q+HOzQs6zXDt/dQtTtK7rRateaF17OSf6WpP
         +Cvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Eq0XKbhu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f13si1233026qtf.388.2017.10.20.11.16.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Oct 2017 11:16:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Eq0XKbhu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55205 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5bq1-00034b-Hh
	for alex.bennee@linaro.org; Fri, 20 Oct 2017 14:16:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1e5bps-00032B-R2
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 14:15:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1e5bps-0002b3-43
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 14:15:56 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:56058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1e5bpo-0002Zh-9H; Fri, 20 Oct 2017 14:15:52 -0400
Received: by mail-pf0-x244.google.com with SMTP id 17so12142922pfn.12;
	Fri, 20 Oct 2017 11:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hokeDt+CuTzD49TtJAa0vpEiAI9H1KqAbySQ5PTLX4s=;
	b=Eq0XKbhuiahnI+AV2+CNDBCwrGwcppoLwB9GGcFxsGT1zbCM2NhrNw4leUu4yv4M/F
	P3+r9GytnB3q4P5a3Pm9J7z70joYxGpUkoU701rdqW+NyMIklX0Oltut/hBrFiq5q8wN
	45OtE1Pck1lgjVfB8C8UzObLEO4UDSuBcZ3xuH6r72w2fXGK0GqQcvpE+l0a2oek8rl3
	MtRjKv/hfbOMT4+JNJ4ap8hEDCdsDOpCNMPrJvjJtHd+lsZSZbPOkNMPjJ0/IshRhU+D
	SAkfsoCIK3/EV2Pp9gZxHNRphqSsijfP7ZzVBco3xJnJB1yLPHOWh5mElCSIxPeFBXZt
	evMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hokeDt+CuTzD49TtJAa0vpEiAI9H1KqAbySQ5PTLX4s=;
	b=V/uV6FoUmbMqBrHnqdSUkaheK597N2EViFjvkozV5yM4423Um5ekjU213zAop6c70T
	iT41G9MWNR6YBpz0fwZDSf/k/njimKvPddvAT37EycS+towHkcc4ud4FW28m7INhGjmI
	kg+FWx5lEYqHir/rOwWdtZzrHtQGwOj2xti76E7s+J5p9tTYe8TJXp8gmkAZ+I1XHNgv
	HGKsktuVwr5LyEX42MJUN0Mccrnry3q2F4p2u2FnRwiSvkfLcqCrCTw14JRkHQRUMYHp
	CN/FYofehK+RYfKrGkwfUEfZSICq0ZRkj6UF84/3eq9V5Hy47vAlMAXHxP4NGuPMUrqY
	PuTA==
X-Gm-Message-State: AMCzsaUXvfBFBc87UVfumHHjBHL+Tsn5wApQKsx9mt72YR/cOYZJJV8R
	4gxzYEjNB/F6o5H0r3DVNUz5Qq+u
X-Google-Smtp-Source: ABhQp+QfkbjKpyxnXIhe2xFAvNibkVFMstxWoTkxYooUDdrMNSIOo8P9y2Brs49UmhlNZ++5RU4/zw==
X-Received: by 10.99.61.70 with SMTP id k67mr5379786pga.113.1508523350083;
	Fri, 20 Oct 2017 11:15:50 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-165-104.tukw.qwest.net.
	[97.113.165.104]) by smtp.googlemail.com with ESMTPSA id
	c127sm2812203pga.34.2017.10.20.11.15.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Oct 2017 11:15:49 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1508522170-22539-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <19d12a08-9ecd-8c91-4652-28773ca35d8e@twiddle.net>
Date: Fri, 20 Oct 2017 11:15:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1508522170-22539-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-arm] [PATCH] translate.c: Fix usermode big-endian AArch32
 LDREXD and STREXD
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
Cc: christophe.lyon@linaro.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gAa/YcV28e7S

On 10/20/2017 10:56 AM, Peter Maydell wrote:
> +        if (s->be_data) {
> +            tcg_gen_extr_i64_i32(tmp2, tmp, t64);
> +        } else {
> +            tcg_gen_extr_i64_i32(tmp, tmp2, t64);
> +        }

The test against be_data must be of the form s->be_data == MO_BE/LE.

The actual bits have MO_BSWAP non-zero, and then set MO_BE/LE to either 0 or
MO_BSWAP depending on the host endianness.


> -        gen_aa32_frob64(s, o64);
> +        if (s->be_data) {
> +            tcg_gen_rotri_i64(o64, o64, 32);
> +        }
>          tcg_gen_setcond_i64(TCG_COND_NE, o64, o64, cpu_exclusive_val);

We're not splitting o64 to parts.  Are you sure it shouldn't stay as frob?


r~
