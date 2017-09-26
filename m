Received: by 10.223.172.38 with SMTP id v35csp3816464wrc;
        Tue, 26 Sep 2017 10:17:31 -0700 (PDT)
X-Received: by 10.55.95.71 with SMTP id t68mr16041140qkb.233.1506446251275;
        Tue, 26 Sep 2017 10:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506446251; cv=none;
        d=google.com; s=arc-20160816;
        b=ff/GScdpk1j3tGZ+zhOBtAPv1vsbhuG4ddUJCs8mxSB5JOaBzd9l0++V1TneljU1BD
         KLoZ/AcnwUKjarN7/AxXs4uqxA71me10gplWPRVfRx0pNmOslWim0L0w8vUl9vNoNU9z
         HgBwEXNDPtV4AOiXoARM9rb6HdwDcJyOEr1TTqpV5iEiiyBnbuwZpiJwVjTOKVX5Tyrb
         T1Ju2NVtwr6GK5nFv2c8UPwFkFJ21f09qpD8sjroFsArUB6fAh39vo9uWcZpHQwvl8IR
         bKqyMQyKc55eFKMuTCgMfVvG9mMlH3rqW68hRMrKezCzoOn9CICqvqE0dMo87f/N104h
         0WVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BhQQ5tmzTmSxWQIiVB8o7ETFbibKeoVhqw45EQsHOPs=;
        b=vzbiFfLbTXGHDBA7MTO+HgtfidnYkygtW7J0ayLb0X5oDTZjo331nX6qWY9FF8xkny
         p4WT0HKBowDSoCc9LP3w9fZqQEfmCKasC2NvkTSvqzsEZRbSIoOL6cJaeJgU21MIxFgx
         lYd/Sos4W2Hf4gOcHJqW6eQjsL6PMk7XUBjCytWki+xVrnJGLaDOwtmzAvsRzoPgn6GH
         iieapUGRheMaRCVLnLmzA+tzRjWRhHjIL/oDjdHx63eHAjTFVMcQWrRW8TJyunoPh+ai
         +MQvYwgDxprB5eOJAE5KRVtRJpHLxucJn+RFnRwFvy4U7/KHG5eaQ5ZxWhHh5/PSxG3p
         YAMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=izerihOa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si2825352qkk.104.2017.09.26.10.17.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 10:17:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=izerihOa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwtU9-0003Du-2i
	for alex.bennee@linaro.org; Tue, 26 Sep 2017 13:17:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dwtTz-0003D2-D9
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 13:17:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dwtTy-0006Ob-C6
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 13:17:19 -0400
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:45289)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dwtTy-0006O0-5y
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 13:17:18 -0400
Received: by mail-wm0-x236.google.com with SMTP id q124so10191261wmb.0
	for <qemu-arm@nongnu.org>; Tue, 26 Sep 2017 10:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BhQQ5tmzTmSxWQIiVB8o7ETFbibKeoVhqw45EQsHOPs=;
	b=izerihOafiRRmHViAYkzhcsGPqs61uX1Ngx8DLHdBwTrRTW8xhuUabv8AIKIamqJlI
	Xsz5KdtyJowxwVrIdXi1hT4jTeCOxYZeKBclRAb/ZopZ1J9RFCxiNlMdVArDDT4024zQ
	i7jitygXIAP1Fn2ngfkff7d0IPDGPyE6iSEvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BhQQ5tmzTmSxWQIiVB8o7ETFbibKeoVhqw45EQsHOPs=;
	b=eS75nDPVv1dQEkUqNxabxD+DQU0nF0ReUq8e12A+VpvCZ0AzVOP8+oe5xX8066mog6
	8jI1LJdG7bfDct0vvn8EAqL9Bds4Y0yprrqQL/JAg/4L3ddqCai4Kv4Io9qLW7Cn/O2m
	fjHgJlN9K5QcsZ90LUw5aR9ZkwvJcLh01Eeh1xVf7w/iRUhxGKsfICJnIA3whCJi5RU/
	tw8nAP2hHmy+thKc4HYsg2YwppmJkNcc/5rYgqOhzajapMpVb4ILyvYMe+GJANl0QWCL
	9wVuMT2pEmVhUS68s8GHt8adEfMtLpDTd/EqAk4S05G90XBcDbkUbkLgNIoSL+0ngDXu
	ua9A==
X-Gm-Message-State: AHPjjUhNiLgrn6kGwethn4/W34SytYK4GSnkMk+rbYHyIWTDja9OxeWM
	gD9GOlr+BAPSNvR9soXLkurbme5OnKo+ad79EQ5zuA==
X-Google-Smtp-Source: AOwi7QAF3mWHRUfOloOAM5P9d2IzCkKCJDRdzkDFK7XMv8+WORCT/jNC9iVIpCoOer1Y9OeYg/ZDj5lLFaQwF0B07Z0=
X-Received: by 10.28.103.195 with SMTP id b186mr3746718wmc.101.1506446237122; 
	Tue, 26 Sep 2017 10:17:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Tue, 26 Sep 2017 10:16:56 -0700 (PDT)
In-Reply-To: <CAKmqyKO2jfVZ9d1epxVWKMy9FUfByCoVXMV4JQ-qGAV=vzKwnQ@mail.gmail.com>
References: <1506441116-16627-1-git-send-email-thuth@redhat.com>
	<CAKmqyKOCsyCHnaNzo_zrRQjZi30ENdPoSc+dFehHvevm-9nrZg@mail.gmail.com>
	<cbcf25a4-db9c-910f-fdbc-b7620d013b14@redhat.com>
	<CAKmqyKO2jfVZ9d1epxVWKMy9FUfByCoVXMV4JQ-qGAV=vzKwnQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Sep 2017 18:16:56 +0100
Message-ID: <CAFEAcA_Q4xqSekX4vRVNGCeD+iSvoe73pxaNB=vKpmc8u+AGMw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/xlnx-zynqmp: Mark the
 "xlnx, zynqmp" device with user_creatable = false
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eSt3+qMjB+Ss

On 26 September 2017 at 18:03, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Tue, Sep 26, 2017 at 9:52 AM, Thomas Huth <thuth@redhat.com> wrote:
>> On 26.09.2017 18:36, Alistair Francis wrote:
>>> On Tue, Sep 26, 2017 at 8:51 AM, Thomas Huth <thuth@redhat.com> wrote:
>>>> The device uses serial_hds in its realize function and thus can't be
>>>> used twice. Apart from that, the comma in its name makes it quite hard
>>>> to use for the user anyway, since a comma is normally used to separate
>>>> the device name from its properties when using the "-device" parameter
>>>> or the "device_add" HMP command.
>>>
>>> Is it worth changing the name now then as well?
>>
>> Not sure, was there a reason for this name? E.g. is it used in a device
>> tree somewhere somehow? Anyway, with user_creatable = false, I think it
>> is not so urgent anymore to change it.
>
> I don't think there was a specific reason. Maybe it was copied from a
> device tree, but I'm not tied to keeping the comma. Maybe that's
> something we can investigate in the future.

I vaguely recall that the comma was part of an attempt to be consistent
about device names by making them follow the device tree names for them
rather than just making up our own. Some of the imx devices and boards
follow the same convention.

thanks
-- PMM
