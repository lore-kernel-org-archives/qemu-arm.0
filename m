Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp341790ejy;
        Thu, 29 Jun 2023 06:35:02 -0700 (PDT)
X-Received: by 2002:a05:600c:b4b:b0:3fb:b5cb:1130 with SMTP id k11-20020a05600c0b4b00b003fbb5cb1130mr2481367wmr.34.1688045702212;
        Thu, 29 Jun 2023 06:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688045702; cv=none;
        d=google.com; s=arc-20160816;
        b=qVWqlJLLzhXtJo622U1h7pTkP0EHFj73LnG2vgp6QUjIUXTy3BY0/e4466yix7RNP0
         gsa2l2GBW3T9o3d1s4CwdEKy6TdjV3FtNxnDBqfGWDfPoxbUV7DLVEKCYOBIhKtUhigY
         AWTTVPvPLLgyu6WdstM5/+GKIhlu7eWTwhcwvsOjT7y5qax15S7bQrP4SLabdDKHRTfU
         R0p0n0Ntue+TX+y8517S4XqJbno/ulE0flSwf+duPUavdYpA/cCOgXCCcSD8pbDxz5rR
         hJVAhUjX+CAy9TxpCGe3hLOgQ1zPkbqR/CLFTmakeZ3tUHkjJsYogRN1qS2crO8gVLyz
         cYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qTgcW5gMFdIvt4cZeYfaKm3UcYMfXtGRNkkLsSlwxPo=;
        fh=Tti5iY6tdwKQ6vxlTSmZ6v2Y0jcLETgPWS1w/ieRBfE=;
        b=MAF9RImPU6VSNUjbUpXPzCmOA49lDV+vP+1moI7Dr0PyuEHSXViSzAEOdqQczUuF2F
         kTStk4tgCWd9zlJXCkHi5P0R4X/VyL4e2IY6esp6BO9bVSEnZdXYx6Okt4nRZHWYXRvi
         TTBeqMUCMCU+2tVcBnNWfy1STsVNZisKr8zu+atWL/IVpnYsA32pb4LRO9dYB1fvtInK
         Sv7PTmALd6D1AL6Hn5BVlbyJr20uL1alIy07kUteT6eYoxB4lTSbDf9tKUDbFV9YGP8p
         khdyNcyGY+w6Jj8DLeAQ+ZNM41p+oWGTYAV//xbU5hX5KDt6FfwinQI3ztgTW5LfDNJO
         Qzxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yTOJHUIV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i11-20020adfaacb000000b0031114468dc4sor5041676wrc.7.2023.06.29.06.35.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 29 Jun 2023 06:35:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yTOJHUIV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688045701; x=1690637701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qTgcW5gMFdIvt4cZeYfaKm3UcYMfXtGRNkkLsSlwxPo=;
        b=yTOJHUIV2LVgGQnXm9I4ULmA6JVYb9GTtSrSaDUlWkmbPkrSkOujzhh+eNe+2sZmTP
         I2lBhK0VHlFj5h5RxGWv7tY17dDJFyddAhAE1cLULrrpf5qrXcQcsiIck1oAzX8P52cw
         xc+RJvXwnnjsL77+L4i3zccoTTc5guz+sVoVRtJbMF8xo+RJYeY7nE1MHckqWPIXezEX
         Gvnyok8xOOqLlykJ7JjS6yR8U0dKnHohLQQA/od2oNbq/M22tkQKC5SaQ/ZDAXB1xvey
         +BIMo22MpGR42lgjUcnLOG0kwNWbPA2zPMV/1ox/FprhhacIwwVCRJ4faKJxOwS0505M
         01VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688045701; x=1690637701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qTgcW5gMFdIvt4cZeYfaKm3UcYMfXtGRNkkLsSlwxPo=;
        b=LGh8L+tsFZXmKp8mhY1Xe+ITeQzFoYm+afPc3/SMPDyv7fXL6pb7EUtvBeGqHirBuJ
         GehAfC8TyMiDKF4wyplh0h7XyTsYSvb67nHSzSNS9oEVakCF0iF1BCZDNe6aF3UgRw0Z
         bLqxTlXhMC6GgnDqiQFmUg9CpYfzUR6dbqQn6812IqXYK275qxGlVAXCGMwm/k/uRn4N
         bQm1DUn6hG+7Rs1fRwfhZTdfSobDygKn6Hnnwg0EpHstOEpkXRUODIUCIK/5qMZwCInd
         WfnYSdKb2hbwqdWcHfTFfDfwncR64yVi2+vV97u3FdtVpMn0jUMH1YR2XMeQpUNuMl4M
         dKzA==
X-Gm-Message-State: AC+VfDxjfqxhTyuOAqCacxKFlpix7X3wHPmc02MTJVEpFLINkIJtdlCo
	W44p/8zpL4bZcZT6jUp1a2oZMsYMUsPg8DWOO8NaEg==
X-Google-Smtp-Source: ACHHUZ6SrTosdzDnV1pwmn2GjuB/ovl8uNmHfp8xT2+SeT/1N9QHXFhTyrQOfgyHducRJgV1+pcPmQ==
X-Received: by 2002:adf:fb46:0:b0:30f:ce4f:5675 with SMTP id c6-20020adffb46000000b0030fce4f5675mr27683781wrs.59.1688045701589;
        Thu, 29 Jun 2023 06:35:01 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.176.166.242])
        by smtp.gmail.com with ESMTPSA id a25-20020a5d4579000000b003048477729asm15899208wrc.81.2023.06.29.06.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 06:35:00 -0700 (PDT)
Message-ID: <e5605ebb-ea54-6e7f-3c73-16c9ef9cb9be@linaro.org>
Date: Thu, 29 Jun 2023 15:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 22/36] include/hw/qdev-core: fixup kerneldoc
 annotations
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Bandan Das
 <bsd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Laurent Vivier <lvivier@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-23-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627160943.2956928-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3jHb0SWACn9S

On 27/6/23 18:09, Alex Bennée wrote:
> Fix up the kerneldoc markup and start documenting the various fields
> in QDEV related structures. This involved:
> 
>   - moving overall description to a DOC: comment at top
>   - fixing various markup issues for types and structures
>   - adding missing Return: statements
>   - adding some typedefs to hide QLIST macros in headers
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230619171437.357374-4-alex.bennee@linaro.org>
> 
> ---
> v3
>    - checkpatch cleanups
> ---
>   include/hw/qdev-core.h | 367 ++++++++++++++++++++++++++++-------------
>   1 file changed, 253 insertions(+), 114 deletions(-)


>   struct DeviceClass {
> -    /*< private >*/
> +    /* private: */
>       ObjectClass parent_class;

New line here?

> -    /*< public >*/
> +    /* public: */

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
