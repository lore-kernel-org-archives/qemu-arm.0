Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp269441ejc;
        Thu, 31 Aug 2023 16:45:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHULpnn5kGCdMdVQVsp2zjZ7DD1mXgHPNoMGmcidqZBGv2S+9Fc9khUpCvbIYRO6BH/ds4F
X-Received: by 2002:a0c:e503:0:b0:651:6968:ab16 with SMTP id l3-20020a0ce503000000b006516968ab16mr774757qvm.28.1693525521601;
        Thu, 31 Aug 2023 16:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693525521; cv=none;
        d=google.com; s=arc-20160816;
        b=n6G3idijs2jQ+S5xXT0jog7b9dED7X9V1TcgoAzDTAc4atZmC639BPwC8MdSaoKAsH
         urmmn6TY+jcnf7ataHHmHY+AewlsAJmUzQ/hg0f9XcHes4B9jNj33QUpczXCxOy+TUwj
         91jkqBqZBE70RoCqSuvHKSlLpW358HIXIK8Qu9y9N64PZNYvyyjDATHLtCbdLYOEeWRq
         RS6Tk57ufz42sggt1un47O+RBvLmWCHejYUVsQTsCXnTmAZZ9JtYsWLMGIBKGdqkKO+2
         z//BiwzefwumDeNsEFycMf4sIYwAKYSSL27eFx0iyL25sw/0wGKMM0Gx/LqhrfsSU3SN
         DeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=klvaGUlBjSlNH3x/kRMXh5i6DPnOTWzv9y1DZkMLF5A=;
        fh=3DSafzGqh4PjVCLNt7uHMRJlad1iPnH4/WPCiw/w/9I=;
        b=SVo+frehXavsYcqDproNNxaLSeqPuGRrB9xN+z1xUODzFNv4UToH2zqa65AeEQ50oP
         TchlhXQShjzcx+Xy/2BIuPwMVuoI2USMl5U0g6n4i+Pl6WOJPgCZrt/Sz9QUlr+Q6aLu
         QYdtlNfeGcDoeL13zDXwjBgsV/pEl+mraJEQThfpKTXeAnXcIG2mQQBHxbOEpoupg+jK
         xXKvtlYfcs5w/1Pa890sLeZ/zi9cBi67W7aBlnEv8ND7kVw2TbEQpdgokVEd5WHcWJZx
         bc6mk89HXaC4bP9unHuV0F4bMENn+4VI6DydVqEVwOklNPCyPGDVCSdBXqrk7izoOop1
         y65g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WfZ1m2Bd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020a0cdc12000000b0063d38afa0c0si1558943qvk.91.2023.08.31.16.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 16:45:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WfZ1m2Bd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbrLN-0008Sa-KB; Thu, 31 Aug 2023 19:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbrLM-0008Rs-J8
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:44:56 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbrLK-0006pu-Bp
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:44:56 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-56b2e689828so1092889a12.1
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 16:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693525492; x=1694130292; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=klvaGUlBjSlNH3x/kRMXh5i6DPnOTWzv9y1DZkMLF5A=;
 b=WfZ1m2BdatpykPBdIiGQY3Lenm+kB65nSzKwSvCf8YnZz6bNv6pPf1nOREW3Cd0bE2
 /hWs2nv+1SfX6PB70eoTLctykWKVWGiIXyfucGS5nJbnc0RNvzAZVP6nOoEkr1vsASL4
 I6Uowd3X1TkZxtQeZTo3vO9FcW10HxBR6iRpMFwp87AcSF1mhlCYV7gEW0G3GSRuB7yW
 EbYrc1FqQ+fzGPYTJvTKUnLZ/Np0WPFSNtl3r3EMi/2eOeF92cAmrP6cv7APuv8HgNS5
 0wv8QC8v/Km+k7pY2iH5zseFv95cHYO8EKy5/w5LGNFuJ0FYrBt1YxpdH8wr9kHjuzQ5
 6Nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693525492; x=1694130292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=klvaGUlBjSlNH3x/kRMXh5i6DPnOTWzv9y1DZkMLF5A=;
 b=aLC3TvcKN9uMBjGM00sBabgTsHXPomUjvw9EshsQ4H4NOiaRlXTx5KVWgZRro2cgd7
 uKibJx1wNx9WE7VCYlu4bW2YJIsRa5ewIa0AGI2zbVC9+rIxb/cZKZV1MPICsLYWSLhU
 IV6KkZDGDPyhh8vvJNAbyoHDpWqqUmLelequXEipR8Rmh1ck1UTEQtZjJVP3fCdB/Xoh
 Nc1d9IoMITTYlLw15weuIZ6YVZTlP5X7hvM0PYS5Z4wYH4qHNyqFvwaLOZhmXDpe2Kin
 p4P7uXczfy4ZbbnLvRjINv2OSny+EKdAwydSX1rVRtkGm+cyUPVfU/F/5d4N+0CzLKe9
 QotA==
X-Gm-Message-State: AOJu0YxZ8SYW8Qstw9mqnvrqm8NYm0EXqt3allXH7axq/9Y362HQEWdY
 bkSGzNqB1ia8I4wkUjDzMGTSqQ==
X-Received: by 2002:a05:6a20:2cf:b0:14d:382c:f354 with SMTP id
 15-20020a056a2002cf00b0014d382cf354mr1098468pzb.36.1693525492568; 
 Thu, 31 Aug 2023 16:44:52 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a63ab4d000000b005642a68a508sm1804470pgp.35.2023.08.31.16.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 16:44:52 -0700 (PDT)
Message-ID: <622751d4-8a89-b34e-171f-9e9f7ac99972@linaro.org>
Date: Thu, 31 Aug 2023 16:44:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] hw/misc: Introduce AMD/Xilix Versal TRNG device
Content-Language: en-US
To: Tong Ho <tong.ho@amd.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, edgar.iglesias@gmail.com,
 peter.maydell@linaro.org
References: <20230831171849.3297497-1-tong.ho@amd.com>
 <20230831171849.3297497-2-tong.ho@amd.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230831171849.3297497-2-tong.ho@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.478,
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
X-TUID: HWlBQkZ4QIol

On 8/31/23 10:18, Tong Ho wrote:
> This adds a non-cryptographic grade implementation of the
> model for the True Random Number Generator (TRNG) component
> in AMD/Xilinx Versal device family.
> 
> This model is only intended for non-real world testing of
> guest software, where cryptographically strong TRNG is not
> needed.
> 
> This model supports versions 1 & 2 of the Versal TRNG, with
> default to be version 2; the 'hw-version' uint32 property
> can be set to 0x0100 to override the default.
> 
> Other implemented properties:
> - 'forced-prng', uint64
>    When set to non-zero, "true random reseed" is replaced by
>    deterministic reseed based on the given value and other
>    deterministic parameters, even when guest software has
>    configured the TRNG as "true random reseed".  This option
>    allows guest software to reproduce data-dependent defects.
> 
> - 'fips-fault-events', uint32, bit-mask
>    bit 3: Triggers the SP800-90B entropy health test fault irq
>    bit 1: Triggers the FIPS 140-2 continuous test fault irq
> 
> Signed-off-by: Tong Ho<tong.ho@amd.com>
> ---
>   hw/misc/Kconfig                    |   3 +
>   hw/misc/meson.build                |   3 +
>   hw/misc/xlnx-versal-trng.c         | 725 +++++++++++++++++++++++++++++
>   include/hw/misc/xlnx-versal-trng.h |  58 +++
>   4 files changed, 789 insertions(+)
>   create mode 100644 hw/misc/xlnx-versal-trng.c
>   create mode 100644 include/hw/misc/xlnx-versal-trng.h

I don't think you should be inventing another PRNG, or related properties.

We already have qemu/guest-random.h, and the -seed command-line parameter to force the use 
of a deterministic PRNG with a given seed value.


r~
