Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3005317wrw;
        Mon, 12 Nov 2018 03:28:15 -0800 (PST)
X-Google-Smtp-Source: AJdET5dgg5df6+yyzPRzGiAZH1WjKpgVGX1QJ2Xza7dgjcFKtDA310VE+GhFiF2hJlTnlMf8hAPo
X-Received: by 2002:aed:33e3:: with SMTP id v90mr453307qtd.261.1542022095073;
        Mon, 12 Nov 2018 03:28:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542022095; cv=none;
        d=google.com; s=arc-20160816;
        b=DMeNWD4Q8+cc25tZf6XLUmYqobYdqAMQ0zaZaNeE2CPJrpYzaynS2Ae8+lSdIo073b
         SCP8uJK9RMs7VjBfHlN1OMQ/cyi+jEZGchhtdpv9Q1bme8KBoxj9ID2mE5U3jUyqnlUx
         sl2NND6B4i7kbH7oawJGeaeh9btiYMDqueFpW9cAutfSLZEankUvVysOmWeBSmlKmCi9
         qoIsCk8uEkF1foyGnaZ/7JsaBRNt8UGfDlyvx/Gym542cssIjQqoa9Pr1aSXaZ6TUUZ9
         jtLo9GvFFCFO+N6EtM+rCkPK7YLRwzE2kSy4nKF0wkoqrg7VbrQhNECYLrNs6A64uFfB
         RV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=ZGIb0avUYP/ObmvQ5l+lJ/t3hpNpkC87UQjy1ag1OTs=;
        b=rRH+ZslSI9noEGa7SFHtzg7MQb0ccoPVCe7AKrTAULFYJJg1dfYSKDzafx7CO9dAdl
         8oFOh3SvnL/c8yUGd23qnnsbjioutiIHl5N7HFOgAAD6IjmPteoDAFoUM5SeAno2ya+Z
         TcmMspkhmrWlhiJArJ1xfpddcgvcC8UEq40A728Le+670V/vA56BvwMpsFsv3tzrwccE
         ZhEE7heoRYhDyLbRFQrCP1zCpnvfUOIrQUg4/MLgqr7s2ZbyePYujONGLVU+RNVySW55
         aumex+ysR0axlLr/w7eIYcsjTAk+3PLvw4ZtAR4mHyFDo6omzJzc1YOqSKirUqIbouNs
         qemA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JlFdUXrM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u27si1231279qtb.176.2018.11.12.03.28.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 03:28:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JlFdUXrM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMAO6-0001LK-IA
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 06:28:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMANz-0001JB-Lh
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:28:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMANy-0006MF-RV
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:28:07 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44884)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gMANy-0006LY-8e
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:28:06 -0500
Received: by mail-oi1-x241.google.com with SMTP id p82-v6so6830048oih.11
	for <qemu-arm@nongnu.org>; Mon, 12 Nov 2018 03:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZGIb0avUYP/ObmvQ5l+lJ/t3hpNpkC87UQjy1ag1OTs=;
	b=JlFdUXrMCP9m4d3/q/TkqCwd1Y5KGqEU7AqqInCaZsVaA/koZWHe7ax8a0H8NxyLSa
	rvWR5thu3EPWjMQ2xxU01OC2WUGoJ41faRE7QseXWUFn+2IRBuUBEO1Ig3Z0AM3EV7qJ
	WKMgmJhQFMPAHwaY+bDBcbG1s/BwB44MzBP9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZGIb0avUYP/ObmvQ5l+lJ/t3hpNpkC87UQjy1ag1OTs=;
	b=l6JN3ytLhO9xzLPfmtk//2oMqCCyu7ZECQj3f0BBLCqhSr7gje8aEjTgNbUqNwLIJ1
	Bm1TbVddT/8A033PJ7hjfrfl0wondj4ciAG9H0hWcnLBzQXs/gdI+d/4OVGkkkV7HoCi
	PDQ7Bjda+AGhaAJ50nk5EdsD6bOaP+6xEzMblH27tA4EL8qythUIrv8J6+fpU2ASNDi+
	Jhe4pOwW/1EjhhjuKBNDBkCjo3sfrblALrhAXR4x3iK7JTpD9Ogwnca3csl77nvw0+HH
	MlbD6xmWLroVJrZQAHRhdKRC3rP+UfwGXzudJ5KhLoBs+6Wt/5LhXmC3fy86iKByh8z2
	3H0w==
X-Gm-Message-State: AGRZ1gKYOrF0Vef5hQIQ2xfqLnVQrRvTp0zPuf84SAyznjxNDkQx8nXF
	ISTa8RW6986fZT1hAuxpsqIdQJAcsMIRCALAwduycg==
X-Received: by 2002:aca:c50b:: with SMTP id v11-v6mr271404oif.48.1542022085253;
	Mon, 12 Nov 2018 03:28:05 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Mon, 12 Nov 2018 03:27:44
	-0800 (PST)
In-Reply-To: <20181110121711.15257-1-richard.henderson@linaro.org>
References: <20181110121711.15257-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Nov 2018 11:27:44 +0000
Message-ID: <CAFEAcA-aXFgJiALAy0XqWOcJ6V1x0BBCJjMK_wjACsvMCnNwMQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH for-3.1] target/arm: Fix typo in
 tlbi_aa64_vmalle1_write
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OIHUnBbFSWFY

On 10 November 2018 at 12:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
> This would cause an infinite recursion or loop.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 96301930cc..a327988c66 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3155,7 +3155,7 @@ static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      CPUState *cs = ENV_GET_CPU(env);
>
>      if (tlb_force_broadcast(env)) {
> -        tlbi_aa64_vmalle1_write(env, NULL, value);
> +        tlbi_aa64_vmalle1is_write(env, NULL, value);
>          return;
>      }
>



Applied to target-arm.next, thanks.

-- PMM
