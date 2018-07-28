Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1975624wru;
        Sat, 28 Jul 2018 09:44:04 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdprflpTKAzGtatFGoENsLlgmaSrM9kSkIx8VYQxlIASK/cK+gNqOxKvImGxu7x2BkxpzsN
X-Received: by 2002:a37:c445:: with SMTP id h5-v6mr9696233qkm.392.1532796244797;
        Sat, 28 Jul 2018 09:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532796244; cv=none;
        d=google.com; s=arc-20160816;
        b=wc8h6A3JWElL8Wf97IVWi9juI7PFxA5nraQNiWFQ4lSrf5id6fbeX2bjR9WUSdXpBg
         9PasL8llbhTCJHi7iqq8ymAnRO3OamO7iv8PqKP6hq1i0zgwJh11bPSruPNCWHf+8SqH
         jJz07rweT5MahTdhN/LzCDEo56EuC9e7A1lKsRyC74PN5siG8PBwHowSPgYgURR8IrfY
         tByQIuusIMWMamLhGxDVstLhqiidr+DRVrgDdIW4ngT5J3vags6TaiyoKAmx/3YA1Hhm
         AYMFycfSvHcAc7gMse3sm7r+dH0sla1d1pFWG8vyJEIf1I3oUgBUHfYPcm/7Ih1drwA6
         A3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ADXQe70Ahoh8zeLtu5v8FtFlssxNjtZW1I22RB/CdLk=;
        b=Vk/H05BSzBCW/Onv7fJr9vzlSJR+w2gxfERv11Cvx7ZjcJvE1jdgQv8BZx2ZmcOcx0
         3BOO7yxvvrYgG8ipBsozLij9VqwJ+jmzlDpb13CMieAjoQpzIKFVLPaNw4y9vL+MuHjs
         ELkhx4CWffpR7cSb0XSxPeBXlBmMKkM/1y5wjszZ9tgRLkCjCblD7SRx29vvdAzHtFVl
         ZqGwhuk62e5RvW1/4izPxUBZjccmDYRoAVs8Pt+sGgJOn5Xtrf6nraaHj9qVjVn3FlKD
         9G9o6bZ/sYHSryggUzOLsdIaeeZNVcvoZ1uyqFpseTA+/5HGEjC0aMQurJGPqC4tX/s/
         9vaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SVmAACOC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m88-v6si2142870qkl.237.2018.07.28.09.44.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 28 Jul 2018 09:44:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SVmAACOC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fjSK4-0003F6-CK
	for alex.bennee@linaro.org; Sat, 28 Jul 2018 12:44:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fjSJ2-0002rv-NQ
	for qemu-devel@nongnu.org; Sat, 28 Jul 2018 12:43:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fjSIz-0007Kj-L7
	for qemu-devel@nongnu.org; Sat, 28 Jul 2018 12:43:00 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:44527)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fjSIz-0007IV-6t
	for qemu-devel@nongnu.org; Sat, 28 Jul 2018 12:42:57 -0400
Received: by mail-pl0-x244.google.com with SMTP id m16-v6so3622426pls.11
	for <qemu-devel@nongnu.org>; Sat, 28 Jul 2018 09:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ADXQe70Ahoh8zeLtu5v8FtFlssxNjtZW1I22RB/CdLk=;
	b=SVmAACOCFJZmwaDWYv4AZ/SkxNLnFNZ53TJGWgzF35SKcidixTyzeEECoBjYnJ9Bu+
	O+RIzEHIpCg5lla39US56B2H6Jw3YqSFXs0J99WhKi+AqTMpDQ3EA5Wyt6pARaCepsvK
	H1/nMgdgOTMXbmoAgTjsWDuKnBSF5IXtDLSFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ADXQe70Ahoh8zeLtu5v8FtFlssxNjtZW1I22RB/CdLk=;
	b=IqwEUKzt10FiSdFeemHO01+t+/6xJtcRYlrrCvFRaPFWJmfHjnpdS8X7ceBsuSUfFq
	ArM2JoFszRd96MAb5kb+RqFKvUcDn/DkH4gHXx5uNKHueHeAJyHscZ0IgQRxWBqDUseY
	CY7LIiAzFKPMGmsNZspx1Sct0a/eGfhZi86Sbsq9vcTtbnZVb0D7bZjr8sekIKufSymd
	m/0XYmD16CIfsiNXTRvK8rck+EgM/SS5z0vD4FDB4mb+zthpGH0uI7Gk6UoTdmkiAOYD
	0vatnqvKWedkvBCHawjMlXEuDKx/WcsAwX4kX9C4zLN3mbZwEf6H9zVkenYShNM729Ha
	Q4tA==
X-Gm-Message-State: AOUpUlGdZrWIxdvyqR4tSvE6WuAq8oHiTZ2stOt+QZsVo2kYkQw8GJOp
	zf2eb/HbmGrzxlMzfuNo/NULPg==
X-Received: by 2002:a17:902:102b:: with SMTP id
	b40-v6mr10221638pla.125.1532796175970; 
	Sat, 28 Jul 2018 09:42:55 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	s27-v6sm12111323pfk.133.2018.07.28.09.42.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 28 Jul 2018 09:42:55 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180727113854.20283-1-peter.maydell@linaro.org>
	<20180727113854.20283-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bae88ea9-5bbd-8abf-fd29-258b578f11d1@linaro.org>
Date: Sat, 28 Jul 2018 09:42:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180727113854.20283-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: Re: [Qemu-devel] [PATCH for-3.0 1/2] armv7m_nvic: Fix m-security
 subsection name
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
X-TUID: lzIsAdfvUrHV

On 07/27/2018 04:38 AM, Peter Maydell wrote:
> The vmstate save/load code insists that subsections of a VMState must
> have names which include their parent VMState's name as a leading
> substring.  Unfortunately it neither documents this nor checks it on
> device init or state save, but instead fails state load with a
> confusing error message ("Missing section footer for armv7m_nvic").
> 
> Fix the name of the m-security subsection of the NVIC, so that
> state save/load works correctly for the security-enabled NVIC.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
