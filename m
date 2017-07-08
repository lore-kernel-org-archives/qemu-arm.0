Received: by 10.25.44.15 with SMTP id s15csp1478123lfs;
        Sat, 8 Jul 2017 10:12:21 -0700 (PDT)
X-Received: by 10.200.41.85 with SMTP id z21mr71019497qtz.238.1499533941257;
        Sat, 08 Jul 2017 10:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499533941; cv=none;
        d=google.com; s=arc-20160816;
        b=iehKbEx/ehJ/bRXxW2ieEvlZgDhz/B1ush3mwDsaFzzuRVLlKQ/a2FfUr6HeABVu7R
         PI6SJye6+QZgK2Au8UkWBI/oL8Ggpvdish0zrPpqJIdWsTiPa39N8A30azlYzlczSH1X
         2FhNu3319vu/WLg1lEkS/t0MuQLRXlLfT5ezzTwgSe93DEblrPoL8e+yzPAplP8VvQif
         42ABD7GW7VdYwDLPYTBWxUVhy4+dsInXng7sa4RijpcOZmgUPps0opKSyAR3klqC3YDy
         3BumsQ+6iZrQYzzkmD2h474TasZvQBnhAb0PoFXpDRX4aNBjZZ+7MIVBRair3WZ74/oH
         MTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=8JtIMu1dSQbm8MUBxtSphHuXwZKkOQD4ReGoEzQW6Rc=;
        b=mCjFHFk8PKJ0lk3YfUdX7nb6jiVDMalfjy8ZOuxdNSL1ymksCoq+TUu0rwbDOxlqIm
         69CLq6MxClQrmf58cms1dKbu9lCfdaGkKHbyFRlq7OFxXCG174hmMDFXtIBCPwHznETU
         Ceh8uZW63/GXIKBSrWPlt7P8q1EnRt58Km0HQCy2Fa6PrLkgVQr733WRTJTKdYaiss/r
         MpVPCYTlV7OEx9XSwWNvXqMyAbqOX/OPpVf59wsRm8AQdv1ixaWFYfbECpL+N20mu8Am
         3vF/IwJBMN1TOo8J2KYGuXXuGpn1ABde/RkPBY/quqk2rKPvNu2yHOthcG30uPbn9NMb
         7zpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=FwdU7ZdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a39si6555604qtb.176.2017.07.08.10.12.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 08 Jul 2017 10:12:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=FwdU7ZdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTtGv-00077w-Oq
	for alex.bennee@linaro.org; Sat, 08 Jul 2017 13:11:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dTtGr-00077o-Jr
	for qemu-arm@nongnu.org; Sat, 08 Jul 2017 13:11:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dTtGo-0007DP-FK
	for qemu-arm@nongnu.org; Sat, 08 Jul 2017 13:11:53 -0400
Received: from mail-qk0-f195.google.com ([209.85.220.195]:34748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dTtGo-0007DG-AT; Sat, 08 Jul 2017 13:11:50 -0400
Received: by mail-qk0-f195.google.com with SMTP id 91so8059448qkq.1;
	Sat, 08 Jul 2017 10:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8JtIMu1dSQbm8MUBxtSphHuXwZKkOQD4ReGoEzQW6Rc=;
	b=FwdU7ZdMCeHIBa9h4KB4Fho2l/v8928O8vpsf73LGyVLJoPgMiSMrUepgzWWATyF8r
	03HRAuZY8XGCieriaktnXDydoRdOvDLo3yDuvBWYtDNMQhnnJ9G5ppuTuom0/3PId43c
	3+lQVm4dwXDkH5veMrrSXYhfEusxnmWkYbGEj00Yq/X9ZNgYZB7Re0m8ymQAum9uREuH
	Kq6gEeakolTUrX0uyBJrVp0gQcKemchAbE41xg+CMYSZy0Ro+ZsaGLypPUBg1QSylJSl
	imnwi4Qgu/OQCppCXqF+a7fK92BEXG+hd37cbw7f/HwBTwsh5fcZDlCTRGnFKd/jbEpK
	Hi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8JtIMu1dSQbm8MUBxtSphHuXwZKkOQD4ReGoEzQW6Rc=;
	b=Xg+c18IJ1cx+DMDEPxuaTbiGLe+26K8Lx2NQ1HCCmOi8sR0RxWuU3uC0QOYUOKkK5b
	b8uFSff4m9thBAqN4FTBpC/KGwP2fUIRbB1cPfzNBMcI8l6bc7VsPvTRqIC8V4SXwb1D
	oCVMhC8T4HDEMAB+EF2qWefYwVwIpEMIeNFLlrmmYRRZBL/v1SMHUanM9fmnaPvso3kX
	7xpGyLgjZcTo40QBaq03Tw9rUGPua7YjKY0/qcOWoxOfV4urGfRCEtbEdD+okMWAz/xu
	YCDdMOc/xjZzwK8SDD+Xxu5N8HZj+Sgner88dB/UUxy9qWjWG+ulb9HO/OVpk5veCuLQ
	FtRw==
X-Gm-Message-State: AKS2vOyBccuniK0acuJFpWdlI04Tor60OudRGmUTFe2SjZZV+PHT+WVI
	GV4jor9dMRvlCmsPSqo=
X-Received: by 10.55.37.205 with SMTP id l74mr68660133qkl.157.1499533849395;
	Sat, 08 Jul 2017 10:10:49 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	q22sm5197283qte.65.2017.07.08.10.10.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 10:10:48 -0700 (PDT)
To: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org
References: <20170708025030.15845-1-rth@twiddle.net>
	<20170708025030.15845-2-rth@twiddle.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <66bdbcf1-dd15-1e7e-bc30-d80ae6e88ffb@amsat.org>
Date: Sat, 8 Jul 2017 14:10:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170708025030.15845-2-rth@twiddle.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.195
Subject: Re: [Qemu-arm] [PATCH 1/3] tcg: Fix off-by-one in assert in
 page_set_flags
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
Cc: riku.voipio@iki.fi, qemu-arm@nongnu.org, laurent@vivier.eu,
	aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NM2/2pHKM/8J

On 07/07/2017 11:50 PM, Richard Henderson wrote:
> Most of the users of page_set_flags offset (page, page + len) as
> the end points.  One might consider this an error, since the other
> users do supply an endpoint as the last byte of the region.
> 
> However, the first thing that page_set_flags does is round end UP
> to the start of the next page.  Which means computing page + len - 1
> is in the end pointless.  Therefore, accept this usage and do not
> assert when given the exact size of the vm as the endpoint.
> 
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
>   accel/tcg/translate-all.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index dfb9f0d..57578a4 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -2068,7 +2068,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
>          guest address space.  If this assert fires, it probably indicates
>          a missing call to h2g_valid.  */
>   #if TARGET_ABI_BITS > L1_MAP_ADDR_SPACE_BITS
> -    assert(end < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));
> +    assert(end <= ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));

worth adding a comment /* end rounded up */ ?

anyway for this tricky catch:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>   #endif
>       assert(start < end);
>       assert_memory_lock();
> 
