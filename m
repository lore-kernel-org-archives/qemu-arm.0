Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp19181wrt;
        Wed, 3 Oct 2018 12:54:41 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60N/IZZGItSwL8+SqdjAPUxOUdTQCMx51V6DUE7NrVwt4a4MO+KcWuwYvtj8ai76uJ9Iuue
X-Received: by 2002:ac8:744a:: with SMTP id h10-v6mr2593797qtr.194.1538596481589;
        Wed, 03 Oct 2018 12:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538596481; cv=none;
        d=google.com; s=arc-20160816;
        b=ziO2ocdX/Oq1VNpvos4J6+tShoKAdyXMvJ4/Qd+Yq5oChW5S7CKXQyXFpAxgBuA+D3
         3cr58yr3+qKTT9LTeFhdAA3lE5KIOnzqByGwhtqZVtf1NCsD7ItE3KOjjHKUeOFqQlLZ
         BMf8G9t3RXKmlhmgKCouX4xY5FIZLMwFCfdrTJl/0j1/wo+K7mgNftju3n7NbZC/67uT
         DgpA/++SIfrt+ufVn5m2kim4AoWN0FWETbekkJqqpJFI+HbiP/vXSOChgmpDL7Ap8p0E
         JcI9CSbTEmxibJR7jgtCCz7j/x1WZLiPVxkWiUpZ8ha91H60bldzA1HJUh6LGrHtRhI6
         nOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=oOh02Kyy9mHspVQ1DDFuwMUY9m1qZdAZxmtaEsLct1g=;
        b=tQ+nCiKAS3JXG1yVNFatnnk/NrmjRg60xwQVInO/6gKpIjg7p8jfwGaMAMdA8gxqH9
         MEeFqnHv2VaKZh/UwdFUM8Ylzi2JhSv4cvg98t9gtpe4Ntvn8Yq09binO3FGpdeHFbaR
         nJI5AwS9ELxCZJXApQmXVDFXbC+gfIMBD+71r9rD+oEIZjImzcJd/9dz9nf0gxaDc3ka
         IvY2OzQQRMZ4E22HHLF9fo+1M678BAT8fDdYTOtqlPcEuCE8eIPiMT4YBt906XTuYzLx
         PhX0ErlSaw/SOCC4hjLg/7RgZLeOpSr+1nvBHEzb6mIs9H3lTChXgqAwuoCxxEzV0rvH
         /nrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DU21YziW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c1-v6si1502319qkg.233.2018.10.03.12.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 12:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DU21YziW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nEH-000502-3C
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 15:54:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nCQ-00043r-9g
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 15:52:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nCK-0000Pp-Sq
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 15:52:45 -0400
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:39424)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7nCK-0000PF-Fx
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 15:52:40 -0400
Received: by mail-it1-x144.google.com with SMTP id w200-v6so10718483itc.4
	for <qemu-devel@nongnu.org>; Wed, 03 Oct 2018 12:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oOh02Kyy9mHspVQ1DDFuwMUY9m1qZdAZxmtaEsLct1g=;
	b=DU21YziWPW+juChSCeJ82SPLHgZwSneY7zBsBN1nK6FIbP00NgqvCFFRLvUPAJ56sr
	V7OFHxONA05zKxpflT65ytSOgVjg/Femd48NdXCC/ANJ2yMgAal3kMkcppzmaAFn07d9
	/eG8nxFc+9ZYmXZfNbeWu214dY84wnlOUSBQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oOh02Kyy9mHspVQ1DDFuwMUY9m1qZdAZxmtaEsLct1g=;
	b=XVCU0kd1EvTZKhKOBy/6raY1DNCDdt6Zmp5koIf1rbBKCERMeD0iDFtxdvEhWvEFQP
	GfW16q+Fc0lAZ5LtfSg4DkNv1qXhGAidDP8uCupJr7ERApg2AO46B+anxb8kOqpvwAH9
	Mo62b1doX9SND0UooYQgKxNyiz+MDpdteiz6jpJsx3WCC+1vJa3dzJXq3Yyv3jtGiHLi
	Z64chHIcnTF51gmWVgz8w9JaWsYRl+ldv4IaxZ2GSwpQdqR32y6rkrl1x/y1xs3WpxDJ
	DS/IK+wDrMJUlKZFSOlAFoxYZNSYHqdgkTRxVU2ekTWWYm5jRHwYCINdQym2T27sr9hU
	WdMg==
X-Gm-Message-State: ABuFfoiwKZY+Wqdl/gHvGtnABWeu+kpA9zxzC1inXYS6IxekDJuM4yCX
	wyh7btuFl2rh52BQLQ/LHE4NFA==
X-Received: by 2002:a02:76c7:: with SMTP id
	z190-v6mr2522538jab.125.1538596359608; 
	Wed, 03 Oct 2018 12:52:39 -0700 (PDT)
Received: from cloudburst.twiddle.net ([172.56.13.153])
	by smtp.gmail.com with ESMTPSA id
	q190-v6sm990222itc.7.2018.10.03.12.52.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 12:52:38 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <edfe4785-e9ea-2b6c-fd98-4852713651b9@linaro.org>
Date: Wed, 3 Oct 2018 14:52:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-devel] [PATCH 02/13] target/arm: Define new EXCP type for
 v8M stack overflows
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6muDLwCM5i9F

On 10/2/18 11:35 AM, Peter Maydell wrote:
> Define EXCP_STKOF, and arrange for it to cause us to take
> a UsageFault with CFSR.STKOF set.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h    | 2 ++
>  target/arm/helper.c | 5 +++++
>  2 files changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

