Received: by 10.25.208.211 with SMTP id h202csp1831158lfg;
        Tue, 1 Mar 2016 13:04:09 -0800 (PST)
X-Received: by 10.140.241.68 with SMTP id m65mr3498930qhc.98.1456866249788;
        Tue, 01 Mar 2016 13:04:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z20si32730486qge.41.2016.03.01.13.04.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 13:04:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:52254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aarSj-0005L4-C9
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 16:04:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aarSc-0005Hx-7q
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 16:04:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aarSZ-0007zw-1M
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 16:04:02 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:34003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aarSY-0007zr-Qn; Tue, 01 Mar 2016 16:03:58 -0500
Received: by mail-wm0-x242.google.com with SMTP id p65so6229771wmp.1;
	Tue, 01 Mar 2016 13:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=s6AtxqhpW3QqCM4gOm2DbkMQN5fOGurnn16FiNPvMKY=;
	b=zrjRlWJwYS7M3CfMGWUw4dsWAXvg2JCG5t2sUtWqkz+0RP+q4A2mLykGp5DtrBwpRp
	w+Be7NOHQ5pBbWDr+MUDcwdiQkiHVtgcwfNWrOsah9NJ1BELf4I0hhT9/uddM+N7yNOx
	DEQrrHF3z03qQXkfBlPozUxjQkqtcUs5RcIn00+LbWuI0aGoraUs9EcXIb48f2hMzKwm
	fYe9vq89hZqyipNvuYYEaJzACZd8Qqr5uQofZRZiotvshTYo4NcPnWTcrzFBUxJLlxZo
	YmiD9DFMYM4QHZL3gHuoK/5GTNq6DBmuidS82Q8yH2TW8+2vGPMDszl+2T/0d927lm+5
	Wu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=s6AtxqhpW3QqCM4gOm2DbkMQN5fOGurnn16FiNPvMKY=;
	b=LxqawUA+Rou68X9XMQAuVUJA/hmn8432M9AcWAuFPESKB7U4WRvLYCXulIOLX1N26S
	N58ePTY1byFQkzP4G1+G5jVhS2itvsDq7wEpsLd5YawJB1OJnV5EyikcZ7dcU3YlvQgA
	CJuJVuz16BAY2Tza1OYZu/WftHPFSkan14Mimai6PwaYmllpVWB9KrYK+txKZiTPExn/
	Zazh04a2gz8BIVYNheAs505GGWmp74sQzWdVFvAhJ4u78zKRCMEca+wQLY23K/pOOfxh
	Eu4DYEwOer2d+ijGf7yVybiOvjcDrMMKJmWEuHlCX1ZNTDH5+8SLQjk2D0SgmyntcCz7
	g6lw==
X-Gm-Message-State: AD7BkJKISFCMjvOY/07H2uJo4gVV1q1WTh/EIjCgCZXjO5wPYuhs7hlk+qyWJy/0QqthFg==
X-Received: by 10.194.11.67 with SMTP id o3mr22230036wjb.74.1456866237978;
	Tue, 01 Mar 2016 13:03:57 -0800 (PST)
Received: from [192.168.10.150] (94-39-138-146.adsl-ull.clienti.tiscali.it.
	[94.39.138.146]) by smtp.googlemail.com with ESMTPSA id
	x66sm894755wmb.20.2016.03.01.13.03.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2016 13:03:56 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Stefan Weil <sw@weilnetz.de>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<56D52825.1010107@weilnetz.de>
	<CAPokK=oGzBuvSKw7PFiwwzL0m_=bu7haNYqsyL_WV6PP6UfCyQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56D603BB.2070708@redhat.com>
Date: Tue, 1 Mar 2016 22:03:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=oGzBuvSKw7PFiwwzL0m_=bu7haNYqsyL_WV6PP6UfCyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Piotr_Kr=c3=b3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 00/17] ARM big-endian and setend support
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
X-TUID: se3pKfuiewFu

On 01/03/2016 19:43, Peter Crosthwaite wrote:
> On Mon, Feb 29, 2016 at 9:27 PM, Stefan Weil <sw@weilnetz.de> wrote:
>> It would be nice to get at least the emulation for 'setend' into the
>> next version, because it is needed for the Raspberry Pi emulation.
> 
> BTW if you can link me binaries and a failing command line for the
> failing rPI work I can test it, I am currently doing my own standalone
> tests (of linux user as well).

Try the repository at https://github.com/bavison/arm-mem.  IIRC you have
to change the "#if 0" in test.c to "#if 1".

Paolo
