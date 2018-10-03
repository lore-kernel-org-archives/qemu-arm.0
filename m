Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp28211wrt;
        Wed, 3 Oct 2018 13:04:52 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61nhu4fFwgBfpPMzoR+sqfH8AP2RH8vadhdscgAobwcdgtAezERJ638quwRY/6IQZFSiw3l
X-Received: by 2002:a37:4150:: with SMTP id o77-v6mr2554993qka.78.1538597092873;
        Wed, 03 Oct 2018 13:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538597092; cv=none;
        d=google.com; s=arc-20160816;
        b=xK9CGfu2uvdx7Wjd9f2kEU7bwYLnBP2nJnoBMT8q7AXM0P5fowjFecmiIri1KOeIzW
         HGcq8fNnRhd6A0TRmJZ/Q+8aPaF6DhxSHBHQh97zlrmJYmS6jrMkw1xnYLDo2MLB1WdH
         GRrEiZzdndom1g4iV4nsKpKcgNz7NvEW/9RO3KLZBvVa0fRgTGHRCGPgoqMe0T+Y1B0Q
         EQuAQ3Y1xUAbEs3ZupcD44Fc4y9La7caGiW7vcRTTH3WLlNSlLgXUB3vBI+kLl/lBEYL
         aCD7IHsWsaHMa+UClBpUZEWj/e/hJK4drzx9AQe3ElUpYYcGxTzo8xqZhMCNql9+5I6G
         pdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=TUBZRP6R05rDtCQWSa6vIy69DN0ytNKekSUKnIrJeTg=;
        b=V+2XX3zCbH0o0AEtS7MRKuKW7eofL7J39xH3MKJcPuHSYjaIOdVBWplQmOm7opqMRz
         F/bcY33wALaXiiAeV0g2uj9cwxBTUDaqXpUkypI4kSpPuLOQ5lDKFzgSWyLqUC6i00B5
         kZN1OUaB6td2x5KpRA4lPvLPODGM5j5FdkFLTSKDPxwTAydeaEJz80M4UnJNSWYyGMpc
         N5tt6czK/sCrcn3nEdwNcoQIqpVADdSMA0yTVtmgkVoE0sB9JSC4NpiEQpncRIXx/YCC
         FHj7JybjOr0EAmjphJytlR/ZSUNEOKhgEJGneRUesIh30HmoBZcLtg55sUUjou68rzrI
         WaAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esL2AAJd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5-v6si1498153qkf.371.2018.10.03.13.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 13:04:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esL2AAJd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nO8-0001z6-EK
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 16:04:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nM4-00011m-2U
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 16:02:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nLv-0005SZ-BW
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 16:02:41 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:36125)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7nLu-0005RX-Oz
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 16:02:34 -0400
Received: by mail-qk1-x744.google.com with SMTP id a85-v6so4293099qkg.3
	for <qemu-devel@nongnu.org>; Wed, 03 Oct 2018 13:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TUBZRP6R05rDtCQWSa6vIy69DN0ytNKekSUKnIrJeTg=;
	b=esL2AAJd/xFwm25eSUYZJl0LrVDEYHLXb6QOn+U+ZgUBoeFWjxXuBk3dZqiPneRzyI
	MAfjDsdvhfvfLwqkkBTgBtkrFNCLXWKAf5zk8NnxFxjzagltd/zSmGKQd8Lx5WAEjZNL
	JAEtEqi8O+0q7Q8Cgpv/pGk0cLqPpZ8lDafFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TUBZRP6R05rDtCQWSa6vIy69DN0ytNKekSUKnIrJeTg=;
	b=i4N5331reEO+GkfdJoLNyhaYcQUJyjNNRA7VURJmXE8CifzNOM+8CbAfCjIO6rPgUK
	G8vZziYStP/dY7QeIWo70i8oB71TLhVauPXbLx5d3WnBB4+dz8W5SQxSLWf4zUMrMZEO
	HCX+1uxgq3MMQgUrL80ipkbTWz2u9bpalO6JkjcDa4KDme1aIgdausEXG7y7CneTXzjD
	S4VGCivKJZIdzIu/YgiJOaxhJWF96O06sALZEmJcvkDAP3S/ltS/7CAikJtShXhZoipN
	yE73bD/X1qiYSeaUZ4iN2RMJFhI2WMsT99A0Ey+bNEeR5bgeKZjb2BaDruh3hZxDCj5P
	J7ng==
X-Gm-Message-State: ABuFfohTXpMoaZ2GbfjzQnAFaxRYBFYVprP4u3M+PVFARhHzg/mHOSKU
	UuejlunfQGTR5TxDWRBVjQVlbQ==
X-Received: by 2002:a37:d7c5:: with SMTP id
	t66-v6mr2550573qkt.336.1538596953799; 
	Wed, 03 Oct 2018 13:02:33 -0700 (PDT)
Received: from cloudburst.twiddle.net ([172.56.13.153])
	by smtp.gmail.com with ESMTPSA id
	k9-v6sm1301898qta.23.2018.10.03.13.02.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 13:02:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <328e9889-edaa-f57f-f2e3-b017a55cc496@linaro.org>
Date: Wed, 3 Oct 2018 15:02:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::744
Subject: Re: [Qemu-devel] [PATCH 05/13] target/arm: Add some comments in
 Thumb decode
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
X-TUID: 9dTrXAvrTEP4

On 10/2/18 11:35 AM, Peter Maydell wrote:
> Add some comments to the Thumb decoder indicating what bits
> of the instruction have been decoded at various points in
> the code.
> 
> This is not an exhaustive set of comments; we're gradually
> adding comments as we work with particular bits of the code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Specifically, I figured these out as I was going through looking
> for the insns which write SP. These comments turn out not to
> be relevant to those instructions, but I don't want to throw
> them away.
> ---
>  target/arm/translate.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


