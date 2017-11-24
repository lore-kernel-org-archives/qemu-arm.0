Received: by 10.223.159.82 with SMTP id f18csp1869660wrg;
        Fri, 24 Nov 2017 02:11:59 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbNswY73Wk+FS22QsTIcUlAeAZ7DjplNoTxzDxki3y0kYK4DikK+FYCuA/X/Z56BsZjzxQ8
X-Received: by 10.37.188.81 with SMTP id d17mr16968520ybk.419.1511518319283;
        Fri, 24 Nov 2017 02:11:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511518319; cv=none;
        d=google.com; s=arc-20160816;
        b=u8J2bqh65Ug61/4g7qJxZnBJ33/RkoiqlfWTLmEVMLrwpjMojT2scmTqWgeJpaVf/U
         U/DXd6UOkRAu21AY4tfJSBlNE61T81IWGC9ko/BGC7coLJ3VXr4+ZzEmed06x9EzYQ+N
         A9zASbP6DhWvCp7bH6UfH7kJiph7SNdvoSs3du8myAv3Vt1E5/6y00/qw7hTGZGj7XjX
         A/LTvpEd5fxxf188YPZvOiReza2LBx0zbxnqN1irzXn9ewjVoZDpZaginjIBEsiwJfYH
         yFUqvhPbtQM33Ovn1/TqKFL2QnJTM61aBhVD7mBFOha6oi0uxklOc9VfUmJBEvG8Lc/s
         fGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=aUDVxr9y6ETLEhP+QcpnBFg0XuxXJSOg6jJkc6LWUlE=;
        b=QFMBoHUzdxmAszJIU1q3A0mLGnTCDpVbpuzrvBkTZrxDmiLE7u4crbrZoFXqS3bA+g
         //TAgeO+nNnrISzuUNEAS2nOwzuvFVk90k0Bb51LeyuHeIv/0tzDRR4++uSmkdVgcL66
         9shuOcehSuCf6QHvMyT3uYTO1vf7KTgdw1VzUjfqDSFza5PlRB1xCQMk1q39VZ1TMnKs
         Y+I77uc6eo/ZMYxpkc0Kf3BLvBqIEt/HJtD1d4HKUQJrkZZp7Rn273NYOFzUf8DXQtEF
         R0Ye8VaoKorMIHp0P2rFrpk0VJB2Yz/CePkI1qJ1A/SZlLnPTzvLQvmh6xMhnjz6F76j
         9KJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JVpC7Acq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t66si4410634ybf.820.2017.11.24.02.11.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 02:11:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JVpC7Acq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48341 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIAxi-0006KK-Lj
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 05:11:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIAxX-0006J8-Qe
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 05:11:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIAxU-0004hL-2e
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 05:11:47 -0500
Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e]:34439)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eIAxT-0004gm-Tw
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 05:11:44 -0500
Received: by mail-ot0-x22e.google.com with SMTP id o23so18383761otd.1
	for <qemu-arm@nongnu.org>; Fri, 24 Nov 2017 02:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aUDVxr9y6ETLEhP+QcpnBFg0XuxXJSOg6jJkc6LWUlE=;
	b=JVpC7AcqXPJ9EdPEwLNql1se77glP5IfCUFnsmMvOdxH3OV6XJenBBpRQA6/OQetSg
	gbtuKnVzCPuQIHb7F93oQXqSx32VvP6V2WiVpI6ilIMX8vKgiXrWIRt8jEgp6HyXZRd/
	8gb7a6HydgY4zx/AzYEs6mmyJ8AzH9vZyJ264=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aUDVxr9y6ETLEhP+QcpnBFg0XuxXJSOg6jJkc6LWUlE=;
	b=nq6eRFDDRDknILFi9kO9ZN2diJ/cCHBTctkgfv8WPfve1sgnIJE3Insn9/5Evpn12v
	0poopzsKbxBcaUh5LNnq1vwC7DopPNHM0DhDHAfYcuYpTWwr3FHH38EJxaJtGWRg4+wO
	h8E26UvKExPT5E/j4fZZ2IRORgQIab7IcHOtqExWoVIQB3nvFWMj1k/7CAD1Jn6lYkpn
	eMCss+M1NL/FmiDpmJ2lbyBkZ/FI0o6fOxPyyg54nmluCxDcR/s/Fqf2adJaLRc76CwN
	r2OdryO/Avj95aF2DkcsG4BbVhT6FvXw+YS8tdEYrciKmskfALUp5gzQyhGln87MCyT1
	zWgg==
X-Gm-Message-State: AJaThX5i/CA753L/LWPsVaGSWdeQjxwGVsyTB0Btg6K+VcjVp/bRVUXL
	9BsuWPIhtmQ33GBUqx7DrxJZ3uXma3usbTptjfnxsg==
X-Received: by 10.157.37.173 with SMTP id q42mr18265899ota.116.1511518303385; 
	Fri, 24 Nov 2017 02:11:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Fri, 24 Nov 2017 02:11:23 -0800 (PST)
In-Reply-To: <1511516626-21178-1-git-send-email-eric.auger@redhat.com>
References: <1511516626-21178-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Nov 2017 10:11:23 +0000
Message-ID: <CAFEAcA-Fjpg+KC4eUzupLFf7fAco2GDmZG8nWNqSARnn9vypxA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22e
Subject: Re: [Qemu-arm] [PATCH for 2.11] hw/arm/virt: Add 2.11 machine type
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TtXG13FqcSzJ

On 24 November 2017 at 09:43, Eric Auger <eric.auger@redhat.com> wrote:
> Add virt-2.11 machine type.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---

Argh, did we forget this again? I think we should just
make a rule that we have to bump all the versioned machine
types when the dev tree reopens...I wonder if there's a
way to catch this automatically?

thanks
-- PMM
