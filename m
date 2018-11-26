Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5758825wrt;
        Mon, 26 Nov 2018 07:59:42 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VqsvCQ65Ss+WDA7ma9dTAQ0nmnCvBsRJK8G0XHp9ej3Sg9MK4MIj/RdDOwbMXEqyCDdLz9
X-Received: by 2002:a25:4195:: with SMTP id o143-v6mr29851541yba.103.1543247982306;
        Mon, 26 Nov 2018 07:59:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543247982; cv=none;
        d=google.com; s=arc-20160816;
        b=c/LMIq+iJWAY40/J0k3pvo0EarcgWG+SgJWJcl2QGkEwYnnT/3FH4WY4Ug8dYoP0By
         fwcgpISDqNL5gN2Gx4oIFr9ynjJl7KZOKNuZHNFEPKoA1yvf0CZOQnNtAPP//NVZLklF
         k9mHjdUP4iVIhyIG/ZxNnGFCeCc0LNZOU+FX7Twt8sty+3ZqkbkLXyNmgvYhMywpvpxS
         zOdHBAK7pLxAxBmT9seUMB7fVjk7LOtExlPbsfco+AJfGVE+oJqZ0I2kassWlGEb9QjN
         JvQsnHaePFEtMrSFSSym7tuIrQN6y7GV7HlS/pHNp3jd1SWeOyKkhlPvLoWuppe0h+qG
         8rjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=VT7gIq5j/tYnkWC7p5jfalCkxSsEQwgp5lWucxCm9Fw=;
        b=rsP/Zp6JChcIKJBCQ+B1f38a4VQqW5XjxRqzqslbuyeLlBF2Pc9Bb60mRbYTkHtV4b
         fwZ2SILvDgDBHrKE+RTUSxSe8NnxfQkOwVbvq2o5kHRPuj9p/NuypafyF8e3aIIXgylA
         Bk41B/Z9Cdtif7uhknJM1uVdvTNXIAN8v4+OE4EwZXTk+VkKt5PHZcPAmiIUbJlMeteE
         8oCcaITALIOQeDCHE/ytDLxRX0BF30rlRC3hpoXVjg3uCx3exlIQKCS4HKgdMPRmNEdg
         TR3d4NnCp39jvGxIrhHU57R36Zcam5T1Y9RXvRSdgmbjKQP9be0Opguno/U/uy7M5k9v
         lsFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BdYGe815;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g30-v6si573159ybi.417.2018.11.26.07.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 07:59:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BdYGe815;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRJIT-0002Mw-QH
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 10:59:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRJIK-0002Lr-VI
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 10:59:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRJIJ-0007iE-Mo
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 10:59:32 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:34068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gRJIH-0007gk-K0; Mon, 26 Nov 2018 10:59:29 -0500
Received: by mail-lj1-x242.google.com with SMTP id u6-v6so17078283ljd.1;
	Mon, 26 Nov 2018 07:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VT7gIq5j/tYnkWC7p5jfalCkxSsEQwgp5lWucxCm9Fw=;
	b=BdYGe815RI46AMvp/cqmvWwbszP7Ds0ipML+HkfaNY8LQ/g3alMHJD3wvE6V86LDJk
	AUcVlShMM+zTP0ifZk4+T5b2eW3hHj/7MnBweOn+TARdCa5Zg609uYG+5oHH8kGhcJrJ
	q59VH7GQ4t3rNTX+EhlGLKmSeTAIe5usnXXPXcutvlKHRj2wsVOO2+FeOp7CjdP5/AYM
	ck/08bBYgY+hyde21ojxbdVW9/pcmw5DB3eQrahNJtPrZSJ84tGsz0o4VnVLKohBxPhW
	hSYmOm9II4LwEiNC5yEp4QwHkpw6LYczTYzK3zgXQB77SAuaFVAph4njCfF7vBrvSasv
	1LkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VT7gIq5j/tYnkWC7p5jfalCkxSsEQwgp5lWucxCm9Fw=;
	b=jfOfW5nsq8VryMpLslKZywyz8WJDJz28GfIARdT4aZ9rfapykmQGQ40fwkz0lAnEjT
	RBNCFUaCzkAjuog8c1T6znxMHst4XKEZkBMOjMNmWgwQZYR7hm9mIUqEKi/pmre8OJpx
	jGIbBaGqN1UmKCwqSImAdeck3gR89sMtWVr9QalcWP6mCYXifHRjSPoQ9mdAAGBbb+WP
	FZBGq8kbRJ+IlMizEb7JsSKHS91nYu5dUFZ/ZAfjZ3YoaoQHayfpxgIquazgOTebZikS
	l9c4JniXKQJO+hplOolb31/K0RobYVtjFH5BFgv+OY1z1E1radxytQ9LdVUN3xxiBuX7
	BvcQ==
X-Gm-Message-State: AA+aEWZBB/o9+B/DMP3JxZGBTjj8D789XJBTZJSGnaAUdUfKr3njAVDA
	VlpdEAn4XkiJufXDjOSIW65jlzQgunsCmvGUpww=
X-Received: by 2002:a2e:4218:: with SMTP id
	p24-v6mr17248237lja.58.1543247966528; 
	Mon, 26 Nov 2018 07:59:26 -0800 (PST)
MIME-Version: 1.0
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-5-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-5-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Nov 2018 07:58:58 -0800
Message-ID: <CAKmqyKPzxsj4oATNH4k5C23ShG4RUTWpFHHbq4+4GDo5wXNa=g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1 04/25] MAINTAINERS: Add
 missing entries for the Xilinx ZynqMP machine
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Csms1/IaAVro

On Sun, Nov 25, 2018 at 12:54 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b9996ab2c..007f89f126 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -711,6 +711,9 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/xlnx*.c
>  F: include/hw/*/xlnx*.h
> +F: include/hw/ssi/xilinx_spips.h
> +F: hw/display/dpcd.c
> +F: include/hw/display/dpcd.h
>
>  ARM ACPI Subsystem
>  M: Shannon Zhao <shannon.zhaosl@gmail.com>
> --
> 2.17.2
>
>
