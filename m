Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1535523wrx;
        Sun, 17 Feb 2019 10:20:30 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYSTWol6o12uE/dByvIICfEqWU7V5cOH8a/brgcungBHJ4yNO/SK2LyXmlq0vorC/0MoNvG
X-Received: by 2002:a81:3244:: with SMTP id y65mr15817843ywy.379.1550427630030;
        Sun, 17 Feb 2019 10:20:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550427630; cv=none;
        d=google.com; s=arc-20160816;
        b=givD/Lbf4mVjWnH2TLHdeQt4KswTPcblPX9YkyLzQQiYRLmlAXf3WRnzFCWcbzFd6J
         AHx7S5h/TUg2UBfVt7B0W55Hj06ne4zOpK6S1CYp68o7vypmcB+5MgHh4WUIxkITpaDM
         nA9lwL66/ieA+6+Bqt8KZff4XDMcNLseT1Wq4u9o8BEZ8NR5aJHGi9KF3vsfqwV3xOnI
         QaGESE5oxmkp8r33zHVpYp3It3KKvqtfrYsYZdYJFzcVU7SGMsIyHmkQ0Bjmsx55srSd
         /PseUgn1c5dd3WQWAAKuupyLcvrRxHn/7N9DFF8uTeKZgmyphkisrgFYNfbkOOe23myC
         3RCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ZufYXLwTMYBuYzvTKi9Y8SdMcKPjJ1G/PDEAZ+Nnv+I=;
        b=tbYuK2J9WBRZRHs10jgnr0Ewsn+30w60EvJBq5BMvghOlhCZNxjiBYT6+0Q3m4nPgE
         /30OgXFCZAZXG2UZFBD/tWJIOOQSamizDvRh8KasnUq59J84oOW3mcsM0nIoiR1mXs6i
         JOiYm0OWILTgZ0/UF1vsal7wLaBaEgzQSrHQgWKWeVa01MiUq4sOYS3tUmOn9xyGtMmP
         L9wXN+rG6OLT6q4GHCPSd880NEs5zP01XhXzpReX7U7YfuLdA4+m5jt+5K1tA+3Gtqhw
         ReJjrOKyEaHVOso6Ti0QY6afvYRnMRjyhIxv4IyyZvXt/yGhPIj0R0cToem4foFf35i6
         I0rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SY7yFRQQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x186si2361737ywb.407.2019.02.17.10.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 10:20:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SY7yFRQQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvR3F-0006sI-G3
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 13:20:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvR2z-0006qw-V0
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:20:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvR2z-0000J6-9w
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:20:13 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:42109)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvR2z-0000IQ-2i
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:20:13 -0500
Received: by mail-pg1-x52f.google.com with SMTP id b2so1546483pgl.9
	for <qemu-arm@nongnu.org>; Sun, 17 Feb 2019 10:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZufYXLwTMYBuYzvTKi9Y8SdMcKPjJ1G/PDEAZ+Nnv+I=;
	b=SY7yFRQQndaN8976LLcpa7NYGjZVtIZCGzLZSX+zqpMpEnpbvoq8GxJlgZ+7yyIueh
	KpK0momSMlVhYA0os9UEe4lLqUH0C9GESfM/oarAupFx67CA9oPDn2Dib0lD5OKh1MHO
	mwZQLNBOBTkv4Ype25BewRGo05oV8GpM4cwTvZSDr5S/QdXhYi86WAi1EoFXbSdCxTFa
	Cgbk4ejuBezBu4qcdK6x9Sc8VZKksH1+82ISyTETVEp9qcEq8XpF3e8uHJUtL8HiiY4a
	l0+HcChrihOK6r/4+II/zlGmYOxh2iapc7RGX7R9/jK0ecWoim9Gs8OqrieoJSr0Ys0V
	9s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZufYXLwTMYBuYzvTKi9Y8SdMcKPjJ1G/PDEAZ+Nnv+I=;
	b=Ex8ZB54WtXpOmolPXNb05S+RYQaEPgBrVw4HhT2DYmIyIKTXiGVTdbs+BVHCVu5nw0
	pjVD6Mp++a2xGS1FmKw0UJQZAM2EsPYTBJz2ogQyARvXKgZ/NCAWIPjUZth/M+6/O0VG
	thUPRce5SEYY0tQ8x4LYgXKVeqVUG5b27aBum9n4daWRiaOZAPM9+XWx3ORKkc1gaE4a
	2rKInlg68XrY3pobqGPoc6W0LPGJd4Mcu9HIk1rmsebibmCpA8k0FItP86V8qxcr+3bW
	l2Jj+vNGw9gWiZnCx/P3Mv72ZoEbdt0HkinfO7wtJu3HIg8cRohiuoZ74OtrCqXUd2bv
	fndw==
X-Gm-Message-State: AHQUAuZ/EVTmpmu7vvj2GaSvjPL93dIz8kOXHnSVeNrjvdznJnIkS/yB
	8/3nRk4XumT3KMof5eFokppO+A==
X-Received: by 2002:a62:cf02:: with SMTP id b2mr1481280pfg.71.1550427611948;
	Sun, 17 Feb 2019 10:20:11 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	x6sm16478759pfb.183.2019.02.17.10.20.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 10:20:11 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <63b1b4ef-4f2f-f9f1-15e3-7d13f73dc695@linaro.org>
Date: Sun, 17 Feb 2019 10:20:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 13/14] hw/arm/musca: Wire up
 PL031 RTC
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
X-TUID: QemwxIqEaZT9

On 2/14/19 4:51 AM, Peter Maydell wrote:
> Wire up the PL031 RTC for the Musca board.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/musca.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

