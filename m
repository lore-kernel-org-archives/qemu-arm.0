Received: by 10.80.166.35 with SMTP id d32csp2801252edc;
        Mon, 24 Oct 2016 12:03:21 -0700 (PDT)
X-Received: by 10.31.178.198 with SMTP id b189mr11483884vkf.70.1477335801713;
        Mon, 24 Oct 2016 12:03:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f21si5994763vki.122.2016.10.24.12.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 12:03:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bykWm-0000eQ-Dx
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 15:03:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1byjqI-00043R-7i
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 14:19:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1byjqE-0006oN-8J
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 14:19:26 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33342)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <digetx@gmail.com>)
	id 1byjqE-0006nz-0h; Mon, 24 Oct 2016 14:19:22 -0400
Received: by mail-lf0-x242.google.com with SMTP id n3so3524862lfn.0;
	Mon, 24 Oct 2016 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=PlnvqlhjdQR6LixvbzjxKtB64wzDJU94IG02bkQ03v8=;
	b=kqNt8NN7KQREpNhirQOM3+Cp82pqC51RWB74RF0DausrOwM7XF0sOC/IZr4k6i15E/
	ea9Wbl/244J1GizkdfHKwwAeXv9tL9PAIV7dyn7sLD8wq0eDyW9wuxPOnAfuxam8AsTN
	XMY4ok3+IRhdrGQ3OLZ81z+hO6O6Z7waegvnIRS3m6EiPl27q5hK+jKAypr3dqZTgEbu
	oB7+U0+gRO5JQTFqaugUMfH6/CMHhKdrYCd4kLnFDEdErnToFooq0o0VseJBZlQqwe0H
	CHbI0SRLP/tg/oA9An+mgXOnzhzQNjWryb4EVt75rzuM3ouYh0QYDaI5bXLNosH28Mju
	SU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=PlnvqlhjdQR6LixvbzjxKtB64wzDJU94IG02bkQ03v8=;
	b=OF1JLN32v1k6QlQAWdXZ2QWugrpTs9ss7lEkuDgecnWtfoZ8aq145x8/j3l3ubEpc6
	FID4fWWfNYBLhmXENi2ypUwzwhjMjFOmxLXvIudqJ0JAQ6Ity/Sklt18XSlbpSJkg58C
	SlNa9KVIeTnpg0a8IUnvrbGhoIl1rqGvpvgkIox0Ttn8/UUkA05R8QDYCAWzXnktAjkc
	fxkD7edZ/ecqEqp6fG22jleyy2WHbvVnUFVmiyc+0dIFKvJ6XLBxBzN5Yxddp9zmhen5
	hsi1ZoWBzY+VlFPDX7rp6W3IKj/Ycif+rCg1kfA48ATSZPJcMSg2oC1viRZnSUKhOzBZ
	jHtw==
X-Gm-Message-State: ABUngvfWeQNd1wpbHwJd6XnsxoakTN+n9ggQ57QGQKnSvzAMZZKWGQn5y/iJtusVbWF3Cw==
X-Received: by 10.25.212.85 with SMTP id l82mr7891056lfg.87.1477333159985;
	Mon, 24 Oct 2016 11:19:19 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-8.pppoe.spdop.ru. [109.252.52.8])
	by smtp.googlemail.com with ESMTPSA id
	i82sm3259179lfe.2.2016.10.24.11.19.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Oct 2016 11:19:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1475421224.git.digetx@gmail.com>
	<CAFEAcA_d_25jOmWYn1SPm9-_-+f6fsPUv+QzoKXEwTUojChrmA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4e8b4c72-474f-baca-d705-37f32940a092@gmail.com>
Date: Mon, 24 Oct 2016 21:19:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_d_25jOmWYn1SPm9-_-+f6fsPUv+QzoKXEwTUojChrmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH v17 00/14] PTimer fixes/features and ARM
 MPTimer conversion
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FL6ofGoQWxZ0

On 24.10.2016 15:23, Peter Maydell wrote:
> On 2 October 2016 at 16:53, Dmitry Osipenko <digetx@gmail.com> wrote:
>> Hello,
>>
>> Currently, QEMU ARM MPTimer device model provides only a certain subset of
>> the emulation behavior. This patch series is supposed to add missing parts by
>> converting the MPTimer to use generic ptimer helper. It fixes some important
>> ptimer bugs and provides new features that are required for the ARM MPTimer.
>>
>> WARNING! I based V17 on top of the Paolo's patch [0], however I don't see
>> the original mail of that patch on the ML nor in patches/patchew.
>>
>> [0] https://lists.nongnu.org/archive/html/qemu-devel/2016-09/msg06734.html
> 
> Looking at the code we end up with in ptimer, we seem to do an
> awful lot of adding and subtracting 1 everywhere. That makes me
> wonder if we're missing a simplification which would collapse
> all of those out (it seems unlikely that hardware would really
> ever want some of the policy flags but not all of them, since
> I think they boil down to "timer==0 is a real one-timer-cycle
> lump of time").
> 

The "timer==0 is a real one-timer-cycle lump of time" is handled by the
"wraparound after one period" policy. "no counter round down" policy, probably,
could be used by default, but we wanted to keep the old ptimer behaviour
untouched. The rest of the policies handle running with/setting counter to 0
cases, I'm not sure that all timers share same behaviour for those cases. There
is always a room for improvement :)

> That said, I think the behaviour is right and this patchseries has
> been around way too long already, so I've applied it to target-arm.next.
> If we can think of a simplification we can always apply it later
> as a refactoring with a fair degree of confidence given the tests...
> 

Yay! That took a while. Now we can move to the next ptimer issue, like
period/freq change glitch :)

-- 
Dmitry
