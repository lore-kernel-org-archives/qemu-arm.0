Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp501256dyb;
        Tue, 24 Jun 2025 16:14:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVggdXzqhUKDMmbPzmHs2ml5FWmtV5QfBVix6M6pdwfjTLeUU0GANDgvRhf2GZmTP5DIRWIBFhmOvyu2A==@linaro.org
X-Google-Smtp-Source: AGHT+IGmjKU8JFSpMccmaKrMdFUjNUOoeC2gk7M/3x1XD3D1Nhi5vkmT9B5sNkhy/SUmHKF9jlXf
X-Received: by 2002:a05:620a:2a0c:b0:7d0:97d6:e94b with SMTP id af79cd13be357-7d4297154camr132421285a.31.1750806885868;
        Tue, 24 Jun 2025 16:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750806885; cv=none;
        d=google.com; s=arc-20240605;
        b=FbdZMpM062gMzotqiW95Z6plDZM56YbwD+GNKxGhEj7erKdTzYiDq0DLx8FCYCCR+s
         5Jmm29SMKjrl0G2/qaBH/uFZHtBupzO0BrX2vrgfz3yLGGptOkNgA1VItrE/qjj23wik
         N/DttRHZtqT9qFqh3uHoB/EyX9lewehgsmJtU2GIVMKpDJJcpl8PwjJvgAsmpHrZODLj
         bziweX7oIyj3wmUW0GH071V82pkcRQjC33BwiWKLYwD5rKDIfaOH897PZyWWG90UYP11
         2Z6/rlC04AYz31UYW0QjJMyeDIwF05OHr73g+7slRbCOx9qBvmQSc8o0AoNtHSdTAAxq
         mDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=TZirEK5Lf+fDKpcU6BgJPmCkKx5LZZpaipXUQnEXOqA=;
        fh=AcpVpoaBghxHYfXAPCr4Ly983sSysk+j8Uq4/k/WurU=;
        b=BHKMYmM1EuH6AblvNfCs6/xufiDqga9YcMWMXIsr39nUJ/9EUdFOMxl77PBFsdQR7S
         k5vUAkzPPDl3yD169PWJ1eLFSbXLjLX7vdZw6v+VcbPG8MeLVHIGleN7t9P4fBwI9QrS
         vvqb4pdIR5FBMDm8xIzBjvg8oT+F+FpLGXQI0fCprSUPyqlNQe3Jx9p+XeGNfZOjOjKI
         0Yd7jlo1E6sqbpLDSjt736oxALl37E9ruFaReTcMIuhF7O6oZrZE85H5FkCBhr6Z6udf
         wiSu9Km1ajzwygJrqOW+vNEf4u37R8veQgtc8Ws+cT4oneJJuz/t4xIeiOYjZQPPSe9V
         vTyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=HSt7LGDN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0e477asi113907671cf.572.2025.06.24.16.14.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jun 2025 16:14:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=HSt7LGDN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uUCqN-0002qG-0z; Tue, 24 Jun 2025 19:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1uUCqD-0002pS-8k; Tue, 24 Jun 2025 19:14:13 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1uUCqA-00038I-TL; Tue, 24 Jun 2025 19:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1750806839;
 bh=TZirEK5Lf+fDKpcU6BgJPmCkKx5LZZpaipXUQnEXOqA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=HSt7LGDNXklGvwpXmUblXoU+PZ5LEP0Wbe2SErlgoNvX4ODjJnrktMbuX5w6EygvG
 T837orcTvpJnF/q+Y3fxzpRnSI3GcNedG/FpsoegJrdVZTvOqsV6nC8sJkTXC6qnWS
 O9lSu1iBG6Xkjh/xr0za+WYIHVqmQDcB8pnBSSFxn2MzZi6B5pkbSHNyaILqmho9wi
 sH2cL3KQ3qN6Xy8/QJ4+O28CjNBMNv9mhZInMxxoUk0RvsOel7Zl7MPD/Hwm4DTArX
 5KQnduP1IzxMzwZoewirUcT7Gl+ydCF0mRToLGb6FMgMJORVH2S1+Xrnbo22HhtMeN
 /NNhWup0iNjJQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 40423640CD;
 Wed, 25 Jun 2025 07:13:56 +0800 (AWST)
Message-ID: <2e5e17451b9e59cb8108fb6c2a88f40ba69be4ee.camel@codeconstruct.com.au>
Subject: Re: aspeed: Split the machine definition into individual source files
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 "'qemu-arm@nongnu.org'" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
Cc: Joel Stanley <joel@jms.id.au>, 'Jamin Lin' <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Peter
 Maydell <peter.maydell@linaro.org>, Patrick Williams <patrick@stwcx.xyz>
Date: Wed, 25 Jun 2025 08:43:56 +0930
In-Reply-To: <e2df1ff1-3ce4-4233-b32e-2bc680725c71@kaod.org>
References: <e2df1ff1-3ce4-4233-b32e-2bc680725c71@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gvSe5JzcWk+B

On Thu, 2025-06-19 at 11:23 +0200, C=C3=A9dric Le Goater wrote:
> Hi,
>=20
> This is a follow up of a private discussion with Patrick.
>=20
> Aspeed modeling started nearly 10y ago with the palmetto-bmc machine.
> We now have 5 SoCs and 25 machines which are mostly defined in
> in a single aspeed.c file. Multi SoC machines, fby35 and ast2700fc,
> are defined in fby35.c and aspeed_ast27x0-fc.c respectively.
>=20
> Since we started separating the SoCs :
>=20
> =C2=A0=C2=A0 hw/arm/aspeed_ast10x0.c
> =C2=A0=C2=A0 hw/arm/aspeed_ast2400.c
> =C2=A0=C2=A0 hw/arm/aspeed_ast2600.c
> =C2=A0=C2=A0 hw/arm/aspeed_ast27x0.c
> =C2=A0=C2=A0 hw/arm/aspeed_ast27x0-ssp.c
> =C2=A0=C2=A0 hw/arm/aspeed_ast27x0-tsp.c
>=20
> We could do the same for the machines keeping an 'aspeed_ast<rev>'
> prefix (and maybe avoid the 'bmc' suffix). I think this would ease
> introduction of new machines. We would be able to get rid of
> aspeed_eeprom.[ch] and move machine custom data in the machine source
> file. Which seems cleaner.
>=20
> Timing is about right for code reshuffling, still 3w before soft
> freeze, no important changes inflight, but if we start doing this
> conversion, we should do it for all. See the list below for the
> brave.

My involvement has dropped off quite a bit, but for what it's worth,
this seems sensible to me :)

Andrew
