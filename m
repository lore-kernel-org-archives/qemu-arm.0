Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp396510ejb;
        Mon, 17 Jun 2024 11:38:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWR+ru2774HLdzxF5UwCR04k70aMoecO34a4DiEaFSRLQst5r9YV+WPnnNsWu+0az1unK3rKSBdNib7zcgUH547BqBTd6YB
X-Google-Smtp-Source: AGHT+IHFxbL9hj2ncFy4JIHbPD6dGjNS47MYMFKl5VDnowXW+NnsZ6GpXRdLmtawOjBAT+amU+P8
X-Received: by 2002:a25:8250:0:b0:dff:31ba:e77 with SMTP id 3f1490d57ef6-dff31ba1134mr5968701276.59.1718649537391;
        Mon, 17 Jun 2024 11:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718649537; cv=none;
        d=google.com; s=arc-20160816;
        b=XzezFoXTqcRMF0VkluG8Tn0WMVwjoGAWLut6tqX5HD3x1ZzH5zlYNx6y/BcRZdQ+D4
         0X4uXEfZyGl6tdGVqF1SkrK2NdguMowo9adIpJZ7QJLdXu6lrCG/gOvIXZ+2TGV07k1L
         C7+tXpn28jBsGll5sSunUGwBJNRUHK0IBSA2i+Dzu2O7oll5sK8dCPa4EBdvqOAYnN6l
         oRMsrRQKH/D/NQDwFmu+XzvhqQhfLbvggZGnbd7GVV5ExFS/pXiN3lAV6vm9FOyNUsy+
         KK1+GKiEXGkFwruQoAQD+GD9PM0gzev8XFW8iPRFaSiGQ+MhDrizQjXCLitOcsCnGRAE
         lbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ZF2wT+bLesMcuyBU7zGwJGctxhs9psXI+trveO06lzs=;
        fh=8LdMVZfkCd9t3iLxrs9xMBYa1stTDDg8QpcUYPUP+cU=;
        b=JLDQiL+OOs/DmTRcAhKV4Dnl/3oQDsgzQji9xDRfcNBDT4aCufhu3nCGThMrwJEPQk
         jXZhdf/0XyHSc9sxiXgDeXHb6fe9GtdRnWU0L+m5F/v1UqAhMYvIbA8M/99oaB9i5yo+
         tSdU08suKOhWcjgjGn96j3tZnydoEwADwWzDea1LUHHQjg21B/sIJaZtpokLxNaPKCgm
         pnhPZHJdNo1vo2WNBsNpk6e71nMo17dxjl9BRsdOQjO7SpqYYvjbH42ErzZxtHu3NWrr
         7IZDwJXN/9OLSpGXYHH9N/z4vOr/uFGQflXCagczqiw2Kr4lh2yzfn8t4feC6g3Qer7K
         1g3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6w62ar4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2ae76a7cfsi92124446d6.395.2024.06.17.11.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2024 11:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6w62ar4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJHFI-000683-Fg; Mon, 17 Jun 2024 14:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sJHFH-00067S-92
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 14:38:23 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sJHFF-0001im-Hi
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 14:38:23 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-6eab07ae82bso3404428a12.3
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2024 11:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718649500; x=1719254300; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZF2wT+bLesMcuyBU7zGwJGctxhs9psXI+trveO06lzs=;
 b=e6w62ar4zB7xmrtMnN5J64ho5B5dKWTwyzS9MP1q8hwVm9E9B50a3k10suoI9tJxsQ
 iTCbf52+v+2i2rpQn+OJJUYOZbDQsMaPA6iCBquD0XHDQ+BBS7zVEB3owz8q5PJTAu6b
 N9k8mAYcaEhbG4JPff/hicky5AZGQCssWSyk7wijqJuMCdHaLULbW1/cFx7+9mr87/VF
 xLBqSLI8mGb+P3qxtGBjsJ9nSPp9JS391r10h2trPEDV7+f9D4WnTjgEy/NdZ80Al6s/
 Qy6krChXl5K6fDzQ17Kz9ErKL4AfIUQXRw/UHK9RLbVI2H8F/hlVh6Gpilsr4o4xu0lg
 +p0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718649500; x=1719254300;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZF2wT+bLesMcuyBU7zGwJGctxhs9psXI+trveO06lzs=;
 b=PyWezMWZWZRZed5HsfcDMBoJLfVu4cXuSae775tPMkBIBz79OLLNdcP+xXG3yznQfA
 9sU+kQ6ZYgPqGoL2WRywPD/YDkWSC3B6Sk5wXiN89k98f2xYfqT9FaUhf1iUfXoksW4n
 i1Tji6WhO5WHmyZzCijKQOOY7cF0k+GPB9BiJNhFxDgHUeR91paJEMAEpuxgOYWV+rrO
 64w3njvejo4JCDg5kjVMjjxnhXFU4sHrqDh+8Cb5quF+BYJqd8ph1b93mIID2htjYPBN
 RuRGy2hcQsIcYJRFXt4HcnVxgvlQ4LeRLZMFWL/YQOYFEXK5KGes8zOqFN1Ichei9wXO
 5A3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNB72Yo+IW5/Agq9Ndzc9AGwdoii/UPDaagz94ZTMtFT/EE/JYU8dUfkUKxLHJzd0+efMb2xiE4sCzAb93ax5bZgDN
X-Gm-Message-State: AOJu0YwgqeEiHWhNRg9zOSfG8n9GNzk5tX9T5OJxKxvXstVLAaZXF8dt
 4TlPoaPh/9rXbYamhpsUa9/TmF7hUBHthczY36dBDALNKjzQkuNGiKTwktnLvKg=
X-Received: by 2002:a17:90a:4b82:b0:2c4:dd4b:b5fd with SMTP id
 98e67ed59e1d1-2c4dd4bb718mr8716835a91.7.1718649499710; 
 Mon, 17 Jun 2024 11:38:19 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.132.216])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c4a769c8aesm11460058a91.39.2024.06.17.11.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 11:38:19 -0700 (PDT)
Message-ID: <92eb22b1-8511-4be2-a6d1-4812cf147f76@linaro.org>
Date: Mon, 17 Jun 2024 11:38:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL v2 00/19] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240617040228.1878487-1-clg@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240617040228.1878487-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: apERXro7aglh

On 6/16/24 21:02, Cédric Le Goater wrote:
> The following changes since commit 05ad1440b8428b0ade9b8e5c01469adb8fbf83e3:
> 
>    Merge tag 'virtio-grants-v8-tag' ofhttps://gitlab.com/sstabellini/qemu  into staging (2024-06-15 20:13:06 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/  tags/pull-aspeed-20240617
> 
> for you to fetch changes up to 5f44521242d2fdfa190206a6be40577a58a71ef9:
> 
>    MAINTAINERS: Add reviewers for ASPEED BMCs (2024-06-16 21:08:54 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Add AST2700 support
> 
> Changes in v2:
> 
>    - Fixed class_size in TYPE_ASPEED_INTC definition
>    - Fixed spelling : Unhandeled -> Unhandled

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/9.1 as appropriate.


r~

