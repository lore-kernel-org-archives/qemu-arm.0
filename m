Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3575658wre;
        Tue, 29 May 2018 06:32:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLpFOljLp0bCSNZP43eEMgtko5B8Kna5go9TNj5GUbNxL1nk7ma5Cf766TsMpJ4RJt/KGRf
X-Received: by 2002:a37:9907:: with SMTP id b7-v6mr14459078qke.307.1527600753819;
        Tue, 29 May 2018 06:32:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527600753; cv=none;
        d=google.com; s=arc-20160816;
        b=XsHje5prHyeIwR5fjGJLmP9A0O2pDvWIyp3D++Mq09V7FjgpxrOqvC/nkPcHxoHV7c
         x6bdkeMw1JG/grIIyOj5aUijlVmLLD69i8u95tT1aC2WBpmdRR2DX6mGWBvGnUfN6WF9
         EfL+H8dNask3y1aV9kl7PcxBZHkWiqucvB5B59X/xiKZ+LZsCuK2SfFFPiUq9v8kmYmM
         HAsaYie93NqKtPbDZAnYRts8TInx8lk1BFqPyf0gpJ7n9m/Eb88VOnurAxQnx5SAB+Hd
         Qw67o67IeK+evmOWLipgfivxdXQc811yXqbpY09uWaNez12kT0xO9VsrFH6HDu1soZXo
         xXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=mxCWyIaISor7nBupIvtsSyj5yt5aV8RYfHAM4mRPsfE=;
        b=ogl1YXJMfFiNalvn8P/7c4sgltAkr41IpqDX0zitofinbb1VJh23RQVly5DrFHHNGw
         AEXrutYeLML8n0NsfcB1etXxDFn96apYVWlZ4deC1eYzIs9uavi8WH6fXERvaJqgHLh/
         7KLAWSFh4kEtpfqLH5P43BzwvWjmsedwwg4a6VNj44jytbS2N2UB238S4cmBxlBkEkyu
         b6BA1DyYkYDCCwMjS8IpQwbimKCfXlhfvNel9C5rgtWMsi7K1ZrKVWMO/MGYoBXayBT6
         +8XyKZDU7VhlCZd4lu8Ur33S55WI46nMSl0pZ2E/JuerUOCOUIowgxNz1l7b53VNaUrE
         s9Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eio6Dfe2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m82-v6si1171043qki.56.2018.05.29.06.32.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 06:32:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eio6Dfe2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNejp-0002N1-AB
	for alex.bennee@linaro.org; Tue, 29 May 2018 09:32:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNejg-0002Kx-CK
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:32:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNeje-0005qg-MD
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:32:24 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fNeje-0005pr-GJ
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:32:22 -0400
Received: by mail-oi0-x243.google.com with SMTP id 14-v6so5012857oie.3
	for <qemu-arm@nongnu.org>; Tue, 29 May 2018 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mxCWyIaISor7nBupIvtsSyj5yt5aV8RYfHAM4mRPsfE=;
	b=Eio6Dfe2KoGxlWJwQUWNeXAnLnm1cK9HwxJdC/WC35TTmb9OZDPR2zvp74A9m/+oco
	sXhO+QryEvmNwDHSf7fDKzmkyPJh6ME56goBsLDGPvrBW6UIGRR0FzgoqPZcnIV5N39v
	NlRHsf1FGdkhTYfjWFiB0pAYV6UwxidQHTAb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mxCWyIaISor7nBupIvtsSyj5yt5aV8RYfHAM4mRPsfE=;
	b=oW7VuM534lWIz+lsOswu+XoEpw3jVgRlvJVAPiC0SIhwDmo08kPRnB61M2tj53XLTk
	yH1ql9BEaxV/NA6uCZ283JWKi3W1yKI5zoOEiF3mrDXgyZBd/DdVc4mDgAODIJUdLh3R
	Ln27+fEUUrvIO+Cp3QfqAkzyW1h0vO66DVWifaHsRtqGYPtfUXdPe1gsQsJkbnYDA0H7
	ReNj6/1wz+z296qQJeOIokDQX2BDcMowHvK28dGvDtzegzRwK+6n+QQW3Dpz4V6Hfrb1
	jSufUsCB7/eT7vydcLoV7qs+ijzH5YaVw23eAlQCsq7Fru07wM9PcE+DizMMGhB0fzGg
	b/Gw==
X-Gm-Message-State: ALKqPwdYDRuqzefPwAssvc0Zx5LRfRg0mOWbSH0CqK4u7aSL2x3YdvnZ
	vL7ihwfPj6ob2wzfdXVNAgZemJf2wqAHkcqYnZ3vmw==
X-Received: by 2002:aca:b855:: with SMTP id
	i82-v6mr9949562oif.12.1527600741844; 
	Tue, 29 May 2018 06:32:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 29 May 2018 06:32:01
	-0700 (PDT)
In-Reply-To: <b3d15f99-2e67-c0d4-7741-3af67d566734@amsat.org>
References: <20180524213756.7528-1-pbonzini@redhat.com>
	<b3d15f99-2e67-c0d4-7741-3af67d566734@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 May 2018 14:32:01 +0100
Message-ID: <CAFEAcA_WW7un-gMHDv9YzTLkb5G7LBj0fUN+KFd-Ba-3MiC9mQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH] arm: fix malloc type mismatch
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ehRj3cVc7pg5

On 24 May 2018 at 22:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> Cc'ing qemu-devel for patchew and co
>
> On 05/24/2018 06:37 PM, Paolo Bonzini wrote:
>> cpregs_keys is an uint32_t* so the allocation should use uint32_t.
>> g_new is even better because it is type-safe.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>



Applied to target-arm.next, thanks.

-- PMM
