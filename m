Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1929227ejx;
        Wed, 28 Jun 2023 04:59:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4nd6KSe/GTANMuWxRrr7uh/bVQ8Lj5UTecX/7qBix8TYQlRdGkh8w09VZLNwZw3ujMIcTA
X-Received: by 2002:a05:620a:4014:b0:767:6c4:add1 with SMTP id h20-20020a05620a401400b0076706c4add1mr6316853qko.45.1687953550569;
        Wed, 28 Jun 2023 04:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687953550; cv=none;
        d=google.com; s=arc-20160816;
        b=HeiqgB7p4hGbDcX8jj63XxS7I+LJ4dSRE4A9jMiHD5+mBFejbHPAtk4uuyoiCFqdwR
         N416LMH9ytAQ7UWgFG8dm3pf049zLeSllQ62e8RSMUPI2GFvJMJkBlxR0NFZ2Tc2I8Dt
         NQdaw8Ofe9ONm+9oPKEvyeeFTOBC/CoQdIzyvyo6Lq31Tj0SzHf6MXYJUnQmlNBY57zt
         iKSje9fUdm8VHGxpfS3xX+MVe65+/4oL0IeYnBanZAfJ9MYLy/aCERx38AfqVr6ZER+4
         B8pS+DNP/R4BdfUWjE4vmqMdxImgeyOPaFIqTGtRi1cKPcXYJR8LkJswge76La8/YtME
         KaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XAnNOBqj7/aZOLa/iEWVdgiwRfPn+uBhlnTFYDZDHtw=;
        fh=TZ3SxzYDRdeSHrUGYCqpR0aWpnEmk0xJVMOqphAVtnQ=;
        b=cgF9JcMzSsfVNNpyg4HSf5M+7vDGOCZDGkaGGE/bLBSVMinM0DH9ACcBqLBbzxySvK
         ZU87+zR6LWArQI9k0ptpJTC/M4BaOlmuPE27VHZGCL5crNj0DOa/4vp6NY/PlBl7x/cL
         z2oEJZz6SoGpj0T2rkH/xhg2ZTwc0SRTdDcbb7um4HnYH/p0kGuwzX+WXvqmBu4bgeBc
         SGSJCOFEJ9ytJIAkfRrq8ryDhxHQovzj34So3oQeM+Mcr3B/SN2fWUQBd7DmZxBXedg8
         JQtW5tSCBY3dgED5f9uy74FwkouDj2henmDr0Q9FsXaPk/WOAyQ00UjDv2K4TicLxPZS
         GY1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XE7Vi2wr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020a05620a0b0c00b0075c6a873e89si2763274qkg.173.2023.06.28.04.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jun 2023 04:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XE7Vi2wr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qETpD-0005AW-M6; Wed, 28 Jun 2023 07:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qETpC-0005AG-39
 for qemu-arm@nongnu.org; Wed, 28 Jun 2023 07:59:06 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qETpA-0005AY-Gc
 for qemu-arm@nongnu.org; Wed, 28 Jun 2023 07:59:05 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso6484831f8f.3
 for <qemu-arm@nongnu.org>; Wed, 28 Jun 2023 04:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687953542; x=1690545542;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XAnNOBqj7/aZOLa/iEWVdgiwRfPn+uBhlnTFYDZDHtw=;
 b=XE7Vi2wrCeeILyk3U/eN0QEw2vyalWxVrmJf4lD0tUb7oMCiVJf8wS7IHVCfWF1ljm
 UcYgRcV+vj/TBd9upybrGu2ZGnWQcYk115AdgEaWs35KGlrLBhcqG0BEhTcU7YjZck4e
 hZnPymWrPJt5bpB6buQ8HEi1nwHGrrdsvvsmSmYanpPr8vBk4Iw+l38CFXHwaRUuBcEw
 oO5si+rS6KwqffIjHKgUWwn6ziExQo+Lxfh6bCrhbutF0UwXkHqNHNbT49sTTF/BwM5b
 xVXU+6JUZHdDPEpQFm8vio/70Zk337UqTeAm/3QQDEKOChBQNaN3tDnqXgvim7JECTXh
 ovwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687953542; x=1690545542;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XAnNOBqj7/aZOLa/iEWVdgiwRfPn+uBhlnTFYDZDHtw=;
 b=l1hLJL5uy04RlZSCJK12FQt4+bxvPchushG/02hQSSryTynR/5r2Xnl/O+11qpwhjL
 Hq3EcCKAKMvy3mtTqa7JW2cj01sQoVoS/wOYsoWVCp4nrAYKrSbbUELCEdAHNqdJtnzC
 VeotaInt3fqG42GC5KPQzDI14k+0IOg4M0nQjWjgOQey5pPKMwa3Q9SbBVtvcppuU8DN
 yqydAm4sj76CaCjF1RJobyMZe1ClH4Q2usaA92Amn8N1Xf3aHzqPJzw+te/sTpqHO3ft
 lO9MgITmtsEPP6IfW4ixAWl7zj1hPodTlmKTVm1QaLD6kNYoE3n7PkLOBIQ0ilTpyDZo
 EEHg==
X-Gm-Message-State: AC+VfDwzN/Dm67ke9Rggos2G67VfKif3OY+fXYzuz0Sa3zXy+kdq/PHK
 jnQnB03FT3WNSaToesrEosC2DA==
X-Received: by 2002:a05:6000:1b81:b0:313:f957:fc0c with SMTP id
 r1-20020a0560001b8100b00313f957fc0cmr5011317wru.47.1687953542430; 
 Wed, 28 Jun 2023 04:59:02 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.207.229])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm6513263wrx.59.2023.06.28.04.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jun 2023 04:59:01 -0700 (PDT)
Message-ID: <19821e47-0ea0-ca79-2c1c-3f663c9921f7@linaro.org>
Date: Wed, 28 Jun 2023 13:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 00/16] accel: Share CPUState accel context
 (HAX/NVMM/WHPX/HVF)
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, xen-devel@lists.xenproject.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paul Durrant <paul@xen.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230624174121.11508-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: G/yTVpSUQzYe

On 24/6/23 19:41, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (16):
>    MAINTAINERS: Update Roman Bolshakov email address
>    accel: Document generic accelerator headers
>    accel: Remove unused hThread variable on TCG/WHPX
>    accel: Fix a leak on Windows HAX
>    accel: Destroy HAX vCPU threads once done
>    accel: Rename 'hax_vcpu' as 'accel' in CPUState
>    accel: Rename HAX 'struct hax_vcpu_state' -> AccelCPUState
>    accel: Move HAX hThread to accelerator context
>    accel: Remove NVMM unreachable error path
>    accel: Rename NVMM 'struct qemu_vcpu' -> AccelCPUState
>    accel: Inline NVMM get_qemu_vcpu()
>    accel: Remove WHPX unreachable error path
>    accel: Rename WHPX 'struct whpx_vcpu' -> AccelCPUState
>    accel: Inline WHPX get_whpx_vcpu()
>    accel: Rename 'cpu_state' -> 'cs'
>    accel: Rename HVF 'struct hvf_vcpu_state' -> AccelCPUState

Series queued.
