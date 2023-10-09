Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp2034139ejb;
        Mon, 9 Oct 2023 08:09:51 -0700 (PDT)
X-Received: by 2002:a17:906:20ce:b0:9ae:3210:22fd with SMTP id c14-20020a17090620ce00b009ae321022fdmr14345223ejc.48.1696864191529;
        Mon, 09 Oct 2023 08:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696864191; cv=none;
        d=google.com; s=arc-20160816;
        b=iVjRDtbkEJA5+uSJrTCd1YgxyhyLXs64+V29DoNCZF8Pg2CiCIP366FZjmmh7VZ2ww
         JmaByTJHlQ/1/4bObQyCKd+vYqYlYJWqX6S8D/FvT9wnblMURO4LpLd6vPn1ijD8sT7y
         8dfrHLUkN9gzS8zBgjsLH1gDdxq2LbIQ+m7G3jmO9q1fEU4aiG1Ow3KjENrEB1atpFW6
         kneEJ4WpoEg1rLTPFCL6YI0g/pj5ytkmzBhAdMeSwZTR4BHINPwLNIFHjztJ8y0brsoK
         1O0FfnWHIAmUA62qm+qUCah2pOCoc0oNZHFENKfAM4iv6pU68IKkStjTFjdlooyAfg2y
         U+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NldQiTWA5sMVywFdcvGk4DI6HBcviGKaPNWPOAI7ABo=;
        fh=gwrf1HRYFAPa0NfDvMWvgKC4jiB2hnFN6ILaWJAclaQ=;
        b=RaaFGigGB3UrBgfOKMe0KS6z/Vp62F05QDuemIzHcEq1Pz+wmq0RI+vINB9+xbrJcv
         E/d65kP8m8jVmUZkPNcqvBRJOnkebp9SvfIv4IC5lTKVjOiBzX/kkEUQ5JFg42jwW1uP
         IRSH7QPn/wa+de+qMpbxZp0t6GXySJ/657d4Wc4/XjwT1KxEi1ds5APP4cCinI8D8nTJ
         gR+KpWzV4aaVgZ10fo3ukZEfPHLD/GIt1UD0rN3Z9o13rdSknbCQbu30ATV+BQwCmSuP
         1BPOF9R0/SXgV3ONtOmpkjXuesXxYC/f0pvGdGcv+jaGWoEuHGShUVA0TqtngauIbB49
         tLKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vlRJOgLq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ze15-20020a170906ef8f00b009b2b2660e94sor545776ejb.11.2023.10.09.08.09.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Oct 2023 08:09:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vlRJOgLq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696864191; x=1697468991; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NldQiTWA5sMVywFdcvGk4DI6HBcviGKaPNWPOAI7ABo=;
        b=vlRJOgLqMXklYbW51gsGYUjPyCHHfuQE+RVLgXOYfw4aiGUp2LzjprPAxkAKhz5xJ4
         q0URV9g04ex6F4LQjDr/SsxBaWjzeaahrTR+vJCIFloSGrBROTkW3LKTc8mjLBdzs0Si
         bw4CYQ/oy4/Yfe+CmjG5xWJztCzCpcC+JDDVX4KzgESYKxFfJxaWXLClck3DkmCivId3
         tu1hXWRypO9wA1RvRgLbLPyxksjO6FZh9iyHhBtPlMXetIUkn79ru4eSPy/qZa+eQtrr
         l512z2P9CRki8AFuPtTlrVtigse86ZrPh5qBJ8D1OPEvQ3+ZG3LVe6Q3bZNN41lUtiT+
         Co5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696864191; x=1697468991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NldQiTWA5sMVywFdcvGk4DI6HBcviGKaPNWPOAI7ABo=;
        b=gJjHsitxs3JnpgzrkUMgf2KI5SNmJ2pcBBvSp7Ssjpe0uJefovd+bw+pyxzWP4RewS
         W1aPpi0hAzYCSrNcyw0x7Y49mNB2wzdNinCrRy4KGkpTauXxkau5h3n9/gpIpk3IlOJr
         PfeD03IGfqqBXldidDEqmz8FGDE2pP0pBJmwrpxuP0Ztwco+o4lfPYiBhZYPNOTvylyZ
         lGuE1k1aXyuDhoHsUR24MDEWzCzPz8NonKwZGHy3qMVwGmu/vXbICaUFXQaNOgY2evWf
         8WNXiw9aEpSZpIQyHGd2KTBONtscF9c9XHd8NDajcW0m2LpG+f8NqtYUI4eN6ZOi9ByT
         d9MQ==
X-Gm-Message-State: AOJu0YwXdojgGuDKnaVpGdflxQSGuBlcddF7mXMGPMsBsNNMFszo9Px5
	rfCdpCqJ9c26reAN3B6hJcBRqg0r
X-Google-Smtp-Source: AGHT+IHQ27FjElR7d5mwjgma7Xr1e662z4pYTF7K7YI3KbhnnjFWGYlmg9ucmRkwxS0hlFOhZQGOWA==
X-Received: by 2002:aa7:c255:0:b0:536:e814:360c with SMTP id y21-20020aa7c255000000b00536e814360cmr14174772edo.4.1696864191113;
        Mon, 09 Oct 2023 08:09:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr. [176.170.217.185])
        by smtp.gmail.com with ESMTPSA id l16-20020a056402125000b00536159c6c45sm6114967edw.15.2023.10.09.08.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 08:09:50 -0700 (PDT)
Message-ID: <0052d92a-b712-63ff-5e3d-668787f0213c@linaro.org>
Date: Mon, 9 Oct 2023 17:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/1] tests/avocado: update firmware to enable OpenBSD
 test on sbsa-ref
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230927120050.210187-1-marcin.juszkiewicz@linaro.org>
 <20230927120050.210187-2-marcin.juszkiewicz@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230927120050.210187-2-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ZsDCLRHQuUA7

On 27/9/23 14:00, Marcin Juszkiewicz wrote:
> Update prebuilt firmware images:
> - Neoverse V1/N2 cpu support
> - non-secure EL2 virtual timer
> - XHCI controller in DSDT
> 
> With those changes we can now run OpenBSD as part of sbsa-ref tests.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 68 ++++++++++++++++++++----
>   1 file changed, 58 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
> index a794245e7e..2d683d4f6a 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -28,33 +28,33 @@ def fetch_firmware(self):


> +    def test_sbsaref_openbsd73_max(self):
> +        """
> +        :avocado: tags=cpu:max
> +        """
> +        self.boot_openbsd73("max")
> +

FWIW:

Applying: tests/avocado: update firmware to enable OpenBSD test on sbsa-ref
patch:113: new blank line at EOF.
+
warning: 1 line adds whitespace errors.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
