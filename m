Received: by 10.28.71.27 with SMTP id u27csp590157wma;
        Fri, 23 Feb 2018 05:27:33 -0800 (PST)
X-Google-Smtp-Source: AG47ELt4xlFW7fo/udMOebiHZk8UhucFVQUU8OCqE1NN61qEy7sZKtFPILrftYVhblai5LHEx61n
X-Received: by 2002:a25:2b06:: with SMTP id r6-v6mr946345ybr.406.1519392453533;
        Fri, 23 Feb 2018 05:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519392453; cv=none;
        d=google.com; s=arc-20160816;
        b=MctkoSjCX7HILPVzKUlR8ip0MQSVVpd3Ef13Agldnas/n4TGBnjTHPTNYLUEaiid03
         JbDR22AjV8hvvJAuwUAxaIj/L12dpEaJfkZkJ2dYMdJkMnKIWIAi0RoGC6Gn6b8P5Cpq
         NmuC7icBhFqoJjmEzh0oft6wgvrRMrSGDZlCx2DtGhuhS+rxw3WT4LBNSaGQSUsuTz3v
         4L9KLbib4Uyb7t8NsbXofFR++TJfsNlpfDLVhmB1I5Ymynuk4jfq9KpTFn7kIVxbyB4c
         /BWnCTBtICjTDOoNfA4BP/tp9IN40TuaBukM45x6iY72mHJLeEcsGQFCEDHi8o835yJJ
         ZyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+UIBdxV9tCwX+N+VYDFPgBh+JQyPl3bbqK9NB835Zko=;
        b=xMXZrJ7+t9bwLglkJzuPaQzKEn0AfEhVL/eV7gtgxEWQTsxCCCnlWlNtmel13BIMoP
         eKz5L0DKZm4IrHB5+9gre+i5vKhepuCzjx+iQt9WNCkyGESxL4pdFwVZBbmpYpZHAI/q
         wPJy3UHbD2LhaS3CBls584ocYFPbIPibu9rQCk1EMAfa5vxzAcgitTWcmqj0CKE2Yx+2
         /Agc6DKX/AVbvxkbByL+XnZF9hnH1XFEC2ZfOj5W1ZWPia0TqVa/k3hnuOeb3nitDOBK
         KojWFXRhh7HxrYPfIkcD1aZHbjTXiOmmKrGrJVdP2HGHwIsH/22P8UaI9XR57K5rgaxh
         OS/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hObZPaYn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n136-v6si394338ybf.723.2018.02.23.05.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 05:27:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hObZPaYn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epDNs-0007Db-RN
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 08:27:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDMI-0006HZ-SI
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 08:25:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDMH-0001NC-UG
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 08:25:54 -0500
Received: from mail-pg0-x22c.google.com ([2607:f8b0:400e:c05::22c]:45198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epDMH-0001MZ-OZ
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 08:25:53 -0500
Received: by mail-pg0-x22c.google.com with SMTP id e11so3347247pgq.12
	for <qemu-devel@nongnu.org>; Fri, 23 Feb 2018 05:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+UIBdxV9tCwX+N+VYDFPgBh+JQyPl3bbqK9NB835Zko=;
	b=hObZPaYneMELbwPsMYJvoNt+JScvvAqoh2uqKMauB4oXjBOQPC2SwVDaehDggEQtvY
	bw2Pz5bIeEIVPFpfJer7ZwOmGqLE5+vf4VxPpkAbMmj+gaV/3iWdW3Fh3sM02K9J04PN
	bH/GXOcOq2fPWLRyEpiDVk43Effdxnp1kVmiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+UIBdxV9tCwX+N+VYDFPgBh+JQyPl3bbqK9NB835Zko=;
	b=dWRvXY2C9wtWfRGu2xjAsSm7MTaFmgTihI9rK6vb7PPwMpmrjs45r/lydnfiynrD2X
	BjIMSihLX8faMXbScqY3oOMtZAjuVAYYCH2oAYyUczmyxCTFQNzHonW8yxVM/fOhbBEu
	sI68q3t8Gom2EyOl86pzKjpE4LColelEHeieMaYojOvfp/PdA2jTQ7kzQckIGQyh1e7t
	Liaxr5ZCbSKIcksf9SIH+tXPtk7DfZvv6AH2qXAN+nuBxnd7DB7yOj1YW4R2EwiMLoQS
	+1e8s8k5iW7ix0HHG9QQ7G+781zsCrodiz9TRjeNdc5RMFopP4MxBw8f3hGrKqNyGwm2
	2qFg==
X-Gm-Message-State: APf1xPA0cmYpyUPHWM4h00CLlkpvBR0sSCCEKTXV0fd5WpT56Nvq6vxw
	BPnIfENYkU+GVLybw3OZSafD4l7jhPe6RA7p6S9pDA==
X-Received: by 10.99.182.12 with SMTP id j12mr1490600pgf.113.1519392352909;
	Fri, 23 Feb 2018 05:25:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 05:25:32 -0800 (PST)
In-Reply-To: <20180217182323.25885-19-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 13:25:32 +0000
Message-ID: <CAFEAcA_5-Q_or5JhwZSBAdhzm=0wdSK5meA9Bw4v3zMzuU6Svg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22c
Subject: Re: [Qemu-devel] [PATCH v2 18/67] target/arm: Implement SVE Stack
 Allocation Group
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
X-TUID: rPPI1Mwfzvuc

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 24 ++++++++++++++++++++++++
>  target/arm/sve.decode      | 12 ++++++++++++
>  2 files changed, 36 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
