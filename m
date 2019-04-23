Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3740672wrx;
        Tue, 23 Apr 2019 10:41:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwsuCQhsKeedngpG3T+Cm4WFWVyOYZF9LVRrTQUB4bPhggU9+oOAxdxZsQKNps+Vo2ESF57
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr3143841wmg.56.1556041279138;
        Tue, 23 Apr 2019 10:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556041279; cv=none;
        d=google.com; s=arc-20160816;
        b=PWgARFCDAEeRxb4Wkf0KXraoedpe73IJ27XDT5TgemVeJmLaUvjhuVUFnkP7131nnr
         n6oLiDxpKecV/V0TaIOqc27YlGJ26r+zN4U+OV6TgKk8YtdzpFVQXjjvTFWrs8CipdzS
         u6IL4P9XBDlWW7Vjgw7eYDITJcR+Goe2r6pSxty68+vtqvPsoMjcRkJ6ryw8wIDeqq9f
         zbKa6iOxuaXpmIgiz1qZoLa7x0G1Ij+7j/OtrEYmOH/LlzXkGmhHKEDz6RvjuqXs/6xQ
         MUBU5KE7EAgekVFQZWXx1q9Q34m4XGirJbZ9HVnicSrlGQxAgY9qXgRsdoWyiNmLO3A6
         HNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=pC0154Hk3Y4HACBlKkbl/Ou3KBw61ouOIbGHYbIDtbM=;
        b=iZ8u5fsaFzNuf6ioOgt2bMv+/r4LUJpCwdck6Drnb2A/im6eUNgiK1kaztUWZ7fUDX
         VWkz1X8zoAqvdy516xhSSx7SJnd3sJiTOMnM7E3heLI5I8fTmgI29xaAfNXf5J2YRqmL
         h3vnpnK+Gq4//Hw4ZZm9e23+RBjicpS8bRteYJgHd8JGYbrRMw2TdUbTT5SigV5Dw7uW
         ItdgCHqHCaUMLJgj4iPp9oRtKpy1Zh5vI24Yownheyk/B/XjaC82IMujtGJUNz8sXJO1
         K9zQpvuFzgzpwShFxO6MFoLyqZfX/3llP2vnma2wGg7bV/ywlhnArbfTfNO4NBZlT/jE
         896g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oncAmUps;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si11405188wma.151.2019.04.23.10.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 10:41:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oncAmUps;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hIzPy-0002ug-6k
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 13:41:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hIzMw-0008RL-ES
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 13:38:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hIzAy-0006zk-H5
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 13:25:49 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hIzAy-0006de-9M
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 13:25:48 -0400
Received: by mail-pl1-x643.google.com with SMTP id o5so3526561pls.12
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 10:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pC0154Hk3Y4HACBlKkbl/Ou3KBw61ouOIbGHYbIDtbM=;
	b=oncAmUpsuhqAt2kALODjsq1r1vbkefo4/nXf2bXfsHlAfUmBWMvkWifg6/oeMJYdtU
	yqvzkrUtylXsBaGzj+Yy/gg2gwNPK0kGYYGybDm1SsaXGq5JInxOCKIslYXOSvmOpml0
	kmV6/02trQXTcbDLww4r+223iw9nKWUSlMW0GXX43hn/i+NyvWVXUt6mg1v84cfhV7d/
	nrCw5kGKbQzz11DFdlr0GBFxDLSNAtY85QzfFhtX6tDOv9cxUZsyjQDh8+KQALQdYMTm
	ag8/faJq/9tW4br4A/fYUPZOR92K4ZFdbQuB2bjzUl+2vLhcEV1jc8PxSiFa5RO54ZV1
	gAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pC0154Hk3Y4HACBlKkbl/Ou3KBw61ouOIbGHYbIDtbM=;
	b=WGUTUlgu9lvfIr9Mf3eiHhhLljK8TSxoXb40I3fF56azW+UbHGLUGv5/hiGj4PnBaW
	DxapukbmpsjuSb8l/viDhBnfpFmtLp3QgsgwiVyskXjSIYOIn3lcizLhYFAL3fmHMZq8
	jTegL2DL10uu9LsS3ezyy0rFrXFyqli3Fzs9+OZAaDW4sri36se32tORkzwGUFknJ644
	xJcCSC22G896ZXtkaBjkLqJ49VoSanrD3FgBIMwHwpgzOnfGZHHx+CcoBOmmU9EO8tdg
	R75Y4tPA8bbmSHtXXmHj2nI9HF8y12ZRU/Jo1NwpMym5xkySgDMcfNxnFYx4Tk0ykxP8
	yIyA==
X-Gm-Message-State: APjAAAVMEs7T9UahNHVNIxrumQYk9T+inTkxIt2Kddhdb09jmo45wz4n
	nFJrS4JXi6sQfiah4k0hClulxA==
X-Received: by 2002:a17:902:521:: with SMTP id
	30mr26598823plf.248.1556040330635; 
	Tue, 23 Apr 2019 10:25:30 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	i15sm23114140pfd.162.2019.04.23.10.25.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 10:25:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6b64b6e8-9099-7410-2e20-ce2dba7c0506@linaro.org>
Date: Tue, 23 Apr 2019 10:25:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/26] target/arm: Make sure
 M-profile FPSCR RES0 bits are not settable
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a0iy01x2fjHS

On 4/16/19 5:57 AM, Peter Maydell wrote:
> Enforce that for M-profile various FPSCR bits which are RES0 there
> but have defined meanings on A-profile are never settable. This
> ensures that M-profile code can't enable the A-profile behaviour
> (notably vector length/stride handling) by accident.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp_helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
