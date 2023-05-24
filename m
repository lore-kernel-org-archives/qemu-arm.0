Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2571455ejb;
        Wed, 24 May 2023 07:01:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6NOlYRFxoZtCPmFinyejBZiQwJp6ZpuEa31HEbTV+Av/fWFPYJMnltcmSM2ASEl9L4oj8j
X-Received: by 2002:a67:fc95:0:b0:436:105d:91f9 with SMTP id x21-20020a67fc95000000b00436105d91f9mr5199014vsp.21.1684936895255;
        Wed, 24 May 2023 07:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684936895; cv=none;
        d=google.com; s=arc-20160816;
        b=OVTVBD3PyeH5a0n5J8j4WHLBr+T/etAqifce4YdRUbxkeuiaVYRLrUnfYxxAerwMkO
         neSTzy+cA4s7xhhuD62L7mAz2Ljul93r2BUQkQY2YAcvHoNJ/jbet+FXaS2v6cI8wo6v
         Hg8yaYC8sNF77Gg+wYQe5eAwLKsM1SOailkt+lLpr7keVV+PFRjSJnxkNhESBWZm/cSN
         sI2jLGp6w6RdkbnQRbQs2moXJX3sXN1vgdmI4KdCC/GZztVjzLcLNQFyvHIpFEdXg4y9
         OE9N3E94CJ541CdRhoJntPzPRJZqE0by6kgjrIkRW5rysdHCBvcfy4G5Zh1xUT5BzqVK
         MkOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=H5d+9oVbqK/+2tI8zHq0xTLIkSguQcSDGD32/dixfLc=;
        b=Ltyogq4tfowpEer6tqOP+rwSjxZmiZUgTAc0SstedS0SPaLSWwEKG71pNdDMi9JiO9
         kftsBPw7EcQCfPzXbGDAHxmPVk/XEtHiMSgJ6V4oET+35PSR8pnjiEI8/YaW/U/AgNxe
         +D71GK8yGJZ10VC52/q/AfzYanjV+rOWBNYyItDgVvHD+BgZPAZyCkxuk0ChbwqvDrIQ
         WhvRRiFcjTeMGu/C04LFEfhGfRc5U5mR83yGFKWrbS7nYTHxeaVgWw8nL2lAC/on0L9R
         /Y05p4EL2AfPIggA4/EERtGe4sv7X1mmj3AKyUdi3M1yKqjB0CpKEsljHaqV8kbtUhZU
         VjFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bInmMnLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020a67fa09000000b004302a5ca782si1002101vsq.310.2023.05.24.07.01.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 07:01:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bInmMnLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1p3P-00028S-Tt; Wed, 24 May 2023 10:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1p3N-000280-Jw
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:01:25 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1p3L-0007qa-Qr
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:01:25 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f608074b50so11613305e9.0
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 07:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684936882; x=1687528882;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H5d+9oVbqK/+2tI8zHq0xTLIkSguQcSDGD32/dixfLc=;
 b=bInmMnLVU8zNFb7vHXLErPZ4rj2sic4T9cF7XvIMt9nBaRY4zVZMBc84oriMWd34E8
 KdbQBmphouxD6yhTCsErd7RcumiACdEzt01/ttRWHnSPy1wzLHq5maoH3UyIJVLoK9qK
 ibchB3GT9bolkPDbRB10jTYKJW/PtntIqL4eWXdv9KhipLHFMUUOATBW/7LyaHk/su6p
 xVx/WoWjkE9h0zmdvgm7iHECmIU6X8E517wCTNpw58HGwImkmlXETtTEtmZSBFqmG8E2
 fpuU35n3zTAQkumPizj8Hv8q0RL6rewil8QcNDPodGoMM9A0R1mj/nPvu0MD+FxOoeD5
 Sa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684936882; x=1687528882;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H5d+9oVbqK/+2tI8zHq0xTLIkSguQcSDGD32/dixfLc=;
 b=Wxc9dcMvRnYPvnV+HclU0fwyyiH4nuDmce2/h+OcvM10mH4SVfSrLSiqVbKItb4JUh
 JArs94pqZjM0amXHGqP2vetQk684lOdlDZu4PChLot1sYIzXn3dyC8J74jvur84um1YC
 mq7ES/zw4DXsrfLW8ab2IoK1+VenRlF3iMPu80cwzrdkBtXyyGNEXPSnKJX9QMJ/FBDT
 np5XSd+oqkxciZmHQvfqqlpAaJr9Ub7/CAhjoYNwGYib/fEZToiMDcjYa6BKw5TsgUp+
 g3GGPFz+DOoKwj0TN/jaxho6Magx+IY6FUBwhDXEhlBUvkIUtuOwORaYGE3Xf23hkoIA
 Gemg==
X-Gm-Message-State: AC+VfDwy44ys4NBFeliYXv5c54eFtJOZfyJell3WXmYJSF99IZcto58t
 BUuFdm/04GVzwKfKyRk7IGhRvg==
X-Received: by 2002:a5d:5348:0:b0:306:2ef0:d223 with SMTP id
 t8-20020a5d5348000000b003062ef0d223mr12242411wrv.62.1684936882023; 
 Wed, 24 May 2023 07:01:22 -0700 (PDT)
Received: from [192.168.69.115] (fac34-h02-176-184-31-193.dsl.sta.abo.bbox.fr.
 [176.184.31.193]) by smtp.gmail.com with ESMTPSA id
 e9-20020adffc49000000b003078a3f3a24sm14705924wrs.114.2023.05.24.07.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 07:01:21 -0700 (PDT)
Message-ID: <1d3d36da-3b7a-ebbe-6339-0c707b329e45@linaro.org>
Date: Wed, 24 May 2023 16:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH] tests/qtest: Run arm-specific tests only if the required
 machine is available
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>
References: <20230524080600.1618137-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230524080600.1618137-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
X-TUID: ivLRW5ApIWZ9

On 24/5/23 10:06, Thomas Huth wrote:
> pflash-cfi02-test.c always uses the "musicpal" machine for testing,
> test-arm-mptimer.c always uses the "vexpress-a9" machine, and
> microbit-test.c requires the "microbit" machine, so we should only
> run these tests if the machines have been enabled in the configuration.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/meson.build | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 4c5585ac0f..087f2dc9d7 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -198,14 +198,15 @@ qtests_arm = \
>     (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
> -  (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
> +  (config_all_devices.has_key('CONFIG_PFLASH_CFI02') and
> +   config_all_devices.has_key('CONFIG_MUSICPAL') ? ['pflash-cfi02-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
>     (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>     (config_all_devices.has_key('CONFIG_GENERIC_LOADER') ? ['hexloader-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_VEXPRESS') ? ['test-arm-mptimer'] : []) + \

Also ARM_MPTIMER?

> +  (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : []) + \
>     ['arm-cpu-features',
> -   'microbit-test',
> -   'test-arm-mptimer',
>      'boot-serial-test']
>   
>   # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional

