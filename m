Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp42573wrt;
        Wed, 3 Oct 2018 13:21:11 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60LkEp23rmLH9mQOpauH7+MAKK3tdmm2cXeSogahwOky8ciUcCVzV4ByjsGu+8gSD59RqV9
X-Received: by 2002:ac8:6c8:: with SMTP id j8-v6mr2676169qth.314.1538598070965;
        Wed, 03 Oct 2018 13:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538598070; cv=none;
        d=google.com; s=arc-20160816;
        b=cc+7Yt8lvMLf9/3mYF2H4qAI8rFCrb0JLyFetsjH2V6MV+2b2d4LALLa78igsESVuy
         Bpc6QhY1k6mdgb0H3F/bhQoXas3DmrOHKj4L2yfCxf3Yp3lvWHfisUG1sUFESXKuXMUT
         UAnIdBlT6JVLFW4zgpZUxYkM90T/h7tyYGzF1Lmb45i9J5ieYmIQgzaKPeo7qIAjMTOp
         gjq8C5MCjcCRrUTkSNsCamDUSfrB4umegee/gDFadX8yMpycDxgJfpbGMnDS1cXrgHmb
         gP6FHHqOugmAj4EHuw4CpuLGPRdzDVqDWzyYicfYRXZsBE3DFXi3xv7s7KqjqscPbqG3
         PMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=htx1PFHt4IBHD91Mcl6MRoLcPpORAw+qPtWMhVuRl+Q=;
        b=t0iVxeXgPZMN6j3LT2GZr/Jd/8VxEWTSgj4rAXyj54idZyoxxtEg0Es4RFjwEBQHkz
         MAL0zs3K9UCsbf7p1tAqbh7pd6ScNiLEmln36f9zc/Vw0M7d9nPmFwZwE8QrDVsZRpMn
         iFZRRFbYa1dKFpupOb9sgzffkaUvYfCcyeUerLDOlhcx5t30PnydNbtpvBlQQv8j8cHV
         ToQU+RAdelprTERo/F11dmsWsw860CpUMw+m2TY9X1N00IcKCkFZy4AkOMW/SZYNoogM
         nE5BYrB9EEL4pO9dKjkC8qEgWTmyWwyyJzkF4VBbqBqPOXgvJLGjhRMG3QBHo0ptiL68
         fWEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUSP2bDp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l54-v6si391040qtc.78.2018.10.03.13.21.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 13:21:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUSP2bDp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7ndu-0006ZY-CV
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 16:21:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7ndM-0006R1-5T
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 16:20:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7ndG-00073E-K3
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 16:20:34 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40812)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7ndF-0006pv-SP
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 16:20:30 -0400
Received: by mail-oi1-x241.google.com with SMTP id j68-v6so5631510oib.7
	for <qemu-devel@nongnu.org>; Wed, 03 Oct 2018 13:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=htx1PFHt4IBHD91Mcl6MRoLcPpORAw+qPtWMhVuRl+Q=;
	b=eUSP2bDpAr08CrzJrcnDDl9rjUIduLFK1ZqJC9ncpE0ew+SIgkl7kVqikCeHk4ZiJW
	pDTgU4YLKe3uzCwYW1+EhroD9oVNaqDttTRDg75NBADDAsF707YUjOql/Z1HG9Vxn1zo
	yzQaMG6iBT43oCrD5Wp2TjoURM3bkdZaa6x5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=htx1PFHt4IBHD91Mcl6MRoLcPpORAw+qPtWMhVuRl+Q=;
	b=Sc149EGDOuiGh9fdpjBL7Wagp2I5H7uaOovn6uBmpNAn+8oYC+xNXrRFrH05c8K28F
	rN5amqFdiSQtLnCX8dmN071co9kSiZOhtHLz9bY6ymbZiBWF5kLC4BAWPJGmXCatDTWL
	cNfhNs3z78LyJi5GLaYStSaTd4SdGr8euv6dhXZTEyq1cGqqzXsbl3SjopHcL073gGjc
	8SXW8R6LnjxCCynPLk0VC4wKmF3Wsi7R6BGocwCVKgdYnjvgr31YfOgRFp6KeMUC/OMS
	JqsUMDNBrW66S1l8iERpaHyo1bcTq51YKSXkP0I5T61nQtWTEVD3C/OTjpPLWSliiQvu
	pLDQ==
X-Gm-Message-State: ABuFfohbmBlGLd6A1FKlAUz82PpKkbB7oImd0fg0di0dIIXVRKGth45w
	PFxP5QOHy6LC+6shdrK0iDax+Q==
X-Received: by 2002:aca:36d7:: with SMTP id
	d206-v6mr1609638oia.63.1538598008009; 
	Wed, 03 Oct 2018 13:20:08 -0700 (PDT)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	w128-v6sm779448oiw.15.2018.10.03.13.20.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 13:20:07 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <69209684-a544-8d67-1c37-cf5e3a1ef159@linaro.org>
Date: Wed, 3 Oct 2018 15:20:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH 12/13] target/arm: Add v8M stack checks for
 VLDM/VSTM
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
X-TUID: 19SLdDR85LfC

On 10/2/18 11:35 AM, Peter Maydell wrote:
> Add the v8M stack checks for the VLDM/VSTM
> (aka VPUSH/VPOP) instructions. This code is currently
> unreachable because we haven't yet implemented M profile
> floating point support, but since the change is simple,
> we add it now because otherwise we're likely to forget to
> do it later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


