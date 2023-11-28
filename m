Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1750369ejt;
        Tue, 28 Nov 2023 01:43:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8Epehkv5u92COOFbUyPyVk7kWim9kpko2sVaW3oWF0mUP+ZyNHtlkCLW75krSiBJtJXEE
X-Received: by 2002:a25:3613:0:b0:db3:fd6e:6e31 with SMTP id d19-20020a253613000000b00db3fd6e6e31mr13503668yba.12.1701164620568;
        Tue, 28 Nov 2023 01:43:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701164620; cv=none;
        d=google.com; s=arc-20160816;
        b=XCzPKlo+7Cm7mOoBKWv+i0a4ssfDdH+kVB9DG9Cu9DOpA56OF3aGrmeXDedzIgAsoy
         +r5w6PbHiVNDz7kZLJ+hLMQpebXnzcO+6VJdSHLE9bVqBqnA6UleWqNy7bEalofgI9R7
         AWbbl5+OJe5vjKy52gviW8WFiHyCA3w/YAxvlT75vhQcBdWIlJu1OtBdEbS9o0elvR+8
         Wy70U1cpHlEbujZnt64GjCrJfzQtd6x87p9IutvK3KoISag4qNJF6R3uTKhFpJTr795o
         X1tVhA0la8BHm7LJvmhJGAAdmNOVvaiyRV5iNhU8Qc/8pY8fnQNwzBb6K7tlXpe9xezE
         l1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=X2UmEudICUsl9z+oIELO7zxS+xZLb9OLSjs0VmBtRJM=;
        fh=JevbGINOdgzHpobPeY6a5NX8AdTsHIkhwelypfplB/Q=;
        b=f1R/2iB855DOBorQVQ7Oua6ZHFGXBmdnuuzSWts5iO73VsRGM4NWR19B602ycv+zd/
         Qh3eGEaut9X+7oW1fz5FxaAE/DcE1uOIST8bEX4re61bSJmgU9VoVv6Uf/g0Tw5rOV/Y
         NtFFSD8WH00edxMDFJq4Gw7Bxeay+LfZeipv0Gc+dZTxD/8/vNHOjrprf62NWeVN1lgf
         y17OZWRR/fysKVpWVCXck0yso0111LwV9Ba5zyg2DJAO03vLG+tccjUnoVPE/TpQ46wc
         IBFyEveR+7VWLCixwRvEdqsBXQR+JBFMpU/YQSD5uWT2EI2eTo7/i4UuHKACZ7uRO+t5
         OnsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PITx30J0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ew1-20020a0562140aa100b0067a38fea027si5078211qvb.303.2023.11.28.01.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 01:43:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PITx30J0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7ucn-0000Su-5d; Tue, 28 Nov 2023 04:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r7ucm-0000SZ-Gv
 for qemu-arm@nongnu.org; Tue, 28 Nov 2023 04:43:24 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r7uck-00030A-R0
 for qemu-arm@nongnu.org; Tue, 28 Nov 2023 04:43:24 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-54b545ec229so2789617a12.0
 for <qemu-arm@nongnu.org>; Tue, 28 Nov 2023 01:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701164601; x=1701769401; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X2UmEudICUsl9z+oIELO7zxS+xZLb9OLSjs0VmBtRJM=;
 b=PITx30J0Cpf7KND9octGxKIG5O34FvLO3pcLA+CxSWygYvE0x/1PcyGAIyCophE6l5
 d4RVwXlO2aLANMkMaC+I1uzbpklI/Je6/KnV8y6eFUplZwQlBD3oHwumoaJyXhKtMkb/
 s4XhKQTeeVxVd6HzEyVXtjQ/mhonKa190q191ydacqzTS1CHnIQLl3p/au+LFxqnHtIH
 XusXXoS6AXD8jvkjUlj5CsS5YVLXuX9lxlNBCkfo2QstOFxKNrvZyZV/5V5AvMzWNriD
 eycuxyg8bibVyXt55l4J4YOeLNuxYh1T9ziSUf2vSgnlI6dGLzqITT7ZUH5h79g4j6V9
 3tPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701164601; x=1701769401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X2UmEudICUsl9z+oIELO7zxS+xZLb9OLSjs0VmBtRJM=;
 b=YGgW0uUwX0ObkC6saAngXTipqq0KvFzWi3PtYQImS1KrqhNGh7MGHpO46SEfeL19Ph
 xZPJkhE+QiRj7DKjzd+Uso7psbE+EOsnN+9rOi/kruJ7/yKVCabKlzbuzOLp9Mm9Owt4
 7FG9D/4Qt747jfiTdeKB0yFMC6WQHdyCkRODxhT54ZPFtz/YUbe5sVwOmojbpyUOQo4Z
 5ozcdCDHcWRYYNSyri5u9V5qsTY0tZgxJK2n8CkE5OjbYp2kgEn00pnirYS9eWTkvBLf
 vIw6h3NcB6xzqwtRoaJYbs+nk28gLJXVy+d/a4pwVdIA0FyGwh+jFnSPNNoaIbrtu+9K
 RrpQ==
X-Gm-Message-State: AOJu0YxU7aO5s0GQVbgzz/rxyxUogmzKCSbMEKqyJZOBPX0WoNZLPJXY
 SrcEgQNt7aCTuoC0F/TufvQRlg==
X-Received: by 2002:a05:6402:f19:b0:54b:4067:627e with SMTP id
 i25-20020a0564020f1900b0054b4067627emr6556065eda.8.1701164601103; 
 Tue, 28 Nov 2023 01:43:21 -0800 (PST)
Received: from [192.168.69.100] (crb44-h02-176-184-13-61.dsl.sta.abo.bbox.fr.
 [176.184.13.61]) by smtp.gmail.com with ESMTPSA id
 cb6-20020a0564020b6600b0054b63229d66sm2180384edb.66.2023.11.28.01.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 01:43:20 -0800 (PST)
Message-ID: <013fb5f5-8281-4f7a-83c8-ac22f845297b@linaro.org>
Date: Tue, 28 Nov 2023 10:43:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] machine: Use error handling when CPU type is
 checked
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231126231210.112820-1-gshan@redhat.com>
 <20231126231210.112820-2-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231126231210.112820-2-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: PL+BOJ1mQ15i

Hi Gavin,

On 27/11/23 00:12, Gavin Shan wrote:
> QEMU will be terminated if the specified CPU type isn't supported
> in machine_run_board_init(). The list of supported CPU type names
> is tracked by mc->valid_cpu_types.
> 
> The error handling can be used to propagate error messages, to be
> consistent how the errors are handled for other situations in the
> same function.
> 
> No functional change intended.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v7: Add 'return' after error_propagate() to avoid calling into
>      mc->init() in the failing case                        (Marcin)
> ---
>   hw/core/machine.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 0c17398141..b3ef325936 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1394,6 +1394,7 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>       MachineClass *machine_class = MACHINE_GET_CLASS(machine);
>       ObjectClass *oc = object_class_by_name(machine->cpu_type);
>       CPUClass *cc;
> +    Error *local_err = NULL;

IIUC the big comment in "include/qapi/error.h", since commit ae7c80a7bd
("error: New macro ERRP_GUARD()") we want to use the new macro instead.

>       /* This checkpoint is required by replay to separate prior clock
>          reading from the other reads, because timer polling functions query
> @@ -1466,15 +1467,17 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>   
>           if (!machine_class->valid_cpu_types[i]) {
>               /* The user specified CPU is not valid */
> -            error_report("Invalid CPU type: %s", machine->cpu_type);
> -            error_printf("The valid types are: %s",
> -                         machine_class->valid_cpu_types[0]);
> +            error_setg(&local_err, "Invalid CPU type: %s", machine->cpu_type);
> +            error_append_hint(&local_err, "The valid types are: %s",
> +                              machine_class->valid_cpu_types[0]);
>               for (i = 1; machine_class->valid_cpu_types[i]; i++) {
> -                error_printf(", %s", machine_class->valid_cpu_types[i]);
> +                error_append_hint(&local_err, ", %s",
> +                                  machine_class->valid_cpu_types[i]);
>               }
> -            error_printf("\n");
> +            error_append_hint(&local_err, "\n");
>   
> -            exit(1);
> +            error_propagate(errp, local_err);
> +            return;
>           }
>       }
>   

