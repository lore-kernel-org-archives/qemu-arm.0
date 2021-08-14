Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp291136lfk;
        Sat, 14 Aug 2021 03:48:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyedhzI9Hl0+ZhC9tRsd5JWpnyNGSF1IViqvBctUYSzSU0T0NNVyumax1nBZ58ZkjJbQCBr
X-Received: by 2002:a25:ba08:: with SMTP id t8mr8624350ybg.111.1628938095867;
        Sat, 14 Aug 2021 03:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628938095; cv=none;
        d=google.com; s=arc-20160816;
        b=CTy2IUwni25vcNMtRX8gke1rRzpHuU0H1jESLPJOY/Fqs1MBEIQ5bAy//w9acH+09U
         1A6nzueuR037te9/vezmg77LjlzyvrPFu00+o8cF2iGlnpeaVEpXVQwm/omJVysh3EqT
         ebCeeH66jy1dsJJw3sLAj9VQ4VIJMrX2pxA/dh+HIVW7Qy9sPkxQcyBzp5IWiKRFOn/j
         eAlqjhDOjqIV7OVDVcrb6pkYo1HkbDkOpvEop03GqBRARBcxLyUfi5PGTkbOMpje7yuZ
         JGgX1YcFwGHtfsb+eiVS77/LoL559BCvOdrhOd8buelAOXWG5M1O0684/AvvFqstcJY5
         TUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to:subject
         :dkim-signature;
        bh=q5XqJ6Dar/4rg1VhQg8Im90tu1xYpEQm1usJD5DfVus=;
        b=GBae6eB1MH7Q+Ldboyyo0ejAcfyTMNq6iES6mct+8GEkHfjW5+PUHS0+RbJg0ZemhQ
         u9Q9Cf8psdVt0Kum/g/+MTkLUlYXt/bs+E7Zc86PZDgHRXBTIpML5rvPduCgxJdlx6Er
         exmlvKk9Epv1R86V+OQhgCmYnWGTnCPmKASAEV70ISlFz1bXU/6PBU3pgybqz55UCsLU
         l2EaS11cuhnDPazuusGZkz1Jgz85BYBBWN+0R40OUy/K8KM9QNC6k4Gsfj7s4JVDtg8t
         ADEooXo+fZpTMJSi9/u8j7ZNBjZTIoYV5Y5UwbadEApUk/CLZWhj2+zMJK7coLHfgWq4
         z0VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@crans.org header.s=mail header.b=fBmnKkTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si3593926ybz.423.2021.08.14.03.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Aug 2021 03:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@crans.org header.s=mail header.b=fBmnKkTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:52050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mErD5-0006jk-43
	for alex.bennee@linaro.org; Sat, 14 Aug 2021 06:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mErCg-0006jO-IS; Sat, 14 Aug 2021 06:47:50 -0400
Received: from redisdead.crans.org ([185.230.79.39]:40148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mErCe-00029X-Fh; Sat, 14 Aug 2021 06:47:50 -0400
Received: from [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939]
 (2a02-8428-04db-b001-83b5-0a75-e190-e939.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 94FAA47C;
 Sat, 14 Aug 2021 12:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628938063; bh=TOPzrTBXNrerx1uB/PjcYt4IX7ixTm0sVzze9z5uO7M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fBmnKkTNLJj6VDcRJGeC+jyKkq+AdQldfSJrEUdtp3q950KgFh+L5vsotFEWNOrAO
 JzWQJJReId29+XYRl6FxXlAk9hsF2mWP8JOYypCHbYU8Peo+HSrNUOG2DMdfAn5GK0
 1+7Ta9DjZCgCO87IZofdYHGavoYRhJf9COQKdCHlRVEX1vQVuTHhNThBbm1p4RIZqg
 q5+aXjvRaBBpv3WLSFEu0pl5SIewJAGSUjcYQZbpoJgjHm4tmrLy01l6QfBP0jlKEn
 N2PC9sX8qyf6f6lVCvAt9vpysNad9wZkXDXX02DZWoHrRoYahc49NUByEZUiYLL19v
 aGCBkxhSlEX0IZ4s0pipW0FGRWKFxKqnVwKqL9l/PAkMD2GpFCblq5vufXkIqC51JU
 7ZeBlkJSPwZWkHVvi3R8NbBhk1IY76lt16jAQJKvahPzl6Bb3B8Z4cbtRiqoJaogu2
 J+wlHxfXoMxIFWupqaU+c0WTU8/NNET9+jr+9BT5xkEWCm0hMPNQVcIBPPhLbFjrIX
 eNHI6EILlGelI6dOZCzx889eE1fEHux7hpsdVL/FoXclsW/ZSOOJ5tUP7IqpLQMTOJ
 ECZEIuKxftmLBq7qMJTbnItBAWuB38LvoP06zNMeqUJIdKA94TPvKxL3xn6DX5CZ9t
 W08lYnTo2WyKkWNZGOjrpjQM=
Subject: Re: [PATCH for-6.2 19/25] hw/arm/msf2: Use Clock input to MSF2_SOC
 instead of m3clk property
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-20-peter.maydell@linaro.org>
 <df2e95e5-3898-7dd9-a571-34326bb799b1@crans.org>
 <CAFEAcA_fFHpxo5Oscj0a-_xOd9+WM0Ea79Zt3e1VFWAd4EwP3A@mail.gmail.com>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <a4103ac1-b302-031b-6864-0bb5b43b8fef@crans.org>
Date: Sat, 14 Aug 2021 12:47:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_fFHpxo5Oscj0a-_xOd9+WM0Ea79Zt3e1VFWAd4EwP3A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Izid1A3J4be1b40TlCxwT6PZH8khP7AZo"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HnynOIA1yqpO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Izid1A3J4be1b40TlCxwT6PZH8khP7AZo
Content-Type: multipart/mixed; boundary="CKo2FaKilFVUdPw4TIx4wg1mq4nM4KiNU";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <a4103ac1-b302-031b-6864-0bb5b43b8fef@crans.org>
Subject: Re: [PATCH for-6.2 19/25] hw/arm/msf2: Use Clock input to MSF2_SOC
 instead of m3clk property
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-20-peter.maydell@linaro.org>
 <df2e95e5-3898-7dd9-a571-34326bb799b1@crans.org>
 <CAFEAcA_fFHpxo5Oscj0a-_xOd9+WM0Ea79Zt3e1VFWAd4EwP3A@mail.gmail.com>
In-Reply-To: <CAFEAcA_fFHpxo5Oscj0a-_xOd9+WM0Ea79Zt3e1VFWAd4EwP3A@mail.gmail.com>

--CKo2FaKilFVUdPw4TIx4wg1mq4nM4KiNU
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 8/14/21 12:11 PM, Peter Maydell wrote:
> On Sat, 14 Aug 2021 at 10:20, Alexandre IOOSS <erdnaxe@crans.org> wrote=
:
>>
>>
>> On 8/12/21 11:33 AM, Peter Maydell wrote:
>>> Instead of passing the MSF2 SoC an integer property specifying the
>>> CPU clock rate, pass it a Clock instead.  This lets us wire that
>>> clock up to the armv7m object.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>=20
>>> @@ -72,7 +74,10 @@ static void emcraft_sf2_s2s010_init(MachineState *=
machine)
>>>         * in Libero. CPU clock is divided by APB0 and APB1 divisors f=
or
>>>         * peripherals. Emcraft's SoM kit comes with these settings by=
 default.
>>>         */
>>> -    qdev_prop_set_uint32(dev, "m3clk", 142 * 1000000);
>>> +    /* This clock doesn't need migration because it is fixed-frequen=
cy */
>>> +    m3clk =3D clock_new(OBJECT(machine), "m3clk");
>>> +    clock_set_hz(m3clk, 142 * 1000000);
>>
>> Maybe something could be added in the commit message to say that M3_CL=
K
>> is changed from 100MHz to 142MHz.
>=20
> I'm not sure what you mean here? This commit doesn't change the frequen=
cy:
> we previously set the m3clk property to "142 * 1000000" and now we set =
the
> clock's hz setting to the same thing.

My bad, I did not realize the board was already setting the frequency to =

142MHz.

Thanks,
-- Alexandre


--CKo2FaKilFVUdPw4TIx4wg1mq4nM4KiNU--

--Izid1A3J4be1b40TlCxwT6PZH8khP7AZo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEXn08FAwAAAAAACgkQbHknjz/NzALJ
HA//dEa8k8mtiWiQ67Zlwh2negtKdq8KrK3ejdTbEj7xyWuQrCiKhO3yzyNe0Yj/DFrvKP1OrlLx
q+ph+/gMv5lCndw0SghOyGX0kpunM4cCCmkeW21rv6DHTe3xbAw3z0XooDbbC/swnFmDPkC821LJ
5u1Lbwk6yEvGpSo5AmJViy8WPUgajSMKuAT298aLYmyMcMCR/5urjFarSOW+LG46h59RAIWkWVYx
j0ug1uYJ5ZOFPq1KliRTjTNFVUxk4OO3/Q2UeCSIj87leN7N+0te2W1Lh2TVe4yB1+gt5S9PIHmB
FxRifpNeSdqcIir+hp9Pi2hKLdhvaDqwkY2QsWjxK/yAS5c1GOuRgUZQDmTibFDq/cFByxW4u6m+
tJPRIn4l2G+/oustpczpBKZErTro6ruQOL2ENWkCCGzO7gujajIbPY5L6eWIuEUlivGHHF3kX0sy
s7SizOJtpRI8Xu+ltOfV/YNaDPzfA6PZJ559StpSMuoR7gddLVt/dUEmKWGQXFq7GzzibB9YoAGX
gznBCGDWEphIz43qFZH1LKVnNuSRR3L6DndtRRZETMdHU6aUpm0dSNXB+Y3wvZ7vEte4hVFyoYVS
XEXM3b9H6qQsc54lMzJF8pnG1kLzJnEBrXRGP9zUKCHfIcxr3V27Wk98hzhoAg3TO7DF3mIn7LJw
R7c=
=SjJF
-----END PGP SIGNATURE-----

--Izid1A3J4be1b40TlCxwT6PZH8khP7AZo--
