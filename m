Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp7141189wru;
        Tue, 24 Jul 2018 11:53:14 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcnq+g7cvwGl/ReK/CcsDJfCzBstn/LJp3+kE8sH1ec7iC/CuoJ+bqYj01nFSe/g/CHUHHh
X-Received: by 2002:a0c:d4d7:: with SMTP id y23-v6mr16184134qvh.234.1532458394797;
        Tue, 24 Jul 2018 11:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532458394; cv=none;
        d=google.com; s=arc-20160816;
        b=wNtCCPDIJ9Luq6QmJ+i74cJxkXlP1I0Gf+7sVH0cRLgltBHb3lByKLqCSiGwa0bycr
         CK3NCNz4El8EnDM8dHC4E5bkuBk5GEv0NetGfy+N/PzoXU0YoL0MZXbaOs9/C1Kb3vuV
         2LFTa5XuY9N+f+l5Pe9m60vrq9OitTqhbXolj0ENDtIWw6Q22/2BMbNrbbaoBRdD29TP
         57Th64QF2xlze8SgECIO9MMpsbyihMSzgR/b4sWWC+bFUW9yu/N+Xt6ThlFIZMP5acsl
         BgO3/lrUQQPyWT7mYW5stDM1NrTeEXYHZ0Bg/xLUlIiWhFMCl6+pUWOBF8HDPU/VYMR9
         xWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=jEcnAISscdYjZpnfrjlrqNBkrgaKZVniRGOd/j67WXw=;
        b=VDIMPKViKL1aOUqiuddoN4u0k/jBIsg03oBTVzBytr4vR4rvZtvLAygOPRZyDmK8aI
         GRLAHZGSt1P/urKxfcUW3Dram2BiKCEh3cZ4hXW4Yc6nftvkANzm7nqc/jLjW8o94XNb
         TFTtVCsQMrX5tMpjOda20VzqWLoFMidIzeBe0CM3LCDsUSDGIOmCBAEJ0+oAkm937IhG
         6zBpAv3FX2Y01wAcfBboi424L5eLXk3/Y92a3XU+nCBqUEllb6Hp9JvPaK/sr0ijAiiU
         hHjbLx8+YZLXVJqXUmv9nc9TAxbYcN+rkuP0ThULD2x2mYOcMXR7IunWYu9Ma7tH31Li
         Bl/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cUcRo4bT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h40-v6si2250479qkh.132.2018.07.24.11.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 11:53:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cUcRo4bT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fi2Qs-0002Ct-4H
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 14:53:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fi2QA-0001p4-53
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 14:52:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fi2Q9-0003VT-Gn
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 14:52:30 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:36461)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fi2Q9-0003Uh-9S
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 14:52:29 -0400
Received: by mail-pl0-x241.google.com with SMTP id e11-v6so2159530plb.3
	for <qemu-arm@nongnu.org>; Tue, 24 Jul 2018 11:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jEcnAISscdYjZpnfrjlrqNBkrgaKZVniRGOd/j67WXw=;
	b=cUcRo4bTiFYxfBiQeMArszdSwzYHUx7tnVbfUgKhCBkiVmLKOex1u7XSdHE1f6/Ulh
	FRVc+k6oxRNDVniQsRSxB+5yBxgiUlbXck5OacX0eb2ziaKyRKisFzvTbsNrk7+PFS8F
	ZNJwqIOIKP2oWBHraIpnhsarlTUj5oGfgheI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jEcnAISscdYjZpnfrjlrqNBkrgaKZVniRGOd/j67WXw=;
	b=aqEwVJGbY2gq8c6jJmTHUtOufnjHgb8jUP7qg6raJdJ1lCp7ldO55T/5RJflB6Mbdo
	YtRe40FcSTkV2VaG99B1gjYrdkjpKDKAjGPklx9U48pdNorWC2jUx+N9pIMxyuU1gm8i
	9waM9UERMKDoNWCZDWz17GukIo0fldhz6r1eHg9UArlcqV9UIkyV6gcSeVrUuPJp++h9
	Xl7BaPoE9GzTXsa3SCLrywMD42oGJJ1V+Qv7Q9/OsGsU/TcIYIRdTlP88y6GNJI248j/
	g+uDUBnjJKwLCYR3+Q/Hz38c47lVq8JFeK+uc0MXElPMAeC0HJC2wL/ipIN89kLHbxDG
	UUsw==
X-Gm-Message-State: AOUpUlH2MlV9GLFVO5083ZgX+uJHJATSgkBqPopStLMbKkM0PMhfd+K9
	uigWMiwy70LCORNd2igzDitRoQ==
X-Received: by 2002:a17:902:5381:: with SMTP id
	c1-v6mr17822312pli.137.1532458348251; 
	Tue, 24 Jul 2018 11:52:28 -0700 (PDT)
Received: from cloudburst.twiddle.net ([2601:1c0:6100:a92d::e452])
	by smtp.gmail.com with ESMTPSA id
	v20-v6sm30602121pfk.12.2018.07.24.11.52.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 11:52:27 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180724115950.17316-1-peter.maydell@linaro.org>
	<20180724115950.17316-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b3cd03de-46e7-11f1-bc35-1a351052864e@linaro.org>
Date: Tue, 24 Jul 2018 11:52:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180724115950.17316-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/5] target/arm: Honour
 HCR_EL2.TGE and MDCR_EL2.TDE in debug register access checks
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
X-TUID: 7rhdaYG0oMzB

On 07/24/2018 04:59 AM, Peter Maydell wrote:
> Some debug registers can be trapped via MDCR_EL2 bits TDRA, TDOSA,
> and TDA, which we implement in the functions access_tdra(),
> access_tdosa() and access_tda(). If MDCR_EL2.TDE or HCR_EL2.TGE
> are 1, the TDRA, TDOSA and TDA bits should behave as if they were 1.
> Implement this by having the access functions check MDCR_EL2.TDE
> and HCR_EL2.TGE.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

