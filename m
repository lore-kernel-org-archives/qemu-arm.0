Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6848015lff;
        Wed, 15 Jan 2020 04:30:19 -0800 (PST)
X-Received: by 2002:a05:600c:24d1:: with SMTP id 17mr32600708wmu.136.1579091419902;
        Wed, 15 Jan 2020 04:30:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579091419; cv=none;
        d=google.com; s=arc-20160816;
        b=UnYJIJ6F+jC1uiTROy0YXc2+N973e85SQ87jiXkx+unF2ihxDGuloRr7teEEowZUzC
         tTyQptPh86MaxDhjgfeMN3GcnD9/UmoiylwSHgtf0kICKH0f7TkLs3/2S7noNPP22XuL
         Eac6a7aBASFkntnLpkjNIf35EE6CDFZmaU8L7qopTKtib+GHdcf51tDpKAABj9LGqwX0
         HDC3FQnjivUsukGGdyCuZeJZxcBJCof0av2RAuBLb+ilRUUqvwCz8mq1jPjvba/annto
         ZB/+KGAq3OGNYyWtoBoZ0MnFsVK4f0x0N7zVoviCwTgaxs36szQm3bHx4ie3mpFLVMvB
         by+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=eYNFa5Bhv7qJOtgJ+6RxiiiCas0UwA2leU9uE/w4vwY=;
        b=yVdCnsBQa4yNMdAW+MrEDy7J4dfWGWc+Yd5bawS+VjV5GMQLWRglUb6korLWdW2WPf
         lIhkHbg0T1QhPH5+lrwS0Z3yQqln5zMjaOCsJFUac4+HPy8JFcir1XHCYpIBFvO4x063
         q+dTnfssJjUubvlOkxXf/8xPkGT9ZkDfiWQhnAIDQafhqvuquqhGhq1Cf9w2pTrbT9Sv
         /ckNTSgnKAXKOq91BW98ywWBfNaOufFc9A46M2WX6GuKhr6BWcvwgn62d9gEYiTQFkCB
         REFyyH7e4i5Nq4VjLHpSKBjDBZZQQa0Q1kUiQ27fD0Rr5YOJkk/XkFnnm+6lNFEWLheO
         GuFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=C2AccYPI;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
Return-Path: <ilg@livius.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 8sor9954551wmn.23.2020.01.15.04.30.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 04:30:19 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=C2AccYPI;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=livius-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=eYNFa5Bhv7qJOtgJ+6RxiiiCas0UwA2leU9uE/w4vwY=;
        b=C2AccYPIm40rpRFDdroGPZrPtVU4PQexww4orANUnz5q/JQID5fw3+tYMEU3PRgCLd
         z2vXghvvfzivNppbf1ngfFykCTukXgoxnycAlmkMrfhqSsCiCl4Ngi298P7v68rfWK+P
         bTrHG5r8/8WydBMLFFDkpMIFru/tXhPQTNQU/V0yVDMofoKz00AwVqulEonIN0uxWI9X
         wa7dxgVy1BicqKaJ+6iOiGBUG0zsvBDM7N2hHp9q7rVSi+9FnUeTDSTNJcosCDXD/qp+
         9epfWSdgkMh8XXm1RTqEznKst5Ed42kpEAvhhzmJYUxC9wVrNFmW8UdEdSijxQQfVTcZ
         oKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=eYNFa5Bhv7qJOtgJ+6RxiiiCas0UwA2leU9uE/w4vwY=;
        b=Wh3MBO1UVu+5ZudwvB2izrENS9uC2nJR7Pd/SuhzDioBURHeaa4siNkn/Bz3YEjK0l
         fO4lDu5CWGwtBAo1Xhq/Oj8nHvwoTKVFUGN63FWSrIyoIBRa0MrmE6jgGi/TwAyzE8FI
         ICrj/Bi4kmSmxhFofowj4v0KJvF0cGaWla3TDkmjzjDPOSS+q6hHTDqIdcMYlnvs3aiF
         /dDSQ/ZH7H1b2B980RoUzF+86CTC8OOE8MGeD8hlWmv4TPSvcTsuKmbIQpaFDY8HdW4a
         ZTswjfHW93+yZez1P7ufPBo8pvHvEd5cSTKiLEoEtsuzn83/keccKD//75HhRDHPci2R
         aFaQ==
X-Gm-Message-State: APjAAAVGZMyqHsJUnLFlF1t6XDQgInmaRftVyi0gdxoqOV3TYpyaMeEW
	odErcM+pLfKqeY3brlx6IKi+ybqpu7CdKA==
X-Google-Smtp-Source: APXvYqxStILxOScGAQfctRoXwkjDQsxIAAkEZeLzqQQHTXPk56pPD8OsENdEVjQX4DO8x0kkoypHLQ==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr31185594wmj.156.1579091419272;
        Wed, 15 Jan 2020 04:30:19 -0800 (PST)
Return-Path: <ilg@livius.net>
Received: from wks.local ([188.26.232.206])
        by smtp.gmail.com with ESMTPSA id i16sm24405210wmb.36.2020.01.15.04.30.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 04:30:18 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: Semihosting, arm, riscv, ppc and common code
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <87wo9tkjxz.fsf@linaro.org>
Date: Wed, 15 Jan 2020 14:30:17 +0200
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 keithp@keithp.com,
 qemu-arm@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <58DE85E5-2A72-4073-AF02-6B944AB05889@livius.net>
References: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
 <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
 <cd9a2de94700a2781f176247131dceba690d8f31.camel@kernel.crashing.org>
 <87sgkimkma.fsf@linaro.org>
 <1309ca0ab6405d88cfd949c73130ad0f2af944a6.camel@kernel.crashing.org>
 <87wo9tkjxz.fsf@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-TUID: RQ7hiHPCAcAR



> On 15 Jan 2020, at 14:01, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>=20
> ... AFAIK the main users of arm linux user
> are compiler test cases for M-profile CPUs.=20

I confirm, generally unit tests.

But not necessarily, I used QEMU as the main development platform for =
the Cortex-M port of =C2=B5OS++, a C/C++ framework/RTOS, and it was very =
convenient.

> ... Is semihosting even
> going to be a thing on real RiscV/Power silicon?

Even for Arm it is a thing of debuggers and development environments, =
not of silicon itself, since it requires no special hardware support, a =
BRK instruction is enough.

=46rom a software point of view it would be beneficial to use the same =
semihosting protocol on other non-Arm architectures too, even if it is =
far from perfect.

I pushed hard for adopting the Arm semihosting for RISC-V, and even =
contributed the semihosting code for OpenOCD RISC-V, but officially the =
only mention of semihosting in the RISC-V specs is in the notes =
sections, where it is mentioned how to use the BRK instruction to invoke =
semihosting calls (RISC-V has a single BREAK instructions, and to make =
it unique it must be surrounded by some hint NOPs).


Regards,

Liviu
