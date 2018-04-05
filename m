Received: by 10.28.71.155 with SMTP id m27csp6021333wmi;
        Thu, 5 Apr 2018 06:06:09 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49phfjkj5T3UJQiTnouaH0OWH5h40MDJjtx/IFR2MioRpfKoQRLm69ejZLwDYqlVxHNulY3
X-Received: by 10.55.74.19 with SMTP id x19mr29687704qka.345.1522933569504;
        Thu, 05 Apr 2018 06:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522933569; cv=none;
        d=google.com; s=arc-20160816;
        b=j0HF76GET8v0djLuBlJ5IfT3QmWktDctSoeX58HqcXLqt/nr4+i1UQCLW7SlbLEY2s
         V3LbHu4nfP/ZXtON80mF3F0EJlJKwcUWKk1GYejHn0dvI5xvWEAMgKFER3yu8uFAvVWe
         PiZQCaAt+Bn/YllKpGSy4sB6LbNup2tyRQEXoqKZsZtqD/u51s81dxVy+tdbTrklKILI
         RvvOapjyH227NVzYtwyl3cssNZXDesiAO9r32gG6XXFimx4rksr+PUXwEDX3ByuItUGO
         Bvdtsrqy1iXos4tYb5ekhCWP8UKWqhF+f/o7oQguVHsDIdFmiR85KeK06fgfr/3Zaf7w
         McUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=s5QcyU7ZiFjY/rQbCQn6q6IwHH8i4a4ZGCZbalvkORE=;
        b=Yvz34KNNEEGjWV28rGvGhEtWuylgL8/Q7y+40gHMM2etg+i4pW3+Qu9pQFRBMqmAqO
         5ghFlKHAScJSUh/6VMdESPbS6ScTILoQXa7h6OvC68sW1uCDCVhxCiPXgQtFiPGoqMg5
         Cb1BraC38zDkPI3RYX33FqXsBUWq/PJRbLHc1knVKnogiM5E8s9Y3L4wVteohF/2HpTw
         9OTy4uwTJJjtFiYMsSQ83T9uH/4uI94paL53NEDuxxAcGwGnkFmlbmegLwH2tGWzACtQ
         8KkwJyICZ713ZuxCuqoRbUYYaCBbw1SMMY8+caDQFuY0PnU/vPFuRcXXGvL6lY121KvN
         F7xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k2N6rjbe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x63si3387299qkc.92.2018.04.05.06.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Apr 2018 06:06:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k2N6rjbe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56559 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f44af-0003rW-0d
	for alex.bennee@linaro.org; Thu, 05 Apr 2018 09:06:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f44aP-0003n2-H0
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 09:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f44aL-0004oY-L6
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 09:05:53 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:43710)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f44aL-0004nV-Fj
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 09:05:49 -0400
Received: by mail-oi0-x243.google.com with SMTP id u84-v6so22446311oie.10
	for <qemu-arm@nongnu.org>; Thu, 05 Apr 2018 06:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s5QcyU7ZiFjY/rQbCQn6q6IwHH8i4a4ZGCZbalvkORE=;
	b=k2N6rjbeqcPUifGRp1df1U0Yb1DCixnaZXb/0z/halTwqcwF1baPfcVe6dqvto0bA5
	zxXjbHuQ3HyM/d3A9ZSxpCL1V99vGlsvdllLoJKWVciQFzDB8P87h/69hDop3K60gpqm
	JPbFGImuU/15eLi5g0HWIvo4rgeKkVm4TO+hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s5QcyU7ZiFjY/rQbCQn6q6IwHH8i4a4ZGCZbalvkORE=;
	b=fb4iLvxeps3lqbfvJFVDuTKrw4gjryG8Jm8EZThwO2qSrimu8WnDVz9xOCVdf00gu0
	2b7OKrRRVbP6PZEhUj/WnDvn3mMabYUqyOHXXKrnH5HZFRNv4O5DMLJdmz6JKLEOgRmr
	O2PYK1NsMIl02lixoSK+RBqN1/coU0vijWTRlyS1JDoiiVnVDRkAjqN0scdAH27yxgo5
	2RQ+EFW60yCBFDI8rvLRZjwcGlgd/mTsISoRNxQIP/Jljsh7vxc5ZARBOwVVunKQ54d0
	KdClITjUaX/spMLIN02UE1qfMlPA3+3biUcwNgvWCgsFJM310eW4rtM/g50MCI32pm7q
	ahfQ==
X-Gm-Message-State: ALQs6tB0+jHBIHHsZVk75xoxJDEGcNLotDtAEGocqPbtpTy0d8YIelyz
	1DHqOSXF5qXtJEbbOSJcqckJ8VNBlRUVxZAzLEbGew==
X-Received: by 2002:aca:d455:: with SMTP id
	l82-v6mr13275503oig.102.1522933548719; 
	Thu, 05 Apr 2018 06:05:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Thu, 5 Apr 2018 06:05:28 -0700 (PDT)
In-Reply-To: <1522908551-14885-1-git-send-email-thuth@redhat.com>
References: <1522908551-14885-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Apr 2018 14:05:28 +0100
Message-ID: <CAFEAcA81joSt3wNxaezi0ZzpOZm=Wt0TShcmQ0YtAYV+_ipeeA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH for-2.12] hw/arm/fsl-imx: Fix introspection
 problem with fsl-imx6 and fsl-imx7
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y6lhtLT6L5rn

On 5 April 2018 at 07:09, Thomas Huth <thuth@redhat.com> wrote:
> QEMU currently exits unexpectedly when trying to introspect the fsl-imx6
> and fsl-imx7 devices on systems with many SMP CPUs:
>
> $ echo "{'execute':'qmp_capabilities'}"\
>        "{'execute':'device-list-properties',"\
>        " 'arguments':{'typename':'fsl,imx6'}}" \
>        | arm-softmmu/qemu-system-arm -M virt,accel=qtest -qmp stdio -smp 8
> {"QMP": {"version": {"qemu": {"micro": 91, "minor": 11, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> {"return": {}}
> fsl,imx6: Only 4 CPUs are supported (8 requested)
>
> And:
>
> $ echo "{'execute':'qmp_capabilities'}"\
>        "{'execute':'device-list-properties',"\
>        " 'arguments':{'typename':'fsl,imx7'}}" \
>        | arm-softmmu/qemu-system-arm -M raspi2,accel=qtest -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 91, "minor": 11, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> {"return": {}}
> fsl,imx7: Only 2 CPUs are supported (4 requested)
>
> This happens because these devices are doing an exit() from their
> instance_init function - which should never be done since instance_init
> can be called at any time for device introspection! Fix it by moving
> the deadly check into the realize() function instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
