Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1528945ejc;
        Mon, 13 Nov 2023 10:19:07 -0800 (PST)
X-Received: by 2002:a05:6a20:428f:b0:16c:b95c:6d35 with SMTP id o15-20020a056a20428f00b0016cb95c6d35mr9292141pzj.50.1699899547481;
        Mon, 13 Nov 2023 10:19:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699899547; cv=none;
        d=google.com; s=arc-20160816;
        b=iD1JZil4kuKi6CFidwLUJGKHuBhzFISkd9LeXjmS9x8RsAoK0wUqOLUi7ZkD4AE4lI
         nTyaHjrE7JIVZ53MFYi+Jm09YlxFVFpxwyOFYqQZnCu8xAvFmrxNxuE1cHw16zDwDVH9
         3Py6TsJ343kbkz80NISykrGdz1K3q+wNYQLJ93Sa8zVV+YX7njaMOvllB16ONsY0uWPD
         S4m94CNg/kKoDC+K8fhZ3FvOGG+QHcrZrcbf1DshzeSpj39aDezu9cgx4xNoUY8FWBEq
         /UtEWLqCgvy5ps2Cw9dr/9rsFnnASKpYaAL8DIi+dnZQNyxkgS3+2u1ngtXHGeFoBpLl
         rcjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=umxmIrkbAOLmL1DmXXbJI6TnuJLS61wFseCU5AQMMlE=;
        fh=EvOKQYaIe4I9Kcy6c/Ll7Qwfc3jBPyyxi3MLAzaX1fM=;
        b=mRbTAppTeoMXGx9qi8EpPPl6UIPmyMOoy0yOWEoBtXxsBed/wCwYc61CbEbHL9UExR
         bL7cWUSMSfb+jcqwIcpnDHi7RnjPsOMiLtCWck/FdisauB+2T5K24SxEfVDhfhXv/hOY
         +Loab4l2wlWaF6gl0xTLn6rEl9v8gs8WfRZyWOeTm9HhkjWg2VW2BdU4OrSnl5UFohoT
         Yuu6xyPN9e1nYbagYzoTM3IeOu7s656hc+1NJSaNePX+IERluhrmwaV2BpZUrsE1h5hV
         VI9QqVre9Q6SUnXnRDi/vDFJl7bZUZbwkJSlGlsX3sObKSctWTnYM1p1UAxSOjnvmc8b
         ZFIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYIwyDwV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ja21-20020a170902efd500b001cab282c41dsor180020plb.13.2023.11.13.10.19.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 10:19:07 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYIwyDwV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699899547; x=1700504347; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umxmIrkbAOLmL1DmXXbJI6TnuJLS61wFseCU5AQMMlE=;
        b=IYIwyDwVX1HDYwVIH3G1FiZuczGPNv3yl8hO5xuHzs1+4+Q21oJTlCih68Fi0VUeim
         JUiHyJIbkcPL4s5H7p4xrpnD0Zv9Me9zHOSofOZe8WmvaKPhku8kE9bHGSBpcfxetQfC
         U2bpX3KjIS6Mj5uNO+dvyfuxGJGDhtbIgGDqL5lcVJYvoBaXrM3vdej0NJ4jiV+kOG/t
         b0VBjqZitxdErp1Qb+lbLvnYYjegFUcn4DxBt1HavNY+pCNPePuW+RVvDG2xexuTg7Z1
         sU2fObbU/Rbt31/6Oe9rKp6BCeoGgEZANxAKK+MztVbqGAi3ZeN7zwcsrFz3ls8uEkJA
         zOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899547; x=1700504347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umxmIrkbAOLmL1DmXXbJI6TnuJLS61wFseCU5AQMMlE=;
        b=uzWcQuVhdwlNau1kFIbFTWuHmtU8LanjLsKbauiVkpUl9uC88+90QcVzAYY/cChue+
         dSZ21a9FLrs04YlVaV2Xj9s+FjJBxzpM8mU6w7WOGGDtgpvQ+0OIYmTWf1Ir1x4wklh7
         y5H/AGE6HTGeE59fbLQ3BAHg/h3XQeJqP21LxTMNNzDRI/56jxUwUH5dDoczTiQsM3Nx
         YZlClbhjXtCNbq/x/ADps3DaiqKbtvjlq/Lkci9kOs8xddzuLXRLthb61CW3vFwI+gqR
         0Ov6fbGL1uKwE/QIDY1RLT8ecyzh6mgmVYCphdkBcX68Enf+hFw6sAa/dCdW8HyO0CmZ
         bddQ==
X-Gm-Message-State: AOJu0Yy6SeG1o+HMoi7xpp5uPF1IKO79ph2P7AZKomv27n8jvKPdmi2j
	jHTzywE2+Iwiklyt09RRMe4WVAV7
X-Google-Smtp-Source: AGHT+IGg248TCR5/kb/i5Pi6wxhtajoY/akEWVclfGdoBcuPjMW4q7qpmailfQkpV0PQqKGOfBIpTg==
X-Received: by 2002:a17:902:e88e:b0:1c2:1068:1f4f with SMTP id w14-20020a170902e88e00b001c210681f4fmr423529plg.17.1699899546984;
        Mon, 13 Nov 2023 10:19:06 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id ju10-20020a170903428a00b001c59f23a3fesm4142792plb.251.2023.11.13.10.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 10:19:06 -0800 (PST)
Message-ID: <a6333482-93f5-4ff6-826a-c1564e89c796@linaro.org>
Date: Mon, 13 Nov 2023 10:19:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 06/10] hw/xen: Reduce inclusion of 'cpu.h' to
 target-specific sources
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231113152114.47916-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rhZdZqhzKXfU

On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
> We rarely need to include "cpu.h" in headers. Including it
> 'taint' headers to be target-specific. Here only the i386/arm
> implementations requires "cpu.h", so include it there and
> remove from the "hw/xen/xen-hvm-common.h" *common* header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/xen/xen-hvm-common.h | 1 -
>   hw/arm/xen_arm.c                | 1 +
>   hw/i386/xen/xen-hvm.c           | 1 +
>   3 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
