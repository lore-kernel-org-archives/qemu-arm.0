Received: by 10.25.44.15 with SMTP id s15csp5155366lfs;
        Tue, 11 Jul 2017 10:49:04 -0700 (PDT)
X-Received: by 10.55.164.209 with SMTP id n200mr1368747qke.159.1499795344601;
        Tue, 11 Jul 2017 10:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499795344; cv=none;
        d=google.com; s=arc-20160816;
        b=X5yd/Q8nRWc89QYQf/jpiAb1n5YSduqOFVLgrMqMvRrnNHgov7RJtVNyeSF7/3zoW/
         O9oxxo56IoxwBUk+h8vtc+tZiWTeLi2/BRZR5nN/9E30Id239clESsDTMlbZ+4wOsTUN
         8CpdscnT7qKeXRmIZk0YFzMnpZfuNGLbm0rxPgIB36a4gGyysvP0mQyhb9l6J9tvcuug
         Ul6FF5ZGbsRvGEogdt3NQ3uMdBLEHqgA8prOysFFX6QqyzL9QlDHWV0hQAEWjjvVkbLi
         KjKNLrixh2Z+reR3rUnxznI/RBOqMl/DnoDJNybuuaHk4jtPGA5dxdVySmqcYUyCqwGM
         Y8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=RvUAcVAbrDjTr6ruPZ5LIcmEhaxurA8zv+YZHWGUsh0=;
        b=AjrOef8JVngIdYaxohko0WBF4dFXW/KjXz6sn/TsAiCey5QeZaCxtXBPzMbnhjbXun
         VIJMqS7Mss5584ahKCor1y/+lSRbOmkpoecaJMsZ1RO8pe27pqUoG1j5LFFW+YkzEKQ7
         guWxRNwtBk+V873zMwRFWvkP3p6lbRiCItA66lmPpAr3EjxUfztF299IodbQNubEj6oh
         2WmMWL4TQP4aAQzToWOrYiy6NGxdxd8YBYSLa7PJ2ZajP7QU7pW1pxWzgsDUePU5/gyf
         0d+wwCNHbnNtFLY9lcBTynoJLT/4cOyP5bX4jVmZKzotiJsLckXVno04w9hQu7r85UVU
         +k/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Cytv4Wu7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y28si527861qtc.18.2017.07.11.10.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 10:49:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Cytv4Wu7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUzHR-0006RT-T1
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 13:49:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUzHM-0006Pw-Ti
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 13:48:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUzHM-0004aW-16
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 13:48:56 -0400
Received: from mail-qk0-f196.google.com ([209.85.220.196]:35442)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUzHF-0004Pk-8J; Tue, 11 Jul 2017 13:48:49 -0400
Received: by mail-qk0-f196.google.com with SMTP id 16so1856099qkg.2;
	Tue, 11 Jul 2017 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RvUAcVAbrDjTr6ruPZ5LIcmEhaxurA8zv+YZHWGUsh0=;
	b=Cytv4Wu7+Y4Rq/Tz1WsQOHq/TnrPQNGuUA3lRUNkDTVXY0MgdiEfHIRVFH/SbJ+dMA
	9gBuW7cQowfkMhiDPtllKWITZSqplMAFOsw/zFcmKjzvV9bjXfkvoLijmzYsFbCAoW3N
	Igj6XecoG8dTwEsbO0g1cSpzI7fuxJ5/sqeIBcAKVxaSPtBrT2pRH6qGlsUwopKCSFrL
	q/hM26fQfm38n1tSMUehWp1tCT9wATOecNbRaQ8FK4sSwLdDozTQJh/SYXzQCbP246vb
	LOQaYWK6Dh4218hp9QWM4V1uiXBrtlINhVvxW8yT2kMuDoYEcpYJ2DLYl+O7LQgRLalL
	OkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RvUAcVAbrDjTr6ruPZ5LIcmEhaxurA8zv+YZHWGUsh0=;
	b=Lre9U9ptDd8l2EyR6Tq8mNYOGxIFp0szWFfN/LmYP0wTOhjuZveB7vGVy2zQzQ/0SM
	uxLl3mFOfxSr3XM7CGg2ZTh/Xmn1nW+MsKFkgAA6XLRunI3V61qN0iQT1z8mp+DlQPeu
	H13lXVTC6h63mdjlgbJF3jBeS/GIWofNI6UHQbklC8g7DIvnWWECP8Y4TTDSnl8pdN8p
	SHJI4wdNL1Ii9hwBR+0siFWIIsLbSszAb15BecOl15/Lu0FzH0CZr4Tt6auUnTKn39Fj
	OrOa4Rhlx8Tyc3XpocG6rVeU3mXOfjVmHx+9UKqy7yQGDmcn3slAXA2dgYU8MA1S5323
	tqkQ==
X-Gm-Message-State: AIVw112mi2W839bAZ23BnpTP8GMbz7UElzYbWi79cppNrm/ZUBsR7hcJ
	OLu4NOAu6GCR3g==
X-Received: by 10.55.46.2 with SMTP id u2mr1463648qkh.23.1499795268662;
	Tue, 11 Jul 2017 10:47:48 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id l4sm429885qke.60.2017.07.11.10.47.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 10:47:47 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair23@gmail.com>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-2-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKMO4GQB1Cgy5rZw8pJawO_kWFZ7PiLGzWPch5CqkOKp=Q@mail.gmail.com>
	<CAFEAcA9xOEX3p0H2=GfYbGXwJkfYYXkVfZH=h0GbM_-bZ4auSA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <05c9cc77-6d9c-6b29-3cbb-4146262eb1f2@amsat.org>
Date: Tue, 11 Jul 2017 14:47:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9xOEX3p0H2=GfYbGXwJkfYYXkVfZH=h0GbM_-bZ4auSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.196
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/7] hw/arm/mps2: Implement
 skeleton mps2-an385 and mps2-an511 board models
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1hJfGFLhbvO0

On 07/11/2017 01:35 PM, Peter Maydell wrote:
> On 11 July 2017 at 15:33, Alistair Francis <alistair23@gmail.com> wrote:
>> On Tue, Jul 11, 2017 at 1:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
[...]
>>> +    create_unimplemented_device("RESERVED 4", 0x40030000, 0x001D0000);
>>> +    create_unimplemented_device("Ethernet", 0x40200000, 0x00100000);
>>> +    create_unimplemented_device("VGA", 0x41000000, 0x0200000);
>>
>> I did not know this was an option, this is pretty cool.
> 
> Yeah. It's really nice for bringing up a board model because
> you can just add -d unimp to your command line and get the
> info about what devices the guest is prodding that you need
> to implement next.

For reverse engineering this is the best device ever :P
