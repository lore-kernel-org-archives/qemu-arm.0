Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD629606A323
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DPgCbaDx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyzsWD0E
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQPsM-0004Xp-AG; Mon, 09 Nov 2026 08:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xQPrx-0004V7-QP
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 08:57:13 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xQPrv-0007Al-Tl
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 08:57:09 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9DF1sA3460961
 for <qemu-arm@nongnu.org>; Mon, 9 Nov 2026 13:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FVEL79GCFjGusR02Zx3qXNoz4nInHBN3g0JHTkaTd+Y=; b=DPgCbaDxjXv3EAmO
 sXto3fDXMLDAwMq8O5FNYN/YmY/Y2nCN8EHqNXIRMXMMzwQcuP3RxWYrN4pvBVDM
 cazMYJum9+agDeRRdVUicIWmJ08X5SQFg//Y7HI0DXMzeKgZP9TcMHE9VYILA1lO
 v1aR71rvjMl8RUSY+YuMHYf1+jVDiB4bXDceB/Wf1/I/TU1sf78ExiRyEApKHoJ+
 9x9sKh2wJvPHcamEfH/zCAwSmRiv/DY7hep6MztSVLAmik5v4OQz2qnZVbn7lbB8
 JzS+MonA2T6Js/FBcSDpi4sLHxcC54uN3kJX0UMYvfdg0Nd1RtObhnhS1AF/JGtp
 TzOAPA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rrbag-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 13:57:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7d2d5cc693fso135847137.3
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 05:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794232625; x=1794837425; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FVEL79GCFjGusR02Zx3qXNoz4nInHBN3g0JHTkaTd+Y=;
 b=HyzsWD0EfPGAnBphHCwUucz3qNwy75bly879pZS3qDLEon+z/3HLrzUsuqyW9SAlsi
 ZjBKyHem73L/ygyjlmCRXysDSPptGWxDRILji8fBcOdsi6ihhCIsZxgPBlHx3l6nfgwO
 TskjphLQw0M4+37S7ItCBM4vEOE8uxCUAblVe2tP40Yuwo+7BCuIQ8oUnhAwbJR0UtnK
 fcZ0l+QM/PqLpbh99r8LZfKCls7GijawBnKEJj4/CGFsidM8M9Y8smyG7iW9MFlZc1AY
 AHvRxBdalVdS6bQo73nwrWcJ1XZj5Y72eqmTlWD2crAaNcr0cbZwnu1OQi8Vdn6u7wvh
 Pjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794232625; x=1794837425;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FVEL79GCFjGusR02Zx3qXNoz4nInHBN3g0JHTkaTd+Y=;
 b=vnY9B1ur3OHNkg/1jDtirQkVS2+vGIDCCKwvWTj8cGtEONtHpqzBJ6reAjFPzSyU8o
 CEj8vighiVJkqfp61BcFLuWYJXk0BBiXzdpXxIUU5orD15m1sivn9p1pHH5zaDp/zdfy
 LJgywQUBukIvRVopTdzDrlSsSxWG2sgUEMK/OfyUrzj2B8ePB+W0qlxuhrkTcZGbyKWD
 wgxV/70TMY1eBUjdu5Nk0J8alAKec3X4L+JYJSjmOX8eIOP59cUxqZdkINKXJCDpHZ6Q
 6fnS3DWouYSfsnQlG54dLYjQQkw0MJydtCG89TF2h55bkipKgN7utT/Xa3tQSYCH4IGK
 Fgag==
X-Forwarded-Encrypted: i=1;
 AL+hErHcVIq6LKkx8NmaqRmxw14JAAmgZ6hZHiIjfLx7sZ2J2Jk2KVG0QjLGePQW8BEjLB52P5aWy72Vcg==@nongnu.org
X-Gm-Message-State: APuU4Z8eVaiXDrbxeZoXjqea4YoMRc+LNzdHreMD3OXrRPZnt/7bVtNS
 p+O+JoXp9TWFn5ytED6Q91NtLWt0AbdkxQrKXNUyUUUFl7fYWSDCRAeRn+ZPKdvxoX4f9CjeOD2
 CjiNUeZ50whwIG4P/Un/dHfo6n5/7B305T/nSQsP0uCwrWsJS8ueTgxs=
X-Gm-Gg: AYBFou0pWbGSRHhEpsSl4hpk2OJf3E3DhOWTVISeQph3xh7GnemF7NqA8+G96EJs8cM
 xi3c02EJl03qWUf1LTHmEhsCzJDLQY7wKE0HZoVcLGU61BCS6NJcTRCJHIlQWO9jmX6yG0KWcXx
 0pJnLb9nEkTCfpwHc1B5LF1BEO9XYoopvXdUQ3ufNx9nyT+L//27bfiEoF44hZDGBOY4yDX6JbJ
 9/v81wWbO8S+ddPafJX7qSP8EqMOVqHvI0IKFRFNgJ8A9kp/fBg3K/93x24+J1qCHBfDqNWLyG9
 WckHEIfDLxCClFcE1HMrQ+Wxpq4lDbGMHbOjYiJ2/yJKUcbz0zSH0+UtptGe8pHdbvng5c9R0XT
 EzNdRtm2m6voXBfhCB7v6RjRR9EQtwpg9L66bCLPY6WvN2jahd4+CRpZTBJNTYKh+lxTT4gVYdb
 z3A8RKKw==
X-Received: by 2002:a05:6102:5707:b0:7c1:b55d:373c with SMTP id
 ada2fe7eead31-7d2db148ff5mr1077480137.31.1794232625060; 
 Mon, 09 Nov 2026 05:57:05 -0800 (PST)
X-Received: by 2002:a05:6102:5707:b0:7c1:b55d:373c with SMTP id
 ada2fe7eead31-7d2db148ff5mr1077467137.31.1794232624305; 
 Mon, 09 Nov 2026 05:57:04 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b90f1117fasm161971685e9.13.2026.11.09.05.57.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 05:57:03 -0800 (PST)
Message-ID: <6047095a-2957-4d8d-99aa-055a63d753e8@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:57:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/net: cadence: Honor subword lanes in the GEM
 registers
Content-Language: en-US
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowangio@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260927075108.3621107-1-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260927075108.3621107-1-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SthLTvaBnwTVI2u1XcwsEPzELBllPNCn
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1d131 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=FRSEYCzRAAAA:8 a=EUspDBNiAAAA:8 a=EQ01kqYfchsW0whbod4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfXzJ/k3WHvzKOI
 FjCwyYd6cgyp5FmxqcvFXERz7tSqYpSCgC4cYQAiIvNO1feK501cltzQdI8fR6Ov7rlmZQC+d3S
 VreU4OcJL0oDQZ82vkPP0C0biduVgRLe/jMzMfvHPipJTj44GE3pemqs8o0tuGIv8pRFplrk9NY
 xo+m0R4uzVM2kQnFysoKmLi0fxmwfrkrZq/YBBZPVK/URftOClUUWFJJCVv+LD8nluNKV+rBnx0
 RUQytXxJli55QH05s/vA7M/cuLzlNvuXWqiqxGppzlHot0HmQeCjoG7TxgJHUq50AxJKzz5pMv4
 V491++JUktc+S1QVJDNNl/fqJel7Nw7bk95inAAvq14u6wdR1ZuL7fbHIe5uwNM3dZLzhsgpD/y
 kim8hw/RgEDLM8prhL5yVX24Yhlgx/yVaYqzqKtjO95MYaRJ9yn+X1cZ4hEdFnTpTfR/UYKPElJ
 VfxQvlGPGpcrHlXyWsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX4JUyPmw+cQYp
 WzQu6nCzdrK5/at9zV9IRHv0T7nL4C1NsJ4UVba7yg/gn0hsIDi9O/3MzbhVufwCgxumC5nnYjc
 uGXVWaiI+h67DyPZR3XuQC0EG/Xcc1Y=
X-Proofpoint-ORIG-GUID: SthLTvaBnwTVI2u1XcwsEPzELBllPNCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bin,

On 27/9/26 09:51, Bin Meng wrote:
> The GEM MMIO callbacks ignored the low address bits and access size.
> Byte reads therefore always returned lane zero, causing guest driver
> that reads the station address byte by byte to turn four unique MAC
> addresses into the same value. Partial writes had the corresponding
> lane-selection problem.
> 
> Extract the requested little-endian read lane and merge partial writes
> with the current register value. Preserve the existing read-clear,
> write-clear, and command side effects, including dynamic queue
> pointers.
> 
> Fixes: e9f186e514a7 ("cadence_gem: initial version of device model")
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> 
> ---
> 
> Changes in v2:
> - drop the gem_get_register() helper
> 
>   hw/net/cadence_gem.c | 55 +++++++++++++++++++++++++++-----------------
>   1 file changed, 34 insertions(+), 21 deletions(-)


> @@ -1636,35 +1639,43 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
>           unsigned size)
>   {
>       CadenceGEMState *s = (CadenceGEMState *)opaque;
> -    uint32_t readonly;
> +    uint32_t access_mask;
> +    uint32_t writable_mask;
> +    uint32_t write_val;
> +    unsigned shift;
>       int i;
>   
>       DB_PRINT("offset: 0x%04x write: 0x%08x ", (unsigned)offset, (unsigned)val);
> +    shift = (offset & 3) * 8;
> +    access_mask = MAKE_64BIT_MASK(shift, size * 8);
> +    write_val = (uint32_t)val << shift;
>       offset >>= 2;
>   
>       /* Squash bits which are read only in write value */
> -    val &= ~(s->regs_ro[offset]);
> -    /* Preserve (only) bits which are read only and wtc in register */
> -    readonly = s->regs[offset] & (s->regs_ro[offset] | s->regs_w1c[offset]);
> +    write_val &= ~(s->regs_ro[offset]);
>   
> -    /* Copy register write to backing store */
> -    s->regs[offset] = (val & ~s->regs_w1c[offset]) | readonly;
> +    /* Copy writable bits in the accessed lanes to the backing store */
> +    writable_mask = access_mask &
> +                    ~(s->regs_ro[offset] | s->regs_w1c[offset]);
> +    s->regs[offset] = (s->regs[offset] & ~writable_mask) |
> +                      (write_val & writable_mask);
>   
>       /* do w1c */
> -    s->regs[offset] &= ~(s->regs_w1c[offset] & val);
> +    s->regs[offset] &= ~(s->regs_w1c[offset] & write_val);
>   
>       /* Handle register write side effects */
>       switch (offset) {
>       case R_NWCTRL:
> -        if (FIELD_EX32(val, NWCTRL, ENABLE_RECEIVE)) {
> +        if (FIELD_EX32(write_val, NWCTRL, ENABLE_RECEIVE)) {
>               for (i = 0; i < s->num_priority_queues; ++i) {
>                   gem_get_rx_desc(s, i);
>               }
>           }
> -        if (FIELD_EX32(val, NWCTRL, TRANSMIT_START)) {
> +        if (FIELD_EX32(write_val, NWCTRL, TRANSMIT_START)) {
>               gem_transmit(s);
>           }
> -        if (!(FIELD_EX32(val, NWCTRL, ENABLE_TRANSMIT))) {
> +        if ((access_mask & R_NWCTRL_ENABLE_TRANSMIT_MASK) &&

This new TX-enable check should either be in a distinct logical
patch, or described in patch description.

> +            !(FIELD_EX32(s->regs[offset], NWCTRL, ENABLE_TRANSMIT))) {
>               /* Reset to start of Q when transmit disabled. */
>               for (i = 0; i < s->num_priority_queues; i++) {
>                   s->tx_desc_addr[i] = gem_get_tx_queue_base_addr(s, i);
> @@ -1679,37 +1690,37 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
>           gem_update_int_status(s);
>           break;
>       case R_RXQBASE:
> -        s->rx_desc_addr[0] = val;
> +        s->rx_desc_addr[0] = s->regs[offset];
>           break;
>       case R_RECEIVE_Q1_PTR ... R_RECEIVE_Q7_PTR:
> -        s->rx_desc_addr[offset - R_RECEIVE_Q1_PTR + 1] = val;
> +        s->rx_desc_addr[offset - R_RECEIVE_Q1_PTR + 1] = s->regs[offset];
>           break;
>       case R_TXQBASE:
> -        s->tx_desc_addr[0] = val;
> +        s->tx_desc_addr[0] = s->regs[offset];
>           break;
>       case R_TRANSMIT_Q1_PTR ... R_TRANSMIT_Q7_PTR:
> -        s->tx_desc_addr[offset - R_TRANSMIT_Q1_PTR + 1] = val;
> +        s->tx_desc_addr[offset - R_TRANSMIT_Q1_PTR + 1] = s->regs[offset];
>           break;
>       case R_RXSTATUS:
>           gem_update_int_status(s);
>           break;
>       case R_IER:
> -        s->regs[R_IMR] &= ~val;
> +        s->regs[R_IMR] &= ~write_val;
>           gem_update_int_status(s);
>           break;
>       case R_JUMBO_MAX_LEN:
> -        s->regs[R_JUMBO_MAX_LEN] = val & MAX_JUMBO_FRAME_SIZE_MASK;
> +        s->regs[R_JUMBO_MAX_LEN] &= MAX_JUMBO_FRAME_SIZE_MASK;
>           break;
>       case R_INT_Q1_ENABLE ... R_INT_Q7_ENABLE:
> -        s->regs[R_INT_Q1_MASK + offset - R_INT_Q1_ENABLE] &= ~val;
> +        s->regs[R_INT_Q1_MASK + offset - R_INT_Q1_ENABLE] &= ~write_val;
>           gem_update_int_status(s);
>           break;
>       case R_IDR:
> -        s->regs[R_IMR] |= val;
> +        s->regs[R_IMR] |= write_val;
>           gem_update_int_status(s);
>           break;
>       case R_INT_Q1_DISABLE ... R_INT_Q7_DISABLE:
> -        s->regs[R_INT_Q1_MASK + offset - R_INT_Q1_DISABLE] |= val;
> +        s->regs[R_INT_Q1_MASK + offset - R_INT_Q1_DISABLE] |= write_val;
>           gem_update_int_status(s);
>           break;
>       case R_SPADDR1LO:
> @@ -1725,7 +1736,9 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
>           s->sar_active[(offset - R_SPADDR1HI) / 2] = true;
>           break;
>       case R_PHYMNTNC:
> -        gem_handle_phy_access(s);
> +        if (access_mask & (R_PHYMNTNC_OP_MASK | R_PHYMNTNC_ST_MASK)) {

A byte write to another lane no longer starts a PHY operation;
worth mentioning in the description?

> +            gem_handle_phy_access(s);
> +        }
>           break;
>       }

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


