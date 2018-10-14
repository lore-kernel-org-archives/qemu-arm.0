Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3328050wrt;
        Sun, 14 Oct 2018 09:14:48 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61zxYEP/JLZQhfjPgbV1KjphQba555xBGbazyDElksIYySp/iYk2fFfiaq0UiTtrTePt7t2
X-Received: by 2002:ac8:2595:: with SMTP id e21-v6mr13175499qte.233.1539533688908;
        Sun, 14 Oct 2018 09:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539533688; cv=none;
        d=google.com; s=arc-20160816;
        b=MXqpCVkRK7qvtOVPvBJCty66vNhmen1Xb9zxffhonb0C612ggZ36kP6Jd7YhQJXaAq
         1GXMFPutfGgRF/3new/iUaDLgj020aYPkihVlxxhEklzhaKi7fvBTycdBCSGaKtDrhOP
         BL5nXAojI8OMNASgWElAt/EXRvUCENuX8eZMn58hXIrsIuJ3E5q/MGACaz0gEK+QDS3R
         WJQ/M2MYBBjrBe3ft7A6hr0Nx4QFDBRMnTnVELiG6gGYyPzifH1IhuHuOoAfbNJgOQmZ
         cCjmHLjFjztl3ZQi9g2fRUycd5L0qWFfQ7c6zuDfHVjjKYPtV9wB0patYF+bE8TgLlKB
         /erw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=9lXKTJyTiM9iPEZISth79iHlsUsX1gvw4ie1ZrMoM+k=;
        b=eCHmNh4LlkGKG7ghHGZVHmHSducZXgtVQ6HZgIil+E6GXlrgWU2AnpEtnvXACvJKQA
         ZFvduQMv/w0ZZVZkMAhikvBldxxYCT75u8+LSEj5VgVchskZ+rf/6C4evhJehzqDhwaC
         cErvnecsKUc3EaSUdLvR+0A8wgZCByKC32bB7rVR/0bieYab8yHgGoRwozvv/41h0MLz
         ItXrkhxpa4IIhDfdC2f6yAGUlUbcA008sKSC3abDAkliwrjJIlQaCJwBNWGZuhYcx7Tu
         pHeeYjBcSF4qNne75KnsSbBbuw5h/pUVbzIpZNpOtzfUEgLYCaXbe4k8dDO+fkDdCrB7
         YgSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dD9Fdz2p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f4-v6si397776qkj.221.2018.10.14.09.14.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Oct 2018 09:14:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dD9Fdz2p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48921 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gBj2W-0001S3-EX
	for alex.bennee@linaro.org; Sun, 14 Oct 2018 12:14:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gBj1L-0000zJ-B1
	for qemu-devel@nongnu.org; Sun, 14 Oct 2018 12:13:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gBj1K-0005nx-Le
	for qemu-devel@nongnu.org; Sun, 14 Oct 2018 12:13:35 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34151)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gBj1K-0005nh-Eq
	for qemu-devel@nongnu.org; Sun, 14 Oct 2018 12:13:34 -0400
Received: by mail-pf1-x441.google.com with SMTP id f78-v6so2691538pfe.1
	for <qemu-devel@nongnu.org>; Sun, 14 Oct 2018 09:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9lXKTJyTiM9iPEZISth79iHlsUsX1gvw4ie1ZrMoM+k=;
	b=dD9Fdz2pSaUr9UF8B3Wm+vulDXvzoHSc5jjFQN8NJTPbB73VQcNS3zxObBh4YkLDTG
	ETDR85/EDuIDgjvAwKpZ5RhvBNtT1L4b9SWVhdH5cKWnP/P+MJcGYvH48nrdvNnu9aMn
	PuJSRS3z/MJ7sn/m/KgePSF4gpFNmMD4T0MbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9lXKTJyTiM9iPEZISth79iHlsUsX1gvw4ie1ZrMoM+k=;
	b=fw6YG9TpzRRhKr43u9yKaHILoW7ZqiJQFufOLmp1cHvBSqaQ+3NjD8e3iiyf2GmCp4
	G9bdV5cIHj2P6ljNVlUl4eaq+F5ZkpG3yMCMbia8g+p3tn2jkyRKj/P/jaddNQZ+rBPM
	EdVXj68xwLLtblV0ynshDOTkichoKJo3ti4k5xs84cWjN1fU7GHKW1frW8x8K/ojok/c
	L6eQZ3Jt/boxLpprbVlzKZOuMsnfhFJChKxKHmUZbv//xrSSvLNEiNcR0HuZNltHNzm/
	IgibaGJbHxmjX7sUCC6CHDnaR2zn7UvyyBQcti0bVAUOy8yRaxYR7Tgj4yK3pRn1VV1L
	IzPg==
X-Gm-Message-State: ABuFfogo5UcT6Anyp0Mu4Aai+Z4nvirKbsPOdAZBVKiyXY/CV+PxRMd2
	f8VGannDMY4c7+cMVsiWVtZSfQ==
X-Received: by 2002:a63:c40c:: with SMTP id
	h12-v6mr1167475pgd.298.1539533613544; 
	Sun, 14 Oct 2018 09:13:33 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-8-179.tukw.qwest.net.
	[97.113.8.179]) by smtp.gmail.com with ESMTPSA id
	u77-v6sm13296834pfj.40.2018.10.14.09.13.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Oct 2018 09:13:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181012144235.19646-1-peter.maydell@linaro.org>
	<20181012144235.19646-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5cce92fa-12e7-c0a4-b689-1f5cfc4520fb@linaro.org>
Date: Sun, 14 Oct 2018 09:13:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181012144235.19646-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH 02/10] target/arm: Make switch_mode()
 file-local
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G0NKVLlGCR/T

On 10/12/18 7:42 AM, Peter Maydell wrote:
> The switch_mode() function is defined in target/arm/helper.c and used
> only in that file and nowhere else, so we can make it file-local
> rather than global.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h | 1 -
>  target/arm/helper.c    | 6 ++++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
