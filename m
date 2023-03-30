Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1144656ejb;
        Thu, 30 Mar 2023 03:38:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZKUEVe8nx/9uoH1GbKSmrT7kJeBhddV7lUov3yMWcyE7+ebdDyMA3ABoIVrbO5bqb3/Cfp
X-Received: by 2002:ac8:59cf:0:b0:3e4:d860:e8f with SMTP id f15-20020ac859cf000000b003e4d8600e8fmr32423952qtf.59.1680172709171;
        Thu, 30 Mar 2023 03:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680172709; cv=none;
        d=google.com; s=arc-20160816;
        b=XTkus1KBOvaW4lvEjbnC52GZ8sDkyUMxNndDFQG3yLblEGvL5glnh3Hc8edh+s05F2
         h8IpPKXKLpCfUheAu3qHV9Rt6sgBJWBF/FwOx6NtNTfKsTwBQAlAhVQXzJuoag+nMk/M
         3GevJ4FhwfqE/Mzjo6YD0dOH3HNJCi78W+ZVCLNjHVzBTLqYcoHqr3ZmpgpxwQLoSaqo
         JJ655E2GqcVDnBuODT/wNCt7aax1hZ/tCFewne5w3aJSo6SlI+ZEWwptEanwqIWHRMK/
         +fP6yKkENbA6pubDwFFHiYS20s4vRb1QW2ES2k4vlhqzehR78AXk1ugrOm8prQwGMHm7
         pAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yYfqvxdbKSYzOasiZfDOePYKg7bos5ZxF5L5287U7wg=;
        b=SbOxFszLnCDqVTlLlvx6bXakho8CSw2/fTpCyQPLxDOreHI+KBM+xtsbOHVx7ld9L4
         T7Wl8Stjtaiz6WAVoNJVAP08/MYLzKJXZyB4FozYC5RplfM6ClDvxxj4rglyf2CqEhhf
         UF2D+FolgjB8TBH0xW03sxT6CRdm//095nVtBYIYbmz4fol+4zBbvqvYJBQDn0paajlC
         If63Cny/t7AnFe24hAtGA7K0uhI2dgBh2ueU1FQUtQ2ONeBiwZKsELYnNfdK7oIL9C3u
         7BVLuKXf0S07s805AlfN7eZ8cYpk5H6HUukFN3nfQ637KSjPToxyvdt5EXchtipPffjo
         LOeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OzBstowv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020a05620a284d00b0071ba5a5d06esi23815343qkp.451.2023.03.30.03.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 03:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OzBstowv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phpet-0007BH-5b; Thu, 30 Mar 2023 06:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phper-0007Ag-6s
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 06:37:29 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phpep-00053m-Jo
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 06:37:28 -0400
Received: by mail-ed1-x535.google.com with SMTP id w9so74625515edc.3
 for <qemu-arm@nongnu.org>; Thu, 30 Mar 2023 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680172646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yYfqvxdbKSYzOasiZfDOePYKg7bos5ZxF5L5287U7wg=;
 b=OzBstowvjs+Yfbir0NBjSutnomSc5OPPSIGczGhmdoWINd9+rGgY91ys6puwdReGb9
 thycke0oAAc0bgDICnkDhwCaoVZeSeE7YLaHlqo7WnF9CY2c3XvkljLIQ8JD422jCuCg
 C57Z60XmG6slZMAKWkj2W/jrYanDSgkvcR/LiPcrHJftKAWt2AkBcWjqe6U0dQ7dN5yx
 Mck1Y2fNKK/5FojfbhqpcLm+ZY0HZmyKkKeg4Aq0E4KwL11wRv10USVKPzfrNciJusCk
 /KZ2PZFr9HMtzNe43Dv+SLuLEZP6MQIQMZTwouOcHgOybAvx5Y32awVssZvGfFzqMCFT
 mveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680172646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yYfqvxdbKSYzOasiZfDOePYKg7bos5ZxF5L5287U7wg=;
 b=0n/ozpo7XeBLME2wIa7hqeSlNcsW42xMpScFEDQv9+JiHEh9xjSRqF2kfwPIa4l3uQ
 ONIV6GKYZBXJAEo+EHyIHd6vDocN/DH3NHGPt2V/J6S66nU0iob6BDNP6/tXRD9h+6Zk
 URKHeiyJUnRcvlFTuNQ2Mx9Iqz3W//pneL3MOdHylAlOwGFCzm3cBQH5yUcMOCZC0J1+
 qVw2a5li8s3d1dSnrztZFBtCbOuBfpxdezkxAFmFzAgj1hd05P/b/QKnXsmMoloYD7Un
 TE+w2icqXaAKQ2pQWayPn0wP4RfQREEcFqcLPNm99bzrFMR2yB32UEh3n9IhYjPQG6pM
 eeJQ==
X-Gm-Message-State: AAQBX9dLxsaLehb7g4OHV8s43LUz4YL1IB73hC9TXuoELoxhX3y811BU
 p2+ufZvdcrH2erwFYPQkZ7Pm/r+f/436QNw3yLs0zQ==
X-Received: by 2002:a17:906:4ac5:b0:92f:cbfe:1635 with SMTP id
 u5-20020a1709064ac500b0092fcbfe1635mr12046397ejt.6.1680172645956; Thu, 30 Mar
 2023 03:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230328165935.1512846-1-armbru@redhat.com>
In-Reply-To: <20230328165935.1512846-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Mar 2023 11:37:15 +0100
Message-ID: <CAFEAcA-=j4S+QWvK3=QjHV=QLymEHxtfju4YybhtSdrK5UuVUg@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm: do not free machine->fdt in arm_load_dtb()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: h16plA9IxgUU

On Tue, 28 Mar 2023 at 17:59, Markus Armbruster <armbru@redhat.com> wrote:
>
> At this moment, arm_load_dtb() can free machine->fdt when
> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>
> Since monitor command 'dumpdtb' was introduced a couple of releases
> ago, running it with any ARM machine that uses arm_load_dtb() will
> crash QEMU.
>
> Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
> of freeing 'fdt', assign it back to ms->fdt.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
> Reported-by: Markus Armbruster <armbru@redhat.com>i
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/boot.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 50e5141116..54f6a3e0b3 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -689,7 +689,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>                                         rom_ptr_for_as(as, addr, size));
>
> -    g_free(fdt);
> +    if (fdt != ms->fdt) {
> +        g_free(ms->fdt);
> +        ms->fdt = fdt;
> +    }
>
>      return size;
>
> --



Applied to target-arm.next, thanks.

-- PMM
