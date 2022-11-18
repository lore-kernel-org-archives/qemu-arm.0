Received: by 2002:a05:7022:459c:b0:46:f5cc:2c85 with SMTP id cf28csp528042dlb;
        Fri, 18 Nov 2022 11:12:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5kJwaPrT4rc0L8iJce6ExIj3UEErqAeKJ1vnJ4Hm+OX3dfqafv7gONub1Xiuly0GzTJ+PY
X-Received: by 2002:a05:620a:90f:b0:6fa:1973:5152 with SMTP id v15-20020a05620a090f00b006fa19735152mr7245374qkv.157.1668798736989;
        Fri, 18 Nov 2022 11:12:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668798736; cv=none;
        d=google.com; s=arc-20160816;
        b=ORlhJg+mNzQBrbWjl5ReOhPQBfi7BRKpzkPEJNzfQw5BVQMTA1JopyJFEmeWDqsNxX
         W1/2a0Pi7P+kTO5S5gLR0yvz/UaKZ4Ak8JLxEmmiQWjYePt2+RjV3wvikn/eh6tpQfwS
         DGW7AqYmeWZtYH0dQl6QztrPn6kqAZ1lcyubDpVgL4b5BkOnV/FM692GGxMe3HyPgL9U
         5Z/QJVUhq2ZNfzyD8R6zIoc85nub4uxggvDpVHF6UhWTthMfrO+dI0q6Vv/VhxArIGRd
         JeJEqmg1wN6DMfYwzuQdVt9tG2e2cpqvpkSo0FX0jdSG+o4LdzJZdF1PgLl+vdhynVyW
         qYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JZUzOA0hQqpX0qBoD4ucJthktMFVYdCE3DXBBgQElDM=;
        b=oPke3w8p7KznAjjApqaTgy1YGAWParD6FEQyFnM18C5QsWBa5lknba4tGMjpfC87Hx
         gF62tsANyHI+JKQC3lE9oiQlnsbJ+0/TwYy+obNIYaIQp6JuGiFRKh7lM8DxUh2EVB+J
         TW5GdqQnXM0XV+mi8JlTWDT6uDfqyuizMQtt5culSPCNJ8yPUySpJIwq2O5sHogzKUDB
         VejWjJlYFsTHEVG1Tu5bG07uisT424FeWHhR2tG1KCvSvKHWcoAkJhixRqfC0caq9S5R
         sl/qWpkf/7dLflm90V5MKEdASw2Nb+GkHtf5H3geAWe1sc0/sZdcKCiZ2avI/I71Hz2D
         MeCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWCYCuGG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020ac8574e000000b0039d0291153esi2725545qtx.357.2022.11.18.11.12.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Nov 2022 11:12:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWCYCuGG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ow6mK-0006aB-W5; Fri, 18 Nov 2022 14:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow6mI-0006Zf-92
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 14:11:54 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow6mF-0007Qa-SU
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 14:11:53 -0500
Received: by mail-pg1-x531.google.com with SMTP id q71so5771626pgq.8
 for <qemu-arm@nongnu.org>; Fri, 18 Nov 2022 11:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JZUzOA0hQqpX0qBoD4ucJthktMFVYdCE3DXBBgQElDM=;
 b=YWCYCuGGe4ynj1JErHeEIjVtFTjqy1ZbtNJyBI1gJuvx/93FoOZLErCVWzMDrYD+GW
 qL1QYg2EsFQ2mSmH/CYHZ2lxBgCVqimLQuA2ySBTL1OEXZZrL69diEP3Emd7faBQ1R5k
 M8wQBl4LZA7F/9MWs7jGiblwHPnnVfkGcu0oDtECx+LrZTfdc4Pr/v2nshRgVNSyxJIK
 xPCOIxGPGVDqFi6ykcC3EgOR7ZgZUYRXKoGgWoEYB+8Dqq7TUmhd6oxMd2ESZLn46g0L
 Qn/SmxYxWazF2X2DRUjKcou7qw2QW/H3DS6+NWF+UwZ+TY2ODxHTRMD6lMs02N80J7cI
 GbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JZUzOA0hQqpX0qBoD4ucJthktMFVYdCE3DXBBgQElDM=;
 b=ygfQBRsb2wnOepqZqsxucH50Xspek2pw+0oYsBPjrdJi67Ur0zdHkOL31qzWWABQzf
 LzjJHT0RethRSJgX+A8JW51k6Ik9CyH2s+OLdXoa7WHyFIxjQ/9nA5BvA2Thayna6iPR
 YbjtAGuKgubDxASb2VLiHBFmp7jcILe/c5jZ4/SpZNuKiSleQe8w5t9NUfJ2490XS475
 Ehv84UwR0EENFDVcRuDkilVlU6iYapnjFOMnd0AhCXLDkVAfQEqIb1RQiiWXR91M6yOW
 giw/s5AY+W+AaG5AIFWjy8yI0yNIfl3n/S811zwqh4u1139nyG8x4zo59HB/0btj1hA/
 06Mw==
X-Gm-Message-State: ANoB5pnt+rRTusrsW+yvlsWOWWAVc1HzboV0kVQOfbi1ijQs6DefEZY2
 pezT+OMzbZ0hhjsCRLPrBZNPxc4Wh9UevLb6K+6Aew==
X-Received: by 2002:a65:681a:0:b0:43c:7da:e64b with SMTP id
 l26-20020a65681a000000b0043c07dae64bmr8028158pgt.231.1668798710195; Fri, 18
 Nov 2022 11:11:50 -0800 (PST)
MIME-Version: 1.0
References: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 19:11:38 +0000
Message-ID: <CAFEAcA_H8UEcp4HNFe1CwaheLxg7453QQBjTa9wSnsW6TgsRKA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: build smbios 19 table
To: Mihai Carabas <mihai.carabas@oracle.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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
X-TUID: 7S6T+Ni3Qz5N

On Fri, 18 Nov 2022 at 17:37, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> Use the base_memmap to build the SMBIOS 19 table which provides the address
> mapping for a Physical Memory Array (from spec [1] chapter 7.20).
>
> This was present on i386 from commit c97294ec1b9e36887e119589d456557d72ab37b5
> ("SMBIOS: Build aggregate smbios tables and entry point").
>
> [1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf
>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>

Is this a bug fix, or a new feature? What are the consequences
of it being missing? Is this important enough to go into the 7.2
release? (My default position would be "no", given this has been
like this on the virt board for a very long time.)

> ---
>  hw/arm/virt.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index cda9defe8f09..855b6982f363 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1607,9 +1607,11 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>  static void virt_build_smbios(VirtMachineState *vms)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(vms);
> +    MachineState *ms = MACHINE(vms);
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      uint8_t *smbios_tables, *smbios_anchor;
>      size_t smbios_tables_len, smbios_anchor_len;
> +    struct smbios_phys_mem_area mem_array;
>      const char *product = "QEMU Virtual Machine";
>
>      if (kvm_enabled()) {
> @@ -1620,7 +1622,11 @@ static void virt_build_smbios(VirtMachineState *vms)
>                          vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
>                          true, SMBIOS_ENTRY_POINT_TYPE_64);
>
> -    smbios_get_tables(MACHINE(vms), NULL, 0,
> +    /* build the array of physical mem area from base_memmap */
> +    mem_array.address = vms->memmap[VIRT_MEM].base;
> +    mem_array.length = ms->ram_size;
> +
> +    smbios_get_tables(ms, &mem_array, 1,
>                        &smbios_tables, &smbios_tables_len,
>                        &smbios_anchor, &smbios_anchor_len,
>                        &error_fatal);

Does this show up as a difference in the ACPI tables? If so then
the bios-tables-tests will need updating (and this would probably
show up as "make check" failing).

Do we need to care here about pluggable memory devices?
(We seem to do something with them in the ACPI tables
via build_srat_memory(), so maybe not?)

thanks
-- PMM
