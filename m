Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3492498lfa;
        Mon, 7 Jun 2021 06:28:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybmnGT+4TT4ESMSxQy3vEYK5AB86oHNegiibG+kPTb15LqcKzAr+czFbgxWHkJDpMyrl7V
X-Received: by 2002:a05:6402:51c9:: with SMTP id r9mr20431280edd.238.1623072497840;
        Mon, 07 Jun 2021 06:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623072497; cv=none;
        d=google.com; s=arc-20160816;
        b=Tw8+vqUEKm9/OUvhmzI9iB0yQEKDx24LBcM/tFSlV9nuuRzdDH2idifJFHSDePho18
         y9Cs2Tk7FVgT71I5NAFx524FLHvaSwJZyjmelblI0nrrqnqrvvw9jyaMh3WVL0mFU1ec
         KM957E16pKvhF3KABhqewVuEBd7QO+gczrmz1uZuM0FF0O6uOsE4ECP/ue6FehkxD0gg
         /5Ja/SpLWX/TSlaWeF96fZ5wn+OV6cGN4Lb0XiNAaTMpvTLqk68sLLzJSczU71uSPPRg
         oVbhcfbMMjwSH91FSjmRRLIk8SlEn9T62vsuqKqCAEIBhP7aygtAW3Yuh6Yonr4nNh22
         86Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=xnOFIgJ8ql3FFLMO+TnZR5CSTO/o8h4V9DXMaf4EYn8=;
        b=kBF0ATcFrTwP9zEU6Mvb/Hy0TSzjLr2X6zv31MFm53wzT6zRysCSSqlg9tMpAK731j
         9rfoanM9CbWBWwSjv9N32fHlkNktgVIiiPk98sc0HsEiaFTB2mrD7Iy7WfApHnXLODOt
         YGoFtTI+AZOWNwaq9Hal8hlGJxRKbSfDV57rP4hYOhyNUX92Gbkr23DxvjA/40ymNTGt
         K9N3MkTBLYkdA/Rl7ireTirTUVTn2vKKRFVlTdBpRpi07375VQzb9QyuS7D1lUb6ke7g
         0bXJ8/zNeFum+fXP4jCNlrxqvdaZmtHDZiFaE4bfAOH6go6OM/mGEEw9NDd50Z0BvXni
         lgLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NwxP3v6H;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u1si11649538edp.527.2021.06.07.06.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:28:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NwxP3v6H;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623072496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnOFIgJ8ql3FFLMO+TnZR5CSTO/o8h4V9DXMaf4EYn8=;
	b=NwxP3v6H6OuuHOnw1KExsX92tzdA6/C8pQF6EtfKdJXt6Hlc6Agh0fSiof0Vms6NtJa7PW
	qk3IX92fMZ2hLDoq0ArQuluI+134Z65a580OP/lwsLmzwEf+aY5bEQYaXyOQe8qF7W2r8z
	oRrNEY6MyJeheQ12L/HLlEeSnHpnaz8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-weBnBUuZPVyrdcCXvfyBHg-1; Mon, 07 Jun 2021 09:28:15 -0400
X-MC-Unique: weBnBUuZPVyrdcCXvfyBHg-1
Received: by mail-wr1-f70.google.com with SMTP id r17-20020a5d52d10000b0290119976473fcso5663483wrv.15
        for <alex.bennee@linaro.org>; Mon, 07 Jun 2021 06:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xnOFIgJ8ql3FFLMO+TnZR5CSTO/o8h4V9DXMaf4EYn8=;
        b=U/k8f4p6cNzK6XIZsaPy9bC9tc2kwWc4a2F2rTqZgrSioIidx/+3ML4x02NAcF9Vz6
         csRgCYoWEkK/dqlu1yGMjsMalj8JNBEzBGIa03mI90xwQHo2aAnXYtq2QZftOa+sFe8B
         w9KWU1dOkTEwO8oCImkgBHtW/83iUs0+mI9RVc3FvhXO2+zAVXZBPEU8/Aiwntcudq0U
         nGZFuRl9eEYTxxuk5m+qucyzhFwG/aIx5d088WtGrlaakldA1LgpmeycaGJmv07mNwvw
         BNpcDa7j0/i72I7V0P+KBMGBz2AQlW171km82ebANtxay5AqgvmN1YQCH0OoB8lo0LLe
         P1Cw==
X-Gm-Message-State: AOAM5304YseblcRVB0UHLXztlXtqR+bH1ZgBx7jEo4tIXR/YAm0HrvUG
	ZrJjrh3kBpym0tFFwS+9stWIcfk0bg/7Tw8kZN16ztcLSXyqcmqRHKUrxX0GWUrlCERh9zQ9NSV
	NgJ0B7JJ0BY43pOp7
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr17075914wrr.358.1623072494570;
        Mon, 07 Jun 2021 06:28:14 -0700 (PDT)
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr17075894wrr.358.1623072494382;
        Mon, 07 Jun 2021 06:28:14 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de. [217.87.83.110])
        by smtp.gmail.com with ESMTPSA id k8sm13473462wrp.3.2021.06.07.06.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:28:13 -0700 (PDT)
Subject: Re: [PATCH v16 06/99] qtest/arm-cpu-features: Remove TCG fallback to
 KVM specific tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3e4942e4-be35-ab51-e290-3faa6c67d4a2@redhat.com>
Date: Mon, 7 Jun 2021 15:28:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-7-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Kei36TJtXyGj

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
> tests are now only being run if KVM is available. Drop the TCG
> fallback.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-7-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 66300c3bc2..b1d406542f 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -21,7 +21,7 @@
>   #define SVE_MAX_VQ 16
>   
>   #define MACHINE     "-machine virt,gic-version=max -accel tcg "
> -#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
> +#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "

Same comment as with patch 04/99: I think this is wrong. You're mixing up 
whether an accelerator has been built into the binary with the fact whether 
an accelerator is available and usable. There are plenty of cases where e.g. 
kvm is built into the binary but not usable during runtime, e.g. because:
1) The kernel does not support it
2) The current host CPU does not support it
3) There are problems with the permission to /dev/kvm
etc.

I think we either need the fallback mechanism to tcg or you need to properly 
check whether KVM is usable, too.

  Thomas
