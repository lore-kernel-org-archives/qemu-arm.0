Received: by 10.25.159.19 with SMTP id i19csp2807440lfe;
        Tue, 19 Jan 2016 16:51:22 -0800 (PST)
X-Received: by 10.55.27.98 with SMTP id b95mr42337694qkb.51.1453251081952;
        Tue, 19 Jan 2016 16:51:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w80si40417458qhw.30.2016.01.19.16.51.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 16:51:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39766 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLgzZ-0005kB-CW
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 19:51:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aLgzW-0005gI-LP
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 19:51:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aLgzR-00075r-N7
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 19:51:18 -0500
Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241]:33153)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aLgzR-00075n-F9; Tue, 19 Jan 2016 19:51:13 -0500
Received: by mail-lb0-x241.google.com with SMTP id bc4so26812595lbc.0;
	Tue, 19 Jan 2016 16:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=XmJCShusQMf7UXPeJAbCn5VpWVBZsPleP15Xpu7BBsA=;
	b=AYoZFCNNOzaX0E2rRfYDizAbwPOQpPjsBQrXXzQUlZufURpMybdynSgbgn8JnUpssK
	0BaY/oFeMERzubzr60f/bOoVrA4kIonjwqs7vGQYyibFwny17m6JCOMLOhup3t8nd6NS
	dgDChSF/PlFC92LMeBkC0hls4cpPU/pZGKyn3Nk9oGGclKYkJbnHmFQDlTVVHxfrust2
	27xNWSQBucgYlBjzeiMwc74kQZ4Yapd+qKnOz1mB/KpCIdZGFcSH2bTjvA38op3B7Vch
	i9L30Na1wv+ZeUBzgMr69nh9dqzaHlfoLEikNjmmb0vJjP0G8ixYFSY5ItSmQNsCpv/P
	K1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=XmJCShusQMf7UXPeJAbCn5VpWVBZsPleP15Xpu7BBsA=;
	b=C0aiFj2ofCmyXOFVi6jDWBeYuYVN2YXvQOUx44Zl4jA/PSpWeICLvHFgc+Bu9MU1+C
	wpwaX1rPoG65hFWJGPKc1V9M8EkBb0RgLEysSW8YrgMuLK5+DtZoLjR60YVj/8gWmSCW
	XkDhQ8W+a9OGlHfDJsRUoElf62tuH6emB4IY10B9i1oWOkPDkgHnbQoWqt0OmlGFkwsq
	+WFZNVChG+a5qUqxa3LLBKmhS+D8D0Ny5FYOSgw5lcahKv0O9aYO5kQtsCq4Pj0IMJ1p
	wE5fQt306+VdK+bBjFnJAgUDdNKGwFFi3PjWHIW+HNS3MWWEm8YbZrr2LIgpOpKWfp6T
	xAgw==
X-Gm-Message-State: ALoCoQmWucjh/d6Q7TIvwChZqygWdbGvINCleGoQP1nlQR5SHVKsSirboRGRyHpIiC7KRbAYzy8m8qEpsEKnc2r0WF5L5WN8Dg==
X-Received: by 10.112.137.97 with SMTP id qh1mr11666193lbb.81.1453251072330;
	Tue, 19 Jan 2016 16:51:12 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	ne8sm3699100lbc.21.2016.01.19.16.51.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 16:51:11 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
	<5c18054d536f3f940d3059235f0ac4aad42c835c.1452359845.git.digetx@gmail.com>
	<20160112035858.GG3308@pcrost-box> <5695420E.2020709@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <569ED9DB.6070508@gmail.com>
Date: Wed, 20 Jan 2016 03:50:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <5695420E.2020709@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::241
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v10 5/7] hw/ptimer: Legalize running with
	delta = load = 0
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
X-TUID: njSYm9cG2U4C

12.01.2016 21:12, Dmitry Osipenko пишет:
> 12.01.2016 06:58, Peter Crosthwaite пишет:
>> On Sat, Jan 09, 2016 at 08:39:53PM +0300, Dmitry Osipenko wrote:
>>> Currently ptimer would print error message and clear enable flag for an
>>> arming timer that has delta = load = 0. That actually could be a valid case
>>> for some hardware, like instant IRQ trigger for oneshot timer or continuous
>>> in periodic mode. Support those cases by printing error message only when
>>> period = 0.
>>>
>>
>> Isn't the continuous-periodic the same as period = 0, so if we were to really
>> support this, there should be no error message. This would simplify as we
>> can remove the conditionals of 0 period completely and rely only on the
>> too-fast clamps you add in previous patches.
>>
>
> I don't think that clamping is needed. Instead doing the ptimer_tick might be
> necessary, so ptimer user could handle that case on it own.
>
> BTW, that printf isn't quite reliable, hw_error or other way of execution abort
> should been used instead.
>
> Thanks for the comment.
>

Just tried with the clamping. It works, but what clamping should be chosen for 
icount mode? delta * period = 1ns is damn slow.

However, I'm still not sure what benefit has clamping over unclearable IRQ... 
only disadvantages in form of slowdown in icount mode, +2 lines of ptimer code 
and possible misbehaviour of blazing fast host machine in non-icount mode.

-- 
Dmitry
