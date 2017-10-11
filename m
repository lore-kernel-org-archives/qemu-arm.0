Received: by 10.223.197.9 with SMTP id q9csp78673wrf;
        Tue, 10 Oct 2017 17:29:36 -0700 (PDT)
X-Received: by 10.55.103.138 with SMTP id b132mr17176369qkc.50.1507681776845;
        Tue, 10 Oct 2017 17:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507681776; cv=none;
        d=google.com; s=arc-20160816;
        b=u4T4H+m3jabvbak8ZGvQLYEF6gTQBupdMNmOx6SiW0xTkS+N3JIZCs5PAbsBksBdSw
         23q5Lc9IwRAbV6zg4TCyKcYtwx3QQUPokBcQzI/vmFR2YkUBu3zEL1pplJRQ/UNpGvQ/
         I7Q43bHA4C2WKfHpi3ipPdNcTm76CRvFks5p3oj8RlRLEPL5I8vYaeSOG+MjlxcVnByw
         cNrpBeLN2lHv/GY4KiggFQlMkFiIzYR5XLpImpUqlTa6LhC3+lp26ncic5FYdvc/sEry
         VkUL/NDWjqmW+SFoMRYzS9Yp7Al18++bRWh/RaG94byuLTwyno4bjvwsTKBIin2q8YIR
         eHQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=7cxlY11STCrcWgJuSndTKpCYF3HBTJXVuzvQRCYo8w0=;
        b=QxpjX7CMWEpVnUWHU4gnMAB/AtSgZQOBoKTTk+p55SZBIgPi16+theHOTnjIgaCTcR
         nwJIlK5oc34psrU6xANiDK4uCWQ9bDdlOvAVs1Hmb5dDT12EvFWD5jM/3Gj3Y6KmECU9
         CtpPnjUF1LgRL+V+3SJ3//uH+AExiSOpRFbnR8He3GbLXMCxYnkLHUToa1bbxryl7kuf
         s/SgHRTERvCNjd5hvNFTyYhUGjgIgOSbwbCyycvsq8u3Vnkezj4vsnMg/eLnGNx5BJ/e
         /mNLYHJFLUnXOxST3rf6X/LjkOGfJjOfwgkw43P4+ef76Mny4xoasSCacVc+PwZ7XXn4
         f8Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jn2T2CHa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r4si964536qki.361.2017.10.10.17.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 17:29:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jn2T2CHa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e24ty-0008NV-Ib
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 20:29:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e24tp-0008Mz-Q5
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 20:29:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e24tn-000653-4L
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 20:29:25 -0400
Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d]:57139)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e24tm-00063y-Tv
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 20:29:23 -0400
Received: by mail-pg0-x22d.google.com with SMTP id m18so73396pgd.13
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 17:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7cxlY11STCrcWgJuSndTKpCYF3HBTJXVuzvQRCYo8w0=;
	b=jn2T2CHaE5uY4I1umaBy9SwqsZ19UQga26PcB9DBFosUd1tcyHZmhgm2LcqZ3kZoCP
	ciEo3tpZa0vsvJ6YxE0cpf4+h36flIBXIE6XLaPmSs4c/bsKUgdgh3C9UyXq2aPK8tg0
	TRVK1e0F+HLmKm0Bc3TG9V2zoRn7WDC9DLpjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7cxlY11STCrcWgJuSndTKpCYF3HBTJXVuzvQRCYo8w0=;
	b=eBDrPiE4WNh5wi9ntBC3Tdeo+WbCx7x9b9BQqjvfEkvtxbHy3Jt0Vr1UqlYcnCfCyq
	QNb3XkWd7Fge5Kad7JM0Subb4ADI+Zq1Fke2VYasaDayEwOq1wBPAJbSLpcqekiGZ2nm
	tRMEbEVgFUqXV8GoFzF3+FCBB9Set/owMpxZ2v00f3hb7/E8ZbQtuo8/Eq80NjGcTP6E
	ar5GfUYRkCEfCJX28c2TohJGnuRzOHBSe4UaDc+828RZvnWOuhsqM8VSBctKhiDUJbfa
	e2l7vjdRf83816ZXns044bWBFuqP9cCUQX/CxLQkN396sJfAjnZG4frQOKtP/du7Ms0z
	vEew==
X-Gm-Message-State: AMCzsaUko1BM6ocpEn/CkFNCGap1AiquYX6wMXIFRRecwuKYzE9aLLxd
	u3BHwEluHgF5uVRn2ymsf+RZPw==
X-Google-Smtp-Source: AOwi7QD5t00lDbWY8X0skFDH13HUtYPe0yRd/BFEay9ZkuKk3GZH4lvm9M1MtjkfCoLZtNJj2orlOw==
X-Received: by 10.101.88.131 with SMTP id d3mr13946752pgu.209.1507681761918;
	Tue, 10 Oct 2017 17:29:21 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net.
	[97.126.104.76]) by smtp.gmail.com with ESMTPSA id
	p17sm9061264pgc.66.2017.10.10.17.29.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 17:29:21 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
	<1507556919-24992-6-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <46303e7b-2f9e-cf0f-8b55-0ebf03392462@linaro.org>
Date: Tue, 10 Oct 2017 17:29:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507556919-24992-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/9] target-arm: Don't check for
 "Thumb2 or M profile" for not-Thumb1
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QC9wMkUWzI+0

On 10/09/2017 06:48 AM, Peter Maydell wrote:
> The code which implements the Thumb1 split BL/BLX instructions
> is guarded by a check on "not M or THUMB2". All we really need
> to check here is "not THUMB2" (and we assume that elsewhere too,
> eg in the ARCH(6T2) test that UNDEFs the Thumb2 insns).
> 
> This doesn't change behaviour because all M profile cores
> have Thumb2 and so ARM_FEATURE_M implies ARM_FEATURE_THUMB2.
> (v6M implements a very restricted subset of Thumb2, but we
> can cross that bridge when we get to it with appropriate
> feature bits.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
