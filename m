Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2547022wru;
        Fri, 20 Jul 2018 02:02:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdht9ch448//o0HFsnoW+LV1U6YJcgCbS41oQfRSMguqth4vkUFQoRwjIv5xzgby3GK0sfo
X-Received: by 2002:a37:cc5c:: with SMTP id r89-v6mr945797qki.441.1532077322957;
        Fri, 20 Jul 2018 02:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532077322; cv=none;
        d=google.com; s=arc-20160816;
        b=1J7Go9rAz/BDrbMouUJbhZxIdm3qHF9+L7LgzwJkeZVkhzafLMSyWpOjlhAfWc6qrg
         +1MANCm5CH09dQ9x4HFYYoy4s5oXGGVDjZMsKFFeOL7oCDJDt1sGPE2GvbjXRg2onHcg
         JvWxvlOBrPatTAzeK2/ak+bitbFmh55OZLO4JZl6otAOQfGuxsjPCmnxjVt7bh8r6MoY
         mMXdO5rYoW/yc3n7o3QHn6c7Bbqm6xYdHQfftB2HWOzl7/eez0pNgeGTRijI1Rmm/+9A
         TnGUfo7F1lDfBJWUaaIY6v+somT+/1IF/xnrepLiPmexIoUjTtc/CDjoKCmqYsrYLliM
         SpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=g+RFxT7QArpA3Unb87XR2FbvMGbSyRtsRTUJ/U48VqY=;
        b=JcxEAY068DwmOvdEyF7bj6ZlCU8sgibDe1PJkGrTCacQ4hG0mHhEHrsKwLIipktA46
         RdgAznXlmEd5hpg7MpAVpdIa4nSxmO/8493esejkDDbP3Rcir9qbQT7BRNmeJ4If3bPB
         W8OETAcMseHQVrBh18a5oq05lQ3PF0GpB7nbmouqOprs8BTNBLb6tRElysur5WH5YMR2
         AxVfIFA7gRDMmI80CEywKwFm7W5S7MtTyqSUhB18BIDKUXucOT6wMHPb/+lt7clp7e1a
         jKPw/4h0cd/LW2D9acFeNeq2qMqLLx78iZY1/oWQj4EKEmIYK3DInpbNSAthYQNFYuH9
         jBNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iMaBQNJs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o1-v6si1352259qkl.217.2018.07.20.02.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jul 2018 02:02:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iMaBQNJs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgRIY-0008Ts-Hx
	for alex.bennee@linaro.org; Fri, 20 Jul 2018 05:02:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fgRIH-0008T6-RO
	for qemu-devel@nongnu.org; Fri, 20 Jul 2018 05:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fgRIG-00073I-RI
	for qemu-devel@nongnu.org; Fri, 20 Jul 2018 05:01:45 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:32797)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fgRIG-000734-MB
	for qemu-devel@nongnu.org; Fri, 20 Jul 2018 05:01:44 -0400
Received: by mail-oi0-x242.google.com with SMTP id l10-v6so20107541oii.0
	for <qemu-devel@nongnu.org>; Fri, 20 Jul 2018 02:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=g+RFxT7QArpA3Unb87XR2FbvMGbSyRtsRTUJ/U48VqY=;
	b=iMaBQNJs9FjPakookWva5CuwXp1l0QHC7477fjrKtid5CZ9MO+IjX5VeCAsHD7TUx3
	9CRQ5gozdDjnZDLAKVJxeFrdQYJ8vyzYFpw3Y5D1TviSmeGEmGriQDUMBLz/U8gq7gwz
	i3Ljhtyn++oFveKwqLUkgFK9M50JTGZbsuEic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=g+RFxT7QArpA3Unb87XR2FbvMGbSyRtsRTUJ/U48VqY=;
	b=cecSDcWnDUyZR+4YkEYVKr32LBjyvUdUcZoGu0nL15FyY04EF3mUdTUdStntB7n0Lj
	IT209wODr+6rznqyyc9HmTc27/wH3Z1WQ2bfVs6Bz+f+AR1VmwZCpzfyS51PGNnb+vvZ
	BsKNpon7vTI+FezSGN+a5zp06yGh8cS22WZccwTjOryIU5jRyVu1uI3VO362ZfNMboB0
	uZXFAx747dwEnSF0YKGyI/+zK44du2/3ANRUYR1xyQrwsJmtX09ydnnt0W2vmnogokpY
	amWQX4yAXVgxHqJQW6K+ULpBUtpw8jp8meYor/h+F4KGGuLflp6iiV9UgnoR1A4EPaOC
	Yazg==
X-Gm-Message-State: AOUpUlHsTg8odWf619V63JfgZyrhrjkAQNus3AZ0Kq5tNR1/qkmyMGA1
	GoIzgJsH5kL7FDl9jetmrRoXnW1/lkIQCmJJNUQTG+uo
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr1247288oie.80.1532077303588; 
	Fri, 20 Jul 2018 02:01:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 20 Jul 2018 02:01:23
	-0700 (PDT)
In-Reply-To: <055381ef-7f32-1bb3-cae5-df6bfbe2888e@gmail.com>
References: <1531969910-32843-1-git-send-email-jia.he@hxt-semitech.com>
	<CAFEAcA_2t5z1JBWM9o7ygcOwxnQRba0qA8vVjcoZpcGfP9XUtA@mail.gmail.com>
	<055381ef-7f32-1bb3-cae5-df6bfbe2888e@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jul 2018 10:01:23 +0100
Message-ID: <CAFEAcA872HzXiFMLcbDaNRrafNLOZgut2RFXjHXCDJsavnDkxA@mail.gmail.com>
To: Jia He <hejianet@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH] hw/intc/arm_gicv3_its: downgrade
 error_report to warn_report in kvm_arm_its_reset
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
Cc: Jia He <jia.he@hxt-semitech.com>, Eric Auger <eric.auger@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Pp53cDwI3c3

On 20 July 2018 at 02:22, Jia He <hejianet@gmail.com> wrote:
> Hi Peter=E3=80=82 Thanks for the comments
>
> On 7/19/2018 8:41 PM, Peter Maydell Wrote:
>> On 19 July 2018 at 04:11, Jia He <hejianet@gmail.com> wrote:
>>> In scripts/arch-run.bash of kvm-unit-tests, it will check the qemu
>>> output log with:
>>> if [ -z "$(echo "$errors" | grep -vi warning)" ]; then
>>>
>>> Thus without the warning prefix, all of the test fail.
>>>
>>> Since it is not unrecoverable error in kvm_arm_its_reset for
>>> current implementation, downgrading the report from error to
>>> warn makes sense.
>>
>> I think the counterargument would be that this should report
>> an error, because you just asked the device to do something
>> that it doesn't support (ie to do a clean reset). Since the
>> device isn't going to behave correctly, the tests should fail,
>> and the way to make them pass is to upgrade to a kernel that
>> implements the device correctly (by implementing the necessary
>> feature).
>>
>> But we could maybe move to warn_report() here -- I'm not
>> sure what our rules are for what counts as an error and
>> what counts as a warning.
> I reviewed the other error_report in qemu. Some of them are followed
> by exit(), but the rest are not. So it seems there is no definite
> rules for error_report.
>
> IMO, the best resolution is to change the output grep search criteria.
> But it is difficult for kvm-unit-tests to identify whether it is an
> error without exit() or a warning. The fastest resolution is moving
> error_report to warn_report.

Well, as I say, this implementation of the ITS *should* fail
tests -- it doesn't behave to spec. The fastest resolution
is for you to upgrade your host kernel to one that has the
bugfix :-)

thanks
-- PMM
