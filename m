Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2706406lff;
        Tue, 15 Jun 2021 00:59:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw85uTec5Q4LDxDa64unERs8DknuN1Q5A+R/ljBSSax2mFx8YOjzD1uwJFaILtwFJqiHiQ3
X-Received: by 2002:aed:306f:: with SMTP id 102mr20488913qte.197.1623743987950;
        Tue, 15 Jun 2021 00:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623743987; cv=none;
        d=google.com; s=arc-20160816;
        b=VrsYZmXfzNKkDkVxG3tAm/vGA407DM2J29TuNhdNmChkTaZFvCmqYAcjf1o3Gr2R0A
         VhGO34Y6C4TlD6Y58WQ/2qjt39kdJSwRB/ceBJuRFFqPeANid+RUKhKss+ugYN7QP6rS
         SnYR880TmDn7IlSEpEDKBKmG6DOO+eu61/zrBjo5Y5q0asBNmGStvLycrJBHSw1ZBGrt
         uLKUw1hqW4XTbFgpM2NcQW40JkE+m88GpYviKqJuZ5qLiIq7HfSm/zblISbrlqw803od
         uYDbWl8K5B4XNea+955uWtqRaUQJ0wH0R9/SsShlf3N7Otg9ZS4o5afy6UKQ8+MQ5OjD
         9fmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to:subject
         :dkim-signature;
        bh=aPr35zq6g2HVM5+6YnqVHGM5qZkAZDO79eK9po2AvjE=;
        b=lFpeaTnTP+D1zDvJ1R7DfXx73jiWa/Z6189UU/7f2ugLxb0c8cHvmzbWT3iEKay3ij
         HIw2K+nCvSnGu1p7jVIUh5FHE1r9S1K7BNWdOkd1kFiAxvatncoGjE+WKYmJwqCxz8KP
         kJQuBScN+MsTFa1U5kMecBF0S55eAPyOpfkE4DtdxP7aVWLTRJ4l8lbc/djIs+E5pRdq
         DsYkFA8ceP1jDNwB0XkmGIWIs81OhT3lbTUxFnU4y+HF6dfC/HmR2478J+vWuIJTz7Xd
         CFV9xRmQL48RdShSihqdvci/CF3ZmeATPc3EsImtC8cBbAxE3mTqdmsskcGI0bGazuqo
         dD5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@crans.org header.s=mail header.b=RAFl1dce;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j186si4749999qkd.92.2021.06.15.00.59.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 00:59:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@crans.org header.s=mail header.b=RAFl1dce;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:59388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt3z9-0001iL-2x
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 03:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lt3wB-0004Ei-FN; Tue, 15 Jun 2021 03:56:43 -0400
Received: from redisdead.crans.org ([2a0c:700:2::ff:fe01:2402]:49664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lt3w9-0004g3-El; Tue, 15 Jun 2021 03:56:43 -0400
Received: from [IPv6:2a02:8428:4db:b001:f255:832d:4007:dcd0]
 (2a02-8428-04db-b001-f255-832d-4007-dcd0.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:f255:832d:4007:dcd0])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id C81BE231;
 Tue, 15 Jun 2021 09:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1623743798; bh=aPr35zq6g2HVM5+6YnqVHGM5qZkAZDO79eK9po2AvjE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RAFl1dce3RVTYEWgvDQSyc0ciAaQGS189rVLkz3l/5Cff/9WcBQjqBTUBDBYYSknI
 BwC6jJGJFrEH6sO8/E4n1E+cObDp/hJMhofCbjSapNnoVFsK7UJSsz2W8Wzifaa/sB
 BPvWZy1zdjrLvj1K21yzMJD+kKr61eLdxfKfa3RgmSKsRPz9RLsq0n0ZL+ZnPk0yPD
 OhpEaRzzAd8RcUsHhtHQsdC4EVOG+qkLOJBbJu5AQxIL77EdkawYu6kBY58cfv4YUW
 9/nSAe1MWjGx5toST1OG5gtzDv2qkT88OR9C6DiHO/7JMaEcIQv2QVkqfq1D4y6u2v
 eqseUaAbGVwUxLEiwNL5MP6KVZ+HtfrdkOVUF2OeLRBS+Cq8nshiLN2vmPIDXvVk3W
 S3CO/F5ySn7BTQWZedVAE4yvkpsd5sIMf/tp4nBv6Xk/ziqxf55YaFMnPpVwAwp6Nj
 SvtiRm5CQQlWsMWp7pAAKu+lzdEXjCtiNlBUaFeG6LMIsm00COv2qAvmD3DQN+PY6d
 y3YV1Vhao43V7WNA3P4DHTAygTW5/irxyhO9u1ZbI5mQnK84iuPFhe9ewyJGPOaH8n
 NQSfSO+UI5XVEqVzktQxnOaS1WH17L6pK2Oz2lkcJknSFvGUZu1M3C7ii9QDh32lSw
 eDRAuyYkYT8ls4PQH34uMnHo=
Subject: Re: [PATCH 1/2] stm32f100: Add the stm32f100 SoC
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-2-erdnaxe@crans.org>
 <CAFEAcA_YkqObpY6E8QiL-_+bLn_3xigv=djtRCdPDNvF4VT4kw@mail.gmail.com>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <3549092b-5ad0-71f1-a13d-1f84e4cc5c5c@crans.org>
Date: Tue, 15 Jun 2021 09:56:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_YkqObpY6E8QiL-_+bLn_3xigv=djtRCdPDNvF4VT4kw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rdV7YpyJxnwTCSzsxcc8xJ8Kqp16VZmZw"
Received-SPF: pass client-ip=2a0c:700:2::ff:fe01:2402;
 envelope-from=erdnaxe@crans.org; helo=redisdead.crans.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KnhbNYUD9CD+

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rdV7YpyJxnwTCSzsxcc8xJ8Kqp16VZmZw
Content-Type: multipart/mixed; boundary="3vdBxn0mTbEKsn2KuIlaX22T6254EaWaf";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>
Message-ID: <3549092b-5ad0-71f1-a13d-1f84e4cc5c5c@crans.org>
Subject: Re: [PATCH 1/2] stm32f100: Add the stm32f100 SoC
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-2-erdnaxe@crans.org>
 <CAFEAcA_YkqObpY6E8QiL-_+bLn_3xigv=djtRCdPDNvF4VT4kw@mail.gmail.com>
In-Reply-To: <CAFEAcA_YkqObpY6E8QiL-_+bLn_3xigv=djtRCdPDNvF4VT4kw@mail.gmail.com>

--3vdBxn0mTbEKsn2KuIlaX22T6254EaWaf
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/14/21 6:04 PM, Peter Maydell wrote:
> Is this definitely right? The STM32F00 datasheet I found
> thinks it only has 61 external interrupts.

Yes you are right, I don't really known what I have done here. I will=20
fix this in next patchset version.

To double-check, it is described page 131 of=20
https://www.st.com/resource/en/reference_manual/cd00246267-stm32f100xx-ad=
vanced-arm-based-32-bit-mcus-stmicroelectronics.pdf

Thanks,
-- Alexandre


--3vdBxn0mTbEKsn2KuIlaX22T6254EaWaf--

--rdV7YpyJxnwTCSzsxcc8xJ8Kqp16VZmZw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmDIXTYFAwAAAAAACgkQbHknjz/NzAI+
YhAAp6gTflbtvw89avZ4qgmrCvUeUP1u4pIMbhay9TgUlfTi9EZAE+TzVL0H7RNiOHoOYSMeMxdw
mFNc1U6T4zxRk7mfPeGusWT+e83HiNU+qBVK6Asy35q97ZSf5ts8Q0Z90vY1Nnp9z2u+y2dGpzcb
ltVQ2m2DKeAgMaeQ9izXZHPD5X/qtL1fipxQwX0ZgB+g54DLzF5jIUdlGkFdRdh752R/0ABU54+b
G+0uo2e8jMj6El6wV7VOizMnInk7UR8V5eAocb6FKycbXfuIrvgltfWs2inHQdVNdu6wEoy+wjUD
b5rUnQ2MdYMMzexbhkcoP4D2kcM2dV2Ukg4LcbskHxXCO4yAYpTidtZyarIvY4k2ZEjkyRHRRw7v
DWJG+beF9AwmE3iyie2rLgUZoHhAA5qypUxpI/Tw4In95DTN/cjhbzTsWZKgzgDKE/ph+/o0mUSZ
271lbriHPuI/ec5lHQ75HrI6n47GBm7y6brpU0dueBMFOInmM3kKy4ZgnaIXLiEg0DG0dW/84+QV
/k1MJRYNaeOa4pB3re8YRmWlulCV2rDtOhhYgvtCQSbP+X76MO+cW3KCtv3l2hFSiBXyzwX4CSar
8nw3ZuIyYOpI31jKe/RdVK+TtArTp0wyPawWAMwMjPnuJUKWKzMMvzfv5yti2gSrlhibQYBIi6yl
X1Y=
=Pjd3
-----END PGP SIGNATURE-----

--rdV7YpyJxnwTCSzsxcc8xJ8Kqp16VZmZw--
