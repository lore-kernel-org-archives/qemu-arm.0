Received: by 10.25.159.19 with SMTP id i19csp623661lfe;
        Fri, 15 Jan 2016 10:10:52 -0800 (PST)
X-Received: by 10.141.23.195 with SMTP id z186mr15970312qhd.52.1452881452562;
        Fri, 15 Jan 2016 10:10:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a126si14390946qkb.100.2016.01.15.10.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 10:10:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK8pn-0000UJ-V3
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 13:10:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aK8ph-0000NK-Mw
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 13:10:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aK8pe-0003WK-F0
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 13:10:45 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:36570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aK8pe-0003Vs-66; Fri, 15 Jan 2016 13:10:42 -0500
Received: by mail-lf0-x243.google.com with SMTP id t141so10377188lfd.3;
	Fri, 15 Jan 2016 10:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=KuP8Sa/MUzhIDTOELRsWTbIKTOL+FO67u5K6+3dcCf8=;
	b=A7wKYFITRJMAhtwWNlJjp7rZ+xjkUvWl7SftMxndeJY1T/o2i8pdlgOc0FwIPMoBcf
	f1YuzHTQ9W6AOcSO3ArnHqP3OyqpxD53i7VL7sY+vJ8zucm/uWm8hrWvXFhKfEyjNWkd
	2WcTPgkBN5MS/6i4snD5/hXvmox+EhwS4hyW82aFsNTsd1Pz9sBQAEj4cte3maSKkHUc
	aEqrm3M0DZvU5qEjNF3/P0RgfIJldAypiaFEGO2nhTbbDg7qrLBS3PfaxsupvcB60R9R
	8wJX0ZzTufBHg6SEGHlnr3qwAYgimDVm4EbfUcZjMaN268OB3oh7P1PnSPOa7LdGvtxx
	L+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=KuP8Sa/MUzhIDTOELRsWTbIKTOL+FO67u5K6+3dcCf8=;
	b=A0VObGIWCft768nnnRF9tR45sH9K8DEw/he633TU+Q0Q1w3oTfL1m/Dww7VQaxg0bQ
	NRy0nCZLnGHVaptgQ+FCHu6btqz8TQNZhkgGsyOn8uZgz1bToHkEMufF0Kf5F+oh5GKr
	YXbGT9yBFbvWkuGIJlw8TchooRUwNFDm6EeQ8V7nzTs+7t5CDBbt8VUtWkqi0H/vT0yW
	kszY2va82A6FDUszYOdNMVbaMFwbjw/g9qo0ofXnc4y+puPwYb8Zwk09GhQBCaYPg8TF
	zN4XJA4+T6OD/c2RuqTzEhCR0GjVCAGh3rOoavPle/LIiJLIGKyRS2YX7wPV1Omu4ruO
	EEsA==
X-Gm-Message-State: ALoCoQk//wYh7Qb9w43fHE4w8084dYYjl2RgVYVIpFYZbpIW+XE4+8D+PlDtJTOUWQ/br+Lcz7vNC6J2Gnr+f66mjX93u1lVCg==
X-Received: by 10.25.159.9 with SMTP id i9mr4001554lfe.109.1452881441259;
	Fri, 15 Jan 2016 10:10:41 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	r202sm1513467lfr.43.2016.01.15.10.10.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jan 2016 10:10:40 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
	<5c18054d536f3f940d3059235f0ac4aad42c835c.1452359845.git.digetx@gmail.com>
	<20160112035858.GG3308@pcrost-box> <5695420E.2020709@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56993601.5010400@gmail.com>
Date: Fri, 15 Jan 2016 21:10:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <5695420E.2020709@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
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
X-TUID: o7gJ/FM45Bwb

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

Looking more at it, I think we should keep period = 0 forbidden. So it's treated 
as undefined behaviour and ptimer user should take care of it. If we'd want to 
handle period = 0 within ptimer, then we should also handle freq = 0, which 
implies potential ptimer VMSD version bump. Also it is uncertain what default 
behaviour should be chosen for period = 0, my guess is that pausing 
(_not_disabling_) the timer (like in freq = 0 case) should be more common among 
various hardware. If you have any thoughts on it, please let me know.

-- 
Dmitry
