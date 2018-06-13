Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp50324wrq;
        Tue, 12 Jun 2018 18:02:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIG17ILF1ir/hRxIjzcQ/Econ8uBFv6IHy8FrgfGfGwzEIaGQv39KsZaochd/ck0nvWDQ/c
X-Received: by 2002:a37:cc43:: with SMTP id r64-v6mr2735245qki.101.1528851764125;
        Tue, 12 Jun 2018 18:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528851764; cv=none;
        d=google.com; s=arc-20160816;
        b=vM45cxho3iOOxoMIgyBrxFfQ/r6zmgBhZiM7eGI+Vkl3dDLBF3w06YOjht6IXXA3K9
         83ErNYUXqKPlqTW1I/aD23tNR1V+OgJvqxfT/ChmP5fhpvr3LX5c+YmEHgRLrpub4CAO
         CSVqAc6EvFpytHmkrSfHvcQ1pNbgoSnaar8KGLHkHkuBE789pV671F3MeJfqTopCBsZN
         rr6ltU9MOUdBkwh7sDQFB6JLwNmCikhMrf/SJdkEdYa44QQGiTksNRUN7CCObUEasJsO
         00eHL7/VvYiU2sSeCEhwUJtcoIH4kJwOAA/psVanJt/JPRePYaj1kmf6BoXd+Ufan2dm
         76lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=bvMfvmCV97uYODH9N7jFQYfMAHU7cMiiYLw5/2CEWA4=;
        b=WRuTytbYnbQL5Ve1mkrCz6tdKXA5K4+xOQbOKJoOeGDvMJ43nHRfmwokbO6IwPxbu7
         XU1/8mq14KQiTcy7/4U36jFcV2UhHcI4kEst29N9DZKNtbtRoY1wG0Kq3kqAd9sgp2mm
         cS+esQ6aV1f9ESpUnwTYcmlvh1/YEuvDR58SWTVUVd1gAE8lO/GQNSDrDj/1sGcvpeus
         SbL5TYXsfzqK6rjpMM8dp4v/6QYmpabPKak/qh+opVt6W3H2ZRLNqbL92ahQRdfUXd2A
         2AypSt34pw8avgjZ/vM010JDPTh8rNU1R/6pVbM5Z1Q18SQ+whoQ/+cCTj3oIicllDi/
         UXkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TrOvm1/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u8-v6si1526245qvh.5.2018.06.12.18.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 18:02:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TrOvm1/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSuBP-0000sU-O5
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 21:02:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fSuBJ-0000s7-VJ
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 21:02:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fSuBG-0001og-UD
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 21:02:38 -0400
Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232]:43676)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fSuBG-0001oC-OP
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 21:02:34 -0400
Received: by mail-pf0-x232.google.com with SMTP id y8-v6so435209pfm.10
	for <qemu-arm@nongnu.org>; Tue, 12 Jun 2018 18:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=bvMfvmCV97uYODH9N7jFQYfMAHU7cMiiYLw5/2CEWA4=;
	b=TrOvm1/7MFD8p5TsXaBkSq4BhIpzVKVqmxXzJ6bN/1yB8tE14aoHeS9uMJ/I6mSStg
	yIEDu0VJRTiaZe4VUKJ2LX/HU0BSEBXTJwPapSMeJNAilhICiddcx8HHCHaCPGPvviDS
	5hZ7h5lZclWW48zZKPEav0eaLUKbcMIHWiSVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bvMfvmCV97uYODH9N7jFQYfMAHU7cMiiYLw5/2CEWA4=;
	b=uQKuaOCsOxY5/I9wqFPYRAU3NPaonCbPHd61wReB6x2tmN2XT+41+c2iicCtay6V26
	IspLeU/RwjFJly6RMZiURtixfGxT4fKsMGLjX+oxsQNi4JKNmANEkQPWFzsd6yFPKxGR
	5fxcCaN3pP6HPOaR+BYNg9GeReMe18aIcJzB9GiP1MOHukrWhvY6DUUdc+IG9kD/w9iM
	nnT9NQLwdJqEjGkzF6j9ZbA63++iq7B7Rp/cv3nlSOs8lzoK2pdq6MHJguboQ4aKQuYI
	jrpL9dBuHq3nUjVtGZJt4AAvdVDQRBhmoLcny698XDD/545hwNlINJl+TqwGIPHS0QQB
	UcFQ==
X-Gm-Message-State: APt69E2GNzxThsdYeUTNNqGKu1XSdrmYPyVbn0ZkiBuajbwEv25+Fn88
	YGSLBenKEYANIKZPA4PgMgTOsgy3Cno=
X-Received: by 2002:a62:2091:: with SMTP id
	m17-v6mr2648903pfj.110.1528851753144; 
	Tue, 12 Jun 2018 18:02:33 -0700 (PDT)
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com.
	[173.198.77.219]) by smtp.gmail.com with ESMTPSA id
	y20-v6sm1147128pge.46.2018.06.12.18.02.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 18:02:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-7-richard.henderson@linaro.org>
	<CAFEAcA_z+UmmJcqzqtq7RiPnEZDLwpfESQbP4ajRZLFLsVKmqw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3e84080f-f7aa-a029-bf83-ca001f1cde5c@linaro.org>
Date: Tue, 12 Jun 2018 15:02:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_z+UmmJcqzqtq7RiPnEZDLwpfESQbP4ajRZLFLsVKmqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::232
Subject: Re: [Qemu-arm] [PATCH v3b 06/18] target/arm: Implement SVE
 conditionally broadcast/extract element
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
X-TUID: /5fVP3Gxg4kt

On 06/04/2018 06:46 AM, Peter Maydell wrote:
>> +    do_clast_scalar(s, a->esz, a->pg, a->rn, before, cpu_reg(s, a->rd));
> 
> Why do we use cpu_reg() again here rather than just using 'reg' ?

Fixed.


r~
