Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1446565njf;
        Tue, 3 Sep 2024 06:56:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3TmaLw/Vo8jf+NafEt84bALNwJVeuO6974Zvpon/RxBrDSAOBAcqHyj81Rktcc9nQLlF+4+UUIwYASg==@linaro.org
X-Google-Smtp-Source: AGHT+IFj4by8BgwN+ihvat9wrKEHYBlVz8NBLIs9HdOp7fdxBxSTC2/+IbqtkEI5TJKjE830dSnW
X-Received: by 2002:a05:622a:993:b0:453:1554:c49d with SMTP id d75a77b69052e-456fd7d75d7mr162621821cf.37.1725371812866;
        Tue, 03 Sep 2024 06:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725371812; cv=none;
        d=google.com; s=arc-20160816;
        b=ixwfc450ZyhMqa+v1EVmgJKR0uCaHIDRs/jlkeasybggV1FY6+JNJmVLOAlByJextq
         kaZDu/sLxgzYt/8mA7FX8eYO81s+cDd+Z9LA8o7ilF+V/Li2/r6vgomMFqN3OWiEHdiW
         b5kLPmyXILzPTgERSgcYoozzpNNe3FIwctfVHLQmODoNTHoax97Nd5wtqGujXmzZDfpx
         OVkzoHNPmgs6p2tYy+Rv7yrO28rxGxvRRwiHnh9KXAPs1B1B0G4nuvxhb5Lz+us0d3K3
         BNozq7eJyBbYWS+NwNBOAjyh312Uf2qUZPx+Zad7f7FDXqTR3XT+X89H86MbME16RvXH
         y+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iyhyKKNbAioC/v2WSZKWMCCWw4390pMeuUWRxAfiFew=;
        fh=ALOxJvXo7SIw/tDyYye1D3LQraA46lA8q52bUkGfsCI=;
        b=Hcwk5LYCCLuiaj9Ol8WyKXMFfZLFKlEG9XTePFp6x840QFCnJlYqifmVq+AhCjFpG1
         8dDAUEO5oXGkoSXe/hL09sZy8v7qGrrbUJ/g572MmSTHpshdQ4r1ZdQ5VFPzCxYi7D0c
         hGpEuQX+cpCI3H4ZmQRO+gpPHN7lB8NzGrDQUWGZ8xTc9lKYY3rLMNVZPiEhCW0n9Azb
         JvMIF8/DygUFAW0Zm8NpK+U9HCKomkurln+Z5n7C/FksrNEozBsOvM5Akn61Tpf6xlXK
         W59epNEW0OzeyrA0G/iOQFEJ3T3X0TJKxw2+Rn0kbXcM07K+CPONjBTM7hYrMut1dFBi
         5FYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QgzaomQb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682db1000si127098101cf.541.2024.09.03.06.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 06:56:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QgzaomQb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slU0A-0006Pt-5l; Tue, 03 Sep 2024 09:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slTzp-0005KP-CD
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 09:55:08 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slTyr-0006UG-QY
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 09:54:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42bb4f8a4bfso29205535e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725371553; x=1725976353; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iyhyKKNbAioC/v2WSZKWMCCWw4390pMeuUWRxAfiFew=;
 b=QgzaomQbkiRcT4OyMR/O0EU7JnNFLDW9/j0Qmphy18rEmtr7/kWaTz7PO7Yb+bFQyj
 T0xwts7iDYqSetTw8fggEShIRm/nQa/G51sWUB3ima6Gv3++UAK/4BkdJ8WvCaL0HyIZ
 7Yuow2d55UQ+1rRmmNci4KugFaasUM09W4ulwrW8u3y9Tx+CBVqE6CJJZH0KsuH1xE9g
 pVZuGp9aMgUfwTEiQhBVSoS3DKL55vy21ish8hvmhbEEFDu0CZWGoJ2sVlK323xsJZxu
 ThRtgfhB90bPVuJffhjYU98C+TLURV14P0JqTVMGX7fLmPgkQNcPWDEv640HxIH2UUdU
 nQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725371553; x=1725976353;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iyhyKKNbAioC/v2WSZKWMCCWw4390pMeuUWRxAfiFew=;
 b=f9DIwcWpv9iHME6EWKb99SFdG0eMR9e7v3AbLQM4aw+xfCk+J42MmaX1cR7Ox6twb0
 h+Y+kdX1tqA/YHra/N3VmzL3dHBQVlTuY9qUGo8eAp0WzqWbWLvP6+jAbN4ct07H/wA3
 x5yJLltkGEgfKDozrYnQZgGRM+elfn6VDzpDleLqx4VSR8x8LvEzOxQR3bPJWS1POsMt
 mWj0lOD40QORcVt6iYzIRj+kzUGvGt1dGLt998yCZAKRIFsktUSiOyQqWW7FrcBrAJg2
 YxHsZnLb1u+Wd7fsssA/7aujrjMJiaWW4Ypb0HU6YaIf/Uq2613cRWKzwH1Z56fIAOcV
 Pjjw==
X-Gm-Message-State: AOJu0YyM5RNfK6+OIYWlPWqIzLV0jpCZlpuXhfRTi0SwworCECNst78Y
 n72qTb1eyjn/FaddcZvN8dNR6gNytK5DzrcjUcrJmbp/3f5908Ha/TqFItxGzO2yMlS/O0p3DuV
 k
X-Received: by 2002:a5d:6190:0:b0:374:c7cd:8818 with SMTP id
 ffacd0b85a97d-374c7cd8a12mr4630236f8f.22.1725371552637; 
 Tue, 03 Sep 2024 06:52:32 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b6f7ef8esm11309329f8f.8.2024.09.03.06.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 06:52:32 -0700 (PDT)
Message-ID: <cceb62dd-742c-471b-8b4c-6bfc304d4565@linaro.org>
Date: Tue, 3 Sep 2024 15:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/arm/boot: Report error msg if loading elf/dtb failed
To: Changbin Du <changbin.du@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240903133940.3447430-1-changbin.du@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903133940.3447430-1-changbin.du@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: Db3Qe3AzWFOf

On 3/9/24 15:39, Changbin Du wrote:
> Print errors before exit. Do not exit silently.
> 
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> 
> ---
> v3: use load_elf_strerror() to format errno.
> v2: remove msg for arm_load_dtb.
> ---
>   hw/arm/boot.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index d480a7da02cf..6c895e05cbc0 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -839,6 +839,8 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
>                         1, data_swab, as);
>       if (ret <= 0) {
>           /* The header loaded but the image didn't */
> +        error_report("Couldn't load elf '%s': %s",
> +                     info->kernel_filename, load_elf_strerror(ret));
>           exit(1);
>       }
>   

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!
