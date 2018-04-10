Received: by 10.28.71.155 with SMTP id m27csp3598777wmi;
        Tue, 10 Apr 2018 03:49:59 -0700 (PDT)
X-Google-Smtp-Source: AIpwx496UWjAG5AMeRWo1i5gAEtEHyqovOj7HMJgzncqeUMJeFHs1KVk6P46OvQEpzgvwZbT3FiJ
X-Received: by 10.55.154.85 with SMTP id c82mr54975143qke.215.1523357399473;
        Tue, 10 Apr 2018 03:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523357399; cv=none;
        d=google.com; s=arc-20160816;
        b=D1Q9G6iVx3eXtwuPPGqJvv4foap3nQujvHLnkWmu1PBYZDFUOrFOA4jFpV2UBVh9/+
         Ka0ecH9MuY7Zlj53GZSVf0y74UmFxg0HAjV/2X6737e5RLd5yE0VqFxYq06n0zFhVJS8
         0VnQ7N1Kw+FcuRQPoLat30bP2D/aIgnFCHE/Ib73GOUPnsdGcHOoe3HPNGAc0wAb8+/Z
         tZWp0htk/OnMud1BwRHXmdWmhrUCW+iq96pviVUFVPpmV4oArLDMN+lt4XsPN5BDqNyL
         hAzbmZtHZpuGzaInhWB28gIl9SlBcJTv6s1yF2tRcSOgbuYTUuJg1wyNMC+LeENw03Ew
         CXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=h9hBe0T+DwCObiAosVYyPWiapzTF22xpNZ6Zbuofp30=;
        b=P/qOK4w7FOfSEnBYSfPdqRECmD2dg2+J+nS+XFLUgUtJHzCLVTp1V9gIbJJ6nuaxWE
         9lvpMj8TRbeqIHTVO/PslV5SY9uwE+X2v8SPvuVaQxKhaeokZFccWKJAlbMUWld1K/YL
         jBEAfMYlSRZ9Fq8r6lGmWpoSBy+usLNKXssSUdpbNFv3o9C1/3jAj+TI+MaHiA/Pyr7E
         QMlFo/yGevjDuh/gD5Oo4tFCTF5NU+X/v2UzNGoVS+77nVb3PFMtwFtQ2IDYAiUkAhAb
         GZqLZ8urJiM9vEvGI0jvJv4kr34KI4bjIThVVth4q9tLBwPKk15+9F8W/CbbBnZ6Dxvt
         5SRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TV5grocS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f53si811748qtf.262.2018.04.10.03.49.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Apr 2018 03:49:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TV5grocS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5qqc-0000fF-Vi
	for alex.bennee@linaro.org; Tue, 10 Apr 2018 06:49:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5qqN-0000dw-77
	for qemu-arm@nongnu.org; Tue, 10 Apr 2018 06:49:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5qqJ-0003VK-BB
	for qemu-arm@nongnu.org; Tue, 10 Apr 2018 06:49:40 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:39950)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f5qqJ-0003Uq-4k
	for qemu-arm@nongnu.org; Tue, 10 Apr 2018 06:49:39 -0400
Received: by mail-ot0-x242.google.com with SMTP id j8-v6so12191289ota.7
	for <qemu-arm@nongnu.org>; Tue, 10 Apr 2018 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h9hBe0T+DwCObiAosVYyPWiapzTF22xpNZ6Zbuofp30=;
	b=TV5grocSt2tHdv1gddt0k61+L9X4lZRi488GQkmA0XAJ1iw/2LOwWCjTT2ANDRE7tp
	G1nZGWGdLpD0MX0iD8WWftSvG/eGsQr7JwJyTiF8qZA8FUG1ZdkSycdHLK7zRDx+EDuA
	rdbWfMR/HRcfCbVZm+1oUDC/Gqi4LsSrQaurU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h9hBe0T+DwCObiAosVYyPWiapzTF22xpNZ6Zbuofp30=;
	b=XCimXcfF8ckUKmxwpFHrxBn3DiGXOJbxv+gKniCVz8iR30XjcHnqDRUSxRhdrnSK19
	2eb2VvEiKRrCDM+oalEy1F8QH3i5MVwURMTUA06zPwBTumwRP0v3fK0pTk9boSsWc5Rp
	byekUBmcvWPKmIKIAqpLFLtzF6lySR3RjKZJ0+BCg67xXKwklaUnO+CZMmb0Dtcyl2PK
	pA6GQsOFtvVkRC8Ho00JbJVBjEty7Ajua8SNHNvxTQ8Jbjb8/khzoW0JN1rNmGDcN4Mt
	o93d8zKUlCvEEWGH7Cl3Xvb68ZLh1kFpKiIT3exTu4/wEEjPt61a7SB2xN7mNHJTDCKW
	YjMg==
X-Gm-Message-State: ALQs6tAKwv9G93aOyHz0NxjgCWdhgsa848DZvad9G+ciAY6Dzk2j6SQS
	1SXCQwh1hb3wfitGQAE4Ppt9IU4Y+WHz3WPio0RRtw==
X-Received: by 2002:a9d:2129:: with SMTP id
	i38-v6mr27283949otb.210.1523357378345; 
	Tue, 10 Apr 2018 03:49:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 10 Apr 2018 03:49:17
	-0700 (PDT)
In-Reply-To: <20180410003558.2470-1-richard.henderson@linaro.org>
References: <20180410003558.2470-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Apr 2018 11:49:17 +0100
Message-ID: <CAFEAcA-tq3+iqDpTN17SB_urEuZcqL2TRYWUEQ7VRy2SwnQ6Uw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH for-2.12] tcg: Introduce
 tcg_set_insn_start_param
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TjQ7uvR8rVfP

On 10 April 2018 at 01:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
> The parameters for tcg_gen_insn_start are target_ulong, which may be split
> into two TCGArg parameters for storage in the opcode on 32-bit hosts.
>
> Fixes the ARM target and its direct use of tcg_set_insn_param, which would
> set the wrong argument in the 64-on-32 case.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: alarson@ddci.com
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> Peter, I'm not sure what the reproducer is for this reported problem.

It's a standalone binary, which was attached to this email:
https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg05995.html

I've checked and this patch does indeed fix it.

Applied to target-arm.next, thanks.

-- PMM
