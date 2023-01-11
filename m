Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4418498ejc;
        Wed, 11 Jan 2023 16:42:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvzRJQDx97v9kPeMw8Ud0pXXxpi7tk0uHQDhrv/zyLmRomAV2CGdZwTbe+zXVt9kX+rFUlc
X-Received: by 2002:ac8:1388:0:b0:39c:da20:602 with SMTP id h8-20020ac81388000000b0039cda200602mr11807030qtj.12.1673484144586;
        Wed, 11 Jan 2023 16:42:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673484144; cv=none;
        d=google.com; s=arc-20160816;
        b=TlmIftBsvQ72252xwJPKvRVXfWfLCX7VdDdtwIfdZenuiQWonlQlpZn45VHwWUL+iP
         wu6xy27vDRjiYJzZ97Bp3Ie0Cs1d3foW7uEGNasgOmt3oN9WMX2w0IlOeE+GxMxRPnvJ
         RzGkI6RSI63HLK36tECbFBIpvU4Xk7HAyYUi4QQxMGG3rwTZ/WVC25AvTFZMe5bfI2a1
         Yvp/8y2EoDBOI0OBVDrw1PRqbbmOpXbpEUx/7Kml6zpboC11lUen76J5lcdJrs5cdcqW
         vOPWtGCW7T1OxhlKVlushig9V/cNn1iigc4uugoNXtDN1gnfedWCpYKwiEXJW9h/ZndV
         YRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2DAt0LkBD+q2larCGML+0JPiL8WBvDDxkUPPiQG6zlM=;
        b=l4KTBv2M7d7u+gh8efCOnAzUQUIUs13hR8v1VOXD9v9O/7GIlPsye2p6GeRDsmCfhU
         7ycgfoo5KPB3S3RS28l0ejedMVUF/nPfg0pSqEnMDY/vkZsU27fefXg/+KcYFNxFHIuA
         SVrRsQUT2Q3bfZbWJ2YshVR75M34w5wZ9tm3B2cZYo4WiAMRXYnACfpMk3bK2KIjaVAA
         pb3Luaw+79ZDOYTecciYF8vAo8HTsJPp2n3g1SWkL3KTJ/Yc/wKb2FvohJpmrn3/5wnf
         +DyOp7dKd+BfzSsleHLr33mOm6dJjXBmHgAzPp5BMyYN+ZuNDknFYEDFU62v7IkVX2lx
         joHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rTtv54VD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id v25-20020ac87499000000b003a7e45b3b85si9122890qtq.351.2023.01.11.16.42.24
        for <alex.bennee@linaro.org>;
        Wed, 11 Jan 2023 16:42:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rTtv54VD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFlaQ-0007Yp-UG; Wed, 11 Jan 2023 19:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaP-0007Xn-1R
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 19:36:53 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaN-0001jK-Dj
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 19:36:52 -0500
Received: by mail-pl1-x634.google.com with SMTP id d3so18549690plr.10
 for <qemu-arm@nongnu.org>; Wed, 11 Jan 2023 16:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2DAt0LkBD+q2larCGML+0JPiL8WBvDDxkUPPiQG6zlM=;
 b=rTtv54VDDKuwD3HUVhwNCbU0KR20Ka+beAgVhzjaEQqyYA7xkptlnEstwDzODojk6U
 kB0cBZz8W4rgV8YYwat53cJWAAOIHuaFPUXMz6DJPwvy/3irwOOi/x5CvGlz/wEI7xG0
 onJRwhnyFSGrevYhvXEgshumklB5mrXZToNNZPrjLX346GXZGp9oVgX4oqDlFlDeBBFw
 RuoACqCKrzNLLmitFrfblr9AqdN9NFO+rKA39L9/vRohPSv0H4OAU0j7ASFhVkcFMZor
 Q2M6DREdk/VnZSphpr92GbpY9A0i+neVK9FiIxZVMYhr1wF9WCFSulh/6ErvwqUnc3vO
 Sqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2DAt0LkBD+q2larCGML+0JPiL8WBvDDxkUPPiQG6zlM=;
 b=vs65K7OrqXSOOWDoO8OpZBK41bAdLDPrjzrxQNZeQfOgpmlIY5mc7GDmGtOCysbBBF
 WSKEapSID64d4WK0l3xKxg7+TfBIkuDOuek8ci99R4AF7I0JSW7wx0w80br4HMjKRU4R
 F5woiQ2EYKmNV050enyLsNAP05dChGL0oN7L7rZhu5MHGIStzIXUih2FzfjESMCGN5u0
 eP0+o2Y9qY+wU5VAmaNE269HkDlnjRp6azBWQYDsUH0TNVSsR9iYWV37dlsTqASy4BL+
 Is9driCdoIB8h5m5es3FBTwYbyYm/QNOiN8Tp2m9CcK4bZlrSMuO8/pX82P/kHwL5LW4
 Jo0A==
X-Gm-Message-State: AFqh2koZLMGLre9TUxOX1pshCl4v3Hnn7UJmEB/CWBEMahDxSuq5iB65
 IQCq9/daUnKofdTtz58Hk7ZtrQ==
X-Received: by 2002:a17:90a:9111:b0:212:f14b:9c3f with SMTP id
 k17-20020a17090a911100b00212f14b9c3fmr4561400pjo.25.1673483810183; 
 Wed, 11 Jan 2023 16:36:50 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 ml21-20020a17090b361500b002135de3013fsm9581017pjb.32.2023.01.11.16.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:49 -0800 (PST)
Message-ID: <0a5fa04b-5576-3350-a0c6-bfeab2e11cca@linaro.org>
Date: Wed, 11 Jan 2023 09:48:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/4] hw: Remove hardcoded tabs (code style)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
References: <20230111083909.42624-1-philmd@linaro.org>
 <20230111083909.42624-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230111083909.42624-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: ov9oC0aVXAmu

On 1/11/23 00:39, Philippe Mathieu-Daudé wrote:
> We are going to modify this code, fix its style first to avoid
> the following checkpatch.pl violations:
> 
>    ERROR: code indent should never use tabs
>    ERROR: space prohibited between function name and open parenthesis '('
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/dma/etraxfs_dma.c | 196 +++++++++++++++++++++----------------------
>   hw/misc/mst_fpga.c   | 162 ++++++++++++++++++-----------------
>   2 files changed, 175 insertions(+), 183 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
