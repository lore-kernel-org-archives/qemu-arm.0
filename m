Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3840565wrx;
        Mon, 25 Mar 2019 06:11:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOpTiVi6cNzXqhYkiol7vvIYbopjPM6cnkGX6xNqi1ElM8rRMW5Jbn0umLecgT9Y79RMhE
X-Received: by 2002:a25:2c58:: with SMTP id s85mr21636328ybs.4.1553519495902;
        Mon, 25 Mar 2019 06:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553519495; cv=none;
        d=google.com; s=arc-20160816;
        b=aHxQS/1iOoa39h3uTEtd2RiWPAJb7dFQw6Lj/zr07pSN0ViJk7Wndsn4AgepmGj0ZQ
         CrR1EpDoEx37xN0NTQnvYgIWTiV6JjI2LJBj9f+AmZ+T1SDcQrmcjjTcBXhJtN19trC7
         BaLNBseE15FdCs6WSOT7tYeaqjGo/CwErVUeplxHzRH05G6fiTtecX7KBSm/70SjcI0o
         vBpi/qB3wfWrWSLV8rLtoK+6e09vdjeD5IEEZ75Bnz3lSJgsN/ajIs5+T1SuLyrJaGwP
         JgmJwcqyI0nA8sBYeLBC2IcUUBwwbZSXKx7ROT719hF/n7cXaIRVbXNzaTZDuFVbMyLT
         fdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Xz3XK3q/xVTfXyKd6IyfO0+2vU7m8NG8FIbHKPuFzg=;
        b=HqtakZjcH+Co8HFOWam411gRHnOQXNNciJMpElGU1G6oZUSjXBd+7etnks72t3HKie
         Fh1pj8bH/FByRT9ao62rY/p61C8lY7+05ruPKEKF9sNpR9Uq+u0212es4lQ++LiZWXap
         BLqiZLacidnAhKMsB9IklYAOwdPIPsdjryKcouQrpa7+CIGizCmWoDs0n7dKYkrpnLwK
         6tslszrt7UtB/cd2R7QiIaCOUtBGXY20WNmpJtXh7NxOjfctBAfYKXpJrVTOzerhPe+1
         0VgU31uo9b2Kd0v45bac11VN/s/4NaP0KXte7uARF4PacJzcrdDLEr4aT3GqMgxE7jcq
         kDgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yJP5Uw2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si4668787ybk.237.2019.03.25.06.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 06:11:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yJP5Uw2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8PO3-0000EK-CF
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 09:11:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8PNl-0000D2-7H
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 09:11:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8PNk-0000WV-74
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 09:11:17 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37691)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h8PNk-0000WB-24
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 09:11:16 -0400
Received: by mail-ot1-x341.google.com with SMTP id c16so7939869otn.4
	for <qemu-arm@nongnu.org>; Mon, 25 Mar 2019 06:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4Xz3XK3q/xVTfXyKd6IyfO0+2vU7m8NG8FIbHKPuFzg=;
	b=yJP5Uw2ZArQvEgSB2BDMYKWLRtZ2mu8H1g907OJIh8NGV4gDCrQN619BcxrFDOBzfk
	adUf1P3OvXStnvMoR3gQSG+7GIO9xYayzJBxHf2iCHKyTPAL9FkrshT+e+hbWRSO8jBm
	TofP4Gjz1UUFtII0aGW6d7dJdMlkSgw139mHxoFxtOQaaLh3XZZklmNPYP/TX/u5tcmi
	E1q/KJlXF45no3MuqUEFUkJgQkIjWz9phepNT5TyXs9kZI4RSPgsLGlmCXk3vsHnb5Qg
	5uSSMs3wQeN+Aw1GnI05e3yd+W9BM09dF2C6jHKOIv2U/0/+IIlZ4azT/UxDD6MT6VV+
	HMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4Xz3XK3q/xVTfXyKd6IyfO0+2vU7m8NG8FIbHKPuFzg=;
	b=ofNHNFMYbTPUB1uwmw/ym6L7ESNYSHE5GrXN24otUWnXwUPfHSmKCMmJt6TF7tPcRp
	fRPZTyNhsRKkQPvZn6+Q1bxBt+bPpJPA+NWHEIJAnzYSKWdtK0Me2lb7MfRwf8VCo9Yo
	THfGKD6mKqYsipw+koN9Ey0DPiIZ9BCQvZDGk5YHw0Om/RPgw65yb3IQU4T2omQIhF5H
	LejRuwFMKngJIF3lkrjlVxcCM64Ub6ttiDefVmpnjfNskXpUEDfCRJSqg8Pm6z/triCh
	7VJ1KkApX+x4dXTTv3Php8ABnGfx7f+nUlJY09+qeJ2KfasKkNVCWHgdv+YHOn3NXBOE
	Pi+g==
X-Gm-Message-State: APjAAAVrGcAbnQ7uUierFi93tW8HUF4Fpr9bDYHRLJYl9+wi9FpPYmiu
	vUgBBwg2CXyXtLuxXJroI+3H71iQwfKaagntx9syww==
X-Received: by 2002:a9d:130:: with SMTP id 45mr17314358otu.352.1553519474943; 
	Mon, 25 Mar 2019 06:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190325125142.11628-1-zhengxiang9@huawei.com>
In-Reply-To: <20190325125142.11628-1-zhengxiang9@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Mar 2019 13:11:04 +0000
Message-ID: <CAFEAcA-O5+A0Q=14k2vrBg3KNM7MmqbcyhBoZZOe=AsyE-UDbw@mail.gmail.com>
To: Xiang Zheng <zhengxiang9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [RFC PATCH] hw/arm/virt: use variable size of flash
 device to save memory
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Heyi Guo <guoheyi@huawei.com>,
	wanghaibin.wang@huawei.com, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FjiOksowUTw5

On Mon, 25 Mar 2019 at 12:53, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> Currently we fill the VIRT_FLASH space with two 64MB NOR images when
> using persistent UEFI variables on QEMU. Actually we only use a very
> small part of the memory while the rest significant large part of
> memory is wasted.
>
> This patch creates and maps a variable size of flash device instead of
> a mandatory 64MB one to save memory.
>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> ---
>
> This patch might be insufficient since it also needs to modify the flash size
> in ACPI and DTB.
>
> BTW, I don't understand why it requires the two NOR images to be exactly 64MB
> in size when using -pflash.

I don't think we should do this. The board should in general
create the same hardware visible to the guest, not change
it based on subtle things like the size of the image files.

The reason why the flash images must be 64MB in size
when using -pflash is that they are the backing store
for a writable device. Suppose you have 1MB of data in your
backing image that you pass to QEMU and then the guest writes
to the last block of the flash device. The new data
written by the guest to the end of the device has to be
stored somewhere, so the file has to be large enough
to cover the whole of the flash area.

thanks
-- PMM
