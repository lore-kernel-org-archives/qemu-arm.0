Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3390258ejc;
        Thu, 16 Nov 2023 02:28:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENHmNouGZophx2IY5Gvht1wOgMOtyc1BZgGgt1KplmA/wL+3mG/kkWLumY37f5ScqhovUC
X-Received: by 2002:a05:6358:7212:b0:16b:c63d:5dfe with SMTP id h18-20020a056358721200b0016bc63d5dfemr10537357rwa.16.1700130489752;
        Thu, 16 Nov 2023 02:28:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700130489; cv=none;
        d=google.com; s=arc-20160816;
        b=H0IJ4LW2OmCyTrxCS2JLMqk+N/+pbtTKMlUa10YDXdq6OQm/+f+5PY1+WkKGjXLDlp
         5RoeKARGXnerW1IsDoqHl/i249Dp5bkI/D2xy15Ks2Jg14NcqZFpVOhIMjwP8Mj5bsDh
         j+5Gf4JNWTWFkgT/BQVIHIU40CHubejHIoEGUvDEmpEZfSNvK3p2+sU+UJCzsfM0P/GX
         aCc7nPCfmXcNx9QaNfPVbSe2bb+gyhQ7G/PusoCGsLdE9Y8p+cPjyeKqQ1KlOsDKv8zI
         t/cmlGvD7qdQW1t5ZFXdTXs+H8CkIoJzBO8tu6lol9e3PbuAlfHjMLkojVGZ9ue24aEb
         euVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OkM4Bw5MFHZEcuHs1O7vsROMPAxusBw9ZR7571XzPsM=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=fjS5wU0oX31Nj8iH7IixMKxMGemlYHDt3AEo3hWVaQUUzf/Lox7KKNlxU1vwmTXg/S
         QhtnmtS5sWF1ZvblYS87dddtJyX0MksXvIKzFCLFLCKSbNBZmGcc+5aU/Lt2WxUG67lv
         n91B1OviT344pf1XWkM16W8Md9pUWsq+S1FlQw1IXfZgMt25Z1A84A1yclk3MpBs8lwG
         ZO9uZkD8AtZ5MiewOgNB2dlRnC2UC8FNTmXCJQtq3A7np8gAROhFxYXxfi3YJT3wzcRq
         lU4zGWfFTDZLZyLCiCMp5FBel3u4DoPuRzEBJj5phkaQEK3VJJrqln11bPt1JIifqxNV
         S0nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EE/kQTkz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20-20020ac85954000000b00417dd658ebesi11205412qtz.686.2023.11.16.02.28.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 02:28:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EE/kQTkz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3Zb2-0007bH-J5; Thu, 16 Nov 2023 05:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Zb0-0007ZL-N0
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 05:27:38 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Zay-00055j-5H
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 05:27:38 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4083f613272so5462595e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 02:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700130454; x=1700735254; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OkM4Bw5MFHZEcuHs1O7vsROMPAxusBw9ZR7571XzPsM=;
 b=EE/kQTkzlSpEyjAKUKRifYh5jabTsSmnYWTUTzEpHay9aet3/s8e5StMbtQzvfzwNR
 iMTtOm+I68fcndrr8B/CpZpuxBD7MdRJS2Q7wZ+u5iiwBieQy2wjOtdOvMb2sp3hbcv1
 +swi+p9C7gyNjvd3Up34nvZezfPZY67VxYvwlV3+4LU2Kql9Ds9Rx/9fiHUM27BP6Fod
 vwXvrAVEDJ7N0SsH9gDv/GMLxtwERJFLHW7snyWIFEUTlDgxEw5ly3enY8VAb5cXl7Mv
 EOZGUqiVfxO+mUaBB4tWpN6cujQw/uMLv3OKSG6DvjnaemGF+z9SPBuBJlBcM+GcvEI7
 ynvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130454; x=1700735254;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OkM4Bw5MFHZEcuHs1O7vsROMPAxusBw9ZR7571XzPsM=;
 b=q3sU24uZjRuEGjac1Ic21HUP164LNgiMIpZBgQKFrZ6irm5HxUnxEC/wh6noGCyLbq
 joL6g5sbmugP8TgrAh+pNR5r2UcHWmkaANMCM8sdhNa21jI0YT5skDzEDpMCX/0JqzDu
 ZpM2ayX5g1FTWhlwBCPoZ1/Zjg9k2+VyGfosXd86oD32ikP+XOAadHtw2tbGTOheivst
 pp4SggbxETgF1C3an2QsRknchBjaHfjLphPchoK0aI0iFVNNnvprV1xM8c34nMAU9Ikg
 j13dvEu3M6d/J55AM8vKyLAQ93yfl1M/Wv8FYyTWZiGkgvuoC7UVbGX5aV58ghBBeHx0
 3TYQ==
X-Gm-Message-State: AOJu0YxPs0Jn56Ya5KnBkrLBilRg8owzI925B1ksyp/f+chS+MjDpuoS
 SWNviw5PcEXSWqMNPsdRmvMhEQ==
X-Received: by 2002:a05:600c:46c7:b0:409:4e8f:4b27 with SMTP id
 q7-20020a05600c46c700b004094e8f4b27mr12363511wmo.33.1700130454278; 
 Thu, 16 Nov 2023 02:27:34 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c138500b003fee6e170f9sm3001006wmf.45.2023.11.16.02.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:27:33 -0800 (PST)
Message-ID: <f64fcf96-045f-4309-aeb5-b2dfa23eb1c4@linaro.org>
Date: Thu, 16 Nov 2023 11:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/31] target/loongarch: Use generic cpu_list()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-14-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-14-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: VqFPcbM1CEoU

On 15/11/23 00:56, Gavin Shan wrote:
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-loongarch64 -cpu ?
> la132-loongarch-cpu
> la464-loongarch-cpu
> max-loongarch-cpu
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-loongarch64 -cpu ?
> Available CPUs:
>    la132
>    la464
>    max
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/loongarch/cpu.c | 15 ---------------
>   target/loongarch/cpu.h |  4 ----
>   2 files changed, 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

