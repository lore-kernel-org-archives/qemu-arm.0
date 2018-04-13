Received: by 10.28.4.212 with SMTP id 203csp35967wme;
        Fri, 13 Apr 2018 11:22:24 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49a5boEE+A/snWn9vKgBysPQDnIqSIH+QcUBan6T2ts46oeXnmf0RaJfzOVHB5GsqH5Cmk2
X-Received: by 10.237.57.231 with SMTP id m94mr4387883qte.12.1523643744650;
        Fri, 13 Apr 2018 11:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523643744; cv=none;
        d=google.com; s=arc-20160816;
        b=TFJKfa3oVOB8vHYt3jNQidWrgtYO8cXGaIHKxmV2nbfYPXWHsnKXYfMFFOFSqAoLO8
         vejvxzWxwTDMAM387G9fS6/poiP+X7rEiriz/ycH5pJcX2nhVPhhT3SdLnBdXvLCmyhL
         LrqwGBhgE4cpavPJ2CMtzTnWofJgS5vRqiaOcwpi67fIxhHjecMogeyYEbKVTChFv9JO
         Sr2BnF9kVvwAcVc563jIk/pyghGRCU3/Xt1Iby29TN096UtpTl7HJml5peg/rp4lXCKB
         gbHGMUFttSbuBtomKOMYgkEBhS05d+QA0SPQCwJH2l53YsE4FI/yuaL0CMsYoUp/Dmzw
         oOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ZUYL2c4ElM2dh1bqdrojPvldonbiCWxZizZhSfbLW+0=;
        b=biyahHwz1LzOtIlPLFl7kvUyjAgSQRAykzzyt34iNR3mYaS0T2RqDWTyBc3E+RqcVR
         jwgCEcSGmsv9iXUz18LwtfndL5Gc1zsdvA0AxnPnHQGHSj5pcB03mQK9Nw6d0PSoD0b7
         J4DdJmw80t5HVe2nfvU0JHeaXmuE3n/IRhEMPgOFIrnLigUrREbgNHGbRQf88VjFkaWB
         83T2xhjZ2URfSIZO1BmZkg3FtBXZOGKF9SiwXCPy+y1MxEUNejnMijHfqkM4TgXya07N
         U8f2an+uFdH0NQTci64dtLRUqXxEz9UFNuscJxhOc4MklTaIKK5iCF/FEnrvy83bsRMe
         0bkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kmmQEpog;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r19si1227261qkk.311.2018.04.13.11.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 11:22:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kmmQEpog;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f73L5-0003X1-Lu
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 14:22:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1f73IW-0001J4-BY
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 14:19:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1f73IR-0002oe-9F
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 14:19:44 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:39502)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1f73IR-0002oG-2v
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 14:19:39 -0400
Received: by mail-pl0-x242.google.com with SMTP id e7-v6so6524280plt.6
	for <qemu-arm@nongnu.org>; Fri, 13 Apr 2018 11:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZUYL2c4ElM2dh1bqdrojPvldonbiCWxZizZhSfbLW+0=;
	b=kmmQEpogv6r8z7ItkFU+YLh+4vRMMOLgCZmJCv8wB0ormOv6L2+XQpDNDIfkLGY59N
	deTqUlTkuxycaBEwBI1ocSiFlscc9asZTDv3HKHK/YfpyiuX8+1FuFBRMYGRfR8QxKKS
	uYbyOshlMFmpZhJK1tE1VSHA2xCYeLTB2WcH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZUYL2c4ElM2dh1bqdrojPvldonbiCWxZizZhSfbLW+0=;
	b=gQ5eJqPg/xSUS40Qh4jNKn+r0oSho5AiXbEHB3q6VaL3eFfqGMBwBwEvxSHSvHUVz0
	xcMFg3lA/alBFTJAgCuSeIx+kdck9czb4jCKILKjlR+bdAHb14b9TDnP30naRBuFN51b
	VkJ4ZDY0d0//3EOJkNrLkzzTDpwEc3XIRbpYLDTm3e5enayXTeMYud3e/bFOR570+YwU
	NHa5Pr9Tq3DoEX6UApRhjqMxD01TdP+KXvUUo1unrthEKJmM7+LDTMbxv/paZQRdWuwg
	wi0b/OqbZyB0bQMU9p+PGYwE0JIGQ1NyBF0SK0DAIRD8YBIfwleiOtBmyn6j6GBq/DLp
	9BqA==
X-Gm-Message-State: ALQs6tCwfrynFDX+WoEQyVTRCdU/2AI0D8FWCJxgM5P3Nwm0GYNR7/jQ
	5iHxlYpz4163MhinHdniFCJiOuP5NCE=
X-Received: by 2002:a17:902:8c8c:: with SMTP id
	t12-v6mr6174281plo.100.1523643578246; 
	Fri, 13 Apr 2018 11:19:38 -0700 (PDT)
Received: from cloudburst.twiddle.net (cpe-66-75-76-48.hawaii.res.rr.com.
	[66.75.76.48]) by smtp.gmail.com with ESMTPSA id
	g26sm16738039pfk.173.2018.04.13.11.19.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Apr 2018 11:19:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180412140222.2096-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a11d7ba8-4b29-5970-9574-b2ee2fa5c8c9@linaro.org>
Date: Thu, 12 Apr 2018 18:46:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180412140222.2096-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12] linux-user/signal.c:
 Put AArch64 frame record in the right place
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yydbByDiC5ay

On 04/12/2018 04:02 AM, Peter Maydell wrote:
> AArch64 stack frames include a 'frame record' which holds a pointer
> to the next frame record in the chain and the LR on entry to the
> function. The procedure calling standard doesn't mandate where
> exactly this frame record is in the stack frame, but for signal
> frames the kernel puts it right at the top. We used to put it
> there too, but in commit 7f0f4208b3a96f22 we accidentally put
> the "enlarge to the 4K reserved space minimum" check after the
> "allow for the frame record" code, rather than before it, with
> the effect that the frame record would be inside the reserved
> space and immediately after the last used part of it.
> 
> Move the frame record back out of the reserved space to where
> we used to put it.
> 
> This bug shouldn't break any sensible guest code, but test
> programs that deliberately look at the internal details
> of the signal frame layout will not find what they are
> expecting to see.
> 
> Fixes: 7f0f4208b3a96f22
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> I'm marking this as for-2.12 on the basis that it puts our frame
> layout back to exactly what 2.11 had, and so seems safest.
> No sensible guest code should really care, though, so this is
> in the "only if we're doing an rc4" bucket; but I think that the
> softfloat fixes deserve an rc4 anyway.

Granted.


r~
