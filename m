Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4054696wrx;
        Tue, 23 Apr 2019 17:04:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXUgY3Zw9FteZmLEOdr0/AdPjyFi8cd/zPv9d+WVSpU+WFM0V+mNmd/GjBrUmmamOHn2Bi
X-Received: by 2002:a1c:c8:: with SMTP id 191mr4157700wma.44.1556064299000;
        Tue, 23 Apr 2019 17:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556064298; cv=none;
        d=google.com; s=arc-20160816;
        b=R27AKdUWnEF5dWDfJ2+k7czzRI7JNaoyhP+YgwyEnVBRqa9cspTgJhpJCx2FU1EkFM
         OUKwN7vrPopj6xDJVTHaHqYgWnU0ufsgfkakxfDcfEKziCOHgwBoVqSLedd/P5YwQbIM
         hSGcTpMf4taI+LS8mygt1R1/ncN6XQmvsV+NiXOTvtUacgG5CVBIYhz4KjMrVBrG/8bG
         1eFgIPmf5ftrUB6/RCXlFv2yzT0th99IVD3DrB/N6KmnnFUL/Y3cAN1QOy9waZaRiSHZ
         Uv4XjyYPJcsfvQilUYocg30jQ9cl84oNucDfoYRS1I94D6+OmV6RHAAUgxYvk0AH76iY
         jNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ut83/zAni/knfCuY3vmIr7CX5BTwDiDjQDoDEynbIUA=;
        b=AYNqQnBSV+NnOqFhcbW2/VgFr77xTTUrvKeWCk0Rji3ulckqoYST5TZSWL03lPC0ap
         2RS+dcYoQcjMc1yYEKtyY3C1KkffBWsIpP3AA8viVcbbQgrq808zvGS8Anxyvwi783DU
         9eRUMQzfxqGeaH4iT3jOVZ5GAflsGXtv1wj17Q70PiYXpefsRJ7Abj5Y9gs5cS0qBiBT
         /9AR7q+I0I/YhIA1Ry4K9Im6kO31aL0XcNcZJ2Z/ky4xy9pDZtPxe3hucAGcJLrlI1De
         V/qKOkkYujwidEW3SrMoHuG2Bc5df0hyQNpZMXVJnaXf51SDFqGunhjU7sqmvaY7mmVx
         KD0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gAXZqqKP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si13913986wro.9.2019.04.23.17.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 17:04:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gAXZqqKP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ5PG-000213-69
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 20:04:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ5Nn-0001DK-6Z
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 20:03:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ5Cc-0007SP-2w
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 19:51:55 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46657)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ5Cb-0007Ra-T0
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 19:51:54 -0400
Received: by mail-pf1-x436.google.com with SMTP id 9so8272204pfj.13
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 16:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ut83/zAni/knfCuY3vmIr7CX5BTwDiDjQDoDEynbIUA=;
	b=gAXZqqKP3Dg2da4jRi4TtC/J3Q5L8pSuZQCM6+/Tiz62KZQIpahYlfiLdqv/Jy/jzS
	VcQIoalkfvDUSbDB5jWBhp+Bt+lYr7YDq12gFJKpoMot09GOn0YOPraR7eepQK3+zRx0
	K2lOjOeq3Gpa6VpW1P4ue3iSc4by6F6zoWDnYfGB2/2ctGw6WtEYcQXAGpNoY2tQYik9
	6jUOmomzncjd42wnIQHULvNwZxMiFs2p3DnDGbVtUKMz21wGxdin10jBJM8nV97UTIAd
	YaXXsur3ssO6DyNGgtduHmb79kTs9xhCFIcmm1mS0yYYbnJ4So05EeCtG2H8hkQ7wuSt
	56Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ut83/zAni/knfCuY3vmIr7CX5BTwDiDjQDoDEynbIUA=;
	b=BeIIKiO1K/rtZww6nqa13+TTS5EEBouf1mJwCaLZMWBYqMfLzixFxw7kiKH1bUYeN7
	46Fz8Vj0eDqiDl6FjMHazUnUaimIcRdshA8O0pmGw3gKlaBTZIQD0lVckyLRx/g5qrAi
	fH2fpIvGO/WhLM64+6eHkL4JirPt0UOP8PyM0y9dMbHZTAE8mtoqC3OJnIYxc7sCm2r0
	x2YJR3AYWxbq0qY/gZdQVK29KJeHTL/O19MrmnhntF348M3xjhVTMivDxQKo2+FzPrj8
	fczf0LWAC4mY64XWMpPqnXmlw6wr41DnEw74ppEtAwLRJSzLBQkSfLPF1OvVoeFwoMg2
	IvyA==
X-Gm-Message-State: APjAAAVSsPBoOnfXDLtcSJULvMHC5XDuv7amhvOPIDPPsaUsjMXuq+fU
	U+hL1fSXG+SFTWg9/wPMiZN1Ng==
X-Received: by 2002:aa7:92d1:: with SMTP id k17mr30196783pfa.91.1556063512178; 
	Tue, 23 Apr 2019 16:51:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	p20sm14445849pgj.86.2019.04.23.16.51.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 16:51:51 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f32055b7-e698-9130-0949-825f27938692@linaro.org>
Date: Tue, 23 Apr 2019 16:51:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::436
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 17/26] target/arm: Overlap
 VECSTRIDE and XSCALE_CPAR TB flags
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
X-TUID: /02S/tPKtnZ1

On 4/16/19 5:57 AM, Peter Maydell wrote:
> We are close to running out of TB flags for AArch32; we could
> start using the cs_base word, but before we do that we can
> economise on our usage by sharing the same bits for the VFP
> VECSTRIDE field and the XScale XSCALE_CPAR field. This
> works because no XScale CPU ever had VFP.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       | 10 ++++++----
>  target/arm/cpu.c       |  7 +++++++
>  target/arm/helper.c    |  6 +++++-
>  target/arm/translate.c |  9 +++++++--
>  4 files changed, 25 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

