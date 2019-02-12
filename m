Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp655028wrp;
        Tue, 12 Feb 2019 04:18:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYWbPAZp+nnwUWPr4FhhDiqkaTXPQa7RkyHIXShj76YEW+4VDMys3CFp+97REatejrQCEof
X-Received: by 2002:a81:a87:: with SMTP id 129mr2535205ywk.195.1549973931351;
        Tue, 12 Feb 2019 04:18:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549973931; cv=none;
        d=google.com; s=arc-20160816;
        b=L6q9NUeBJ0uuAk78vW2zJ6hzZqspJ2iNfzQP1t1+Xbs3VrWbOcJyi8TC0uNmU7MCOQ
         23aINiby9aSCsGryHP/c6fiSMZk3GUYXM/Ucmj0DjxecQNP/SJZdecYfrbzna9fYpg9O
         lC3MmSuBvKYwpUtEFkX0gGX3yyTGVCmYhSLz9Y7D+DudbtHIgSozXh5uEvWkJpSq9QTf
         z/LoCnba34jy5OUtAAPY4v40IegkQBkRE9GfqxdBuCY0/jkyPk4210OIsUdAb/lye5pz
         i1r9yB4LRoIevrInj+MScJ5VcLitQiGjgIXWZIRQTH9jhf2VrBDzFBmFW+UvBrMgJoeA
         xpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=94FMUhROVSL7ss+VoBQ5p7HqGvhZfzS2s68kaBwpprk=;
        b=mG8bgs/VzIA/0yZcBoIrrEAQRRBuHovx+6bBfa89/T5UKiW7+KWjfub7idiWrYG9wT
         AiGxmH5UA8Y5LCe5EV5nTAFNMkjgR2sJNaN7sMTzQKDNl6KEvsa5NvZUtzc4h2VrdM9i
         ZZ9l1IzaP9kaFLslXF3QH3958YBm9020+bRSCwaqz6zoaWUmZdCOV7x0/mzEX841qmF8
         tQ/cql8jOPIM+xRZBz1du2Y8921IzRpCj7xqFzLvjJRPy16wcVQj2jNbgIabcoP211CR
         wy5FOgWAe38fGM14qKeHs3IHbosbwiRuLdXvNsaPCGQ1xELv3MoW0OaAiCK+c5yuLXdP
         CYmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i124si2001877ybb.90.2019.02.12.04.18.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Feb 2019 04:18:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtX1W-00035L-QJ
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 07:18:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtX0s-0002qD-UH
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 07:18:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtX0n-000110-4n
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 07:18:10 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39927)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtX0l-0000vw-3U
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 07:18:04 -0500
Received: by mail-wm1-f68.google.com with SMTP id f16so2779393wmh.4
	for <qemu-arm@nongnu.org>; Tue, 12 Feb 2019 04:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=94FMUhROVSL7ss+VoBQ5p7HqGvhZfzS2s68kaBwpprk=;
	b=Gq6E6mS4knH0PiBIkWBfg/+FdhJWTnaeLb57G1Y21s8ww/0lD3uUgWF6L5mnureWWG
	LlD8MjMNPuZ4zUFAJ3Z8Zw2Qw1p9eREfjaM0fhTC+0s5IWTGoGIjGCx18nI7aEdkr/v5
	/QN2aQUn/DdVurMLMWUeMUx6UbtDlJTxf/OvwkEgPl59+0qXFZVf+2OK1zwlASC/xwah
	nNQUykGdEHPONoQ37CnW5u0hma244rG5WKkY7AEdV7RF7WYdiQUq5Uu+qcghpl+fqmGN
	5ySU9fMqHGoRgZUVPNPy/0d03ZahqpzvidSuZCw2ZZbNwZPl4P1MfYc+eW4V4X5Kk6NM
	k+pA==
X-Gm-Message-State: AHQUAua3UgBYXILNDbzoeaWOStnFUZd1OFID+f5XgOrHWTUx8eS81VvV
	XZBt7W/HdKBMKUp/1aZy73JF4w==
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr2699420wme.135.1549973881405;
	Tue, 12 Feb 2019 04:18:01 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10])
	by smtp.gmail.com with ESMTPSA id o2sm4233449wmo.33.2019.02.12.04.17.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 04:18:00 -0800 (PST)
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <20190204231815.29661-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e3dc8b86-6f4e-97e9-3ae2-81d996850fbe@redhat.com>
Date: Tue, 12 Feb 2019 13:17:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190204231815.29661-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [PATCH v2 00/11] hw: Remove "hw/devices.h"
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
Cc: Jason Wang <jasowang@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N2jPUa6Ez3V6

On 2/5/19 12:18 AM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> As his first comment describes itself, the "hw/devices.h" contains
> declarations for "Devices that have nowhere better to go."
> This series remove it, creating new headers for devices covered there.
> MAINTAINERS is updated.
> I also included 2 cleanups while working on this, in "qemu/typedefs.h"
> and "hw/net/ne2000-isa.h" header guard.
> 
> v2:
> - added R-b, T-b tags
> - addressed many review comments from Thomas
> 
> v1: https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg00611.html

ping?

Since it is mostly touch (old) ARM boards, Peter can you do a quick
review and give your Ack-by, so it can go via the Trivial/Misc tree?
Half of the series is already reviewed by Thomas.

Thanks,

Phil.
