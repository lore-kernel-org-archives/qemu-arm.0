Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp845197ejf;
        Fri, 23 Feb 2024 14:19:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXD5mKa9tjBCAk/RZ5fvuNc7P4udtAFPAMElyzmvG1JX55acdRekEM8ALYaKuF+lw/tLF5/05choxU6Ct2vHusDuhcZohHE
X-Google-Smtp-Source: AGHT+IEoHNLhORzj/AqcxlPXQv4BTuRbr8+DEgIemiPPLbCW7hITS33zbX50qmYn3N6fMGIqjACv
X-Received: by 2002:a05:6808:13c3:b0:3bf:df3d:207e with SMTP id d3-20020a05680813c300b003bfdf3d207emr1486033oiw.13.1708726791841;
        Fri, 23 Feb 2024 14:19:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708726791; cv=none;
        d=google.com; s=arc-20160816;
        b=ymm4b32lwjQaUqfPYJg4vGlCOJoTpDeQHPukhnp3ZJGqpr05IbYQ4U9NpQg3qdOuRS
         JK7YlXv5OPaI8pi/KD1ontyXeuVH3mvutU5UL8MtrUYpb7ZLsljFPuLcnl5KAHuZWigk
         mfplSUSZy3R3IEcbt7etYyPD5dvWamQrKKe4a3L5IeANuqGvL2tlZoLwOoifzOd7yHev
         EshNAPjSJ5xGyfyWKzEHzL0MjDE4tNQhKpgTfys35a7Dk8RDVqWJIC6FF1AWc4hULmf9
         sK81bxSK6iJZr84RadPyuvMrcgov6jkNLQFbWhNdc8pamNHBZQo5Q379fLyY4lCJM7VY
         JCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=mizjEVoqdEiINmGJ3Jk0y22fobxvwT16TlDZ6NB7Ioo=;
        fh=E748QhXUIwZ2aoRsUiVF3cP4Bkb6sSny70u31uK2LYk=;
        b=Y4eMRAecos4yFVSc1POYqSOkJLzk8tcwas1UoJdW6XJ04KGGZJynfTTSHxcosbvBLm
         3Co5QCg7gxAVzo1KjnqVu39Fbg4ZSmLYHCKeTPwgRfalfuqcr8zvmwPKTH0+Vs8G/faU
         4aDXSsE8SjPU2A8BkW/g69VB50wm/aKBiY25rMjSIv9AA7pBEw1KktSvrEerKQHL+thn
         lTNh9t75p8jav949g7o+tTkOa5Y9jOmPizjriZseMzW3NkG4EXAosTmA+gKAWaTfn7AN
         MXfLLsu49MVRCTHEHVj1/nvhU3q4xOUmCKQND8/Nma1BtDy8G00WsyvvaD4wDZ6bkZBz
         eNnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cYpTGlRL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf6-20020a056214250600b0068f6a21487fsi12754686qvb.15.2024.02.23.14.19.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 14:19:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cYpTGlRL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rddsP-0008Gc-4v; Fri, 23 Feb 2024 17:18:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rddRz-0004TV-Oh
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 16:51:24 -0500
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rddRy-0000ws-3L
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 16:51:23 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-59fdcf8ebbcso454911eaf.3
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 13:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708725079; x=1709329879; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mizjEVoqdEiINmGJ3Jk0y22fobxvwT16TlDZ6NB7Ioo=;
 b=cYpTGlRL+MgGt1wyvdx60JacxtdaeEBlF4D7E1SBzpwqcqBILe8Wxxn01vqywZNj8E
 h4r3UGQHs46Iotwgdf3fvqhCgEpBxL2rv9qL7Q2NkB2TT6ZuGMFgRlQgCQn1+hKD+iZQ
 ukUdj20gARx+TBqNiWgsYXjzSXwEGtlasNlHB4/kjH9cwkXnU8WPXxS8eBeT3ZlTcH4+
 ZMh1JBRc/LSAKkat+apKUeNpFqYmJl8kg5vG3qaZYvRhpoBYR1yZcnr+n+irkunuqXle
 uow87HF2Hq3ates9nju5VywE+K+e00jd+PR3WQ07S5tCUwcTfOiCdzwKv3Mu5B/uAucP
 rCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708725079; x=1709329879;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mizjEVoqdEiINmGJ3Jk0y22fobxvwT16TlDZ6NB7Ioo=;
 b=XBKfxotjlWfIWR27pafMtp+Y3fTwSkgynaDvJ9ZKgEEhU87bi+bTrISjzLbjLk3d7J
 mjCNxeK/MrvZ+OVlU4xVexGJzTYGuMnPBwnGChlvSAtcJQpb89eYvhtolvwnk641fkH5
 WUfbZLaevBNUnXOuPCTJ4jbjeH0rp6kzkxhpL0nuxiMu/asTzdtQSqHnnyceCMABDFmi
 sjK+WkHLy/e7qq2p1AoJJJvnD3HEg/suu0fJ2+OazDM4TkKUDHOwlRWxYUo4ZlZSwwAL
 o52+DFfOqchkt3PY+CbljKEDVRTuXeMxgy7FVYtFrBUORut2L4k3MT+3SxbtWHmLtAwg
 V/Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4876uTW2Eoy/chofEZ99w7DkjFYdwwkeaxzOX3iLoCYSo8VJOoGHipPdghreAjtqsRVBhKyE5XBAKuiLT2NyW5hzg
X-Gm-Message-State: AOJu0YxUFTbU30i+0+A3q73TMiN81X9L64s8bUZcprTVkcGaxFCgWyWf
 CLFnasssx4ptmX/qxgeZXvNyIpzJwctz/dZSwdo0hn1VMczb/jCrU1GrBj+uLut3qgcHvjdonI1
 B
X-Received: by 2002:a05:6358:80aa:b0:17b:5635:b78b with SMTP id
 a42-20020a05635880aa00b0017b5635b78bmr1478228rwk.14.1708725078825; 
 Fri, 23 Feb 2024 13:51:18 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 d188-20020a6336c5000000b005dc89957e06sm12691396pga.71.2024.02.23.13.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 13:51:18 -0800 (PST)
Message-ID: <c20dcf6e-11ba-41a4-b810-f7e9c1a8a3e4@linaro.org>
Date: Fri, 23 Feb 2024 11:51:16 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 00/21] target/arm: Implement FEAT_NMI and
 FEAT_GICv3_NMI
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
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
X-TUID: KEgJEjAx2Bqz

On 2/23/24 00:32, Jinjie Ruan via wrote:
> This patch set implements FEAT_NMI and FEAT_GICv3_NMI for armv8. These
> introduce support for a new category of interrupts in the architecture
> which we can use to provide NMI like functionality.
> 
> There are two modes for using this FEAT_NMI. When PSTATE.ALLINT or
> PSTATE.SP & SCTLR_ELx.SCTLR_SPINTMASK is set, any entry to ELx causes all
> interrupts including those with superpriority to be masked on entry to ELn
> until the mask is explicitly removed by software or hardware. PSTATE.ALLINT
> can be managed by software using the new register control ALLINT.ALLINT.
> Independent controls are provided for this feature at each EL, usage at EL1
> should not disrupt EL2 or EL3.
> 
> I have tested it with the following linux patches which try to support
> FEAT_NMI in linux kernel:
> 
> 	https://lore.kernel.org/linux-arm-kernel/Y4sH5qX5bK9xfEBp@lpieralisi/T/#mb4ba4a2c045bf72c10c2202c1dd1b82d3240dc88
> 
> In the test, SGI, PPI and SPI interrupts can all be set to have super priority
> to be converted to a hardware NMI interrupt. The SGI is tested with kernel
> IPI as NMI framework, and the PPI interrupt is tested with "perf top" command
> with hardware NMI enabled, and the PPI interrupt is tested with a custom
> test module, in which NMI interrupts can be received and transmitted normally.
> 
>           +-------------------------------------------------+
>           |               Distributor                       |
>           +-------------------------------------------------+
>               SPI |  NMI                         |  NMI
>                  \ /                            \ /
>              +--------+                     +-------+
>              | Redist |                     | Redist|
>              +--------+                     +-------+
>              SGI  | NMI                     PPI | NMI
>                  \ /                           \ /
>            +-------------+             +---------------+
>            |CPU Interface|   ...       | CPU Interface |
>            +-------------+             +---------------+
>                 | NMI                         | NMI
>                \ /                           \ /
>              +-----+                       +-----+
>              |  PE |                       |  PE |
>              +-----+                       +-----+
> 
> Changes in v3:
> - Remove the FIQ NMI.
> - Adjust the patches Sequence.
> - Reomve the patch "Set pstate.ALLINT in arm_cpu_reset_hold".
> - Check whether support FEAT_NMI and FEAT_GICv3 for FEAT_GICv3_NMI.
> - With CPU_INTERRUPT_NMI, both CPSR_I and ISR_IS must be set.
> - Not include NMI logic when FEAT_NMI or SCTLR_ELx.NMI not enabled.
> - Refator nmi mask in arm_excp_unmasked().
> - Add VNMI definitions, add HCRX_VINMI and HCRX_VFNMI support in HCRX_EL2.
> - Add Reviewed-by and Acked-by.
> - Update the commit message.
> 
> Changes in v2:
> - Break up the patches so that each one does only one thing.
> - Remove the command line option and just implement it in "max" cpu.

Still missing all handling of virtual NMI, both within the CPU and the GIC.
This is not an optional portion of the spec.


r~

