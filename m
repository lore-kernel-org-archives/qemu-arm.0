Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp244535ejb;
        Fri, 8 Sep 2023 00:37:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH4TjGcpmqEBHvxMA58PlKS8MREWcdxnjRF1fft+ILi8yyV6k0rTblljddA6ZptbN4BKBZ
X-Received: by 2002:a0c:dd88:0:b0:655:c6e3:8516 with SMTP id v8-20020a0cdd88000000b00655c6e38516mr1163739qvk.57.1694158652162;
        Fri, 08 Sep 2023 00:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694158652; cv=none;
        d=google.com; s=arc-20160816;
        b=w04wq+dAFgWEBgwPXtkKXNfIvA8FgHg05eU2ufFPseqwrD44x3qJEYRpI1EPCIkxIk
         IBf1cZwIDSoDg82T+fZHqA4C2qNmP2hGpPlhMVKp24n42YInUm61W6yqykttnb5ptiBA
         xXMg1wbEYd1XAVzMJl/ojunLhXKx/exGTpM1z2niclVhLT93I3GWOCA85m0dFsUeYLIP
         98a8yQVvNvu+oZ+cqbZiOsDL39EG6kdGTVcjuHCaqc46IDktN8MTgDDrk75OikXbUmy+
         vwyRYDdOaOz5jeCEkti+o/RHHx/eU4zCwCux5wJxNTu0MjArPCPKn8WUMX3DX1GcZ9xB
         dorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vBdC+EgHmEoI3wVBfVrOC8KHH125ZVdNmVmrDZYnzg4=;
        fh=eP3Xc1uKN7jY+vqJDSu4zVRAmVfVwfFuSil5lbbmuYc=;
        b=UF8qibAhMt1dXqAQCSTKIFlVfs+r7QB+b69ye1ShymS+OJUlmaldnQrLHXpui3LEsW
         f2Tst6qarVSOSVzDdyl7zmKKyp4AdCR3ctl+efv7bkHlWzcR6NxKG2zxsUC5x5P0Y2WE
         xxBnb+0ACgHGrsfSMRMNztW8+AQNpk6TD/ri9k9/4SLXZ3YQSfOpY+8kSxcohC9Uz0Wk
         J7HqsBxTvgAaRYACJI/RJRGGYJtux4wnXSlErfOROLve2H+EfCI1kpAiT1YS5EymcqVY
         kynjjqZrMJfsiX0TFb7pazZpSmK/ybKg4+/cIfM9OSMu8IBXTSmn7DNyn8zXvGtew/VD
         Pbmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ba6LFBte;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay19-20020a05620a179300b0077091864d1asi739265qkb.662.2023.09.08.00.37.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 00:37:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ba6LFBte;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeW38-0001Mb-KK; Fri, 08 Sep 2023 03:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeW33-0001LX-P1
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 03:37:02 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeW2z-0001E8-TG
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 03:37:00 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4c0so3712299a12.0
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 00:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694158615; x=1694763415; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vBdC+EgHmEoI3wVBfVrOC8KHH125ZVdNmVmrDZYnzg4=;
 b=ba6LFBteXgOMx/3ataiUzfyOjT9qxFvhCRZliKHqWbdJQ7Z5wd9n6TnNPGNEV9Wyu1
 lH2XlMImyt19gev2pvW1USqu/QeOYbFtM/QwSdvvGxfjr6PpNkrcxvBiUaYBtZsJrq23
 FWdIObJHqA2HJYuyA4UPBUTE2JPKFXpNyZtvj4DBpDc8EF7XPEvyy0gqde0o1DBNXiBj
 mdTYUV8amO9NnU8zh3UqY2IJVv+6386FDhm61brn6k/I7fl11LAWonGMePtiPzW1FWPf
 qxWNVMPNSiVa2+g5Fks8gNnlMpw4r4yt9sd3kY/pdZgN9ccDg9s4SJI98Hf3yRjKuHy+
 jBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694158615; x=1694763415;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vBdC+EgHmEoI3wVBfVrOC8KHH125ZVdNmVmrDZYnzg4=;
 b=VapyhG2kdLaTmWxKiaY8IvSwboMZdMltKix2T5wwV+AodfPFKcbZwepcyYa+3Rx5hS
 8YmCb21NlNX2IwHH6xjR3coMTjoKFu3ca6x3HPmFrKfezoIzwIZgG16YJxBc/pAJEbo2
 nCPLvnmRcSirbjyu8RYKbVbABOQ9wWpfX0JIBj+iCbB/78VybWRqe/K7icqKZZdthGAJ
 ikptH0bMr9mt5wHs64Ll7aK6K2oxFG2giazziXNt8dfCKQwecAFMGJVLPWfOlpabf898
 xDHtKdzeQRd/xh91OEPDr1eLXj1/oXtaSxXBgIiwe5pnKtEQMOId2fwmJ8MiB0F5i0Yz
 DFJA==
X-Gm-Message-State: AOJu0YyAX0JyMZo7RjDG1Vgef8ItbWQnAh9qkYVr5hairOXU2KuH/8ee
 F9tuQMIgdq1hmrCqeFRMrq2K+w==
X-Received: by 2002:a05:6402:3551:b0:52a:586a:b19a with SMTP id
 f17-20020a056402355100b0052a586ab19amr5128096edd.21.1694158615171; 
 Fri, 08 Sep 2023 00:36:55 -0700 (PDT)
Received: from [192.168.69.115]
 (lfb24-h01-176-173-167-175.dsl.sta.abo.bbox.fr. [176.173.167.175])
 by smtp.gmail.com with ESMTPSA id
 u12-20020aa7d98c000000b0052a1d98618bsm653671eds.54.2023.09.08.00.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 00:36:54 -0700 (PDT)
Message-ID: <f98ebf8f-04dd-8429-b40e-e333becd36c6@linaro.org>
Date: Fri, 8 Sep 2023 09:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v4 03/16] tcg: pass vece to tcg_target_const_match()
Content-Language: en-US
To: Jiajie Chen <c@jia.je>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, git@xen0n.name,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 "open list:AArch64 TCG target" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG target" <qemu-riscv@nongnu.org>
References: <20230908022302.180442-1-c@jia.je>
 <20230908022302.180442-4-c@jia.je>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230908022302.180442-4-c@jia.je>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: j60uf5rq2XUQ

On 8/9/23 04:21, Jiajie Chen wrote:
> Pass vece to tcg_target_const_match() to allow correct interpretation of
> const args of vector ops.
> 
> Signed-off-by: Jiajie Chen <c@jia.je>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc     | 2 +-
>   tcg/arm/tcg-target.c.inc         | 2 +-
>   tcg/i386/tcg-target.c.inc        | 2 +-
>   tcg/loongarch64/tcg-target.c.inc | 2 +-
>   tcg/mips/tcg-target.c.inc        | 2 +-
>   tcg/ppc/tcg-target.c.inc         | 2 +-
>   tcg/riscv/tcg-target.c.inc       | 2 +-
>   tcg/s390x/tcg-target.c.inc       | 2 +-
>   tcg/sparc64/tcg-target.c.inc     | 2 +-
>   tcg/tcg.c                        | 4 ++--
>   tcg/tci/tcg-target.c.inc         | 2 +-
>   11 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

