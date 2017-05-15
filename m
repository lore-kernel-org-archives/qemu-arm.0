Received: by 10.25.0.6 with SMTP id 6csp1377292lfa;
        Mon, 15 May 2017 04:53:08 -0700 (PDT)
X-Received: by 10.200.50.216 with SMTP id a24mr4984034qtb.91.1494849188036;
        Mon, 15 May 2017 04:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494849188; cv=none;
        d=google.com; s=arc-20160816;
        b=iRhH6MF5F5t84Epb5Ze9t5OEIsX2g0HnfxDDOeiy4rghmdPPiic22Ln6UyErG0Zu1h
         81e0O1fYB1c/0BSkgRpYEhij8Wb5TyVU/mN8emed0OOz5llNEBkjF2OdtXlIGm4ZyxJN
         l4oBV5HBUlVQDyRL3ATR9ihD5SsnNAeSs9L2lHoDN49z/XjcVCriBYs+oZbynwU+PFZ9
         o1l79v/m2dlbCr2eNBohv6RIRllN1pEFjdgv3QulpWJfmsHqADK8lrn57JsVwObbdlbc
         Pj22/ZT036BjuEQS/O37jlWMm5PEuo0vGwOSEtyPjWHunxs4FbHtlIIX/PyhPL3k701K
         t3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=HOhYCf+fIhcghaY3vqeItd6mUnx4dTgZ2MNkjDVcoe4=;
        b=E7pNz3qxddGtTmOnnVmOYFE2IOoU8N1P8IwxunofLp+S8MChZ7FBq3rdoHA9i5Ol5D
         2qooNh5nfTu6O5hptVXk63kgIYZ4idUqOsvtdp/62xuuLgFR9gdMjjQMuPkbfbfQequD
         O+DKPlw0QYr1edM9yx4aU1r4gl/Rj3HvkzyTsjGvE3tA7mZMH6HVh5p5yQLVWf+93Ybi
         GdcN8bkIY4cty11PZ8KQh8r3OIhCQ07tD50h6lgfZuEg1WEesoNSydqndpIm1SfyQDcW
         GgYY2I6ZgIrY5is2Pcsth9gbxVrwT0VmjiBkdkeMxxXZVa6oBSJ2UC3yWftnS8FBlq23
         fdiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j27si10850477qtf.175.2017.05.15.04.53.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 May 2017 04:53:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAEYl-0003XH-FO
	for alex.bennee@linaro.org; Mon, 15 May 2017 07:53:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAEYh-0003X8-9w
	for qemu-arm@nongnu.org; Mon, 15 May 2017 07:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAEYe-00088L-6D
	for qemu-arm@nongnu.org; Mon, 15 May 2017 07:53:03 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAEYe-000881-2P; Mon, 15 May 2017 07:53:00 -0400
Received: by mail-qk0-x241.google.com with SMTP id k74so16592033qke.2;
	Mon, 15 May 2017 04:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=HOhYCf+fIhcghaY3vqeItd6mUnx4dTgZ2MNkjDVcoe4=;
	b=SwRPYMzBL2zpxbvOm2Py5ChaLaIR3jp95jOVApBWxNuF3q96NSbVVHTRxFLvhMuzhO
	UlofbZVyvfSLZlF9iih060NnCJ7IdWnbfr+5YPomNslUvQGYa1YAGtluk3FNnm9aNteu
	nzFk7/VOI837E2rTclvroPU81AApxvUXoOuQqd/wDq4tGc0exRFPX8dMgXKRbPrck4Xu
	588ZXHx52zPxvM/HmMdWqdSbJAMu1goqQrPY7vY/t1An8PmGN/twrJ/WG4IcJYXDqRWg
	FQ5LU/YlaUyzawV70pFS3f0XrlG+uk4VgBQd3d7Ktc67ePsxabyeU/LIBjJBZc/ppSJq
	e3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HOhYCf+fIhcghaY3vqeItd6mUnx4dTgZ2MNkjDVcoe4=;
	b=lHkRKdDaaLKgPLDYce75IcNU+cl+M2679Wf0ihgNn5FqhH17nelsbdVBa1mm7gK5/9
	uMjYgCkzA46GGoKo2u3VyLzJ1nJ96ORAFqD138YZVeZFnjwTZ5zHnVNfODgogHi/eSgz
	UxoP/IzFfy3ntzd2UbI6w5olHSbijY4dWb0XKlIr0CI3gID7uMt5wK0j/8uY8Mk3OPvg
	gJ+g3SJCxAEO1DZZtVf/B0PjbDsGVDDrJ1poOlhHv+lla4w2PxQUNiDk0AToErHmRNJh
	2AR7Sjj+wfwnptla6zSINg8btwtNUlSPID5PpKwn6AB1KnC6zxTRbMjahQ0IZbrBl1Y6
	FIWQ==
X-Gm-Message-State: AODbwcAI6w8322/6PrV/sUH5QNVssjqWn0AxjYzbrX8LQH2tG6kGMyND
	DkFLOs24BjGBgQ==
X-Received: by 10.55.31.38 with SMTP id f38mr4601865qkf.267.1494849179453;
	Mon, 15 May 2017 04:52:59 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	s191sm4495357qke.56.2017.05.15.04.52.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 May 2017 04:52:58 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-2-git-send-email-sundeep.lkml@gmail.com>
	<e87597ba-4759-76a5-7b0d-3297d2eb8f79@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d82b2e7c-e983-b227-b300-ceea0bd8b2cb@amsat.org>
Date: Mon, 15 May 2017 08:52:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <e87597ba-4759-76a5-7b0d-3297d2eb8f79@amsat.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel PATCH 1/5] msf2: Add Smartfusion2 System
 timer
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
Cc: peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M1hzOaBotahV

Hi Subbaraya,

>> +        if (value & TIMER_MODE) {
>> +            qemu_log_mask(LOG_UNIMP, "64-bit mode not supported\n");
>
> No need of trailing '\n', be more specific, something like:
>
>     qemu_log_mask(LOG_UNIMP, TYPE_MSF2_TIMER ": 64-bit mode not
> supported");

I mistaken with error_report(), qemu_log_mask() does use trailing 
newline, sorry!

Phil.
