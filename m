Received: by 10.25.208.137 with SMTP id h131csp1354224lfg;
        Sun, 8 May 2016 20:30:14 -0700 (PDT)
X-Received: by 10.55.116.69 with SMTP id p66mr34807104qkc.129.1462764614548;
        Sun, 08 May 2016 20:30:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 41si17408034qgh.1.2016.05.08.20.30.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 08 May 2016 20:30:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azbtd-0000Q6-CL
	for alex.bennee@linaro.org; Sun, 08 May 2016 23:30:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1azbta-0000MN-KB
	for qemu-arm@nongnu.org; Sun, 08 May 2016 23:30:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1azbtY-0007XK-8W
	for qemu-arm@nongnu.org; Sun, 08 May 2016 23:30:09 -0400
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d]:34307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1azbtY-0007XG-2T; Sun, 08 May 2016 23:30:08 -0400
Received: by mail-oi0-x22d.google.com with SMTP id k142so196993940oib.1;
	Sun, 08 May 2016 20:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=xCohekMND4l+ZSRWWd80Pqbiq2jV2VQhNQeH1ihblQg=;
	b=fWYQhOtq9D2DnZnVT6cV7AqOotE96iQF8dtjfHUnfTdup0M+A8LQC5P7y0OjHHR6TG
	uz3SftVixyKu5YCNftRiCGLxph4h6DsD8fG6fGJLw2wUB1o5Ez8/j19UUjA50XJU8AFU
	E0CEJMfetwr82t6F697WJ6wvwcMIvE8g2U3HYrYwgJTaY/+UVhx1ALtkIjxkmuGznTWQ
	7QQ/6MNaBYMSP2yy6ssDurfO/j/gjIrvEF1DgAPh//C7XPTtdDUqJ9AIrcvVIIjhZRxc
	PWNPekRCO2SHb22n4jdaElz1bjvyY3AQ7PGxA4NmWeEYIIce5e12xj+ktuIb17ZQy70f
	vDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=xCohekMND4l+ZSRWWd80Pqbiq2jV2VQhNQeH1ihblQg=;
	b=FTkkLg3FCqzYA284Otnh2sHu/SoYUD1BuMS5aDAEyP1SIkDZ14bwJDcNQSvgnQXDRE
	bZoBWtMQV5o2vvuF/IYHjaHd8jR8yDEnkfcK3oJ9w8mkWIFPahJDR6j1MomM2Gy2hxDT
	KMN4+qmOb7UxZ6rYOzB6ZmKeCUmMjU7ta2IxvZvYofijoPhUtrGJoz7BwRyHWxzwDXhL
	sDkLUl7CRsM/8fq5wdSjMa0POt+pn3QC1iK0hPGIKOuyFjeDuYPrAMiacvrjVLIy/Lk0
	/AmtO6sgS5L2hxnVCh2bAQNmUoD18snok3pUQvb5JxwSJDR0FkHGqbNL3lH0Mr+71s0O
	Fnow==
X-Gm-Message-State: AOPr4FXuZdhylq/xIKTMwKCC9aP5mXdOimynXZpEfbDlawGV0habXIjsJjU96/VXycFQ8R96MPZln716Oj2OwA==
MIME-Version: 1.0
X-Received: by 10.202.75.82 with SMTP id y79mr12489828oia.71.1462764607102;
	Sun, 08 May 2016 20:30:07 -0700 (PDT)
Received: by 10.157.54.216 with HTTP; Sun, 8 May 2016 20:30:07 -0700 (PDT)
In-Reply-To: <570E1866.9010201@arm.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_0ssT32oNrgTHChKsAJNkjUfCHFGg2vPtk8-AWsRjVqw@mail.gmail.com>
	<CALicx6tM6__TWjVPLdNzMMpoyQYHZOnArFwz4E+QyyxN7TLruQ@mail.gmail.com>
	<CAFEAcA8T-90NFw_fMWRZ7JuQ4UpxRGfwsbHLi9cigsiD=zXupA@mail.gmail.com>
	<CALicx6ubAgfGJhGX5wRTeHfmj_RHX__hkJxAnBA8v=e8n=HgZg@mail.gmail.com>
	<CAFEAcA8pboFpZynTny60JRQYL0S1+HH6KoBy+de6iHOGOGBFCg@mail.gmail.com>
	<CALicx6vnEGxXA3yyzBg8VSHNns5kqvhFfVT23w_Hx7LLSkEq3w@mail.gmail.com>
	<570B7048.5010501@arm.com>
	<CALicx6u-LOA2gAc2f33a=VY0duHhtiHSZ=2+269daeE3YZ1xiA@mail.gmail.com>
	<570E1866.9010201@arm.com>
Date: Mon, 9 May 2016 11:30:07 +0800
Message-ID: <CALicx6saTB9giRqubF=kUkBihvZRoCVq6XVNxvi2a+nkmzMKXA@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
To: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::22d
Subject: Re: [Qemu-arm] [RFC PATCH v2 2/3] utils: Add cpuinfo helper to
 fetch /proc/cpuinfo
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
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	suresh knv <knv.suresh2009@gmail.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	Will Deacon <Will.Deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Catalin Marinas <Catalin.Marinas@arm.com>,
	Suresh <ksuresh@caviumnetworks.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Usf8n2itUdZu

Hi Suzuki/Peter,

On Wed, Apr 13, 2016 at 5:59 PM, Suzuki K Poulose
<Suzuki.Poulose@arm.com> wrote:
> On 13/04/16 10:54, Vijay Kilari wrote:
>>
>> On Mon, Apr 11, 2016 at 3:07 PM, Suzuki K Poulose
>> <Suzuki.Poulose@arm.com> wrote:
>>>
>>> On 11/04/16 07:52, Vijay Kilari wrote:
>
>
>>
>> Hi Suzuki,
>>
>>   The last 5 patches are not compiling on v4.4. Looks like your patch
>> series is not merged completely. Can you please
>> rebase your patches and let me know.
>>
>
> Could you please give the tree below a try ?
>
> git://linux-arm.org/linux-skp.git cpu-ftr/v3-4.3-rc4

This works.
Now the question is, Are your patches getting merged anytime soon?.
If not, I prefer to go with /proc/cpuinfo.

Another solution is look for /sys/devices/system/cpu/cpu$ID/identification/midr
if not available then fall back on /proc/cpuinfo.

Regards
Vijay
