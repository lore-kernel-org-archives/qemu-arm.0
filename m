Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2955625wru;
        Fri, 20 Jul 2018 09:23:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcQbqYCDqovrGz0HwkCEa3muur5xw392of0lCUJYN7dtSoND9ETS8tpvF8rNdnuYnh1TLjg
X-Received: by 2002:a37:d61b:: with SMTP id t27-v6mr2344695qki.244.1532103782427;
        Fri, 20 Jul 2018 09:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532103782; cv=none;
        d=google.com; s=arc-20160816;
        b=H2ce1r26fDpLG3k+VNjYCdC5NbxU6PFe/xfAb0QmYuVa7/YxXKJUf8lDyAdgLzhWwd
         Zo4UeSNNewOrE6xBv6YKXLNJx8g7isRAh6ze4d1ZKoBBpWfdy/6PummMXw6g80rdMVxp
         OskWygIOdU/cfVCiQRbYBRQDXb/lu0mw1wE3dVLGzGfoTkEPumLWe9wNYvVONFMFxSGJ
         r8sJgTKzMohf7B//1DTiZJvbUfIQGOpEW8jVPhgyTUaN37sGkmZpD5/We+T5Fey+Ee/h
         2nrPKvMr5yhe5L93HIoJb8Yjls361ICP8R74qDLc9MDzalrPZFXRdpyvsBap/iRx9U9q
         D65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=/fLsyWXiwsdnsi0R45GAwYr7un0IbNIJOXF1ZJyg/DA=;
        b=hEi0tte6IT0nLIS2MdrgV/JQmRk+BUVDpajr+3qJfsp3SFa+SYedCQSK2K6bdQadOp
         9Y8rZh95LJC1FmWHvd71Qe5edJ0siblAsHLz25Ga3jQulqVfB3If+BMQ0q26N6x8FI3j
         3Dio/qcim1gW3Yc5Wpq7eMSl7G9Nbskap+BDfKttIN3gjEASIBCaGiScEEq+lPYLZ1cC
         B5fMSzi40OTLVFQC3IrLLlGkF9n4TIrH97KpcZ/uEPJ/OBqRcS3BBS9t9fqbfghW6Ayr
         4GFk1FS0J8zI/KT0BS3nAzMxf2KKojd3cw9QGwsx6sgfFILBP1OhRCISYCsa1V8076Y8
         /NNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RBaPrlZ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i32-v6si2210512qtf.352.2018.07.20.09.23.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jul 2018 09:23:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RBaPrlZ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgYBJ-0005KI-VG
	for alex.bennee@linaro.org; Fri, 20 Jul 2018 12:23:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fgYBB-0005J7-G1
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 12:22:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fgYB9-0003zv-Lo
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 12:22:53 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fgYB9-0003za-DQ
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 12:22:51 -0400
Received: by mail-pg1-x542.google.com with SMTP id g2-v6so7295081pgs.6
	for <qemu-arm@nongnu.org>; Fri, 20 Jul 2018 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/fLsyWXiwsdnsi0R45GAwYr7un0IbNIJOXF1ZJyg/DA=;
	b=RBaPrlZ3GPlBXDDPVu11+zTRSKDiJIfqf/chR07+5bleiCWNEbRR04wiG2luh8tUPf
	O3Ja1UtP88rUhxJzap66CafplJu1hsRbL9N5lkgNBCXbZfjOyGEpiA/PCCRMUE0D5oe8
	S7EAwKkvg6MtjPWqnYtwucnjQK4xwqMH46+a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/fLsyWXiwsdnsi0R45GAwYr7un0IbNIJOXF1ZJyg/DA=;
	b=tpqSzkeodifZX3OlCNE8eA+B2u85EfoiE47sB1PVYoGPQ9kUzAOATbHC/sD5X+CWNW
	DBaass94iZj4bw+4BjKYRn/ePHZYmeMge3Qi5MdoIqLdcaZrUdg0qaZiPgYDeVx67USA
	/OOLz9lcDpadjjjcLeGX3TPkv5yu82RGvYXxz+ftr4ZFSHov2IveeDZ3ZBxkdr6WkTp/
	7Hlt2I+vUQTAbG/zFVqYHzwkW3Hrp2QX3yEYKELkYM9/PCULkavgDw29wEwUFUUPHxfb
	UZFd57hGnyI7o/3jd+nIs3zSJPZTgNX7iqFNZcbWAAKv7shWM2iPnvZBoK7nl6hT3lZd
	5S+g==
X-Gm-Message-State: AOUpUlFm1wSQQNd7472huBbqCbd5tPb5Gpyial03ntL2aRXUwfxGHHoa
	yc3VGkApK703pgMaxf3iuWGaCg==
X-Received: by 2002:a65:4c02:: with SMTP id
	u2-v6mr2779820pgq.364.1532103770427; 
	Fri, 20 Jul 2018 09:22:50 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	z11-v6sm6847829pff.162.2018.07.20.09.22.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 09:22:49 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180720145647.8810-1-peter.maydell@linaro.org>
	<20180720145647.8810-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <72aa0d1f-92ad-1cdb-84b7-1649b03a54ff@linaro.org>
Date: Fri, 20 Jul 2018 09:22:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180720145647.8810-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/4] target/arm: Implement
 tailchaining for M profile cores
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
X-TUID: As1WAsMg0eql

On 07/20/2018 07:56 AM, Peter Maydell wrote:
> Tailchaining is an optimization in handling of exception return
> for M-profile cores: if we are about to pop the exception stack
> for an exception return, but there is a pending exception which
> is higher priority than the priority we are returning to, then
> instead of unstacking and then immediately taking the exception
> and stacking registers again, we can chain to the pending
> exception without unstacking and stacking.
> 
> For v6M and v7M it is IMPDEF whether tailchaining happens for pending
> exceptions; for v8M this is architecturally required.  Implement it
> in QEMU for all M-profile cores, since in practice v6M and v7M
> hardware implementations generally do have it.
> 
> (We were already doing tailchaining for derived exceptions which
> happened during exception return, like the validity checks and
> stack access failures; these have always been required to be
> tailchained for all versions of the architecture.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

