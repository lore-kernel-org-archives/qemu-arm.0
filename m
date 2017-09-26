Received: by 10.223.172.38 with SMTP id v35csp3803541wrc;
        Tue, 26 Sep 2017 10:04:36 -0700 (PDT)
X-Received: by 10.55.209.79 with SMTP id s76mr16685462qki.238.1506445476755;
        Tue, 26 Sep 2017 10:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506445476; cv=none;
        d=google.com; s=arc-20160816;
        b=PEbWgPXxQVikwRT866WCqATWJa7IBA9EPCGTsqEhqoa/F+vVQ27vuuPNjInZHi9npS
         uwX6AZcM1cHp5ZLpwWR+PrY8EpQfkS3w5nkl9FNmPeot679ZeRf0F5RpSBjFzn7h7/yZ
         ettXsYNy8lJ0682pkhhTff7DZS5K3rwb9KGgZsPvyx2J6LvKDIWRzxDHPBpkB3+9+b/V
         1XBdM8GW6f/UUVyDS/92QcWlEjdT34C1WTxrgVC4srY1+87vd3NfSJBU74aPhk5jGsOz
         n5BLmGVkX8DWezwTOolSX5zCjYtkCT03GcMs99Ro6OzL086htkZ+Bq1DK+sqJizx+uns
         PQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=SPOpOpjQnUCh3JtSNkAfbs0PXPag5qYVBNBW4oR9RFo=;
        b=xFHhuuQP18PkMwm+KKxumoEQE1EzbTrxiGB9fJ5n49jwI1jZHXYW1BSh3q4GfOmDXN
         EUGcBfuTvWcjbjvPzr7DL246vhfPsC5W4h7ltFNYYjkOHAyyhbFBBzIsNQxY87RbvvG7
         muZBGJZ/fxMzWnNCx08W9R3vKI7K8gvYYk2Zqy7DU5mpuGZGjcR18YfqNDkjDjGe+P8X
         SA3hKUQHGnFb5syCjPz25uDehEYdJLPNB7IcS0L0tYLGMhMeVuvHgys1Nt7eKbtGDWRb
         ELbR2PJP5EM1RWSbJjgiHIIDN0P6gt0cYg1d8ZhLKevMyVqUm8RStbhOW5bU3fGRJYJg
         YACA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mJOfcwhq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 53si1171078qty.157.2017.09.26.10.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 10:04:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mJOfcwhq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwtHe-0008Mr-I1
	for alex.bennee@linaro.org; Tue, 26 Sep 2017 13:04:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dwtHT-0008JX-Is
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 13:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dwtHN-0005aR-Bu
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 13:04:23 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:36816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dwtHJ-0005Xg-Mc; Tue, 26 Sep 2017 13:04:13 -0400
Received: by mail-wr0-x244.google.com with SMTP id g50so2866404wra.3;
	Tue, 26 Sep 2017 10:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=SPOpOpjQnUCh3JtSNkAfbs0PXPag5qYVBNBW4oR9RFo=;
	b=mJOfcwhqZFUhNQcK7TVyOKAw/9005+lCJd4rL24OAl1uToguSOrqt9P50XAIfRXxDF
	UCDKZWNi/7L9K7/GqdedTzgZWe6XXR8svNqEoKu6pJqzL/P+QRO7EMdsiJQTA9qBPoaC
	nHa7SDv0VMLiOVQHOaUZV6TJsZtK8nmZ6PuxaZFA+CjULwkbT3bo9Pgvz5W+B833sDTJ
	oeTfRqk1S0/NJxSw+wP9Xm1p4rmpJS8Xid7rY/LoLMBlq06JQGyB/vS78gzgQG9/hBIy
	dJBLQ98cPG9/WlXHkhHU8qyyF1EJBE/u2gfjP7zmqjZ0xAXhJk52kc4SIkYtW4iQbuAC
	PU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=SPOpOpjQnUCh3JtSNkAfbs0PXPag5qYVBNBW4oR9RFo=;
	b=bXSwH4owk839fnG0zVBsccbnmmAZXUsuPWe/miYjn9ZtziKrKqpu8sC5rhqwGd+PL3
	+BvmEUVm9HeDg5H4Qc6ANk06Cu/9BKnWwhzyNCGXNe8tkT1Jx1YKqdkWmwqiG4/JvZT/
	6yH1KlFzRUo0nrmtPn0O9gRsNKZ3/7KjRtEmdVQI97S1dBhfB8tAGK2qyirbBisHfClp
	vpt4bduIwqy4q0yaHcb/snLhNDc5vu4msdLSayOPP4ALj3UFPeghYWVUl3wCUf5l7suu
	FOaBngfidhOYep0kqTjSUkhO9lfq9upNM0ow73vlYwbJfTzXQAgS9inXt4ghr9LkYIO9
	J5ow==
X-Gm-Message-State: AHPjjUj2yT9GeZYb696z27hw8IewsH79mqS1p7/zCY7nS8kf6AZXSY87
	+U9Uz2m6JfQgYJ3kxh2p0R95Hzl68YDlKThZCnM=
X-Google-Smtp-Source: AOwi7QAE91UXvlEYXfkIcUHX+EesWHr2enJ+Cqp9ja8dCWaarTDRtH7h1DB4UMdUIq2cQbypgZoy7v+TGwqykR1qRhE=
X-Received: by 10.223.169.143 with SMTP id b15mr10919560wrd.127.1506445452512; 
	Tue, 26 Sep 2017 10:04:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.135.139 with HTTP; Tue, 26 Sep 2017 10:03:41 -0700 (PDT)
In-Reply-To: <cbcf25a4-db9c-910f-fdbc-b7620d013b14@redhat.com>
References: <1506441116-16627-1-git-send-email-thuth@redhat.com>
	<CAKmqyKOCsyCHnaNzo_zrRQjZi30ENdPoSc+dFehHvevm-9nrZg@mail.gmail.com>
	<cbcf25a4-db9c-910f-fdbc-b7620d013b14@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 26 Sep 2017 10:03:41 -0700
X-Google-Sender-Auth: OveU2hl9mTYqPFcJUqtM2fPFEpg
Message-ID: <CAKmqyKO2jfVZ9d1epxVWKMy9FUfByCoVXMV4JQ-qGAV=vzKwnQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uxBBHn6aXxDe

On Tue, Sep 26, 2017 at 9:52 AM, Thomas Huth <thuth@redhat.com> wrote:
> On 26.09.2017 18:36, Alistair Francis wrote:
>> On Tue, Sep 26, 2017 at 8:51 AM, Thomas Huth <thuth@redhat.com> wrote:
>>> The device uses serial_hds in its realize function and thus can't be
>>> used twice. Apart from that, the comma in its name makes it quite hard
>>> to use for the user anyway, since a comma is normally used to separate
>>> the device name from its properties when using the "-device" parameter
>>> or the "device_add" HMP command.
>>
>> Is it worth changing the name now then as well?
>
> Not sure, was there a reason for this name? E.g. is it used in a device
> tree somewhere somehow? Anyway, with user_creatable = false, I think it
> is not so urgent anymore to change it.

I don't think there was a specific reason. Maybe it was copied from a
device tree, but I'm not tied to keeping the comma. Maybe that's
something we can investigate in the future.

Thanks,
Alistair

>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>
>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>
> Thanks!
>
>  Thomas
>
