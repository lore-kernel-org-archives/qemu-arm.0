Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3365963lfc;
        Mon, 18 Oct 2021 12:48:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHFfviQBG5uX0AdQq1QCWJf7/n/OkPHDoTL9LKtoI4anc5eBGJ26nLt55hTVhyUOEXVthU
X-Received: by 2002:ab0:30b3:: with SMTP id b19mr28458818uam.123.1634586525609;
        Mon, 18 Oct 2021 12:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634586525; cv=none;
        d=google.com; s=arc-20160816;
        b=KyqvKOscuD+dXGGFGdn+tsWAuKH9/gk40n+PV+lTy60yB2gA7yp8L7zBlZTEIsjWLA
         LDdlQRvMu612MxWQjZU3jlduFxDqnJhKj8SP7Jrv2TD+fOrinkgnXk0xa3+kXSKKbwLa
         bDVTAZenSS1AZn7O9xcnNNdMbK4/nNhMpNktAjdHV78VeJHNQbQJHA8qvz1Iup3rYIbh
         PbkuLEMwHBufIRbuaarkPhP83cE32xULJPmYOe8IV54fejAcx5Dd1GMmw2Zi7NpTGXGQ
         c0MZAB26qb7r9eJ/eFJJ6CkjGiJKhRRClVyi3/20vnB1toGZ7DalculhlAWIh2ISpPe4
         dlgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wlEMkuXMIyJbCML+U+ZhdvWUpbge7CtMZ1/LlS3GgEI=;
        b=lbelFsC1K7yXbC7O6daGMc/W0I3nXiLP9b4U/qKG2q5fkMAFkwOZtZNQE6110i9vQY
         ARFzExBRyKYSqYNZUoEuY+yr6PWyiAoNwZdchxIOgrnMbX4G50BbtLmi9N2Xg8FLyoiM
         VmhB/FQywk4Paxn+PrMBR9pm3mncXo+reFYXTCnS+VO0S/O7T7qVD7lS+nc3WlTXzyJE
         czjEy1nXVmLo9nc6XEUijtDGxMb34M/cKYTThVtQ+jVxhjxaFEpd4da/RnEr2jRzXvQw
         OxHDrtA39edh0fua6HCrmFjmz9/GxZiqilkRq/XGQnpTLtQ+KzNutmqAjHLtrAdmHtG+
         p14g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R2wotcPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x21si5710500vsi.377.2021.10.18.12.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Oct 2021 12:48:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R2wotcPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcYcm-0003cb-UK
	for alex.bennee@linaro.org; Mon, 18 Oct 2021 15:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcYcK-0003c4-NE
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 15:48:16 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcYcI-0007GM-4X
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 15:48:16 -0400
Received: by mail-pf1-x433.google.com with SMTP id 187so15550375pfc.10
 for <qemu-arm@nongnu.org>; Mon, 18 Oct 2021 12:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wlEMkuXMIyJbCML+U+ZhdvWUpbge7CtMZ1/LlS3GgEI=;
 b=R2wotcPswfoXm9sGP7FTU+sBbZZu8nPnEh5NYr012bwElbhyynXnG0QgCZ3+MNKWHo
 VpjS8/voeGyJXDKyw3DtPaAHGSKSzO8B7by7S9i7SyuZb1IS6wneLMVBrRGvX37gG7rs
 doXvX9PZZtfpf79iZ1EmMJvfNUYk0wg9pmosphW8fDfNxdWod4do/wEVZ2KblOSjYGAw
 8VDt6vaLxJa4xAu6mXmRlCGxoLk8H5GZdeWQBBoT2acJ5ahZgbAAlwx22MFKgBGV16lG
 zs5p1HRUdwOie1U1D+f3hCd2N1aNmsFkffScMDPbUyBekGxpU//f9ijqJ3m2BYSAo9lK
 shDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wlEMkuXMIyJbCML+U+ZhdvWUpbge7CtMZ1/LlS3GgEI=;
 b=HYbzkhLJ+UY8o8nb6M+aX3kBy+S80BGc1DIcQCkH6Hvrp8mgOC5KCB+ud16ZRUMvtn
 S8sxPJji2b37bgelnQ2plrrOprf8miDQuNfx8PHb5hwWvCk0T1aLq1tJEvUTkn6FHHso
 AxV8Zc5DoAY1EP+czYIDBJKbQ+lUR7kst2jYMw2UWIHtbZcUSRzRArYYeGKECMyZEw0t
 rNwTxvQuZrJx4hS+JsFdblsRKYYY5xH4qjgxfBlm4hZEkr/xXYn96CwavagdX38p09B1
 wMmkCQkXB4Xiyjn+AYlKyA6uP2nv6MBeGz6g8b0G3fPBKH5P+1YU8gcli+ZpS6OC4pby
 HV9w==
X-Gm-Message-State: AOAM531b7XM0VdQFA5qONIPzDnvORJJJY6bcsaBcfz/d7wjbVAmOQjkK
 S1tt8YtgkEYHMzKxGXsbUByy9g==
X-Received: by 2002:a63:9d8f:: with SMTP id
 i137mr25042241pgd.323.1634586490810; 
 Mon, 18 Oct 2021 12:48:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z15sm14511276pfr.92.2021.10.18.12.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 12:48:10 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/sbsa-ref: Fixed cpu type error message typo.
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>, rad@semihalf.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20211008063604.670699-1-ishii.shuuichir@fujitsu.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5e6c5f18-544c-4ce2-6235-e0b6a4e267b6@linaro.org>
Date: Mon, 18 Oct 2021 12:48:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008063604.670699-1-ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pZfWR8Kh5J/V

On 10/7/21 11:36 PM, Shuuichirou Ishii wrote:
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>   hw/arm/sbsa-ref.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 509c5f09b4..358714bd3e 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -670,7 +670,7 @@ static void sbsa_ref_init(MachineState *machine)
>       int n, sbsa_max_cpus;
>   
>       if (!cpu_type_valid(machine->cpu_type)) {
> -        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
> +        error_report("sbsa-ref: CPU type %s not supported", machine->cpu_type);
>           exit(1);
>       }

Queued to target-arm.next.

r~

