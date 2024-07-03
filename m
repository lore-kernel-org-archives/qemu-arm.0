Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2621079njm;
        Wed, 3 Jul 2024 07:10:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWGWpQyp4R0QZymTirZiDRi32a9hx/+JKXc4ix+MNjmPDWdu4smkamoewf5Kp6AeeYnxzNsraEc7BEDc1hTZNY0Wu1f3GH
X-Google-Smtp-Source: AGHT+IFWLiCL4tPL4G6/jZJCJsRGJIVbk1LO4LvVzxgBfxbgXfDcGGYDLJxKUW0AyNPrO+VEnBSX
X-Received: by 2002:a05:6214:212e:b0:6b0:81c8:9f5e with SMTP id 6a1803df08f44-6b5b716a378mr158446556d6.40.1720015806645;
        Wed, 03 Jul 2024 07:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720015806; cv=none;
        d=google.com; s=arc-20160816;
        b=FNhwPHQqKxAIrt/rZEYYyF0IBqw9f8aU4fVNo17HBeFgK7DOJrFcz2ii2K6Wwh7ha0
         hoU65nN6giQqjRJcysqgfUItD/2U6Mrmcn693PJqgWswX0MgdRB0D+yrtcAn2nQLIT6i
         9vL+xgc5qRfnljAq8FmceOe3qjPHm4Brd7uRJMbkeosV+9Ibmh+lGNSvBcejBspF2iLi
         MyZk9GXjOS73v9SNCXoObRyme+DJY3ZJObP8h/MQgxCUMxn+ZcmbUMhYa8hftAkXYzVS
         93+xYUV7TO9BgexkdomBS3e+IISWk4CNYdUANIvABJYfNrng5VjIS5UobYt4mMlNeuog
         22wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=K5DxLWZbkwEHo4OuCFMF9eIKQ96NRbe8p0tnyb8+JTE=;
        fh=2LU4ESW3gVKfSxj2+7TBfkI7LBnPTvjz3gbfbq/u0zU=;
        b=fFvpseju+QIPjXZsk3vpRbtBtiblNc9+5+Vo7X7VMANMvZDOF0c7Y4E2+t/6GN9y9X
         rBP1vmqDheJD8pfrchLdxXT5q7LpdhJKuoDaeXB2o+nWxb/US3UO5A/hkJ5MGlgUv7FX
         G2QxTyx3E/Hup9G/bFyGEmZiYUY67cJtyFgQF/QeGP7xGtEt2Viq6w1gWWgDhbQQicBb
         Od8jev1XtAXvazPF7qwE/7x/zRTgytha+5Sl4NMu6NhNPdwB/cPR8lw4np96Y5uPslaI
         RlT7dNWOZMn7eCTULjcu1gGeAdEnIC+KOr6bhd6N/LVZ+18N3tRVXMTr+GIQNbogPiyO
         431g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gtnUteBD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e36351esi128063126d6.73.2024.07.03.07.10.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 07:10:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gtnUteBD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sP0gH-0005iB-GR; Wed, 03 Jul 2024 10:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sP0gD-0005g5-Tn
 for qemu-arm@nongnu.org; Wed, 03 Jul 2024 10:09:53 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sP0gC-0000Tx-AJ
 for qemu-arm@nongnu.org; Wed, 03 Jul 2024 10:09:53 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-367601ca463so3083467f8f.0
 for <qemu-arm@nongnu.org>; Wed, 03 Jul 2024 07:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720015790; x=1720620590; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K5DxLWZbkwEHo4OuCFMF9eIKQ96NRbe8p0tnyb8+JTE=;
 b=gtnUteBDGS4s5XaJOOvtFgWLpyngP6Dtzr4R0nobCarYiXrMmoly+YEY4fVIOE4asS
 zms2FzUm9ptDNnP1XofFSFe+ZgMjS4Hs4HxSFxvRqbb/JG8uCtH2PIu9cByLZuz+Yekz
 beOJccwfIz3wk2a0G1pEKC/2fC76quDw/Z3wZAzUsFbU3g0X5Llhva/QrUBJwX0Zw3lE
 WKKDesHFaB8mvdPwKMzo6bccI0UB1z8pkfLaYTDDLdUMAd4ZbGk0bnYfOFB8m4D3TR7q
 tXaju3mpzFVMySmyZ851twxxPC7KQT8mcqev+W/drHpcwKmm3iYOxITsHSSDaKOrye2Z
 /yxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720015790; x=1720620590;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K5DxLWZbkwEHo4OuCFMF9eIKQ96NRbe8p0tnyb8+JTE=;
 b=P1TmHauyjmLXhMawLhLVndsP4nNu18HWocNa1CckeNNF44ExLdxFlVKuPUQTZOaEy9
 hUaprD9yH4039fnt2o6BtxMQ2E64fJaLlivKTSZIgPtkJjLxF8DAti8gpJK4mw+Lzt4D
 Lj6QaX0Hk1kant70/CVpfe9pZ3pbh82mXZQG81N5kVf+k1yNr8OV3b40aadx4LGi42Sj
 vRfKz7IpM0PxyCg4u1S5Uf45LKI07+g5d6uj8EbYNsbZ/NWQsXvUzNkyz6flRdzKGCgH
 R3ahp/sFqCpaxpJmdbTJ38RRCPKtu3c3Xr3grY/bHTMBamgshIegxgfZiOHrBjts2xSs
 w6Iw==
X-Gm-Message-State: AOJu0Yw1eOHD3F9mlEI9/kg4dyvKuwlh/Ozgqxzn3YLpfsTp/nHwZblI
 TvhQ6FGs/DZLVnsWxRyW72FAbpQ//H/2fVYRnIoigYaIKChWyCJTZWzMwRO2KM4=
X-Received: by 2002:a5d:6c6a:0:b0:366:ead8:6019 with SMTP id
 ffacd0b85a97d-3677571b6c7mr10314817f8f.49.1720015790337; 
 Wed, 03 Jul 2024 07:09:50 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.220.97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36796b3efb4sm982384f8f.96.2024.07.03.07.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 07:09:49 -0700 (PDT)
Message-ID: <693bb711-3f45-49e4-89f5-b7ee1b2d215b@linaro.org>
Date: Wed, 3 Jul 2024 16:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] tests/avocado: sbsa-ref: add FreeBSD tests
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20240703-b4-move-to-freebsd-v4-0-07191f958530@linaro.org>
 <20240703-b4-move-to-freebsd-v4-1-07191f958530@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240703-b4-move-to-freebsd-v4-1-07191f958530@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: kVZxqC08pqr2

On 3/7/24 16:06, Marcin Juszkiewicz wrote:
> FreeBSD has longer support cycle for stable release (14.x EoL in 2028)
> than OpenBSD (7.3 we used is already EoL). Also bugfixes are backported
> so we can stay on 14.x for longer. Tests done on OpenBSD will now be
> done using FreeBSD.
> 
> OpenBSD 7.3 stays with Cortex-A57 test for local runs only.
> 
> Moved from Neoverse-N1 to Neoverse-N2 as sbsa-ref defaults were changed.
> 
> Timeout messages expanded to mention being affected by PAuth emulation.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 73 ++++++++++++++++++++++++--------
>   1 file changed, 55 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

