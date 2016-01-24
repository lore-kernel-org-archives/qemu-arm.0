Received: by 10.25.159.19 with SMTP id i19csp813135lfe;
        Sun, 24 Jan 2016 07:00:45 -0800 (PST)
X-Received: by 10.55.73.74 with SMTP id w71mr16172805qka.60.1453647644993;
        Sun, 24 Jan 2016 07:00:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6si18937253qge.108.2016.01.24.07.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Jan 2016 07:00:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNM9k-0001fN-L0
	for alex.bennee@linaro.org; Sun, 24 Jan 2016 10:00:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aNM9j-0001fF-0Z
	for qemu-arm@nongnu.org; Sun, 24 Jan 2016 10:00:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aNM9f-0006ZE-0Z
	for qemu-arm@nongnu.org; Sun, 24 Jan 2016 10:00:42 -0500
Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244]:34360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aNM9e-0006ZA-OS; Sun, 24 Jan 2016 10:00:38 -0500
Received: by mail-lb0-x244.google.com with SMTP id oe3so5686528lbb.1;
	Sun, 24 Jan 2016 07:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=kDuGCIEXPc48rrOZ6gRKgwIk7Saox0gF4tlCAegHszE=;
	b=dhdOX32a27XByBYpXkIZciQjEgoQjxcjc96Yd3lsO053ACDkHBkAKNNQmvtbFXtlze
	3lp88WjwavoDWt4BH7XNuB/Mpy0EtFvjj97R/8qpmwY9V2ur4UGVztq22dMqY1INvwlT
	UUXbGC548yzPqX2llQQpaG4WrW5n03YGCKoOdKXSdQqeoC0RD5jEKhU+JkMgGU9GLhUM
	bY7eK2B15+y4na7Q3BG+QKeYEf5rf6Q4xWOiEvmJfaWgefCcibATA4iGyEnVrOfKqNC6
	WxiWPCd2ixcPN0KWugb9goG0AvQad6atjtLXzcXRd9l9o2DsZ/9bGS793XnXrjCLBg5s
	2hPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=kDuGCIEXPc48rrOZ6gRKgwIk7Saox0gF4tlCAegHszE=;
	b=fRoohTBi/YQ3KJud5YPijeJTzsnLn8gRmGV1btFR19BPwL5rl2r3Ul9caM2ZZ0Ey4T
	zID14ajGKA9lhpVtwXwuronFB036boEfHDZrDdJUxLGGVpactd1iitGgH4Pmb9Xk78+1
	rzEMtpQX30dccsufQlVTDVUASCsIkNdFbjmN1XN2SCfYDPBmJ4XN1ci1DquGWrxH3pbc
	14sJSab9BLADX5khzBiViCnj0Zzq8pi9VxW4cNxxMNeZb9meZJ9iIhlZVoNPXN0DplLv
	JrcDJNXoLkdYV1wdjdwo4lDgHKuG5xtJzpywP8cZdEHFM/S0QXNyBw5tbsy4Je6eUe9R
	Sxmg==
X-Gm-Message-State: AG10YOTyEJJF9veR4Gb7R2tYoKmcs6Zv8gTpUHE3TFGvbuhZ8oX01Xiug3zFO9Z9PKi7vw==
X-Received: by 10.112.163.170 with SMTP id yj10mr926321lbb.141.1453647637451; 
	Sun, 24 Jan 2016 07:00:37 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	n62sm2106909lfn.5.2016.01.24.07.00.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jan 2016 07:00:36 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
	<7b18c0c2ca44c938a198f56094327ab695f09f9b.1453402860.git.digetx@gmail.com>
	<CAPokK=rc9z+VA42t-yMYndo=+ZSXKgL03TJoffZS+dgzY7WGgg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56A4E6E9.2010103@gmail.com>
Date: Sun, 24 Jan 2016 17:59:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=rc9z+VA42t-yMYndo=+ZSXKgL03TJoffZS+dgzY7WGgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::244
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v11 7/7] arm_mptimer: Convert to use ptimer
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
X-TUID: aQn4MFYuCYWd

Hello Peter,

24.01.2016 08:25, Peter Crosthwaite пишет:

[snip]

>> +        timerblock_run(tb->timer, control, (value != 0) && (control & 1));
>>           break;
>>       case 8: /* Control.  */
>> -        old = tb->control;
>> -        tb->control = value;
>> -        if (value & 1) {
>> -            if ((old & 1) && (tb->count != 0)) {
>> -                /* Do nothing if timer is ticking right now.  */
>> -                break;
>> +        if ((value & 1) && (control & 3) != (value & 3)) {
>> +            uint64_t count = (value & 0xff00) ? 1 : ptimer_get_count(tb->timer);
>> +            if ((count == 0) && (value & 2)) {
>> +                timerblock_set_count(tb->timer, value, &count);
>
> This looks like a weird corner-case, what does it do exactly? I can't
> follow it so it needs a comment :)
>

It does the following:

mode     | prescaler | reload if counter == 0 | tick immediately if counter == 0
--------------------------------------------------------------------------------
oneshot	     == 0               0                         0
oneshot      != 0               0                         1
periodic     == 0               1                         0
periodic     != 0               0                         1

If writing control register with prescaler = 0, then for one-shot timer with 
counter == 0 or periodic timer with load = counter == 0 this is NOP. Will add a 
comment.

Thanks for review!

-- 
Dmitry
