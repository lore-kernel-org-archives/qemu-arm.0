Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3490086ejc;
        Thu, 16 Nov 2023 05:35:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZyu0WlgVwT0f52XIvomt3wKXGdo1zmQmQHoVVHRIF5SLgJUwsBUFxA+MZCgIild00s9aA
X-Received: by 2002:a05:6214:560c:b0:66c:eeaa:9a67 with SMTP id mg12-20020a056214560c00b0066ceeaa9a67mr7945773qvb.62.1700141726196;
        Thu, 16 Nov 2023 05:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700141726; cv=none;
        d=google.com; s=arc-20160816;
        b=Mq7JGzW6Qt+byPV40mF3QpmRDFG25jrRoYf2quJKZJ1UFVS10MmAeP9jV8jn/wGgkg
         yIFDUa1bbztqQxZAd3vQBsI5up6sz4xW1IFzHB0Tmo8nHoJes10CZVCBfffuBgtJY8+X
         SjcK7wycz67hsWEhhSTTxXP7+deH4ARhTdxnsFdsOGqKcIjVPeS2ReA8SpAT4zawdrT8
         xaPDXMRFLO3S/6RGduZo6bVos+wPc6dNnQPvem4WPpChC6A3zzsjyPt83Jn+SAhbMMMo
         82U0gutxnnZvH8YjOzg+D1J2oWuowRtSl+Xfzfmi1S9Jgpa+wpZ198CO0AFYuOomb0h/
         VzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ieXCHt2U5ZDum61SCHZZRrc1OHNhppLyWsJdB0gRjXg=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=iKvGL3aZ0MjsbZkOY1yJO8HbfOzJTx4AWSdGiuP1WYiBFD3+4WjvC2ZhUF5FJycC9G
         uJKedmvZ0vzjdnoN9emjceBZmJ766is0Xi/626P1OV0tkLiobVe3eLqq7XFQET1cBUo9
         +90+Too36dIxvYYWva6+3TsTUGBfMwvO2tBuzAMkTxThjnzs221efSTJ44RiTCTfQv3d
         WncxWkUGUy0d5MNIGm/Xt+5EEXjC5dLNutI33wIVrPrCXvPj5jNNrsaYpMtLP38HoXup
         vSQ2SjCA6vDRHX1wdMJurYn+Mi0fsxwolgw9xk/U83UyU+Y4NNkh7ntcLSMbF0mym9pt
         EOPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kGs2z3nC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020ad44443000000b0066d1e996112si11426751qvt.135.2023.11.16.05.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 05:35:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kGs2z3nC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3cWb-0000ZJ-LV; Thu, 16 Nov 2023 08:35:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3cWZ-0000Z1-70
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 08:35:15 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3cWW-0004q2-HW
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 08:35:14 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40a4d04af5cso5877545e9.0
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 05:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700141711; x=1700746511; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ieXCHt2U5ZDum61SCHZZRrc1OHNhppLyWsJdB0gRjXg=;
 b=kGs2z3nC0JZfABDV7KcwrkJ75ELv5oW1jmBd2gidUZw3QXWXOMNlOhpFHbHJm8IKr/
 yFih4mjvB9phaA6OT9vn6iDFeUzZq+ZY6Po7bKaMtqMj1hIPyakoKFXuT/DhSmzluStF
 r7LAttimX3l4pxZkbc1+yWIq2ylUslHiKHv1EhptOTsIzyKxNpC7kbUaU6J02KIqcyRB
 zltff4DB/zU0Cpv+fzB8YZSJJLqNhwBFTw1TnN4+FEoRXPH78WJuf/EN6uox4C1Deppl
 kN6zeTb12aWM1yrkuA6f7ptMgY7DSHOLHT4o4OdWDFUd98PhFzfOvDckag4vXP0rDZrc
 9y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700141711; x=1700746511;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ieXCHt2U5ZDum61SCHZZRrc1OHNhppLyWsJdB0gRjXg=;
 b=mvBaJCzRGsow2p4+IpihH/RPOm6VguD2GWWW/bZ/UoS0eeCa6NV9lDDpg1aCWpZunz
 HXe3gF8H0N16i0WJZ34dyu9/YxIwpJXGCsCdYdzU7aR63L0oxTD8WjHtm5lQ9xw1lbSc
 DMwnstbNe5wzjOvRufaXulNPLqeDkhJqBOwvDwPA2beeBhYfuC8VaZlAhcXbVWsTlVYM
 dFU2qtUjO/cSNbkrFWll1NLT6whkMpnh7s2lScjyPP7z6srGYmUYdTrC7PWDspL3c0Nx
 XXYaQGvXqVC6zO59A4odNB3vJ1X1RLJC3gbAhCJWyuGjhaidI3cnFq+2uTg03rk2fme3
 f5QQ==
X-Gm-Message-State: AOJu0YzD65Q0CoCnkvtDRq+EwI6YBIEOgcF94EOwbsNHQ6ZL7Olt0bSB
 CYCWTfxIZCA3jo7NyNndGe2rOF2vjc8dEeLed00=
X-Received: by 2002:a05:600c:3548:b0:409:231e:2a69 with SMTP id
 i8-20020a05600c354800b00409231e2a69mr12124842wmq.28.1700141710802; 
 Thu, 16 Nov 2023 05:35:10 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 k27-20020a05600c1c9b00b00407752bd834sm3838207wms.1.2023.11.16.05.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 05:35:10 -0800 (PST)
Message-ID: <efc49f7b-70f5-4ce9-8179-79e8a6abd732@linaro.org>
Date: Thu, 16 Nov 2023 14:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/31] Unified CPU type check
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: sMbdcb9JL4ax

Hi Gavin,

On 15/11/23 00:55, Gavin Shan wrote:
> There are two places where the user specified CPU type is checked to see
> if it's supported or allowed by the board: machine_run_board_init() and
> mc->init(). We don't have to maintain two duplicate sets of logic. This
> series intends to move the check to machine_run_board_init() so that we
> have unified CPU type check.


> Gavin Shan (30):
>    target/alpha: Remove 'ev67' CPU class
>    target/hppa: Remove object_class_is_abstract()
>    target: Remove 'oc == NULL' check
>    cpu: Add helper cpu_model_from_type()
>    cpu: Add generic cpu_list()
>    target/alpha: Use generic cpu_list()
>    target/arm: Use generic cpu_list()
>    target/avr: Use generic cpu_list()
>    target/cris: Use generic cpu_list()
>    target/hexagon: Use generic cpu_list()
>    target/hppa: Use generic cpu_list()
>    target/loongarch: Use generic cpu_list()
>    target/m68k: Use generic cpu_list()
>    target/mips: Use generic cpu_list()
>    target/openrisc: Use generic cpu_list()
>    target/riscv: Use generic cpu_list()
>    target/rx: Use generic cpu_list()
>    target/sh4: Use generic cpu_list()
>    target/tricore: Use generic cpu_list()
>    target/xtensa: Use generic cpu_list()
>    target: Use generic cpu_model_from_type()
>    machine: Constify MachineClass::valid_cpu_types[i]

I'm queuing patches 1-3 & 5-23 to my cpus-next tree. No need to
repost them, please base them on my tree. I'll follow up with the
branch link when I finish my testing and push it.

>    machine: Use error handling when CPU type is checked
>    machine: Introduce helper is_cpu_type_supported()
>    machine: Print CPU model name instead of CPU type name
>    hw/arm/virt: Hide host CPU model for tcg
>    hw/arm/virt: Check CPU type in machine_run_board_init()
>    hw/arm/sbsa-ref: Check CPU type in machine_run_board_init()
>    hw/arm: Check CPU type in machine_run_board_init()
>    hw/riscv/shakti_c: Check CPU type in machine_run_board_init()


