Received: by 10.28.71.27 with SMTP id u27csp719973wma;
        Fri, 23 Feb 2018 07:25:41 -0800 (PST)
X-Google-Smtp-Source: AH8x2267wdXTKB5gPh/Ag5qu1OTauRMIBmxsG8iyS6I1zKZMb4BleJa4j64oRrjG+CcK+Utx9zTy
X-Received: by 10.129.131.145 with SMTP id t139mr1252541ywf.485.1519399541254;
        Fri, 23 Feb 2018 07:25:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519399541; cv=none;
        d=google.com; s=arc-20160816;
        b=h/b6Ad7G60qr9YfVd9PuVu77KbnVWHYGTQHBPlgCEF1sWzt/D7rskvBewjI2eOwCnT
         6xqHVms0Kgw3QS2LgNcI7yUvFQ+Pmsu3lnZqVReEIFhruPL0FHDQ7iaamRsmbUSpLGD8
         OqkHWy/5XpDkMP8TcRod1Zsvxuvq8k9CRKigdoam1+hwbEjtpGmzQDjARhNZ9ejBjhM8
         2Gbjnn1SF7ZZ28acjkX7nNfTtvtFsik/Sk/IzjEBOq8Qg/tP/v+v5J8E/wsT7MrcG6go
         HJAzuJ3XvTB+xUnkVWwTVJWJ0zXPcvtaM+C+TehV2y2NDgYBYq5FmoTQemxZ1HiKjNnW
         JkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1rPucsqPDZJRLWQj26tE2ofi3a5jh1AAswIg4N2UI8Q=;
        b=KCYe7rAuaROIWSIX7H/PQVcfewMF6G5ErZLCjCgk5mx/uQTfOIqmT+YTqWJPWAS1EW
         5VlW7LdPuHrjY6vYeEib163y40GfU9XZk84JhUcsPbO563XJDVo3j96aHuZ9LqcAd+g1
         sfOeaeNJbf2RvV7WYWpUjCaaqROrv+qaWUqSHT7phbrir4HENOhoOsMw03+9EnkbqmSg
         jM+Hulir+nxF8eZHlxPSd3vt4CpR30SfS5CTb0cBWdSnm9DQneneKBTm75+7dmDW9mmL
         3w3WwbYLTThpDpLeLcqlY1yFgpDh1hzQmg0OoLxWlkXTm5zX6QfaqqrnjLckU8be2bJc
         ATsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dO8hSjYz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r12si432532ywc.14.2018.02.23.07.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 07:25:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dO8hSjYz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epFEC-0003ij-Jo
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 10:25:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epFE2-0003gg-U9
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 10:25:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epFE2-00048X-3V
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 10:25:30 -0500
Received: from mail-pg0-x233.google.com ([2607:f8b0:400e:c05::233]:45404)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epFE1-00047x-T5
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 10:25:30 -0500
Received: by mail-pg0-x233.google.com with SMTP id e11so3468468pgq.12
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 07:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1rPucsqPDZJRLWQj26tE2ofi3a5jh1AAswIg4N2UI8Q=;
	b=dO8hSjYzIAJ/QbJ7QwCu53nbuLqnaRyZ4VQFyzw35v8UkKR30sjhCf3RcORme68/P6
	34regS98qWiG0yYxTHzfHLVWBLKBC2KfCspjf/UJLFw5/IFHdGk2D9q2A3dZinFbuymE
	Swo1Ht94lYR9fcJgQATyKEVQZnR0PoH7h80Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1rPucsqPDZJRLWQj26tE2ofi3a5jh1AAswIg4N2UI8Q=;
	b=PhbpMdn9TRLaCG8tJEp/XePkv5sBnfuolZN+zdv/lpAiv2gdaWEp3Gor3ffrNChhn1
	7xyoJnbJ4r91h/veQu3YAM05A/zipSiAWqIKpye8GVpIzLCFofdAwFMMVshCyCJoL1AW
	2aBq+nYMooJEVRGO+iJ88P6blU+9xjV2QIW9Z2ouP0d/y90xggvP5TE58FUH2XCnbKfu
	ybHGKq7OeN96eFOmQWeTYNQ2eqI2CPcuffaMK8znWdXdHtmLpquDWgYP0HmPZX9pF91m
	Y0BapjEZx7N5pf8ZhynRD3ySR2G2s0MZFfaei0ubQ1Q/H7zbrk+8sjvyfeV2+OwFSxbB
	Hu9Q==
X-Gm-Message-State: APf1xPDNTVhWo/9RN/sIG2lX2fnNbfQlo075rpXqBcy2WCMzUAB+Fnrl
	OFFS96EKcscr+Z2KpKyFjH5HWDN5gzyDh5uW37lJBg==
X-Received: by 10.99.149.2 with SMTP id p2mr1749378pgd.122.1519399528941; Fri,
	23 Feb 2018 07:25:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 07:25:08 -0800 (PST)
In-Reply-To: <20180217182323.25885-31-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 15:25:08 +0000
Message-ID: <CAFEAcA8AEDg=ZoTgU6E-R3ytBzaSKcEpOhAha8miW4VVcYha5A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::233
Subject: Re: [Qemu-arm] [PATCH v2 30/67] target/arm: Implement SVE compress
 active elements
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
X-TUID: SA1WYpc8HYwS

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  3 +++
>  target/arm/sve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 12 ++++++++++++
>  target/arm/sve.decode      |  6 ++++++
>  4 files changed, 55 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
