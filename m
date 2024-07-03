Received: by 2002:a17:505:3490:b0:1bdf:97ae:c215 with SMTP id bi16csp2235620njb;
        Wed, 3 Jul 2024 07:12:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXANoyYkx234BHFA1lOMNMdPQQKmN8Odgc2vi/pFRp0cTFd6u8ibRzP+I1WRGQQnd5sWcyvTC61orJWcNHKvOYHua1WPLBW
X-Google-Smtp-Source: AGHT+IGXy/WzbR5V3nvDT++xc7icwWtFvQbfKTG49NYuKVcEY/kJLKHgPygIQzZc67YWS5Vp4kFp
X-Received: by 2002:a05:6808:1288:b0:3d6:2da2:2b4e with SMTP id 5614622812f47-3d6b31ebf5cmr16862583b6e.14.1720015935416;
        Wed, 03 Jul 2024 07:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720015935; cv=none;
        d=google.com; s=arc-20160816;
        b=yscVcE5/2YuusYAyaFn5PAnR0UTF6xTuh/vhusUNNT8AJr0d9wxH8V6NdMSlMIDjgB
         55loxfErW1cepFGglrdqQR2pKMfRIJXvj9x+peHuRA+cZtKh05rdrCXgJ/cgIe29CR4o
         1dd/YUgsfMKuCjJ/cGMU4426DZn+7sfSwkP9dWI82B2hPCpBy0TDRKP1tob6G+6GKgU5
         9x1kbdGabZY8A5v690nD29RaDXaGurblh5DRlAIPOZ7jwkWIPMiB6B9vnx69AaTaZPCl
         4hW20UANp2mVWFnEyUEaiAAo4N/u8PPlN5bhJTLFMp5UaWioR/bNgZPlAR35uNFtNJ3x
         B7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xrStVSR/S6iqC36MaUVaGjHdT8yj8NhP0BQvwC2mvCA=;
        fh=2LU4ESW3gVKfSxj2+7TBfkI7LBnPTvjz3gbfbq/u0zU=;
        b=rjeZePXs+XWIco6Ftxe94Pjc12wX9GxLi4P6I1xL7R78oFnzGsxs6bhR9LLm5spQog
         XiliJkA7rhyV3dCn+qbvhy4ZIggYB1BopoFcoDqbw4Wj+CrDOB8iEwyaCyyONBJy5jsA
         l/mv9sISq94aEI5j3n1nt8qYNmZ862m0H5yFEZm/37+iX262nojqZpHpx6sIeOkPDZ5M
         /v6HdbqS/Rn8c9tlrIm8Y0m85bAJ6DZszrv24WiIKxAMpOEkOOks0Lh9Ju4euaVpvcmj
         J6nuM2oZUGz8NX8K9k124N56YKfTfo7eq3w1H46nxopKaXoZFD6hKKAG58AV0g4KzuuS
         EA9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wb4InHC8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f29224e0easi1555503e0c.186.2024.07.03.07.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 07:12:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wb4InHC8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sP0iC-0006ys-Pe; Wed, 03 Jul 2024 10:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sP0iB-0006yK-Pd
 for qemu-arm@nongnu.org; Wed, 03 Jul 2024 10:11:55 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sP0i5-00024U-TA
 for qemu-arm@nongnu.org; Wed, 03 Jul 2024 10:11:55 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a732cb4ea31so131168866b.0
 for <qemu-arm@nongnu.org>; Wed, 03 Jul 2024 07:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720015906; x=1720620706; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xrStVSR/S6iqC36MaUVaGjHdT8yj8NhP0BQvwC2mvCA=;
 b=Wb4InHC8gMonmWdW5OA1lmcB/3g0nZKIgHWaKDZeicz6Oyk7Bs6HfkvdJg8TFnksCv
 DMINOOR64Lij/q07BucgHyaNtlzWK89Fc1dz1j3GrEo6l7ib+MN90kTqC0XU70+fli9j
 w+8cskyufK3y4xIZZFGWXaH/J+mjbSbiCzplrAkpEqvUnoCn8AhzbhLZEUU/8w95fsl0
 cru10yPYRGgnGKQFPwSO5AzhSCJYC/q3YXgxSocgXsxO28G0wFsKi/hL991d5uBA/QBD
 OTs5LN5jRqUXjgGeB0L1GFD6M492TEGQvfnYJxMu5OoeOmU3GMAcrqYixGFj6uvXPFMu
 gh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720015906; x=1720620706;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xrStVSR/S6iqC36MaUVaGjHdT8yj8NhP0BQvwC2mvCA=;
 b=XIdpbXmv5vMQFd363YQxDGxWxjONb7urwev/PqxYozF9ob1E0w13QnpBtcI4z7Ibbo
 hj/WF6i8EYCVW+8pFnUFXaj/EtwJpcgb1xlkDUNHmioOqJ1dh3xo0mocfwUW9YCuVnru
 oINMFLfc+SGRD19zsj24CQSOEF3K3f0j9DDLN0thL9t10UScBqt/Kfr+BPafxLXb7ldV
 ux+SowtCzCFGK/knfMj9d12RCwD868/b4KY+jvcPXm4mHXQZfMcj947KSKrRVNU+Yjlu
 Ntr9CzT9+QGXfUkN7J8HuGlkslrr4B0prKdfboSGOQ5jvyivEubgTCWZGVvCLHeJ5wiU
 S6NQ==
X-Gm-Message-State: AOJu0YzSPoS7ea/e3s+MpG1k7NYrw/OzNf7qJYRAAw5wXD26zh47rMzh
 ZSxcYRJySFj9/cLiQLNZOM4FxwsrbHlZLUqyMxiufIeh4pkaaSl8pbTnoLK5jRg=
X-Received: by 2002:a17:906:6bcf:b0:a72:5f3f:27a2 with SMTP id
 a640c23a62f3a-a77a24804a0mr143784866b.26.1720015906254; 
 Wed, 03 Jul 2024 07:11:46 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.220.97])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab08cc07sm519403666b.149.2024.07.03.07.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 07:11:45 -0700 (PDT)
Message-ID: <6f231ac5-bbe1-44ab-9acf-37cddbc1ad6d@linaro.org>
Date: Wed, 3 Jul 2024 16:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] tests/avocado: add test for default sbsa-ref cpu
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20240703-b4-move-to-freebsd-v4-0-07191f958530@linaro.org>
 <20240703-b4-move-to-freebsd-v4-2-07191f958530@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240703-b4-move-to-freebsd-v4-2-07191f958530@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E/UJUxt1t/Sw

On 3/7/24 16:06, Marcin Juszkiewicz wrote:
> We changed sbsa-ref cpu several times already and may do it again in a
> future. To newer core or to enable/disable some properties.
> 
> This change switches Neoverse-N2 tests to 'let test default cpu' ones.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 29 ++++++++++++++++-------------
>   1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
> index 2e27d37cb8..46a1d982f3 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -113,7 +113,7 @@ def test_sbsaref_edk2_firmware(self):
>       # This tests the whole boot chain from EFI to Userspace
>       # We only boot a whole OS for the current top level CPU and GIC
>       # Other test profiles should use more minimal boots
> -    def boot_alpine_linux(self, cpu):
> +    def boot_alpine_linux(self, cpu=False):
>           self.fetch_firmware()
>   
>           iso_url = (
> @@ -126,12 +126,14 @@ def boot_alpine_linux(self, cpu):
>   
>           self.vm.set_console()
>           self.vm.add_args(
> -            "-cpu",
> -            cpu,
>               "-drive",
>               f"file={iso_path},format=raw",
>           )
>   
> +        # let allow test which will use default cpu of platform
> +        if cpu:
> +            self.vm.add_args("-cpu", cpu)

I think the pythonic way is to initialize cpu=None instead of False.

> +
>           self.vm.launch()
>           wait_for_console_pattern(self, "Welcome to Alpine Linux 3.17")

