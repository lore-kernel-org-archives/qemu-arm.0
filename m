Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1899737wrd;
        Thu, 23 Aug 2018 21:20:55 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYE69wn9769oP27WL1s96G2mROSPoBOAdmUQA1DX6LTHvRjvTwfb+/Vbj1+0f6l2Rk19cTv
X-Received: by 2002:a37:3892:: with SMTP id f140-v6mr10474681qka.320.1535084455506;
        Thu, 23 Aug 2018 21:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535084455; cv=none;
        d=google.com; s=arc-20160816;
        b=Qq6puOcuve+4EYBTqVQLez1COe0jMFG4sMwWKzsFWUhOzkfPjZm8L/RWzyf7hkxTb/
         pupXEh9fgDwhqhbwdMdtzfFQJfAfyUgL5Y+TuemzVNhQvbgElFHgw6PGxKQqPAWpmOkF
         Ov5aQN7m7+S/zfcZJAyJPL9r+MEaYa9EG3KBfihGAsWZVPKTNL9MERfiU999khX3Gi4D
         P80yMu576UwQFL2IXRiJNK1yfilqUo5WItUj3aC/01cVM7xSafow7G5AGuWQEXMQPuiy
         N8RH5nUq0ltPFSmxby6qNzo8+4D1OeECcXe0xv3uGQkTHjiKFp6ZqNdDCBU9mS5UE6Lr
         zAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=CUVaUX7DX7B8mD5ZoeQQTzUHTU5nwaBt1aaNe5k7LoE=;
        b=TK4VKF8fausktzYra6MippItIHptKFhdlae70wTdV24MaSEgoZVBJkT9BF+ULR8MEY
         8b20NZKMIvBG9mDq8drxqjpJ7B3VSt9T+8BPEDs1NC74a70CQfvlqbmKYb+zCxVdCzpR
         /xj1jhmtI9S7iAW4YEMgTmEKVLri7cut1lb0dMQZ8ihgExcyorjR+q9nX9i5CuWnTrRU
         9skSzjfo0QA9XgzQ+fm0qXXwog/TztQcPMMHHWIYwCNEFLYRE9bL6axrkTYAmiaJZFXN
         NQUwHFka39S97BpegurEvw7tAey/eFdxylYFXfE8s1y/RBNzopP7dgDbuysKcSd2/Pig
         IELQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DAOZ55+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s127-v6si6080933qkh.181.2018.08.23.21.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 21:20:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DAOZ55+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft3ah-0002ZY-0Y
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 00:20:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3aO-0002M3-Ra
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3aI-00075A-6f
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:20:34 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34573)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ft3aH-00074X-Cd
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:20:29 -0400
Received: by mail-pl1-x634.google.com with SMTP id f6-v6so527411plo.1
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 21:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=CUVaUX7DX7B8mD5ZoeQQTzUHTU5nwaBt1aaNe5k7LoE=;
	b=DAOZ55+L2TopTxUat/LhIxnFl/5PwHC1sOniT01CS+g9Fun7vAelHa8p/GK62m5nmc
	+N/TtgR2o6HWtWpcv+qyfzHdhJxFoxYB01JTv4vOhJbRdEftVfiWrMNUfcY9fASeipvK
	kdK3DHPsHtJV5lfcEP9SdBac49kdJlBRAJGtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CUVaUX7DX7B8mD5ZoeQQTzUHTU5nwaBt1aaNe5k7LoE=;
	b=K7j23mdCRIR7SL/hDW990P+omyXQR5mXMuXGCIwhEETU9Kg35GgRUbymRruErs50C1
	kSyFq2qs3WvJH5MLrvj86pTr426VYKSu45icAZllNnkegAgqs488ZIjeUnt5wTIJEirL
	m7E7+OrL+mjuPQ4/Y5CVx/eZJlk2DbywqZZqbTzoS0GiuMSnLSVrS1AkXA2reAmkL1ui
	IQrctTdsL1bTgU3WSuEU9RZPaB1hpKIE1454Un7A0yoyStE3+blvoJzSXFd7mcwMEL6q
	+0ipmD/EBoPH3Hdr7IYiIsfGUoGiU0XTwifDrbPh3qiAHmRCg4DjskvlKlv6hGWfpVUx
	7C2g==
X-Gm-Message-State: APzg51Bluj311nIU0vRuM9owLRGsVfWtp2QwGU0xeLz0Zcrs7nfTAZVm
	9Q+IuWuAur/vUoE31fxdgLr3ig==
X-Received: by 2002:a17:902:7613:: with SMTP id
	k19-v6mr2754914pll.317.1535084427949; 
	Thu, 23 Aug 2018 21:20:27 -0700 (PDT)
Received: from cloudburst.twiddle.net
	(50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
	by smtp.gmail.com with ESMTPSA id
	l70-v6sm3023244pge.36.2018.08.23.21.20.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 21:20:26 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180823175225.22612-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1a00a128-08ca-a214-5f69-971a867cdde7@linaro.org>
Date: Thu, 23 Aug 2018 21:20:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180823175225.22612-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::634
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/mps2: Fix ID register
 errors on AN511 and AN385
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
X-TUID: CgWIwemAsfho

On 08/23/2018 10:52 AM, Peter Maydell wrote:
> Fix MPS2 SCC config register values for the mps2-an511
> and mps2-an385 boards:
>  * the SCC_AID bits [23:20] specify the FPGA build target board revision,
>    and the SCC_CFG4 register specifies the actual board revision, so
>    these should have matching values. Claim to be board revision C,
>    consistently -- we had the revision in the wrong part of SCC_AID.
>  * SCC_ID bits [15:4] should be the board number in hex, not decimal
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This fixes a bug that I noticed for the AN505 model and fixed there,
> but forgot to also fix on our other MPS image models.
> 
>  hw/arm/mps2.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
