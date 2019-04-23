Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4010005wrx;
        Tue, 23 Apr 2019 16:06:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzw+K20TIzxF+mQw8W9Ji4gisDzcTABgNQo2ZUJo8skWF2xBb7HL7m96H5QFkjQ6eWKn68f
X-Received: by 2002:a7b:cf33:: with SMTP id m19mr1489590wmg.101.1556060784551;
        Tue, 23 Apr 2019 16:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556060784; cv=none;
        d=google.com; s=arc-20160816;
        b=AgsUi1LHSEXHOg93BcNtujzzj6M03RCRHlZ/tJ79YOl8N3yFJT//pKHv8JKRiVL3f8
         goa+sfcm+LHR1I0JJAlUNbj19BaK8vExQmqCQDfgpdMM9V1jrkyvPM3Z3Y775GMJX3ck
         xAgpHYkWbLzUuD7yMffYovYkKaLiu0oCNxVKhl/+5mLN6tzDmDk/pqtQyvM71TbS5M3Q
         zkUNPe/tte8qMQBf/8bwn20QjkS6ehCHnTAgduHwuhIwbl9HWRZE1kSZSPGnm96+lltP
         oPSPRtZaNSqbliswLVpjCrFk27HSwkJkkI/XkrFETrB46VtMsIw7YmpjL9497RJTVUsa
         YCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=n/c+Bl41/wLEPFjj3s+GHe0JHiuPaOcaHyJ06oLCP8M=;
        b=mlj6Wl5hpOeedYf36TKYpJgnVj87Cb4ofJkOIS94Bs4Z/ipJIZuAQvTqrqZxdg2ctv
         FUqvvvSi9dWALIl4ZYwyWvXxCnfZAdgSRwc0kYV0KU40awTSJOfiLFGG04pXopkbnVwg
         vXQQuLMSGAR4Qs0RZDhapuoCYX/P+FcXmIxydq2ekZrAK59dRbCk5icisOr9J86l4lyR
         Zo0ZfQfwJaZUOREK/IizcnsW/3P9J9BLIP3fBTWqlWVvLu2hJOiPilWPAfnOVS6Y3mIt
         u7mEYtMc3WjHPsPxfUj7YFgEnNk8qFCou1MJt5+aR1jzwerAUKwev+4gQindHx/K+Lp9
         igCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YrGLkf0P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n187si12069492wma.126.2019.04.23.16.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 16:06:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YrGLkf0P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60827 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ4UZ-000720-JD
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 19:06:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ4TD-0006VK-68
	for qemu-devel@nongnu.org; Tue, 23 Apr 2019 19:05:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ4T7-0004Se-KV
	for qemu-devel@nongnu.org; Tue, 23 Apr 2019 19:04:58 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45942)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ4T7-0004Lx-1P
	for qemu-devel@nongnu.org; Tue, 23 Apr 2019 19:04:53 -0400
Received: by mail-pl1-x643.google.com with SMTP id o5so3911244pls.12
	for <qemu-devel@nongnu.org>; Tue, 23 Apr 2019 16:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=n/c+Bl41/wLEPFjj3s+GHe0JHiuPaOcaHyJ06oLCP8M=;
	b=YrGLkf0PurQgQijC1QKnahx75f5PH+TvVEw5HiMOP/+CsH8+3V901mepuikZD2R0CB
	dnJY2vE3AQCTEst/2TkNEQOiT1m8o9EgAyEvKuLajOIH8Jr0YelmHBHXan5jw6rcNebE
	19S4d851U60qeDzYw7XE2RP/UrlbVoIpx1ImFjxNXxPAi8fvgWUTcfqwjrKtPO2Jz9jL
	NRTGGM4KGJUNSI1Qz+Pt3JpE2KU3UJ68tV4pFYWqQz+TstB5+wsY7TxxxgZAOZbWrdvh
	0Bz3sMPorVuQtUtWqM+nsXAvORu4/z9Ng8T5mMPe63R6+ZCEZlxIUn4PO0O0CTqdgKhB
	w9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=n/c+Bl41/wLEPFjj3s+GHe0JHiuPaOcaHyJ06oLCP8M=;
	b=ZJAWD3M4ce6nZUk9s6EBFAi7mSqT3MxPA8V0mSveFrPe0oA2hKBVznsEJWmDUugmJy
	qiSqfy+iDqN/HHDnCQb3aNCnDuywsS6CUZfPl3r2E532ukesBmCXZmBtU9XagKRq7bYG
	ErYbJX4FUx18zQ6S7inc/FOkuirdPJYAGvUvnY1Ds886MIE9pkCo2RCE6yWTTe0t5Kgx
	qWj2yNdhRPCjmyU5YL0NPgxg19RJniEt4HnW/XyOfCcEAfoLfJs7d4CDgYbHov9M365X
	L1trxMa5PQpxeKHeTlGuFRC0FNQQ8RQx1zZmlZxh4BB8BM531TWWXaxQF0hyfTBeIsVd
	37IQ==
X-Gm-Message-State: APjAAAV+hj7oVk+KazKYEEjflNWHpFXAGE9hZoO6xKeiAE9fXFwV+VFp
	vIV+3WQWwPZbE87V2DOhwx8Hg1cMRZA=
X-Received: by 2002:a17:902:4501:: with SMTP id
	m1mr28924907pld.290.1556060685653; 
	Tue, 23 Apr 2019 16:04:45 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	i10sm38838352pfj.7.2019.04.23.16.04.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 16:04:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <20f5f564-6d0b-0c28-00e9-b7f2ac46a409@linaro.org>
Date: Tue, 23 Apr 2019 16:04:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-devel] [PATCH 14/26] target/arm: Allow for floating point
 in callee stack integrity check
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: obAcjHPCSnFi

On 4/16/19 5:57 AM, Peter Maydell wrote:
> The magic value pushed onto the callee stack as an integrity
> check is different if floating point is present.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

