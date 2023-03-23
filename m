Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp23904ejb;
        Thu, 23 Mar 2023 10:39:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set/Ebyjfl3lsxL/95NlK4SRHg14umyfRT5f5RnLeLY2vSSDRlEmr4bLknYaP03TzbDbIEDTy
X-Received: by 2002:a05:622a:195:b0:3dc:91cc:384b with SMTP id s21-20020a05622a019500b003dc91cc384bmr398180qtw.5.1679593148320;
        Thu, 23 Mar 2023 10:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679593148; cv=none;
        d=google.com; s=arc-20160816;
        b=vbLoi8t2r30K3vE6uEQYBvH3XX6MbKQUrWuCHmq0qQWHG2Ibs4lV+8l7zVe2hKecVY
         cABzhuE0LU/9LmEwXuO2hvP7jkV3FZRWi6NpFzBrWzWKKyU+U4S0UdBgmwy/TC1A+XxV
         qpQ0191JJR5svaW8sJ4pQVDolAaC0r5JkKK/1WpZFxhZdp/tSfYLhVrJnVFLlmpKdlYk
         NZgpopWGOC8vC1xYN4mk7o+D6huwTK/oe6czpw0TiDw6vZFfUDtxZ/FYsi8uEken9831
         qcjiuBIbCS7MV8BlglJ8a/7NZx3SOTDKW93jq9St/VspCA5mDpCfUESLagmV2h8qSKTa
         A+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8lZgkD+XyrbFHFtpewsFKZ1wxbJtu/NYQEYIGOkTBZA=;
        b=uA6ZrPQCJHm4DsI1oBVQfFZyVJOuEdkD2FjSbPp56s/DL5SsgZTY75SRpiwbRzqGAn
         uWbN1MR5sH7st8ZW/1L2UbCHiLZ6bbc6kDh3PiRQBS8cc4X2D0A3yW8mrDmPE5ddWGTH
         En+O4x6JWQUQ/3eeGscafBt5/3Sayynj78fOEACOI2N+QbGF0nwK3hb+1tlbtjsQ9Nxb
         D3MtzTeRjuCmhUyc5KAC/9/83yKctIEgw3XzvrBz4hDbZbNLaDLXNS7foEDjn6ILaQV+
         7mtYopzJ3giB738mlqWRAvuFAnM903VhHVGTrgHEquFRfhUw3rfr6ACqc/r3flnfFssf
         vniQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ykHgvShy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7-20020a05620a298700b00746539f3365si7004253qkp.553.2023.03.23.10.39.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Mar 2023 10:39:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ykHgvShy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pfOtr-0001Tn-4A; Thu, 23 Mar 2023 13:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfOtp-0001T3-4M
 for qemu-arm@nongnu.org; Thu, 23 Mar 2023 13:38:53 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfOtn-0005eT-GP
 for qemu-arm@nongnu.org; Thu, 23 Mar 2023 13:38:52 -0400
Received: by mail-ed1-x532.google.com with SMTP id cn12so44505292edb.4
 for <qemu-arm@nongnu.org>; Thu, 23 Mar 2023 10:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679593129;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8lZgkD+XyrbFHFtpewsFKZ1wxbJtu/NYQEYIGOkTBZA=;
 b=ykHgvShyv5LEtEme7HcsUw6fLGYP9pdikk51fbnypOYzJ1uhSfeMF0nDmSEX/aBoi3
 QbhKcfMVT7j+irTOWN5lzfcv6ECbOtm0jWPiCUfkbaZybyqhlPQZEGgRE+ixZbd+gnc1
 QoTKEv8Lw1ozys4oM1G8DCun/NJ6mDlZpOFXdhDt+8KMH7lBRo0QWdkgSyo8KmFFoi1n
 pIWLFpE0BioeLMHBvOQFokTa/t+ffhTLTEptuTq0wWlAKUTSR8ofvHK6AWlVhrFSfZi8
 oUFjCy0KeMr1BEWWV55FgvO+nz9kNhBsTBH+ztB/DyTyQID1e8wuMxqntchaH34y5SSK
 y/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679593129;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8lZgkD+XyrbFHFtpewsFKZ1wxbJtu/NYQEYIGOkTBZA=;
 b=SdR2UEHJnVhkDca38npZij4+y5HAQTuARUnnGvKklneY5MinYr35IEB+juIuH2mrRC
 aDP5y1mqsh6IDNiSwN9lSYs183RHrcNy6cv2hnvNjsek/ldsTVtgL1khbdFyaX2eTxHp
 Cr7qyCbqFc22449EHgOI6gCXfs3qaBksUc6BMyTsctxy8+qtvTbyZEBOUtdkPBW4afHB
 eI0ECRImWUXsXUpMPyi6M4+aYersW32YGbLFbcVJVUFRjVei+ED1M5ncr89SgtkZXw1g
 3MtS2JY6WSfvKi56ucr6yq8/EVLYtVTuvC9RV1q1mKtSeomXKmCeBIgOXquO2By+W2cp
 mlfQ==
X-Gm-Message-State: AO0yUKUCwsS6un8ET/SLT1UfzuGZRNOy3NVwIU4U9Bz6QgupwWm2MJzh
 p53pbXtGJN7Ag7j2Es9dz3kBbG6BTsevTWDk/AlelQ==
X-Received: by 2002:a17:906:2e09:b0:878:4a24:1a5c with SMTP id
 qq9-20020a1709062e0900b008784a241a5cmr5536829ejc.6.1679593129619; Thu, 23 Mar
 2023 10:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230323161053.412356-1-danielhb413@gmail.com>
 <20230323161053.412356-2-danielhb413@gmail.com>
In-Reply-To: <20230323161053.412356-2-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Mar 2023 17:38:38 +0000
Message-ID: <CAFEAcA89KN5SEi5hFoKKpzVSo=xV3gCn7b2bMBhb5qoQ=U9_mg@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: CIUqsq1WKEra

On Thu, 23 Mar 2023 at 16:11, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> At this moment, arm_load_dtb() can free machine->fdt when
> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>
> After the command 'dumpdtb' were introduced a couple of releases ago,
> running it with any ARM machine that uses arm_load_dtb() will crash
> QEMU.
>
> One alternative would be to mark machine->fdt = NULL when exiting
> arm_load_dtb() when freeing the fdt. Another is to not free the fdt and,
> instead, update machine->fdt with the new fdt generated. This will
> enable dumpdtb for all ARM machines that uses arm_load_dtb(), regardless
> of having 'dtb_filename' or not.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
> Reported-by: Markus Armbruster <armbru@redhat.com>i
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/arm/boot.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 50e5141116..9418cc3373 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -689,7 +689,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>                                         rom_ptr_for_as(as, addr, size));
>
> -    g_free(fdt);
> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
> +    ms->fdt = fdt;

With this we're now setting ms->fdt twice for the virt board: we set
it in create_fdt() in hw/arm/virt.c, and then we set it again here.
Which is the right place to set it?

Is the QMP 'dumpdtb' command intended to dump the DTB only for
board types where the DTB is created at runtime by QEMU? Or
is it supposed to also work for DTBs that were originally
provided by the user using the '-dtb' command line? The docs
don't say. If we want the former, then we should be setting
ms->fdt in the board code; if the latter, then here is right.

thanks
-- PMM
