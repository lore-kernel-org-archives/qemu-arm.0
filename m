Received: by 2002:a05:7022:6a3:b0:92:a90b:6588 with SMTP id y35csp3856367dly;
        Wed, 29 Jan 2025 05:05:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZmAQrG0c1pmxZul5cVOzjkOschBdXpMMlRuWfaztd8f0ZqLijMmrlSoxEWusjvZsrbQfmG8+R4GI6vw==@linaro.org
X-Google-Smtp-Source: AGHT+IE8OVV2VWoQECNXEF1+n9OvOAsxGiHw9ap1hDoo1z0SJXrnOteg90AyjlQzMxQuvF01dCpE
X-Received: by 2002:a05:6102:330b:b0:4b6:d600:a35f with SMTP id ada2fe7eead31-4b9a4eb3fe8mr1932243137.4.1738155908717;
        Wed, 29 Jan 2025 05:05:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738155908; cv=none;
        d=google.com; s=arc-20240605;
        b=iakhN5AzRdFQk3tCftyDKK0qdIQEfUtGF7J0wKNDv3sW8fnd37Cuxp5Goxow1piDvo
         QYOdBtwlrEm5VKoj+US2y3eobMIXCOov2/reIOn0jm+yxoeAQvBRbxtGNdp8FBUo2d6e
         IJrPvF4BX2J7WvynIZIKxVsP2CzUDU3WpaaT95Alo4p8v5KqB2lH7fZ5qYkXQpdcnV8D
         0AWToqeVCF8OmXd/PrK5IKndKKWHYTnxT1t69xgv9X8iCp7QEY933x7si6e335WTx7hk
         1ai5x4xyC5gvzKXAZLUVHPrBDE864M/LSoohrb38QjBRwYqWYTCqKYKvZbJ/CUopfxJW
         Dkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=ZDj97v/S/rADZESl8M5UmWU1RD0CeOwnPIG+q/rHhjI=;
        fh=/s7o/hpZPHbptEnwgLO3xo9Qk1dVP3DLCo6j1H4fTzA=;
        b=Nm7UOfDljgTSJ8TJxFpr7KkVZP6Z2prQNCS9IcLvOkJAe7b+0Pqgs/EjuO17a/EyAz
         RA1ZoqTj0540cBJ08r5uTtcetvQBndHsnpCjAvgTqCakPIBSzucEfjjgWPgvlvDHNaK+
         7LN5bJhDunRfFB31NwwQImje/zRZOI1xDvzG02XakI0gMgrRAfSe9npsbSIvZdGtLBbN
         vLyjM0IgLk+3Uc1Bsx/RWnTMg9LO68Emms4yuCY7Q8PLc0iM+8tKm7b5a33kTdtSRFed
         7Fg2pC166QfszVlRNKB6y3a7Cxjc+sowzKTCRqosXf8RfmVLJAUmXYMXcFVaYUd+MGo7
         TS3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=MwQ1+aJV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709796585si3585989137.191.2025.01.29.05.05.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 05:05:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=MwQ1+aJV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1td7kV-0005BH-1J; Wed, 29 Jan 2025 08:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1td7kP-0005Aw-Fi; Wed, 29 Jan 2025 08:04:49 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1td7kM-0001As-RR; Wed, 29 Jan 2025 08:04:49 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5db6890b64eso13604752a12.3; 
 Wed, 29 Jan 2025 05:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738155885; x=1738760685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDj97v/S/rADZESl8M5UmWU1RD0CeOwnPIG+q/rHhjI=;
 b=MwQ1+aJViH0KYz1tigtG2HgSwmXYrU5yWTwqQkNKhPUvu3Vpp34W6xB2UMVir7MdfI
 kgLj0T0ViPd/lMi28xyahcdkgbELOxXA1lL8Ap9fbsXhcglow1C/tD0Fadtc9+svNiU4
 YJtBjzTuxWMYYRa8KiFJJiT2lN6q0/rgFRSFdKcCaqTt9N+3KMbG/s06DsvRgOqX5hLM
 /2XkpG5ddgw6yizINpR+vUYUgLMlskQIbyB9M925qVMbvg4DJoL0jYn62HwZGSstKTtF
 TaE3kBWu0nW+FaCcKnvwA9t4Rvh8itjxKgs9l+fgr7Uvva/V+uqgGqE5XLkr4e1+GYn6
 JjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738155885; x=1738760685;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZDj97v/S/rADZESl8M5UmWU1RD0CeOwnPIG+q/rHhjI=;
 b=lxYbn79nmLCKZWP90r4pkE8pd7glMrxJYZ/geOCmLN33OUV/Tt1Bj4I1uhcNibo4gr
 V/HLC42SQLtFs2fUrdDN/zuyApeqVbGTOgQmIwvsdvO0T13ahGQx/TX7UHfcFgsY3/PA
 M8hf6qsxBv8FmM/KMc4UvN37MirFsKVsX/HtvHzqd5hNRugEIJX5eUaQwkHznhfdzx8o
 zIZI2xCHotRChrRaKxWbZE6yAOZsAtf58WZlfjlk3Ly4JO1INz/GWxTC/wuXEZVSdZJU
 m1kWUgEa5pv/xfdX+Mh7S4NV2+sJI+kPYkq3YrKI7yoZUQf3rl5Q2FrUhZyDpoSWHWK2
 gxdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGlV4FA0fvCy/QNyI7T7K3nEx7xwdtuft2K+arnjHW1sdcYh8u0TucZIgf/lgtXe5Im0uasi2xZA==@nongnu.org
X-Gm-Message-State: AOJu0Ywne7YW9JMjugpgAlTQfrbYX7L2yWNky1z15vVWbhLsNgmV8ZeQ
 458dDgt4rLcKmBHm0EM8MxuaIpdhK8l3G5/80HggsvyZv38R7O/I
X-Gm-Gg: ASbGncsLoYVpDOz1zeA9IsrXu/kpTAowHNhcFyr6Q5YLm+Qrd7BgdjE8+L0QHn+UQEd
 YXtehkLe8vDrpg+u0zQjJdGzMX924eaUvF47PB8oOfViai+1lUgg4Ek2IfKdyCzA1xdcj7irfoe
 dZbI7tstvkMIKdIHZ+H4bbpnpECMyVWIWB5by+RdIoDx/eqkIc0jxiYXadG29Sn5njY7w3gruQx
 aojqrF8RAvGR63jzDwraB1Xa5MUxbX/skZPmkk+rpC0UrazdJ7oQd8PqKgEvzE3DHLIrV2PIgb5
 q66vi1hMdkkpMPturarHMjdrWNnCrun2GCcFatQuHAydmy33q/99zB6VMs7r5w==
X-Received: by 2002:a05:6402:2688:b0:5d3:ce7f:abe4 with SMTP id
 4fb4d7f45d1cf-5dc5efec128mr2770148a12.25.1738155884668; 
 Wed, 29 Jan 2025 05:04:44 -0800 (PST)
Received: from [127.0.0.1] (business-90-187-110-129.pool2.vodafone-ip.de.
 [90.187.110.129]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186d8b2csm8708169a12.76.2025.01.29.05.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 05:04:44 -0800 (PST)
Date: Wed, 29 Jan 2025 13:04:43 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH 05/21] hw/arm: Add i.MX 8M Plus EVK board
In-Reply-To: <CAFEAcA8E4Ao_bJTxKzJ_kQ1n+Teqw6brmJKFN9cFpraM6jTYag@mail.gmail.com>
References: <20250120203748.4687-1-shentey@gmail.com>
 <20250120203748.4687-6-shentey@gmail.com>
 <CAFEAcA_NBPqbOrVJw=bDC6=dTGKBKe42XoXMm82jj7+pHEvW3Q@mail.gmail.com>
 <4EC5E99E-804A-4154-8D61-22D1358C0F6B@gmail.com>
 <CAFEAcA8E4Ao_bJTxKzJ_kQ1n+Teqw6brmJKFN9cFpraM6jTYag@mail.gmail.com>
Message-ID: <DF02FBEB-2BC4-4F99-8DF0-5B0BB0FAA51C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HM2/wNH9Dx01



Am 29=2E Januar 2025 12:17:33 UTC schrieb Peter Maydell <peter=2Emaydell@l=
inaro=2Eorg>:
>On Tue, 28 Jan 2025 at 22:16, Bernhard Beschow <shentey@gmail=2Ecom> wrot=
e:
>>
>>
>>
>> Am 28=2E Januar 2025 14:29:53 UTC schrieb Peter Maydell <peter=2Emaydel=
l@linaro=2Eorg>:
>> >On Mon, 20 Jan 2025 at 20:38, Bernhard Beschow <shentey@gmail=2Ecom> w=
rote:
>> >>
>> >> diff --git a/MAINTAINERS b/MAINTAINERS
>> >> index 846b81e3ec=2E=2Ecace8cf25b 100644
>> >> --- a/MAINTAINERS
>> >> +++ b/MAINTAINERS
>> >> @@ -819,6 +819,15 @@ F: hw/pci-host/designware=2Ec
>> >>  F: include/hw/pci-host/designware=2Eh
>> >>  F: docs/system/arm/mcimx7d-sabre=2Erst
>> >>
>> >> +MCIMX8MP-EVK / i=2EMX8MP
>> >> +M: Bernhard Beschow <shentey@gmail=2Ecom>
>> >> +L: qemu-arm@nongnu=2Eorg
>> >> +S: Odd Fixes
>> >
>> >I'd rather we didn't take on a new board model that
>> >starts out in the "odd fixes" state=2E If you don't
>> >have enough time to look after it, it seems unlikely
>> >that anybody else is going to want to take it over=2E
>>
>> I'd look after it, but I'd also not raise expectations
>> regarding commercial grade support=2E What state would you
>> suggest?
>
>That's
>      Maintained:  Someone actually looks after it=2E
>(There's another step above that which is
>      Supported:   Someone is actually paid to look after this=2E)

Alright, that's what I meant=2E Will fix=2E

Best regards,
Bernhard

>
>thanks
>-- PMM
