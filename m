Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1591295lfk;
        Wed, 2 Feb 2022 20:18:36 -0800 (PST)
X-Received: by 2002:a17:90b:3ec5:: with SMTP id rm5mr6647267pjb.28.1643861915909;
        Wed, 02 Feb 2022 20:18:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643861915; cv=none;
        d=google.com; s=arc-20160816;
        b=YgsFrdONrqhhrDfEhCLT4Y2hqsfr+69Ky0XjC5yFPX6Z2dyvjpJEdos4IAld9Kfp7l
         drhXcIvgFRC5y3Tcf2/zdcKB3T4VsxHkQ3lAECFiVSz9sWcHc1V2amKh5W0znYQr69H5
         /AZCyz5q2LhnaAurp0kpWwBCdIEuLhzPVeOk4fnDr/qGdtGOTMSyDvWOkcCwtJBw5NPh
         nTPbvLHxoGclEWleDcf2c3F4/7vDG78Qy6YOdM8MAme9hpaSTSfh5kw+RHb6/X8btUUg
         /T6KGSQNhKtTtH2nNlMuxwlqpx1T3C+ffHi4Aw3OuLpL3Iv/u2cnh6KSIUaLViakC3xq
         MhhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AFW/nw/yagZyS2xM2sirUDuJ8Vj6Q32HbXYN4shOm0Y=;
        b=KdSCBvWzGRZDgywXgn1ylI19QCuWP3fXW1G3Iwd+iHRjUjs9+yW9DupQwOK3eyE8kp
         3elSixc5OY0EioFaFG2BLE1C7YVQhTxGj7KYSAK/fdblKVAdYr3vefV/CSEwQ3PlyI20
         gIEDKKvy2uWoYDo7Fl0hRKjoZ+vbpUaTEN9SXwxZC1/813lnPpw7PbKxnv7ESPNMRnPY
         SnNIYZWUkTmT+UkxqhWW5x2JJ57Ewe2VYDAXUYvR9Rnd/c1R+Sdi0XMgNmLaj5TA+D9y
         AMDk5Wu6OJQf2f6NI8QOcvDVZN/T1tj4+swRL8iTMZzsVRl+wW13gYu+XCShWAuY68ag
         Ofiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xk3KeDsM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c16sor9419255plh.12.2022.02.02.20.18.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 20:18:35 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xk3KeDsM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AFW/nw/yagZyS2xM2sirUDuJ8Vj6Q32HbXYN4shOm0Y=;
        b=xk3KeDsM0gAndyFlinzlNNfO7pRF8SL3aseeRRT8/O7yXOGOhffZYqjzNXXx4btpDH
         /4HYHF0Gn+Y49ZG7E55NK4fWsCfsv1Soa8Bi69K7ZKWg9K5phqh0x2wXotKjlmlB6oLY
         brhL6jC0UlYhp1QBa4JTTF5eCTGlM7FP0jDMxQrdp6aYUJ1LTRdVwyFG7Q2URlhSdDW2
         8faeb2dBcooB9q1P6XCdy/l/vyDjAdelM2RITFH7lPOQlDmMR/n1gWwPJLxBY3J4Hc7G
         PTJZGY3j108UntBWz4q4GFWmJ47T7OHQpCPyaSPlIa/+kSXY9yc4dUVoAI7v85HqdU8r
         Jp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AFW/nw/yagZyS2xM2sirUDuJ8Vj6Q32HbXYN4shOm0Y=;
        b=7GdmIjInM7ZY++RBc+X2oUtytfPmwD93hoU3h7RkiuQ2Oc7KtknNMmxCm3xMevBLCT
         mjMAJqPxTJhK1ucXumnzVzDLTHPCwKiLHkBnLlK6cWgkRFhH72kSUbnOv46durY75xgs
         uOrEg1VCMHjbe8QIQoLFqe2Fq3Be1zHiHY2diBLX0NCpO63eLocgxWyFcRqA7Pv5Ym6Q
         DPKs6b+vKA92BaIlWGaiCfBPwV8vR49zrMjRI3EFiBqaUL9FETFbX+vKsRv1izc2C7R3
         kOoh9IS4PDH1V4DJpf+0LejEtGLQ36kE81bviraNQmAkZH2ELelMusFXTF5V8n6saQN1
         SvTA==
X-Gm-Message-State: AOAM533bShn6lZfBbKqz/1UGYPStCN9MJOf5HpGD/V+YyHIf1WMxPeoE
	GhtYMusz86H9GQqFFP+fwINwojvY
X-Google-Smtp-Source: ABdhPJxIaic6mN9nj/ThFh5lbfGz84IzNaodl5lKCO7RGUhuL6/XwLZiiTvmmdCfVEqKo+KBzqBADw==
X-Received: by 2002:a17:902:6903:: with SMTP id j3mr2097767plk.23.1643861915387;
        Wed, 02 Feb 2022 20:18:35 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id f8sm24368552pfv.24.2022.02.02.20.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 20:18:35 -0800 (PST)
Message-ID: <abc3e104-7606-5a66-754d-99c55f1e8571@linaro.org>
Date: Thu, 3 Feb 2022 15:18:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/13] hw/intc/arm_gicv3_its: Drop TableDesc and CmdQDesc
 valid fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: FAIP7MgDjgXX

On 2/2/22 06:32, Peter Maydell wrote:
> Currently we track in the TableDesc and CmdQDesc structs the state of
> the GITS_BASER<n> and GITS_CBASER Valid bits.  However we aren't very
> consistent abut checking the valid field: we test it in update_cte()
> and update_dte(), but not anywhere else we look things up in tables.
> 
> The GIC specification says that it is UNPREDICTABLE if a guest fails
> to set any of these Valid bits before enabling the ITS via
> GITS_CTLR.Enabled.  So we can choose to handle Valid == 0 as
> equivalent to a zero-length table.  This is in fact how we're already
> catching this case in most of the table-access paths: when Valid is 0
> we leave the num_entries fields in TableDesc or CmdQDesc set to zero,
> and then the out-of-bounds check "index >= num_entries" that we have
> to do anyway before doing any of these table lookups will always be
> true, catching the no-valid-table case without any extra code.
> 
> So we can remove the checks on the valid field from update_cte()
> and update_dte(): since these happen after the bounds check there
> was never any case when the test could fail. That means the valid
> fields would be entirely unused, so just remove them.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/intc/arm_gicv3_its_common.h |  2 --
>   hw/intc/arm_gicv3_its.c                | 31 ++++++++++++--------------
>   2 files changed, 14 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
