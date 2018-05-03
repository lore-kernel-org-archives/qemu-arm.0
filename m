Received: by 10.28.4.212 with SMTP id 203csp1969003wme;
        Thu, 3 May 2018 07:27:00 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqFGAuUGx9A6oEl4DMxVNLo//Q/4Zd+nNSlJrbpYblKEzi+qsuK4fjk2cP+jn+fHxfyDGgN
X-Received: by 10.55.33.98 with SMTP id h95mr18158851qkh.443.1525357620524;
        Thu, 03 May 2018 07:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525357620; cv=none;
        d=google.com; s=arc-20160816;
        b=Ip+TdF7p3eB8bN23UYvF6wsLEDxFnMpQWCj4u4eE2gdhD/07JO1sj8NGHPwoMuSxDJ
         oC5ffHzwEOHlDXeHXyXkB6nXVmXaRtpqC4dDEsh1xnRhBdQr0NgqPQTCIucqqci8eDVZ
         ic7MOM7turEWeRo98c+6lX851iiIQfNzpocNzUy1V1s61KNNO2vJAcFdfmm8wkUgPkWe
         bEvFwRQAdi+Es7wM2q9ULoEm8SDowgaU87CpqK6fyHXpSLBWLZTUNSEbMxBE2USRz+fu
         lAoSC7BHQQD6ha7HGrVbDkFJPHpRDwbZ2p2Nh0WVPNNszEfnYEJXIEpNNVJYab2Ar7gP
         s6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Gcn6dC+Du7DpgCbxn8oyZMAi8xTRpYkhNjKsSPolbpc=;
        b=d0kE2vMzk7WAkKJV0i9E1zhhtKXFSqHTUqwaKfSW415FDfoUYGK7t7P4G+6lXJacA4
         XUnSR1uRLNsvN/dLFzATgQaIPuUawTEaFcFdM3RuJDFgR0WKcWekwhNP9vXZvcLGaTYJ
         0JlftxqgJ/v5tHCwMW4MKeb1WkG/PIyaDMx13fgMn2oEsJiRZfq3bDmOMIhjjN6m8Duf
         UBKghAXb2QAsD8TWMkBetu51i59ksYzvE+75HhAqLnMoYvEroNl/WzfBJkOjKX106Ji1
         Ka6lLoviNl0hqBRnDFd2JLVC58SuuzXH1/c6vnNqDfA4QxqQTuOhdQUqwZYFH3uenONY
         9Erg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hi+chBbf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h18-v6si10305724qvc.186.2018.05.03.07.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 07:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hi+chBbf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEFCG-0004JR-38
	for alex.bennee@linaro.org; Thu, 03 May 2018 10:27:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEFC9-0004JL-LQ
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:26:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEFC8-0002zI-Jd
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:26:53 -0400
Received: from mail-ot0-x232.google.com ([2607:f8b0:4003:c0f::232]:44503)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEFC8-0002yl-8S
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:26:52 -0400
Received: by mail-ot0-x232.google.com with SMTP id g7-v6so20820928otj.11
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 07:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Gcn6dC+Du7DpgCbxn8oyZMAi8xTRpYkhNjKsSPolbpc=;
	b=hi+chBbfVD/7kBn23v8VEYLRqlUFuH27wAd0SV8AyAvOyShPRuN8I1KWYevUSQJWnw
	bqifty3RNeZBRcdKYBHIuXsqATT+58TMv5AMTq3EP7XZtpA7bGK01MHHTbfvQ8HO9Ort
	nFoDI5CC1ebKHrZotsgQ1zmG/gBfK+wOjj0E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Gcn6dC+Du7DpgCbxn8oyZMAi8xTRpYkhNjKsSPolbpc=;
	b=WXxUzLwXyqN+/w79dlFyzEnWDZSPDDp83PzfcF/Ini3yUDetslYlUoUXOaG68JA3AJ
	+RRC0DvGt+StkHz+dTQO2BrLBN74YJ984W8VRvCkqmE3DX2tzMTWqLMXtsHGKt+p66ht
	h6zqRWfBvsBp9ypuROGc/Rn8b/24dZSdjeh1HoFwtmhx+pd/0veVbYwHYjTR/WbKj6wJ
	rBGy1rE/Ok48cEK1tJOgQRW57WTZ/IzYi39PjW/rcOnEtFeQHwdCiNiYu7sCbtuKEAao
	xngtMYY/ImKs8XnnIpl5JqgJoZ9g+gjBFZtDhugOi4dhUOdrBUrORUkHaalLwq3RQMOE
	i4JQ==
X-Gm-Message-State: ALQs6tB8DcmkmejWBp219yEZt1p9FrsYapn/J/NcFH6e3z8fkO5pmzLx
	GIKKRgkU9StNZYHQAJa4YFJ1h1xBalMHCfP6FREyAA==
X-Received: by 2002:a9d:3bf5:: with SMTP id
	k108-v6mr17152735otc.308.1525357611607; 
	Thu, 03 May 2018 07:26:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 07:26:31 -0700 (PDT)
In-Reply-To: <CAFEAcA_trFkyHOofragLEKpsNP67t4-3ZbSyCAgU2nYG75Zg5A@mail.gmail.com>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-7-richard.henderson@linaro.org>
	<CAFEAcA_trFkyHOofragLEKpsNP67t4-3ZbSyCAgU2nYG75Zg5A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 15:26:31 +0100
Message-ID: <CAFEAcA9VKUfy3_GC-=+ZqwMdYOwaG-bUKZjNXvm=wsLksRv5cQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::232
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/9] target/arm: Introduce
 ARM_FEATURE_V8_ATOMICS and initial decode
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
X-TUID: 4kl087ElN3Rz

On 3 May 2018 at 14:59, Peter Maydell <peter.maydell@linaro.org> wrote:
> What about LDAPRB, LDAPRH, LDAPR (which are o3_opc == 0b1100) ?

Ah, my mistake, those are part of RCPC, not atomics.



thanks
-- PMM
