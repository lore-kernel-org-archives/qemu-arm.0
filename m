Received: by 10.25.0.144 with SMTP id 138csp239008lfa;
        Wed, 26 Apr 2017 04:46:52 -0700 (PDT)
X-Received: by 10.55.215.2 with SMTP id m2mr12526467qki.176.1493207212696;
        Wed, 26 Apr 2017 04:46:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d42si25237722qtc.191.2017.04.26.04.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Apr 2017 04:46:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3LPH-0001i3-1C
	for alex.bennee@linaro.org; Wed, 26 Apr 2017 07:46:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1d3LIw-0004CH-4g
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 07:40:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1d3LIv-0006py-Dz
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 07:40:18 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36141)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bjsprakash.linux@gmail.com>)
	id 1d3LIv-0006pZ-6l; Wed, 26 Apr 2017 07:40:17 -0400
Received: by mail-lf0-x242.google.com with SMTP id 75so24550355lfs.3;
	Wed, 26 Apr 2017 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H9kELEktfaOcmd+YEKk+SkwC5wHElOk5pGuho4cYvzg=;
	b=MvfCV9L3k5ykB+1ZvszkYygeFrPhUPayWS/VvNCiakFWRRaamzfjjSt6QmOsT6K14L
	7MHxyFRDWD5QSxcaPA3MpBj0VFIPXFgOxexPLZdDAJN9pWr4+Or6UVALrw+ecc0+lVqP
	A6VgmXCnAjGwm4JerXf1D23Gl8t5p4+fq11P4rlmGpa1ptmMaBYYmwUddd8MC+9fyzHg
	i2qD99U3YkpZA5a+OURwYLLsg71ymmqf6B88EVU+A2BJQIAmMjpP+hj04eBYrhbidig0
	XaXiIidiKNx8tRZ7Gy5apB2E/mPBzxnYiJlKB6jL2/X046uY2T5UwTn3nN8WKSC+ewcB
	NQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H9kELEktfaOcmd+YEKk+SkwC5wHElOk5pGuho4cYvzg=;
	b=hHSOEx/Y12UZgedkC0bx6PqcQ2/chdJe5PtgYwguAad8PdpCrh9FcosJOQ7FzFrXL9
	M3cgdJ9itz8yqzjbVIiL5l6zTmtFVk6VulC2OZlVTjSEUhKuXmjEoyRmqO5dbJpyhqHi
	mxSIhnkHLQNx6cC6W08NgfHMLUgVFb+Du3Ju5hGV/lNQQzyS1IkjTR3UolE4KVVS7nhm
	XQ+XfaDaEsvfX1+2w3MBUxSca4VvuiIVFC08BG1/KxYBAaD9tptMRzZoHS1tIOsxtrDe
	GUN/iMLYEruUC6XiMNQHSV77mUWOLkTzJu5cNwPvVMW4ALz5n+bUUeqN6Lqfkaa4miJe
	DwCA==
X-Gm-Message-State: AN3rC/5KDXVl499413ik7KiqONmSU23nqu5F8aJh4DndZCIJuyTsrbY0
	fbxClp6ry/xMtVrGw9jKZC90r4f8p+jx
X-Received: by 10.46.69.66 with SMTP id s63mr12206885lja.88.1493206815898;
	Wed, 26 Apr 2017 04:40:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.80.1 with HTTP; Wed, 26 Apr 2017 04:40:15 -0700 (PDT)
In-Reply-To: <1492173995-14140-3-git-send-email-eric.auger@redhat.com>
References: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
	<1492173995-14140-3-git-send-email-eric.auger@redhat.com>
From: Prakash B <bjsprakash.linux@gmail.com>
Date: Wed, 26 Apr 2017 17:10:15 +0530
Message-ID: <CACJhumdNyZ00dVm4z1P6ktueE=3G7ushxEmUddmY04hD5LNKrQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 2/4] hw/intc/arm_gicv3_its:
 Implement state save/restore
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
Cc: Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
	Vijay Kilari <vijay.kilari@gmail.com>, quintela@redhat.com,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	Vijaya.Kumar@cavium.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kwC04EDYiGbq

On Fri, Apr 14, 2017 at 6:16 PM, Eric Auger <eric.auger@redhat.com> wrote:
> We need to handle both registers and ITS tables. While
> register handling is standard, ITS table handling is more
> challenging since the kernel API is devised so that the
> tables are flushed into guest RAM and not in vmstate buffers.
>
> Flushing the ITS tables on device pre_save() is too late
> since the guest RAM is already saved at this point.
>
> Table flushing needs to happen when we are sure the vcpus
> are stopped and before the last dirty page saving. The
> right point is RUN_STATE_FINISH_MIGRATE but sometimes the
> VM gets stopped before migration launch so let's simply
> flush the tables each time the VM gets stopped.
>
> For regular ITS registers we just can use vmstate pre_save()
> and post_load() callbacks.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Prakash, Brahmajyosyula <Brahmajyosyula.Prakash@cavium.com>
