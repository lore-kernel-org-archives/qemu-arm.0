Received: by 10.28.173.206 with SMTP id w197csp2530893wme;
        Mon, 8 Jan 2018 06:26:51 -0800 (PST)
X-Google-Smtp-Source: ACJfBosshtCxVjwtc0YL+X2gqiB/8JZ3z0Wmdc2f02jQZWWenhekwxqtkfKR0hzV/npDHviaQquF
X-Received: by 10.129.122.215 with SMTP id v206mr11197207ywc.115.1515421611894;
        Mon, 08 Jan 2018 06:26:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515421611; cv=none;
        d=google.com; s=arc-20160816;
        b=fBLBdo9xKCr4uoEQYImnIB0EUwe87wryUbjajt5l3vp/Xem2+Dv7XTE9jstsG81prb
         RHQb5BixV9ycMdqFQsBbkDHA9mf1lX7TwJAH2WIN3l9eatfCAQoti/6yG4ampzEg0UHC
         ray/nhqyAzhdZQBbNj2ZvpWgOCSQiZ+Ko/Em2YuWmdzwz41kiGHn+k3VAcHicFXtODsG
         tiO2kJQ5KqqLmufU07fpCse0RbKOyhJiFc/8Zd2AJgmnfUny9Siu6uZ4Nc1gFoJEQXld
         yAnYje07qF1ZkHUZgbCjBtlFZ6o09Ou3iADf1j55n7HdVQBHgOgYNKFNEZvPBedUNcdG
         dXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=YH+hcKpuDX3V8fT36Ey9uGs3+b7ZGu5RXuharuH3Its=;
        b=UWc4YILA9mCymcAOzmt3s3IAQHeDLWy7fwoGfefrUNJUAIJD80B+lMn3o07XVbZbrY
         x1MC7PGL4WSv6sO/RD2wcXjG4EBqg38xnfvWlOX7SCCdr2EhNkTFUDkzXoTMvRZLWRwM
         6l+7iZhyMpcLpXmB736RvmaVSnlOqluRcVIo05kGf9DK2nEVfH4Is31ZsuUWGB49qOHz
         coX8F/gN0hdOewMcEqBAgMiPBgdmGJAPXFKT3FsQXHcK4n0uQGIqXD0eTsP6ZWBx0Nel
         jYOdwTdAXYN70/kQuZw4tmskOEoSlVhgouCRNi+LCl7DPpcAn3Nq0yhC4+zcXdTNhzJ9
         +tgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ahqg4+Vd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v68si14973ybc.230.2018.01.08.06.26.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 06:26:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ahqg4+Vd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYYO3-0001ir-9j
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 09:26:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYYNv-0001iU-5k
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:26:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYYNu-0004nc-BY
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:26:43 -0500
Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232]:34211)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYYNu-0004nF-5h
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:26:42 -0500
Received: by mail-oi0-x232.google.com with SMTP id a70so1101177oib.1
	for <qemu-arm@nongnu.org>; Mon, 08 Jan 2018 06:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YH+hcKpuDX3V8fT36Ey9uGs3+b7ZGu5RXuharuH3Its=;
	b=ahqg4+Vdh3aPuwaTNDlXXzI4/ji0Cgi62/Jv/50SA/oYCEB2bdMx/dwP3fHVeKcKaM
	zN5r7cjx6HU6DCQDng8+PaAJyfiCRj1hZvEh1wB5f+MPyxgTLvhWvI24t0WL88/5rPiN
	rsACDBrSIqBgPfzF46b1g5jKf1M7YrV2EMpD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YH+hcKpuDX3V8fT36Ey9uGs3+b7ZGu5RXuharuH3Its=;
	b=SQ+CTHW8PNH/yroasTT+4W3RhlAMtCteae0QnfGbscAxwN9jMReu1hZiiv9E8I8GR8
	C3hQeDNHNjj7zHfquqAEZs1RSOBHgAIgMk5YKD7bMRVL8nkuj6/KF3zaVRJEE97S5cY7
	E+B6XVUNAadqa3BE9KADucu6X5qCvRTrT6o6q3qAa3P2X9gMV4L0YQHTn4rhE4O2Ipi/
	YQTg39kqHQPbtb2knhxS7i4NB56l68CMx9ZsQ6JWRYZrrxUReF1pc51nRZ314+6nJg+V
	JfnhnD2nUTwllkDUY2giiVRLLt6sdzzx+yBRydFq4S/LeTbkV0BRzyqQrrVLydiTt5t/
	R64Q==
X-Gm-Message-State: AKGB3mI4b1ui8jVGtImIRCCH4wmBTIcggMnz5mXYZNBLx/VIJAiigCKb
	0uhQ6H1O85XuOJ1UQRUK82UMgHhMecSkQpRBSfx15g==
X-Received: by 10.202.75.80 with SMTP id y77mr6387690oia.328.1515421601435;
	Mon, 08 Jan 2018 06:26:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 8 Jan 2018 06:26:21 -0800 (PST)
In-Reply-To: <20180102193622.27215-1-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2018 14:26:21 +0000
Message-ID: <CAFEAcA_0um53J-=KUecYpKc1ObaokO_sUjeXmQ0Z3EQY-tUn0g@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::232
Subject: Re: [Qemu-arm] [PATCH v3 00/11] i.MX FEC changes
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fVlcByhOVWba

On 2 January 2018 at 19:36, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Hi everyone,
>
> This patchset is v3 of a spin-off from original i.MX7 support submission
> found here [1], containing all of the patchest that are more or less
> agreed upon and are ready (hopefully!) for inclusion.

Thanks for the respin -- I've applied it to target-arm.next.

-- PMM
