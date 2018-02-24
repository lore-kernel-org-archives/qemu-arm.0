Received: by 10.28.71.27 with SMTP id u27csp1391688wma;
        Fri, 23 Feb 2018 20:56:36 -0800 (PST)
X-Google-Smtp-Source: AG47ELuEt/60bLP81LtTP7ixcpXi/g3lwBxyZIB8ngn01jmSLn4DO2/9F9JYjvHIa7snE7LQzaAd
X-Received: by 2002:a25:c885:: with SMTP id y127-v6mr2639355ybf.284.1519448196046;
        Fri, 23 Feb 2018 20:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519448196; cv=none;
        d=google.com; s=arc-20160816;
        b=OQ1O3maFQVpPpY8d98mJWFkwS+x+tKPKbtAM54aEqCfyfFgIhdrqz2TwUeOCRudN92
         HDJhvnhMUgSgJn2SXDbHdzvF4JDL56gtvlB9RQHFZMs3t8aJ0trkmxm1HFeRGWFik1DP
         v/HblZHK/ALFKj2Fbz1kxV366ocALFm9M9TPCsOeRztQKFxUEGJ5uuK/1XmJRaaHoJJI
         DlDe6G8meuvW1vZozyA7w0915FbpplBk5h2rTGTnwh2NJppP/KRJCSgkut7mBN9095DE
         MwxPSis5NfgjzYZC3R/c+ai/hgj9maXNGAbcrOOkTICbcfeMfXxEI6oFqqsUUoJjf6Ac
         RwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ysthsCZYhPu6rTfbeYD2DC7qpYGqb4XRCVAUrwIGj+k=;
        b=yKhZJP38PoDWCu+E3zN0hH/dvJIDdj68N1A9Gnzk5VuunyzYbms27qfPXCxU3kRj8x
         kjgYRvwn0LrsxmSEwXuCIKZ48HmRIU+P0vZQCnc+qVPKt2/u0TIwb5YYaiQYFpGtmA3P
         51orp85Are40C6DqqgP5dfOgJ6JjM1FjdcYSjPXcZ5AwfcOAccJ5gb2ZqOmmDz1g5XA3
         m8C9QjVHhe2fFMe5uBSSRFDmfvPpxptVcVcEqSl2fO41t9EiJgRSXJvrF034jbs3tFxf
         Zy2skqJfl05JG9N92gMCUkOM4+w7cXqkvKQtFcJDnerfZ3Etgj/zZKDZzMHkVW7ZrniK
         TnjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hYG7jC+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o68si637760ywe.255.2018.02.23.20.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 20:56:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hYG7jC+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48521 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epRsx-0003G1-HW
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 23:56:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epRsm-0003FW-3g
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 23:56:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epRsj-0008Fe-1t
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 23:56:24 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:35601)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epRsi-0008Eh-Lr
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 23:56:20 -0500
Received: by mail-pf0-x241.google.com with SMTP id y186so3678192pfb.2
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 20:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ysthsCZYhPu6rTfbeYD2DC7qpYGqb4XRCVAUrwIGj+k=;
	b=hYG7jC+g8ciCmXBXdkGaU7WXL6PXbFqfXRSZ/Xl2aSMDvl8lJ/uY3dzMADSOAvHF9C
	A+finUyW3jU0pJIYityRKTwoP4b2PoHen/KO2tUFFgin8HEWNCemVGH3UW3wnaJ6Gnn7
	E+SxzvWESQ1pTlHRjX93uMFXWRPvM/gUVw79Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ysthsCZYhPu6rTfbeYD2DC7qpYGqb4XRCVAUrwIGj+k=;
	b=InCAMOgyR2JTJWvtceEwqgGEJznaYUV4l4LbeNU56Jv3aZtPQju2WyhKbXa2wWyBbN
	Xie7d/im6wXgx+PnijgA6d6La1uIPAIIzjhROmIsl8ieIwBbf13b0rUeQtvC5wQQ4EfF
	IBuF2pVve8vI6CHP5HIaHabORTs3tLmmZQ6sZKUizEUzehsyFQTyS+lXduvB22vc6Iyq
	xgkE6ZZC61PY/0PrPLGAalhtuV3C2+UJRs++7fnX1AjiFSciwSGKnw6zQvXxY/0KYHxx
	Q1n6a0YsXmf33rw280zSmku4SbwazMWuTfXRX9pAkELerodxg9PK4pE252R3tGKUP/ut
	GejQ==
X-Gm-Message-State: APf1xPBLAwVdPc3+4r0k+c+S6DojfaA/UGRizzpITxWgM8NpJ/YD6BWl
	pXqjeeN5Kx/9jVpyGoumS6ttuA==
X-Received: by 10.98.149.138 with SMTP id c10mr3945373pfk.143.1519448179196;
	Fri, 23 Feb 2018 20:56:19 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	w4sm6966810pfb.125.2018.02.23.20.56.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 20:56:18 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e55c2d18-b3b9-520b-0e9d-69ba711543b8@linaro.org>
Date: Fri, 23 Feb 2018 20:56:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/19] hw/arm/boot: Honour CPU's
 address space for image loads
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KSk0XD0IKKre

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> Instead of loading kernels, device trees, and the like to
> the system address space, use the CPU's address space. This
> is important if we're trying to load the file to memory or
> via an alias memory region that is provided by an SoC
> object and thus not mapped into the system address space.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Function name changed to arm_boot_address_space()
> rather than arm_boot_addressspace(), following irc
> conversation...
> ---
>  hw/arm/boot.c | 119 +++++++++++++++++++++++++++++++++++++---------------------
>  1 file changed, 76 insertions(+), 43 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
