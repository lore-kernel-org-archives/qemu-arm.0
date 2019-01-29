Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4584013wrt;
        Tue, 29 Jan 2019 07:30:52 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5fdgjIm3lJxEiaRP7+5MiPH41yVD2GPeqUY7y4wJjIFy0kcS/VpwYT+LoIXkuYocx68vVi
X-Received: by 2002:aed:3f22:: with SMTP id p31mr26597971qtf.185.1548775851953;
        Tue, 29 Jan 2019 07:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548775851; cv=none;
        d=google.com; s=arc-20160816;
        b=HjfTw+tE2KAV8N52a/5RRZoEykm4kEj6ZspZZWc0Hp42LYYs4IniynAdUGPWs8ZcJb
         VDg4c708/EFkAvmgQ0pfCssFbRiQqJlo/V6FeytOaqC6cDtH6h0olOA4OnBwqCBU4ol5
         2KwjRYm6SyXGzjuOKX63Tz3QGSS/pDU3LuXZ+NEkA5fIWrblhiUtjWH7oZ0l4bei4Uz4
         sJpoPzpvtV4nq45qaKdoM6tBpDN0pmWfXMYQzSjS3j3izNB4wVXqNtjOYBjW7UXgRe/R
         ZBAYaY5usNfosPqlcVKWA6QqtaWjpIv15FsAatJauBPoHVn9OUCT43gy1Z6WeZ+0tlvt
         Cfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=gWcrGseeZXvqkD4Hc7VXnH1NdtdFWrezW7vu8jCzPlQ=;
        b=Uai37vqyGFceM/FmjAbYgx4+LQcK3ky0rC6Ocmn+/n/4ZmQ7zngndwMqBF9PBoJzLL
         sU8/EWRNPkHzvdt4wwcuXxAuPklQnMgqW1p6GQNxFswAGT+0xmpeVKah0D+h+cNX7RpP
         0k/6L3BFxlVlN2EpavumlJUs86nQCZt2buUHQW0wf1At7tLZ6AA7eE6U3tTYAmANTIQR
         3oLohS+s+C8tnMtpCOwCulRI7loJqOZrHzLGnBHS9VPLMgFzR68pFjT9qX/EA7psgsFn
         PFlJokLcCIwnuoI8N8dFPvvdRwXpNgb0eSNSC+1dr/B9aR7ltlYh/HfLTKmpQC4x5Qqr
         mXGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TbH/vcZ8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m27si1528073qta.366.2019.01.29.07.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 07:30:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TbH/vcZ8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goVLd-0002cW-Iw
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 10:30:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1goV3D-0005r3-MX
	for qemu-devel@nongnu.org; Tue, 29 Jan 2019 10:11:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1goV2y-0006lv-28
	for qemu-devel@nongnu.org; Tue, 29 Jan 2019 10:11:41 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42577)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1goV2w-0006hu-IN
	for qemu-devel@nongnu.org; Tue, 29 Jan 2019 10:11:32 -0500
Received: by mail-oi1-x241.google.com with SMTP id w13so16358482oiw.9
	for <qemu-devel@nongnu.org>; Tue, 29 Jan 2019 07:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gWcrGseeZXvqkD4Hc7VXnH1NdtdFWrezW7vu8jCzPlQ=;
	b=TbH/vcZ87jq7rh4s0+5i8kAcZfGEBcATpdQ64aj6Zv8CfKtRYLZ4JEbRMszFh8kK59
	/+joc4oeagS5PFOfIRcx8ahISPVIqhC2Gok8bGpqSdWu97S/t4AEKz4urKLtmQGNlLTn
	ZOJTby98F9eQ/e4ItnbmG185MLAmTp5oQ2e5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gWcrGseeZXvqkD4Hc7VXnH1NdtdFWrezW7vu8jCzPlQ=;
	b=CMMS1fX01Dy5OlxCl7nZ0ZXw8ta4wjiE+Ws83ucQqQ/tGqnCcrRXL7ljE7ekKWsCQZ
	Y81QqbTjdSWZslBPBqSBOMpWL4yz0vwvv1h+L7/Wsfusfda2whQPOt62j7VBG4GeLLlb
	eHSgofYKUiqKSyY08Sh6A+ROT1037IXrSGUxDmcLjyEAV8lDiBdxpvODYqKUJxnL2lhg
	THAhvr4slle4Jbu7aPBr7dZnLVgbviUGCRCTfSreBWAWNHx+bi8xy7AnSqqC8nIFgjNT
	lhypRDbVtkMlcDdd+uS9G5bngdyhxw0FGadxlYn4/e+mF+34SXozntMJpmM+A50SC/OA
	YRjg==
X-Gm-Message-State: AHQUAuamLrdpCz6ghh0paANZ9c7VBd8/8yMYgFEw2LRLlsgvCOFwflQN
	n+wtjpb82m+7D+pPtPAnP2qUmQ==
X-Received: by 2002:aca:ac13:: with SMTP id v19mr9243678oie.160.1548774675725; 
	Tue, 29 Jan 2019 07:11:15 -0800 (PST)
Received: from cloudburst.twiddle.net ([12.227.73.85])
	by smtp.gmail.com with ESMTPSA id l6sm5814373otf.56.2019.01.29.07.11.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 07:11:14 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190129140411.682-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <709b14af-3671-6fed-c8a8-55e1651467b5@linaro.org>
Date: Tue, 29 Jan 2019 07:11:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129140411.682-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH 0/2] target/arm: Fix FCMLA decoding errors
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pWN9EApdTEgV

On 1/29/19 6:04 AM, Peter Maydell wrote:
> Peter Maydell (2):
>   target/arm/translate-a64: Fix FCMLA decoding error
>   target/arm/translate-a64: Fix mishandling of size in FCMLA decode
> 
>  target/arm/translate-a64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
