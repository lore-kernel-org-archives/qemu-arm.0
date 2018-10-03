Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp40671wrt;
        Wed, 3 Oct 2018 13:19:04 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61AFqjG20vBielz+XOKFx6fAdGZY2kYpY/JWLjFAGf8/nfE3ATUg60xyfPK/Ouj3udXLZu0
X-Received: by 2002:a0c:8748:: with SMTP id 8-v6mr2681265qvi.223.1538597944554;
        Wed, 03 Oct 2018 13:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538597944; cv=none;
        d=google.com; s=arc-20160816;
        b=OwTHKWH7YgPM+V/0ORg4qPH6ebTqRK2yGXn4BpP6XrHHuQKmQ/awU5XIL2PbZvF3ew
         ihE1YaEBpnDKms5wRwM8d64PQzZ7nBZ8+yAfavk6r3PvMvQztFvZjxMUP9lxn5W1Sqy5
         1nw0qAIaoOi8gq1FKT9prDxdt7yMXHp0UYB4UyltEY56VEn9fjvI0NKX/RlJNg8GBtSe
         QThgdEW8JdfZGsFaKkOuFp/z66CLR0S/FFlke8FZ0IxTOuBMplYyP2VoOKGD61WzIUMy
         2lD1W5hShJ5Iu0QjcuVb6j2IhGqQg4w0pdRc413CVsyz96XMlc/CpxTlYjqCGOXVt3KY
         FB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=WZffWzPM6MMOs5RWov9nVjP1IEIuy61x1AwZBlX+KFM=;
        b=QgBN/1Rq+ADHih8QQGGTyi7kCTaI3JpvkzFZ1vymezUwCmTR9yjxPnfZvZZj02k4UZ
         vf/91DgtziwKnHn6GFBZew6h89ZVRZh9Ui/SaUkpmX8RYC2dlZVBvsiLMOyPuJ2NPijZ
         Qah4Bgtp7qDnELQVPUmNXGOpAd3Md2rY127uyJ7zI+gItxC827VfDmotcwz7CNgR49XL
         EviXUbUssr+m3P1Ts8KH/HHZGgp+GhOjDyL2sGljz49OthYDdju5oh+BvlPqiBl3D6ky
         HKpJ/6sKZOOucn1EqESW5ZL32VD7Y4PZNwuNigfYK1G9EWLEBszukVOLxrK8sIbosZ8Z
         Ovag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sntw121t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6-v6si1513667qtd.403.2018.10.03.13.19.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 13:19:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sntw121t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nbs-0004pR-1l
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 16:19:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nbZ-0004jg-Es
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:18:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nbX-00060K-0g
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:18:45 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7nbW-0005x0-Jc
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:18:42 -0400
Received: by mail-oi1-x243.google.com with SMTP id u197-v6so5634201oif.5
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 13:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=WZffWzPM6MMOs5RWov9nVjP1IEIuy61x1AwZBlX+KFM=;
	b=Sntw121tfQXZu+XRrtSAKP5jBy03ucJFHN37Y8ADlpzcwcbU81Ef2ZVQbVs6TXKdTf
	AlEgRdd4f9PoZTm0/lc8vaPR7okcTTK2JKpbbnKQEQZP5X7n5BMcou2MEjqFWrc0RU4w
	JV+Zs+l4Pd2mdK7KRMksI2TkYHVFBjOg1mRss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WZffWzPM6MMOs5RWov9nVjP1IEIuy61x1AwZBlX+KFM=;
	b=OVnaW+XGjvIh1TLLNv6XADi1YgzDfVufVPTdVKmUf5skLGGDa1r1uGwt/DiyDN4QVx
	MuzErJxzI0+CD7cm1Fm3KQVbotl+3dDxFl/cDDnLhc62s8Y0BBcNsSaFZd4+bqcUphSe
	foi5gmsXchgv7ziAHoeT+gmevWQDju+idcvWWq4gHNguYlshrB06/uxhLYzbEc7OZ8a2
	tqd45yhqPpxuT7k56ffM9iwe83Di/J28sc3zQAcSdqdrjAPNjKdKM/r3M1AIn22ajgFo
	mbwyrOwhhNesbhpIEAbm/xn7S1qmjPvChZD2y9YrMZf76ifgbZKREV1Znaed7tztaVwa
	RtzQ==
X-Gm-Message-State: ABuFfoj9qkm8BqciL78Ajepafq78RZoLP3LJ62+MuxncPGR17gA6QZ+D
	ARNKQsiQRsNSOvyZdkQIF3uLXQ==
X-Received: by 2002:aca:fd89:: with SMTP id
	b131-v6mr1597568oii.30.1538597917501; 
	Wed, 03 Oct 2018 13:18:37 -0700 (PDT)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	63-v6sm623387oti.68.2018.10.03.13.18.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 13:18:36 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c806cd70-9c09-9525-eb46-d606d4510969@linaro.org>
Date: Wed, 3 Oct 2018 15:18:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/13] target/arm: Add v8M stack
 checks for T32 load/store single
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
X-TUID: W8G0dGOwOrHu

On 10/2/18 11:35 AM, Peter Maydell wrote:
> Add v8M stack checks for the instructions in the T32
> "load/store single" encoding class: these are the
> "immediate pre-indexed" and "immediate, post-indexed"
> LDR and STR instructions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


