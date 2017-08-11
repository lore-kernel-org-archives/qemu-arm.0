Received: by 10.25.221.202 with SMTP id w71csp1373622lfi;
        Fri, 11 Aug 2017 13:54:02 -0700 (PDT)
X-Received: by 10.200.47.146 with SMTP id l18mr22179791qta.176.1502484842462;
        Fri, 11 Aug 2017 13:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502484842; cv=none;
        d=google.com; s=arc-20160816;
        b=naCHd8D2Ve2EJGioYSgsL/Ouw2A/21hvaxriZ9VoK8KXfNEgVVOAPB2P6SHWELUpco
         0AriDMVengg5G6iSyh0PEcVO5wLxCV8O/GskrlHDqc95IUmTzVwtbBkAvsIufyJSvFku
         ra8lwcVdBIiJiXrRqvm+PxCVLf4dH6MqCiuJq9CsONaZgBVlAhcGvKWtltmtP9XEwfBp
         lsxL8WkRNOrHc+EAgkW2MD6hQiMy2TMxwiEoi8YEICeleWZihF4pAsqcwGABl2zEYm/m
         aHUdIavTrXKEFv1U48udHib1Zlzl0KzK8NeAHfW0i3Y8PtveaBVzZ9dZs3zQyJYmDzhX
         hGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=SDWepybD+uv6sbk2bkGZVlYHgM15ZpLTU3C9YpEvduM=;
        b=wm6RPei8AGQwuVTnNoYkYa2HQIdm6jJ9/OnOLUTIr0g2lLy6nBslBNIqkdy/Pm/5EU
         0xkTe+x/xaER1c0JGgpo3WY/AtLkkdpLL9+kN13Mf9w/TiIkUjjpxpD4Uj/elYmurvDn
         9wWq6aL0cO3tRmIldpIXbVdnyvewoSvkAvZP4f289T+ymmwrVjNyqb7EA6Yp0y5Fqw13
         Kv4kQyEM1fmjX0/Xh2l7ekeMqNjzyzsXDDOWlj7DdbVNrNoalsI090I5YPHS3k5LXAJJ
         doUWIDK0YSHltW0kXKJaeIcf9+TpokMnlPX4uwSIA2R9EUwr+bpkTcz6Z2UvmIPL5QrZ
         vztA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cXj93lts;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5si1472360qkb.152.2017.08.11.13.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 13:54:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cXj93lts;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgGwR-0001G0-M2
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 16:53:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgGwO-0001FR-BB
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:53:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dgGwN-0005rx-8W
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 16:53:56 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:36648)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dgGwN-0005rh-1s; Fri, 11 Aug 2017 16:53:55 -0400
Received: by mail-wr0-x244.google.com with SMTP id y67so3237328wrb.3;
	Fri, 11 Aug 2017 13:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=SDWepybD+uv6sbk2bkGZVlYHgM15ZpLTU3C9YpEvduM=;
	b=cXj93ltse74kKhv42Kf6SKTO1plCMYVx4puSmYLb7thWOZp0ey5Abwmyi9/r0BwxfN
	26/OVZ4I0OtM0+aggUMd/XpYryvcOiw1k0af3/JnEavnxRqQPJGcQBomHsFU5Hj3GCrz
	yNJLK10qrTY6DWHGwbMp/CP8TKzR+M9Ehpv8uQmHmA1D2TR2By0buIKUzGbCuorjHJ67
	UB1QrjNZmKdydyBom1ekK9VhYQDaXBD7+kE15adBhO3xoj6Ct8GY9f4dn6zJWrjp7CDg
	KFE6iO1DygZc4VAhobMUewKUW075iCxPdOHgeVdKatl8MYy4ZnAbE/1HFEP55H9sNpV8
	0oKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=SDWepybD+uv6sbk2bkGZVlYHgM15ZpLTU3C9YpEvduM=;
	b=UxrDdAsypcm0aGBfaI8tE9UC6dEXknnTsWvozimjTiHk/I2AlYjO9vcpUk6GFqD4yc
	GdRZLmBTPxjILNIFF1emseWWZeduHrmeWLwBGZx7ZP1+aSR4TRp3lmc0/RrkLm2aiB5y
	6Yn9DSwNvKXAIFZBZRxgl6sIQS8nfnyqjJFWfQxmqYKLVATN38bY0OCvKWjAPzkfCVyy
	piCp+23D7DtKwvKtwluf4Q6RU6xeEbXKMNJ3HaT89aYveNBvU0/TqiKDInaL0htR94Sz
	R9530z53SaFNpbVIkGDjSgUlAYKpdsNX52WvLS85b5JWm8d+Sl21TVzyWKbCPGtpnOts
	1efQ==
X-Gm-Message-State: AHYfb5gbbsp+qkIyotRNLLqO4K7yenq87hlL34AFrijU3T8ywXItatVo
	yob7nFg0Q4HRotE/MG6NybkBI1v88Q==
X-Received: by 10.223.163.135 with SMTP id l7mr13752109wrb.89.1502484833861;
	Fri, 11 Aug 2017 13:53:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Fri, 11 Aug 2017 13:53:23 -0700 (PDT)
In-Reply-To: <CAKmqyKM1p2-9roBs1Lh-7UUvQ+JGW4LWTPbLJ=VWzae2Q2s4uw@mail.gmail.com>
References: <cover.1502474835.git.alistair.francis@xilinx.com>
	<2fbcf76e4ff63d8527edd3662342948276e2cd37.1502474835.git.alistair.francis@xilinx.com>
	<de3609ba-241a-6df8-b5c3-30eb4535735e@linaro.org>
	<CAKmqyKPLJpv79Dv77t8m2q-pFOBg3u4hDmcz5Wk2t+tt+bT8UA@mail.gmail.com>
	<fb2b501e-21b0-f711-19f5-a3087b6007f3@linaro.org>
	<CAKmqyKOCAS1=WPFwBUXwTve1T_VZsQKJdT=15CPRoHSs-eEhDw@mail.gmail.com>
	<abdfeb96-6c04-66cb-44fe-a964beb901c3@linaro.org>
	<CAKmqyKM1p2-9roBs1Lh-7UUvQ+JGW4LWTPbLJ=VWzae2Q2s4uw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 11 Aug 2017 13:53:23 -0700
X-Google-Sender-Auth: dVT5z-d3DE4tvRj9sg6xL-tWTA0
Message-ID: <CAKmqyKNoXxHLzemFXqjTYz9CK_TGPHyH=HexWWQbFHT8vpf5CQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v1 3/3] target/arm: Correct
 exclusive store return value
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uk71o82ddyAP

On Fri, Aug 11, 2017 at 1:39 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Fri, Aug 11, 2017 at 1:38 PM, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 08/11/2017 01:29 PM, Alistair Francis wrote:
>>> On Fri, Aug 11, 2017 at 1:24 PM, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>> On 08/11/2017 01:13 PM, Alistair Francis wrote:
>>>>>>> +            tcg_gen_ext_i64(val, val, memop);
>>>>>>
>>>>>> What is this addition intended to accomplish?  Because of the position within
>>>>>> the code, you know that memop contains MO_64, so that this is a no-op.
>>>>>
>>>>> This is when size == 2 so it's a 32bit operation so memop contains MO_32.
>>>>
>>>> It's a paired 32-bit operation, so we're operating on a 64-bit quantity.  So
>>>> extending from 32-bits would be actively wrong.
>>>
>>> From what I can see though, the 32bit memop is carried into the
>>> tcg_gen_atomic_cmpxchg_i64() call so the value returned to tmp is
>>> masked by the 32bit operation.
>>>
>>> Is passing down MO_32 into tcg_gen_atomic_cmpxchg_i64() wrong then as
>>> it ends up as a 64-bit operation?
>>
>> If we're passing MO_32 down to cmpxchg_i64 for this case, you have indeed found
>> a bug.  I'll investigate this further on Monday.
>
> Maybe that is why I'm seeing these failures. I'll have a look as well
> to see if this fixes my problems.

That's it. That wrong mask was causing all my breakages.

I'll send out a new series, thanks for your help.

Thanks,
Alistair

>
> Thanks,
> Alistair
>
>>
>>
>> r~
>>
