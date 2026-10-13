Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E45ACC6B12
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 16:10:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGf5M-0007js-Ql; Tue, 13 Oct 2026 12:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGf5K-0007i0-5L
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 12:10:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGf5E-0001Vh-Dt
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 12:10:36 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69DE3r881999317
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 16:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tUeilFNFhWyK34wXOHl5VAp4bgKGZbf8MIlKfzQWGlE=; b=Ur/HygFfQ5XpUkcs
 VIQcK9X8ulwHpwZBCct9SuZEdN1PLME+a22fFU81J3hqz5LNx9QOyrcCi+IzRoJl
 09vLQOB5qgxD3zekFgWxa/lJCM9HKOv3JRQOkOXAveWVVerFRDbQXUGaEDcCxe4/
 6bAWsJaXgsw9OBpa1Q8FJVa88J1YQ49nIj3gpnvQpKKybc/9IG34KrKo8PETarax
 6UGF+KG0y/7RZ9Vg9hAkOy9Ev0qZdZBHWrAjRd/jNjBUCFFPaVcGmfNAeGVDE526
 29eZYgWxZ9OzsLjwmswkcMrzPf7aWeM5IRdDYuoUUKPgCVtYDxQnmS4tlj5adu42
 sKjJXQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f62ajxt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 16:10:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-97c7e1d8bbeso135993241.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 09:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791907830; x=1792512630; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tUeilFNFhWyK34wXOHl5VAp4bgKGZbf8MIlKfzQWGlE=;
 b=OGlPInvjKMLHP8wxk+0zc9KLKyHHq49kZV+J/VCxlh9kBVoU58SFoOUxtPgR6lHk4a
 UAWxs6iVcupNsqtg4GI1ZeG+/PHcjEnQjBckTAwD9OunOHgqYd/7l7d9U9MXzVMkrt9X
 quXVZi/nxE1ubgFvXsW1O0eIEUSBjc6gsC+KN9tdyu/h2t/V2fs/KGmZq+HA0qQ0euCR
 g7JXRvvCOmFKerBgtnMBTlE2HXG01DgMEuTeuOtQAoJOsXKPE4rVGvkFIykEeChNp6+w
 a9M7T76Ybf72swMVqHqFwMxX4yNcA71z2xVfqmg0Y0iwUy/wCF+VcqRwMk2OzXRCm9M6
 2Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791907830; x=1792512630;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tUeilFNFhWyK34wXOHl5VAp4bgKGZbf8MIlKfzQWGlE=;
 b=qPNPkcLKD8EA3nmp3g9noSBCqAvI5SyOR5Sqqx+aStgizQInLojglj2k37nyvr4EuN
 bVNoFzCmHGA0dyw/Sf8s82hiEP+eS2Jgio3Z7MTyrzBpLXrbqVegJU/TP5N6wqPSCKv5
 8Ny6ElbgUwhRidQxe54J3IU9Cdnxtxg3oTXc4yE0PSXOV/Qy4E/arHy1amcAfNpCB/Os
 DUVHUoBp9Fz081xd4gSkIhJ6ug15ComWqHBSTGBdgvszcPzMth5BShbyGW/BTBufnaf8
 vtzUB9qPgGErm+onevnzMHjiBK3nXI3E7aPk1sZjnC+LU1sCxE1oVCfZZfw54qcVUNjh
 A1hg==
X-Gm-Message-State: AFq9FYLz1ISRIQf0koZud6z7Fnk0eobrOQgwsCx9sW9f+2Pkf5jqOudk
 KTHv6Mnstr56zR8ISy6+wWQoFVYTG4JCCrWEppF9pegP9iqGXwa5Y07XLOOiqgEB2erGtBTsim6
 RtaiqBZzNoIz4q7pJG4T0G3vza2GDJlHWCRDUzXu7prZl6oYhhekC3Ws=
X-Gm-Gg: AYBFou3Z3mAOjzk9ZRPiXq/NH2nYel2uBdSBpmtNCty5eNYcCyK5B3mrj1vYNkIbIK4
 r8H5uJDHDNeG/vh8+hSQliPF9plh/kqZM5IE1+Kmz+NCriIKod2yZyYEL4FRMd66rDchw/uEPUG
 4yGx0NA2DEDGZDQQMyqnIRkZ+WFjCpLRNI84UymSxrbUV6TxzAp94sxoabrqqYkqp+LAHeKLbdL
 kDOABpu/arcl3PrPeoD0EZU8HuzQ+GbfJ8gT84fEU1k2rNvCA6popYeBtjPSz27c5qgW9bDmQb0
 CWGrBrOQtigQ2ELBhFKs5Riig/nBzUACziBWhrhEsULEN1Qz2R7VhbAdA3c7WpPjrwnRwKFzCQh
 UX7Hn6H3mY6ulqs7/W+qV+A==
X-Received: by 2002:a05:6122:134e:b0:5c9:a60b:e5d7 with SMTP id
 71dfb90a1353d-5e91f50454amr3873824e0c.17.1791907829461; 
 Tue, 13 Oct 2026 09:10:29 -0700 (PDT)
X-Received: by 2002:a05:6122:134e:b0:5c9:a60b:e5d7 with SMTP id
 71dfb90a1353d-5e91f50454amr3873799e0c.17.1791907828893; 
 Tue, 13 Oct 2026 09:10:28 -0700 (PDT)
Received: from [10.111.130.93] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bc50e0sm7828492f8f.49.2026.10.13.09.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 09:10:27 -0700 (PDT)
Message-ID: <981c4de8-2b09-49df-bcfa-c1f4fdbf3cfb@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/20] hw/core: Implement Remote Port Memory Master bus
 transactions
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Ruslan Ruslichenko <ruslichenko.r@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 peter.maydell@linaro.org, francisco.iglesias@amd.com,
 edgar.iglesias@gmail.com, berrange@redhat.com, eugene@nuvacore.ai,
 Ruslan_Ruslichenko@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20260915160044.345788-1-ruslichenko.r@gmail.com>
 <20260915160044.345788-12-ruslichenko.r@gmail.com>
 <8f0cfc4a-060c-41a9-81e4-111e0019392f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8f0cfc4a-060c-41a9-81e4-111e0019392f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace57f6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=1cGLs3X8AAAA:8 a=DBfv99YmAAAA:8 a=zd2uoN0lAAAA:8
 a=yC-0_ovQAAAA:8 a=pGLkceISAAAA:8 a=n-ExLmEWMt9OF6EhdaYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=d8ghUycwObenwynNfMyN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2NCBTYWx0ZWRfX+eVOiLweInfI
 jzceB9WlxJn42o5TWifJk9a+ZcVErw+V/YUJS4ua+9YSMWNRbsK8Fe4VbRlNUwq6hnwa2dSSagO
 SJDaUVTaxu2wS4HasYMGaVCImQIrDdg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2NCBTYWx0ZWRfXypAyQF9EgKsI
 TK6hLpRN6/DBGvACLS/S+dxDOx6nNBOOy++cI+/JEClDw4vsHNSTl2jjUXExarTaLgTO8K4L4r9
 JbHBzI+clo21N/wbOKdSSZVj57eNm1uVya8jMg95/8mJiBScDD/DCRD2vkNycJinWV940JLFVEk
 KjaX7H55SBaWCbHZmL8JZrS9x7MPiZ+s0hEzsTS4BiW6ZwYdAKRgDwlxkjWhgOSdq34yLJUrEIp
 EvO0VhjKNle7+591XYWPf8cNIvRpS2boTLwweKQnhFx5M1U0obuMw92JYy+JIzhqYtsIb0WbHew
 imFrrfgm4MkceVBeh7LJH6QR8w2eGKc3MY+dklq6Bv/+E1XrmnoH214kopYG8/+W4RWagadLYbc
 tzSUX8K40YIAR6RmG8QBFnV8CCzVKPTJwS51IwrG3yyIvwdtq5uWc5jS/J/9+d3qnsgej1gikc4
 SMDlrrGoS7YmkWeqyNA==
X-Proofpoint-GUID: KdbnW8tR12HKK5z8uyxD6q8yFxpcH4sL
X-Proofpoint-ORIG-GUID: KdbnW8tR12HKK5z8uyxD6q8yFxpcH4sL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130064
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

On 2026-10-13 18:09, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 2026-09-15 18:00, Ruslan Ruslichenko wrote:
>> From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
>>
>> Implement the core access handlers for the Remote Port Memory
>> Master device, which enables QEMU to initiate memory-mapped
>> transaction to remote peers.
>>
>> The patch adds support for:
>> - Translation of QEMU memory region read/write into Remote Port
>> read/write packets
>> - Support for propagating of transaction attributes
>> (Secure, MasterID)
>> - Synchronous response waiting with optional timeout (timeout
>>    configuration to be added within later patches)
>> - Add trace events for monitoring TX/RX bus transactions
>>
>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>> Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
>> Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
>> ---
>>   hw/core/remote-port-memory-master.c | 191 +++++++++++++++++++++++++++-
>>   hw/core/remote-port.c               |   5 +
>>   hw/core/trace-events                |   4 +
>>   include/hw/core/remote-port.h       |  11 ++
>>   4 files changed, 207 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/core/remote-port-memory-master.c b/hw/core/remote- 
>> port-memory-master.c
>> index 4b0283f9fe..41ef1df518 100644
>> --- a/hw/core/remote-port-memory-master.c
>> +++ b/hw/core/remote-port-memory-master.c
>> @@ -29,18 +29,201 @@
>>   #define RP_MAX_ACCESS_SIZE 4096
>> +static int rp_mm_get_timeout(RPMemoryTransaction *tr)
>> +{
>> +    RemotePortMap *map = tr->opaque;
>> +    RemotePortMemoryMaster *s;
>> +
>> +    if (!map || !map->parent ||
>> +        !object_dynamic_cast(OBJECT(map->parent),
>> +                             TYPE_REMOTE_PORT_MEMORY_MASTER)) {
>> +        return 0;
>> +    }
>> +    s = REMOTE_PORT_MEMORY_MASTER(map->parent);
>> +    return s->rp_timeout;
>> +}
>> +
>> +MemTxResult rp_mm_access_with_def_attr(RemotePort *rp, uint32_t rp_dev,
>> +                                       struct rp_peer_state *peer,
>> +                                       RPMemoryTransaction *tr,
>> +                                       bool relative, uint64_t offset,
>> +                                       uint32_t def_attr)
>> +{
>> +    uint64_t addr = tr->addr;
>> +    RemotePortRespSlot *rsp_slot;
>> +    RemotePortDynPkt *rsp;
>> +    struct  {
>> +        struct rp_pkt_busaccess_ext_base pkt;
>> +        uint8_t reserved[RP_MAX_ACCESS_SIZE];
>> +    } pay;
>> +    uint8_t *data = rp_busaccess_tx_dataptr(peer, &pay.pkt);
>> +    struct rp_encode_busaccess_in in = {0};
>> +    int i;
>> +    int len;
>> +    int rp_timeout = rp_mm_get_timeout(tr);
>> +    MemTxResult ret;
>> +
>> +    if (tr->rw) {
>> +        /* Data up to 8 bytes is passed as values.  */
>> +        if (tr->size <= 8) {
>> +            for (i = 0; i < tr->size; i++) {
>> +                data[i] = tr->data.u64 >> (i * 8);
>> +            }
>> +        } else {
>> +            memcpy(data, tr->data.p8, tr->size);
>> +        }
>> +    }
>> +
>> +    addr += relative ? 0 : offset;
>> +
>> +    in.cmd = tr->rw ? RP_CMD_write : RP_CMD_read;
>> +    in.id = rp_new_id(rp);
>> +    in.dev = rp_dev;
>> +    in.clk = rp_normalized_vmclk(rp);
>> +    in.master_id = tr->attr.requester_id;
>> +    in.addr = addr;
>> +    in.attr = def_attr;
>> +    in.attr |= tr->attr.secure ? RP_BUS_ATTR_SECURE : 0;
>> +    in.size = tr->size;
>> +    in.stream_width = tr->size;
>> +    len = rp_encode_busaccess(peer, &pay.pkt, &in);
>> +    len += tr->rw ? tr->size : 0;
>> +
>> +    
>> trace_remote_port_memory_master_tx_busaccess(rp_cmd_to_string(in.cmd),
>> +        in.id, in.flags, in.dev, in.addr, in.size, in.attr);
>> +
>> +    rp_rsp_mutex_lock(rp);
>> +    rp_write(rp, (void *) &pay, len);
>> +
>> +    if (!rp_timeout) {
>> +        rsp_slot = rp_dev_wait_resp(rp, in.dev, in.id);
>> +    } else {
>> +        rsp_slot = rp_dev_timed_wait_resp(rp, in.dev, in.id, 
>> rp_timeout);
>> +        if (rsp_slot->valid == false) {
>> +            /*
>> +             * Timeout error
>> +             */
>> +            rp_rsp_mutex_unlock(rp);
>> +            return MEMTX_ERROR;
>> +        }
>> +    }
>> +    rsp = &rsp_slot->rsp;
>> +
>> +    /* We dont support out of order answers yet.  */
>> +    assert(rsp->pkt->hdr.id == in.id);
>> +
>> +    switch (rp_get_busaccess_response(rsp->pkt)) {
>> +    case RP_RESP_OK:
>> +        ret = MEMTX_OK;
>> +        break;
>> +    case RP_RESP_ADDR_ERROR:
>> +        ret = MEMTX_DECODE_ERROR;
>> +        break;
>> +    default:
>> +        ret = MEMTX_ERROR;
>> +        break;
>> +    }
>> +
>> +    if (ret == MEMTX_OK && !tr->rw) {
>> +        data = rp_busaccess_rx_dataptr(peer, &rsp->pkt- 
>> >busaccess_ext_base);
>> +        /* Data up to 8 bytes is return as values.  */
>> +        if (tr->size <= 8) {
>> +            for (i = 0; i < tr->size; i++) {
>> +                tr->data.u64 |= ((uint64_t) data[i]) << (i * 8);
>> +            }
>> +        } else {
>> +            memcpy(tr->data.p8, data, tr->size);
> 
> I don't understand this direct memory access.
> 
> Shouldn't this be handled by the FlatView and end as a subpage_t
> leaf instead?
> 
> Doing some archeology to understand:
> https://lore.kernel.org/qemu-devel/20170204115048.GM12995@toto/

I meant v3:
https://lore.kernel.org/qemu-devel/1493391576-29401-1-git-send-email-fred.konrad@greensocs.com/

> 
> Amusingly a related backtrace:
> https://lore.kernel.org/qemu-devel/CAKmqyKOqbJ+-t0SeyZDzDM9RLEQX63WM3- 
> wyJTbiMGHRKtHPYQ@mail.gmail.com/
> 
>> +        }
>> +    }
>> +
>> +    trace_remote_port_memory_master_rx_busaccess(
>> +        rp_cmd_to_string(rsp->pkt->hdr.cmd), rsp->pkt->hdr.id,
>> +        rsp->pkt->hdr.flags, rsp->pkt->hdr.dev, rsp->pkt- 
>> >busaccess.addr,
>> +        rsp->pkt->busaccess.len, rsp->pkt->busaccess.attributes);
>> +
>> +    if (rp_timeout) {
>> +        for (i = 0; i < ARRAY_SIZE(rp->dev_state[rp_dev].rsp_queue); 
>> i++) {
>> +            if (rp->dev_state[rp_dev].rsp_queue[i].used &&
>> +                rp->dev_state[rp_dev].rsp_queue[i].valid) {
>> +                rp_resp_slot_done(rp, &rp- 
>> >dev_state[rp_dev].rsp_queue[i]);
>> +            }
>> +        }
>> +    } else {
>> +        rp_resp_slot_done(rp, rsp_slot);
>> +    }
>> +    rp_rsp_mutex_unlock(rp);
>> +
>> +    /*
>> +     * For strongly ordered or transactions that don't allow Early 
>> Acking,
>> +     * we need to drain the pending RP processing queue here. This is
>> +     * because RP handles responses in parallel with normal requests so
>> +     * they may get reordered. This becomes visible for example with 
>> reads
>> +     * to read-to-clear registers that clear interrupts. Even though the
>> +     * lowering of the interrupt-wires arrives to us before the read- 
>> resp,
>> +     * we may handle the response before the wire update, resulting in
>> +     * spurious interrupts.
>> +     *
>> +     * This has some room for optimization but for now we use the big 
>> hammer
>> +     * and drain the entire qeueue.
>> +     */
>> +    rp_process(rp);
>> +
>> +    /* Reads are sync-points, roll the sync timer.  */
>> +    rp_restart_sync_timer(rp);
>> +    return ret;
>> +}
>> +
>> +MemTxResult rp_mm_access(RemotePort *rp, uint32_t rp_dev,
>> +                         struct rp_peer_state *peer,
>> +                         RPMemoryTransaction *tr,
>> +                         bool relative, uint64_t offset)
>> +{
>> +    return rp_mm_access_with_def_attr(rp, rp_dev, peer, tr, relative, 
>> offset,
>> +                                      0);
>> +}
>> +
>>   static MemTxResult rp_mm_read(void *opaque, hwaddr addr, uint64_t 
>> *data,
>>                                    unsigned size, MemTxAttrs attrs)
>>   {
>> -    /* TBD */
>> -    return MEMTX_OK;
>> +    MemTxResult ret;
>> +    RemotePortMap *map = opaque;
>> +    RemotePortMemoryMaster *s = map->parent;
>> +
>> +    RPMemoryTransaction tr = {};
>> +
>> +    tr.opaque = map;
>> +    tr.rw = false;
>> +    tr.addr = addr;
>> +    tr.size = size;
>> +    tr.attr = attrs;
>> +
>> +    ret = rp_mm_access(s->rp, s->rp_dev, s->peer, &tr, s->relative,
>> +                map->offset);
>> +
>> +    if (ret == MEMTX_OK) {
>> +        *data = tr.data.u64;
>> +    }
>> +
>> +    return ret;
>>   }
>>   static MemTxResult rp_mm_write(void *opaque, hwaddr addr, uint64_t 
>> data,
>>                                     unsigned size, MemTxAttrs attrs)
>>   {
>> -    /* TBD */
>> -    return MEMTX_OK;
>> +    RemotePortMap *map = opaque;
>> +    RemotePortMemoryMaster *s = map->parent;
>> +
>> +    RPMemoryTransaction tr = {};
>> +
>> +    tr.opaque = map;
>> +    tr.rw = true;
>> +    tr.addr = addr;
>> +    tr.size = size;
>> +    tr.attr = attrs;
>> +    tr.data.u64 = data;
>> +
>> +    return rp_mm_access(s->rp, s->rp_dev, s->peer, &tr, s->relative,
>> +                    map->offset);
>>   }
>>   static const MemoryRegionOps rp_ops_template = {
>> diff --git a/hw/core/remote-port.c b/hw/core/remote-port.c
>> index b4c9fa1528..6a6effdd19 100644
>> --- a/hw/core/remote-port.c
>> +++ b/hw/core/remote-port.c
>> @@ -39,6 +39,11 @@ static void rp_event_read_and_process(RemotePort *s);
>>   static void sync_timer_hit(void *opaque);
>>   static void syncresp_timer_hit(void *opaque);
>> +uint32_t rp_new_id(RemotePort *s)
>> +{
>> +    return qatomic_fetch_inc(&s->current_id);
>> +}


