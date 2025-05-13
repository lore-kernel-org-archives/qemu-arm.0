Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp839520njb;
        Tue, 13 May 2025 15:58:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEihOqpXZurJGHUGasBv/nkhVRirVnGzUlCJrwo9CyJ8iIubkysRuManIn6an+lfXSNbJVjtgYUBusHA==@linaro.org
X-Google-Smtp-Source: AGHT+IFHo0u/AxbwnX7nneIT5sVDgiaESv6FWhEW1IZI65mjR5pvlmRP/7kzIxWE/D0zHKsMp6Gw
X-Received: by 2002:a05:620a:6181:b0:7c5:93bd:fbf2 with SMTP id af79cd13be357-7cd1debe84cmr758919885a.19.1747177123109;
        Tue, 13 May 2025 15:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747177123; cv=none;
        d=google.com; s=arc-20240605;
        b=XiDab0Pg4wI+t4v+7typNiPZKtkhWB6tA5BObulN5/+6arEiKsvFG/LatMflqVjgwi
         GoobZxIslYRwIuBTZG6vH99HBnc4VQREUnTTfcA6KctP3UGxqKVGYI3WeTRznGDrzpQi
         9piFxll0snEnaHbEXs+mX11EK+UoqMgb/d1Gxo/j2DJubcTKYBegrw7YK7JrpDQzReT9
         srHdQ4XUUvIUcLi+lRui+7SCIBRrgNMmFbvJDx9txDrLjk9TQetLZIXUamiS0LfAlMAX
         E9DLu7CdMm65xoCVGRBsDvjKB33+GmYnm28K/A4NC7rTTrQExhdBQxaNoDjN5+1JHpxa
         IqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=M5rf1bjtht6iyReBakuEvnzGJtZo85rGyibPhgpM2fA=;
        fh=jMddzilkz38Kp7+F2BFvGUIns9zbYDae6JuSpBoxEjk=;
        b=iz8DmzaH/XrV1ObebqWrjBbO5azmUr6N+D5/cHMxk502WoTfgt5JLE0kuV5FP/d8RN
         jCz8YAfn48GzWHW22NC3WfTYJVPQukcRP+VJNxKHIEC0VhQ2ipHx39mUsOENWQ1i9/uj
         WSc0rAMTfafFg9xX2KALE1l8uNwnmLSFCvveBh4qgxBps69q1+CNDZp2he0jC+ApJB5v
         J9Rx1iIAfxAv6epwgYutPnAtw5dC09f5wVLtdV8C9/7Bl1wnCrbDkhRyJd6tokE+hVkj
         Kawf/xU+p7uQIPCxP2RqgTvVcOvoAuYlgo1fAyW4OTTzDmE1YXX/i4Otby4ayaWc3YDG
         VIWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KmSTRAyy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fd4840si1180008685a.267.2025.05.13.15.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 15:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KmSTRAyy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEya3-0006sI-Rn; Tue, 13 May 2025 18:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uEyZR-0006qd-5k
 for qemu-arm@nongnu.org; Tue, 13 May 2025 18:57:58 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uEyZO-0003p7-3C
 for qemu-arm@nongnu.org; Tue, 13 May 2025 18:57:56 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso312735b3a.0
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 15:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747177069; x=1747781869; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M5rf1bjtht6iyReBakuEvnzGJtZo85rGyibPhgpM2fA=;
 b=KmSTRAyyxDepSllxeclrcuTsfRilvv2ppqYkTo/TejvvhtKD9qfmd1yhcrhfOSgzou
 qS8v4HBtSX5X8cjxxu1QxfuAjUlwhVfor7h6W3kw10B6dU1y+nknPuNweZiyZcYF0iw+
 Ur0k8wrkYtAJRCDJUSKC96cH5BtW8zcgSyUezCURteIxX0N4G/xw4y+xdoVrw8Ztc3Gm
 dOcgg9NYCl7lIj95QWAVXairJ3I0olWLPH3t46YcbeAYOKw7xzimDBE9tqy+6S67nROg
 uAKkknwlmt6DxBazTSQyTOJT1QWnsPJU6/6pqb/5wnLawh4N6q7eoVwg8PBxDwYqaVWR
 qQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747177069; x=1747781869;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M5rf1bjtht6iyReBakuEvnzGJtZo85rGyibPhgpM2fA=;
 b=SonL5KkYsHpMnAidpEl2+zHFs258tXKWSZwdRi9kfeossaFnp8x2ZUL0AAb0YTeNtn
 v0rzJxtenhYI6CL0Xdc+63em3fVO0538L3CcnKvw5TvipLR1BoozSZnyI4aBhkHTcKlY
 sxJwHjc7mn9zcSUNVqnybr8ABHR4XxPWfiTLlX+kW6/mtKP4sQJczJPYPGA7VH/pgH5d
 s9DODhkI8ui+PWEkCp0C9E3/QngC7CDqYvZy0FBpoum/E+LyW3iqGPv1OLghZbEBf+03
 E9e3SKA2q/id21IOXN9iQPE38fJbnPtoNcBiHEmgmKhrA49OJLJiuksEwLo6+UP00+2D
 luiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnXN83bGEojHEWOH5N99fdgrNAD9Iw8ugwjsvf1GdMORyxtyMSrbx8reOYkUjt8G1yPZmsesYe7g==@nongnu.org
X-Gm-Message-State: AOJu0Yz1hky8oAe9bVHcEm8AWHdPiEjb0Mwhmihj33P2RlY+cdLNyIT0
 hTfkE5gV0d+ykCwQMP3cO+SWU76ZZEP4m4+6/OTQ1IKxkwDs8TOktIwGbaYPkyI=
X-Gm-Gg: ASbGncvNvgdwp40gMfbaKjHPtvFh9hli8+ypg53wA1sgosh5A2RDRYk6Sm4xLTf+fsv
 6UN7ebJS8MjxjMe8oi8NvjaV04Hvpj9G8AqeT5Q6SRBe2rHsggjj+Yvzr/mIT1enco3K8DSjyOo
 pQSh1HMP17Rfxn9Uw9770ZCjCTIkzESoUVkBJ0DA2qQTGjESve5rFES6At148uKGvfi1YHlcupc
 q9pxpN35+QOoI4fuYZx+3WhDH6TY3aXG8rhCS0XH306Ej3A3rPVpiN3KypwNBmMYXeOxaNvypCM
 lP353LqHEnNiNYn3iNFhISJkDFd9xE47OT295miTRTW6iEy6sBwGaKWWmCKOqZri
X-Received: by 2002:a05:6a00:6115:b0:736:b3cb:5db with SMTP id
 d2e1a72fcca58-742791a6a0cmr6088258b3a.11.1747177068922; 
 Tue, 13 May 2025 15:57:48 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74273ca9230sm2774162b3a.24.2025.05.13.15.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 15:57:48 -0700 (PDT)
Message-ID: <b83ec39b-cb77-4df6-8b02-7de46461eedc@linaro.org>
Date: Tue, 13 May 2025 15:57:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/19] target/arm: Always include full path to 'cpu.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
 <20250513173928.77376-20-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250513173928.77376-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: tDnF7o8uUjAT

On 5/13/25 10:39 AM, Philippe Mathieu-Daudé wrote:
> Some files include "cpu.h", others "target/arm/cpu.h".
> Unify by using the latter which is more explicit.
> 
> Suggested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpregs.h            | 2 +-
>   target/arm/cpu-features.h      | 2 +-
>   target/arm/tcg/translate.h     | 2 +-
>   target/arm/arch_dump.c         | 2 +-
>   target/arm/arm-powerctl.c      | 2 +-
>   target/arm/arm-qmp-cmds.c      | 2 +-
>   target/arm/cortex-regs.c       | 2 +-
>   target/arm/cpu.c               | 2 +-
>   target/arm/cpu64.c             | 2 +-
>   target/arm/debug_helper.c      | 2 +-
>   target/arm/gdbstub.c           | 2 +-
>   target/arm/gdbstub64.c         | 2 +-
>   target/arm/helper.c            | 2 +-
>   target/arm/hyp_gdbstub.c       | 2 +-
>   target/arm/kvm-stub.c          | 2 +-
>   target/arm/kvm.c               | 2 +-
>   target/arm/machine.c           | 2 +-
>   target/arm/ptw.c               | 2 +-
>   target/arm/tcg-stubs.c         | 2 +-
>   target/arm/tcg/cpu-v7m.c       | 2 +-
>   target/arm/tcg/cpu32.c         | 2 +-
>   target/arm/tcg/cpu64.c         | 2 +-
>   target/arm/tcg/helper-a64.c    | 2 +-
>   target/arm/tcg/hflags.c        | 2 +-
>   target/arm/tcg/iwmmxt_helper.c | 2 +-
>   target/arm/tcg/m_helper.c      | 2 +-
>   target/arm/tcg/mte_helper.c    | 2 +-
>   target/arm/tcg/mve_helper.c    | 2 +-
>   target/arm/tcg/neon_helper.c   | 2 +-
>   target/arm/tcg/op_helper.c     | 2 +-
>   target/arm/tcg/pauth_helper.c  | 2 +-
>   target/arm/tcg/psci.c          | 2 +-
>   target/arm/tcg/sme_helper.c    | 2 +-
>   target/arm/tcg/sve_helper.c    | 2 +-
>   target/arm/tcg/tlb-insns.c     | 2 +-
>   target/arm/tcg/tlb_helper.c    | 2 +-
>   target/arm/tcg/vec_helper.c    | 2 +-
>   target/arm/tcg/vfp_helper.c    | 2 +-
>   target/arm/vfp_fpscr.c         | 2 +-
>   39 files changed, 39 insertions(+), 39 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

