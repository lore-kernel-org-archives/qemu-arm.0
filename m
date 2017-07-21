Received: by 10.25.44.15 with SMTP id s15csp435970lfs;
        Fri, 21 Jul 2017 02:37:50 -0700 (PDT)
X-Received: by 10.200.9.75 with SMTP id z11mr476382qth.283.1500629870309;
        Fri, 21 Jul 2017 02:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500629870; cv=none;
        d=google.com; s=arc-20160816;
        b=QFy+8v1L+MzkoAPOeDcPhKZtfE4jq55a+h3OWgN4MLd16WhutRCGt9mfz+730QuB1R
         q+8kd1MdE4EfavBXO1+HBib/hKNChZhxxtlnUz3s3ULhBIg9XFAiPmGSNDz48oGWubTE
         5alCpAuJ7Xzp6u7AjAFoZL84iH5di16+xyx2Y3XwIxKBV1/VmIEEKnBhnYhcidDxqSTS
         UWfOZ8ogEg+K01JlIUNfh356rDIBCkdi5p9I2cB3SeyDeUUQDYK5A77vpSAziMdJxqdI
         w2LnlxkeH8oN9u+J1dBIjxyD43VabtwN5zTYtN5wGZXaKDH7ZH39YC7O6xR3vKbvMtXb
         pXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=59HcDlA2nOqTUTwgYNdvrWv95RPX1BL1et3gOI4IKqM=;
        b=IvIF6ealOaRtKSB4IWHPRmyAL6BbI848Cz8Gj6gr4uJeMqaCIQEWIlm913Gwq3QN0M
         gsw6dghw+Yh3lg77/y4n8ccYoTYcVETJas5XZoLSSifw+6e8r+zvYzvVJNXOErAqdOlt
         eJLROKXenMrdMhKzkMpj+cb2mB9mhJqla9ll0r8CjuBKaf5jdnfYXd1FXB6S3pFtJqJh
         KQZ61wV/ZriaPYhfst2BwdTyGeeTn6pnyMzFaldz3jm45fapyUWLshrkRfk/+mwbkJfF
         +vzopjv102ZKnaBsiTGi5zH4ha0hHjVOvWBfXBAWQpjKRFFAZ658SNno4Kh2gOHxurtn
         mHHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s54si3531358qtb.119.2017.07.21.02.37.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2017 02:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEAFE2C154A;
	Fri, 21 Jul 2017 09:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BEAFE2C154A
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BEAFE2C154A
Received: from [10.33.200.180] (dhcp-200-180.str.redhat.com [10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9A898B17D;
	Fri, 21 Jul 2017 09:37:47 +0000 (UTC)
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 02/23] fpu: import SoftFloat3c
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, rth@twiddle.net
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <98e1b6a7-7af5-7b8b-23c8-159572c83eb4@redhat.com>
Date: Fri, 21 Jul 2017 11:37:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170720150426.12393-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 21 Jul 2017 09:37:48 +0000 (UTC)
X-TUID: JKcHFl89RH43

On 20.07.2017 17:04, Alex Bennée wrote:
> SoftFloat3c is a re-write of the BSD softfloat library which includes
> a number of new features. It has been written with libraries in mind
> and has a new API so hopefully we can use both side-by-side as we
> migrate.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  fpu/softfloat3c/8086-SSE/extF80M_isSignalingNaN.c |   57 +

I'd maybe rather name the folder "softfloat3" instead of "softfloat3c"
... otherwise it does not match anymore if we ever want to update to
version 3d (which is likely just a minor release with some few bug
fixes, so we likely don't want to maintain that in a separate folder)

 Thomas
