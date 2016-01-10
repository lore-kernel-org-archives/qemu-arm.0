Received: by 10.25.134.130 with SMTP id i124csp1470214lfd;
        Sun, 10 Jan 2016 06:10:28 -0800 (PST)
X-Received: by 10.55.207.217 with SMTP id v86mr20774266qkl.16.1452435028908;
        Sun, 10 Jan 2016 06:10:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d9si72435702qgf.7.2016.01.10.06.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Jan 2016 06:10:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIGhQ-0003nh-BY
	for alex.bennee@linaro.org; Sun, 10 Jan 2016 09:10:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aIGhN-0003nZ-LU
	for qemu-arm@nongnu.org; Sun, 10 Jan 2016 09:10:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aIGhK-0004hT-Cd
	for qemu-arm@nongnu.org; Sun, 10 Jan 2016 09:10:25 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aIGhK-0004hB-5E; Sun, 10 Jan 2016 09:10:22 -0500
Received: by mail-lf0-x244.google.com with SMTP id c134so2700775lfb.2;
	Sun, 10 Jan 2016 06:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=34Vcy6p8pK0xBWtfZP6r7z+iyuAJg7yQDJxE3vJ2DIs=;
	b=Ck6IwbK2aOLQCgkeeDzeuUpJ2PX62WXFBSCTkXchh5XPHH8Dx5WJEw868qfQUXbvu5
	mFHWUTtQNAbYUnN+8RaLjQ5ALPR3V/4lGMBbhOQv0GjD9ib6kC/tQX10pL04VsgODXVv
	S7pC1JFPBWL3VRr5PYUS35tHWA0YsOppQE9TwVoiJ6NB7pMxhS1fDZCBr6GfgeoOZbG0
	GQi65xEfbH7u1PqFP7EGxwffQive1aOUgHyv6CjN2sFN7hcO7Oal90XT88yka30Y93m3
	9NNPOYinUKFcJnDzKYUPmkihnrU26PasQniISqKkH8EtpB/EGVCOEVg+LYiVkHRgJIv6
	S1jQ==
X-Received: by 10.25.40.11 with SMTP id o11mr6101292lfo.71.1452435021348;
	Sun, 10 Jan 2016 06:10:21 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	64sm321767lfx.19.2016.01.10.06.10.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jan 2016 06:10:20 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
	<9bdf3e1d349c7cfc6d75cc37430fe4f177c20734.1452359845.git.digetx@gmail.com>
	<CAPokK=qC77XBkNpHa1y_Dajd9Hv8+a-wx9iqC1dRumeKgvUvaA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56926634.8090507@gmail.com>
Date: Sun, 10 Jan 2016 17:09:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=qC77XBkNpHa1y_Dajd9Hv8+a-wx9iqC1dRumeKgvUvaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v10 2/7] hw/ptimer: Perform tick and counter
 wrap around if timer already expired
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +9kyQUgorfqw

10.01.2016 03:44, Peter Crosthwaite пишет:
> On Sat, Jan 9, 2016 at 9:39 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
>> ptimer_get_count() might be called while QEMU timer already been expired.
>> In that case ptimer would return counter = 0, which might be undesirable
>> in case of polled timer. Do counter wrap around for periodic timer to keep
>> it distributed. In order to achieve more accurate emulation behaviour of
>> certain hardware, don't perform wrap around when in icount mode and return
>> counter = 0 in that case (that doesn't affect polled counter distribution).
>>
>> In addition, there is no reason to keep expired timer tick deferred, so
>> just perform the tick from ptimer_get_count().
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>   hw/core/ptimer.c | 26 +++++++++++++++++++-------
>>   1 file changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>> index c3d31cb..cf329eb 100644
>> --- a/hw/core/ptimer.c
>> +++ b/hw/core/ptimer.c
>> @@ -83,14 +83,17 @@ static void ptimer_tick(void *opaque)
>>
>>   uint64_t ptimer_get_count(ptimer_state *s)
>>   {
>> -    int64_t now;
>> +    int enabled = s->enabled;
>
> You haven't added any additional usages of s->enabled to really
> warrant the new local variable, I think it should just stay as
> s->enabled to avoid churn.
>

Compiler doesn't know that ptimer struct is supposed to be thread-safe there and 
infers memory load instructions rather than use pure cpu registers. Local 
variable would help to produce somewhat more rational. However, given how 
optimized and complex modern cpu's, I'm not really sure that it would bring any 
benefit and agree that it might not worth churning. Thanks for review!

-- 
Dmitry
