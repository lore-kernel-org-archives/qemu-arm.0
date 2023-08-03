Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1351678ejb;
        Thu, 3 Aug 2023 15:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuHglU5dnBYjn72dNdgzzMuWj77S2MaFDGjZ+ys8mDT3OnxoVVV2MPQic7kUo+N3ihWLoc
X-Received: by 2002:a0c:e9c2:0:b0:63c:b1a6:2a39 with SMTP id q2-20020a0ce9c2000000b0063cb1a62a39mr2320qvo.63.1691102682372;
        Thu, 03 Aug 2023 15:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691102682; cv=none;
        d=google.com; s=arc-20160816;
        b=zoYGojWDDJQsEyZOW74vHaPf5Ra8YVOZM3I1GPSTIDsh1TEJ6ZSBDR05jrifo1C2ER
         xR8cm6jJDrbnwsiRFtQNfQfvvkFqtQaNtLXK+t6lZum1RizRj/8Kot2WF5u+nWxR0PR9
         j78aXkMGxpoeSF7aTj76tlYnz8evvo//9ttF+hf2NMOUrAt2htFfCXqKKvb+VvjE0RRH
         581BFGsk7TT5e0CJrDMJsQe0roYnZmmRGGdGayst/Ol/dK1aigMasa4j4LyiN2fdhxtC
         m6+tnHZQdJEU1YVzLNGLWAKmT9IJp7xyjd5LD01mcxztKgfQJmzFq8QalZzNcU728rGb
         rVCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1HZTpZKB+njwBy9bHkA1xM0PwH+Ekju32ieMf9j6HL4=;
        fh=gIBHnCBZXuTljNEIFrUGH+fyCud0DAyM7pKL5WzRPGk=;
        b=L1W7iuymRfA9RT+s17dWUyJpoppeUwToP4qr288yN982q0wEVMixKcvy+VoB2jkjFs
         LtP0F7RzWaXIvvOYjIxRZtKx/0ZKUAUaPn82KM+ObwOnJYMp1ZIOOECq56bbdg9YAjfD
         r4JdPNA6s36jX9NeVwKEJAiVn9P4VR0xlV3t92hZjwU5iI96gHdIjW1Vkl0yCmUf6jq3
         WyQCq4bC3adFcpKcDeJfQrrEYVitgn1hPj18xVLBeMFqxVr9in3xuPMysI9RqoBOKtec
         pVTUVWV9NpSMldKJ0z5UPl/767JnZ2kgojINSb9+CrvdNz5phH0bfNKW1rcb+4VJupUp
         I73w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NG8OTfXO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a0cf30c000000b00631fd57b69fsi388959qvl.501.2023.08.03.15.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 15:44:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NG8OTfXO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRh3c-0005zh-QQ; Thu, 03 Aug 2023 18:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qRh3b-0005yf-77
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 18:44:35 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qRh3Z-000195-Ko
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 18:44:34 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68783004143so1092037b3a.2
 for <qemu-arm@nongnu.org>; Thu, 03 Aug 2023 15:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691102672; x=1691707472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1HZTpZKB+njwBy9bHkA1xM0PwH+Ekju32ieMf9j6HL4=;
 b=NG8OTfXO0j9zjcT1qTYwMoKRUUXTrpHkEkyqfiTW3cL/GSYYWTmXHs15u9RXQ2xJXE
 wsPQb96vINkuDC3dI70tCXFvS6LuWU/JPcBLbUQTFxnToxTtDK61CeOgtLPkdhesxBDa
 ua1uagUtJRInkr+adMQpssIiE5H/UarlH7+w8itIztKp10kMg8AORHxSo/2otZXJVUo4
 4aKQN0R61nhN/KIKwKMLT8pXsOSX64azlMISgKWM6YTVkZAhbaoOxYiJUWIEc0DMFD2o
 V42SBzWUEoF1jDXDOJGTX79siwVR/M1pGCXtuk0hjCgb5t3JeLw0VAxhCn3VSp+8XrMy
 9PFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691102672; x=1691707472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1HZTpZKB+njwBy9bHkA1xM0PwH+Ekju32ieMf9j6HL4=;
 b=Cxd60hYAVl8Od6Ori5HtxAID3Dt6Fukxs9mRm1mLBrVz4dF3YAZY3m8ddlaKz4jvhK
 7CR2Pjtz5xZxXNBVcPpA7d54xGT31L1KrX7rM6jAcDCL84zuncKBJE8cKS9aZFQDhbPS
 EZRWwdq7mwh/Q8WMPNbvyxrnag8qGoR7+lW1uIif7LKxX19357h0tpH+43HKpfl0p96F
 h/itnbzZZYVIF9T050nzex3QqMumQlYvLCfd0aL5fq+6gkZA6nZLJuhGIXctXL3fsOQc
 ti2ZvYdrEJLj2nlyMRmkenZ92NsLEZOPRBEM+ETaLDW3V7zm82Ssl2uGdqqGhg2+uUiH
 s7PQ==
X-Gm-Message-State: ABy/qLZ/2P8n6dZe4kMbPpKFV0s3xeG33jw+z82i0ZtjMh8c6ZdAb8RY
 CGjOVm4pYd8z01J9JWpplpplqA==
X-Received: by 2002:a05:6a21:4886:b0:13d:5b70:17da with SMTP id
 av6-20020a056a21488600b0013d5b7017damr15264223pzc.26.1691102671586; 
 Thu, 03 Aug 2023 15:44:31 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.144.105])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a62e118000000b00679a4b56e41sm333383pfh.43.2023.08.03.15.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 15:44:31 -0700 (PDT)
Message-ID: <c39a9d14-4dfa-4c54-09c7-094ace1056b6@linaro.org>
Date: Thu, 3 Aug 2023 15:44:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/3] linux-user: Emulate /proc/cpuinfo for Alpha
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Cree <mcree@orcon.net.nz>
References: <20230803214450.647040-1-deller@gmx.de>
 <20230803214450.647040-4-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230803214450.647040-4-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: p1pkKqLggztJ

On 8/3/23 14:44, Helge Deller wrote:
> Add emulation for /proc/cpuinfo for the alpha architecture.
> 
> alpha output example:
> 
> (alpha-chroot)root@p100:/# cat /proc/cpuinfo
> cpu                     : Alpha
> cpu model               : ev67
> cpu variation           : 7
> cpu revision            : 0
> cpu serial number       : JA00000000
> system type             : QEMU
> system variation        : QEMU_v8.0.92
> system revision         : 0
> system serial number    : AY00000000
> cycle frequency [Hz]    : 250000000
> timer frequency [Hz]    : 250.00
> page size [bytes]       : 8192
> phys. address bits      : 44
> max. addr. space #      : 255
> BogoMIPS                : 2500.00
> platform string         : AlphaServer QEMU user-mode VM
> cpus detected           : 8
> cpus active             : 4
> cpu active mask         : 0000000000000095
> L1 Icache               : n/a
> L1 Dcache               : n/a
> L2 cache                : n/a
> L3 cache                : n/a
> 
> Signed-off-by: Helge Deller<deller@gmx.de>
> Cc: Michael Cree<mcree@orcon.net.nz>
> 
> v3:
> - use PRIx64 instead of casting to long long
> v2:
> - revised platform string and system variation output
> - show cpus detected/active/active mask based on
>    current physical machine configuration
> ---
>   linux-user/syscall.c | 56 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 54 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
