Received: by 2002:a17:90a:3d4c:0:0:0:0 with SMTP id o12-v6csp3387937pjf;
        Wed, 31 Oct 2018 11:47:00 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ctFRfTeoKrXAZcakMbhHyFgaSZzPl6dL6MKdCePZDE7qTXc6BMoKxsbhIfihN2VZxjToRL
X-Received: by 2002:ae9:de46:: with SMTP id s67-v6mr3649753qkf.257.1541011620866;
        Wed, 31 Oct 2018 11:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541011620; cv=none;
        d=google.com; s=arc-20160816;
        b=i8NsdERS5zdiYJIIF1kZMV7WFfbVvo7dKm5K3eCKZpovsjcJQvBeB1NpezGpAQaNiy
         ZqulM2/GylRtT33Q9DtyTIzryArw3xGhkPS5lOM0LjsA1ot3JbzsDC0FgyeUN3rmLVmQ
         yCd2e5kZks6Ev5IXfYa/MRfvkuy17/kqNKi/gEZ1o5vDYyBCa0Ztt8+TZ2IbZxtmXgn8
         yzKCYeAgN8+azE4aIcx6gIXyUVypZeOzAmpEVub3Jpuq5D7cicdugOedBvdy/v9ZCt8A
         bMLLQjQDrYTXX3Qbh0xnoqzR9lRIZjF82zPIOdamMPwUVnAwstbVOeASX7Hx2/+LQ5S1
         yeiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=4wAi0MVHch1/CZVdhq0cnKjwo97A19+gYXS6tzHHUzQ=;
        b=nXwilfiRe+U+m4b5KNMM78GsD0J3c4HW1ePldMMEkWgfVmxmCaiEFg8L/Jy10Lyd4q
         gNXF4NHVahROaaZnKlKr2m2M72TW/B/0w5fEUoyTRSg8qJngKllI0WZrg95a90NrCMe0
         hmo/4plY4WxlxhIP2QEFAfpYiaW15VthAloLztA6kdlGMInccvVgL3YxfrznUSly5rV/
         54Xyf9xuSZ6Q40/s7nFW+94B7TAPzpRQALGYybhXd1717eltIdHXEYeREtiv7L6T+gDo
         dldrCpLfoBpMWyWtLnNwl0ISPoveYawwzwK4sQAArdZKMsGHt8F/wYyUBb3MAvb1Qqla
         AjfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@posteo.de header.s=2017 header.b=kB3OxU+R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=posteo.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s29-v6si472265qta.136.2018.10.31.11.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 Oct 2018 11:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@posteo.de header.s=2017 header.b=kB3OxU+R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=posteo.de
Received: from localhost ([::1]:33009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHvW8-0004gW-Fk
	for alex.bennee@linaro.org; Wed, 31 Oct 2018 14:47:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@posteo.de>) id 1gHvVr-0004gJ-Fa
	for qemu-devel@nongnu.org; Wed, 31 Oct 2018 14:46:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@posteo.de>) id 1gHvVl-0002tC-Pm
	for qemu-devel@nongnu.org; Wed, 31 Oct 2018 14:46:43 -0400
Received: from mout02.posteo.de ([185.67.36.66]:49357)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <th.huth@posteo.de>) id 1gHvVj-0002ou-Sc
	for qemu-devel@nongnu.org; Wed, 31 Oct 2018 14:46:37 -0400
Received: from submission (posteo.de [89.146.220.130]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8AAFD2400FB
	for <qemu-devel@nongnu.org>; Wed, 31 Oct 2018 19:46:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1541011593; bh=B+SFwSL2zPCU1p6ZdR7lBplqgWAHq4f6pD6gvTljQKM=;
	h=Subject:To:Cc:From:Date:From;
	b=kB3OxU+RUrqdlyutWMJN5nu3BAfspnuLdPViAJpd/Lg1TzO+PmFX1zOxtyTDLdTWK
	u6J9CPhd1B19zxvApikusznuESPUIgXYiPQaxv61S+jwrEF/6pYJj12CZ+5Gi5gPS3
	TMs+iOoNpbEU0gc83QrijTOWwp+i0PciJ7IiVi+0A6+Afrugu+xtvgg5EJpN54SxOn
	b71ZZ9FkYWQIuCSdahI5Qef06nIteAscjU+Kt5/AbEMtzrSYAw6AQ/U72FsK7/s0DA
	IOR2j4fwD92whZxs5zdsFu3jLBkiAlv6AznLXekbUTAeS9WSCyVXGJdjsuNSp9TSA6
	KRBqw8TDDA3kQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 42lckG67zGz9rxm;
	Wed, 31 Oct 2018 19:46:30 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
References: <1540548409-22560-1-git-send-email-thuth@redhat.com>
	<CAFEAcA8EubWya8ey9VxhaCw4m2U=KA+i2C-R9P-p+P6oEBBLew@mail.gmail.com>
	<7fc49925-36ff-bd9a-0cd7-e5f8d4bb3672@roeck-us.net>
	<CAFEAcA-UF+SyXvcU+NGZsbqBF2qg+s_x4HPU7yvf7B2G-=HPOg@mail.gmail.com>
From: Thomas Huth <th.huth@posteo.de>
Message-ID: <6861d4a0-c48d-9d48-726b-a1801012b757@posteo.de>
Date: Wed, 31 Oct 2018 18:46:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-UF+SyXvcU+NGZsbqBF2qg+s_x4HPU7yvf7B2G-=HPOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.67.36.66
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JFNcihd45j3Y

On 2018-10-29 13:24, Peter Maydell wrote:
> On 27 October 2018 at 12:04, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 10/26/18 3:12 AM, Peter Maydell wrote:
>>> Hi Guenter; there's a proposal here to deprecate (and eventually
>>> remove) the 'collie' board (strongarm) from QEMU. Is that one of
>>> the ones you're currently using in your automated testing of Linux
>>> kernels on QEMU?
>>>
>>
>> Yes. I can run the test with older versions of qemu, so it is ok for me
>> if it is removed (as long as that removal is not backported).
> 
> Mmm, but if we have an active user who's testing them then they
> probably shouldn't be in the frontline of boards to remove.

Yes, I agree. I based my patch on the assumption that the board was
incomplete and not really usable (as mentioned in the patch
description), but if it is still usable to some degree, then please
disregard my patch.

 Thomas
