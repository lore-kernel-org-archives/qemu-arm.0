Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73805C5DF66
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 09:18:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvX0N-0006tA-T8; Sun, 16 Aug 2026 05:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX0L-0006rh-RA
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:18:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX0K-0002I1-0I
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:18:09 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G73bmw2632561
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7RTG1hWtdZCwI55uStqWT0Wn3l+D8+TrqBtstTu3HKM=; b=KGqvvBdB/TS3Fxaq
 +L/0duWBM0FPECxNFpqtk5u6PofIjJ8DJDSemu4urCdJCEY6z/Z5jBpeEJ021cp8
 b7OPh1iWKM4vQqFtMKIZWDNRZ/Z106fgsbxBD6clM0hA71+8MXP1Bwpdzh/Tk/C+
 8Xbq2wOJSwOt5IdO0DmP75yz2e8JVe9PAwaRE9SVV4YbMAW8iWrd4zbQhCvmLGyC
 5JtGcr9jD/ElImBYqx6rHtRKsp3nsgkhn2HO1W1PXJFizBSYvAJhtsHI1Q921B6F
 03iqgaeCYrHrODimAXzkrsqAYLYiO3zVFnPVacvtCO/9wVGZwCYx1yjtdo3iKNrF
 1aNlgQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk35kd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:18:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52d8243f1bcso24770471cf.1
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786871885; x=1787476685; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7RTG1hWtdZCwI55uStqWT0Wn3l+D8+TrqBtstTu3HKM=;
 b=SjhWXjNuUwiItKhvFRaI2WhWPUP76dVZYbDBlNaH8YR9pNCexC+8Tu8pqnBP63yYpN
 Eew3C3guazWpWa4ejv075UZeLnN05glXYnngjhiHNtFsPEPNOipUkI279189s0ZQCckv
 UXP/nCJB60C5idfPcO1Zpwt5QLrA6cPxJEmmw2+UBtk86YOUp/svlOxJJgMYhGnGAXgB
 OWwVoR1M4goVcxcwLnIw6F0N650QexbsnqKo+i2DHeVU04jXOiq0broizsxcF9dMb8Nn
 m0j52ytnL1MbMOoPIjioZOPJ+qcdUf1LQF3pgom5nP/GyxLNhoJUoFwiAcsj0m7xfC3t
 pwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786871885; x=1787476685;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7RTG1hWtdZCwI55uStqWT0Wn3l+D8+TrqBtstTu3HKM=;
 b=CpJQq+22P3KuVQMfw3ubogHhiSTsaYecInWosV7aIpR/Mdjh85do4dKtOZomm6wqj/
 //k9XOEaD8Vzp8hBl/xYZ/L4+XN9KZ14A1JyPm22MhP8zBQ9j09v1+j3xcm7JvREw/Q1
 Y91ueLO1uTeXapT9v+OD8PdA9W9nLGvdL30iks0BLq9HbTYNlDMr0T93C7MHh3AUkaBB
 Mxy3ePQOxejt7/THYtZb8Cw0hyj+0mbwp8UgxwNfS132+4iUeljMZCTCX4ckLmAvq5A7
 NTQoK81pjJyHMeAtmamn8ny8AWNUsTDRl7x7DkOwZutxWSyvpTarkFYCoeDa6kNOM2q6
 prZA==
X-Gm-Message-State: AOJu0YwEZOyh63rIm0R5hiK3YSpi5Vrk4D3r40gNd6ZlSsD0o6BZrMIa
 KjvPBNxnhKVyE9AEOFG1rL9CxjCbjJiPjR0hB8PEqEgZPrep0gtmgiaqmT9zDaHzm6wgDCo5fTD
 3ca4xQG323n3cCYo3e4Dqi+ZMSOA85d1gVI1GdjbTnaWmQVp8i1HcN6g=
X-Gm-Gg: AR+sD10Czi47u97gHylvF+InQ+W9r4aSd/iO4mak0+PLrFmwmbB1ZT1D2JAiSVl43cL
 /gKTUEBWmvcZVLcT9Cv6okDetmaIJCzrmLuqZsF3ZZ2o5K3gJ0j/5NgBX4jZOdDBjKkp5POtvrc
 zX3ZAltQkte7t3yF4sNLSzzkO6baHTJBIRifdJ5t3n208DnaQatF3z2C8trcazHopvrD+ai1yNm
 HshSKX1pWhK07iB/C9BwgxcAYyeNRCG7oeQrfgCYLdgkbriRB+SQAaNp1A1uzqekponCYkT3Q2f
 WK4bZQwkO9ZMYAWWvcTdQOMhU96X/C5iQfmVnP87UJE/4xUomJ5KGPkWeaxwrz1mqKhZ2/FO2gf
 MfvJxPvAoAEGT1cVus9xDxSg0utOImoLIuXk=
X-Received: by 2002:ac8:59d6:0:b0:51c:d1c:10e2 with SMTP id
 d75a77b69052e-52d74b470f7mr240097581cf.12.1786871885604; 
 Sun, 16 Aug 2026 02:18:05 -0700 (PDT)
X-Received: by 2002:ac8:59d6:0:b0:51c:d1c:10e2 with SMTP id
 d75a77b69052e-52d74b470f7mr240097351cf.12.1786871885128; 
 Sun, 16 Aug 2026 02:18:05 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1a91sm21977413f8f.21.2026.08.16.02.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:18:03 -0700 (PDT)
Message-ID: <8f347a98-8b6d-4d1c-83a9-d767760f54f1@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:18:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/18] accel/tcg: Replace size with first/last in
 probe_access_flags
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfX60z+DD1OBVzO
 tF/C135lkJNqEEEkkenOahsIEeLAm0f+SfD16YYLBv6NgdhQpP0uoaTmQyqVfcZW/TUILs2I8ra
 ho+rcCLQaYXSdapTTa+xk8hQupmIZ+0=
X-Proofpoint-GUID: m6lHoSB-5mZDNk7cMeJSPlnY5XLi1l1A
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a81804e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RUurspf9fpIRbrhlMEsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfX2uDTHjrVdbQV
 Hk4aRydse+F2brBntTtYtB1U3xaf5QTSofjp/wD6oVW+cJYkKDjLrwn/+Ecvde0VScOtTCEKFd1
 OAUOLmiG3m9U7pV+wB3sihcltPdLzg/zf9FqW2PY11nOSgvpCG6QpAu0L1UVzEgTi1BHRsWSJzi
 RqxvruzJ4X3Q7CbwbLstziAXMnFyhbHQWANffmgFPjvI4v5J2+kgImZYy9yx6U/WoXV/jSoGKs7
 Tfa9iTIzm0LrWidldrHbdw3syl6Ny0349XzK9mP/oOlvfJGdJGsc/c6G6PwaXdzbipULG3lB25i
 k9wO6eBxkA5PlZpw/YG8bZ4TIabS9+Nw4pFw/dckpiUeCjBV0Wdv8SwihBZFghEcrrvZK39Ey/N
 oOcLHL31OEo/LFgIyUUI2sWirWnL1m9N7p71z4fLZqQ6XR4RKPwZBH7zz6jzNYJ1NlZdYf/Y171
 6e1M5bqlZKryHehcnIA==
X-Proofpoint-ORIG-GUID: m6lHoSB-5mZDNk7cMeJSPlnY5XLi1l1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160069
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 15/8/26 22:37, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/accel/tcg/probe.h        | 24 +++++++++++++++++-------
>   accel/tcg/cputlb.c               | 15 ++++++++-------
>   accel/tcg/user-exec.c            |  7 +++++--
>   semihosting/uaccess.c            | 10 ++++------
>   target/arm/tcg/sve_helper.c      |  5 ++++-
>   target/riscv/tcg/op_helper.c     |  4 ++--
>   target/riscv/tcg/vector_helper.c | 21 ++++++++++++---------
>   target/s390x/tcg/mem_helper.c    |  4 ++--
>   8 files changed, 54 insertions(+), 36 deletions(-)
> 
> diff --git a/include/accel/tcg/probe.h b/include/accel/tcg/probe.h
> index e3068a79de..06faf1269d 100644
> --- a/include/accel/tcg/probe.h
> +++ b/include/accel/tcg/probe.h
> @@ -49,23 +49,33 @@ static inline void *probe_read(CPUArchState *env, vaddr addr, int size,
>   /**
>    * probe_access_flags:
>    * @env: CPUArchState
> - * @addr: guest virtual address to look up
> - * @size: size of the access
> + * @addr: virtual address
> + * @first: beginning of virtual address range
> + * @last: end of virtual address range
>    * @access_type: read, write or execute permission
>    * @mmu_idx: MMU index to use for lookup
>    * @nonfault: suppress the fault
>    * @phost: return value for host address
>    * @retaddr: return address for unwinding
>    *
> - * Similar to probe_access, loosely returning the TLB_FLAGS_MASK for
> - * the page, and storing the host address for RAM in @phost.
> + * Probe an access for [@first, @last], where @addr is somewhere
> + * in that range.  Normally @addr == @first, but some targets have
> + * accesses which are forcibly aligned after an initial fault for an
> + * inaccessible page (e.g. Arm DC_ZVA, where [@first, @last] will be
> + * the bounds of the cacheline containing @addr).
> + *
> + * If the access does not satisfy @access_type:
> + *   - if @nonfault is false, raise an exception at @addr
> + *   - otherwise return TLB_INVALID_MASK.
> + *
> + * Otherwise, return the TLB_FLAGS_MASK for the page, and set @phost:
> + *   - host address for @addr, if direct host accesses are allowed,
> + *   - otherwise NULL.

This If/Otherwise block sounds like implementation detail leaking into
documentation API contract, but I don't mind.

>    *
> - * If @nonfault is set, do not raise an exception but return TLB_INVALID_MASK.
>    * Do not handle watchpoints, but include TLB_WATCHPOINT in the returned flags.
>    * Do handle clean pages, so exclude TLB_NOTDIRY from the returned flags.
> - * For simplicity, all "mmio-like" flags are folded to TLB_MMIO.
>    */
> -int probe_access_flags(CPUArchState *env, vaddr addr, int size,
> +int probe_access_flags(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool nonfault, void **phost, uintptr_t retaddr);


> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index b7b3805a6d..87f2196bc7 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c
> @@ -704,7 +704,7 @@ vext_ldff(void *vd, target_ulong base, CPURISCVState *env,
>       uint32_t esz = 1 << log2_esz;
>       uint32_t msize = nf * esz;
>       uint32_t vma = vext_vma(desc);
> -    target_ulong addr, last, last_in_page, page_split, elems;
> +    target_ulong addr, last, last_in_page, page_split, elems, adj, adj_last;
>       MemOpIdx oi = vext_oi(desc, log2_esz);
>       int mmu_index = get_mmuidx(oi);
>       bool first_active;
> @@ -759,10 +759,10 @@ vext_ldff(void *vd, target_ulong base, CPURISCVState *env,
>        * Test whether the first page is accessible.
>        * If the first element is active, it must succeed.
>        */
> -    flags = probe_access_flags(env, adjust_addr(env, addr),
> -                               MIN(last, last_in_page) - addr + 1,
> -                               MMU_DATA_LOAD, mmu_index, !first_active,
> -                               &host, ra);
> +    adj = adjust_addr(env, addr);
> +    adj_last = MIN(last, last_in_page) - (addr - adj);
> +    flags = probe_access_flags(env, adj, adj, adj_last, MMU_DATA_LOAD,
> +                               mmu_index, !first_active, &host, ra);

Something in this function (on the pre-existing code) bugged me,
confirmed by your cover letter (I haven't looked at the RISCV
preliminary series).

>       /* Get number of complete elements in the first page. */
>       elems = MIN(page_split / msize, vl - i);
> @@ -853,8 +853,10 @@ vext_ldff(void *vd, target_ulong base, CPURISCVState *env,
>            * We have not yet advanced addr to the next page.
>            */
>           target_ulong next_page = addr + page_split;
> -        flags |= probe_access_flags(env, adjust_addr(env, next_page),
> -                                    last - next_page + 1, MMU_DATA_LOAD,
> +
> +        adj = adjust_addr(env, next_page);
> +        adj_last = last - (next_page - adj);
> +        flags |= probe_access_flags(env, adj, adj, adj_last, MMU_DATA_LOAD,
>                                       mmu_index, true, &host, ra);
>   
>           /* Stop if invalid (unmapped) or mmio (transaction may fail). */
> @@ -873,8 +875,9 @@ vext_ldff(void *vd, target_ulong base, CPURISCVState *env,
>               host += addr - next_page;
>           }
>       } else {
> -        flags = probe_access_flags(env, adjust_addr(env, addr),
> -                                   last - addr + 1, MMU_DATA_LOAD,
> +        adj = adjust_addr(env, addr);
> +        adj_last = last - (addr - adj);
> +        flags = probe_access_flags(env, adj, adj, adj_last, MMU_DATA_LOAD,
>                                      mmu_index, true, &host, ra);

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


