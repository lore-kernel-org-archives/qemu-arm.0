Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1707983lfc;
        Fri, 28 Aug 2020 12:05:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNz7zIjrvh1o4ciV6A2tFPpbEDFXBMmUg0lD+yXsCDeiQOJ+O93qbzeh38MiBA26v7VEcn
X-Received: by 2002:a25:da82:: with SMTP id n124mr4286907ybf.366.1598641521739;
        Fri, 28 Aug 2020 12:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598641521; cv=none;
        d=google.com; s=arc-20160816;
        b=uFepbU88HVbtqGsDCapJ1pD1YiOQwDcsEA8uW46z2epQTSPDv5pi2dIjiXYWRyaw4U
         g3XEshDXPkAsOinIPNpfGghmWuWH5TTEgWet+yZnX2Bf4pVwAhmfFt+EXZ0DrOsC3bqE
         3+WWelxDqtBkh27duR9fk7VolAaApCT0f0beckWqu3x+oeyi4nGdz9l0YA3EJVM24nO7
         VLAzL9qJaHyMlttBqnoTxgiKjOWK3aLShJ8DwgaqU08Eo0a1Dtg6uFOBwNd9R7Cjs0Wi
         WDsBzFlsBf84dqIS7Bo0WCCQGLlRYzosPxoYfZZW62CB5sk+PGEaaK+7dPtQwGLDmp3k
         w8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GlKzTO5F2KNBvSeehU+dY+HZdAprZs32LYHqu1SBBZE=;
        b=SrZD9Rgyl359c+s/dJw9W+dFfHFm5hBPzk0snycbOFdUtWPUD2RhSMIWMsrX1hSQbB
         iQLf78wfAhOYwYEdiikFsWQzpsJ1fONWNKuZOeaGRSsACvBxmywQo7b/+p32xvryfxxg
         I7cPLUW0wnUqAJqqca40xbizFgELDjIPN206uni3HR3mDvS5VKmK/laWpa2z4Xdt2k5j
         kaAgcFa8rSIqUkPO7TLvOKikxmXOH6r7aVB65Mqk22NMPkpiJVzkBUVOQ9WntxZdRGgn
         wc5mfpwOAFeu07seDNPxcmKCXkZU5IiX27IjbQx9MbtUgPq2gyO1KPh2N5eYDDb06tMv
         zCCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pWJWQAnI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w138si126894ybg.423.2020.08.28.12.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 12:05:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pWJWQAnI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjgf-0001ua-3Z
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 15:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kBjXb-0003Y6-HQ; Fri, 28 Aug 2020 14:55:59 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:46354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kBjXY-0000WW-PA; Fri, 28 Aug 2020 14:55:59 -0400
Received: by mail-il1-x143.google.com with SMTP id c6so1522704ilo.13;
 Fri, 28 Aug 2020 11:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlKzTO5F2KNBvSeehU+dY+HZdAprZs32LYHqu1SBBZE=;
 b=pWJWQAnIFFEMvp7byXaJD5HhyMw6LsNNCErCXPqGAdJMX64cQD7vFDK89ZIvkF5JfK
 WwDpIOZ5uTIkvayACsx+z/f2jVA+MNiezAU+khTAgiu2g/3Q4pgg7FO4tXc6eRwYRBoE
 PG/CcH+NS6vhNimsAkFXL62vVhE1Oc7RHZkajCg3aIvkWQIxlPiSu1Q98ePDS5Kw5UQ/
 StdYKrduQBGI8ejkDp1IxT+ksa8glNeqxxdpselE0qrdrmW6HGTdIfLtMOvRS0ysSlJu
 NQ5DjF6+fB1fV7qRn6ZZawp/+nVumHBxEHIC4dskNK+Ds6xj+XHbk1+tucDf4kc8Xe/R
 +QkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlKzTO5F2KNBvSeehU+dY+HZdAprZs32LYHqu1SBBZE=;
 b=cyr/vXVDrdX5sN+0tOljbhWLwkguUgjnKZeVZHWPIhQSG2D56DWYu/Edr70AUs0+hN
 24HBr56BumTox+9h6ZUM5OW+3hEbkZDV40C9mCb0Js4Ia1Oj+9VL3H5L7etKv2sMbqey
 4dETiEjSLV41SSPOT2DRTojcwTH+uQY+CJPNQHCHfCj2NBs9AIeMO4MVkTOu1V5PdvFC
 O6osXs0MPHCwLR1jK0PXWu4TaSxNMfRbclUrR/ou1zzp9PTAgqC5gNQqsHkaGIAhR+l7
 bjeLSC8aBOwXec1FvLuKtdVJpF7CAtjjLtsOQgGLGQlvvPcTiG1mRAogWObEach646t8
 lc7A==
X-Gm-Message-State: AOAM532yqVMmfqYL8KK79tSwPleHZGb79m2JYvnT+Q9duN3DUjPycod3
 BaB3qjR4D/UiWmHv5ZjxZsqx3isXINIvUbmBiq8=
X-Received: by 2002:a05:6e02:13f1:: with SMTP id
 w17mr253539ilj.131.1598640955031; 
 Fri, 28 Aug 2020 11:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200828113931.3252489-1-edgar.iglesias@gmail.com>
 <20200828113931.3252489-2-edgar.iglesias@gmail.com>
In-Reply-To: <20200828113931.3252489-2-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Aug 2020 11:45:07 -0700
Message-ID: <CAKmqyKOoEh-grrCesQWRy_KD0DfsCAYR3BnCNXW7kFk1RK7BgA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] target/microblaze: Use CPU properties to
 conditionalize bus exceptions
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KGBIubXG3v1R

On Fri, Aug 28, 2020 at 4:41 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Use CPU properties, instead of PVR fields, to conditionalize
> bus exceptions.
>
> Fixes: 2867a96ffb ("target/microblaze: Add props enabling exceptions on failed bus accesses")
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/microblaze/op_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
> index f3b17a95b3..13ac476199 100644
> --- a/target/microblaze/op_helper.c
> +++ b/target/microblaze/op_helper.c
> @@ -490,12 +490,12 @@ void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
>
>      env->sregs[SR_EAR] = addr;
>      if (access_type == MMU_INST_FETCH) {
> -        if ((env->pvr.regs[2] & PVR2_IOPB_BUS_EXC_MASK)) {
> +        if (cpu->cfg.iopb_bus_exception) {
>              env->sregs[SR_ESR] = ESR_EC_INSN_BUS;
>              helper_raise_exception(env, EXCP_HW_EXCP);
>          }
>      } else {
> -        if ((env->pvr.regs[2] & PVR2_DOPB_BUS_EXC_MASK)) {
> +        if (cpu->cfg.dopb_bus_exception) {
>              env->sregs[SR_ESR] = ESR_EC_DATA_BUS;
>              helper_raise_exception(env, EXCP_HW_EXCP);
>          }
> --
> 2.25.1
>
>
