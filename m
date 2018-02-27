Received: by 10.28.71.27 with SMTP id u27csp4923622wma;
        Tue, 27 Feb 2018 07:07:28 -0800 (PST)
X-Google-Smtp-Source: AG47ELvBdH8fAp4Z/7dRAJExfHvS9pvOLy+bmizNXRacoZGq8V0qpA4zTvhfgxFtqZsEwbTFW862
X-Received: by 2002:a25:9381:: with SMTP id a1-v6mr9423515ybm.506.1519744048544;
        Tue, 27 Feb 2018 07:07:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519744048; cv=none;
        d=google.com; s=arc-20160816;
        b=YbiEtQV5K9iGCl5b0Ks9Yfp6MjI3OZuu9a9Eq06qwNgGjKHPcyUPZ7oi4/cd7iuSy+
         hjBnw8dM4O/Z2EpkPyEZOdDCJP/MPf05arDs3hEPcXkRb83q2Bsx/FvyjOxbdlzyyO8W
         nRhyaImVVX0RfVE1oRiCjdQGbST+7+N30QBilD1Lgit02hZisYVfoOlt2HPRQytEcD4d
         uRfTTcW/HzsKFd4EJ/+8Ddd9YK2uA/zZsoQNtNrAAC7xHmvh9LbaJncXGWdTvCZ6fh65
         3FZxTw3bRKLLKEtYlc59iUh6QqSk3iVBNKpb3jk/7OrQ507Nz5Zdr0h4w6/13Mu3IKg0
         hc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zTU7kYgluRl09ErR5VXuzvSmFB8+AfGc0DU7+J5MV9A=;
        b=elxSApJDWks+E28Ki/9lD0ReeMFG+TcW5VkhWe+BZrpfAoHcO2/77fIvEjCBOBR7TU
         nM41ICvL16WLAu7LxMEdj/etiO4B1g1rRvI4hvwLvziZ6QRFvMQnESn/vdT5Ge/PivL9
         XY8VcsT/pZcxGJFOFyQAn4yyqW/V+6+nkFgdAkAXKzoOQLzRkEYa6bv6GmouUsI8LfEU
         rE16WnKxO3fBb3k3evU51rco8NkmpIrPD/rndGVgZYQesphpnqdlPSI2tM7uq1BCqB6y
         1dMsgwRXcLRLZdlf/ubGegUsoxrAV/aY8+q/0bkpo94johIkGEUnRd784vDM4Fq91W+h
         NFXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U4MdgkaX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z63si1926591ywb.158.2018.02.27.07.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:07:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U4MdgkaX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37871 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqgql-0002h6-T3
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:07:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqgoX-0001NS-AJ
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:05:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqgoR-0007En-Ik
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:05:09 -0500
Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230]:34594)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqgoR-0007EL-Dc
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:05:03 -0500
Received: by mail-ot0-x230.google.com with SMTP id n74so4056081ota.1
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 07:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zTU7kYgluRl09ErR5VXuzvSmFB8+AfGc0DU7+J5MV9A=;
	b=U4MdgkaXQEheMzGFXQHYfsuoe2MXdAlZQKU3oAAkKgTvzDuz4kgqxznpHojerIpLjm
	gqizIU2wbVXkn618flN1v66oRbarsC8jpSpZ/6qs1I+mrUq1mN/Sfb/c0MPwFqIIA95E
	r0UWyDxoFVSnttnzSDUZNbgMqVpOTmIdXjVPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zTU7kYgluRl09ErR5VXuzvSmFB8+AfGc0DU7+J5MV9A=;
	b=A/ee3QbUSX+yXUUaaiCdh1UQx3X/2udEABK1oO4k2HcC3Rp07oNEAw6aLV5VBH9kC5
	83cWg5GC8EI4trNa1/Zp9z/mP/SatPyIS7BT1VbKTZEtLoexV2MbTTle4QlIKmzV8+m3
	Q1t886yEHIDxUOl7AllnVnIz9AEHuqM5YFeQoSjzt2c5eBdc/cwSj1d2tzKAk8AEY9RM
	lrwU4t2lUhBsrzwu9UW5JMrQNIOmf72iX8D/5GEhY85uUJd+rcR++IY9UPh6ui0/RcPH
	XlnGQzkDQIBpvfU4vT4bQ96LZfYCXYx5IF68OjjfCd+dWrguGe3D6wutdsJ5w9zE/YN9
	o6NA==
X-Gm-Message-State: APf1xPB0MYzTkpvWlljsCUeYhHKT/KWC6HDNEMYw5s/jc4KpJ/l8igTp
	Lcnoo6FDycOvWWS1MQddzR1IHVB+a2D3m9kRm6CV37Me
X-Received: by 10.157.72.231 with SMTP id a36mr10810970otj.308.1519743902622; 
	Tue, 27 Feb 2018 07:05:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 07:04:42 -0800 (PST)
In-Reply-To: <20180217182323.25885-58-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-58-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 15:04:42 +0000
Message-ID: <CAFEAcA8gSuzccqLz_SG0w-SBwqq=pf2Y-P9FbF3fYVDsv6s_CA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::230
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 57/67] target/arm: Implement
 SVE floating-point compare vectors
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 36HFtq8mlKM9

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 49 +++++++++++++++++++++++++++++++++++
>  target/arm/sve_helper.c    | 64 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 41 +++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 11 ++++++++
>  4 files changed, 165 insertions(+)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
