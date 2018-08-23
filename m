Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1441655wrd;
        Thu, 23 Aug 2018 10:53:06 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyZw7Dz+r/XvW3SO27u4yQAuEXxMsWXeMSfhGATjXqkEWllIPDnrSh3qJkIPB9OB8HZODoe
X-Received: by 2002:ac8:31f5:: with SMTP id i50-v6mr27379677qte.323.1535046786890;
        Thu, 23 Aug 2018 10:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535046786; cv=none;
        d=google.com; s=arc-20160816;
        b=SU3aCWNlyKvmW2+Uo6XgifQmxVegA81uATqdROR/qkEEUBfvcx8v4ax/WHt83zWY33
         zgAI7vmS2BJKNhC7FBMrOkS1Ek8x2RDl6b//CPaxMU6C7b9+OgSrkx6z2v0ay2Vddud5
         RCiJ/3oPDVEInsntZ0+QPVhOJotb599erk8xWtqFNpbBtwnzqqJ3H0vROT4OHKVsPTGX
         yWJ/E+czJR6orZuQfa/VFyqNqxFfDm9MEeIbjqzRAXXMu3/HX51174UyH02es64JVrNZ
         H2Lw5KVawGnQ83DS0UWBZaYQd6lZxbofouqIw7bjZrl8/JikMk28Jerzp+vRyaBQCrMk
         xMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Y2XoQXs2Tqqhqz2G3xWmPZ6fHrcpeuXAUu1OShOCfPI=;
        b=hhAbChts602/Br722PsYp0Eqj5C/ZumV/oB8W5ckH6J/VGOJ55ICWZvWW5SNy3bkBj
         kPXT/nZ73W6oSNIDAtR8SHyW7vTBw45H/eOYBvURa4wTZUP1Kmva+tDdlqZmZM9VNmLc
         5ukKMpnqDt8l5dApsOYEyTyWUL0H6gGK6a31sgj5JuzuTShrfeC8o36hoLuhAk8U0KoV
         yYl5Z4eWRi6FhqH3iv4L0SK2euM8naicatSWQHiCs2NBgOLaeYNok2e1hXaGJoS+cYg6
         cHYxivPONtePYRAYc5smSMhCkZSOD8XQVzI8gjsnJh1sIVQy25mN+3sFNEk5dssVdmDy
         z6+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BmvANU0c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o23-v6si5078990qki.342.2018.08.23.10.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:53:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BmvANU0c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstn8-0004kW-CL
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:53:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fstgU-00071Z-1h
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:46:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fstgR-0007YS-Pd
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:46:13 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:41952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fstgR-0007Tu-Fg
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:46:11 -0400
Received: by mail-oi0-x241.google.com with SMTP id k12-v6so10715199oiw.8
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 10:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y2XoQXs2Tqqhqz2G3xWmPZ6fHrcpeuXAUu1OShOCfPI=;
	b=BmvANU0cv5f12yvOpmOIkLS9Cz3fhNIyMw03DGyWOdagCvaWJUKr75LSc+IvPT+c4m
	Z7HaHBN4I0VKPHbInATnCSScplKQW5yFJDb0waaeKLRFjtZNAt7V46+p+/6MCdputPHl
	jGVZaluhuvP4gYnB5JnZCvZ3fAtMdxygFwVCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y2XoQXs2Tqqhqz2G3xWmPZ6fHrcpeuXAUu1OShOCfPI=;
	b=e8RDcn5IedX8kYXbOdeKQ16KdBDhfK9AkGbbaqficctvYpNmNaNPd7sTmi2Xq59A9U
	KN3SZD5rPWymlDnG6QQ8ES3O4j9lCFpXU4zdiGEyPSbbBNOTfZ4CGd0VgXapEIWDDT7U
	3aMXVvUxm5m/Jq2DOT823FiS+ZibhCTPmsjMXsF3uo45Wm2bEpSxNOFwWJSYxm6L962p
	W6jUN0IPiP91j144YyR6bkAk3RVH/T7vdL1m540o/IHhIJM9zDyP7TGF2sj0iMHkPfo8
	iLNlXqdytOdsbli9x2M3v/+07JkUTFVOMdbkk2ZKUbfH7yx4t3lj5KbQhxHXk+BuBkns
	5UYQ==
X-Gm-Message-State: APzg51AL7/YpKFKNqWDJn3o90jGS8bfLlG3TZgCQBw80cSQgtVdWKtCN
	JID5s0VNM4wDiuWzGV/YRtNHK3g6tRZHsPO4A80aXg==
X-Received: by 2002:aca:c351:: with SMTP id
	t78-v6mr10177853oif.338.1535046365466; 
	Thu, 23 Aug 2018 10:46:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 10:45:44
	-0700 (PDT)
In-Reply-To: <786e23f7-8492-477e-632b-10dc3ebd4576@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-23-peter.maydell@linaro.org>
	<786e23f7-8492-477e-632b-10dc3ebd4576@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Aug 2018 18:45:44 +0100
Message-ID: <CAFEAcA-ZYqeWz9mVBvWNfvMThzJOzB7-HcQ=db3DzG9ZYrOi7g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 22/22] hw/arm/mps2-tz: Fix MPS2
 SCC config register values
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
	"patches@linaro.org" <patches@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W/b+bWh5637s

On 23 August 2018 at 18:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 08/20/2018 07:11 AM, Peter Maydell wrote:
>> +    mmc->scc_id = 0x41040000 | (0x505 << 4);
>
> Is it any less clear to say 0x41045050?

It makes it a bit clearer that that field is the number
from the image name, I think. (Compare the an385
and an511 init functions, which I notice I also need
to update to fix the equivalent bug there.)

thanks
-- PMM
