Received: by 10.25.44.15 with SMTP id s15csp5574437lfs;
        Mon, 17 Jul 2017 23:39:18 -0700 (PDT)
X-Received: by 10.55.100.67 with SMTP id y64mr151084qkb.246.1500359958371;
        Mon, 17 Jul 2017 23:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500359958; cv=none;
        d=google.com; s=arc-20160816;
        b=KcXbBNA9HmfFAlnc2BOcWjLwljqB1Xu+qdFPcgJg6KLQutGNr5n+gPk80CEduRYod8
         hUniBTe0DBeYfTonLClVpPERJYQJnghUis5BRRu8wU4a+PDRSzrnVJRSks6+56MPH3o8
         85yMvsowddK02TEADLF2oDGAdKKOxwh4Z9NhXU7qb9ppGpxWp9iKHqf95loNxic/8C2D
         84jA8uV2HC28PzngqD/NGQWK8T+S2Vpg/QEH1c+6VXccFJf31kyao7C3pVUkcIO/WEsQ
         iBUwfJJ68q4GO8HkFSGNtzCyUrICj86zG7z5e0spoCMfqaaBXIROeoPZJrf5zzQKzYBW
         NZYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=q8ncRtp4fHpHGfK2/x6U62XOowG+2cs0Yi5BnHBtmCo=;
        b=goJOUII9f7zubZdXMSRQwlwMpmVATTGrwQzt2HJ+zSOurDbYcM5pfGAfVSD0dbHz0c
         MTY9H6lwvEIqtA8rmzRzBMRsDcZ0r5CQRZT+Em6SeA0idhXPM0D2/kRtd6SdnhCGMwOi
         i70/YuSEoaEsaM31c7Tiyiw4Lrp5HNkmmlNU9sMdY2t8qMWI4cg9zL2PNh7OG3GSfSLc
         JgP5hmegBl1p+JeUC5nNIHOWg7KN+Aj+u0dcSdlJutHLpp9eD2VxXJzs9WxSo/x4ygRJ
         Nzi4jmmVTelT8kmU90GTtKMK6GttGC+Q0vaMzZRRjIrIJtK1sezcA0BMCs85ljbUgxj6
         GopQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=EnyPuSh/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si1320851qtd.274.2017.07.17.23.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Jul 2017 23:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=EnyPuSh/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXMA7-00027y-GH
	for alex.bennee@linaro.org; Tue, 18 Jul 2017 02:39:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dXLwy-0006MV-An
	for qemu-arm@nongnu.org; Tue, 18 Jul 2017 02:25:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dXLwt-0005qr-AZ
	for qemu-arm@nongnu.org; Tue, 18 Jul 2017 02:25:40 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:34541)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dXLwt-0005qG-51; Tue, 18 Jul 2017 02:25:35 -0400
Received: by mail-pf0-x242.google.com with SMTP id o88so1561134pfk.1;
	Mon, 17 Jul 2017 23:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=q8ncRtp4fHpHGfK2/x6U62XOowG+2cs0Yi5BnHBtmCo=;
	b=EnyPuSh/c0IFvd/hqpOzZkfWzNLe/GhwJws62eVuk9JUBmhSbn9s6J8fqkDT7+orDA
	8kowOh4ECGud/tNIwZnsCYJhoJzeKK60/TB336PQayP1FRkRsoPP5DQLCLv4l6zRq8s0
	U7IvrdYxqLrXZnmaOD17MzI5Twi2yhdEb2RoTXZ+idTHgJUm9pSSpaMsCFRlt0JNH4z/
	omJmwQS528ySoVY2QWfXhnDTYNCabytcFm2XfjNntODCwZ4+V6ZIOukYv26fHbN68JqE
	utmc7xk5wQT4LIX0zqYSMG09x+83xD4A2NGcy1hQfl01o6Ejv2B1WyPoANZGdT85KTTc
	AOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=q8ncRtp4fHpHGfK2/x6U62XOowG+2cs0Yi5BnHBtmCo=;
	b=bKQL3rCINUDZrBBG27jS1pp+z62tvxWdycDcBctUjoiFWkibFI8kKBdSSSEhW1M8+N
	2P8Pwn/RiTnrs5rR1Z04BkYwWQtFFW7PPTnomgmroaJxLtbTjarlW18Y//esEC9iY7yh
	wbPU3P9wzoCrE9BXdHR3pQsxrLRpLHYlDSgLmnHjGVULGC86FDNz04K3mAteDozBLLOe
	er2f7h9SyicNRKjif8ND4623ZIenvtCKNyNGx6xO//IgYKYPW2bDJf7N7lEfzlYvlPke
	rFVKOw0yWm4oqSCJimaOVdPWAM/x0IDaJkl3zU8/jj6H28YpXB/5o5PVlRXoOyzqx337
	1DDg==
X-Gm-Message-State: AIVw11390xbwmr+qExC92IkDeVPcC8TdVyCMosVlE1xFuzQM46OCZohe
	nedAonOcRvDMcQ==
X-Received: by 10.101.85.206 with SMTP id k14mr56391pgs.153.1500359134250;
	Mon, 17 Jul 2017 23:25:34 -0700 (PDT)
Received: from bigtime.twiddle.net ([101.165.234.197])
	by smtp.googlemail.com with ESMTPSA id
	r64sm2469773pfj.62.2017.07.17.23.25.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:25:33 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20170718045540.16322-1-f4bug@amsat.org>
	<20170718045540.16322-4-f4bug@amsat.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <628617ba-12f6-97ad-6818-1d7d0c63f558@twiddle.net>
Date: Mon, 17 Jul 2017 20:25:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718045540.16322-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-arm] [PATCH v5 03/10] target/arm: optimize aarch64
 rev16() using extract op
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
Cc: Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5HvKms76fGEG

On 07/17/2017 06:55 PM, Philippe Mathieu-Daudé wrote:
> Aurelien Jarno denoted this function could be implemented more effectively using
> the aarch32 rev16() pattern.
>    [http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg03180.html]
> 
> Done with the Coccinelle semantic patch from commit 58daf05d07dd
>      (see scripts/coccinelle/tcg_gen_extract.cocci)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

I'm dropping this patch and replacing it with the much smaller code mentioned 
in the message quoted above.


r~
