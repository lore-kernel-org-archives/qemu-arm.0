Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3661871wrx;
        Mon, 25 Mar 2019 03:04:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzToc4JfAwCQ8NqbNXV+th1m6PMoXN/4fr/MS7UN8lrGMD5GPgLzMSpnYENd5dKhS2RVG8V
X-Received: by 2002:a81:5344:: with SMTP id h65mr20639023ywb.39.1553508295535;
        Mon, 25 Mar 2019 03:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553508295; cv=none;
        d=google.com; s=arc-20160816;
        b=oo1z85LlgnCcNJ0Mok4Udw3nE3GydWLyyVxQNio8RaLPvLgwCr/EPJrUXy2Ag9r1O2
         /w+9UrM4RrT7aQrU+LaPcpn1gYo9gMVC4WYI5JVxtAjCmt7H3iDmx2N5zag5l+BknFb/
         S8adGHcNUjYO9K+O+tL1L6VQMBIbVa85ClGIIn9n/Jrz04KvjjETpydcojUtoY4xTiU0
         Yf4EvU8Cz4vVrbwQ1IAIUDHGfnFw3pbINpgSuursDLuw70G9TsFMXKtkx3/iFxAW9Ev2
         7qHkpkRzN7rrkMRnaWsFyQDxeuD/1Ec4X69OaMKg1ARXtUfBX7tMg3Y3kU1IRpqamgzv
         R8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EJK91yJs3whoS8xdoiMX0F1f3LH9FC4HQB+9aAyF09U=;
        b=AbjYcp1I21qFuhNF2EEDoWyeft8TOU8NnEOTH79xpg+FKsQ5FnbHIK2rJh6kJfQ2Oi
         30O4OrzQwFblqGwmE0G27TkJoFa9J4q+8iL/ByAcVG9IYJO3LfnSL4YgzPmcEFJfRemc
         CvU8dLbMSirQ5DJ0J6MXQjDxLxSAyYYtPdlwZxXBvlFJt2SVUUBUl27M4kqPs4xdZbmm
         gHfQUyOsYQTA9e4CAnIYU7w6Y+NqILVfxNpS+tv/wWTZd5fhvcaIK0YD3xYbbF01QsuN
         1KiNsa8kLYm+eNJpKvbSrR9mC+UwE5l5yKyeUw26b6E7GAc/Amy+01xRdTpHmrICzy7x
         newg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aYfRVwDp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i65si9320314ywb.93.2019.03.25.03.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 03:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aYfRVwDp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8MTP-0005oh-2V
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 06:04:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8MQX-0003HL-1V
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 06:01:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8MF3-0007SZ-DY
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 05:50:06 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h8MF1-0007Pi-7K
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 05:50:05 -0400
Received: by mail-oi1-x242.google.com with SMTP id x188so6391996oia.13
	for <qemu-arm@nongnu.org>; Mon, 25 Mar 2019 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EJK91yJs3whoS8xdoiMX0F1f3LH9FC4HQB+9aAyF09U=;
	b=aYfRVwDpioX7wnCRxsqMwfAyf85pYE0u8pL3uEipahO1AtO2CjYhUS0lY2vbmDJly8
	ZU3womsweReDTKlL4MdgTSGpgH3eUhI6HMqaSkTKHXY5U6vNcSNFRmhFyXGSA4ltdkdj
	Igrm7wLNgOcH0jkra8XqFhtjmlWh5Lewgj2C9UAI7POdhppMwDOMm/6lUnHPcpCFyLux
	v85L/TBjyw8IavDTCXwo6wNZwJEKRghllR7brYVXvDeVJXCgZzBpCGg7LeSGy3zQE7H0
	85K3fv2L2G5OwKORYcioSgC3ujpHLbp7XRQQEewsaVmmy79yErj0jGAXF07DZ5r2xWSE
	YK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EJK91yJs3whoS8xdoiMX0F1f3LH9FC4HQB+9aAyF09U=;
	b=f88tLlHezZ/+pH1uNklrg+2fm5ac3AE9KdHc36e72q7PQbv3Fnnbia9D3gQtYrR/1N
	Sf7mCVBvQ0elR6dFV8IthxF5EdtArD29en/euLFvvWz5zbHRxs117iNXU4QC9KELLPjs
	QcHR0BIKe/nXUKjv9onb5OXZ2QsU8gILsUuhBD/R8vwpElth+ogCQlgI+2MDytInXy2s
	sguAMQnd5FZgzm9I3iy9cbBgXmvE35FRIcKol7dhaSyHcKdqCUYkE5g6v5cohThbm+Ty
	Ihyb2XcPASOlIU0TkMK6chmly23zXPSmMX5iihRPfncltaL4c3jCohJ8RtW1lPG24Rvl
	HFOw==
X-Gm-Message-State: APjAAAWmx3BJpqyvpS6IbJSKqchRHsVJa0UwacozOvGhFWURvf6Gid7r
	8GD0eOQgJJrYiMegTUKhagdVR0vs+GFJIKX+H/mKAQ==
X-Received: by 2002:aca:c1c1:: with SMTP id
	r184mr10509236oif.146.1553507396370; 
	Mon, 25 Mar 2019 02:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190322163059.9716-1-drjones@redhat.com>
In-Reply-To: <20190322163059.9716-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Mar 2019 09:49:45 +0000
Message-ID: <CAFEAcA_2w533fSRaYTPKGceUY2s5_scE=awtKzw3+SvkiUHV7Q@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH] target/arm: default config
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mhAC8IuSwheC

On Fri, 22 Mar 2019 at 16:31, Andrew Jones <drjones@redhat.com> wrote:
>
> In the kconfig shuffle arm lost pci-testdev which is used by
> kvm-unit-tests. Let's add it back.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 1 +



Applied to target-arm.next (with a tweaked subject line), thanks.

-- PMM
