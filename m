Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp372363ejb;
        Thu, 22 Jun 2023 02:59:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rjdzAGDK4tpN146TtFmYnOB2fClWfKvbl5wzejeh98bvtQ2BawHgMcGK6ZnDX3fAll0+d
X-Received: by 2002:a05:622a:1d6:b0:3f6:a888:5152 with SMTP id t22-20020a05622a01d600b003f6a8885152mr22092221qtw.38.1687427948549;
        Thu, 22 Jun 2023 02:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687427948; cv=none;
        d=google.com; s=arc-20160816;
        b=XCWmPLGVBP2ASKB0Ae9REfszNcDMqN4ml/PpGzzfFINrmcmSNOC42cu2fCtY6y2BVx
         NKJrQVBJHyomVrCQC69SObKc5LSi9pB/71nWq2nHkVWzthGO7EhlR1vE8pcbB43ybgka
         KAnRNbTYqNpOEFfZ5n68q2a56euN09xSboWwKMH9aau58zfREID+rTaEF0xZ95xDeJZp
         yB6Jy1tora0GMrRy47Kq0SB8rf6KmBi9LApGyM8E3DW9aepkAS8wI81GLkiiA8HHwWEs
         rtH59/c7K7Si4nuUK3D9XLHrwnVfjL72KDrgZthf4R5aCPwEBs+kXV8PGS2kvZzjCkzz
         l2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zvnV1VJPWEebNXnEj623nIusXojJb+kOGXB3oNOFbbI=;
        b=kO/+0qH8/0HMulYxjoBUhMuI86jCJYUUEKX1iNx8JD6yGecOP6DqJoU2jEaH039rYN
         Le7HRUwXHZWoD572EeZV1Bt8Qw2F/BIreBuU8ugHbiGoZLfCvgoxb+dNe3Ys3CYNrRYE
         3K4M0NpGJSDjwrDfgEeGWptLo0JkkrI2MsyL7Uz4qZzKwEcHnal/oYzapZvnLhMakMLd
         qRpSU+0oly6tkZA1NgcMANMKC7Yk+1SLRM3yCNetet2E3CYipFCdjQU7fRFh4qFJhgT5
         SxTDhXP8E/zBtffmF6+bolfoeFLn6pfXOrYhG5dz1IUbnFO4F0uuWpwF8VyYycEy8cET
         h4lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="db5wE/ap";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16-20020a05622a055000b003ff429a469csi1065743qtx.778.2023.06.22.02.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jun 2023 02:59:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="db5wE/ap";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCH5H-0005aH-SB; Thu, 22 Jun 2023 05:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qCH5F-0005Za-Vk
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 05:58:34 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qCH5E-0001v0-5e
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 05:58:33 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b45bc83f26so98548511fa.0
 for <qemu-arm@nongnu.org>; Thu, 22 Jun 2023 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687427910; x=1690019910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zvnV1VJPWEebNXnEj623nIusXojJb+kOGXB3oNOFbbI=;
 b=db5wE/apz2my1+8dFFSHdyaOwUCHqi+gly8ANl+RprQGBYmpajzXrkz4MbEYxMtQxz
 ZXesnyX2Ll1Rrk43C2WBy5OkhDQNmyyXOd5uIq3LeZQwAl4Ig2pac46aeMjdYQWJ4Ym6
 1FWEoA+aCGYzXFRl7sbohX/PyTbM9SNXByK33+j3RAnE5tB/SjZ5ayR8GoeMXfET3TC4
 cNmKqgOyniToBOAVYFVvuqqZoZUYT6J3CgJbuIXR0vdUE2CYMqR/7xXHFEO4UR2TwcgY
 TYf1rmXnWPykYqwSLIZ3zaN3dgOIe93FwE/cs9qTisL3FXY3LkDVu/acLbtkBcAVnShk
 pmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687427910; x=1690019910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zvnV1VJPWEebNXnEj623nIusXojJb+kOGXB3oNOFbbI=;
 b=il1pn+PeGaI2Z4KZ/ZVDWWOxgWCqxxvFdnh+nqHitqKHDsvv+DuuDEK9pwIlkdJ4fL
 3LJjT47UUETKyLJffJLTSzdZSDdWB1PjamuesMMSqwn/BV3kP/uGy0VzMuKh3ZYbG3sy
 z9GKJthe3EFlWUUlo+snndaKSE3A3GKgmzuwb8KaWJBbSfiSMFdZGabo7kVRDYiOEl8S
 eKaW5VYMaIhtKNRUKFwuc2ow6iW2k6yUJbilMA94exUVk7gewBDV3QU4s6n/0uk83Gtv
 mvLtlzrFYIg9edCfvBfjwJnkLXP7IseQHGGWNCL+7re4Coa664YwpA2BRxDQ/z/X9HhF
 mSnw==
X-Gm-Message-State: AC+VfDw9Yq89ZtbbdI9aG1qTGudW+V0w+RBsgLeF2t1jF2DJlKpsc1Uh
 eeBecBxh5QP9XAVeadu4I1uqVFiPfoFXYXlhRCA0nQ==
X-Received: by 2002:a2e:330f:0:b0:2b4:7281:1987 with SMTP id
 d15-20020a2e330f000000b002b472811987mr7858248ljc.44.1687427909804; 
 Thu, 22 Jun 2023 02:58:29 -0700 (PDT)
Received: from [192.168.122.175] (127.red-88-28-17.dynamicip.rima-tde.net.
 [88.28.17.127]) by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c218600b003f9b3588192sm9226502wme.8.2023.06.22.02.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 02:58:29 -0700 (PDT)
Message-ID: <405f3697-9cc8-3a19-ee79-094e6e130c29@linaro.org>
Date: Thu, 22 Jun 2023 11:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/9] accel/tcg: Store some tlb flags in CPUTLBEntryFull
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230621121902.1392277-1-richard.henderson@linaro.org>
 <20230621121902.1392277-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230621121902.1392277-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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
X-TUID: lnMvR32bNf+6

On 21/6/23 14:18, Richard Henderson wrote:
> We have run out of bits we can use within the CPUTLBEntry comparators,
> as TLB_FLAGS_MASK cannot overlap alignment.
> 
> Store slow_flags[] in CPUTLBEntryFull, and merge with the flags from
> the comparator.  A new TLB_FORCE_SLOW bit is set within the comparator
> as an indication that the slow path must be used.
> 
> Move TLB_BSWAP to TLB_SLOW_FLAGS_MASK.  Since we are out of bits,
> we cannot create a new bit without moving an old one.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-all.h  | 21 +++++++--
>   include/exec/cpu-defs.h |  6 +++
>   accel/tcg/cputlb.c      | 96 ++++++++++++++++++++++++-----------------
>   3 files changed, 80 insertions(+), 43 deletions(-)

Do you mind squashing this for clarity?

-- >8 --
diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index c174d5371a..c0f19e5893 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -130,3 +130,3 @@ typedef struct CPUTLBEntryFull {
       */
-    uint8_t slow_flags[3];
+    uint8_t slow_flags[MMU_ACCESS_COUNT];

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 4871ad85f0..d07763fdeb 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -86,2 +86,3 @@ typedef enum MMUAccessType {
      MMU_INST_FETCH = 2
+#define MMU_ACCESS_COUNT 3
  } MMUAccessType;
---

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

