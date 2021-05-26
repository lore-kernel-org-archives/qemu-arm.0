Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5020475lfm;
        Tue, 25 May 2021 19:20:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5j/IuY3HaggQG/dhMOgDLT3vhrR6g/dWf90HLNqzuDeHY5yjQActhXmlybeuWFdSL5QII
X-Received: by 2002:a0c:eb4d:: with SMTP id c13mr41555601qvq.48.1621995635356;
        Tue, 25 May 2021 19:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621995635; cv=none;
        d=google.com; s=arc-20160816;
        b=zLOWYm1M0zZhFlKWyuzWjhh5qXE10MYIIK+LqA2f0/Tkq58ALaAyoUoSIpk4VqdNiq
         eTd0WMwgKTswLWYuJtNyNKFtNr6yUhtIl/HZ/ebadr+ILiRoxYhfn2vHO+FtNotBSMA3
         6vw8z/N05jPOq+DPmxVcRKnycuRGrZ24YgS5PjeGBslrlkqP7eWNTF6mYWoEMu8uLw4o
         4Ujim3x2LzYEYDTnf8ngLB/DwXfvYgKZDxdGBsL8RXsY3rz73uSVI/O9OdxiIXnlmTym
         p4FfnW/XQtC7V+t4GYr4xayzGTN11Z1VEBr7YVIpqqL2dCJMhWFsLo5leJzWnObxClsU
         4hPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DPlXrCfHp8pQDQO1jfJmnZott4CioEXbswAa/pX0+o4=;
        b=qdn4ba4qBEhqt9ry6TdgK23B/Z7ElVcJGCXs+/5cJjzSJhmdkSXBIKqp0Cddr2G8Sr
         px7E3eljNvQHz/b5C/gKqEBCdxy0+skxosBlsC9EvxBjjV0rd0WaLZxgwubQJNA/Exnb
         BHlGC8yZgjAxvEoHHbAveve/wJuF69G/WzedYhCnr+joBFyYAvJylJaPMK4Ekoo0B7yc
         xEhzXlxvlS7lpNF2bPnQv4LeqelbH5uZOut3UdjmEZkWsBS64JdqBT9Jzkv/ahB8WBPK
         X2qNQOsB+s3vYyTZdJWwRI6luXCiVXiCRjS7eby9f6caVSav80uwBIfG4QvxEOJFh7W8
         Pitw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d5Hr+p16;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si875012qvt.218.2021.05.25.19.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 19:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d5Hr+p16;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llj9u-0000YZ-N3
	for alex.bennee@linaro.org; Tue, 25 May 2021 22:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj8Z-00077X-U9
 for qemu-arm@nongnu.org; Tue, 25 May 2021 22:19:11 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj8X-0007oR-Tl
 for qemu-arm@nongnu.org; Tue, 25 May 2021 22:19:11 -0400
Received: by mail-pf1-x429.google.com with SMTP id p39so8738271pfw.8
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 19:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DPlXrCfHp8pQDQO1jfJmnZott4CioEXbswAa/pX0+o4=;
 b=d5Hr+p16DLEZy2sCrRQrzziwvZuCy3MBa+x2J6r8syyKWddyWVZs6rQB10zHapow5D
 MkqAMh3j8VGGOf+N/G/1OMp9ruGhmCYduomwjPcBGqGvJuUtn88yyntkKSbXG/U3nFke
 m9T4WoK0xIfSrcQrjhQUQcvgt1xnvI5TBgUa+/G2sFixkruIXMOVbbbLCJkr7DQEgMLx
 nSJp9bedkrrqMcBr+sd05mgANOzhsUOB4ikdNa5wL7iGIA67N4u9Qczc0365Yv2mN1hs
 szsqTOfxFkhfYIoDYVsn2Ne+e7MjLw0jTWsoIksNfzdp/+N6DwWllXXURAnqQkACQM5l
 P18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DPlXrCfHp8pQDQO1jfJmnZott4CioEXbswAa/pX0+o4=;
 b=uNez+pyGotqnJVDcFQaEAPoBjR7SVVjlnGTcSD4ov3v2iazj583Tn65ucqNcxnxJ33
 vnl0urMTww5xEdQj6EuDe3ZCVdZL794s1Kb/5bZgZ7z0Byz8fFMtNccdMEgjhu5fFz/f
 HCdPmnip/oIPP0sPyQ2uPB5stbErD8v4SD5DK8wlnBRixgRzsaSa0DWzAo6cXFRDCOhu
 mqi80gJVwNg4HXnkVBUKS16pi0vuZlkbaoi7oppbFGqScChlS+1is5Q/EstXV1hJuSeF
 811tl0PHui81IZ6GjNbQIOtBxhtU8eCclcPyE0TCb4TOk65xw3rn3OzC7QFWDEAUYM9F
 GSVA==
X-Gm-Message-State: AOAM530o4VXD3hTT+featdkdDnjVCJjqvPODg5EBepBEDwSudlVFXmDP
 rl53iPVohelJcHSUxCOx6md6AA==
X-Received: by 2002:a63:f245:: with SMTP id d5mr22014163pgk.416.1621995548404; 
 Tue, 25 May 2021 19:19:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t1sm15296771pgl.40.2021.05.25.19.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 19:19:08 -0700 (PDT)
Subject: Re: [PATCH v7 13/23] cpu: Move AVR target vmsd field from CPUClass to
 DeviceClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517105140.1062037-1-f4bug@amsat.org>
 <20210517105140.1062037-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c96e1c3-85d8-6d1b-8f9f-0b6a1bc5486c@linaro.org>
Date: Tue, 25 May 2021 19:19:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517105140.1062037-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xlHUy+8wWksh

On 5/17/21 3:51 AM, Philippe Mathieu-Daudé wrote:
> See rationale in previous commit. Targets should use the vmsd field
> of DeviceClass, not CPUClass. As migration is not important on the
> AVR target, break the migration compatibility and set the DeviceClass
> vmsd field. To feel safer, increment the vmstate version.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v7: Increment vmstate version (Richard)
> ---
>   target/avr/cpu.c     | 2 +-
>   target/avr/machine.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
