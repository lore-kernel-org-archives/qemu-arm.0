Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2735639wru;
        Tue, 17 Jul 2018 07:29:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeXA9/RqyAK5+oxHNOXE28rsRfUVGbRvDU0OwLXmYnWc8+Tc7nicSBBP7roCXK9wEcuY/l3
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr1570233qke.12.1531837788110;
        Tue, 17 Jul 2018 07:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531837788; cv=none;
        d=google.com; s=arc-20160816;
        b=xZkdFPUvnx1uN2C8T4UFrW1SuNInZwH/isoCydbj6hVGhi31V1IhC1hSd/2k4lUMai
         oNLL4aLri6U8DlVxnHXFa9SO3W+Gg7MaCM5+D4h6a2MFZd5WJcZx9FzcasxltprdU7un
         J9a09tmfmLUYn2VwZDrKHCAPIOWxny1A3NRA0nMZQs/ABztqzaQdcAyepkQvyBjue3p0
         HYz78R3NMiwjlibbWbJRG48x7R89gu33XDZNJeC1D1OFdmb+stxvTMtrZ6s6qkxM8087
         BCGYNOB3rHq+p0dWmgKdyjhPD0Ix8yPt+WiJLAnoFtDkTu5yyGHYilQTn+OCXaA2GLXV
         WAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VHv9jwq1J8sgXeKwxjnCNoF3u2b8M95IBJHhwKAKHMA=;
        b=XdLAw0ee50Dcmue0cjUTw2qzHTT7BZHoFXNa6tJtJt8HYpFVv3ZAPKcpAFBU14RvMs
         xzcuO1FJ/bF9nJoZDSnLlyri6FTCDGIbtLhGXRrQqKzapmg7exvWq18Tm3pL6FJfbsbD
         FUYzMghqo+uxlWEmkNllBQXe9b7IWt3BzG5jAQ5sALniiDw3W1D2CadbLdHRUh7zol0V
         00XYGrku5R3xGAEk8CXZ5iehXFlXkujBOwtOxbm7f03GHhrqVg+LUg54xFKJpK84QznG
         hKo/I+z5m5l+GSNKCvL22nurP0rMfvyKZpKmvRwImgU2o+TtcegknCy3xyh7BLP2JuPp
         EyUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UzA6if8M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b186-v6si967358qkg.62.2018.07.17.07.29.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 07:29:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UzA6if8M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffQz5-0003gx-KA
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 10:29:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQyx-0003go-A1
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:29:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQyw-0002jy-H9
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:29:39 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:37209)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffQyw-0002ji-B6
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:29:38 -0400
Received: by mail-oi0-x243.google.com with SMTP id k81-v6so2388865oib.4
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VHv9jwq1J8sgXeKwxjnCNoF3u2b8M95IBJHhwKAKHMA=;
	b=UzA6if8MMhU3HpTfaPd9D5f7doKpEBUezt5L/6nYQCTs60Lh3SZsZVnKQxcxGYHEgu
	CsYeozN3BKS7UEGGB/IAMgMJ2FcagFAVHCjKDICCJaDW09PC2X1bu+BgxV5UPXeXX2g2
	MCwMg5WwM0bZJ88qdBEUWVa10PFZGBINxYPas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VHv9jwq1J8sgXeKwxjnCNoF3u2b8M95IBJHhwKAKHMA=;
	b=Zw8tI6sm7snY9tlt/N38QTMqqx2J/xH2x8+LSz/B2yvtfOJR8694CaRXguOTcCCQWK
	Pfhy0faRo5C1JmONbM3ijqbDRLyGEyksr992pLCduEqcj3p1mvgSP10eBHBTEMb0GBZk
	6BbtqOjobvQmVrrHWGF2qmibRbRHAUPKFsYvrKXlC1SfuRhSN6n7cyx7vGQk+ZoqTR24
	SwLEY2wkxkjWsPvDYCqdI2eggcPWGw+41qdDocFaSJmQnmoIbn6eNe1ahvoMR4OcHETF
	rMCFmJPdXI5djmdGMZDbabt0wd+2pQDVDxepCBx8uj4KxehN573My0DiPbCpA3FT9DOs
	/JFw==
X-Gm-Message-State: AOUpUlGyblDh4xrZGpG/7gQ21tdW0sUP4GHtBKtuPHbQMNQBvyIfYzrH
	o1qZs0sjBWfz3pBRFGQC6WoJVycGnVml4LITbJcxzXRE
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr2023093oic.252.1531837777776; 
	Tue, 17 Jul 2018 07:29:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 07:29:17
	-0700 (PDT)
In-Reply-To: <20180714171601.5734-21-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
	<20180714171601.5734-21-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 15:29:17 +0100
Message-ID: <CAFEAcA_830LCj6drri3fOe+4-T5T6woKkXxx+UcKX6jihoVSsg@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v4 20/20] arm/virt: Add support for GICv2
 virtualization extensions
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tsAOTTem9nra

On 14 July 2018 at 18:16, Luc Michel <luc.michel@greensocs.com> wrote:
> Add support for GICv2 virtualization extensions by mapping the necessary
> I/O regions and connecting the maintenance IRQ lines.
>
> Declare those additions in the device tree and in the ACPI tables.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
