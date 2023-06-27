Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1638920ejx;
        Tue, 27 Jun 2023 14:05:42 -0700 (PDT)
X-Received: by 2002:a17:907:1c9c:b0:969:f433:9b54 with SMTP id nb28-20020a1709071c9c00b00969f4339b54mr24655347ejc.39.1687899942628;
        Tue, 27 Jun 2023 14:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687899942; cv=none;
        d=google.com; s=arc-20160816;
        b=tOZ2PYK1P8qvcin+hebjgow8VO9wtG1jFHXVw5od6xajdxaz6UTcjQjAhdxOh+n3En
         MpuUuG21rJalMxBXDV69gVa1uwS8/N2NHVrKycoWe+tw99NLFDS8Ub19ZNnFpMA/27tc
         e6WrHKet1PA/ZRPUQxbKjLu9t4N725NBxOQrDqttzeWix6Jx2mcewSFH8/l5h8Jc3bUp
         0r61EUhSMib1qYwDDOe6RuGeNrAGhVfjs3pHgjRbLaiT+hPq6hAJt1vxcmcfiock1Cc4
         GDGNDRPqwtD9tVN/4rBMmV+dTYyZdG3U5Ss8WmPJiEnOk+ZZXH6U/WvPc+IGPTExDD+L
         l1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CGduznZ6msReTC2l/W5laHQoA+Ocs8N2FoxqJmlTDEQ=;
        fh=Tti5iY6tdwKQ6vxlTSmZ6v2Y0jcLETgPWS1w/ieRBfE=;
        b=gpf+4eKNDm0MdqROzvsbpATyusj0WuokWRezTaSuypC1DWOKak/Ga8PPTU65LYIrWV
         FCThBKZFOmKz7cnMcZ4VayOCEBUA/1LqHokaj1o+eB60/XEOI6c8xO0FcGlc7fItwy88
         wT+PLEeIBbCRanVyLCQPX73/cSFPtKw3dxrKBzJZsXTwoR4ap7xXHLSVE7/ki+oa08GL
         ocXfihC+xnvRjgk2Iyfdqt+xlppxaxOtYgTicR9to0HWxgJk/BL7CvEfT1z8iUINifCz
         eoksn0xzfH2RHFxNa+43tjs+YJ6zfl+uSAuGEZnGcCQDxVPJx8+QbbVmOkuq+6+VM+y7
         +BKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X7L5E/lX";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l17-20020a1709063d3100b009878afbd406sor2548412ejf.5.2023.06.27.14.05.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Jun 2023 14:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X7L5E/lX";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687899942; x=1690491942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGduznZ6msReTC2l/W5laHQoA+Ocs8N2FoxqJmlTDEQ=;
        b=X7L5E/lXPJXq83d7YOX7xyIKEurOFoq2WxZ+4xY9X3+tzsvn8GclrOEvVxA3/d8/ud
         hPrke1X/KuDbfXZUbubbZ0vGkKp2iMIKfbPb/fmULBzkqJU7SzieHz8mhr9eQh7/rjIw
         4JLIBRACg7r37sKS2MpgUA4qkZYV/UUtHoMVrNBBi6m5OBVt4GZFB05FEvLYbm3F+T0o
         Hb6mqxM4dCPsQXZwxMsL7iRYNzOxC5EQRV8YxnRuWfvnPtYipNn0Wa8l6JcO5tuo2Nd+
         8PHfc+f9tbpbHONh//KTCBjF+7B65iS41GY7JAgmBWIXXibJjpFqhOalHxZ9T6QSdCui
         qpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687899942; x=1690491942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGduznZ6msReTC2l/W5laHQoA+Ocs8N2FoxqJmlTDEQ=;
        b=WjCLGyKnsMAigYfiCApn9lzbiEi3AwaXlN0L8swRS9WPcXX86x6tlSE2vD4I90EjYP
         q6KMLEbGR6+XE7yDj9k5WtAk0eDvXFFRSO/suxei9L89mHw62MO8WpJ+l30Enfm82FuW
         pO5mOmfw17fltBnFv0okgh3TqBzzFtsLj/X6CVl/TSjrBdgqiL3p1LCdc+iBX2PB89ez
         gXQcxXg1kvfX486O/B5pCjr/wPSywo2mMGHork+t5ElVOBxwnY6oFWK1MirO0IMYUHCg
         XTE4VunKfMyaqnLLaFw9fiuK0EoW7lHspHRN9/HBNxAzR9jQGE8E6v2riObWxR5j1ILK
         uCfg==
X-Gm-Message-State: AC+VfDyB++PKjEhhoa4qRChdoScZWJNqlo+XwQHqazEH7H+PWpGHRvak
	VhWodTmp95G3Ju5dZBWH9PKlJU88ebxTJSUdOKKlvQ==
X-Google-Smtp-Source: ACHHUZ7r61k51kP1rADSd3wJYhKUMWcbe/ZN4zhv3p4NZ3fddNPWA468zULzMw+sn73J1fSUmRs0cw==
X-Received: by 2002:a17:906:6a08:b0:992:44ae:45dc with SMTP id qw8-20020a1709066a0800b0099244ae45dcmr1386691ejc.44.1687899941931;
        Tue, 27 Jun 2023 14:05:41 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.199.204])
        by smtp.gmail.com with ESMTPSA id gl24-20020a170906e0d800b0098e48ad11f0sm3429574ejb.106.2023.06.27.14.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 14:05:41 -0700 (PDT)
Message-ID: <fcc0e5cd-46e3-91c6-960e-f545836c34d7@linaro.org>
Date: Tue, 27 Jun 2023 23:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 19/36] plugins: update lockstep to use g_memdup2
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
 <20230627160943.2956928-20-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627160943.2956928-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3ip6PlRVGadk

On 27/6/23 18:09, Alex Bennée wrote:
> The old g_memdup is deprecated, use the replacement.
> 
> Message-Id: <20230623122100.1640995-21-alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   contrib/plugins/lockstep.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

