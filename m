Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1531627wrx;
        Sun, 17 Feb 2019 10:15:00 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZCIUxmPJ5hEmTsu7pKaomdr5d4p6KihZmA3kvLlbRlAWKZUvVf6LuI0cp3FQvEcd/H694J
X-Received: by 2002:a81:b386:: with SMTP id r128mr13730928ywh.370.1550427300735;
        Sun, 17 Feb 2019 10:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550427300; cv=none;
        d=google.com; s=arc-20160816;
        b=VH52LvvEiiaznmvG1B42yPuZV9NagyeJvL5IoMWAetdU/gww46AxuKcWSIxKFjUU1f
         R18f2+OoHFfKp3ch8SoUMS2bxSy/8dt3aSY5cEstAKiMbJqhbtqHYZlVynjCccaEWXHj
         8LQ6Qq7388cyE57dADif7a4nF88NBcVWwNTLGgRD95wfY6/a2svEr6Ia5+eSo5ug77Wz
         QNeATfVzDxsrQc4U8CYaFrnMeqwwCAkaXRVuynaG0poc0rNnEYeHbS264fBWvfnbt0pX
         REPOX0/LVxQj4noyZC8LYrM4Wym66trK4rBVGv8BZG+LiIOa2ISPVA/MW7jrrlK36ssk
         8jqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=rZDPvUnmNCmsFDW+G2TUKb3BZFSqbjQA0unVND20cpY=;
        b=zfi8N/ZpDUivvgYa9Op3GzjzfDNxXMoGwvOf74pX0Icf84qxRd/vNxzYBNnD9aupOT
         I2eM19me8b4s4HQHFvAOxgL8FbK+HrjI1y8KgyWsAVdgqbnHNTlKI9cJc4WGqjKpNJC0
         myreOEIdDyPlXhTIvtxdibSxHeMm/Ky+c78x2Wps0oNipAjWjC6ApotnkZeYS5viCZmi
         KC9/M4PalXU9eBk9GCHzNjuaMht+Ea3al2jJuKKtfWG66M02L8VzLS8leq0Jzif1YUu8
         zviowCs4Lp92I0KkokzA/ogDeLZ16NrGuky8jJmQ7ijcF3zJS5fNI3GvNSrU4mmrynHE
         xlLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yCeG7Xh9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j126si4044507ywb.404.2019.02.17.10.15.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 10:15:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yCeG7Xh9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44904 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvQxw-0004jJ-81
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 13:15:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQxl-0004j2-VU
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:14:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQxd-0003zM-R2
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:14:43 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39912)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvQxa-0003vF-1S
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:14:39 -0500
Received: by mail-pf1-x42b.google.com with SMTP id f132so7363475pfa.6
	for <qemu-arm@nongnu.org>; Sun, 17 Feb 2019 10:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rZDPvUnmNCmsFDW+G2TUKb3BZFSqbjQA0unVND20cpY=;
	b=yCeG7Xh9YRF5UnQNdUPnOdeTZK1dX5+k5JsDv0d4QQxxTHL8WaUlnoOBrUEKiwRLxM
	5baloTI8N3+eR35nV+FtHhivOcdYR5t4vSZdD+L+fBfDSAibW7L02pgs7ZCWNE3uMTsB
	jiCUavte5gnMXYNRA7e/SxCglcmXM16hH/57PnLhRolUqrzo7nzPeyw+e9XhgKRs4Tfh
	xSCZs72UX6FitB6zIF29tmTGZcbp3r55ne4saqasSznBaow2SOxy0vo7bEbetovZxwQo
	I5tZV02/BSrGhH0SnDZ2iPoofQvCDD3WZCI92WIx5OgT91UZCD/i+85+m2fZQ6ZxW2w3
	9v+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rZDPvUnmNCmsFDW+G2TUKb3BZFSqbjQA0unVND20cpY=;
	b=CPtAxdqUWHJLTUg08EI76dasofaV6sRtlwycF+jEnwLEFnnq8Hf2MhOKTxAvcgkgom
	XcPN/Wycz9V93hqba+Axk8864eTMPbm2trGVu0EmVrQL63fBlxMPJt0e3z+f8z4rTNcX
	Bb6d+ol0h6Rj/J2zUhAZXpWoJbNrNPCM2mMighFnOL3ws22BH77UicF66dP9ho9f46L6
	8grest2N+rNYl6fD5QBYPbOsvNr9kJMyxLB0u5j7shFXKNhorj8H24LglEgPT6rlXcaU
	qHvvingeWZnOw9IYGo18QXo+XH1bbu0jfWulF0TVpMQ7vOIOsIC+nUH45qsTHYpT/i3M
	ivxQ==
X-Gm-Message-State: AHQUAuYgMIajIvcHSsap+6Yo/CVZGis9J3Tu4o6xp88uAKX0keTrtYbN
	uViuWXHtC/vavcY9+F+y5VZGLw==
X-Received: by 2002:a63:d301:: with SMTP id b1mr15223215pgg.61.1550427266839; 
	Sun, 17 Feb 2019 10:14:26 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	g185sm16902039pfc.174.2019.02.17.10.14.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 10:14:26 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4e8fa2b1-5cfe-152f-8fab-13bb8e3ff440@linaro.org>
Date: Sun, 17 Feb 2019 10:14:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 11/14] hw/arm/musca: Add PPCs
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9PBKDjV+Sx88

On 2/14/19 4:51 AM, Peter Maydell wrote:
> +    const PPCPortInfo devices[] = {
> +    const PPCInfo a_ppcs[] = { {
> +    const PPCInfo b1_ppcs[] = { {

static const for all of these.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

