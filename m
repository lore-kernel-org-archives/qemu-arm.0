Received: by 10.223.188.70 with SMTP id a6csp6170307wrh;
        Tue, 29 Aug 2017 09:07:56 -0700 (PDT)
X-Received: by 10.200.51.148 with SMTP id c20mr6876776qtb.268.1504022876420;
        Tue, 29 Aug 2017 09:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504022876; cv=none;
        d=google.com; s=arc-20160816;
        b=HCaobeeBQlfKQCNxJZABwzASazlc8Ij+ISa+f3UQCH+Ayra6+feYFgh/aysU8yZF+o
         QLQC0e9xW/YBXMm/6FuuvupGRuEnVuexjydshCNqfZ/kmfoEsUzcm1cpaSToWG/Mq8xI
         GTgvXJ39nuXPxtG6GYMa37sij7Bqif/4lAsMO85mcB48hFz/2R0YPmbwiIVouWwVkZau
         SfJm1F1eQ38I1aZb9oRoQ70YpuQuC4VGdQlf2G4i2xTniKH70AF2qLB2zSM7p7GnWwhk
         hTW9wG3Jj9AmlrUy0lhVqD1TgMyT2uZh/0+GCCNYTxojJ3lHCZ1jR5y6z173+3Jj1dYN
         RtmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=nAOBTxhaH7b2dqbDJpVQHxqc6V4w8QsmxubnNal6448=;
        b=Qyq6Mw9aVTWzn5LwMeSOlCd8nTp5IjRxpn5UdZ4ABdAQh+He0Qozo7ahNlxncCbXNx
         foYJ9gBHFoIrWs/DavEs7mZHDhT/35wzde8QiI3skFufNqigsCL5toskpIw9cpZNJDne
         H3H7K5YnBLkBh3UXdiOj7jlYYzTq5E90AOQODzVg3L4OApOGkPnOeLntGEFusQHM0iTO
         /KhnRNiAWuzLxJ9drSIIQ+V2jVYIYp1Pj2+b/LwmECiSaqGNdtSHqu59L73MccHlnwAI
         eXx8SGrYeMx7FtQGLrykoqLndeeZUwnf8dL1Ve2TcCYKsCQHTiijTuNnMGfY3syoo3XR
         7lGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JiS8AqH9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z64si3223125qkd.376.2017.08.29.09.07.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:07:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JiS8AqH9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmj3R-0001ej-Tk
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:07:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dmj2i-0001AL-Cn
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:07:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dmj2h-0003gF-I5
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:07:08 -0400
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:36149)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dmj2h-0003fp-Cl
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:07:07 -0400
Received: by mail-wr0-x230.google.com with SMTP id p14so11664609wrg.3
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nAOBTxhaH7b2dqbDJpVQHxqc6V4w8QsmxubnNal6448=;
	b=JiS8AqH9tKgkeuBdV/UFS0MD0by4C65dUs6NwzOGdRI/hbghiJWKFgy4h5ZcDzMz9o
	jk0/wYfbix02UyUqiLfIX0lRBrfPOPde0P8hxzy01eCak36VtWeXdTGfv0NnA3DbDnrs
	jpEUaD64mQJDMEz+MPRDF8Mxib7D717PD8bao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nAOBTxhaH7b2dqbDJpVQHxqc6V4w8QsmxubnNal6448=;
	b=EF7eRXq28xqiy1h1FOMqPJ7Ifgw3AgPIccnjN4dQYXob3tg7/rBjiJ57VbxZUWMQ1k
	ciILa5HBTS6CowKPol2IsaL2327HwTBX6nVyEl9Sy2nI3bPVRg1GFBOccoWnqSMWNJi0
	ppuJTqbYQO8GN84cpvzl6ShnmVlAIWZbcgCra1pRZfpTb+2x3rXkefnkOELn5uTXNiQ6
	xBgmFPlonIMqLbzpwAF31IVG/qOsfTnlILmiO5JS3JJC7uLTK3XRQ5DUdD9b3wQKFJ8/
	ckp/JUSdbfUtVphnghqXzHdNgoaBwMXMQs0aBF6x+GIrxRq0rMaelXhXi3LeZlFzttsN
	x+zQ==
X-Gm-Message-State: AHYfb5hwMeTnY2v6peh4jBBfmZVHVj4YnVgZdDBXDyVY6IzPvug6vvkO
	SO1QOCf5iIAhR8QwmAq/mNiyJattp6Vg
X-Received: by 10.223.184.102 with SMTP id u35mr531547wrf.196.1504022826383;
	Tue, 29 Aug 2017 09:07:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Tue, 29 Aug 2017 09:06:45 -0700 (PDT)
In-Reply-To: <f7e28796-d080-f7bb-b283-6f78f404a36e@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-15-git-send-email-peter.maydell@linaro.org>
	<f7e28796-d080-f7bb-b283-6f78f404a36e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2017 17:06:45 +0100
Message-ID: <CAFEAcA9eV2Fq3iAd=rc52UkzCfp7BamJut0AqAbrwBf4-0qOQA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 14/20] target/arm: Make MPU_RNR
 register banked for v8M
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
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tDrqL2X0/pnY

On 29 August 2017 at 17:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 08/22/2017 08:08 AM, Peter Maydell wrote:
>> +        env->pmsav7.rnr[M_REG_NS] = 0;
>> +        env->pmsav7.rnr[M_REG_S] = 0;
>>          memset(env->pmsav8.mair0, 0, sizeof(env->pmsav8.mair0));
>>          memset(env->pmsav8.mair1, 0, sizeof(env->pmsav8.mair1));
>
> Why some memset and some by-element?

Roughly, memset where I would otherwise have to write a
for loop (ie where there's more than 2 elements).

thanks
-- PMM
