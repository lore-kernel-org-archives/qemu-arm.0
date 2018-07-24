Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp7141939wru;
        Tue, 24 Jul 2018 11:54:14 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpehEpfsW7w7DXDbv5iIh42Iv8nePdH8RQ1/3msNUVFxEbOy/AyZeT1XdGleRHuIA5W8v8Zi
X-Received: by 2002:ac8:3473:: with SMTP id v48-v6mr16815430qtb.400.1532458454131;
        Tue, 24 Jul 2018 11:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532458454; cv=none;
        d=google.com; s=arc-20160816;
        b=TXmnzThOnPckK0nTaWd0huAKq5K9OJHp9ocXot3qRZQXMPSsH/4iuI4Er0JoRsdU3H
         yqfhZ+PLngNFL4Zx/ePvec9xa9oEpXdbzA5FkqNU0lfuxs1Aael1kc7l+XcQZvKeVVXT
         5ykGwQcqHTrn9rO/+Mq+DCxTE1TfKCcmOVvgzXF8UBeUjyCIbiGcOXB/+IGr1fR+c8sN
         LWvKC56p9p3KTTdFLww4Qx6/8bLjq+myIy+myxiwKDmOC67tF1ZF9XVEqmrlTFk9+G3Q
         KIuZBMfHeQCjPchnnAMbPiv7GSVRCXOJ17buKJ5/XElOjC+unCXbh9rO+lQ0MG94ZC4M
         reHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ayzBp+1IMCECYTgrYnZe3SZvxsiBlhASEaDSP+JKO8w=;
        b=Oen5t1hCk7SENkOw5NNrc/HFLLYumGSpr+CTbxJdTsZFpfwuaVnYSmDEy1DeJGNabl
         9X6OEJaTjEwamdHKXjeNyWU8r+3kYWVA8leXlbCsJ29LEwByhwNULrn5Lxjwt6gsDge/
         7kN+5pQzSUfucXYGZT87ZmooxR7lK0AAAxTlXdcxqJdqcp63I5mip5YLbB3jBPQmOlAE
         77egFIOO4/MJmaUb6i5ZxVKMQNnMriyQXIjLupobg47jxHHIJdDbGZPQJzMYxfylLep/
         wdAZIDqG0LSB9lzPfNZcutAtM/Dd6LG4M8IDkA3EKRkEyqjGeOelm9GHM/Em8VNP0Dr1
         0jTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DpXMPqo2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r6-v6si4621428qte.343.2018.07.24.11.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 11:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DpXMPqo2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fi2Rp-0002nt-IF
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 14:54:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fi2Rg-0002mf-4W
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 14:54:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fi2Rf-0005Oe-HB
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 14:54:04 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36986)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fi2Rf-0005Nl-7Y
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 14:54:03 -0400
Received: by mail-pg1-x542.google.com with SMTP id n7-v6so3522632pgq.4
	for <qemu-arm@nongnu.org>; Tue, 24 Jul 2018 11:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ayzBp+1IMCECYTgrYnZe3SZvxsiBlhASEaDSP+JKO8w=;
	b=DpXMPqo2yNPSaFvNSyphMheG0ZOnn0fKU4j8GGrEfJ17eSEB8JiovzqQXGA80e1ZER
	edtvmRQDbbBMtmGllrqqvsR0k9nDi73mO32J8J+QNe0ocOhHIfg+U0jE20r7qoo1oAjX
	qIFcpsbvTpj96lCXf+kzL+M7C8AsAV4FHz+jQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ayzBp+1IMCECYTgrYnZe3SZvxsiBlhASEaDSP+JKO8w=;
	b=ndBPBj8uZUP0f2wo0XnxwlbuaYskHUBEQ3tiqpq+iFf0nsGRenw0b/mozs29SJLYCT
	QiXBBLOnrDxAyXFfd5xRAXcQBVUiupj1f73T6B6RC/oBG3gBQkT2p2dlBruxH+OmrG83
	K//E+iglZh68IdkTsrfig3Ou9kHKa0+0ACGulRwhz8Pn+EzWUk5/VA/vX+DL2Q+qeKgn
	rb5VDH5NaJTGkAuLgDkG2AYYWkHqhSDQWyMfSpVoxnxfxv79HqzPaEOlvob4/1CxBk71
	2CM5JweelkyUkExmlcQey0UiRZvZsnKi0MeBdhVD+Mct6sBWXZYQbQJ++7qmGgRsmlnG
	xgwg==
X-Gm-Message-State: AOUpUlGFAIl8LgM/2o5sgoT6w89BHFGwj8zPMxCbYUuQfHqNeHsxCkm8
	uSUgL+yTT5xWKRDAYdCPEspIVg==
X-Received: by 2002:a65:62cd:: with SMTP id
	m13-v6mr17316755pgv.280.1532458442079; 
	Tue, 24 Jul 2018 11:54:02 -0700 (PDT)
Received: from cloudburst.twiddle.net ([2601:1c0:6100:a92d::e452])
	by smtp.gmail.com with ESMTPSA id
	p8-v6sm17933659pfk.186.2018.07.24.11.54.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 11:54:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180724115950.17316-1-peter.maydell@linaro.org>
	<20180724115950.17316-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d2c14d35-19fc-ecdf-75d3-aa518747c62f@linaro.org>
Date: Tue, 24 Jul 2018 11:53:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180724115950.17316-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/5] target/arm: Honour
 HCR_EL2.TGE when raising synchronous exceptions
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
X-TUID: zwGfo9qAddYf

On 07/24/2018 04:59 AM, Peter Maydell wrote:
> Whene we raise a synchronous exception, if HCR_EL2.TGE is set then
> exceptions targeting NS EL1 must be redirected to EL2.  Implement
> this in raise_exception() -- all synchronous exceptions go through
> this function.
> 
> (Asynchronous exceptions go via arm_cpu_exec_interrupt(), which
> already honours HCR_EL2.TGE when it determines the target EL
> in arm_phys_excp_target_el().)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/op_helper.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

