Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp149787eja;
        Thu, 22 Feb 2024 02:22:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX24znLTdpJfRo73ZPRS7ikvwCaC+8DEbyzT6UVjkylW051OrQQmEdCZAuJazMHnZtKIR0rLuy6dVFbAzlWRGjKzh6q1HrQ
X-Google-Smtp-Source: AGHT+IE4JYBoFi/Ixw8cgG4ZcUTjK4E7fFzZtlBfIi51D1CkdO93Ybnv3eBGjAZ5mv2AWisWsrs5
X-Received: by 2002:a05:6808:170b:b0:3c0:35ef:9155 with SMTP id bc11-20020a056808170b00b003c035ef9155mr23692261oib.33.1708597378520;
        Thu, 22 Feb 2024 02:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708597378; cv=none;
        d=google.com; s=arc-20160816;
        b=vOA5ADs4yXNiQ044Wevg0GXIOqTn9UMbWerncR9xvTvEUfYDBDEEceolpKsX5f945w
         CxiJAOpgewUKUhFJx+xTsAXZrUmdzkruxYob91542gy9m/15KIL8NGyuix5meoF5FZn3
         hoxM3I4X9zaj/+F1KfF5uxW2Hs8OkaplcDP//PLS4riEEVQhdVLCaj6Yyv6rlig7W4sC
         1zSqoS9LdSy7f3UW56TPKLpTYKN7JzKI9vYQqZJMJwyo5ANcDF+0T0gnFCQU94ISHfcR
         Pm5dvlkAeWx1acJT9ISFKVefYAJAHiVotZ2hGShtsjC35LwgrJQkL6RY3TduYlGU66NE
         qAVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GIJgw6JawTFcB6/RW+pFCZ02B/g75qD9enf63xzlI68=;
        fh=Vntit4n9d5mwZFuNUXDWpFxkiLMMBK5oEX1HMMxcAxU=;
        b=z9tu8KXSliKQUZfZ975CuGPg/KcbaiWISEeSu4cIkbhTrNE2pqUx2jpol8Gc4i5dKZ
         d5pMdOXkALHHnd3iU0crQGdenMDDMXEYJY5fJAyUB5UdRc5NrvPNE4dEOxeSmMh8NSrV
         /5A0a3alcyBDnZb6MhzyUha7nzU8xx1g496Ac24bXBJfcSPt09tjiY4377OA513NAWE4
         ot9eELpba3sGCwJbpHkpleDZzF7Ifs4wIcVAubYyNGsC0Ouc7+aazLzpyj/RJUhpexoY
         o/3+LGyaH6+ZyEMk8xDkbJqk73ZqcPUdJ3rEsFddplfIw9N5ddKGNVGGuEnncsbJTEGX
         K+Uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qf5k6CW5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv2-20020a056214262200b0068f714d3e99si8370679qvb.26.2024.02.22.02.22.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 02:22:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qf5k6CW5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd6EA-0007JM-TE; Thu, 22 Feb 2024 05:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd6E8-0007GV-VD
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 05:22:53 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd6E3-0003SV-Sk
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 05:22:52 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4125df3c40aso42702385e9.3
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 02:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708597366; x=1709202166; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GIJgw6JawTFcB6/RW+pFCZ02B/g75qD9enf63xzlI68=;
 b=Qf5k6CW5MclCmRTMJHEN/GydOD7/TBi/OZu8HhjkKsns3/quqjHaO4h6Cj4Ia8cAbD
 +2L39gdahYWoiiY1hZBDFx2EKyXJdrw4CPltdgFnKoIYtaxfvu/z14E2SmQsKhVWvvdF
 +YyUS7ehYuN5DxDjzXCDT8DN+fWhBMzEeBLNM/4irw7Cuza02DGqfDZfCMvG9NX7ljHh
 HD1XGeGJMAbKu9cyILK80Q9oSNM/Er8+gtT04P0tw+RKrX8gTcAkx2rF0PeCZzJg4gRm
 ds5z+x2NhwnyKatALI3oFQ3y0saSvy+T/0TK8YSrkOF1ha+RtfHCsUtnqcrPWZ4wdoul
 pUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708597366; x=1709202166;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GIJgw6JawTFcB6/RW+pFCZ02B/g75qD9enf63xzlI68=;
 b=GNuZNMO9PJQc5SlAQ3a3mv3j7wPGvpIkdIjgey+dL763NkroVDDMQ7ZlXYiHxTmsgv
 8Gy7AqThRfzh7nfeKVESVBYm8u95WmiL+K5rZIdxBvVoHhDA0pOYmJmNPoz0NGRYK8VM
 ADGAbKugh1+TIKUfKLYbUR/E+60CXfEgy/PU5f/fAd/c3QhykZOkkh3iw60UViEvWf1N
 tBxuRUfiSKvSD2c5tSjZJ80W2f2UCqm7b2PAFBScVS9UyrYjbxIA+dgOqGRu7IpabtUR
 ZNfbpfl2wrEL+Y4/LSHNL4sTToIJjH+SbOiCPiEiWuVAEaBWcV8VwZYWyQ6cV2LKJeR2
 kPWA==
X-Gm-Message-State: AOJu0YxyFrzZu703egstWVFS57OAx11DuOKnlvv0z5qC8ZXdqVzbcDNz
 uYizo6FSHrbbLyGOHiWTnoubeSg7UvJ3na/EBU5ozDKYiTzCy7cLHwG0LHIfqWo=
X-Received: by 2002:adf:edcd:0:b0:33d:2746:2f50 with SMTP id
 v13-20020adfedcd000000b0033d27462f50mr9757619wro.33.1708597366120; 
 Thu, 22 Feb 2024 02:22:46 -0800 (PST)
Received: from [192.168.247.175] (41.red-95-127-32.staticip.rima-tde.net.
 [95.127.32.41]) by smtp.gmail.com with ESMTPSA id
 f2-20020adfe902000000b0033cf24700e5sm19730037wrm.39.2024.02.22.02.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 02:22:45 -0800 (PST)
Message-ID: <74b605bb-c52f-43e5-af82-d6a38c5bd2cd@linaro.org>
Date: Thu, 22 Feb 2024 11:22:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/25] Misc HW patches for 2024-02-21
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org
References: <20240221211626.48190-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240221211626.48190-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 8rZeLc2CUTZ7

Hi,

On 21/2/24 22:16, Philippe Mathieu-Daudé wrote:
> The following changes since commit 760b4dcdddba4a40b9fa0eb78fdfc7eda7cb83d0:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2024-02-20 10:11:08 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/hw-misc-20240221
> 
> for you to fetch changes up to df07f6bb563f25f39f4f5887adab557e42bdee59:
> 
>    hw/sparc/leon3: Fix wrong usage of DO_UPCAST macro (2024-02-21 22:13:03 +0100)
> 
> Following checkpatch.pl error ignored:
> 
>    ERROR: Macros with complex values should be enclosed in parenthesis
>    #62: FILE: include/hw/ide/ide-dev.h:31:
>    +#define DEFINE_IDE_DEV_PROPERTIES()                     \
>    +    DEFINE_BLOCK_PROPERTIES(IDEDrive, dev.conf),        \
>    +    DEFINE_BLOCK_ERROR_PROPERTIES(IDEDrive, dev.conf),  \
>    +    DEFINE_PROP_STRING("ver",  IDEDrive, dev.version),  \
>    +    DEFINE_PROP_UINT64("wwn",  IDEDrive, dev.wwn, 0),   \
>    +    DEFINE_PROP_STRING("serial",  IDEDrive, dev.serial),\
>    +    DEFINE_PROP_STRING("model", IDEDrive, dev.model)
> 
> ----------------------------------------------------------------
> Misc HW patch queue
> 
> - Remove sysbus_add_io (Phil)
> - Build PPC 4xx PCI host bridges once (Phil)
> - Display QOM path while debugging SMBus targets (Joe)
> - Simplify x86 PC code (Bernhard)
> - Remove qemu_[un]register_reset() calls in x86 PC CMOS (Peter)
> - Fix wiring of ICH9 LPC interrupts (Bernhard)
> - Split core IDE as device / bus / dma (Thomas)
> - Fix invalid use of DO_UPCAST() in Leon3 (Thomas)
> 
> ----------------------------------------------------------------

I did the mistake to rebase on master after testing,
and not test again, and missed a new header must be
added in "hw/i386/kvmvapic.c". I apologize for that
and will respin a v2 once fully tested again.

Regards,

Phil.
