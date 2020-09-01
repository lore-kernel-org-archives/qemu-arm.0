Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4435975lfc;
        Tue, 1 Sep 2020 03:01:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIG7Ns0eC1oQjzjtclm4WeFxrw6Tdbx5XUOD8jalukPWvUUeYtlnXlj2AZf2xjP9/iPQnb
X-Received: by 2002:a25:8b07:: with SMTP id i7mr1557395ybl.39.1598954460726;
        Tue, 01 Sep 2020 03:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598954460; cv=none;
        d=google.com; s=arc-20160816;
        b=lqi0PT0OqSmF4z0/4A7xTZVhdzS/D2+2uqqGHLhglScUOtIwgsYC2LeSg+X5hO1SuQ
         6BngrC6HJ2K1eg4rGmzY9mHqU3piR42FgkjYv3+u8aZcywZabdJ95gWaDuv5U43WaZnr
         yiUp7cXj57OMQEN8uXJW5eBn7z0y2h46Hhsnppyex0gCCE4rmTvPUaGoNXSrW/W5ySJM
         kU87mtOg95VuQX8Rj7EXXeiEDsfoSqKwy70CzK+eJjpKIR0imEsNlLdjJETvxo1fCSm3
         /21wBk/F4QmBSbj/eJnI1GvnczP1+igHGp0oUV0r0tQ4cEnIjXRQ+LL8Xb6JAk4YpDD9
         +KqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject;
        bh=ZQDWTR+4Qu1hDFG7zgJU/dAExL2umlwql6kaFMwjWKg=;
        b=AspzWSvnrAy6b1u/VlDZ1a0OIl/7GJKbQ5bvPHwjjX9QWY4ZEKNbP0Xrg4yaOELpgI
         sFuKUVvge9vnWGVHFcXczbaigkKu6L/c0ry6PAWJjCyaWRo09tqKvnS23aU3w3agUUi/
         ccG09+qPzjewbGw1/+/YsP1Jeb1TVcQ7MMzhYafF0Cjji0L3qpYCXPPhf9p8zpztKNJd
         tdF/Jhc4Pz6LSixjVmxXs9ryS2T+AQ+Y/tQjD3l9G1we5EUT6iVVLp3MsCMvms+8YJRU
         pxGgpEvs8oMZ5DaECXdoZVtHBQXO22z02h44ZqTv5K2N7b0ylPJduPxcxXE4RfrU9qcl
         OBEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w192si624290ybg.487.2020.09.01.03.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 03:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kD363-0007J6-FJ
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 06:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD2yi-0002VP-GZ; Tue, 01 Sep 2020 05:53:24 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:59987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD2yf-0003S8-7L; Tue, 01 Sep 2020 05:53:24 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MWiYo-1k6Wcv17l2-00X3Sv; Tue, 01 Sep 2020 11:53:09 +0200
Subject: Re: [PATCH v3 01/10] hw/arm/virt-acpi-build:Remove dead assignment in
 build_madt()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
 <20200827110311.164316-2-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Message-ID: <eb8949b0-9aec-5543-c91b-d1f794abc1f4@vivier.eu>
Date: Tue, 1 Sep 2020 11:53:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827110311.164316-2-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0LMOGjzNdM9/reHRYXjRTnDUOypQRARhiQc8/eRxZHqRkW0zNnh
 4QcqZ/QPym+VBm7Wak6sP3i0/IBHFTChgjEcEoxXvHdTOe+F8KSDkQ/o6dUVJCQyGxh5d3S
 9M8fguUI0j4bCcx09pmCGOx9l26bs671VzrTJMeWAARIbOZAAfhgrqEszADowDESBiZK3wc
 cpVWITpsPiQ1h0e57/poA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KTdMgbEHUXs=:8AHvfgA9jUEebuMfC0n/1g
 UTPB4ZpzvqPRJPTCDVwxrnJ946A4ddz4SwzWzMQXZzyXGKY8nPVumDXhJc8fHkypn0AU8znF4
 PCXrbrpFyOOZxJCJbw0xwIfJluWK1FdGVl1CGDpfr6fbDUmcpk87uphkMQH+dRoTl8Bn3ZP1h
 P3hrehtY2pOvlUEQWAGU7p5uI8MMS0kGGsSU0hJPVg5FHD+x+rWzu8nk0+mlaL3x+CTiu1QPx
 lSjh+zJigQyXgQ9B+NDIviO1+ve+GWFKJrwkmD5W2u35LrM596ZEWxfPDhTcNK3YZ7p4yHbwm
 T1GQGROsiOldy3GIwm1qho8kQcv1noFrdyNDWXRXsJ4//5F2oBlOOTpY7zrTDK5aIOUhl0G77
 xeu1m+2MCbMG177TcolFktrNYlSsr/nP5wWKAQm71EP2bXIP2+XxqHUmoV/06yKJV7TvCEqY2
 O0tjS6ncXLsSYWx5KKKl4Y+/dXHV2X4cWHUIuDT8Vi4XISntBCIt+9iy3mZY9xtSNCasZqtmX
 5kk7tx07qMRiOL2fkE//NcYEqcSTsAse5xdwdFfB2HDbBsZhh5fxxW5hakOJJEo0ECRDmbmcy
 XvobCycUemqWhS0/X5dXE3aP2ryhuYWF2ew99Gj41LQ4U38OuopM58hUBTu18hrMWHGmla42c
 rG6cfDwg2wdsxFoCuwyj6bUp6B1iDFzyKztl41KZ6nHw+xGP0+4gpwb6SUWUM4ttfacQ4z3Y4
 ayam61d3IF/h412BxbfcHPcYPsPblJZ65TrkR5h4kCw+ZK+qdAQnSG43GnsDSZe13M8lLrCbS
 Z9LFwAwIasD1hNHQwxeqhFOM/jcO51x2UbTtKqy4sJa19Kx82qYC2SdVf4m8Z4GBD46CaNO
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 05:47:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.13,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 "Michael S. Tsirkin" <mst@redhat.com>, pannengyuan@huawei.com,
 Li Qiang <liq3ea@gmail.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Euler Robot <euler.robot@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wk4MfXSX06r4

Le 27/08/2020 à 13:03, Chen Qun a écrit :
> Clang static code analyzer show warning:
> hw/arm/virt-acpi-build.c:641:5: warning: Value stored to 'madt' is never read
>     madt = acpi_data_push(table_data, sizeof *madt);
>     ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Li Qiang <liq3ea@gmail.com>
> ---
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 91f0df7b13..f830f9b779 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -633,12 +633,11 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      int madt_start = table_data->len;
>      const MemMapEntry *memmap = vms->memmap;
>      const int *irqmap = vms->irqmap;
> -    AcpiMultipleApicTable *madt;
>      AcpiMadtGenericDistributor *gicd;
>      AcpiMadtGenericMsiFrame *gic_msi;
>      int i;
>  
> -    madt = acpi_data_push(table_data, sizeof *madt);
> +    acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
>  
>      gicd = acpi_data_push(table_data, sizeof *gicd);
>      gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

