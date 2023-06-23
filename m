Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp198997ejn;
        Fri, 23 Jun 2023 08:14:17 -0700 (PDT)
X-Received: by 2002:a7b:c411:0:b0:3f7:ee69:869f with SMTP id k17-20020a7bc411000000b003f7ee69869fmr15165708wmi.5.1687533257109;
        Fri, 23 Jun 2023 08:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687533257; cv=none;
        d=google.com; s=arc-20160816;
        b=Opfnf3DNEUgQm702tVeP1plB/AXtzCkqK3cxRw3kSlX/7WVa7ZrNnAacWyPd5YVtXo
         CiAqGdj+rtU2KWZafAAGcem/6/g31Oa6UkN2rrDE2dzWE7JSvyzJptJ4jNHvdlVpGPja
         aFV4a4Z/Z94OzqMMruA6ZKJR/CLQ+dSMDBBuzoZ7Yby0BaEcGlla6Nk8QotSyAE6AKt0
         Ve+neh2V3FdB7czIZ0xj14kY3BXkuC18CrAtCUPeS8JmYyz5dvoXBUQuzfl9Ejk809M0
         WaWsLDpJp7h7/1kuGNUyXLtcAKsINYlwDI6WWCcXlIQh70EPd7QSpLfUExt26iKatnx0
         M5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fnnKEbUvj74y6swt1Yen5ynIV0kpGjzEKPfjFjq0Wh8=;
        b=I25ADNLDAMaHsKPS1C0fVr8MTVdnXHtOnXHnQgk7M1XUJNzrqIG2jm+cP7L+swwQE/
         LLrWbMxOoQecTyHtgjj3L6AiadwI5yj4FE0/jwKEBvGjq1X84uJjo74FCv4rtV7nFawN
         0ExK9d2fsNVc9gJzy9WIItUjKoblsJnvrCFE3az/zcATnzUU/5JxNTvs/T8pUkn79XWn
         GWBkc+u0RmJbtLWWEcf0aU0isIUARvXDpoU4z9KQ35PEQVPhryFOznwToIeiCC2o2rM1
         FXbzoe4rzw9Jwh3g6MIN+OsZmNe3sVU1C8H/KYKFj7m6nty4oXR6O9nkdStBgWPLYK4N
         UCRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k/rjukvs";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u18-20020a05600c00d200b003f78fd2cf61sor3378633wmm.8.2023.06.23.08.14.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Jun 2023 08:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k/rjukvs";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687533256; x=1690125256;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fnnKEbUvj74y6swt1Yen5ynIV0kpGjzEKPfjFjq0Wh8=;
        b=k/rjukvsLyYNZDYRZmqpjkibMcZK5loRr4qfUGqJJfcVivIw9OelHpuBRHyIhkZEW7
         S9QscsGXp9eFAhLtH4CSpSwskf0NgzK3/ARnYVPVsZ3VqAprjF6TOrvpgVjpxby+FS03
         kX1hgTowCMXS88QhG28zeyhn6LXmpVQ1ExQmnyZ4g/ncPacgG405Bv54glCJsR8ercDK
         ln1hWXAHTDq+kComd9dKyiEkRqOKBZap8jAVet6PYncRtpnLzL4SXKIC/iKE5A1bctSF
         L1Rx6Wrs1q1NsDD+zvG7lIQtxwHiDJouLgm7FZcfehqHGJnD5oDl1bDr2eFU9Exxoi+s
         jWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687533256; x=1690125256;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnnKEbUvj74y6swt1Yen5ynIV0kpGjzEKPfjFjq0Wh8=;
        b=ggQgaS6qWs7DeCuBys2EklepkJinXR/2pCI9HuJHicCfddgToDIvmteRTw0nrTn5ay
         dbMNbTTpEsvcBHuNS0YSNByStSK9fIVcleHa4trTWd/T995N7OuTWVxuYfEY+ZFy+0yg
         W+tqfcELTGjM5wAb2wvVZMvtcjMMwBQcv8gs1LWzXHDbVCFX8u7TDeLSnzE1SDC5lWWE
         wZOCEzdJJbpWaUa5j0JcAc9nu4lx/HPmGF6fz2RHWMZZOpGthXSbyWwBiTnfeX29hq2v
         k2IyIdX5b+VxBHx6z3CmOVE0FgBBWffsg1ZNwUuAT01eG3cDjezuwaeVz3WO4a5+U25b
         ufaA==
X-Gm-Message-State: AC+VfDzrmHxg7S4S83XtIkVIcLqLVsiQX2RgdxgCUlBuAR0SUd8VtHmh
	9LprWO2afoGaSpCaDMxt4OnpKi46Eoqhheh6oLbVgpsf
X-Google-Smtp-Source: ACHHUZ4qreyV1AcIE3FHgVDqR7ryKxuELlgnep9l/AqSEERbTkINCRebEkpcqvT4QfBqWWkNlzHB7Q==
X-Received: by 2002:a1c:cc15:0:b0:3f9:bf0f:1cf5 with SMTP id h21-20020a1ccc15000000b003f9bf0f1cf5mr5812632wmb.20.1687533256577;
        Fri, 23 Jun 2023 08:14:16 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.93.175] (94.red-88-29-173.dynamicip.rima-tde.net. [88.29.173.94])
        by smtp.gmail.com with ESMTPSA id u2-20020a5d5142000000b003113dc327fbsm9788630wrt.22.2023.06.23.08.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 08:14:16 -0700 (PDT)
Message-ID: <93fb759a-e66d-cf2b-984c-59cb3e074bd5@linaro.org>
Date: Fri, 23 Jun 2023 17:14:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 17/26] tests/avocado: update firmware to enable
 sbsa-ref/max
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
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
 Leonardo Bras <leobras@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
 <20230623122100.1640995-18-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230623122100.1640995-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MCPhiTb8qwD+

On 23/6/23 14:20, Alex Bennée wrote:
> From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> 
> Update prebuilt firmware images to have TF-A with FEAT_FGT support
> enabled. This allowed us to enable test for "max" cpu in sbsa-ref
> machine.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Message-Id: <20230530152240.79160-1-marcin.juszkiewicz@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)


> @@ -150,7 +150,7 @@ def test_sbsaref_alpine_linux_neoverse_n1(self):
>           """
>           self.boot_alpine_linux("neoverse-n1")
>   
> -    @skip("requires TF-A update to handle FEAT_FGT")
> +    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might timeout")

Same comment as v1, we can remove the @skip* tags.

Similarly to v1:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

v1: 
https://lore.kernel.org/qemu-devel/579fb938-dc8a-5f85-143f-644ba1f1db40@linaro.org/
