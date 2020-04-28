Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5830196lfm;
        Tue, 28 Apr 2020 11:05:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypKwVIXHpQD047M+P2aNJzXOoM5XJuYuil6QuO2xcNEvRGdwVYcYY4KGUirBzrLFUtW7YWfJ
X-Received: by 2002:a37:e54:: with SMTP id 81mr25486200qko.284.1588097137809;
        Tue, 28 Apr 2020 11:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588097137; cv=none;
        d=google.com; s=arc-20160816;
        b=OBNQjPXeMT6UDufDuy40nk0ow9TJ3eUdzP4XT/B6wfmfpFdq+TXakaH7Pk0f3LJ9Za
         cL9btRVJg53Ow/PK8yfiTZPDRfkp6N/gCwtXcHqkuQfqbmMTXcN9sXxafb9/NsnmfCVX
         MP2tX02XVtIKtPSwKSB3rvQK0YSzX7OKcSr0VS0DFeydM6HebVH0P3AkoGkMwMGM0+Vu
         VSgC1+DB23hQixCmIQVscM1+0nC1TV/4vjy0+Bb0/+j/IH+xTk69ML/c79GAvb3wuOBv
         LsUgh/oEYIxVSI6YLN9BAl/sKgYAQZvWJgDEtG4V1X+P1nRMQPUjocpPFFJAPRIObAjj
         xlPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vfqjyfMLPu2fLhRRdJWjSHwzBP2xtMJA7Y0d7X/cFsY=;
        b=u3QfqGIobDLrtPSywsU7vAE8RfKRskmn9+rc8Fcu1mcmSQ26+912HLDmiZ9+bFfdpU
         /wUUNyL5N4I6RZrHdqHd7OA7lW56kKmSUv3blBRoKobzWGyHfJ819hA2gQ/kEuK0Kz25
         X1DSiR/sJC/Jls47d6fZhyPC+llE9lvChKQ7msEY+IeOsxrZHc6AWaFEu/SwFnVRMHv1
         DI5QlFbEgSUC7RarLJg06kB4n7gZnJlOLIUZvFC3W7r7MjGPKoNh/MMdQizf8LBxFXoW
         OaYlN6FFZoAevFfl9+3zJ3LlFtjZQvZQnN8zpuklj6D2fhKlk4ePuARpXoB7tguuQcYw
         btkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J9RZ9ZeQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 129si11378699qkl.110.2020.04.28.11.05.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 11:05:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J9RZ9ZeQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTUbx-0004bq-4P
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 14:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTUbm-0004VO-7N
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 14:05:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTUbj-0006v1-85
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 14:05:26 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:41813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jTUaf-0006LZ-UA; Tue, 28 Apr 2020 14:04:17 -0400
Received: by mail-io1-xd41.google.com with SMTP id b12so24109247ion.8;
 Tue, 28 Apr 2020 11:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vfqjyfMLPu2fLhRRdJWjSHwzBP2xtMJA7Y0d7X/cFsY=;
 b=J9RZ9ZeQ5GBIbEVGICBQYhraZw0GmO4Qg0VpL2Uwy66ejVbKVWpfUw4+gT1BQkUXTj
 ZMD0XUJ8m3ySfByNr7MSGmYjenGq62oVALfrGQnLUkS4qPjGM3otjgqlyFp8p/pnIeQF
 oBflqxfcSYc5ogph6i4TJ6b+s9U3dmzt7Ss6/0335bdgfqlLVSAQEwgXvObEqPnrNaK0
 7RfbyyHILJddqItNjkLV7N437A/piJeIfLYor93dSNdyB13zuRqkXawpipUDyAZo8b7C
 73Yi3sGAQupKDFBMMocCtPKe1kbqQRMyEfPjYuPccLJaolVGpS8hn1V+acTFvUJqFnCu
 MRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vfqjyfMLPu2fLhRRdJWjSHwzBP2xtMJA7Y0d7X/cFsY=;
 b=IRB5MsZgPtbOUIZNvWQRaEbWTTOrlJDJtcTiT2SMU1N23liguNTaVOgjYqK+FX6Xay
 mUY0ZYoXJ56R2ftm21YDzp73ZbjdDStHsn6oHGw50XVH+nbO/VO15mXUtbyf6AooJyze
 UEBWm/iMLFAEtzk3axQyrq/IAeQgM58I59tP8icLj/5n4zex02UcWmxwJs9DbfcFZPwi
 Uzhv2I5HT/k7rdseuIXS/Mii2AsIE+BkSBPEHMPkGZtpwsY5a3GH1YfAb6PyeiCGbPbH
 LakRxI1SaIo9z4lmrv3nkuBtJQfGIyTpu+nhhpdR5GPhLoClH1f3bHgvTxINzK0rG9RG
 DOpA==
X-Gm-Message-State: AGi0PubhnXpPdkcbEr9tLRD1LRxtUwfTwts+mISqOtK3SKiGLaLufDmI
 nc7/2QZreucWSZA0Fvo0kOogRnh9GNAdMJWWKg8=
X-Received: by 2002:a02:1a01:: with SMTP id 1mr27039300jai.26.1588097051969;
 Tue, 28 Apr 2020 11:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-12-edgar.iglesias@gmail.com>
In-Reply-To: <20200427181649.26851-12-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Apr 2020 10:55:32 -0700
Message-ID: <CAKmqyKNtAqE4u_aLmoYvLGJoUOiDOr-sBrs8vG+OkOP8zvHjsw@mail.gmail.com>
Subject: Re: [PATCH v1 11/11] hw/arm: versal-virt: Add support for the RTC
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d41
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: onUcVtD1+C3G

On Mon, Apr 27, 2020 at 11:28 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add support for the RTC.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal-virt.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 0afee48672..7e749e1926 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -283,6 +283,27 @@ static void fdt_add_sd_nodes(VersalVirt *s)
>      }
>  }
>
> +static void fdt_add_rtc_node(VersalVirt *s)
> +{
> +    const char compat[] = "xlnx,zynqmp-rtc";
> +    const char interrupt_names[] = "alarm\0sec";
> +    char *name = g_strdup_printf("/rtc@%x", MM_PMC_RTC);
> +
> +    qemu_fdt_add_subnode(s->fdt, name);
> +
> +    qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
> +                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_RTC_ALARM_IRQ,
> +                           GIC_FDT_IRQ_FLAGS_LEVEL_HI,
> +                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_RTC_SECONDS_IRQ,
> +                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
> +                     interrupt_names, sizeof(interrupt_names));
> +    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> +                                 2, MM_PMC_RTC, 2, MM_PMC_RTC_SIZE);
> +    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
> +    g_free(name);
> +}
> +
>  static void fdt_nop_memory_nodes(void *fdt, Error **errp)
>  {
>      Error *err = NULL;
> @@ -496,6 +517,7 @@ static void versal_virt_init(MachineState *machine)
>      fdt_add_timer_nodes(s);
>      fdt_add_zdma_nodes(s);
>      fdt_add_sd_nodes(s);
> +    fdt_add_rtc_node(s);
>      fdt_add_cpu_nodes(s, psci_conduit);
>      fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
>      fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
> --
> 2.20.1
>
>
