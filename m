Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE95C61DCB
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 23:06:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x05eM-0001b2-5T; Fri, 28 Aug 2026 19:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x05eK-0001a4-Jk
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 19:06:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x05eG-0006UY-F3
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 19:06:16 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SMTIuG501938
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 23:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fE5+FoZiKr2Sa5RCsVANMuI+3ptLbhtUFLS1svoTdA4=; b=EXXGVaICo/QVg9qY
 Y8cQYPhdHzYL5BLgpZq03XtypJQZDx+1byAixEIezaVjHPC0on9xSS0iRdfOwWcE
 2PzPgRZ7IS97KRGo+zo8qzQouPlDksKssXZN8O0qEziFYm8V4ru8nc7Lz2TdFel1
 SASeKXPcq1kaoajV93tD1kOaPxIHMzMFzD/FH8FQN/Kt7GA7c57vK067vnJcjiuD
 KYek0ADOPrDlSfDkNpe5tnBwLTErqkyy+QCGvQwGwkmXfgZaXtYkaT6vZwXa4mGg
 LGHybc26lIPpCC9dOYYApPo3aRcq7mZZSOwEI867yhd7VxEuZmllo/LHucsrzmHH
 dh+8Lg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbgpc0h6x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 23:06:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38e4758ab46so2924065a91.0
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 16:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787958370; x=1788563170; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fE5+FoZiKr2Sa5RCsVANMuI+3ptLbhtUFLS1svoTdA4=;
 b=hvIAHa4cC8duElMvfAe+ytXJz4FSz2mYOm2YNv/bXFezbW4K6PPtJZiFrCd6nbFhKL
 mdqvQjSVb/Npf5HZuTwgyF3wm2KBoq4/pzXSQejbCaDS6FDVDoA9DoB19ETtr9/Swt5t
 vQzIzr5BXFbBF1esMzAiLL2zW0Pp49MPRkSgarob/2eXA8YgjAAngwShTtrrTMGdZkI5
 wXRSQH0B1Tq5iZTLpMU7ag8pY+XpgR2uCi3mKQLNq/BoR4eS2Ak5VCu1YOmMMCfGBQDv
 OnIcqhHR/6syZjKO7IN95YLUInJ1tQf85/bk0uK4ICcHFYqXbQEEVnVxEghG8AxDBFJH
 wshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787958370; x=1788563170;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fE5+FoZiKr2Sa5RCsVANMuI+3ptLbhtUFLS1svoTdA4=;
 b=G3Bh9cPuAwXxccEqjVNTMqboG4Ryeok1FwVnIYz2bPDmaFuoP4NIcpIslhs6rQQnV/
 iCqZww80a70rJerE+/aMeBkgbBg1fTeoYmMtTeaaYYW9HLVK8UbZ+kyF7+P/3z3ituFV
 3edw5DqahWK4IflK+BjQ8+z5/LU3UdTBq3upAqv1L4AeW5CrFES0lteLMwMlWKOQjYFs
 BDs4cloVPMI03O0L3Psrqjjz9U5I35laKGr+xmSGRNVMkGNznpNvqa08qjh4Izml9Ck2
 oZi6FBaU1j4Qzin7n3qbMmkar6YbcUwzHgJ3K7jIoPNaaadxquZn9+B2Wo4Abx3Difyd
 9eag==
X-Forwarded-Encrypted: i=1;
 AKwUvBzIUbFOFAXh13kB/JwiD7baC81YKC74qgxvjwXtgxQQuITgYfjrTMjKPXhX9SuK5MS86AFYcxMgjA==@nongnu.org
X-Gm-Message-State: AFuF++ldaNpGiOTCe5e9bRUZl6iQ6uuyNhxSlx1B64biLQMAVnF06VpC
 ARG+EUIRKvdl6EG6pdJ5FTlmKxwPYFymDwovdYqeP70BN2T+F/Yr7aVrEMMzDnbV35xkyCtYtdm
 GGyDhFqMG3n7w5xvNeQvEae9ogVcn0tguaVKl5W3fQlcFqsIlVuhhtIc=
X-Gm-Gg: AYBFou0+RI8PROJ47rrOLmsivJMzoJgbkVUraB/h5tdwrIvD9r8tCtC/GIbLmmAU4PL
 bVXV6bPHIcO1GzM0gZiJIAKFuRVqYiHI3ipeTDjClIqGoMiiOqNSWNyZwwYMXQd+rC9MQstE1Hy
 2G+xTOLPZxXPx5Bs65MpidtG2Sbx5bqdk0lzSSNKorYsBrZe7b/1UA+pGbE1jbW2lLurGmiNoOs
 OqlY3PtwfoJdKQgJks4gSMuRN0ZcVT9ISLEzxb5wh+pDnXSygFENNw5ovrnkcVAyqe7AG3c28IK
 RmFxqE/PhuGblHKa4natjwomrfFCbEhg5qjek2xqrTCDDfO2n2lC8RekvQFTevMwLz66lcxtHli
 z1tly3fkXBuicXwZDySRjY7X9ht5fhL8IO3GTG3Rd+JHMbw5zGeFjJaTiyUkKIKK3ZmGo
X-Received: by 2002:a17:90b:380b:b0:380:f85c:94b4 with SMTP id
 98e67ed59e1d1-396d0f2391cmr17399798a91.7.1787958369964; 
 Fri, 28 Aug 2026 16:06:09 -0700 (PDT)
X-Received: by 2002:a17:90b:380b:b0:380:f85c:94b4 with SMTP id
 98e67ed59e1d1-396d0f2391cmr17399719a91.7.1787958369403; 
 Fri, 28 Aug 2026 16:06:09 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-142e0d1abbdsm8506420c88.2.2026.08.28.16.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 16:06:08 -0700 (PDT)
Message-ID: <e62fd6e2-d5f2-4c2d-b4c6-d40ee17cbcf1@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:06:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] single-binary: link ARM and RISC-V into
 qemu-system
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Bibo Mao <maobibo@loongson.cn>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alexander Bulekov <alxndr@bu.edu>, Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Glenn Miles <milesg@linux.ibm.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Darren Kenny <darren.kenny@oracle.com>, Sunil V L
 <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Ani Sinha <anisinha@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20260826184229.1145-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826184229.1145-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ECbfMFsfJ7B_hjKfvwvB-ELVR8Zovzkt
X-Proofpoint-GUID: ECbfMFsfJ7B_hjKfvwvB-ELVR8Zovzkt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDIwMCBTYWx0ZWRfXw7F9Ks0V68Dw
 HF9v/oFFuGhHYjskKjvbJaED0wuysp0RQGepm9Xh0lEABLI6TYWqfA/X0U/WewoVgm7ta7/FH6c
 UAVRJ7+dxrnUd7Lxgr8QVaVhP3gljlo=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a921463 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=GaQpPoNlAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wAUz5CRPtLaz9UZ5HuIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDIwMCBTYWx0ZWRfX+tvjePIw04Tj
 RZCKsBsdGGuqJGXvf9rw1BgSx4oOo5hXSgggKsoUU92/jlEIseJB3YEX9zlueZkaQclreACO2X9
 gDsU95fUcGLZQATRlYiaI7QIu263Zb4N+UohmfbFpSsnEZEqOupzEuCStIyMOrZdvWcmw+c2Xkx
 ELq4fHKfwyGLTNQHxltnXhbphloTqKACGij8iOWUYXIxr8ntj3ektztyPTpTaRFxCMxeZn02iZl
 cKK8ZkoqGhngMt+0GPgSH+dd1qkv4H44QSBVPBCSYjoBpqwvYQTHJetiUoNIDhbbvBueXfOSykv
 V7v7mIVptF9E7jmcHE/h4KeQ/8l0Kyb0mzDEf4NH5aaq+7mKS6X3N3fC9cUPnVpIkWdYfdoJnv1
 MON4woh4/dDvZoM3p636sRDPL5GxkhVya5RAwlzFv6OaW0xPGUnSJ7w6GZkyu6okI9GVZmWtu2b
 u2VLPcNoHMJ61OFM8AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280200
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/26/2026 11:42 AM, Yonggang Luo wrote:
> This series produces one qemu-system binary that can run ARM (32 and 64)
> and RISC-V (32 and 64). It follows Pierrick Bouvier's merged series
> "single-binary: implement dynamic filtering for machine types":
> 
>   https://patchew.org/QEMU/20260724000948.234657-1-pierrick.bouvier@oss.qualcomm.com/
> 
> That work added TYPE_TARGET_SPECIFIC so machines can be filtered per
> target in one process. This series uniquifies remaining per-target C
> symbols and QOM names, selects TargetInfo at runtime, and links ARM
> plus RISC-V into qemu-system.
> 
> A combined link cannot keep C symbols or QOM type names that were unique
> only because each qemu-system-$arch was a separate binary. The first
> patches remove those collisions:
> 
> - TYPE_ACCEL_CPU is a single abstract accel-cpu parent, registered once
>   next to TYPE_ACCEL. Leaf names still encode the CPU type so
>   accel_init_cpu_interfaces() can look up "<accel>-accel-"
>   CPU_RESOLVING_TYPE.
> - ARM and RISC-V virt QOM names become arm-virt and riscv-virt. The
>   boards keep -machine virt via machine_class_set_name() after the
>   selected target is applied. Latest ARM virt still sets mc->alias.
> - virt ACPI helpers and RISC-V TCG crc32/crc32c/wfi helpers get an arch
>   prefix so the combined link does not need meson -D name mangling.
>   LoongArch virt_acpi_setup is renamed in the same pass.
> 
> Target selection then has to work with more than one TargetInfo in the
> process:
> 
> - Parse -target before TargetInfo is fixed. The token is target_name
>   (arm, aarch64, riscv32, riscv64). When -target is omitted, infer it
>   from the program basename (qemu-system-aarch64, strip .exe).
>   qemu-system with no arch suffix always requires -target; there is
>   no unique-TargetInfo fallback. Use -target ? to list names.
> - Combined binaries cannot keep one global C symbol per arch for
>   query-cpu-definitions, dump notes, or Angel semihosting. Those
>   handlers move onto a process-wide TargetCpuOps table.
> 
> The last patch still builds qemu-system-$TARGET. qemu-system is extra,
> from the union of ARM and RISC-V Kconfig plus aarch64/riscv64 arch
> objects. Do not replace the per-target binaries with symlinks to
> qemu-system. Do not add qemu-systemw on Windows: a GUI twin of the
> combined binary would keep QEMU exporting data from the .exe into
> DLLs, and those data exports cannot be delay-loaded (qdev_prop_array
> and other qdev_prop_*). That would block enabling modules globally
> on Windows.
> 
> Examples:
> 
>   qemu-system -target aarch64 -M virt ...
>   qemu-system-riscv64 -M virt ...
> 
> A combined binary named qemu-system with no arch suffix always
> requires -target. A missing or unknown name fails and points at
> -target ?.
> 
> Changes v1 -> v2:
> - Drop little- and big-endian TargetInfo variants from this series.
>   v1 registered target-info-<name>-le and -be, selected is_default from
>   TARGET_BIG_ENDIAN, and accepted -target tokens such as aarch64-le.
>   v2 keeps one TargetInfo per target_name. Endian variants are later
>   work, not required to link ARM and RISC-V into qemu-system.
> - -target help/? lists target_name only. Unknown names point at
>   -target ? rather than printing the list and exit(1).
> - qemu-system with no arch suffix always requires -target. v1 could
>   still pick a unique TargetInfo when only one was registered.
> - Keep qemu-system-$TARGET; qemu-system is an extra binary. v1
>   described installing per-arch names as symlinks to qemu-system.
> - Do not build qemu-systemw for the combined binary. A Windows GUI
>   twin would keep using exe symbols from DLLs, and data exports
>   cannot be delay-loaded (qdev_prop_array / qdev_prop_*), which
>   would block enabling modules globally on Windows.
> 
> Based-on: <20260724000948.234657-1-pierrick.bouvier@oss.qualcomm.com>
> 
> Yonggang Luo (13):
>   accel: use a shared TYPE_ACCEL_CPU parent
>   hw/riscv/virt: register TYPE_TARGET_SPECIFIC
>   hw/arm/virt: register TYPE_TARGET_SPECIFIC on the abstract parent
>   machine: allow -M name to differ from QOM type
>   hw/riscv/virt: use unique QOM name
>   hw/arm/virt: use unique QOM name
>   hw/arm/virt: prefix ACPI helpers with arm_virt_
>   hw/riscv/virt: prefix ACPI helpers with riscv_virt_
>   hw/loongarch/virt: prefix ACPI helper with loongarch_virt_
>   target/riscv: uniquify TCG crc32, crc32c, and wfi helper names
>   system/vl: add new option -target
>   target-info: dispatch CPU QMP, dump, and arm/riscv semihosting
>   meson: build single binary
> 
>  MAINTAINERS                                   |  1 -
>  accel/accel-common.c                          | 21 ++---
>  hw/arm/virt-acpi-build.c                      |  4 +-
>  hw/arm/virt.c                                 | 17 ++--
>  hw/core/cpu-system.c                          | 23 ++++++
>  hw/core/machine-qmp-cmds.c                    | 26 +++++++
>  hw/core/machine.c                             |  6 ++
>  hw/loongarch/virt-acpi-build.c                |  6 +-
>  hw/loongarch/virt.c                           |  2 +-
>  hw/riscv/virt-acpi-build.c                    |  2 +-
>  hw/riscv/virt.c                               | 12 ++-
>  include/accel/accel-cpu-target.h              |  3 +-
>  include/accel/accel-cpu.h                     |  2 +
>  include/hw/arm/virt.h                         |  6 +-
>  include/hw/core/boards.h                      | 12 ++-
>  include/hw/loongarch/virt.h                   |  2 +-
>  include/hw/riscv/virt.h                       |  6 +-
>  include/qemu/target-info-qom.h                | 42 +++++++++-
>  include/semihosting/common-semi.h             | 56 ++++++++++++--
>  meson.build                                   | 69 ++++++++++++++++-
>  meson_options.txt                             |  2 +
>  qemu-options.hx                               |  8 ++
>  scripts/meson-buildoptions.sh                 |  3 +
>  stubs/dump.c                                  | 27 -------
>  stubs/meson.build                             |  2 -
>  stubs/qmp-cpu.c                               | 21 -----
>  system/vl.c                                   | 44 ++++++++---
>  target-info-qom.c                             | 77 +++++++++++++++++--
>  target-info.c                                 | 32 ++++++++
>  target/arm/arch_dump.c                        |  8 +-
>  target/arm/arm-qmp-cmds.c                     | 15 +++-
>  target/arm/common-semi-target.c               | 23 ++++--
>  target/arm/meson.build                        |  7 +-
>  target/i386/arch_dump.c                       |  8 +-
>  target/i386/cpu-system.c                      | 12 ++-
>  target/i386/cpu.c                             |  6 +-
>  target/loongarch/arch_dump.c                  |  8 +-
>  target/loongarch/loongarch-qmp-cmds.c         | 15 +++-
>  target/mips/system/mips-qmp-cmds.c            | 15 ++--
>  target/ppc/arch_dump.c                        |  8 +-
>  target/ppc/ppc-qmp-cmds.c                     | 15 ++--
>  target/riscv/arch_dump.c                      |  8 +-
>  target/riscv/common-semi-target.c             | 25 ++++--
>  target/riscv/helper.h                         |  6 +-
>  target/riscv/meson.build                      |  4 +-
>  target/riscv/riscv-qmp-cmds.c                 | 15 +++-
>  target/riscv/tcg/bitmanip_helper.c            |  4 +-
>  .../tcg/insn_trans/trans_privileged.c.inc     |  2 +-
>  target/riscv/tcg/insn_trans/trans_xlrbr.c.inc |  4 +-
>  target/riscv/tcg/op_helper.c                  |  2 +-
>  target/s390x/arch_dump.c                      |  8 +-
>  target/s390x/cpu_models_system.c              | 15 +++-
>  tests/qtest/fuzz/fuzz.c                       |  2 +-
>  53 files changed, 562 insertions(+), 207 deletions(-)
>  delete mode 100644 stubs/dump.c
>  delete mode 100644 stubs/qmp-cpu.c
> 

This series iterates on v1, but still does not tackle filtering of
devices/cpus between the targets. This is a prerequisite before being to
mix multiple targets together.

I sent the following series to show how a full filtering would work, and
if it's a direction people here would be interested to follow:
https://lore.kernel.org/qemu-devel/20260828225901.367438-1-pierrick.bouvier@oss.qualcomm.com/T/#t

Regards,
Pierrick

