Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp177105lfq;
        Fri, 8 Apr 2022 17:23:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXCIX25b4pEGUw0SG6BhGfQZbKiSHOjpybfZbEiyczKgIeo1NEdQCcAgPUHV8J3PebfDmY
X-Received: by 2002:a05:620a:408:b0:69a:1254:6a30 with SMTP id 8-20020a05620a040800b0069a12546a30mr6014667qkp.629.1649463810990;
        Fri, 08 Apr 2022 17:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649463810; cv=none;
        d=google.com; s=arc-20160816;
        b=gWbl76+wHm0FCAbp4dpPfuTmfe3CoOnIfSBETfDvBwmdNgN2WQ6VJHXZrW7rrZfYir
         wk+v/iV5IuKKGaoYsB0+LYZV3GYwezptTbtgIfOlcBJHnlghQOFKVw/sGl4ygpgSPP5k
         XyLyE3liG5YdZgx5xKnfBKGtN1ge3VE2HEaRF8Ft7+6RNbHQVqLcL7MIqDunophRtXAj
         oW49h3UV/aJBdmUNfcjzQK6QcLkxnsfi+JGT03D0ifpsZIfjUFTisf2qzSy89zeWkECm
         9QsLA8VHzD/hnJPRZGKjBwP68s1tDv9p5DkBoYwlpBuX7FgpPVUpPnXPo8oPPccJpg9P
         MJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ppoA3mvS9q/qtJs2kfHueg9IKiQGxu71Diq9gdMQUcw=;
        b=TNiCJDE8XxVdbX5deOizfrL6O7Z3PCpvsi8xWj3KGFs0msOjhJGS2gGwVYwgi+esGG
         rRf8pul6NLdEhXmhyBGl4bA+fV5qYzIihYxfeBmtGPi7PRUBA5SN9pkCxwundEPHDJqy
         B0CDAPFQFgq4p+PMb4eNMC1fPUKoccL7Ns90itslU16Qxms9yECMKgCrTyOZjE+9DN+w
         cC5MZNEnqo8YT0UDHkTM5m0aqvXYNvI6KMApF8aJ2wucKPgoWiCvCzdN3d2Z2yM35+SJ
         fVOzGTHFU1g/dRR4v9FUhLg4MTBH50bXx6oVB2TLNKVroMl8AiadC8XbH53GHI2C1ivm
         RYaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WdSsfyjy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9-20020a05622a020900b002ebc8d5c5d1si1552222qtx.43.2022.04.08.17.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:23:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WdSsfyjy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncyt0-0000QD-GC
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyr7-0007ZX-23
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:21:34 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyr3-0005mD-MG
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:21:32 -0400
Received: by mail-pj1-x1031.google.com with SMTP id bx5so10057120pjb.3
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ppoA3mvS9q/qtJs2kfHueg9IKiQGxu71Diq9gdMQUcw=;
 b=WdSsfyjyPtdJOdqULA4BTbf+QWNMudDjDaBd4mUyuDWy2YP20zliV+MfBcHxqxkn3K
 tX4IYSMRFtUwNP3aeEQGbkmr+NZ2zEVXUVoZcD0SNYAPji1x2HVJoZK+VA1WoC2Ks/x6
 rH3xNEoXT4BV6uLD4hAB51vYzZ6K84VNmtZ8+u40tsA0zVx7JzzuO+l93LDOBAi42njy
 mCEo07/wt1QaEF0gOtjxfRqS+La8KjE3NTVQFKO4QqhVt4KZIhfkXtnciRVP0xwXhfPT
 4AyilOfASEAraxXx5PBD/eCb+/UpJNbUBHVzIoXZ2FJlQgUOv1ASgzn4MgETecw0a94Q
 d7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ppoA3mvS9q/qtJs2kfHueg9IKiQGxu71Diq9gdMQUcw=;
 b=RkaNbUvlYkDp3HximeO9TLkXSXHSEch44FmK0xyKUuHUMw3y//T5HXjI0Go1X7hnHe
 OVB4vJivmubaZoARzPgJzovgBWI55sBNrwFgWFlsbjW8pqq3f6n6/lRlWBwuuA86VitK
 ny/p+ApBiqSLPW/xLr2K+0QCpEZEieRtkdQg68ccqeWCChgokop2nbHviAXXPa3J2SQL
 gE7ZpHSSJIPVMvl6jjMxFi+YRWWjVBkfMcTdsssgJa8N0bC0yqdgIiO5eB2IRJlYKrlV
 1e3P8XAjJHZ6RlEbSJt+Eue/59FD8jKPEWEE/xkHuEHn2NCW9K0/xx2f68y94ckdPOtF
 rv6w==
X-Gm-Message-State: AOAM5332wOOCjApKdMcDE2TpjcEe/+GCR4F6curA1WOPBKqjAevQpe40
 m/rkcVnhQfoskYpp2vYM38BduQ==
X-Received: by 2002:a17:902:d2c3:b0:157:ebe:25c5 with SMTP id
 n3-20020a170902d2c300b001570ebe25c5mr9993107plc.59.1649463688289; 
 Fri, 08 Apr 2022 17:21:28 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm28673734pfh.177.2022.04.08.17.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 17:21:27 -0700 (PDT)
Message-ID: <4dd747c0-3ab7-ef2a-168f-ccec69ed2d35@linaro.org>
Date: Fri, 8 Apr 2022 17:21:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 09/41] hw/intc/arm_gicv3_its: Implement VMAPP
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e4U/g1UIG/vl

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the GICv4 VMAPP command, which writes an entry to the vPE
> table.
> 
> For GICv4.1 this command has extra fields in the command packet
> and additional behaviour. We define the 4.1-only fields with the
> FIELD macro, but only implement the GICv4.0 version of the command.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> GICv4.1 emulation is on my todo list, but I'm starting with
> just the 4.0 parts first.
> ---
>   hw/intc/gicv3_internal.h | 12 ++++++
>   hw/intc/arm_gicv3_its.c  | 88 ++++++++++++++++++++++++++++++++++++++++
>   hw/intc/trace-events     |  2 +
>   3 files changed, 102 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
