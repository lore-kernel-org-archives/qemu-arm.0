Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2594568ejh;
        Mon, 5 Sep 2022 14:21:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6HvHNfTSYnuVoQt2LLzhZulNDiepfuIL3iQK5ORrNskxOxf9ZwlLzMjBaM8HYgYB6RQkj/
X-Received: by 2002:a05:6214:2387:b0:497:15b3:f792 with SMTP id fw7-20020a056214238700b0049715b3f792mr41830269qvb.118.1662412874454;
        Mon, 05 Sep 2022 14:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662412874; cv=none;
        d=google.com; s=arc-20160816;
        b=p1qEJQ+7l3aFK/EGR5EU0PlR2mPoEtHusXG2VQcVm5FTxt1c2tpfAXqdBRYdKQgxf6
         zi9KuKgnp9HbWXeF5tyiQcJ8A6eTjZJf/07CQC6NvUz6F34z0Y1MA/SWkbwvMTxxvA1l
         dHoEHtZStD0G+h2jKwAgg7WlJYqLhA0+GnBhm/YR4eTax3auqWboiToccwk/YzkqRE/9
         pZ0WusAUqxAUZMNAK7s8VBnutpssoCVum5YPVp7QOcRAoBE0OtroUgHYpeYyDTN2XuvX
         STTmjImBKtIRaGqwyPHoMcYF5HnP9pqD1TKxkJ2Oz4W5IVxWkn0c0AMf0tlri89CJY3b
         NTjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xnTM6EdMzbw4HntlBgQD6qYDXKhS5T/ojEbT+aURGjI=;
        b=ty6FbhFu4XHtMAn3aG6fZFu0Iu3rKh0j/WEVbn8Ouy/rscP7CchOMlVVLaytDAT3gH
         QhLfAJnohhCdoyCHKTCyaEoawNSZfRMD4BAn7QfNxQAElLDJwrv773cnrqjSzdLosDvl
         3yOHqFmnG6LYlysYTA96tQ1rvTNiulBzNGl8sXh+5pPNhOVg4tUi7S+89XvOBCp44CvB
         7BaDqWo7IJHx+XKfUjcCqXq69HS9e31NLxFciunOU5MetWyruztSRtN1fTuaOboKyr0/
         QR04g4ITvrv93uGZoteBEPBXgmRczfFzdverksNyOx7k6lS40+8ykbEn2DVoF/24ll0H
         Xn0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zlnZDzzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a0562140d4300b0047b295589d2si6064055qvr.554.2022.09.05.14.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Sep 2022 14:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zlnZDzzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVJWs-0003YK-0x
	for alex.bennee@linaro.org; Mon, 05 Sep 2022 17:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVJWY-0003Aa-Tp
 for qemu-arm@nongnu.org; Mon, 05 Sep 2022 17:20:55 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:42636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVJWX-0004Q6-23
 for qemu-arm@nongnu.org; Mon, 05 Sep 2022 17:20:54 -0400
Received: by mail-yb1-xb32.google.com with SMTP id 130so8683604ybz.9
 for <qemu-arm@nongnu.org>; Mon, 05 Sep 2022 14:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xnTM6EdMzbw4HntlBgQD6qYDXKhS5T/ojEbT+aURGjI=;
 b=zlnZDzzQmiME7XXYM/AZdU546fEhC6jwi2sxJTksaIwgrshXsUnBx4+0P0/thWvINz
 MPDrsdAkxSOQONaSLWVfxU2tWdk+BnLIO1idmQKqh2E9Sea+/nOgdZxAfa+3baFj5kGG
 G5b1MTVWe6fxIs4JPYTVutFbQQxV097KKsYCPIdQgIzeZ8jUNcZcSm7AngBuJ9LEr9SK
 LQ8SNfJ8KbCiCyvFMy1q4XpaX4S2b3rcBr20Z4HO6GV/fw7kKeZpt2tbHcembY+SPbAS
 BNls2Aub769UlftrzTwzImDZdcIZVFrgA9F4gYvt/5U/Ae5Hkglyl4hLZfbNQpSC3K3H
 BtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xnTM6EdMzbw4HntlBgQD6qYDXKhS5T/ojEbT+aURGjI=;
 b=v/vcOs6hl1Vlte6iHpRK2AKGVnOt7oGmQpJenaK7h8u5IQbmCheaxXs3ygCLlk85SE
 LXgf9AlzuBX3YfAZoANKImi1udEfa3ngPgIo7VEZCXyZrEekml4ohvyVgr1gFwxI4P01
 vcJBH7E9ERRCWcHQKZNn1Wvqfh9Nt9QYoUhjFhtBIXdS2zrefR8YLlUhLXAtOFYMrinb
 qPUbaeOYHVgyeSFSalJu8M+INfk5m+C8lfW3aizvF2cJpNGmhUVQ2OZZ7jSw6W4nKR1v
 wjEGQr5cpyg5UKJjxyC/s+7RdS9G0MZxC6BNYoNpmFthg/AnnDDtViugJGbEYrAGqz68
 L9fA==
X-Gm-Message-State: ACgBeo0KKjVMVAzvSfjchCTSOAf39eIi1lx4Y8OLmdiYOzIG4Ii2uq2E
 gORBDaKDZimC+7+IbBi3oea/sixjtDu61uZz0FG8Ag==
X-Received: by 2002:a05:6902:1612:b0:6a8:e6b3:36e1 with SMTP id
 bw18-20020a056902161200b006a8e6b336e1mr8238414ybb.39.1662412851314; Mon, 05
 Sep 2022 14:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220905182238.374545-1-sunilvl@ventanamicro.com>
 <20220905182238.374545-2-sunilvl@ventanamicro.com>
In-Reply-To: <20220905182238.374545-2-sunilvl@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2022 22:20:40 +0100
Message-ID: <CAFEAcA8QKs7foPWyf_OgEQog=zhfPNnz5dyevDXjPSXrVkh9sw@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] hw/arm,loongarch: Move load_image_to_fw_cfg() to
 common location
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>, 
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GjdpVfP1exK4

On Mon, 5 Sept 2022 at 19:23, Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
> function will be required by riscv too. So, it's time to refactor and
> move this function to a common path.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/arm/boot.c             | 49 ---------------------------------------
>  hw/loongarch/virt.c       | 33 --------------------------
>  hw/nvram/fw_cfg.c         | 49 +++++++++++++++++++++++++++++++++++++++
>  include/hw/nvram/fw_cfg.h |  3 +++
>  4 files changed, 52 insertions(+), 82 deletions(-)


> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index d605f3f45a..3f68dae5d2 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -41,6 +41,7 @@
>  #include "qapi/error.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/pci/pci_bus.h"
> +#include "hw/loader.h"
>
>  #define FW_CFG_FILE_SLOTS_DFLT 0x20
>
> @@ -1221,6 +1222,54 @@ FWCfgState *fw_cfg_find(void)
>      return FW_CFG(object_resolve_path_type("", TYPE_FW_CFG, NULL));
>  }
>
> +/**
> + * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
> + *                          by key.

For functions declared in public header files, put the doc comment
in the .h file, not the .c file, please.

thanks
-- PMM
