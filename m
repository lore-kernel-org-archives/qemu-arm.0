Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4092663njc;
        Mon, 26 May 2025 03:08:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEkMJ38ZS3fFWRKluCEWZxUycX4qhiEb/q/KORUSFU7aD0oH9JPQZfNLk5H4Kr59Qo9Oik9u8qVN/cBw==@linaro.org
X-Google-Smtp-Source: AGHT+IG1+gpQiGAx+1bVr8iE74LyWR77a7kqMVqFOodeZYNzwQxGQBo2GtqUJK8aPWa6ZUgTiLcz
X-Received: by 2002:a05:6e02:3803:b0:3db:877a:dff4 with SMTP id e9e14a558f8ab-3dc9b734485mr65243225ab.14.1748254090383;
        Mon, 26 May 2025 03:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748254090; cv=none;
        d=google.com; s=arc-20240605;
        b=friof5BEwwBvY7ysOxAvd4EvoCpwQvswHIuSTT6DudSxQMWpIOqGOc1FgNPCjBXu8e
         Hk3qG4Lf7Bq5Lf0WvbYpOhuj1wNc+ey6KKq56WootrwW9+HQp+sPAtu7Vc0yOTn8yC5d
         iT9dsbNrEKBoFC+9PnCiK5tP5UMH8o3PalufjsMqHdbG8aGGdRB1lNmPCAxUNd1KrGMF
         w7xzL2Ke3hWJZGsWjbp7EWebzl7ZSG7rHJerFafRBeWQOeM/FteG6HMukW88ZjwEqjrl
         FPWyocpR2YWm0mcCQeuL2NFzbPb2nIrgLvRGQ4UjfK6eZ13k9bgY5iJAgmnS2Fr2SzGp
         cGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=UeWDwAIij9m4P5yCgviVByHQv/VRO+qlqUjNrp5s81Y=;
        fh=MjAtrb+Q2Pz1JsFLxeOH46mj6FJINmTPPEzCkwSfjz0=;
        b=hD2uglTVY/50rm1cM1yIfjDqyy+9g+QcI1xjN/mHwXyGLLqfo8VpNyHYT4kLc/+Frh
         Sotqd1RVpPWxnR2POpTBG4ZJ3N988C6SLiLUCIHPFJE6LyWGM0ckAOnhebHYYAMWwb44
         24cwDfPDxKE1XZyTck90/qveCAIZwPO57pL4wJ3M+Snt5dJ66w3qo1YWov27sMOwQMM2
         2tUskiV7l/jNMti5U0s8nLc1SHHDGXUPOjHLQdxFsWDfK3RVUj47k0ENiVUnghD9RolS
         7v88HZNobhkduitqxZS+GHBCgSEH4W34k9qGmxra8yUXezBcGc16Smg6F6GLOBvLFfvp
         Xhmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=keyOla8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4fbcc3b69d7si3411474173.37.2025.05.26.03.08.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 03:08:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=keyOla8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJUjv-000472-5H; Mon, 26 May 2025 06:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uJUjt-00046V-5g
 for qemu-arm@nongnu.org; Mon, 26 May 2025 06:07:25 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uJUjo-0000R7-Ti
 for qemu-arm@nongnu.org; Mon, 26 May 2025 06:07:24 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-440685d6afcso26189165e9.0
 for <qemu-arm@nongnu.org>; Mon, 26 May 2025 03:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748254039; x=1748858839; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UeWDwAIij9m4P5yCgviVByHQv/VRO+qlqUjNrp5s81Y=;
 b=keyOla8TBUjjebCptlITw65RiD4rf3p9KQU0N3hWSb6UeYigCd9U41aCA0qbUO5U5l
 hghq31V+Oo0GS0vZfE+bS95RNANPZ2/Sq2AzcxJ+aj9+nRU6g++qV2U/M3ibZIogXimv
 +Giu8zM3UMEFnDIwgJU3LX4lNHjOz+LtqYSzPztcX1vizjtMEu5Ur2P7GDMExPGVJ0i4
 alWupVWvhTiVDFlPllE5mSJ4YOO/KwxZW81CUxwq5eRlcz0EJthqAjN68SbuSGczMuFy
 TF1qMA/rkMDn6E5ENY2Zd2PPZ82O1dYV1X3NCrri1z3rHgHuCmR4KHJjanOyjRVy5rSW
 xvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748254039; x=1748858839;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UeWDwAIij9m4P5yCgviVByHQv/VRO+qlqUjNrp5s81Y=;
 b=R1O98cpGp3d2JGoBqp+L1lyuvfiSNZ0MLIHuD7KjtQlFLZo4PLBSul0jXc0u+HzYyw
 82HaJpFtCazIluMonYuYAHRnb6jOzjcYrQtwPMJwfKXCvnPwY1W2J26cFutNEaUoVkB3
 1akLT9rUSkaKf9HMEUFUeeNXuU9KiG9ZHPvnjGxBqJtWVvFNGlPNnsWU8cfsbRWSL47D
 SikSd72ud19rTjypt96ANmHg3NgWx5wIHfoXdSZz85GikKmHh7VZq47GtDA6U+QFi3lo
 f7zvA9FXRJT+Uq29ayy5926PY58Zlf4nnBPIFKD/spCB926zFb+R6aJdpCVRSUTSxL9a
 C2EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDL6y2KneEaO1OoReXaB5RXjDATYjvJ3nNSCmEOZ9Pvy/1qDM1jduJj2o0BL3of0NaTloeQSAVyg==@nongnu.org
X-Gm-Message-State: AOJu0YzGgQKCS54P2e4VDSpczGJ9BQAvVnPuvq7+kddsKr9JhOtzt8Xe
 eie/6quhs/uPHkst6yHd+NdAjBCqxZQ4brBOlHG0y+IV2SVxmhZ2YO3bBRHxQTAvF0M=
X-Gm-Gg: ASbGncuWnIXwvaSFt497waih17+XwJ+9DTd3iiAFAnm/teAifLrcSaE7/VS5mBXy96T
 94j3yKPKV4sDWlbE59QPTqYRoc4nFyOYsvrVuSPAcdaLGIJh56BwYeIwwqg20yRkG4C68qalamb
 OzlmEzsNJqHMn8AqzRo//DMik1/OTMmvS82I8xz8VOvacwIDchJg5mePvCpINvD9XTk4lqpBVcn
 25gWTU/6dvQAqx5TiKRW3f6Y53ZBmMq3SEdvMb0eIiocrGOLUzHfZsqTsK/cBlpqPLKz68PiaAx
 C4iDwf+vEK7ab/7O6rg2vRXRbSk5aY4avjLNIo8Hw1k0/NmTB01YXx3biUUymDbt7nZEdFBiAZf
 4LGY4QGRloY/OGX1MP1e8rvwh
X-Received: by 2002:a05:600c:4684:b0:43c:f87c:24ce with SMTP id
 5b1f17b1804b1-44c955dc476mr70458015e9.21.1748254038651; 
 Mon, 26 May 2025 03:07:18 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f18251adsm239618765e9.2.2025.05.26.03.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 03:07:17 -0700 (PDT)
Message-ID: <be8c1d4d-b68e-42b1-9466-3698ded1be10@linaro.org>
Date: Mon, 26 May 2025 12:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/4] acpi: Add machine option to disable SPCR table
To: Li Chen <me@linux.beauty>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>
References: <87msberqzi.wl-me@linux.beauty> <87ldqyrqqo.wl-me@linux.beauty>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87ldqyrqqo.wl-me@linux.beauty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: HehLmFBYX4g7

Hi Li,

On 15/5/25 14:41, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> The ACPI SPCR (Serial Port Console Redirection) table allows firmware
> to specify a preferred serial console device to the operating system.
> On ARM64 systems, Linux by default respects this table: even if the
> kernel command line does not include a hardware serial console (e.g.,
> "console=ttyAMA0"), the kernel still register the serial device
> referenced by SPCR as a printk console.
> 
> While this behavior is standard-compliant, it can lead to situations
> where guest console behavior is influenced by platform firmware rather
> than user-specified configuration. To make guest console behavior more
> predictable and under user control, this patch introduces a machine
> option to explicitly disable SPCR table exposure:
> 
>      -machine spcr=off
> 
> By default, the option is enabled (spcr=on), preserving existing
> behavior. When disabled, QEMU will omit the SPCR table from the guest's
> ACPI namespace, ensuring that only consoles explicitly declared in the
> kernel command line are registered.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> Reviewed-by: Bibo Mao <maobibo@loongson.cn>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---


> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 765dc8dd35..089104d54b 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -444,6 +444,7 @@ struct MachineState {
>       SmpCache smp_cache;
>       struct NVDIMMState *nvdimms_state;
>       struct NumaState *numa_state;
> +    bool enable_spcr;

This structure is used by all machines. Can we be more
descriptive, maybe naming as "acpi_spcr_enabled"?

Thanks,

Phil.

