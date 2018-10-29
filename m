Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4331438wro;
        Mon, 29 Oct 2018 08:04:36 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e54IZV0JXnXAttW4pVokNbU6JGqbe8qXjOCzGWsbIENcbIxmfkEy1/wmbvGiDGtwURGXMs
X-Received: by 2002:a0c:872a:: with SMTP id 39mr13338319qvh.1.1540825475965;
        Mon, 29 Oct 2018 08:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540825475; cv=none;
        d=google.com; s=arc-20160816;
        b=Uwl9cOJAye6SVYzcTtgUxj5SHV4+MVvZvCNKjiQknQq6cJ97E9MihIQ8je0xlB74gX
         jpRJsYNNC2iyhz+4v1g7oa6vhfO1MsjMKTfJNKNRhzGx0JCWPIXC3mJmCsjQIuS+PY6R
         TxQxogu7W/4OQiW/DNga4ulnvzxDlgIAwANx07Bmc5ZN6yAf5rfy310yfF2bMBWdeNMF
         DbppaLOEwCEfGIDfr/UwoJS7h4Ahdd4FJZzksgUbinSmZrUp7QPES3Ehm4mYKrcX9kRm
         B2/k4SHCg+bVd9yruQdKStEiopYC4wpdi3b0jQ7iUs7lin/+HMquYcSwGbDoOIE7oj1L
         FSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Ag60OQ5RFKlpZkZi57UyaLv3Eez1jGSOQFi9QV7R/nE=;
        b=VGIjalyNm087zadKmtnI/42IBQCiwOkr4QiGfsbvO7qjNS0WVxcHyPwKh7uEbXpu6B
         fU/ZMkTEEiFgpZBUQT0YPKc4ehNojPg7sn55KDCPMm/3dwG14rIG8WT8kTBw4OcozFHH
         b4NMvSp+PbUgIaeCVP7mA/KW/0EX0RS4V4xcpklGeWoyCH63OMFbkc83wwebey6HKLD8
         CGWmSFBmc4K+9QW8/nsM0vxuuplGXoAACwSUfnUBr3B8Cn3LM270AzS8wfo5a7voUT44
         6Sbn7tMzkYnwnOLr3EObbJTolONQhBemGL8WcLiTfFA68G7Q8aOaECcz3jbrP6Y1KpYB
         F0Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v30-v6si12249040qtb.260.2018.10.29.08.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 08:04:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gH95m-0006Of-Mb
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 11:04:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gH95C-0006Mr-5G
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 11:03:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gH958-0000vr-8r
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 11:03:57 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53700)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gH956-0000qB-9q
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 11:03:54 -0400
Received: by mail-wm1-f67.google.com with SMTP id l26-v6so8582785wmh.3
	for <qemu-devel@nongnu.org>; Mon, 29 Oct 2018 08:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Ag60OQ5RFKlpZkZi57UyaLv3Eez1jGSOQFi9QV7R/nE=;
	b=jGqbI+fT1xwOiQD0l0cTwdyEMsXriaqBW4caMcCqZ6Z17+IUMVXpcW7YY4Un0seL9p
	LXJQh3gm1O7eaKqLk6SzAokzbsqtJpFAt82ORMdEwQrJebQ1fhsrARv/E8Ubjdd409zy
	/pKqR7TN28Iz6v2+6NFXBY9EiB7rOjfCbP+yPhvuxDHhWgxLPGXhB+m8SfW7FMlmOsFL
	o858yPrfrQmxdhVmCPRCR5kCwV1dc1QeOIx/mYLGBvFy0a3oWDDeN2q0k3F2087blx/3
	4VTbxVoKvfOEVx9cr0FFKsIftKR+DvYpbbQ/1OMXGkOhF5jEh6pF7upY5urL8XE7bop/
	3WyQ==
X-Gm-Message-State: AGRZ1gJTPb0XBY1XRqrAJclzt2NEU3FGZn3HMGtgxWaIp82Ej/dsaqY2
	4uy6JW6LKVbQnQborRe2xqHepQ==
X-Received: by 2002:a1c:f14:: with SMTP id 20-v6mr2407850wmp.126.1540825423399;
	Mon, 29 Oct 2018 08:03:43 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	r143-v6sm11657526wmg.14.2018.10.29.08.03.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 08:03:42 -0700 (PDT)
To: Guenter Roeck <linux@roeck-us.net>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1540548409-22560-1-git-send-email-thuth@redhat.com>
	<CAFEAcA8EubWya8ey9VxhaCw4m2U=KA+i2C-R9P-p+P6oEBBLew@mail.gmail.com>
	<7fc49925-36ff-bd9a-0cd7-e5f8d4bb3672@roeck-us.net>
	<CAFEAcA-UF+SyXvcU+NGZsbqBF2qg+s_x4HPU7yvf7B2G-=HPOg@mail.gmail.com>
	<b4f6cbd2-68fe-5b07-e8fb-93b1c4d8a6de@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2eb2b4ef-725d-cbee-1676-feb6bd800aea@redhat.com>
Date: Mon, 29 Oct 2018 16:03:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <b4f6cbd2-68fe-5b07-e8fb-93b1c4d8a6de@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH 0/2] Deprecate the "collie" machine and
 Strongarm devices
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dTKXPvi7Zz8q

Hi Guenter,

On 29/10/18 15:09, Guenter Roeck wrote:
> On 10/29/18 6:24 AM, Peter Maydell wrote:
>> On 27 October 2018 at 12:04, Guenter Roeck <linux@roeck-us.net> wrote:
>>> On 10/26/18 3:12 AM, Peter Maydell wrote:
>>>> Hi Guenter; there's a proposal here to deprecate (and eventually
>>>> remove) the 'collie' board (strongarm) from QEMU. Is that one of
>>>> the ones you're currently using in your automated testing of Linux
>>>> kernels on QEMU?
>>>>
>>>
>>> Yes. I can run the test with older versions of qemu, so it is ok for me
>>> if it is removed (as long as that removal is not backported).
>>
>> Mmm, but if we have an active user who's testing them then they
>> probably shouldn't be in the frontline of boards to remove.
>> Which other boards do you test with mainline QEMU?
>>
> 
> For arm:
> 
> akita
> ast2500-evb
> beagle
> beaglexm
> borzoi
> collie
> cubieboard
> imx25-pdk
> integratorcp
> kzm
> mainstone
> midway
> mps2-an385
> overo
> palmetto-bmc
> raspi2
> realview-eb
> realview-eb-mpcore
> realview-pb-a8
> realview-pbx-a9
> romulus-bmc
> sabrelite
> smdkc210
> spitz
> terrier
> tosa
> versatileab
> versatilepb
> vexpress-a15
> vexpress-a15-a7
> vexpress-a9
> witherspoon-bmc
> xilinx-zynq-a9
> z2
> 
> Though not all of them are supported by upstream qemu. For some of them 
> I carry local patches,
> for others I use out-of-tree versions of qemu (beagle/beaglexm).

Are these patches upstream-able?

If not, what do we need to get them into upstream qemu?

Thanks,

Phil.
