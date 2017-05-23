Received: by 10.25.0.6 with SMTP id 6csp1872695lfa;
        Tue, 23 May 2017 07:51:57 -0700 (PDT)
X-Received: by 10.55.22.159 with SMTP id 31mr24631230qkw.184.1495551117463;
        Tue, 23 May 2017 07:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495551117; cv=none;
        d=google.com; s=arc-20160816;
        b=jMgkKc6CvbMmliXvHVzT4GR31PtRjhBFe1gXAJLoagXL+3reiWl261HCg34oigV6Ux
         J8XpfG3CD+Gr3FMJzu7UuwomjSUI6DPx1SeNr5RrosXXazLKWFL9kLxHYZtE7puFUpnB
         vBpGda3jO2pIwMGlHg9ZThHgaV3mqjhXYk3Fy3Lg1vm7JAmSnQgoUVuu+kfJtkeRJQig
         pOuV+pV/aiI2tQ2FrckeZeNv8BCQDuNXUneG68LOAINwrFjzF63IM+YpHhoHnXfOMQnR
         CAachWpcr3oG/b24NVVmN5Pwf8GNhEFlH1mr3PJABlsxf499Usq3baEh81byjjuahXB7
         pobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=JopxQtT+Lk6fsNnYZfpbA+o4TFXibbkUMOcpOSHkMW4=;
        b=PgGlDvjUBwkWpYVl1XfuYNWyVESpd8h1+VQEAAsTCY/yOC1kMTtxodGnJ1P54+v/9h
         MeHaljkgDYUdGaCrc0RSGtoqpvv0kw8JtzM452RAmzwlSWtviaala9DpgekY2xzO+tdG
         wZP01Zy9IsF/LKo2tfLYydRqBKGOmjsjW3G1OmpIlKal4hmbT/xCcS6GmLA942XlFgw4
         CNBwooFeX4BcEWA+nxtm70RFiRdk3KrK7JRsxNEHznLk6K04pVV2WB1oEjAxMjyFX83b
         wmWGuU/UCcfAVKzlxj387qwTZFya7jmEMNXgVrU4M7W2lZD5f9XfaS4PVL2Bn9v5G7ve
         eDSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y54si21417190qtc.329.2017.05.23.07.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 07:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dDBAC-0002lS-NK
	for alex.bennee@linaro.org; Tue, 23 May 2017 10:51:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDB8h-0001YD-D9
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:50:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDB8d-0000Xs-GS
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:50:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dDB8d-0000XV-8q; Tue, 23 May 2017 10:50:19 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7B9E74197F;
	Tue, 23 May 2017 17:50:18 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 60147437;
	Tue, 23 May 2017 17:50:18 +0300 (MSK)
To: Luc MICHEL <luc.michel@git.antfield.fr>, qemu-devel@nongnu.org
References: <20170428125632.5704-1-luc.michel@git.antfield.fr>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <57594c43-eed4-c7c2-2efd-05872dd67d5c@msgid.tls.msk.ru>
Date: Tue, 23 May 2017 17:50:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170428125632.5704-1-luc.michel@git.antfield.fr>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-arm] [PATCH 0/1] target/arm: add data cache invalidation
 cp15 instruction to cortex-r5
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yANt9fTbCzt5

28.04.2017 15:56, Luc MICHEL wrote:
> This patch adds the cp15, CRn=15, opc1=0, CRm=5, opc2=0 coprocessor instruction
> to the cortex-r5. As stated in the TRM, this instruction invalidates all the
> data cache. This trivial patch implements it as NOP as cache operations are not
> implemented in QEMU.
> 
> The documentation is here:
> http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0460d/Bgbdbdjc.html

Applied to -trivial, since no one else picked it up so far :)

Thanks,

/mjt
