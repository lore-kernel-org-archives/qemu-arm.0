Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1427073lfm;
        Thu, 9 Apr 2020 10:37:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypI/DqeBEE2CMRXU0L5uKjTtPaBECYNS723Pf/HsTJVG7rBSE1I9yqFo0dqGFiNZuvcVLYIk
X-Received: by 2002:a1c:307:: with SMTP id 7mr928827wmd.126.1586453879275;
        Thu, 09 Apr 2020 10:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586453879; cv=none;
        d=google.com; s=arc-20160816;
        b=TtsFZQVNxQbYnyvJ5/uaGSjSYJiWkDIc2fY6vK7Ejn6Pn3teNpbEK7CgRXVUvoMAwJ
         rGA+VFwZtjhACHrK7u9qfJi4/DQ5qvd2grFakC0LFrCZi1jfcvZLI3hx89NGrFDSAc2m
         Qry3cBG4Y57UvqnKS8aKklI07jL0CmbhjIaF9re+mzv5CoQys0iTddC4MTcP8TinjT3t
         L0lFHZQ45nElOuyuzzl7afp9WXk4EgF4wo7x6PEFEU/ssFGWDQCIwRqmbz4X4TRWPmd9
         3W27AvxcbSHBjhMEEb/AdksztNUb0s0dbjFJ3yHFVbAgncR9JnWJCx8sh9orHX8A0+JW
         dwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=mvnUWkmUZCC50Uz7si5qsVMdLEd3RX0UfneG10tx4Xw=;
        b=EDRmZByJxPiRCs5VVPiWvx5wiFn/pEm6+LJT8V0m4o8dcnDh/5LWgawaSDhtIq8rTQ
         hwq35K3hHcAUkSLJdK5+CAz0JRG6cgiQYFWxPd6E1qTqxczUEPzqkVW5kwFOAql4hhp7
         rnkE1+ICmfpnYy6TUVSEonb//TnzsGosUkaB7MNOPcFxSixHzyYnVV3g3+PtmsC+zLit
         dCAhYD74sPOJ5Rq1tWnA+MwwnuAxYJ1i4tReIm1gK5/jfvE2stv5DTEIo8Y+vFTsTIYT
         RjoNv62vA9TFgs6lJVlcecHpBTIBUhLNqqKGx3yBckQoOFmiynhHjLHIExgXfNYRZMWb
         jnqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q123si3365294wme.140.2020.04.09.10.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Apr 2020 10:37:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jMb7m-0002zi-8S
	for alex.bennee@linaro.org; Thu, 09 Apr 2020 13:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fredrik@strupe.net>) id 1jMb6p-0002Aa-VO
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 13:37:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fredrik@strupe.net>) id 1jMb6p-0002dg-0d
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 13:36:59 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:49403)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fredrik@strupe.net>)
 id 1jMb6m-0002ZK-Dr; Thu, 09 Apr 2020 13:36:56 -0400
X-Originating-IP: 84.210.220.251
Received: from [192.168.1.123] (cm-84.210.220.251.getinternet.no
 [84.210.220.251]) (Authenticated sender: fredrik@strupe.net)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3C98DC0004;
 Thu,  9 Apr 2020 17:36:51 +0000 (UTC)
Subject: Re: [PATCH 2/2] target/arm: Fail on invalid size for VMUL (float)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200408115953.1158-1-fredrik@strupe.net>
 <20200408115953.1158-2-fredrik@strupe.net>
 <CAFEAcA_kVi_LWFduY241vB-nZn2rG0_13Y80t3CZVO3=u_pM-A@mail.gmail.com>
From: Fredrik Strupe <fredrik@strupe.net>
Message-ID: <7f2d47a7-2df4-ec89-0e10-5f205491a5cd@strupe.net>
Date: Thu, 9 Apr 2020 19:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_kVi_LWFduY241vB-nZn2rG0_13Y80t3CZVO3=u_pM-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.70.183.198
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TjDKyXgQ8DJO

On 08.04.2020 18:27, Peter Maydell wrote:
> On Wed, 8 Apr 2020 at 16:29, Fredrik Strupe <fredrik@strupe.net> wrote:
>>
>> Bit 1 of VMUL (float)'s size field encodes the opcode and must be 0,
>> with 1 making it undefined. Thus, make VMUL (float) instructions
>> with size=0b10 or size=0b11 (size >= 2) undefined.
>>
>> (U is 1 for VMUL, while it is 0 for VMLA/VMLS.)
>>
>> Signed-off-by: Fredrik Strupe <fredrik@strupe.net>
>> ---
>>  target/arm/translate.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>
> Thanks for this patch. I'm actually in the middle of a
> refactoring of this code to use decodetree, but I'll make
> sure I check that the refactoring fixes this decode bug.
>
> Also undef-checks like this in the old neon decode structure
> should be in the switch (op) outside the loop-for-each-element:
> compare NEON_3R_FLOAT_CMP; but it's a bit moot with the
> refactoring as all that code will be deleted.
>
> thanks
> -- PMM

Alright, glad to see it being fixed.

Fredrik

