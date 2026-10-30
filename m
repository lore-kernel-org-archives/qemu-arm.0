Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FFB606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KWbmQsnA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G9f3DkEA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMhg4-0003Iw-TR; Fri, 30 Oct 2026 04:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xMhfQ-00038a-6F
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 04:08:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xMhfN-0000eR-6G
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 04:08:50 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69U5F6Hv725288
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 08:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hWMHlqTvQHfBIH5pTDc6oKYQYEq+zLfC3iXW1KkPJc0=; b=KWbmQsnAGtzfpobA
 GES9n0uHmSV5XBrE1noS06qIem3HXlpyDcjYVKwwH+omVoPDfn7VcwTBTqvjcMiV
 Tpw446B8fhuQ0ooc4KwU1cBgTPCJGW6bapuUWAzHrMUSVPxV0GxIBtotDDL4Nn2+
 whh2Th4nKtcnhCGVJUYpqXnQyZBoXamxQoS1lJq3VxDi3awi64QDDGXb+prm4dMy
 zdNIzazwcqqs+TQcdu0K6rOVLwK1gUbebbRCY4h5Nn+dSNrc83xlkbqf9CMaXByx
 glQNGYbf6Cdcg5I9IRWe6g92ecQnf/wRUYCD1RWNOTT4ddqDXYxLlKFdvdnRa2mx
 gIuRhQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6phw2n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 08:08:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cb93c874bso293896585a.0
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 01:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793347727; x=1793952527; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hWMHlqTvQHfBIH5pTDc6oKYQYEq+zLfC3iXW1KkPJc0=;
 b=G9f3DkEAlv7TnJDTW+7hV5BY7l1S/eCjfqICtlLP65KclLZ+mFf4ElbOFTkK188ifh
 OZRwgG0Ypzk1vwDUSBDVM8pZEQ4e7QB6zrm4t8YPFYJH0QfwEQFVOdLKfRDFCsbXB9yO
 m3gPtfezth9+taJlrQX79WoxGMiOApX3CMcoYaN2W/8zD0/pB4sEwpYwsPkzSaI20xas
 HAe6qiDguvL21T79a7cNxErlmgvpJq3Qrw19b8oNBGl8WwOXbI76ZtZ1yP1s76gqY8x1
 qVwVRcNi/Vygu43Qmu8Ef2mccu/Ugh/l9JFdDWaC4I8aNMWsRJRJcYsNCvF5/jHxVvFd
 MeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793347727; x=1793952527;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hWMHlqTvQHfBIH5pTDc6oKYQYEq+zLfC3iXW1KkPJc0=;
 b=avt3h6ALaOcBhf9cxDGVSMXNBUluV9fIUi70K65s4F7geE1Lg+yYgG91E33SpplNj0
 xnp8mRCHy5uwJnA4Y8VIY4+XY1nhhfLM+yFwehBlXLwfeXEs8makbsE9HUm0duuSd5IW
 f3caPsGJrxo+p4CSy78oFPQE12N7rVlby0V3RDpbtSP0wwR/rtCRBikuwZoTR5tuo2L5
 T94njGltQxekBearL7R/EPCOZuXpRr/dI5JiwwpY4UIcXAmy8KXBW9Gd+Iox5nJhESVY
 K8snCNIYggq5fUSH54jKifMt4QaA6wPJSayHdVC2rg1rsuH61H234q2LEFsmA9UIEltr
 xvCg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwHLRwredgtxjoFoB6XG4GOlCKssASJLegmvCdnifAkIskiZDZJYNL65sq63E9phh653PHTjwrj/A==@nongnu.org
X-Gm-Message-State: AFq9FYKoEGxZB4TU5IJAuCP/SRUkZ20r4TdSn7UkXfynWQYBoDQtFQXH
 O/QV9DI4WoH4W8CLwXPN40+OxhkgE7KZ4iUuSexu2CErQiakhGTZE6TGLVDpTgBhK31YcG7Tci+
 sgUnBmylV/UPWy9f0MR85pxKjY1KCcLpdOPk6TUJXUAaw6ymiifPUdv8=
X-Gm-Gg: AYBFou3ko85OHFTd8lw12bvjpqcgyAUYEuSEmOtsjMhKtsVJIPbQD9sG5eJvt8gQy7W
 k5E7JsAJ1MLBDk60an+TKtVQkiMqoZrbmj2jhwFeLslv6C2uecFuWIfy46trdKAPuPeilT+opg1
 cSym9UGvg8XgpfiX1nE3FO75u4s4QN6VU6rVI7slEZCU+brcrwlJMPR/kte7mwL3kJLVcEvVfyz
 3uh22SAbV1w4QDLU6aCZuO+Iehw8/xOAMJBJy43zW5qaRc7nWuG4zRJhP5kwfSNIqt5Wzi9Kaaz
 Qj/Q++kiGdV5H/9cSqQjyyYpZH5Au2EX0xtWTDlVdloB5fionu1MtV/4d4Ut+Hgisl/DNH8tPtJ
 hGVd+4pY+/js+9/GNhWliMnIHHY71bteBzaphxxInGm1d2NXE+qHN3QlVdNHBH7TddWYywFlrLK
 TXIkv43sSXwFuWr/9j
X-Received: by 2002:a05:620a:2988:b0:93f:231:9ff with SMTP id
 af79cd13be357-944133ab79fmr759739985a.27.1793347726698; 
 Fri, 30 Oct 2026 01:08:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2988:b0:93f:231:9ff with SMTP id
 af79cd13be357-944133ab79fmr759736785a.27.1793347726148; 
 Fri, 30 Oct 2026 01:08:46 -0700 (PDT)
Received: from [10.53.234.132] (2.171.88.92.rev.sfr.net. [92.88.171.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09ad5ff8sm27255535e9.4.2026.10.30.01.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2026 01:08:44 -0700 (PDT)
Message-ID: <8beb743f-41f0-4275-8baa-38e34e872f08@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:08:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] tcg/riscv64: Fix logical vector immediate matching
 and emission
Content-Language: en-US
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-6-philmd@oss.qualcomm.com>
 <auOReLXT3EK7ITyf@aurel32.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <auOReLXT3EK7ITyf@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzMiBTYWx0ZWRfX3Qsq7eMqtKX4
 TwvvTaIy/5z7KpBQJPTiUyyDUgcIYvtCYRMFJNJJyyQVX1Au4Q1sgxji31t0n5ZZd3JEx2Q5/qA
 BHoCk7yvOlhjbfqS9prOnc9yHrST8hTrJgJDgYXTOASWzDkFm55zrbQxLe+q1+SvcrRtzFYD7+r
 p1CsZ5r0R4sRorbQKdfZYLhKr2EkCG42KjqVrXi8oxV26wPVxILNpjihAMmpKqVE6IH9yZA01+v
 RtEAyjPZCLyvS5a9Hb5lcbZqhPErAvFnNy0Apqx7DM/eRna3Kt7Uqw6fjeiWm1DgYEIB/yEIKs0
 2sXEeBLnwV7h9zpxBFUPOvNI+NNuwiJJC8lRHJBKZuaCmY9XqLl6YBf8eFKbPK1hlKc5r78TEh2
 wFFxbdBG/jb7A6Aw9U+7/Hoxh7JWBJBKceOaK78vQ9MLOqERa+HT7lI75zGuMg/4HKFULHw5+pL
 LOwryX+XGEVTsaoeWRQ==
X-Proofpoint-ORIG-GUID: CrH06NYyBSTa8DpgOIeWyypsA03pSRKL
X-Proofpoint-GUID: CrH06NYyBSTa8DpgOIeWyypsA03pSRKL
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4508f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=HQTXqKeVkpfRTvjBQxpVcQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=69wJf7TsAAAA:8 a=hXZgYZo4AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rd8rANsrkRdGGMysS9UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Fg1AiH1G6rFz08G2ETeA:22 a=37BJPeUnzxYkbV1yBC-1:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzMiBTYWx0ZWRfX7XHAPUa57NaQ
 /ZQUkU7VcCPcycMqTdJ4M9t1F8xpcWZH7g9v5ed3sa0cUcllOk+pUXh/RpGGFChUdquBibSpLq7
 OnIBTrhGMU7Z7k8OOgV5jlJTJwxLWWM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300032
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/26 19:33, Aurelien Jarno wrote:
> On 2026-10-28 15:33, Philippe Mathieu-Daudé wrote:
>> and/or/xor_vec always have VECE 0, yet their constant was matched
>> as a byte element and applied at the stale SEW of the previous op:
>> "bic v4.8h, #0xf0" became "vand.vi ..., 15".
>>
>> Add the 'N' constraint: use the smallest element size at which the
>> constant replicates, if that element fits simm5, and switch SEW to
>> it. A wider element can't fit when the smallest doesn't: its upper
>> half repeats the smaller element, which would then be 0 or -1.
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: 5a63f5998791 ("tcg/riscv: Add support for basic vector opcodes")
>> Reported-by: Aurelien Jarno <aurelien@aurel32.net>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   tcg/riscv64/tcg-target-con-set.h |  1 +
>>   tcg/riscv64/tcg-target-con-str.h |  1 +
>>   tcg/riscv64/tcg-target.c.inc     | 53 +++++++++++++++++++++++++++-----
>>   3 files changed, 48 insertions(+), 7 deletions(-)


>> @@ -2807,16 +2845,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>>           }
>>           break;
>>       case INDEX_op_and_vec:
>> -        set_vtype_len(s, type);
>> -        tcg_out_opc_vv_vi(s, OPC_VAND_VV, OPC_VAND_VI, a0, a1, a2, c2);
>> +        tcg_out_opc_vv_vi_logical(s, type, OPC_VAND_VV, OPC_VAND_VI,
>> +                                  a0, a1, a2, c2);
>>           break;
>>       case INDEX_op_or_vec:
>> -        set_vtype_len(s, type);
>> -        tcg_out_opc_vv_vi(s, OPC_VOR_VV, OPC_VOR_VI, a0, a1, a2, c2);
>> +        tcg_out_opc_vv_vi_logical(s, type, OPC_VOR_VV, OPC_VOR_VI,
>> +                                  a0, a1, a2, c2);
>>           break;
>>       case INDEX_op_xor_vec:
>> -        set_vtype_len(s, type);
>> -        tcg_out_opc_vv_vi(s, OPC_VXOR_VV, OPC_VXOR_VI, a0, a1, a2, c2);
>> +        tcg_out_opc_vv_vi_logical(s, type, OPC_VXOR_VV, OPC_VXOR_VI,
>> +                                  a0, a1, a2, c2);
>>           break;
>>       case INDEX_op_not_vec:
>>           set_vtype_len(s, type);
>> @@ -3008,10 +3046,11 @@ tcg_target_op_def(TCGOpcode op, TCGType type, unsigned flags)
>>       case INDEX_op_sari_vec:
>>       case INDEX_op_rotli_vec:
>>           return C_O1_I1(v, v);
>> -    case INDEX_op_add_vec:
>>       case INDEX_op_and_vec:
>>       case INDEX_op_or_vec:
>>       case INDEX_op_xor_vec:
>> +        return C_O1_I2(v, v, vN);
>> +    case INDEX_op_add_vec:
>>       case INDEX_op_ssadd_vec:
>>       case INDEX_op_sssub_vec:
>>       case INDEX_op_usadd_vec:
> 
> I am still wondering why not propagating VECE for logical ops at the TCG
> level, instead of recomputing it at the TCG target level. But this is
> how TCG is currently designed,

AND/OR/XOR are bitwise, so VECE doesn't matter to the generic layer.
Indeed propagating it would be a separate tcg-op change.

> so:
> 
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> 

Thanks!


