Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2773436wrt;
        Thu, 11 Oct 2018 10:00:57 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62lYDbkFm8M0vrT0ik2s2M0daWtxDTA2gp0BsEe/pO9lszuc8raZD6hAR8oE+AcU+Q9jZ6/
X-Received: by 2002:ac8:1967:: with SMTP id g36-v6mr2278603qtk.193.1539277257860;
        Thu, 11 Oct 2018 10:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539277257; cv=none;
        d=google.com; s=arc-20160816;
        b=fYSlkaQkt3p7lReuNAoXzSDTE+oNJQLLLUk7ltojixYspJaUKJmLKrkTcoWdjzA2yY
         G9idKR9nE6e6ZphyBZX2xkGKT7p0x2AwUm7Fz4t+/3CJ9igN81DalTwK4KJZ6dp0Ka9p
         8XJEVO73YQ8ulgLBOiRXhzvMxjuAfmIJe7p/vG9LZYqPEui/MxdDPi2fjBlozN30N0zt
         nvruLuoW1SJ4m4eDPB/Zoy9FcH1emGOOdmsSd2dYGSp0N6tukfwrYUdGhHtGCWjMF0Xb
         FyHqkfmiOgtKu+24gMhXaNrfjG5hh4FpOb6HLowA5vg/lDoH3RHt6+c2WWSwXMuJH1s2
         oLBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=/BMvkrz5IXmfF7KDY9p/ZJUrpd04MY7Mng+yPNhWYyI=;
        b=h2bcAelCDxUSxArWtbeGBXdbt1Xu0z+8UTKUxuVRVbduIKYXXOD1fgJzwP+Pod9//8
         dPlGHCa0CYtJl1EIeWASvPM5iGrh25RKpt2f95akLK5X1Xia6IWBQ9Z6Xh/gFnj7s4Bm
         to3MvuhoLHdNZVPCx/wrkE9kk18lqRuVROTbQCUtTp1MEVpe13a5CJ0YRNOeERXnzaIV
         YygWQLWBaJV+B6txwFkPWH9RU/SpNrCBwf/0iAHwDLDDB++6dALpSIlY9Xj6UI+gD5Sl
         VXICE2mpJ0SuskvI1y8e9ZzAwwFT2ni2DsbuW7UE+I6ImBuhGaCThZ3cjs7eJG4eR4I+
         vRvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2-v6si5989119qkb.102.2018.10.11.10.00.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Oct 2018 10:00:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAeKX-0006SN-Cy
	for alex.bennee@linaro.org; Thu, 11 Oct 2018 13:00:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAeKG-0006RM-5G
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 13:00:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAeKC-0007XF-Dm
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 13:00:40 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40052)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gAeKC-0007Tg-2n
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 13:00:36 -0400
Received: by mail-wm1-f66.google.com with SMTP id z204-v6so10244054wmc.5
	for <qemu-arm@nongnu.org>; Thu, 11 Oct 2018 10:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/BMvkrz5IXmfF7KDY9p/ZJUrpd04MY7Mng+yPNhWYyI=;
	b=dfLZqX5C6OXYENTFfwg6ydPVEMszIAP12DiPel8Nzzv7yO4+gACHlElLhHAs4/Z4Nj
	NXQTHPlS4N5/zSnW7G1MMHQRMzvtbUATcAQvYWmbZCSoQVnSzz1mhUNNZFHRwHL+kugm
	KaY2Yweg6CgBw66Jwiumer3+oQZWtp1BeG1wZzTTI6PPk/0WmB5YayTSjACdrtAbYmg5
	vXNFNgxlULccLs4jHCh612f+K789VnIr27m/Xf8MGRI5pfSk4+seQK610KaK+wqzIMIS
	b3Rlo+rfFkwdh98UPUcMteYLmQZxbNDCjSEwBmIPkpMSpw+a9gERSE2fhGZyu9S6uZFd
	E3Ig==
X-Gm-Message-State: ABuFfogpZk5kqkXT+PN7c+lqs6AtMUIaz+j9Sg5kpIbEPy3WeVFfj69G
	0Qje3BAlmqvw78RdRFfQjcEpdA==
X-Received: by 2002:a1c:5505:: with SMTP id
	j5-v6mr2335084wmb.146.1539277226834; 
	Thu, 11 Oct 2018 10:00:26 -0700 (PDT)
Received: from [10.201.33.229] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	b5-v6sm21843301wrr.94.2018.10.11.10.00.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 10:00:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Damien Hedde <damien.hedde@greensocs.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<08d9d1e0-3c37-4b69-bb68-bf993b91289a@redhat.com>
	<2dddf6d3-4362-9ed1-18b5-f927e850c10f@greensocs.com>
	<CAFEAcA-mv2k=fe_QoBpdow4afm6QR2BPAAaD+aC3hdxEfvcPAw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8bee981b-298c-10ab-7f0d-4d0c2d2c8e02@redhat.com>
Date: Thu, 11 Oct 2018 19:00:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-mv2k=fe_QoBpdow4afm6QR2BPAAaD+aC3hdxEfvcPAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 0/9] Clock framework API.
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, konrad@adacore.com,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ST+cQsnZxWSX

On 11/10/2018 18:23, Peter Maydell wrote:
> On 11 October 2018 at 17:20, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> Hi Philippe,
>>
>> On 10/4/18 6:13 PM, Philippe Mathieu-Daudé wrote:
>>> Hi Damien,
>>>
>>> On 02/10/2018 16:24, Damien Hedde wrote:
>>>> This series aims to add a way to model clocks in qemu between devices.
>>>> This allows to model the clock tree of a platform allowing us to inspect clock
>>>> configuration and detect problems such as disabled clock or bad configured
>>>> pll.
>>>>
>>>> [...]
>>>>
>>>> Any comments and suggestion are welcomed.
>>>
>>> How would you instanciate devices and connect their clocks from the
>>> command line (with the -device option)?
>> I didn't not thought about that. I'm not sure to understand how this is
>> done for a gpio for example. Is this done by setting the link property
>> manually ?
> 
> You can't wire up GPIOs on the command line. I don't think we
> really need to be able to wire up clocks on the command line either,
> do we?

This would be a big mess.

> 
>> Should clocked devices have DeviceClass::user_creatable = false by default?
> 
> How many devices have a clock and nothing else that would cause
> them to be non-user-creatable (ie no GPIOs, no IRQ lines, no
> memory-mapped memory regions) ?

I'm not sure I understood your question.

But I understand than as devices consuming GPIO/IRQ, clocked device
can't be instantiate from command line, and I am happy with that.
