Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp716987eja;
        Thu, 29 Feb 2024 15:21:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXc3pHflJ7HIHjkshxnDWRklX8TlHPy/t2drppnANrpKDhXeFG9gbjA+vhLa+4XSJnv89d9xphopoo5EOtrzauOGAuTQgv+
X-Google-Smtp-Source: AGHT+IEG9MZKQoFLQ3ozX4A7UN1O9LkgfhN8Ix9mXOUHl1iDeDb+yHRRzhhOmIInNviDx7Pf0nSV
X-Received: by 2002:ac8:5c92:0:b0:42e:3cda:3d0e with SMTP id r18-20020ac85c92000000b0042e3cda3d0emr3203230qta.60.1709248862623;
        Thu, 29 Feb 2024 15:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709248862; cv=none;
        d=google.com; s=arc-20160816;
        b=ef/fDxIG+FwE0VRNL5kQyKayGqqKsYtNfxiNdBb4VL8LoRnNi8t1JkVIwp/jq7y3jS
         u1K8P7IInRP+NYajgXrhmcoLFAq309GesDM6/oIZhH50e/VnfObWZtWZ/Qd7ALlj+qjT
         iEy7uQP/cZW+RbsBI9SVQd23fH/4BJc0F8XU91OyBhwpsoqadMXNLSmHQDG1Mri+GIs8
         7uCsUTXII2yJqLXSbE7bGHSjTLMtv4OpQCm4/eXL1OVaBnm1Br4bV8qeuAeKURLxnylq
         IZJe3IMGSB/f4xLWCS/Y1SCYTUoYt7DTHhXU/xiRClTq/hoWW7MsxPX7PqoHSXDTkIuA
         LWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=6COM1MC9rUSv2H45BWoHYXE5IVjCLgCxq76Q7GO/s8w=;
        fh=Hf2hdiHqEXYQgcBi2IWgoZ58QlJd5tE7LJ4PORF+CzE=;
        b=l89UtU27OgeaPrKCDF4afN2uqH3BP+RaDDB6C5jSK/s0zfsfNTqcBvtiWcF3srum4f
         ihZWpgOhC4+jMDrdFzzj61nlvnz8G/Ro9T4f+k2t3Za2e5mDZLwSYrPYfm30JZDphSMs
         tnt5GeVBEdYYM/jfnzwMO4VUaAFennMNFmJJ6dPJf9fOJaQwLUPGF3LGmtDMp8ade8pB
         fNSFyhmTA2xQEePg1dQcR9KknNN9L+t3spxCtM68q8hoHOtY1JOaDXse2b1soKnOv+e+
         MMBwOb3gHQIYM18/Ivd96wE41IjSHSp6HvttJMh/ANsnjwC8YjNMnSp4Q7ugIy2AKKip
         rsCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AMlkRuvJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t34-20020a05622a182200b0042e5ca4ce5asi2506608qtc.591.2024.02.29.15.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 15:21:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AMlkRuvJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfphh-0005fj-HC; Thu, 29 Feb 2024 18:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfphb-0005do-Jb
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 18:20:37 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfpha-0001rt-1O
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 18:20:35 -0500
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5d8ddbac4fbso1311187a12.0
 for <qemu-arm@nongnu.org>; Thu, 29 Feb 2024 15:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709248832; x=1709853632; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6COM1MC9rUSv2H45BWoHYXE5IVjCLgCxq76Q7GO/s8w=;
 b=AMlkRuvJAVzs3aOTgEP8ROMirfXIFUBBUOCLgHsoy4sUGns30TXRE4MTS+1Q78DV6d
 qE98gCcvWRRQKdAMadNe7IZS6PiZHrN/qMLkvwQRABULzQFCTlpm/WRMe8wu3Nk5TInf
 VlkxeVnPexEj5mBkDGFaefPQ/440YUZsyTv0R5fcCTQSTHKFJOfPbLOflKQptbYHK2UA
 Hkhr9EXkZ02O5pLf/XUeAeYTi9RF1I8HnJ4FIUbWjc+JcviNNnJWnVkDfWNI//AYvh8T
 mVUE2QDgexJSmtVA/uPxEuINnQJoR1mboMyRqVeeINGoaHwVKSRrOdiBkQRdZPuQ46Kb
 VuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709248832; x=1709853632;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6COM1MC9rUSv2H45BWoHYXE5IVjCLgCxq76Q7GO/s8w=;
 b=tD9CwAHObxBDIcrEBg13wNFqxEbxc8aCUnoQkBR79CfWLi9i26ZSbKvq+iu/Maecs3
 b9trDiHw9Lenz6VQetavRQ6hF3uGgfDf4GZb3CninV94RY8aQHpsMiiAEybSXZYC1EAJ
 lYkFbq+uqRBN7c1RDjbySlJpt0xyTL690sp6yNDWrtnecfQyXHu64fgBsWL7S70p8VII
 +VHUm7fknD9LK/u9+drlJOCfDyGVudGHs4jURhL6s+dWZMzSF+x0ngfdCBE/Ey2N5vOG
 sU9Ca2yv7CzBh3bfiGTwIqAIDUws6zD1f2cAkjG7hPkQ7hg0uOq9AMqkQWf5m5YWH1lH
 j8+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdAXcGKjzcWNsU5NoW6if2NA8Mhh3Yn2SsMR26cSR1qqUyvweRp2xUGWABaHc/8lmOdsclWODHadJTRnMExNI/FzqF
X-Gm-Message-State: AOJu0YzhvezrSkx7gsrqxJH5Ed0CPtq/t2KZt612gRb36t1HQbMwxGCH
 4KWrK/LdaWyeL0nTg/sLIbX1xGLBHUE/SEy8GWDIVHD8Gz3HYa1eOsJ/DNfkPsw=
X-Received: by 2002:a05:6a20:9f87:b0:1a0:6c85:b48b with SMTP id
 mm7-20020a056a209f8700b001a06c85b48bmr4390933pzb.0.1709248832480; 
 Thu, 29 Feb 2024 15:20:32 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 p8-20020a63e648000000b005d68962e1a7sm1874596pgj.24.2024.02.29.15.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 15:20:32 -0800 (PST)
Message-ID: <6a04120d-a26c-4473-8196-bf9a9b814d15@linaro.org>
Date: Thu, 29 Feb 2024 13:20:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 20/22] hw/intc/arm_gicv3: Report the VNMI interrupt
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-21-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240229131039.1868904-21-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: IvD4jI7E35gf

On 2/29/24 03:10, Jinjie Ruan via wrote:
> In vCPU Interface, if the vIRQ has the superpriority property, report
> vNMI to the corresponding vPE.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
>   hw/intc/arm_gicv3_cpuif.c | 14 ++++++++++++--
>   hw/intc/gicv3_internal.h  |  1 +
>   2 files changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
