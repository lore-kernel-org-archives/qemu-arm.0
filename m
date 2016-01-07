Received: by 10.182.158.201 with SMTP id ww9csp49127obb;
        Thu, 7 Jan 2016 09:34:28 -0800 (PST)
X-Received: by 10.140.130.22 with SMTP id 22mr139773517qhc.99.1452188067973;
        Thu, 07 Jan 2016 09:34:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 68si37282461qge.98.2016.01.07.09.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 09:34:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHESB-0003lG-MP
	for alex.bennee@linaro.org; Thu, 07 Jan 2016 12:34:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHESA-0003l3-1m
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 12:34:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHES7-0005EZ-An
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 12:34:25 -0500
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c]:36416)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aHES7-0005EV-3Z; Thu, 07 Jan 2016 12:34:23 -0500
Received: by mail-lb0-x22c.google.com with SMTP id oh2so211723313lbb.3;
	Thu, 07 Jan 2016 09:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=gkYQJsSSgrntv6CXbrQcTVL6oK0GSlxWcXXNiayKWZo=;
	b=RCKgUzEI4eYBSzMFPMm3y3LTL0xHoooko33qj7Cjc59a3XKqRXcVcxvqipUe0U6Y7z
	wqsCIY0I470zgft+Bv0jbGV8bV9RNzsvct8GtmA4FdEAZ2eR+/hCuqVAw6mx6wOu4DQy
	5qHOZEoUYq/v0TUsoDUUuZH3J0Bn+fNu2mBsaTPZq8iBQpxWDYiLQ30gG84iZF+wZGxl
	qMQSHt6nETxUv02ToGywcH2kkLCd8Z5l1xD/fR4NngKThHUDMmm2ifaVVKl/uayJgd+F
	f/O9ZwL+zhNh8DsL9PqfERPYW8QLqzDQbJTFSiCJmdu3jjI0xfAKMdUJAycNQiVG4xzn
	nSEw==
X-Received: by 10.112.63.68 with SMTP id e4mr38184131lbs.130.1452188062217;
	Thu, 07 Jan 2016 09:34:22 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	px9sm17845831lbb.4.2016.01.07.09.34.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jan 2016 09:34:21 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
	<c4dafbd33c4428495d20d9b2228033ed5868b63b.1451960508.git.digetx@gmail.com>
	<20160106131744.GE4227@pcrost-box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <568EA189.8080804@gmail.com>
Date: Thu, 7 Jan 2016 20:34:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160106131744.GE4227@pcrost-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::22c
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v8 4/4] arm_mptimer: Convert to use ptimer
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
X-TUID: jn5M3NNFLYNV

06.01.2016 16:17, Peter Crosthwaite пишет:
>> +        if ((old & 3) != (tb->control & 3)) {
>> +            ptimer_stop(tb->timer);
>> +        }
>> +        if (!(tb->control & 1)) {
>> +            break;
>> +        }
>> +        ptimer_set_period(tb->timer, timerblock_scale(tb));
>> +        if ((old & 3) != (tb->control & 3)) {
>> +            value = ptimer_get_count(tb->timer);
>> +            timerblock_run(tb, value, 1);
>
> Is this reachable when the load value is still 0?
>

Yes, timer runs based on current counter value. You can load = 0 and set counter 
!= 0 that would result in one-shot tick. Hmm... I need to fix it. Thanks for 
leading question!

Ughh... just noticed that test_timer_set_oneshot_count_to_0() on real HW sets IT 
bit if prescaler != 0. Looking into it..

-- 
Dmitry
