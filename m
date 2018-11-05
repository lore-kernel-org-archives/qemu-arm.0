Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2503297wro;
        Mon, 5 Nov 2018 04:16:20 -0800 (PST)
X-Google-Smtp-Source: AJdET5eCNYnfB/2R8puvMo2O1ErhnpdGV5fWCSfeVUcxcryS7UPgcD7mbLq64VF255caVs/98p3L
X-Received: by 2002:a0c:f313:: with SMTP id j19mr21150554qvl.200.1541420180504;
        Mon, 05 Nov 2018 04:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541420180; cv=none;
        d=google.com; s=arc-20160816;
        b=beZi7WFvrSVHc3d1cWqCY1hRpObh3Hsmz37neOj9bzD4FfS06io4G7iTBrzQziynd1
         TOdI0UI3xwRLP1eVsSAMz0CrL4OBvSuzbAhfxdWjCUfPbMlLicsF64Q19wXL1enV+dvo
         tPqw4aZHG5marz31dtT7ntewMtqnO2w21Ectxm4CNDD+Ii5jFM6Qpm1f7CRmoMMCeLqZ
         UPYqDv69UbhrQA59Ry8IS5TMpPky9hKHgeAp3jJj2URkIEyW5N7WzO3mgARrtJ1ijwbp
         ZmrSD6SgdMVxx+sTyWARy7iBeGtKemktaE0nYwJHpBRC65wSRo6Uz1Fjh4va3ZIfyIOI
         OeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature;
        bh=qsAdYoghFw64QKu2eW8FnUrgScrB8wUMl/7EmM1SXcE=;
        b=rBeYV3QWqm3/wCxOM3V4Mvlr4u5l0kAclMxb1+/iWZOtoSvUoZz0ZxfUSJ+fGzoPyv
         WyYsJrocfApJQRf1WgYiHMmsRwtfRHzeONLhnq/KC2RM7tclZn/ZBoOqQlwlDAZnmvTS
         zac+48KTZ9dX4JGgQkQjwCRDtgEZXcxiNU0wek1E82UI9U+mRJLSiZWFtXgK2ff/9i5k
         BbkfWfO3dg0eMRBVLqJNgzDB8iBVvxchiC6qsNK8v84jS/DhAn7+5XdoHWL9QiTk8L6d
         OuI7EkmD8PKbIiGVZaSUTdNZ81ZUjwLFZYCq3LioylXXDXjq5Nxm/RcQri8yL+rEJoDf
         JwXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aWAPRRaO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t9-v6si13450573qth.297.2018.11.05.04.16.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 04:16:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aWAPRRaO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJdno-0007Wm-0T
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 07:16:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gJdne-0007WO-PQ
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 07:16:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gJdnZ-00022y-ND
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 07:16:10 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35174)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gJdnZ-0001q2-Ba
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 07:16:05 -0500
Received: by mail-wr1-x441.google.com with SMTP id z16-v6so9290123wrv.2
	for <qemu-arm@nongnu.org>; Mon, 05 Nov 2018 04:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qsAdYoghFw64QKu2eW8FnUrgScrB8wUMl/7EmM1SXcE=;
	b=aWAPRRaOJRgrhVRAM4JrnCXvIJ7aq0eN252ujuh5M7q32O/9JqBUmbBtzt0J73+pEU
	eKdYdci2jLpIxDVu7oNwicxP0zigKKh5QsXWQQbWWjsPnIvQqqcVXLva5g3F5UUg674p
	7DBO4r+RmlTGA1v05+BTTpcS8p+iBJ1f74Z7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qsAdYoghFw64QKu2eW8FnUrgScrB8wUMl/7EmM1SXcE=;
	b=B3y9c+kdTNsLaqNRrdq8WRjiCYJAzlT5U5ynumTQAkIpUzFHB+cG3qPwOmnQ5TIqAs
	/z8N2HORlrwud0POHsBi3rIzjFHenzF2OC4wywPPBfCRe33FdHa2+jNwWQEE2agrd4k/
	oECtp7wa3fNijQajynWjoW9gpnhUMXhNtxR0gYGYnhrzmHOEAF9VrUIpuEgkIdos0cXX
	5C7NysxssIyD71rrZhB7SoBBG+Qnb0EZt55YW4UwzJTbcumQl/7rtUvpJg+AlDVqRdCq
	7oj4xC35aNAqvdwFoXQ02K87PMHL/KSFKgQVc4+6q6LwNuP+DP+uC/ltx8jtrRD5HPcY
	0anA==
X-Gm-Message-State: AGRZ1gKPtTb7mkxtmDC4PmfmcU1UvUdHFbyYUXLG7mFeDmnUlrA8opkT
	EELs6NXJG5D78viJbRlCAFPJr2mu3WM=
X-Received: by 2002:a5d:6407:: with SMTP id
	z7-v6mr13359490wru.64.1541420163556; 
	Mon, 05 Nov 2018 04:16:03 -0800 (PST)
Received: from cloudburst.twiddle.net
	(cpc92880-cmbg19-2-0-cust631.5-4.cable.virginm.net. [82.27.106.120])
	by smtp.gmail.com with ESMTPSA id
	r14-v6sm11304817wro.8.2018.11.05.04.16.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 04:16:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20181102134112.26370-1-richard.henderson@linaro.org>
	<20181102134112.26370-3-richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <102bd244-b80d-9445-48e0-304a1a3cde37@linaro.org>
Date: Mon, 5 Nov 2018 12:15:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181102134112.26370-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-arm] [PATCH for-4.0 2/4] target/arm: Implement the
 ARMv8.1-LOR extension
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ETebeSbjYguX

On 11/2/18 1:41 PM, Richard Henderson wrote:
> +            { .name = "LORID_EL1", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 7,
> +              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },

For v2 this will be correctly marked RO.


r~
