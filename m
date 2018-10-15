Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4572567wrt;
        Mon, 15 Oct 2018 08:39:31 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60+vMeuVYW4lR2MyyloJyMuCj+abeYiC1gGlMGnIOUklNdGLkwfduZ6ihm/uoqIc3QmC+XM
X-Received: by 2002:aed:31a3:: with SMTP id 32-v6mr16421013qth.191.1539617971562;
        Mon, 15 Oct 2018 08:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539617971; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2c1CvDvzl9m0KHmuNsveM7tHpjYx4pMZbQB69x/GQZ/HrWpTCmSXFOnZYQi0ejYph
         3t2WsmE+QfT0+BkvCHUdIvYBzzK619K8XtIAu/XYislD9PCd75F4O73en+BAxTcUAmXl
         T11od7L4wpG8RneD+/yC+wZI53ajpBB0cf/fUJ9H/wdQzkaqKy5e26mJ84tbFU5MRAtb
         4wk5x68PmT4BdoDnC3Lpke5kldjMF2jdJgNbU71aeVc6+IM92kK96mS/FmpAY267mjKX
         BYl5wsu2RbPTm8UHxCWZOc5y2pPwBJ1rkdChc5dVofsPzCff94wbR7tIykPvxz3ONHQ6
         S70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=EXkaajL7kN9DySQl9Wk60DZ4frN+lJQrVoKgTdVpFfI=;
        b=yyAK1gU5AOjNlLSPrww6cS/RDab9bR5FE1WV2i4TxgquixbBL4kVyxZA0XHRsjfkcQ
         fRdzYza761Rw/Vb8z6mR/vNN02A3Tm55KxuGX29BFCNSY+UTeE7UAvFay37dgS18yvkp
         eufloT2WSw1O7bBKdFIjGdgIUBnQI+itqwSqNC5KEcq5rRIqol10nynBwMFZZuTiIowN
         eytwVx8tZbXCiFqGnifMkS//9AzSTlWRat6xH71stwA8yfK7gLMQyf6qRDyS8gD4py9g
         zKMbQmVGOk/BVcjoLW3e/FR4CYlxOzkhar7rGsI4uaMC2ZeijWrr4aqcpH2RFAi/Cu6G
         mSpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BolWev+x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g19-v6si3064447qtq.329.2018.10.15.08.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 08:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BolWev+x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC4xv-0006ay-2R
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 11:39:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC4xV-0006Zn-KI
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 11:39:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC4xQ-0007z1-N1
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 11:39:05 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:44858)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC4xQ-0007yP-FD
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 11:39:00 -0400
Received: by mail-pf1-x442.google.com with SMTP id r9-v6so9864893pff.11
	for <qemu-devel@nongnu.org>; Mon, 15 Oct 2018 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EXkaajL7kN9DySQl9Wk60DZ4frN+lJQrVoKgTdVpFfI=;
	b=BolWev+xpK+nMLU8ukrHIii2L3+VX/dTjwN/Q9Glt+4sZHSU7zaJS03CClvrFiZQhw
	EfFc4pItTVIkHW+Nak60KeP4AAFLpMYt8iLnGnlxjPu82+SRUuHwj/3yNZd0w19nRcaC
	xcNHV2bGAZu1ooznSp/CpZy2qXCU3PBdFASmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EXkaajL7kN9DySQl9Wk60DZ4frN+lJQrVoKgTdVpFfI=;
	b=T49pfdthJ6EYg/oDz9tXmq6qPD60JUcVZg9AYgyFy5kV4uvaO8xMbvmRDcAzAP5Ifx
	8Wmv77s5fv/jOzbWhDNHTOsRsZMbisiD7JTTRd4O7S+uKQuryMcexik+o8lvCkEWRp6O
	/mtpLAnllCfEFKujP83A19Jm+7MgnZSg+/pli3qOrW8pt+KePAWHexc6SuSyTE80IBun
	EtMWRp7DES/NhB9s34xAFXMmjs+T1LCqP2D5JfJX7NWPTkR+YC+ThxdJPmII225/RdV0
	U4qDXXQuzSNdDUfdGJS7c4z/pY/PW/hqIE0T7qCwbxNIhZb7wErrHKm+ZvKHTBgiprQe
	HSIQ==
X-Gm-Message-State: ABuFfoigsprs/EeQvNQHlLBuPfWP1ZnOxbfnnAUV3XTnETR2BCGtxTpY
	BGg8p7W1CuN/oQcz5QFs1q9oZh4u8+Y=
X-Received: by 2002:a65:4cc3:: with SMTP id
	n3-v6mr16858437pgt.257.1539617939546; 
	Mon, 15 Oct 2018 08:38:59 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	e22-v6sm12123194pfi.61.2018.10.15.08.38.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 08:38:58 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181012144235.19646-1-peter.maydell@linaro.org>
	<20181012144235.19646-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <11aa2e64-2a40-b0a1-1e1b-a0af0be5eb70@linaro.org>
Date: Mon, 15 Oct 2018 08:38:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181012144235.19646-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [PATCH 08/10] target/arm: New utility function to
 extract EC from syndrome
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
X-TUID: We6r19+qGjcM

On 10/12/18 7:42 AM, Peter Maydell wrote:
> Create and use a utility function to extract the EC field
> from a syndrome, rather than open-coding the shift.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h | 5 +++++
>  target/arm/helper.c    | 4 ++--
>  target/arm/kvm64.c     | 2 +-
>  target/arm/op_helper.c | 2 +-
>  4 files changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


