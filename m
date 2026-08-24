Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A247C5DF9C
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 16:37:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyXfS-0005kT-4s; Mon, 24 Aug 2026 12:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wyXfQ-0005jF-6t
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 12:37:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wyXfN-0007NV-SA
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 12:36:59 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67OFmetL263513
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 16:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ELv8OocQzbmTIbOjN/8WH1ujSQn6vaDWJl3uhStwmbU=; b=Zrw253jo2lCCB+KS
 jzYEP0ya0t0WrYOZbVytj4K7YYs1d58qJQ5mYenYNqqhiNogaVnhihmKtA8GiHk9
 wPOe8AKE7J16+gDBx5zUNUw1Uhpa+Dhxo9s3i/OWDHsL3PiMOipU+bRf+SSgNftd
 pqszQP1+ES+aUYV/9W23ZTr4ngEHT/DFqPRaYopiECjKhwmZ91NEFm9YNYOu9fSS
 iL4vM2u3yShf9O9c3tFM0hPrq5ZTYrB8UdrqvVoe+XG3KJd9zMuvpccgUxo0pnsN
 jXoeT/CZzpA0R42gYvDDXYkyYqk0yzlX4XUduZgagFhHPvcfKWKboBVGRb/kcs/d
 YDrDNA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpkvbt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 16:36:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-ca124bf0189so74598a12.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787589415; x=1788194215; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ELv8OocQzbmTIbOjN/8WH1ujSQn6vaDWJl3uhStwmbU=;
 b=AvKvE31loiZboYjZsWbXlZyw/LbyyLNgJVRFse499gtnNTrqVn5w5u7HTiZOEfUS8T
 Y4sHxZh95DELdc3Zly3GfBh5NvJAZ97/iC4m7HffvFAePE5ULui/KD1bOqj8ufnd+akd
 0vC8jMGqdKGXKMNRTzkswuJsmJOGBPfCDegA9zjP2BD7DIaHSjCbsBzrLaY/lVyt1Tj5
 UcZt00qsBGWVVogk9Urj9v1azRtYQpZZLCk37jbweEU2q3ec1+cuCtk4706al1eLNzhF
 CT7zwXGl0FIvKzJ2INIZ3DSbl/cp6OhWkGAoeO0iAasR6bUlhF97zoXFhEKm2MtZ2lg0
 fZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787589415; x=1788194215;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ELv8OocQzbmTIbOjN/8WH1ujSQn6vaDWJl3uhStwmbU=;
 b=PP0NRkccDc3gLtTY3GywkacVFFx88bBoJeFZv+VX0Co9uFRLzNxBClgqXSYioupEzA
 hQ5tDfG8NeAWi/WUmMebEvC9khsOoyMFLnX5TypTRZI/s5Uc8jO0hFU2XUe6d3D4OHvE
 SOReGv6opqrpEl1pZaKYQuUtU+jDuk9PQLYxfS/wcVildkB+pw8VktvdyiHqSIzhsTvs
 f1/1T91TDhW8p8g65ZUrGx3fWxQAnJtsMzDuF+4oiYA3FUdYi8/WoQbP4bL7EoOVjzJ5
 95zpbDDvoQAi0uEsEqxQV4dUBuU/b0kZzccCZg+2PMHB0Sgo00eIx2B02AIkjuuWMFrr
 a2Fw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqiBD7xWwymc8NLn8nndDeeh+v7ZyAIcBsiwVKvvPelCORadMh1tV+u/obNqEjLthzjkCLdFqx9og==@nongnu.org
X-Gm-Message-State: AFuF++mlcL9ost5O4dkqddATzt06NtcWiLnknu+2o/wstaZBG5krXH5W
 v2o6y35UjHZRg4hlRNbW/V/1zCmUZD86zdkGjJ+wxTyImcaJ9JuHvt8rK0ORTarnNZA5cQP4Rr4
 rUkoOm0PDMWXXhSJKPNwmdp3dIV5sJ3FTQK5Z4iQeLaz/hBBjboGB6CQ=
X-Gm-Gg: AR+sD10SMAfIDSt8raNA/hgbFRulYxl5385lxwcG3nN7qjxoYqa4/PzDIyjtVi6pVee
 KJcxvt/Re8xuIJANf16mzZMMJ+8/07fGb8vFoZ0E1fuA0X311tZfYzbLQTDGqdEFaR4oP7BjN/x
 17GD/C62lnb+crIS/yKRm6W53somFoju+d1iVqxh7qlrFVPXuqJGmY/nYI7AHOzeYflM1lNvgEd
 zVT6WPYyT8d8J7WXKmmbJJXX+wv0inCbshz10sG2QPzT9Xu1QBKaVeaIikjgc/0Veaohqy6keiL
 +rkSKMhiLn8OFB744Jn9/51aNZu6dnzF+s2Dpo5cTR1/Fif6YOwycQBerMnubRs4bqNKZcHpgx5
 +89o9FNQkOQ9EFdZ9GF9IbjX0KJavv8OvoGZc3p2ni9h/+hj7g1AANuzC41YvJOyZoc0R
X-Received: by 2002:a17:90a:da84:b0:395:c3f7:2895 with SMTP id
 98e67ed59e1d1-3964595f81bmr671505a91.7.1787589414673; 
 Mon, 24 Aug 2026 09:36:54 -0700 (PDT)
X-Received: by 2002:a17:90a:da84:b0:395:c3f7:2895 with SMTP id
 98e67ed59e1d1-3964595f81bmr671363a91.7.1787589414094; 
 Mon, 24 Aug 2026 09:36:54 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1418619d6ecsm25811060c88.14.2026.08.24.09.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 09:36:53 -0700 (PDT)
Message-ID: <f318d50d-f3b7-4b1d-8c80-b8bbdbf8097f@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 09:36:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] single-binary: link ARM and RISC-V into qemu-system
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260823150731.896-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0MCBTYWx0ZWRfXyQ09wn9x6p1z
 S3Vsu+W3sNv8G7pOYk12uvu/Drhnjh9dw1pTXxvBK34oRtM+cFD+xlP7BRV13iGTlv0YtABjdJ2
 7jNJcMQ2I6lVLbSTwaPxZCSap/qOB0ZGtOosJAfw4J3WRndMg7VIozoeq0/sBgpjA4CfAtv/75m
 cxlB5Cu4fG2Ma5AwKI/uMHD4t8J1SryafDEj5X8Y+IYCvJgd/t4QYdi54ttNPDhRHQiJ2qWJ7Rj
 kfv07n/ckKRwjWWsBhOUHHERqAqEZIIInR0i4rF7ABmMiwPIISN2az0+oIPcsMX5HaQ78YgQZxu
 bt0tyCdJXw+bYExr2lqaHHtR3i+4lht8hDfqU3SAjRsshbE2077caQWi7AoaMVuBq+fPzyEPTSV
 ND2dE/uvN2+mW/UUUlSZENM2AFBhAtox2gWt4V4UYiN+99/Ag5KvkiPosAofBSoWbboxiy9YB9P
 48YAiDit93riLmVISFw==
X-Proofpoint-GUID: nv6hZaA9WwjvFVjw_jQ0waZM6Rt6WFfR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0MCBTYWx0ZWRfX1ne4+BFwSXqv
 iDHtAzbewF7qNx+Eo+SE8+5SFxBlWgsk9curgaceabdpi43IZsV9rUqOdo/zC3ZqpiBv0NA8hlG
 uHYe68lRcx/rUA0T0ch5unwrwBsyjWQ=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c7327 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=GaQpPoNlAAAA:8 a=EUspDBNiAAAA:8 a=Ji8BX0x28jMlS6CmfGsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-ORIG-GUID: nv6hZaA9WwjvFVjw_jQ0waZM6Rt6WFfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240140
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Yonggang,

On 8/23/2026 8:07 AM, Yonggang Luo wrote:
> This series produces one qemu-system binary that can run ARM (32 and 64)
> and RISC-V (32 and 64, little- and big-endian TargetInfo). It follows
> Pierrick Bouvier's merged series "single-binary: implement dynamic
> filtering for machine types":
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
>   boards keep -machine virt via mc->alias after the selected target is
>   applied.
> - virt ACPI helpers and RISC-V TCG crc32/crc32c/wfi helpers get an arch
>   prefix so the combined link does not need meson -D name mangling.
>   LoongArch virt_acpi_setup is renamed in the same pass.
>

Thanks for those patches, that's needed to be able to mix riscv and arm
base architectures.

> Target selection then has to work with more than one TargetInfo in the
> process:
> 
> - Register target-info-<name>-le and -be from one system
>   target-info-def.c unit, sharing arch fields. is_default follows
>   TARGET_BIG_ENDIAN so riscv/arm stay LE and ppc/s390x stay BE when
>   -target is omitted.

What is the goal here? Does it model something existing, or is it an
addition?

> - Parse -target before TargetInfo is fixed. Tokens are target_name or
>   target_name-be / -le. When -target is omitted, infer the token from
>   the program basename (strip .exe, longest registered suffix, drop a
>   trailing w for Windows GUI binaries).
> - Combined binaries cannot keep one global C symbol per arch for
>   query-cpu-definitions, dump notes, or Angel semihosting. Those
>   handlers move onto a process-wide TargetCpuOps table.
> 
> The last patch builds qemu-system (and qemu-systemw on Windows) from
> aarch64 common/system objects plus RISC-V arch objects, and installs
> qemu-system-{arm,aarch64,riscv32,riscv64} as symlinks so argv[0] still
> selects TargetInfo.
> 
> Examples:
> 
>   qemu-system -target aarch64 -M virt ...
>   qemu-system-riscv64 -M virt ...
> 
> A basename that matches no registered token falls through to the unique
> default. A combined binary with no suffix requires -target when more
> than one default TargetInfo is registered.
> 
> Based-on: <20260724000948.234657-1-pierrick.bouvier@oss.qualcomm.com>
>

thanks for posting this.

I was purposefully waiting to solve filtering issues for
machines/cpus/devices before sending any new command line switch, or
build system for single-binary to help focusing conversations. That
said, that's my personal approach and there is nothing wrong here.
Thanks for giving a glimpse to our community about what it will look like.

Regards,
Pierrick

