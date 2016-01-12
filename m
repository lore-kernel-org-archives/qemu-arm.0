Received: by 10.25.159.19 with SMTP id i19csp657096lfe;
        Tue, 12 Jan 2016 10:13:10 -0800 (PST)
X-Received: by 10.28.140.142 with SMTP id o136mr12098881wmd.45.1452622390367;
        Tue, 12 Jan 2016 10:13:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g125si32862016wmg.87.2016.01.12.10.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jan 2016 10:13:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJ3RL-0000Z9-Ms
	for alex.bennee@linaro.org; Tue, 12 Jan 2016 13:13:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aJ3RJ-0000Yr-JI
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 13:13:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aJ3RG-00022C-DW
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 13:13:05 -0500
Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241]:35011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aJ3RG-00021a-5x; Tue, 12 Jan 2016 13:13:02 -0500
Received: by mail-lb0-x241.google.com with SMTP id dx9so1607666lbc.2;
	Tue, 12 Jan 2016 10:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=4Nj9SoOulZto/QNTboz5PKAjTRC0LG119FuJVfXh2xQ=;
	b=araNefuPxGDJKSxnFOred1rDAU7wLmeU/xv2beCb5noLdGobFx8oi/MaXwJBIlEtPh
	8QCRXDyxg/JLC41WfLKFLlzjJfJo01tXbsKiJ+HTa5h89G8J4R5X2GdnRBfxljIt4im7
	/rG45HeCnwTy4pxeXrnxHQXON3wNMmCGnMR2BpaEXmCNNDX9EKbgeFJcgxuB2P67ik+F
	79WyL6ou89GkVkkDF+XppRCU28vxe4Ays8RBzgqEMJy1ct9/QWrXkHQY3madcKOE4nE/
	hfAuDD0xpe+xN6XQ8xbKdBiQlw8dNQjtN5CCg3HosTEs7H0S9E6vriYFWSqQIOVRXkiT
	4Ngg==
X-Received: by 10.112.141.97 with SMTP id rn1mr30350934lbb.80.1452622380779;
	Tue, 12 Jan 2016 10:13:00 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	ax1sm5291750lbc.20.2016.01.12.10.12.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jan 2016 10:13:00 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
	<5c18054d536f3f940d3059235f0ac4aad42c835c.1452359845.git.digetx@gmail.com>
	<20160112035858.GG3308@pcrost-box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5695420E.2020709@gmail.com>
Date: Tue, 12 Jan 2016 21:12:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160112035858.GG3308@pcrost-box>
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
X-TUID: 0QiZ5Imll++d

12.01.2016 06:58, Peter Crosthwaite пишет:
> On Sat, Jan 09, 2016 at 08:39:53PM +0300, Dmitry Osipenko wrote:
>> Currently ptimer would print error message and clear enable flag for an
>> arming timer that has delta = load = 0. That actually could be a valid case
>> for some hardware, like instant IRQ trigger for oneshot timer or continuous
>> in periodic mode. Support those cases by printing error message only when
>> period = 0.
>>
>
> Isn't the continuous-periodic the same as period = 0, so if we were to really
> support this, there should be no error message. This would simplify as we
> can remove the conditionals of 0 period completely and rely only on the
> too-fast clamps you add in previous patches.
>

I don't think that clamping is needed. Instead doing the ptimer_tick might be 
necessary, so ptimer user could handle that case on it own.

BTW, that printf isn't quite reliable, hw_error or other way of execution abort 
should been used instead.

Thanks for the comment.

-- 
Dmitry
