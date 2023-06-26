Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp777395ejx;
        Mon, 26 Jun 2023 00:58:53 -0700 (PDT)
X-Received: by 2002:a05:6512:39d0:b0:4f9:6581:8b4c with SMTP id k16-20020a05651239d000b004f965818b4cmr7206938lfu.44.1687766333681;
        Mon, 26 Jun 2023 00:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687766333; cv=none;
        d=google.com; s=arc-20160816;
        b=Hu7NytvXXuMf3PW3DcXSToCaVNvkGh4sIWGEsGSKxq9upqFnSCvyXl2Pw/tMbxXZd7
         IYkjf8cLBC+Ler1QvEyquwvgBxvA9+b0jlJMwULZwxzWxye7OlpC5Tla2Oc5m1XHCOwK
         03YCvc1Rhm/vMKPetOyF1eUq4tO4LDBiLQmb5WY7rUA8zlB/G/S/U1SWxKrhE9MGGu4U
         Wn7XBN7pWVqB6uv4YBF4jyu0KNlxzD7LPvdr9nBpEE9GITHImI24ynHfXx2z54KYolIX
         EVMUiQCRlwlt38Eb3qu+W+h8vQ/8h+mWsDOpBl4XJdARZ+oUNpeGw/BwhqvrvjYvAamB
         xK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=I3Y32WY9GXAQ3WulsRyGWXIz4sqave2+2AtNlGeCFJg=;
        fh=tO/z66EPPOstO97PJTYbJc3VYoMDMfsNtBYsGLSocwA=;
        b=oBZO60KutaO/zlnpY5ISaj5OeAo/pH0EriKMTPCrOzHdZ4tTfF9rXTBE5k2aAO04Ss
         jRn4Wumk2SvAsaVuWrrmsXpQuffhICzLye3HSgSdyDvBHAa698GGvQ9zxlKpCFYDteBl
         yzjbl9WRyGv4S8tk5iTu1csEpgov9b5a6nsUGejYbgAGetMXS+Gfe2MTQuBJH2iP9wxi
         K3tAnhNsvYaJUahLBtkry1yXPdCzEBOBM9v0vuwjf7WKjJAhWM4Np8jgiELTfYZpAlTY
         slPsNUoLDEz30eH6ABUeu9DuVbnQ9acCyQNVdqlCo9spAJEQSmmIWbw+JpF6eF7ff4pi
         G8Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EuzFEgXs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s21-20020a197715000000b004fb7404537fsor478786lfc.10.2023.06.26.00.58.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 Jun 2023 00:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EuzFEgXs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687766333; x=1690358333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3Y32WY9GXAQ3WulsRyGWXIz4sqave2+2AtNlGeCFJg=;
        b=EuzFEgXsLWFh4azhq6z7+LFsyuPb3HAJMbiG52dS2bdQwSpLrlmpV8yKpyb6wh8tW7
         2xWpEHLdBP1l+wzGpZrG1e/nNICX+4qDsHPvtoNz2RKq5uyvZqpYzSOKhGnmoqhSon1o
         s4J6lEIDupha5vwgwJfwxlQwwG1nUUClztmDPiaqZ+jhth8TjdTlp39Soq/6b3TE0LpH
         GgYCOuZBKLtZUaOSOFuPvg/mADpEsmT/wobLm5c9qR5SAvnHGOnaP5PF3W9xd7jK8uHn
         3rwqS1VQskYIXNWKbrvE8Dj71ZHzTB8Ls2KswgxgGH4r9bDcF3pMcMbFvysh/Xy/bnxY
         QoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687766333; x=1690358333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3Y32WY9GXAQ3WulsRyGWXIz4sqave2+2AtNlGeCFJg=;
        b=A7eld8eQU0b+Qb2YD7LvRSjM6UzIJBuIiGdT1VPuhJDtDMMBXt1f942CJLuUs4MzC+
         CcUqOl+UUaCtrkeTOX1l1lrc4B5h8oOu+TLUl68IxD2HCWoSYD8hKmMZl3Wz39xQIitq
         B2oVn/v27HadmGE1hTkNERl9kXb+SW3ZOhV6Od2Aa0Kp1y9KvNvV+s+aQ42mzbxC8jPQ
         vsMkMT5CtxgAUzPSMYufrq1RaTGXetdHCxa/1x5vqywMyfsNNEg7CiJ1J935uMi2mUsN
         2KPUsxDvYH2+k5Pvu0duAzymMVMoClkwxHhiYfto4QDUlkcYtaDQv1tuh0GuxLGgDulO
         0mrA==
X-Gm-Message-State: AC+VfDygBwApfCY2mR9++lPY3iffnfQxuf5QhJD4D3jeKPBWmxYKWbm8
	YM1ZWJjsrPwfwqCkxEe/r4sSoi8RLkU8c28HvFF5p2r0Rjs=
X-Google-Smtp-Source: ACHHUZ6wNGrrSUGui4TNmK/Y0TKpKAHg5Ia5jTH8UD1l4x/P0Fuc6i3XTqIcgaVLeO98l/ifk73FXA==
X-Received: by 2002:a19:641e:0:b0:4f9:556b:93c5 with SMTP id y30-20020a19641e000000b004f9556b93c5mr9787646lfb.40.1687766332927;
        Mon, 26 Jun 2023 00:58:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.208] ([139.47.42.170])
        by smtp.gmail.com with ESMTPSA id t12-20020a7bc3cc000000b003f604793989sm9575031wmj.18.2023.06.26.00.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 00:58:52 -0700 (PDT)
Message-ID: <8d03a491-8589-e8a4-e4bd-d02657e4d209@linaro.org>
Date: Mon, 26 Jun 2023 09:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/26] gitlab: explicit set artifacts publishing criteria
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Riku Voipio <riku.voipio@iki.fi>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Bulekov <alxndr@bu.edu>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leonardo Bras <leobras@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Yanan Wang <wangyanan55@huawei.com>
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
 <20230623122100.1640995-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230623122100.1640995-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: eWABw/Qs4jwt

On 6/23/23 14:20, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> If not set explicitly, gitlab assumes 'when: on_success" as the
> publishing criteria for artifacts. This is reasonable if the
> artifact is an output deliverable of the job. This is useless
> if the artifact is a log file to be used for debugging job
> failures.
> 
> This change makes the desired criteria explicit for every job
> that publishes artifacts.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20230503145535.91325-2-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
