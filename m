Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp193205njf;
        Fri, 30 Aug 2024 03:06:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPSyfrHLI7a77ZhdWs48n1uBjERRc99QJu8v9PJhXW7gy1UvUEBVZg+1qt1Uj64U1kFIpagMAto1cyTQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG9ZXkwc6Qjitn8IAyLxFl2+NffMHF6T8XVzTsdLccxgAFcvsLwerhdWh0Ox3mNIrnuEuPR
X-Received: by 2002:a0c:fed0:0:b0:6c3:4736:179a with SMTP id 6a1803df08f44-6c3473618b1mr19442126d6.24.1725012397782;
        Fri, 30 Aug 2024 03:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725012397; cv=none;
        d=google.com; s=arc-20160816;
        b=IZIKzW97vkvWRJuyT9OGvpshToqexJYCyQJKxI+yoL2uXQGPN7yFIaImfp7KjD5Wrb
         A9ejJF0kH/7M1Oj+XTzHWBtthikOLBNrK9PlyfdRDEDGaBmTraHgBx6C0WcwW4e2hT81
         A7GH9eQYYXgOTebAR0W2q6cI66zetr7Dn/9k31kmkGOjaM9aUUrz8nNXTmLipeLSqcnA
         fkt0qfTRq06aOkQy8JGI/JLhbEM8V02m1+RWDl7y8Cfd3+rV4LMlGKBMncKEs3A7j1MU
         sYaUIIqycgo6j12BbVO/YSQyTbQegTehpia9AY5lgLlORnNZxRNSrx4h9aeFVAJTWtY/
         CfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Hs2qtB5SM0sNGdXaCHjuSBmUfcX5uW/a41hVBlDatjw=;
        fh=Zb6IWOKaya4W1BPgwTkOQu9seWVYrWIuVzSaiscPQxc=;
        b=kWXB3vvyZ44RqtBpu4Vmv8KAx7ZtjIjKS6LV8p81js1fT34GRh1reRmCR/iwcm4crb
         Ja0ClJkDGmjcndI/QPd3c8FeBiDXvrQQIg3bHOXUw5r9EOHNxxvgiyNEl9cTEhFw3+cv
         O5o0+DmyGludrNqJgO0v8CNs/EKT9F/xWH+lxK6bgBG/rdhdtXqcRygqZWLHAC80ZMJg
         xTo9ifBOjbM3+OsBA96ogw4RoKVnaag1J5SUDWnIg5JOq4WrJc5sen6V8GhArEm35w9M
         npYoQOAjXYLNm1SMTIuATX01+cHKfd3tZcsOnSh+nzryDOY06sL3I6Smj9ZcPlH4OPju
         CmbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QYO9qw0Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340dc0da2si35333796d6.594.2024.08.30.03.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 03:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QYO9qw0Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjyWM-0006pj-Fl; Fri, 30 Aug 2024 06:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sjyWL-0006o9-5C
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 06:06:21 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sjyWI-0007Rc-6Y
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 06:06:20 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso1536356a12.3
 for <qemu-arm@nongnu.org>; Fri, 30 Aug 2024 03:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725012371; x=1725617171; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hs2qtB5SM0sNGdXaCHjuSBmUfcX5uW/a41hVBlDatjw=;
 b=QYO9qw0YqixTp5Ih8K2cOuUUaONUhny4s/yBuwBKbkQ8Lx5jwgR7xfmXtLAzBEnL4s
 mUL534wPnvnPvvO1xZcd0n49AqCpB1QSx3nUh4RQQOseAUs5Tb/uAZ6Cpac+YZqBgPIW
 IoFzsBRkhT/d1QtG18lu57GL3jIzlE1t8Mpzxwu4YEfYmBQ3845J0sxg3mLj9TM9GXSG
 f7TaMazZWWrmJUlJaXEFg/sCMu9Vxfm0gMEcK8t6h64xqsDRMGhESke59sjbbl5spnpG
 eVRK6xOiOGhR7kEEJUM6jMW50PgtVY1Mws3x61BnIB8CeOTnTIszlNSP7LmBo08Jrg17
 LrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725012371; x=1725617171;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hs2qtB5SM0sNGdXaCHjuSBmUfcX5uW/a41hVBlDatjw=;
 b=fi3CPhZd+glFbreD11FnjhdHrOXdQ1CTtE63ha+C3drGMRWt9TmoVjsyQHtjGCs5X9
 scMppyrVer5W6G4eC/MhTaYEFAoQWaSkB04wECiZ8q4y7jVu28cM2HnsGunX2O84ec+H
 3DnpuDZfPyHuN6Oj2AWIe8uhIIVyw/I6xPwdCPSfBl8SHN1Gs2nwN1NJTGquHX65iv8u
 EPcCaTeQ81zkvbqbqiE3u1dzJspQ2dWuOQJ78QR3KGq9pJqzd1/Wkkf7klEprq2iJOky
 9haMPRBiCPaJ+van7eZx45xopLmKT1VrVKk5cRN89w2YpaSAGBnTlwtWObJy/wgIY6eT
 +siQ==
X-Gm-Message-State: AOJu0Ywwn/R6txa/FVddHOOlcCiLa8PVyo3YuryXIkf3xW36YV+AUzZp
 KPSgFLhioxFes2bgu31X67SfH9AHxuxSEHm9hpAq2CTJ7Wlz2Apt0ZQ7GkSWxm9UH+pApfEKs6Q
 O1ylZ7R3XvBBYzAFTeW66YHSIlNAgsIf6RzMw0Q==
X-Received: by 2002:a05:6402:5d0:b0:5bf:256a:357d with SMTP id
 4fb4d7f45d1cf-5c21eda1887mr4395538a12.38.1725012370427; Fri, 30 Aug 2024
 03:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240830072409.2399084-1-changbin.du@huawei.com>
In-Reply-To: <20240830072409.2399084-1-changbin.du@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Aug 2024 11:05:59 +0100
Message-ID: <CAFEAcA995BnypV8Yx4fA_ojAt6NopyMnCWY8Gwb840++8kx91w@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: Report error msg if loading elf/dtb failed
To: Changbin Du <changbin.du@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gp1XiPXOVzRe

On Fri, 30 Aug 2024 at 08:24, Changbin Du <changbin.du@huawei.com> wrote:
>
> Print errors before exit. Do not exit silently.
>
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> ---
>  hw/arm/boot.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index d480a7da02cf..17c01f299831 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -839,6 +839,7 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
>                        1, data_swab, as);
>      if (ret <= 0) {
>          /* The header loaded but the image didn't */
> +        error_report("could not load elf '%s'", info->kernel_filename);
>          exit(1);

I agree we should print a message here.

>      }
>
> @@ -1322,6 +1323,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
>       */
>      if (!info->skip_dtb_autoload && have_dtb(info)) {
>          if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as, ms) < 0) {
> +            error_report("could not load dtb '%s'", info->dtb_filename);
>              exit(1);

But for this case, arm_load_dtb() should be printing the error
message itself (which lets it be more precise about what went
wrong). Is there a code path where it fails to print an error?

thanks
-- PMM
