Received: by 10.25.0.147 with SMTP id 141csp547014lfa;
        Tue, 21 Feb 2017 07:19:54 -0800 (PST)
X-Received: by 10.55.203.88 with SMTP id d85mr27300204qkj.169.1487690394410;
        Tue, 21 Feb 2017 07:19:54 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v27si15296503qkv.152.2017.02.21.07.19.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 07:19:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgCEL-00027G-N0
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 10:19:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>) id 1cgBhL-0004CB-3D
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 09:45:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>) id 1cgBhK-00015T-07
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 09:45:47 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:35932)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <okaya@codeaurora.org>)
	id 1cgBhA-0000xi-MG; Tue, 21 Feb 2017 09:45:36 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 2735660C69; Tue, 21 Feb 2017 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1487688334;
	bh=zupn1F5nmgPd/jFregCxWGoQOBoLH0uZQCrJ/vCvp0A=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=c/0tEc+jkxNCi87Mic5Rpds8gMbgWsjov6GteFD0U5friLkPHP5KcDTAqSeth9ASJ
	ugtkFdt3F4mQ1L91/PQS/cozr3cf9g3weypSAB0zF/6sE2nynu+ke9AhId9Uax1eTo
	QNu05QNM60OMuxcbi759O+F4hodLqu8PF90PQucU=
Received: from [10.228.68.95] (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: okaya@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id F0F4B60C52;
	Tue, 21 Feb 2017 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1487688333;
	bh=zupn1F5nmgPd/jFregCxWGoQOBoLH0uZQCrJ/vCvp0A=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=I8yjk6XUxz/yfKsmMhCr2uD3TD8bm9Szo+Eh1iEc27oXDlAY0hhGMangh9H4b9SEM
	c1VVhbDdMgGgrM2Ny0+2eosXPuOdlEdFjlvac1knJ/pANo3XqeEJDKPSPqB+haCGxm
	0AadFOOjUXSCvwYONZ/6BmIVD72EkOoQer0iI2rk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F0F4B60C52
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=okaya@codeaurora.org
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com, qemu-arm@nongnu.org, 
	qemu-devel@nongnu.org
References: <1487683100-16013-1-git-send-email-eric.auger@redhat.com>
	<1487683100-16013-2-git-send-email-eric.auger@redhat.com>
From: Sinan Kaya <okaya@codeaurora.org>
Message-ID: <98d4d9e8-761c-76f9-ecb0-c5a4a658dfab@codeaurora.org>
Date: Tue, 21 Feb 2017 09:45:31 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1487683100-16013-2-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-devel] [PATCH 1/2] vfio/platform: make the vfio-platform
 device non abstract
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
Cc: pelcan@codeaurora.org, vikrams@codeaurora.org, shankerd@codeaurora.org,
	agraf@suse.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BM/AEI29q3L1

Hi Eric,
Thanks for the long anticipated patch.

On 2/21/2017 8:18 AM, Eric Auger wrote:
> +    DEFINE_PROP_STRING("manufacturer", VFIOPlatformDevice, manufacturer),
> +    DEFINE_PROP_STRING("model", VFIOPlatformDevice, model),

The OF string is not always of the format "manufacturer, model".

HIDMA for instance uses a syntax of "qcom, hidma-1.0" and "qcom, hidma-2.0".
This syntax is used for cases where an IP gets used in multiple SOCs. 

Maybe, we should call it just compatible-string and try not to make meaning
out of it.

Sinan

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
