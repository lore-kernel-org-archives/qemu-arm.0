Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BEBFD9E3A
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 19:49:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vw3q1-0006tN-IJ; Fri, 27 Feb 2026 14:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1vw3pz-0006sg-9d
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 14:49:23 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1vw3px-00069W-Ev
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 14:49:23 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0Mij065418
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 19:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6K9sfSR2fIEkQwYqHVZ/5+9B6OUMNvks+hlGXi/67i8=; b=Z/XF0LGIxnk4XX3a
 X5KL4eed1shr3gdKRk/4QG2MPqS3gfqk1Aa1NEEyw3UYgzxzCltrQUC5vll66/dW
 9H+YKVscTEuUareVKWhCHRh0nZi5tbimu516t/7yyNo7b/aKgr1UgmE8O9V267vP
 iupfT808899I24UAtX7TANjcb2J7I0tbvia+2Dl8ys8wNsrpfgXdQCE3Z66Tx6gn
 w5PWgYnfzg25CEOPNFdScOoppgQw/7j9/UFxhtTLTs5ev25p4bbbp11jL1efR7o6
 k+AMf/isrFrK9cDhI2BTzmXfiVvIqUW8/zGUdC4CxAwIsGEbeoC6EynIv2Jic1jt
 YpU1RQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cka2xhm67-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 19:49:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2bdbe1bd565so2629230eec.1
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 11:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772221758; x=1772826558; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6K9sfSR2fIEkQwYqHVZ/5+9B6OUMNvks+hlGXi/67i8=;
 b=IG945+4UV46haHsFh6/rxhxqW1KD3R9G7a/ODtuvuMWxbj7Gk9R17k4Y9RYHv23gSn
 fMT8D2Z3au5SKY+n3X+dTdTCVDDTnDKnfuzNAN0GvD1U70zWFGDCyYKdk2fC/GYTi3CR
 xmaPbqLM6p0l9mMQhymw7a/y2mGJhnyfC8bYWzoLT3Mucyuz74LQITC6LVNRRHITyOsc
 rCWREmZ4VdnLkLlBZsfeNOdB6ToJcgXHwtJU9C90P4518eoR3LW95IiINe6ehers2UQ+
 l5U7QWcKbXshdBdEDt3CCvgTzCOt7c9/RvGMno/EkO/kPpcLf2H8zVzKPqF9fgar57ia
 D0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772221758; x=1772826558;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6K9sfSR2fIEkQwYqHVZ/5+9B6OUMNvks+hlGXi/67i8=;
 b=r1pdLiqjhMfNh6xep4YgvHKflfh/1qwpd17SkDDeJkARukFq2y1XpBFjKBE0c66aq+
 0+S8m5Q534SwOeJbVGmVRWkfQlOuXpv/FYwYQn49YRxrTgnD31knmJDvXGB4UpaRMR0q
 N+Ba+p4eUUwmg9RYPYqjmpXkbi/q6rGyeThEEA5tqXBNrvPdYeE+7DnyZMQxUu9Opu+P
 e5XxGlHpMPuUfflAJKdRUDE3VS4Ifrsed5NocBOSoeSvqWnZflLLyoDdXf8+sDPix+bA
 Nm1+fJ130YwG+5WlbB/OUeGYf9UFstAB6ZAfEJoiugFlLLgsZR7nylLcRlPW971S6ps/
 nATw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXugpS/mAkBJ3wrxYKVoCOtWAF3wdO0j8v/UydbidoBjtAvLVI+iKF30mG/JPene+/vwI9Q5LJHOQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyip0uqiYmZjJ+iLV/28DcYAYELds/rtiMCho0IOQjrWr90PWr7
 SjuZPfWRMXcmoPBuq+oqtSfpfziLbiNPQaMbSl0lg9kH/eVi0to+zfDp1c67tmdw38bZX6wVWBS
 6VMYXm28j7rrGeDTWiR9//wqFxry49XjtvTxMs5lsMLzvKxK6Y+ot4CE=
X-Gm-Gg: ATEYQzzGxuBRIiC1N6PO9j12J9qCSO4QZUzGl9M70bS7veKMo6R29s7ppiBCPqIAsOa
 8Bulo21+N94HKmDxn/L9X6emQl08XZTu3jXulYgCZfdomwcj/YlXZzqNPUzRMzMgr+Yxf1X8ov0
 Uv90agbaIhMUsvKHFVWOsgJpYuNvX5WLl24sLJX4mtgjM10mj3ekjbs+WEgIMGACT2+EYvXabUk
 Y78adrs1AuJFDRCoAXZwrsbtZZpEqboYimsBWU6kh7vIPVLIwM1gG6H0p1vNQoCnA0MZ82ptnbO
 YjNX7adJASLrCZjFFlgIzVPoQAWgZ03uSf428lOhnrI5KB7ojtqutYTIfKVaAr7dv05rSBHRWm1
 VP+wOzWr+E8Ig6Th4kINn3dL5492JZXUpW0mqiV232yacfrm0U5cUgvNoo7OHRvbdht4q6NM3XO
 BGGA==
X-Received: by 2002:a05:693c:60cd:b0:2bd:ef4a:1772 with SMTP id
 5a478bee46e88-2bdef4a1b9bmr417442eec.33.1772221758440; 
 Fri, 27 Feb 2026 11:49:18 -0800 (PST)
X-Received: by 2002:a05:693c:60cd:b0:2bd:ef4a:1772 with SMTP id
 5a478bee46e88-2bdef4a1b9bmr417422eec.33.1772221757883; 
 Fri, 27 Feb 2026 11:49:17 -0800 (PST)
Received: from [10.110.80.16] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bdf0cd07e6sm307371eec.21.2026.02.27.11.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 11:49:17 -0800 (PST)
Message-ID: <734cf0d5-6f0a-4f13-a2e0-e35fa0f47997@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 11:49:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/22] hw/i3c: Add Mock target
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 "nabihestefan@google.com" <nabihestefan@google.com>,
 "komlodi@google.com" <komlodi@google.com>, Titus Rwantare
 <titusr@google.com>, Patrick Venture <venture@google.com>
References: <20260225021158.1586584-1-jamin_lin@aspeedtech.com>
 <20260225021158.1586584-19-jamin_lin@aspeedtech.com>
 <c904f61d-b836-41e2-8032-31ea32324396@oss.qualcomm.com>
 <047f2aea-acc7-4966-8b55-723709fe0f28@kaod.org>
Content-Language: en-US
From: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
In-Reply-To: <047f2aea-acc7-4966-8b55-723709fe0f28@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BOC+bVQG c=1 sm=1 tr=0 ts=69a1f53f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=0OfGDMpDe1E0IF_93y4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: rmj79CmrIf7uLSndqDOVfZCR9LJ_VL2S
X-Proofpoint-ORIG-GUID: rmj79CmrIf7uLSndqDOVfZCR9LJ_VL2S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NCBTYWx0ZWRfX24xgSMa6pmAa
 z/GVcokTs1TuRILjMA2QYtXTdM7h9HP+EZnLtDHiMlVkckwZUU5Ui63NfjHM5VG3WA/oqEBuWbO
 W0eeZ5UOCK/tk4KmMFdeu6rqGRbWdKmz7Bm7ibQdDv8qSy3JbxeDy0KntQw0AE72l2Rx96ZJESp
 isX8vfLznZWN4fLPqpXOHerfkslIwdXumJHCj7RxPHqRbbTAO98T3ZPEQDX23zRdFqI0C8HOl99
 WIww0gf/y1NumwvFdUNa03ILZMbD6ljdZAQlex6mvSiZ8mU9iwRD8bxQU7/3yRDoZ8WfGEGPxkU
 N8ZXbxXV7LIVm930DDy7Ej+QYV7CrUmIwR1Z6dm3eEFjiJhH+IW5LStplneUXTe1M/0MCsm3QGv
 nesZVq1B2ToCt3iNgCwpOa/h0mCBqdAxg3KcGE6vpBQ+Xc/xTQ+s60n8W6Wp59EuGw08t4f2F6c
 rRR7d+hxPBQ4TqiZRbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270174
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=jithu.joseph@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.706,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.401, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/26/2026 11:52 PM, Cédric Le Goater wrote:
> On 2/27/26 02:43, Jithu Joseph wrote:
>>
>> Apologies for chiming in this late ... I only got a chance to test this last week
>> This really is a minor comment ... can be addressed subsequently
> 
> No problem. It is not merged yet and fixes are expected.
> 

...

>>> +static int mock_i3c_target_tx(I3CTarget *i3c, const uint8_t *data,
>>> +                              uint32_t num_to_send, uint32_t *num_sent)
>>> +{
>>> +    MockI3cTargetState *s = MOCK_I3C_TARGET(i3c);
>>> +    int ret;
>>> +    uint32_t to_write;
>>> +
>>> +    if (s->cfg.ibi_magic && num_to_send == 1 && s->cfg.ibi_magic == *data) {
>>> +        mock_i3c_target_ibi_timer_start(s);
>>> +        return 0;
>>> +    }
>>> +
>>> +    /* Bounds check. */
>>> +    if (num_to_send + s->p_buf > s->cfg.buf_size) {
>>> +        to_write = s->cfg.buf_size - s->p_buf;
>>> +        ret = -1;
>>> +    } else {
>>> +        to_write = num_to_send;
>>> +        ret = 0;
>>> +    }
>>> +    for (uint32_t i = 0; i < to_write; i++) {
>>> +        trace_mock_i3c_target_tx(data[i]);
>>> +        s->buf[s->p_buf] = data[i];
>>> +        s->p_buf++;
>>> +    }
>>
>>
>> num_sent is never updated prior to return, so the traces (from caller i3c_send) looked a bit confusing
>>
>> <snip>
>> mock_i3c_target_tx I3C mock target write 0x12
>> i3c_send I3C send 0/1 bytes, ack=1   ---------------------> instead of 1/1 bytes
>> mock_i3c_target_tx I3C mock target write 0x34
>> i3c_send I3C send 0/1 bytes, ack=1
>> </snip>
>>
>> Something like below is needed
>> + *num_sent = to_write
>> (might also needed in the ibi magic path above)
> 
> 
> Please send a patch.

Would you like me to revise this patch with the changes, and send it in-reply-to v7 18/22 ?

or would you like me to first apply the whole series and create a new patch with just the delta suggested above ?


Jithu


