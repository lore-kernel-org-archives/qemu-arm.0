Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3542123ejb;
        Tue, 6 Jun 2023 07:50:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5JYhh3U8Fcr9iykGrRtk1TBGcO4mUze1hQUbJriVgAzhXMKc+gHzT/aJfa+XM0XfluW3+G
X-Received: by 2002:a05:620a:6082:b0:75b:23a1:8e41 with SMTP id dx2-20020a05620a608200b0075b23a18e41mr2375730qkb.18.1686063043604;
        Tue, 06 Jun 2023 07:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686063043; cv=none;
        d=google.com; s=arc-20160816;
        b=kfle5oJLAzDZA0eFT05Z82yXQJkytrp8rL3OZHfU5Cd/BJBEKLOcRHPxRK1tNyOZg3
         XPfyT/jBg7Ch7gGblnIqLCfRmKOOu5Wt6Pb6y/j6kJJd/6s2DNBP5G1fD44VFTp2sIJ5
         1IVTjoeWXIP+/49oFPr7Up4wrGIAgTA85qLWXVzS/1o5rpOyMiyJ41Q8eMYYnn4bLEg8
         7wEpqOvlNm67XSuVsUgg1k9ekB+vr9e3MAKi302Qko+gHc+eQ43+Q1Y+O2zVd0q3yEx3
         Sng9/a7CSGyIHN7yFNphYQuQkyT/CzWZ8M4a1OyXPsqV5Zc0sxeJStmTpmkf2ZWC2l2U
         COxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=psOwtkaXSl9id2mHjaUpgh/S1Hy86LMxS5peKgKvoVE=;
        b=BA9FKXd42diAbjgcRMhnkk61XD43P8+GCHlk3q7P0wDlvNSptBnI0mbsLfrkvPcTtY
         8kbGdmVStePodCHwAypTLVFgumRpzfF1nzrXOTv4ftQGgtDyyurc2vZvZlF92/FzkGNy
         ErRfDZv3pNQ3v0x8qBPGJuLEVgXRN/vlitef36bqjLsP4E2cxqb7Eqh/ahSNmaD/lLxq
         qQ+Tw5Z9AGMUQe8zsSjOyFDjj8cIEDmWLch8+QMTzm1i3+ztk7jT4ipo9sG9cYn/H2eQ
         DgkELqb5ABvgHmJvUOgWzhRwijV5LInCz1Cxy2Z6N7cFw9Ro/t700JxI1vhgLuS2K97C
         UpfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vJ98leLb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 143-20020a370b95000000b0075eb8ba0abfsi2683849qkl.584.2023.06.06.07.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:50:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vJ98leLb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Y0b-0004rF-7k; Tue, 06 Jun 2023 10:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y0Z-0004q6-OH
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:50:03 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y0W-0004t1-Rd
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:50:03 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-543c692db30so1699993a12.3
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062999; x=1688654999;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=psOwtkaXSl9id2mHjaUpgh/S1Hy86LMxS5peKgKvoVE=;
 b=vJ98leLb80e8WUrX7DooTPDPlLY3/8LVkW3wFbwA4UOlf1AicAPsm5GkJzxU5FKZTK
 IeJIf5Ik1fAGzJ+h28nYey0eOR/K3lLhJtAru/saQOTQLahcsuP7V0V8RvygJ5bsuGCf
 9RrvgymIBgXJ2aIZNvZoWgrMTY2JCuB6EtXdmAt5mwWc8nU3l8ALC4rMGYumwG7sc29f
 WvK8E0VeVidtf0Ti+vsuwc3BUJ5OGFaZ/4mrMC6U75Aui4IuepM+ucCGrVPOX6bfJMsx
 jXcg3rY7yIpyCheh/FD/AcFqZ8b7NeddHVSddQoV/hNy+ASuOFZOEk3rgDnT74RxRsy0
 MdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062999; x=1688654999;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=psOwtkaXSl9id2mHjaUpgh/S1Hy86LMxS5peKgKvoVE=;
 b=DV2NRv8XVOCVnJmkM8pUkKmgS/J8J7QP45/iLnjvl1mvSX9X7tfQu4giNWReM3lwun
 sQl9bzqTKs1F/f4My7apZ+JPAoJJo8rorg2XzepiFwev0KiNQ4XYWU1Q0dAHXMVS4RnJ
 lCf2fbJwkF/hJbIntzttMPD8raNhLjSE1QNzrApC3E4xMMNYOqc/ebmwK5ybkAEOyro+
 ETrNJCBAF+ie32AvbdRaweoh5e3cJsQIBqgF9T7JmdsFXfNQ4i25RUgdTPjLLMuC+s2B
 9a5IIpNq/b23W+OFrs6abpebbniBevwGznxoYzmpD0NrByWrqEGa43VUz7BpqKPVMWkg
 bkZw==
X-Gm-Message-State: AC+VfDz8/G/4n2B+U45MegILqlsg2bWcbtURkVzqk5ni7amctNYm2mOn
 Ixi3ht/fzVaEobGMqev0Yl0spw==
X-Received: by 2002:a17:902:e88d:b0:1b0:3c2a:2b4e with SMTP id
 w13-20020a170902e88d00b001b03c2a2b4emr3414254plg.8.1686062999401; 
 Tue, 06 Jun 2023 07:49:59 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a170902a3c600b001ae2b94701fsm8754590plb.21.2023.06.06.07.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:49:59 -0700 (PDT)
Message-ID: <f1e72c3a-64f1-3993-2567-03a3ec1541bf@linaro.org>
Date: Tue, 6 Jun 2023 07:49:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 4/9] target/ppc: Check for USER_ONLY definition
 instead of SOFTMMU one
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
 <20230605222420.14776-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605222420.14776-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: k+g1J7DhimSA

On 6/5/23 15:24, Philippe Mathieu-Daudé wrote:
> Since we*might*  have user emulation with softmmu,
> replace the system emulation check by !user emulation one.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/ppc/cpu_init.c    | 20 ++++++++++----------
>   target/ppc/helper_regs.c |  6 ++----
>   2 files changed, 12 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
