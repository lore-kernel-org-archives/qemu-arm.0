Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6218777lff;
        Tue, 17 Dec 2019 08:11:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqyhw343xB/bEmSSpGYNEx1mBmseVUS458nuKbU2YvuGM4fMraPvZda/lXg1KQjSAB4cYsqd
X-Received: by 2002:a05:620a:1592:: with SMTP id d18mr5837267qkk.80.1576599070439;
        Tue, 17 Dec 2019 08:11:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576599070; cv=none;
        d=google.com; s=arc-20160816;
        b=PrXzwajlRATuePFdGMooH7ffTdF44hiEzDexBoIPhQpQdXlEUVRIdREuPJDsN3CEL6
         nNIq1ZeRzA2ncSzKxYE342E/Xr2opxMchRGgn25ArwGiAe3K4lYbjXCjV2uooZD/40xI
         RrEqYaoiwFUdX6HXdbmMbL/kmhQceD+Bv2cdmCmjOc8pD2qT20HFa8fkug7uDnh7BktJ
         nNLjc/nxt0R1kakEzHu8eexuF5uJVzbTkIvgXWHOgXS8XA7kX5NkSt3BSGhHJZ4/IM8C
         FzKKLUBK6qRe5E/cfPWAh+xJWWr73rLKzO62TL2T+MGiPVKQ4GCP8iFQcpotYMHOAfl/
         gXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=2h83AL8aS2w2Rnp2P4AIH18JYDJUV85rQtELdieBzDw=;
        b=CuGNvPLO632hEa7tRTPuDTwiCGz/wTJMWrd9xl+xr5GcMyGjQXVgeW6oUGNiqclIlf
         owKuyuXlfYpvMG9g/Z6vFJrqSVCnJdFypGSYDI9CBOGYbYcu4yXQredp87g+G21OIPf4
         P7y+k2K912dteTfGqpKkGyoA5VieOdR71Me72I5sN2MWyX3pkOFR+CIbjjkZSGtN24Dj
         t82nclFCwXmCB8tvumi3+6sUk26MscGN0kcM3lXUQIJzeLvzNbB67R4Ujago9bL5prwL
         ofZqNN965tpHIIqPx9qXXRHgdtevZevYojiZz/yS2anaJVrIOrJy1bPRVaC097D/qmLx
         vqbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hhQP95y3;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id i7si4807678qkh.186.2019.12.17.08.11.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:11:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hhQP95y3;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576599070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2h83AL8aS2w2Rnp2P4AIH18JYDJUV85rQtELdieBzDw=;
	b=hhQP95y3jIc40iXaCBjpK6rPKTmK09QD6rjrpBdegO7O/fpuMQoBIwRZ74re2X1DYTWg76
	K7Tr+OX8lQCyBTi2mvLIAAmQ682jVCQFreV+Wb6FOGLXJVDVqALX4GQa2cBP6gC2ll1/Au
	y7Rt+0bf4OuvBroMPidqzX2DgjOaknQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-kMaf0c7zN2emKZwNLHHGcw-1; Tue, 17 Dec 2019 11:11:08 -0500
Received: by mail-wm1-f72.google.com with SMTP id g26so713571wmk.6
        for <alex.bennee@linaro.org>; Tue, 17 Dec 2019 08:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yn+84cH9XOOvHfsX9iXhmgM1ZPfhhA7dJdWcLpX+LnQ=;
        b=RGjLcdhej4nkcsQ237qqDysvs5wW+TfDztr19g2PWkvsQErin4LJOMreotKVxfmbwb
         odcycidbJlnFTEX9c27CdwJPVYPevWtxYlOAg8BlyITsMggxZGQxBkSqiwMQgqKDZ3yh
         xcxt3LNHWirCAfXqi+f1iNlRCYvuucZI3uxe8nSdYzd2JizvCNZtAyLVhtoD2GdGjZY+
         v1HTCLmiPc0N4y3rM3pqpyiolvaUfBKbKYRKiOylODBJUoYOQk1J/RVaDBv7PKalpO3z
         LPAn8QW7gJ2vLLns45ORuSRaXpSSZvzYQSOY4mONP/lol+QVHUVuDnToX9Qfue66ChVo
         +s2g==
X-Gm-Message-State: APjAAAXUMr0He3mxzIUmWryrserERSWcAnp4n4zX/rWEDAwFo6Gm71YM
	6bmk8yjhCO2kdtUYo2RF1Wu2h/Skp/r+Odc4XXF+a/zEs9k9d7KgAJvpgvcd1HD0SD/RS/H/Qku
	me1XPCblYX7bpdj4G
X-Received: by 2002:adf:e58d:: with SMTP id l13mr36464896wrm.135.1576599066994;
        Tue, 17 Dec 2019 08:11:06 -0800 (PST)
X-Received: by 2002:adf:e58d:: with SMTP id l13mr36464861wrm.135.1576599066777;
        Tue, 17 Dec 2019 08:11:06 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.34])
        by smtp.gmail.com with ESMTPSA id t81sm3521182wmg.6.2019.12.17.08.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:11:06 -0800 (PST)
Subject: Re: [PATCH] target/arm: Display helpful message when hflags mismatch
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20191209134552.27733-1-philmd@redhat.com>
 <CAFXwXrmi=AqO9djosRt7vEGm5XDmnBt7KhHn9AQAWbVPLp+QkA@mail.gmail.com>
 <CAFEAcA9cOr03j9H1Z7YPyFKDViG5hS2mv4ATnWWWoWoKa9fb5Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <34ff9b70-8779-e0fa-abb3-89f99df93975@redhat.com>
Date: Tue, 17 Dec 2019 17:11:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9cOr03j9H1Z7YPyFKDViG5hS2mv4ATnWWWoWoKa9fb5Q@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: kMaf0c7zN2emKZwNLHHGcw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 75e4rYaeCO+c

On 12/17/19 5:08 PM, Peter Maydell wrote:
> On Tue, 17 Dec 2019 at 16:02, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On Mon, 9 Dec 2019 at 03:46, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>>
>>> Instead of crashing in a confuse way, give some hint to the user
>>> about why we aborted. He might report the issue without having
>>> to use a debugger.
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>>   target/arm/helper.c | 18 +++++++++++++++---
>>>   1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
>=20
>=20
> Applied to target-arm.next, thanks.

Thanks, you can also add (from a different thread):
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
