Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2426990eja;
        Sun, 3 Mar 2024 23:17:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV7/i31NyqRz03VzwdktDtW+/OShwxfBiEdTFNgLruO9kQl/NozSj6czbEticXY9pIbnkp5wmvLTnDKn5iqLWug2vjhaZFH
X-Google-Smtp-Source: AGHT+IF7EpcwrZ7uCxQxz+cTCbUCc7dGrgIHiqYySEuGiof3Go9dBTNtqyCRG66ncyTPBVLBY7n2
X-Received: by 2002:a05:620a:290b:b0:788:1e40:d51f with SMTP id m11-20020a05620a290b00b007881e40d51fmr6964826qkp.5.1709536656418;
        Sun, 03 Mar 2024 23:17:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709536656; cv=none;
        d=google.com; s=arc-20160816;
        b=O88xhYxa178kczusPogQnxJdmFrpxQPslEhCeZf9oScgSJaOhQ0rhm1pUJimRNvm25
         5YgfNQ9MC0T+zM77CE/OM/eBbQxwERr/HkHbaBTfH5H6gAm+8xwTR/L5ScU1w2L+FDv9
         V4kJN1rBWfy1OTdP9L0fT0xRPvvnYrSCzevs0ZPJHW5Vdn4/NFiLu6m88fRlj+K7MyIL
         vx5sN//B8RqJcmZz9ItqvyO/YjoqXfM5Bm40tSMQZfMQuum1qC1yt4hSeYGnBM0RFWxn
         rHNkyJX/s/aHP+OX03U0DO9sWhowqIRvZ6fboTnc4sGBJk9WSgquFNoxQAIcFvsyGh20
         XfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date:dkim-signature;
        bh=Vzl7GzI01woivFg5X9n6ZsEUFdVMLXkfjWIveDfAc8A=;
        fh=gG966rvtz3k/x5C8ven1pJMw+YK85HJwRujHJiIw7qs=;
        b=MFkin1TfQ2ZAD+wHyY4lZTQmFx+/iytCBkBqPrffzofpJYglQWvP3KfNVtRTyPjB0I
         AYrX5mKZxh0vFcWFrlEUBCbUXpFAg3dWsoio8BLdMNfILlVX2JVHqeB5uqxcArzyj+1o
         4+0TKgXL4PrDdRZF/aVYlRq/LskDQ3tQmnPI83R+WuptEEzKn6visgodZ8YeBHY7fSxo
         8ZyNc1d516o/iD9N6tNQ/guy018FBXsH9PsQJZlSqVKCcPP/AGTcJkU0nes+L3695tSF
         6Y+aXtcIzmS63xDcz8sRfGgHRnHWjxnnYVdDKQHLISdy/uhtvrRg19OuUoZv4oNjV90H
         f/0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HFmpXkiB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19-20020a05620a269300b007882ea6216csi243816qkp.727.2024.03.03.23.17.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Mar 2024 23:17:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HFmpXkiB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh2Zh-0002dW-Ps; Mon, 04 Mar 2024 02:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rh2ZY-0002Zp-W1
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 02:17:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rh2ZX-0006tx-7s
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 02:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709536634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vzl7GzI01woivFg5X9n6ZsEUFdVMLXkfjWIveDfAc8A=;
 b=HFmpXkiBehzs+uTXGHPoNkHT6VsouB3E+SIFCsJ+Mw4viHxgtQEFZAvyly99NPxOX0bVPB
 wLNUneeMrLpOtcrR8B+Yn4e8+KvHdhKmG5AXIXvYpOKT3i/3FjK0rbQw8NNcdqS4Wpxi6m
 mtE/wgn/JMG5r9i57pRrppeRWAmtZPs=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-862f0-9cMbGsSBEACgoebQ-1; Mon, 04 Mar 2024 02:17:12 -0500
X-MC-Unique: 862f0-9cMbGsSBEACgoebQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-5998b7ad6b4so5292540eaf.1
 for <qemu-arm@nongnu.org>; Sun, 03 Mar 2024 23:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709536631; x=1710141431;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vzl7GzI01woivFg5X9n6ZsEUFdVMLXkfjWIveDfAc8A=;
 b=Nvy2xnpepzRpIxXE3cfI/p5G68/Co+PtQqaqZv2yFEjL0sMiUVcq3SHPJ40N23fTTC
 1RnmfuNCo/TY/UaC+Zpp7cVRRwB6yeagrgkRUqNW8ithe0SxD1yY7G9GyD36FHD8Hvmc
 aluW3VQfpGMqN/d8VVhNpw9d62v4W5YlfvhzwwWV3wdQnNdpq2iaEor/sa1YK9LUIS+x
 XoDqIHxr5007jQqGZ4u6zG4lP+fB+/1ruY6+58PRtfmYqAlZ8Ii2guUMv8QEpr6hjDip
 ICdKCrS0bhXCLCkkftge6VthyhfmJu97cTLsajFN4ArINcWY5jBOAEfj2eJdUHhwllEH
 gWpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTe0mBdRq5bVZ72gNmphOrqAkNtJV+bSKFNTXVThIqGCO5pKldwtE3vjUbU72fEPK966J0BjSKH4GHwIyWna9kMe2N
X-Gm-Message-State: AOJu0YynO/hw/8yHiUDy5ut+WynAdOgHg6fPmOFF5XIEwN1xJfkkgxiz
 Cw8tdVpwsA/Fjhlwq0ffNZAfVczwY/DUc8mdKLBhahphDsrkRp8a5E/tsAvsJtgcf5n9kDBPVwJ
 2kX3aHddxbfvsJfmBGx2O0ilub3tdeEBuY/aDoeYfkVOCh//KBw==
X-Received: by 2002:a05:6358:98a8:b0:17b:f73c:9e0 with SMTP id
 q40-20020a05635898a800b0017bf73c09e0mr10142365rwa.12.1709536631394; 
 Sun, 03 Mar 2024 23:17:11 -0800 (PST)
X-Received: by 2002:a05:6358:98a8:b0:17b:f73c:9e0 with SMTP id
 q40-20020a05635898a800b0017bf73c09e0mr10142336rwa.12.1709536630989; 
 Sun, 03 Mar 2024 23:17:10 -0800 (PST)
Received: from fc37-ani ([115.96.159.226])
 by smtp.googlemail.com with ESMTPSA id
 w26-20020a05620a149a00b00787af8b5c02sm4091738qkj.39.2024.03.03.23.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 23:17:10 -0800 (PST)
Date: Mon, 4 Mar 2024 12:46:57 +0530 (IST)
From: Ani Sinha <anisinha@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com, 
 mst@redhat.com, gaosong@loongson.cn, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, philmd@linaro.org, 
 wangyanan55@huawei.com, eblake@redhat.com, armbru@redhat.com, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, f.ebner@proxmox.com
Subject: Re: [PATCH 08/19] smbios: don't check type4 structures in legacy mode
In-Reply-To: <20240227154749.1818189-9-imammedo@redhat.com>
Message-ID: <2768a457-dc48-4837-15d0-282da1fbec78@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-9-imammedo@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.589,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: OrifIug/ZtT6



On Tue, 27 Feb 2024, Igor Mammedov wrote:

> legacy mode doesn't support structures of type 2 and more,
> and CLI has a check for '-smbios type' option, however it's
> still possible to sneak in type4 as a blob with '-smbios file'
> option. However doing the later makes SMBIOS tables broken
> since SeaBIOS doesn't expect that.
>
> Rather than trying to add support for type4 to legacy code
> (both QEMU and SeaBIOS), simplify smbios_get_table_legacy()
> by dropping not relevant check in legacy code and error out
> on type4 blob.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
>  * The issue affects 'isapc' and pc-i440fx-2.0. the later is
>    in deprecated state and to be dropped in near future
>  * possibly the same issue applies to other SMBIOS types above type 1
>    but I haven't tested that, and well tables that aren't
>    generated by SeaBIOS can get be added just fine
>    (tested type11 blob). So I went with a minimal change
>    to fixup type4 only that I'm touching. Leaving the rest
>    for other time or when someone complains about it, which is
>    very unlikely given it's really only remaining isapc machine.
>
>    I'd very much prefer to deprecate 'isapc' and then drop
>    all legacy related code (it will benefit not only SMBIOS
>    but other code as well).
>    BTW: 'isapc' is in semi-dead, I cna't boot RHEL6 on it
>    with KVM enabled anymore (RHEL9 host), TCG still boots though.
>    One more reason to get deprecate it.
> ---
>  include/hw/firmware/smbios.h |  2 +-
>  hw/i386/fw_cfg.c             |  3 +--
>  hw/smbios/smbios.c           | 18 ++++++++++++++----
>  3 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index 0818184834..1fbff3c55f 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -296,7 +296,7 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
>                           const char *version,
>                           bool uuid_encoded, SmbiosEntryPointType ep_type);
>  void smbios_set_default_processor_family(uint16_t processor_family);
> -uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length);
> +uint8_t *smbios_get_table_legacy(size_t *length);
>  void smbios_get_tables(MachineState *ms,
>                         const struct smbios_phys_mem_area *mem_array,
>                         const unsigned int mem_array_size,
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index c1e9c0fd9c..d1281066f4 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -71,8 +71,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg)
>      smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX]);
>
>      if (pcmc->smbios_legacy_mode) {
> -        smbios_tables = smbios_get_table_legacy(ms->smp.cpus,
> -                                                &smbios_tables_len);
> +        smbios_tables = smbios_get_table_legacy(&smbios_tables_len);
>          fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
>                           smbios_tables, smbios_tables_len);
>          return;
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index aa2cc5bdbd..97cf762228 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -482,14 +482,17 @@ opts_init(smbios_register_config);
>   */
>  #define SMBIOS_21_MAX_TABLES_LEN 0xffff
>
> -static void smbios_validate_table(uint32_t expected_t4_count)
> +static void smbios_check_type4_count(uint32_t expected_t4_count)
>  {
>      if (smbios_type4_count && smbios_type4_count != expected_t4_count) {
>          error_report("Expected %d SMBIOS Type 4 tables, got %d instead",
>                       expected_t4_count, smbios_type4_count);
>          exit(1);
>      }
> +}
>
> +static void smbios_validate_table(void)
> +{
>      if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_32 &&
>          smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
>          error_report("SMBIOS 2.1 table length %zu exceeds %d",
> @@ -574,7 +577,7 @@ static void smbios_build_type_1_fields(void)
>      }
>  }
>
> -uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length)
> +uint8_t *smbios_get_table_legacy(size_t *length)
>  {
>      int i;
>      size_t usr_offset;
> @@ -587,6 +590,12 @@ uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length)
>          exit(1);
>      }
>
> +    if (test_bit(4, have_binfile_bitmap)) {
> +        error_report("can't process table for smbios "
> +                     "type 4 on machine versions < 2.1!");
> +        exit(1);
> +    }
> +
>      g_free(smbios_entries);
>      smbios_entries_len = sizeof(uint16_t);
>      smbios_entries = g_malloc0(smbios_entries_len);
> @@ -613,7 +622,7 @@ uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length)
>
>      smbios_build_type_0_fields();
>      smbios_build_type_1_fields();
> -    smbios_validate_table(expected_t4_count);
> +    smbios_validate_table();
>      *length = smbios_entries_len;
>      return smbios_entries;
>  }
> @@ -1180,7 +1189,8 @@ void smbios_get_tables(MachineState *ms,
>      smbios_build_type_41_table(errp);
>      smbios_build_type_127_table();
>
> -    smbios_validate_table(ms->smp.sockets);
> +    smbios_check_type4_count(ms->smp.sockets);
> +    smbios_validate_table();
>      smbios_entry_point_setup();
>
>      /* return tables blob and entry point (anchor), and their sizes */
> --
> 2.39.3
>
>

