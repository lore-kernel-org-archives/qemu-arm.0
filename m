Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3496331lfa;
        Mon, 7 Jun 2021 06:32:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7D6CIIhw3KPUqRvRE3TYC80kV8Msrddsf/n5Ua7USgUvdTbKQ/y4HYE2DnjrqmU7A8UiY
X-Received: by 2002:a17:906:7ce:: with SMTP id m14mr17924206ejc.444.1623072769281;
        Mon, 07 Jun 2021 06:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623072769; cv=none;
        d=google.com; s=arc-20160816;
        b=SWqKa0UvZ40gy8onXwQ0IBoLLC60tI1ZhT6KRVdUtwn0kxh4jn69XdOWoDmXzVPerJ
         v6pJUNYxcm5HNE6I39jkLSjnNRIWaiSf7mHZK9hjKCyJFSuiymlG5kZBlFziuxhaxp/b
         peOx91oaPZZYLpkYZHGI0VI4/ChJyw/4t1z/uC2S4tTmNfi2BaaTFVyi5y2Pqei98IZs
         XLA9KK1JrFI3jdunDvoVa92KMYSRO71hI9TsT3bi+z0I817IEn30cF8881O6063vyS32
         RL+Om1y5atg2OhvyU2pugKrZoauGmzTsRURYPWSMroezZ7V1BPzeob2fmRoOHO0+2wXB
         Nhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Bu1rJYAmMm2THcwnF2uzt6Ypq9rSlKlSaOfOes/Wdbw=;
        b=BFkNnw0owqHBUSqiTuWLa3q9umH2aNLu0YkUkNsKBLPjB3mOKKx4uJgZPiXfD5f1DG
         OwC2iMeeTBhcQwnUuT0beEOSRw3R5iPAQuPyNt4nHIPlz9Xt6/du76AVKXMDa9G4ho3A
         2H/AVhyFE5APibooQCrgKbfr7esq8SSVJuemf+k1b3E+PJc3Wk3aDpMxkb4PImBq20sC
         sLvLd5RRifUOkdSoi9dVStBRUAz29zPrSfsgK8BCUaazINQGMCmdnm3HenJ8tfKJXRIt
         W0F3taTrYCl2TShAZGambvBr6QQdD2Ab9RKtDp4swgQfgDnyqcBKf8M4J3Z8esOeXDl2
         zZoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=azQCJlLb;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id e26si12364379ejt.561.2021.06.07.06.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:32:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=azQCJlLb;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623072768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bu1rJYAmMm2THcwnF2uzt6Ypq9rSlKlSaOfOes/Wdbw=;
	b=azQCJlLbOv+axq6+yfDiMQWkvaXYQFNvm5UNrLMYhhjFT5X17LL2z3wuJMY+vrP5zbwOHU
	ReR/uazP+IxohG8LWusLqjv4aGXZukAvcg7p5Dw2ky5Cs29yvxiG5LlCWkn4xgzdiBS1ps
	1luw4Iv7CuShKF1lA4q3c2sZP8ZQLWs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-Yec9BmBbPfqFj3O6ZtVAXg-1; Mon, 07 Jun 2021 09:32:47 -0400
X-MC-Unique: Yec9BmBbPfqFj3O6ZtVAXg-1
Received: by mail-wm1-f71.google.com with SMTP id j6-20020a05600c1906b029019e9c982271so6750002wmq.0
        for <alex.bennee@linaro.org>; Mon, 07 Jun 2021 06:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bu1rJYAmMm2THcwnF2uzt6Ypq9rSlKlSaOfOes/Wdbw=;
        b=cDx9oxgATpivOUI/W75LN2v3czxRZTVroAurIpTFBd+pe97qpvuBRnKUyMAa4y8ciu
         BqLsADVcidSkFtUeyH4W0YcuiSOth5NqF1tEVXsXb9gcsSv6Da2FRWMYDtDiduLazXkN
         MOwWEazMlKUxqVyK/4r/n9zOtxsPAuCAmxqXMoGz9qy0LZ09KsIWQdXXWLAetylJVPmm
         1/vw94tOVZ+D3avGpcwVSGNh0jOBtZlF5q6Sis/+WNN64RPw07zbSiMv+8yzkNW5A2qI
         wy3uGuU9I+v5a7aQwqKaoifA4kx8LYCuqIblfakZi1xS3ESatxmSBcr0Yx3GdkTtJAu2
         +MuA==
X-Gm-Message-State: AOAM5327x7rl86Ih86SlWN6dsW6Yk/LzCwTlPpG5dz74oR4MXgHvCjWY
	81+MFSp/LKoyYyayUL3EFyXMOUxaU+7CZUCpVepSiyrAMmYZbDf3NO1qBuuDbPQAuvP0ciuoPbl
	T3pYdYIhinNUzHne6
X-Received: by 2002:adf:f748:: with SMTP id z8mr17940852wrp.115.1623072765827;
        Mon, 07 Jun 2021 06:32:45 -0700 (PDT)
X-Received: by 2002:adf:f748:: with SMTP id z8mr17940845wrp.115.1623072765726;
        Mon, 07 Jun 2021 06:32:45 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de. [217.87.87.121])
        by smtp.gmail.com with ESMTPSA id s62sm17917975wms.13.2021.06.07.06.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:32:45 -0700 (PDT)
Subject: Re: [PATCH v16 07/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for TCG
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a0d40145-f6e2-6c98-05d4-8b37ae1f9d65@redhat.com>
Date: Mon, 7 Jun 2021 15:32:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-8-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: LvcbNYSKzrEt

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, only run these tests if TCG
> is built into the QEMU binary.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-8-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
