Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2694444njb;
        Mon, 3 Mar 2025 07:35:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXrILqq2Pmhb56T4zYZRTTyt+ldHx+cm9Ezf4LNoh5SHjyAw4yxiZ6EOW0F6UYhbBqI45CTva2vIpDssQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFoDtXppPhab1GTc7n/+1dFd6eQAhY0icu9fAd2fKv5cFIa38KOXLtOA9Z0FTiH0E0TbOci
X-Received: by 2002:a05:6214:500f:b0:6e6:5e66:7706 with SMTP id 6a1803df08f44-6e8a0ccd0ecmr192069146d6.1.1741016144665;
        Mon, 03 Mar 2025 07:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741016144; cv=none;
        d=google.com; s=arc-20240605;
        b=E8+Jxs100yrFK8yPiN0B45BvRI7kG3mEb0srIImH4RQiT+jkYPM66Zakht62vIkosw
         j46lsvKpVD4JHC9Hft59WAcvobbfTzjMdjRIIO/GWd+xa0DvBvQSDCQRF8sCAE99bPZ5
         i79Uy8JLBa7LrVIgONXy/M7gvHjQr/LGEUkMKhG8KstSRgM4ZUIlLLdQ1eI+GR/jwca5
         Zkt7hOJznQPoRwyK2sIKa/nr+z5TVEKInfPAc49dmSPC/FYSU18miAcc6N2ESk1ECHip
         LfmmlLt9XGrjgsTy87RSX8PJHKQnB+FzZoMGz/pO6iFKOCQbJfs6LEm7u7Bargn9hVH1
         Z/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zIOZk3wDIbg6mQhTEtf61Fb6ROhIRArMbpF/7UU5I28=;
        fh=nJ08/unrFIxieTSK5drv911hop27+ltk/JO9Dnc5qTg=;
        b=b46Psyze9yjHoa7AmAycydKqvRyQ8bhtqIAIWRPIZ7l585nTFTpQwI6nhsR3sWP6dV
         bLhANplivhJhTBJXuiM6MofXVqRGKDf3/fXhD0Tmt/Cm4rZcXI35THQkcGob9OPDNQj1
         Feps9OHXrISyaemca0Nxqmb9PwWW6JjV0VY3F6c+kk4X0aUTFRRmTiChmee7n0bg+UAn
         FZXH8hoxbtNOTgCrT1Lem3mzFd+wAaGpYyikZC2WTNaFJp5P/4c6JojYI2g/XmH2z5EW
         wzCd6VBP4y4sUh1LGjxRTDb2HVO097MC5EQ1BVpqU9zALyTDGZZhsztJWxEFFmvb5tFo
         aHGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o5yy5hr4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3bf17b1d5si186308185a.526.2025.03.03.07.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 07:35:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o5yy5hr4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp7pA-0002Pu-EN; Mon, 03 Mar 2025 10:35:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp7oA-0002Cm-9I
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 10:34:27 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp7o5-00066F-4z
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 10:34:17 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso30018835e9.0
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 07:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741016050; x=1741620850; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zIOZk3wDIbg6mQhTEtf61Fb6ROhIRArMbpF/7UU5I28=;
 b=o5yy5hr4nOshFrhvGex5uGKMOBfYDrHo/4FXS7PwTzuAy9OFX6+/kWrtyw0/TGsVSk
 MJtc91f+soas4gSLRFtJ4T4lDMNN4MZMvzFT0o3f1WaKiZLSPH+gSbLWY+UOFORDGe3g
 lOFLDjd2skL6vvbLUet+bL+mhqoHsZieYq9AjTMsl6YF5TSNQfMTRtFazEiWjjisNXYp
 bHdtR+pXGKUuQa5rIQNqs1GIC15+4WaMXsfqmLdBuLO9QqsK5pSpnYixb8uOHt9tD+Zv
 uZtOLVp5lyKPJ92+zRu0601LxqIrCefmeYXDDNA68M+8bSqCPJgRFTG0SnNfy91nyz+z
 VpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741016050; x=1741620850;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zIOZk3wDIbg6mQhTEtf61Fb6ROhIRArMbpF/7UU5I28=;
 b=hZbfAhBQb/Pe6i6oP/8jmTY1hi6SeFIbdv+8Wsmo/go5IUgE0BtcAvzfvO5MLo0NhD
 wTIWnfo5gn3XAw9jAYEPVoB8+G9Krjl5xSBcYq8/YLsFY+4Vg3TTFsdZyRHvivDy6GDY
 +U+6lJSimcrywwGxCBacDBuxI+GaxiYZUOUZIqRSEbKO//cr7c1oChqAPgvMNDCmxj8u
 0Uj5g7S3gKtN0oeSWm9V61Vbwe64R/PAFBGVvWhLctOnAijF2xqzGKFStSVfJz88yTCs
 KvPirAn87LuUSba0ZTM3tmFKlllZ+Sz/Y4n0yBN+l+OglhLwTj8NrBziDCR2Y7ogORYW
 028g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2tTmhqIa22xGdI09uPnrX6i69R8kCFLpvxUduOvkyJLEhCya0LsqW1fHpSlYI1QcM7bjznIJ/IA==@nongnu.org
X-Gm-Message-State: AOJu0YyVv+FnxySLuoXzbLtdenR6Npi8fH2DYZCA9DTSY4CyX2fi4UHv
 Zsbs9d9cQ+NHWfPB+WZ59RAGR/Z741dS+4/p+ocES/AmjtUI7tzevjO5YxY7o6I=
X-Gm-Gg: ASbGnctNck+kJP9A+crPVoMddTocNJe/24WZORoVsoyIfiOkjPwYh5yJDmCULF2QkQn
 aRXkv+w7t8iY9RA3gV0wkIBA8XsZGPxAkHZPEHlFhWA/rtRDOp75Q1POTNPrfaSRu1lcOhNt9wT
 7JUz0M81/Ev5fJVzyQOqXKT2xdZuwaqJJExA/qDefkzvwI6elJtlF9T906qUvjeu3SBoMAGbPq1
 /qk+MZogdlQcs31WTQzYTyqbnG0/iHKlnuwpIYs4a+x4K9QleXjLEXoimogpYdEax9Cfg9IoVfD
 HTR8BlUiuf4oxFaTsPHOQWXyr+G2IZ0hg6rQULaGEyWbSFQIlDgar/xpEbSC7bUgnCHAJqo40BO
 tlxE00vFdQORy
X-Received: by 2002:a05:600c:3516:b0:43b:c528:d0b8 with SMTP id
 5b1f17b1804b1-43bc528d48bmr27284525e9.5.1741016050644; 
 Mon, 03 Mar 2025 07:34:10 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc63877desm17074825e9.1.2025.03.03.07.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 07:34:09 -0800 (PST)
Message-ID: <f6b74258-1dd5-4d50-92f5-bcc8d7f015b1@linaro.org>
Date: Mon, 3 Mar 2025 16:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] hw/intc: Select generic ARM_GICV3 when KVM is not
 available
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-arm@nongnu.org
References: <20241227202435.48055-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241227202435.48055-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: oDPxyuzHv1my

Hi,

On 27/12/24 21:24, Philippe Mathieu-Daudé wrote:
> ARM_GICV3 is not restricted to TCG and can be used on HVF.
> 
> Philippe Mathieu-Daudé (2):
>    hw/intc: Remove TCG dependency on ARM_GICV3

First reviewed/tested patch queued via hw-misc tree.

Thanks,

Phil.
