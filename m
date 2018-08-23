Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1224340wrd;
        Thu, 23 Aug 2018 07:14:30 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPylSWw1lbMy6aYIrrTvblQRyS3xMrlp++3WhDIDxlWC39gL1XvnRpwGSQ5+OSyjLSw53++y
X-Received: by 2002:ac8:184b:: with SMTP id n11-v6mr21660887qtk.10.1535033670108;
        Thu, 23 Aug 2018 07:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535033670; cv=none;
        d=google.com; s=arc-20160816;
        b=HanZxnjNAhg2utgN4/fbVON3SZQPMg4Pkw1+Ux63YBxhAnmttW+0Rgp1k7obz3eroS
         rPT1uV4mIBWL6A3q2AD0QaOVUFKZDGuvtEV9X7K/uA4s3+lCBrxboLkBBH5Ts2Cjm94a
         CDy3/9Ihk/aE8Tj9A3j/KNowIQTNgp+jeNSqDsjq6D+qSdTMIbrJIOKY/8hN5Ha6Blr8
         550XuT44FkryhmiDUqapFVvT9nrPh0IaDJERlEMUbuo0xsK8nGGOgeJcqBVcB9nyQlgv
         VsSuF9wg6d3stokpPyyePBFBvVAwORSy2gKpwwS4vB7anX8Vfn55iy5IxeQDVRkqYj0p
         br2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=YM+EvaAidLNP7hl6dFrLxy0dxkLjxSJeZjuZ7JyEFVs=;
        b=IOrm/7YVPBr9+kqTfOl80rmHEQp/Pmo8LPwDh4bSVh6NURCvIDwwUfgoxFnS3/GDYa
         Yt3wfgzIZvUmetgWM4jD8MRTjfRKu5k18O2WNlm5xhytLpip4hjm68vf1f4PpA02yReG
         ape0Ho3lEWPHrpY3r+d4NCJgY6Qua0McDL5wKCOepoYV6LYk985O7uQW/VxwZdFmxF1A
         AezE2WudjcS2M5nRKrgxyeZXru1IKis3HSiAUQu5vGEeN2jEblmb8AvY3Gkylu7pqIOv
         +PqJRloy/C8pzy32t7LaI0+ek0Hlq+y8Z43nIIcdoGYWj5GCvN0eVW8rEVfMlS3JZ2To
         Yi7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S9aibgfD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g12-v6si1318375qtp.219.2018.08.23.07.14.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 07:14:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S9aibgfD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsqNZ-0007V9-I1
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 10:14:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqKP-0005LI-7e
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 10:11:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqKM-00006W-Gw
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 10:11:13 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36858)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fsqKM-00006C-9B
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 10:11:10 -0400
Received: by mail-pg1-x542.google.com with SMTP id h17-v6so2625577pgv.3
	for <qemu-devel@nongnu.org>; Thu, 23 Aug 2018 07:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YM+EvaAidLNP7hl6dFrLxy0dxkLjxSJeZjuZ7JyEFVs=;
	b=S9aibgfDlKFTQYZqUlFP3RarFANmktSkcRbyjaKvj/Pw11p4u6IAELctct70zIq3fH
	sRmJ1BqN2seiDyb7glhdhl1WuV4n/685kAJDOlRfBkS3Lk8wBqDkyBAOcTD3Ed68cqUY
	k8FCQYT6AonqRAJosSUPzjgfJ7oDWDdN9j9VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YM+EvaAidLNP7hl6dFrLxy0dxkLjxSJeZjuZ7JyEFVs=;
	b=GITZymtWQ5HVtPE09guns4swZB8+jDoX2vfP5IWe7CRwQfAwvStXt2OMsprQ5G1BTE
	jp0hEnWuEM6+ju8+JNcymt0ZTRKuAnPbAHTb02I2RC6OmtrYsguP+hNRP7mIJ0VFc3Lj
	fwoeJRzQTKNDmIGjDAL5RPMNLDokNHTqs/8CBkAmZq4ofqfiL+3XS4UatYocl2EgB0rm
	0+CH5u8aMhgActxuubpaXtuPyYSK2ZBn3s40gMTvSqmyBuT/D8VLwXDizE9VyRxaM7qu
	7ci05MIpYbusPzIw+RQh9e4tesGVEZ8yJ+TNxDxID9hUMUq2/Vp50oGdNDeyeHRiuugG
	BxJw==
X-Gm-Message-State: APzg51Agc4h2i7VF6I5HfoEqnCXxRe4v+W4DkKni7Rcli5ouTPzU7O78
	RXs/pB4i+JTZY34dtw3z+eOwPQ==
X-Received: by 2002:a62:384a:: with SMTP id
	f71-v6mr11889528pfa.48.1535033469371; 
	Thu, 23 Aug 2018 07:11:09 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	f6-v6sm9200193pff.29.2018.08.23.07.11.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 07:11:08 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <01b9ce29-9bbb-983f-99bd-4414916625fe@linaro.org>
Date: Thu, 23 Aug 2018 07:11:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-devel] [PATCH 05/22] hw/arm/mps2: Wire up dual-timer in
 mps2-an385 and mps2-an511
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IjRI3UNIqXDQ

On 08/20/2018 07:10 AM, Peter Maydell wrote:
> The MPS2 FPGA images for the Cortex-M3 (mps2-an385 and mps2-511)
> both include a CMSDK dual-timer module. Wire this up.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

