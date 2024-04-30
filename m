Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2984046ejb;
        Tue, 30 Apr 2024 07:07:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPYJ+Rh/Fa7KPi+p2m8Pym3dkFrF6y11fz6Sm53MOp2IntVz0hNM5V6Ct/YtAU7t02V+YTr0wdF8e/MZgClEQGdE9im9KN
X-Google-Smtp-Source: AGHT+IFb23sMtnE9NMcc5LF2fUmmFCd+U6pRSJo5tgDwgP7SSrqzkxJ8BtK04fIwUd88IJ5XmKp8
X-Received: by 2002:a05:620a:8130:b0:790:7994:3712 with SMTP id os48-20020a05620a813000b0079079943712mr13681741qkn.68.1714486037073;
        Tue, 30 Apr 2024 07:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714486037; cv=none;
        d=google.com; s=arc-20160816;
        b=E9yHN+kVlM+lK2eOjTQMI0XDkAVsWwCp2hlUvT/PFSeNi0sV92qXd2PgLdmT8Sylrf
         L0DR7uB7XsvAQ/TeHOghV8V5bw8AmtVwMgfjOTQM4osEAdqbh2HICkYTDQ97OvpJwSn/
         CRJjdtLVzTAFETdoHhgJPDUVkg+i7mBhJb6ZeS8AdNnQqN1WoZwijXMFISSskqxW4Rmv
         s+zH7mc+efpPeUohlmBZ1EdTL05osZ7hoWF1DEIyLwxEQZHKB5fMlyNjEBZNGuEniyjz
         8duTBAadMSxzxNDtIEVXqIJ2KscMT/mgbJF4ya6+KXf3Gks0uOHq07WeEuFe2iQiOkSU
         steQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Wll30t4lzfyIs9DXRAnPNddBWsjy7BQfhDRLiul3yl0=;
        fh=xCIZDDRZcGybc0mNtqP8XFrPB+C6bfI60RzedIZ2T/U=;
        b=LFRmRFanDoRDKC2eW0SPHa5HeSNvzjQsOLIaudSvEikNO94tp57dKPoIKykNzapvH8
         cFsPG4YrgIUqOBm5xQfIm5k/6mzf41NlTt5hTYI0d+Jw6yZMQGCBJkWr7df2uvLgx6TC
         3YN8VOEVC1XKudUWRE04J0QSmfqJkK4JFpMmeEtOuWLGqAYXLNpn/UtYnuPFZzIEF1ad
         3RvzMNtIsfDZMqLZQSFc+pIbRZE8PSdbpbYI4gkpCAJ+bkPr9LoYUpmxWERWhGkR9ni8
         FWd1SlFJkzvzpUShSCWxp8NBTRkqPvOWqIbkpug0oQTFP6HUaJ0g8E/4+ni9jtEPmUnH
         fH4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yn8OdjBo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5-20020a05620a44c500b00790f7d2d50bsi4930972qkp.142.2024.04.30.07.07.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2024 07:07:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yn8OdjBo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1o8D-0006rW-GU; Tue, 30 Apr 2024 10:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s1o86-0006qO-5Y
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 10:06:47 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s1o84-0003xk-KC
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 10:06:45 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-516d2b9cd69so6854910e87.2
 for <qemu-arm@nongnu.org>; Tue, 30 Apr 2024 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714486002; x=1715090802; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wll30t4lzfyIs9DXRAnPNddBWsjy7BQfhDRLiul3yl0=;
 b=Yn8OdjBoM8/bqsH+clL8h1PPu3iPSDNRiGRYL6egcuJuWpHmhNZA3prrKde8uWtxX0
 2BVkoTMm3ZcKwSBsBY13MVRW+gxu24zgsBNZPd/0GCbBZ8TRpCm+c17IPmnlDusZbiVn
 jn2n5RZnoqaxVirULtxWMUFEwRzNq8nqbwljdRnqlyq/y5WJ9NBIbtbwLVgS6Oe9YAe3
 QAOVs6mtdfaZZbS7IdDdUspr+QCttgPLGVCZiya8ZxbyOXt7TIm2DreA12zFfW9p0jh0
 19QQWNxWLS0WTABGOReDKZXuYHEV7B1xkqNdnKiNcttyJte/zpyRORSWbjaAN02cJz3m
 lJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714486002; x=1715090802;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wll30t4lzfyIs9DXRAnPNddBWsjy7BQfhDRLiul3yl0=;
 b=SXSC5GZpQe5GWULfuC0UJVQNgAIuHD+qK9wDbpdV6EXCRuydCEBWx01HngflbNrXne
 Nyb5hPbf2Znm3C1JUWvE1Vfe8Sms+8Pbk4ByOE4WfenPgQ/H6HHwDVE+UQH23N2ENUNt
 pwOlHKOClZ3UpHNNy1ineJv7FFg7uHwO0P9RMwyWzxx4FniRUSWpmjATXzWBA9+KedmP
 syJapeGbgh+uMp3JmO4/XUbEmsZda2/uvcX8xNVAuv66m7rZ2qso9c+NzGz/uv/rgN38
 M41bn8RsKT4VOxkJXUdGu9QE/fRERXt3NUvp0lNdzIoNloCxy3arl+sTyjc2l3gpF+Bf
 fngQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHPWd+Y6b4e4Mv864kYIdEvreccRc2x0ufr2kCpSRMoyGi3qjzPBcdQ6V9RK1WXNce17gteHepnjUDgquQSa08sgUG
X-Gm-Message-State: AOJu0Yylmzb5Weuv5g/wfSdgU3iJBOaOFwjZU0oR+NzZtfKbjABPCnSC
 pGN301q6uzIz13WXbaQPGIXRZB/lCMjB0nIdfWIgzp+UeXYY4FkQp/FGDhehMpI=
X-Received: by 2002:ac2:5586:0:b0:51a:cb81:8f77 with SMTP id
 v6-20020ac25586000000b0051acb818f77mr8492191lfg.16.1714486002301; 
 Tue, 30 Apr 2024 07:06:42 -0700 (PDT)
Received: from [192.168.69.100] (mab78-h01-176-184-55-179.dsl.sta.abo.bbox.fr.
 [176.184.55.179]) by smtp.gmail.com with ESMTPSA id
 h1-20020a5d6881000000b0034615862c64sm32153392wru.110.2024.04.30.07.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 07:06:41 -0700 (PDT)
Message-ID: <865b2cea-e345-4552-8b71-b8d505c8bb68@linaro.org>
Date: Tue, 30 Apr 2024 16:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/tcg: Make TCGCPUOps::cpu_exec_halt return bool
 for whether to halt
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240430140035.3889879-1-peter.maydell@linaro.org>
 <20240430140035.3889879-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240430140035.3889879-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
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
X-TUID: NXj8yoqG1kXo

On 30/4/24 16:00, Peter Maydell wrote:
> The TCGCPUOps::cpu_exec_halt method is called from cpu_handle_halt()
> when the CPU is halted, so that a target CPU emulation can do
> anything target-specific it needs to do.  (At the moment we only use
> this on i386.)
> 
> The current specification of the method doesn't allow the target
> specific code to do something different if the CPU is about to come
> out of the halt state, because cpu_handle_halt() only determines this
> after the method has returned.  (If the method called cpu_has_work()
> itself this would introduce a potential race if an interrupt arrived
> between the target's method implementation checking and
> cpu_handle_halt() repeating the check.)
> 
> Change the definition of the method so that it returns a bool to
> tell cpu_handle_halt() whether to stay in halt or not.
> 
> We will want this for the Arm target, where FEAT_WFxT wants to do
> some work only for the case where the CPU is in halt but about to
> leave it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/core/tcg-cpu-ops.h       | 11 +++++++++--
>   target/i386/tcg/helper-tcg.h        |  2 +-
>   accel/tcg/cpu-exec.c                |  7 +++++--
>   target/i386/tcg/sysemu/seg_helper.c |  3 ++-
>   4 files changed, 17 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


