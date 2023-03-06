Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4915784ejc;
        Mon, 6 Mar 2023 09:29:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8MeSGj76TtkrpP4Gw4oH/eVr3anVVoUTvL+K40itudSfEQEqXXeF8Z6+zEIDpENKP7UBQq
X-Received: by 2002:ac8:5a07:0:b0:3bf:db86:e538 with SMTP id n7-20020ac85a07000000b003bfdb86e538mr17615774qta.68.1678123787531;
        Mon, 06 Mar 2023 09:29:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678123787; cv=none;
        d=google.com; s=arc-20160816;
        b=FEyqvl8ARml825Ibb8bhqbXQXi9B4xg4eRDOGZ3z0oGg1qgpu1deEpiKOFlGfAzexb
         T0kwgg0T/2/IzOdvlsES5FRnti7Y2LL3fyBXdyDyDyjrY6Z3OpCQaRtWXtcOFn+LkcUE
         +kCjEdyvdD3TQVKredijSiHl2ua7cBaF+GGtywYQy+aQA1k55y/ZPNLEB9wFeR/XUT5I
         5BqjU1dimHyVNm+joM+es2Btx1R011bQg7WDJWk1pnWJdyxKW3Nft4PbHQ9XAs7KViVE
         e2qSMG6g3ezcM9ZVQg7CFRSyMqqCVFeRFf+bsU9TO+cdCyHCm6E86QzIi+WDbRE4t3Sf
         9rYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:references:cc:to:from:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=myUG5+r1VnqjDEN4fvHq0OgH/f12TDnGLeqBIBa4mzs=;
        b=psKYgiZvAGP40vQ6CAnfh1F84HeUPGPEZp/MsBXsMqovoM2JOqXkFgUJZICmcVL+8F
         ByfGbYiSkZaCYeBMOZ5viyq2WHmBe/RrgR/TB5GM3f4HEV0HQTKgg5vSvK4+bx+6ABnp
         LKwYxkk1/5CHizn0Or4TXf5BjN7TEj6WyTWcwB77z4PhIufx8N/s6i/M9xLCxZ/Bmnyu
         FtWwjieTz81jkSHO5ArRJgCOMb9C0m2WuH2KkbEgj0mC4fwEbV8R8wynHZESjXQbXFA2
         LlKHzQ5ZPbegnLlsRDTq2Thr/5dmTNO/MTl5FLFRF26eP2Paa55T3n4FzFOzr9toD/9v
         3Esw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cqd8obIZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020ac85909000000b003bd134d475bsi7666322qty.368.2023.03.06.09.29.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 09:29:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cqd8obIZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZEeV-0005oL-9r; Mon, 06 Mar 2023 12:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pZEeU-0005ni-4k
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 12:29:34 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pZEeS-0001nT-Ft
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 12:29:33 -0500
Received: by mail-ed1-x532.google.com with SMTP id u9so41954651edd.2
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 09:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678123770;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=myUG5+r1VnqjDEN4fvHq0OgH/f12TDnGLeqBIBa4mzs=;
 b=Cqd8obIZVO6kd8Tpwl9m25s88Z2kGMcVM8QUaYScdmUz08DhJe1KYuQ2mTKA0966w7
 SGPa9lC6czNepxQWiFvda+Ehq5WDRJH39L0cBHeVH3lqLCmc4NA2vRqiDJoSjJsN19L1
 LRzRdpoKjMzKnW/uwTUPRKmXbdllY+S/ZP2ZK2Ykz0xwDvVr3woRpM5Cec4T00udYTmE
 xPS+ydQlr9xTcdVKGuRmzBtgApoz1c6Xa9YfZ7TuhXd8hVW7xUxEMFYFo+KyPAP3js0P
 V5LjaJ10acdPYKX4IYWa+0FS1q4zMe/ht28nGRITYS1qw8Qhhmblqqt5IoAlL10yjbBV
 I5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678123770;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=myUG5+r1VnqjDEN4fvHq0OgH/f12TDnGLeqBIBa4mzs=;
 b=6EaPEh89Zxjx0WkIXOFpktY555H81HspgF+0d7GfbfhvXnZqckfzMTqaKEXZs9JISy
 oNA4miI6wximOjRquhG9+/Ox1kUY+eHSgS9SSDWgANzZ+aza8tN9haJSqLh/cNZgCKBn
 miPPvp8DBpNdReExpMy/VMO0kb125WuidOHI/rjLB7shaqLlInKw3vWtTHG0lDwB8ZO3
 ffTy6/n1iXYprpJAljPAOaJ2kgxugZm4EYoQOUz5Tv7of6pV8Emyv983sUA7UcXgzCj6
 ioX+O428MsZX+0AZ/jBWeelDGBl5yClkO+NFr7EB4H81CP/FPHcBXeqjc1SC2sxQQEc1
 cwtg==
X-Gm-Message-State: AO0yUKX0OqTrxiGGaoCsGTb9hV77wCtayHSh5frv6dCUlhpxzsqRXNgM
 9HrTVwrr7VRAdrobK5k218/lZg==
X-Received: by 2002:aa7:d952:0:b0:4aa:a280:55b5 with SMTP id
 l18-20020aa7d952000000b004aaa28055b5mr11019213eds.20.1678123770350; 
 Mon, 06 Mar 2023 09:29:30 -0800 (PST)
Received: from [192.168.200.206] (83.11.36.13.ipv4.supernova.orange.pl.
 [83.11.36.13]) by smtp.gmail.com with ESMTPSA id
 e19-20020a50a693000000b004ad61135698sm5396328edc.13.2023.03.06.09.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 09:29:29 -0800 (PST)
Message-ID: <a7192c74-be6b-fae5-b282-619d39380da7@linaro.org>
Date: Mon, 6 Mar 2023 18:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] target/arm: Add Neoverse-N1 registers
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Chen Baozi <chenbaozi@phytium.com.cn>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230306151243.3877250-1-chenbaozi@phytium.com.cn>
 <CAFEAcA8BJO2iVG_KQaFBV0hvAmWn4cV-vC8QA5CC+iChMuHyXA@mail.gmail.com>
 <5f8a1a7a-2971-029e-adc2-eef8a3c121ab@linaro.org>
Organization: Linaro
In-Reply-To: <5f8a1a7a-2971-029e-adc2-eef8a3c121ab@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: IIOA02fWzznr

W dniu 6.03.2023 o 18:13, Marcin Juszkiewicz pisze:
> W dniu 6.03.2023 o 16:37, Peter Maydell pisze:
>  > On Mon, 6 Mar 2023 at 15:12, Chen Baozi <chenbaozi@phytium.com.cn> 
> wrote:
>  >>
>  >> Add implementation defined registers for neoverse-n1 which
>  >> would be accessed by TF-A. Since there is no DSU in Qemu,
>  >> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
>  >>
>  >> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
>  >> Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>  >
>  > Did Marcin test this version of the patch ?
> 
> Hard to test it without updating TF-A first to not use DSU. Older TF-A 
> starts and then hangs.
> 
> Waiting for Chen to provide patch to TF-A and will test.


Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Adding neoverse_n_common.S turned out to be enough:

~ # cat /proc/cpuinfo
processor       : 0
BogoMIPS        : 125.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics 
fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp ssbs
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x4
CPU part        : 0xd0c
CPU revision    : 1
