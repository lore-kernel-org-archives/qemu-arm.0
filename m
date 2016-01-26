Received: by 10.25.159.19 with SMTP id i19csp2035584lfe;
        Tue, 26 Jan 2016 12:30:45 -0800 (PST)
X-Received: by 10.55.78.70 with SMTP id c67mr30373836qkb.37.1453840245635;
        Tue, 26 Jan 2016 12:30:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n69si584122qki.30.2016.01.26.12.30.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jan 2016 12:30:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOAGC-00081P-U6
	for alex.bennee@linaro.org; Tue, 26 Jan 2016 15:30:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aOAGA-00080h-BV
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 15:30:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aOAG3-0006zW-TW
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 15:30:42 -0500
Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241]:34498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aOAG3-0006yu-Ld; Tue, 26 Jan 2016 15:30:35 -0500
Received: by mail-lb0-x241.google.com with SMTP id oe3so8790402lbb.1;
	Tue, 26 Jan 2016 12:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=ni63d75F2Ub6HNrZrTB/aLBTlF9SzRi0ANACgs4RVoM=;
	b=eEMopkw40C4N67RAe5jD/qvTqxKgdzq4s0XECDnRi6v4Jd9qi/9rsSb1cSeSfSsJFZ
	JkAa3CRZgjV2f4jKjmUow5SrF/y7aUkq7TZMCGKH1n5ojXsIaCvvDdKvqiPT70WtntfL
	PTZZgPNOqPXfkhWP+OjlELpI0UrIW/SrdGZL+3cQOSaK48Q/hABL1rc5Om/8BhAOqj+Z
	hyVbfxU5yvgGtjGdOcQjzSkxfmNjKRpcTtf307aZZLxP/rukOjthzN8nGeUGncNfkfaA
	LLudkGDxK9mCpvofNIfN/NleuJl00AslFffKMNCBrwySiQuMHDc7z0FT7nsYlcOF8Ke+
	4bdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ni63d75F2Ub6HNrZrTB/aLBTlF9SzRi0ANACgs4RVoM=;
	b=LXOK+3Bg4f4etSKzSYr+pX77r7u4iP22tE/xqVpGl6fSKBRq7qgfZS3rOhDdUOyH2U
	7MsMrpullZdtEA/W1EupZlbHLfnsij1VJS/AHz1dsWFrp8dqwfhZ1hWbmUKl1PZvLOHQ
	P3diuAoo6XGRll6IHrjusGJrBZvKzTWV0tU1eAH45liy+TYokVEUcJn/ohHvcihZlNlj
	CeFzIz8kp+UN8/X4ZymXOI9FbPSrIR0vDfXyp7M5FjjCLrjkjOzK9MqQmTxYYxfHtcSt
	45rfPDgGwov8WvmQMo0mu6e8LlVEeZYW3DDlc+KjtszAmd/CQehCDkGBtpPzhCxtNcUR
	E7ag==
X-Gm-Message-State: AG10YOROZ8U1NJMeetjYhAWybwVrfIlKluH1utU0wDPHDER2kB5lUxhB4kSBHAoxLEhltQ==
X-Received: by 10.112.12.2 with SMTP id u2mr9369514lbb.145.1453840234368;
	Tue, 26 Jan 2016 12:30:34 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	y63sm400592lfd.10.2016.01.26.12.30.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jan 2016 12:30:33 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
	<7b18c0c2ca44c938a198f56094327ab695f09f9b.1453402860.git.digetx@gmail.com>
	<CAPokK=rc9z+VA42t-yMYndo=+ZSXKgL03TJoffZS+dgzY7WGgg@mail.gmail.com>
	<56A4E6E9.2010103@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56A7D737.8090401@gmail.com>
Date: Tue, 26 Jan 2016 23:29:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56A4E6E9.2010103@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::241
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
X-TUID: wJATYafCNx2N

24.01.2016 17:59, Dmitry Osipenko пишет:
> Hello Peter,
>
> 24.01.2016 08:25, Peter Crosthwaite пишет:
>
> [snip]
>
>>> +        timerblock_run(tb->timer, control, (value != 0) && (control & 1));
>>>           break;
>>>       case 8: /* Control.  */
>>> -        old = tb->control;
>>> -        tb->control = value;
>>> -        if (value & 1) {
>>> -            if ((old & 1) && (tb->count != 0)) {
>>> -                /* Do nothing if timer is ticking right now.  */
>>> -                break;
>>> +        if ((value & 1) && (control & 3) != (value & 3)) {
>>> +            uint64_t count = (value & 0xff00) ? 1 :
>>> ptimer_get_count(tb->timer);
>>> +            if ((count == 0) && (value & 2)) {
>>> +                timerblock_set_count(tb->timer, value, &count);
>>
>> This looks like a weird corner-case, what does it do exactly? I can't
>> follow it so it needs a comment :)
>>
>
> It does the following:
>
> mode     | prescaler | reload if counter == 0 | tick immediately if counter == 0
> --------------------------------------------------------------------------------
> oneshot         == 0               0                         0
> oneshot      != 0               0                         1
> periodic     == 0               1                         0
> periodic     != 0               0                         1
>
> If writing control register with prescaler = 0, then for one-shot timer with
> counter == 0 or periodic timer with load = counter == 0 this is NOP. Will add a
> comment.
>
> Thanks for review!
>

Just realized that I missed timer re-run on prescaler change. So it was a good 
question! =)

-- 
Dmitry
