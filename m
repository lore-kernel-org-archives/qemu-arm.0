Received: by 10.25.44.15 with SMTP id s15csp372040lfs;
        Fri, 21 Jul 2017 01:23:01 -0700 (PDT)
X-Received: by 10.55.138.67 with SMTP id m64mr8141436qkd.192.1500625381417;
        Fri, 21 Jul 2017 01:23:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500625381; cv=none;
        d=google.com; s=arc-20160816;
        b=VyUNq/KteF7ajyLewAaFVUhYGddJjGp8e97qJ2hBhf5kT7bawpXiwnx0y68hi44APK
         xHv5EWYQDX0m73tRCfOt5E+Rq+J44a5yjY+2F+tIZxXYqV96wAk2fRD/U1h6u5IlGmnC
         P9raa5OpqCoP61n3VmaHqDSm+pgY9v8aQIbrnck2GmP3O4L6ITZgQOrS+sMndPO8iZEG
         Qljt0AbQ+ZN5Mig6dhjidPZm3qWyDPohJKwI4puxn3UnavD326lbbvvBq47Lupropqii
         52LZgcYnTHSFMCnF1BDiwQB4jyWckb26tgvEG8UsHm1dHiKyDCvmGZ9rMI5DQ2W+LIq2
         wtEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=ve0r66go41jbvNHHbQ6GTrRj2RMD2HronjcLGDQUH4E=;
        b=Y7vADzJ5x3skl+xC1Rsx4fQVcM0WCV2Ihzb3JQECAoKW+1XsACNswpgqIPOC717Yy+
         oVlUAgbReC8yBQd4K/ZxHuguyZ3MG0f3xjtDuOsGRCBtmg8/UH6mF/NhuCl8n+i7/XNy
         4Pzmqrzh7XgozNyFzHlPZk/fwISmpHWf+D+muaf8sho9rsWqquCorGRHlnD157CCndJe
         QChV3xbA818fMvamA922SkAZ6BIrnMQAl42BRcx4sfQZiFS0+2XdtnbxnCo+OX5ndwNF
         vtxBv+qUXBO46Ykn8TinCaQO+XOmTPRh/J8Hz2tp3XKyy9MpPRBo+NP4/ltgx9sr/z88
         p8tA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id b185si3401628qkf.160.2017.07.21.01.23.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2017 01:23:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D937913A98;
	Fri, 21 Jul 2017 08:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D937913A98
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D937913A98
Received: from [10.33.200.180] (dhcp-200-180.str.redhat.com [10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9155B87E57;
	Fri, 21 Jul 2017 08:22:58 +0000 (UTC)
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 03/23] softfloat3c: dos2unix all
 files
To: Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-4-alex.bennee@linaro.org>
 <d58f694c-cc8a-fb0f-f01c-ba1e2eebc6e1@twiddle.net>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1ff55ec6-b8e5-8696-7472-0ac22073ddf4@redhat.com>
Date: Fri, 21 Jul 2017 10:22:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <d58f694c-cc8a-fb0f-f01c-ba1e2eebc6e1@twiddle.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 21 Jul 2017 08:23:00 +0000 (UTC)
X-TUID: EDX7oLAfuogQ

On 20.07.2017 20:59, Richard Henderson wrote:
> On 07/20/2017 05:04 AM, Alex Bennée wrote:
>> This is a massive but mechanical patch, the result of:
>>
>>    (cd fpu/softfloat3c; and find . | xargs dos2unix)
>>    (cd include/fpu/softfloat3c; and dos2unix *)
>>
>> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
>> ---
> 
> Really shouldn't this have been part of the import?

+1
It's only a whitespace change, so please squash it in the previous patch
instead. (You could mention this in the patch description that line
endings have been changed to unix mode)

 Thomas
