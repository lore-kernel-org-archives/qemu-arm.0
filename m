Received: by 10.223.150.237 with SMTP id u100csp3111814wrb;
        Thu, 9 Nov 2017 15:56:17 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QTz25X65B0cP4FqK3HuxKZEF+ih1AioJ5OPrvlbCeyqy+UMUseL/WLtA4aKEsSRCUXqQKB
X-Received: by 10.129.164.71 with SMTP id b68mr1662891ywh.198.1510271777054;
        Thu, 09 Nov 2017 15:56:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510271777; cv=none;
        d=google.com; s=arc-20160816;
        b=yit5B2afHl0Yv0dmy50/MH0W/ERqbicT/YTqKyt79TXoJxH2URtqw+82/IVIinUzsz
         tkXl6AjYQE+CfZFNTMcdMortkbA14A5mrUnZMt5DCK4nJ3J1lVQ5Ly/XHmKlGlHtZyj2
         UGbISMm5y6lIgmQa607PiHdPJK4ioUcWFLZdmjbTPaMW2mE1vo74CLo6Iq7t8Fa7rUt5
         KdAdqdgsS41dFUqemXZnzNCsai7nK82vWF8onmkJlc7ECnLB86Yu+uYv3xHqRQMx2eGU
         JQrFbhTnu5JudQzopHxl65QRnTY/rO4DO8BBmiicPUAZE1+Q/rWMMjF0d2eiqtDvS/uS
         cUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=H78/6edhti/SlO+mNOJNEQZqFfrokkRref+lVCpHDr4=;
        b=XNfAGBUh2mc8pUJulA04KpDQdboIiUm6IaEyXEY0qFLI6qmlLPkZr4onbhOuyr5D1k
         sCQgRpQnEhqzDDd0sJ0DSs/H0oNpZjqFRDzWNhx1pyI/EZoUqFOxl7/CQMZNuvr/smft
         d7Js/Vor/FDqwofUdmYYJxpo6U+h+mVGZxLIQ+JIf1+B4flkMFXsSrRnMYK8tNRuIpdi
         0TIfg4NvP929KatdCe+LzbJpuisC5u1YLbEzvctk7hRzgTKx1QrLtSk/wY8fI/IyDKIu
         Vdwd2ZbrweSlXdTSxAEcmvYrVycmXSHOmSYERUQBEd+tRx5z3Wwdv18aNIg+30hKA5xG
         1RNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SZ5WVpor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p66si1868263ywb.426.2017.11.09.15.56.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Nov 2017 15:56:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SZ5WVpor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCwgC-00056k-JC
	for alex.bennee@linaro.org; Thu, 09 Nov 2017 18:56:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eCwg2-00055e-VK
	for qemu-arm@nongnu.org; Thu, 09 Nov 2017 18:56:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eCwg1-00060j-Vs
	for qemu-arm@nongnu.org; Thu, 09 Nov 2017 18:56:07 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:45429)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eCwg1-0005zf-OL
	for qemu-arm@nongnu.org; Thu, 09 Nov 2017 18:56:05 -0500
Received: by mail-wm0-x22d.google.com with SMTP id y80so20427845wmd.0
	for <qemu-arm@nongnu.org>; Thu, 09 Nov 2017 15:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=H78/6edhti/SlO+mNOJNEQZqFfrokkRref+lVCpHDr4=;
	b=SZ5WVporgFyN53F6D1kpb+BGdfdtBUT+Gwlo4hB/5rlCCanQ7RWbDgvTRXau7dLYN5
	SD2shZo8XzTC7PgPI7Wy6ZyqaaHQNbsQZtjIXloqVoEjzVPalpQvQLAphhWLi/Xc0x++
	mr7wmSUYKYjF4T8lKOctJA0IKxd/5qSflFzjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=H78/6edhti/SlO+mNOJNEQZqFfrokkRref+lVCpHDr4=;
	b=Vg7b73Prhu6Q1UK5qBSfqo8rkmtBNuvj2CpacT/BfEoM0ug4zMhRJrXm9Y+zArVt51
	Gju9jlmogpUbHpecufiMjmt02kKYW6FkROZpgxYszBf/TlETeS4PW2lSwiyGz+XkNjhk
	oT9r19OGwkuinuD7xhGf4Y17m4rGrShWSNp8KwGbIG7zr+H/AIbDxvwy1aI+KFIFNP05
	rLpKyvhL343gMhmenbbrPzWeRx8KODPGD0p9rkvI+jt87KmsjbJtvykEW00aRv8coGb9
	4JS2ebz/RF2Iq7PnxYlzsps9rp6nTAQgFdBhnO0r6+LFQSS7g0QQU0aNZ7gnmS/oB9eX
	PWvg==
X-Gm-Message-State: AJaThX5JqxjIM9X3uUZxjzG+OUV1VOUV7hJqnyUansG/wnxWsiWzukl0
	1yE1A7c4vLWPobwaAtk5E0ZZUACyf3ptHu+U844Rfg==
X-Received: by 10.28.46.136 with SMTP id u130mr977821wmu.127.1510271764607;
	Thu, 09 Nov 2017 15:56:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 9 Nov 2017 15:55:44 -0800 (PST)
In-Reply-To: <4beb4e47-0ff9-8251-6502-23824779edbd@amsat.org>
References: <1510228971-6005-1-git-send-email-sundeep.lkml@gmail.com>
	<4beb4e47-0ff9-8251-6502-23824779edbd@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Nov 2017 23:55:44 +0000
Message-ID: <CAFEAcA-ATtAougvALVo=48p+jVx5B+Ejq60TD9dGYEQU2ReWCQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [Qemu devel PATCH] MAINTAINERS: Add entries for
 Smartfusion2
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 75PG14I49IAF

On 9 November 2017 at 21:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Hi Subbaraya,
>
> On 11/09/2017 09:02 AM, Subbaraya Sundeep wrote:
>> add voluntarily myself as maintainer for Smartfusion2
>
> You need to share your GnuPG key signed, I couldn't find it using
> http://pgp.mit.edu/pks/lookup?search=3DSubbaraya+Sundeep
>
> from https://wiki.qemu.org/Contribute/SubmitAPullRequest :

I don't in general expect to take pull requests from
everybody listed as a maintainer in the MAINTAINERS file.
That just means "I'm going to be reviewing and should
be cc'd on patches". Pull requests are sent by people
who are maintainers for a subsystem. Rule of thumb:
unless somebody asks you to send a pull request, you
don't need to do it.

thanks
-- PMM
