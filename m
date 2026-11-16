Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557F8606A323
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 22:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GM5qhJf4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qz3UUPHy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xT5eh-0001w2-Kz; Mon, 16 Nov 2026 17:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT5ef-0001uN-AA
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 17:58:29 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT5ed-0002DL-Dv
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 17:58:29 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGLCH112710725
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 22:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PA59sNWvE8QrE05LdXIgTkKlfoWzK8G14yxogc4Q9zU=; b=GM5qhJf48KMeXtZo
 iMltasvRoudbzrpFWZ3ipk0tdLtHRnRwcMwxMisGOydVvM3DdcfI3P5TZOPRpG2T
 bldezB2ikpkObKSTWUZsJb4Bf/TTsAUZBsSoCr5DSbBPc5+VSD9qI+Th8riztYec
 Q65nCRQ/320WsPzg9kfb/mbzJ7LTCa0kO2RqHep9IMXocmPm3Kkn410tmfFJAZ0Y
 rxBs6I3hlx9R0YwqUdvfpsf6FG+02Y95xxXaREs0Y1CiiZ2oJb3iOayC9NYfYDdV
 rDUNnA1gitZ3gQ58Zr9IHP1ufp9Oq3x5veK/nKgEl/VCS5Bn+liJBs3dI29YjSCN
 Wq4eMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htg9sf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 22:58:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9496ff065bcso235124485a.3
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 14:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794869903; x=1795474703; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PA59sNWvE8QrE05LdXIgTkKlfoWzK8G14yxogc4Q9zU=;
 b=Qz3UUPHy202DwGsEjerqrUSlj5HKJpRhYUHH2KtrJxXR7nFrkZbf9O+b+2Y6pxpvI0
 iCvDHWAo2In5fLVtgLHUrJDsDntq0g6W+iFzqdt/AosfQbuHqHjpjQ4gJRGfhl1YcBPs
 XNVyqO0zS0u4CwbR/Mz1jGmXPStfxtHoMFttYCdeLAI3UnTiFzfSwBAeuES0gwyLiaYR
 CX/9FfoggHvKgM41MZNcasIEQFcqFP78F1EgtqW77D9n3hZtGIxtr44Jo+BacAcI97sh
 OS+7toSVKkklSAyMSCpf6iR1ydgHcs2xshmaRx/W51BFFo+ukXr8qD4VvWTpq2WCOFEM
 Dwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794869903; x=1795474703;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PA59sNWvE8QrE05LdXIgTkKlfoWzK8G14yxogc4Q9zU=;
 b=DAPGXrxy/K+wX+RDMAfysMESJ5I353uZBkU5Sz91XYrawLBkXdcX5LEKtQCRNsJO3w
 5yfn9nBW7+k/9lwrc36lSZ9oNKEJ5FDlmYwGB49BSaxPynIEuCJK9VvmgovgUEcNNsqC
 JOLo+4nTtdtKRdAjNJDqwLQJ+NROGzUUrr2lSsSbZovaMBQDKcSxqBB4SKHzxEDHs876
 3sEg5dj0fXQDj6hxzETegvoZXPLpMaFwEkjQ3tywe0X68xgkwNNUXqi+s6ji+nToCvSC
 C+OX8RxVtGK1Ew2wfeWlxc/tnI5aYqlyR0ZsI8DXEHo3QvorH5sj4QFDLNGOBzbD1SnW
 opJA==
X-Forwarded-Encrypted: i=1;
 AL+hErHRX2L2oEnlAdkwqVTS2mDTxGaj1cqYum3H08dClyRj305yFkIZ+kxIE7OfbqgECw00w7bP0mpDJw==@nongnu.org
X-Gm-Message-State: APuU4Z8+AbG6L8cqKFh7W6z1OYQmBIMQmeTunpfKrg6hEprevLwlTYVd
 tFW2YSgEjBYoPXK9TJHyhVoY2nO9+/euTXUqvZBztwHtBkfs0JQR0Sw/fCL1hyNlufPiKFe2bID
 vDMEWsDPwyh4wQg3xNMu2a9w9Q4976JZjiKfXLpw/UF5H4MzIH0HqrFA=
X-Gm-Gg: AYBFou39zYdePk0RA52qjKFpoauuAa1C28auSA91IVmiZFy3ifFvi2MHsbaU+y5qabf
 CQkUdLT9IS0VKlJElC+b2gXqKteRQ55C3vb/VICN4hKHDR7VaIYSgBsTJtFpmFeqwNTHU9h8XtA
 PqV7qkFyocVwWtsyW5nWv/28sZ7xRF6KW3EfB1W/TfIejKdJcMoKD8fP4lB4dy6s3O1YluBieOl
 2ZwUlhOFKbgB5l9DlToHLXAdUVq7vkYumhUDL7bQzcV3QyJ+5elT69FednEL9ktelTfpiySNwFH
 TsGnKjBn3xEIFP1N8eN9M3rT6SZhbipSElNvPEP4EvwmgAjr2mtHh7xDg+RFEKIUuUqn4xzpNK6
 PDxsZYgJUy5h5WdQ/S9m9Py+pfi5FAEDVIeWHvU1nyRfYa2LtTlX8vqRJLrD+KQ1MZ2+SEPEWbk
 2GNYoCRLQ=
X-Received: by 2002:a05:620a:880a:b0:949:3c50:134 with SMTP id
 af79cd13be357-9494bbf725dmr1917755785a.33.1794869903256; 
 Mon, 16 Nov 2026 14:58:23 -0800 (PST)
X-Received: by 2002:a05:620a:880a:b0:949:3c50:134 with SMTP id
 af79cd13be357-9494bbf725dmr1917751485a.33.1794869902682; 
 Mon, 16 Nov 2026 14:58:22 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb784231basm19908325e9.11.2026.11.16.14.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 14:58:21 -0800 (PST)
Message-ID: <1099744b-90ba-4692-9fd7-a8edd2550bd8@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 23:58:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] tcg/riscv64: Fix constant handling in vector
 comparisons and selects
Content-Language: en-US
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-5-philmd@oss.qualcomm.com>
 <auORAhkbaN3lRIZU@aurel32.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <auORAhkbaN3lRIZU@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfX5TVVMtm7nPUe
 iHZINl6F8vpd1r/bvWUrUjje6iEY94/Am5dH9N/vO4xn3E946tyGHw7LhVty2Uj8snGKjGxRq3I
 46tEz+5RYpXywDieC3ALkLl+633eF4Y=
X-Proofpoint-ORIG-GUID: 4NJjS0yBMXBZb38rkCgLqgPA9YK63yA5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfX+N2oeCESTI/u
 xdQQCUcdbPf6dfZHTI8s4OLDa5s7Qmr2j+kt0JeiUZSPeHC0DSmibkTuDpDAOcamm9vaCnF4BlH
 5xfOlf1peinOwYzCBncOjUo6RSZ5xlv0rHlZ80X0ecASar4XQkQFyXu/eRIo0GjdgLq8OrUr5c3
 eVG1AJpL6U/cbQ4eOdS5BExWe5B3VTYdYpxzcr/q9oNLv/Hht/b2yqwEnPfShhm82X0aWve+h7q
 RksFsPFhwkJE2+mI5+CcIpxu4QHfVp0qaVQck/I0Xs7QOxnVoVeVaXISrwmEnXqLFtnhB2juT2K
 /EPXRZKVG8Q40JqS/EmXO664Bp3JZ/yFQ2Vg7n/KbCdfFSffoD09EnnWcmyTCdVN1Zi/mC3VHYY
 u67eZVdBJhVWnJxpmPnA+k7uJcTDNPSRff1fUmRtTJkRlH2qpjpw72lRhMgvWP+qEr7pijQPpzM
 1hzZaEm7K8dTb76NgVA==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afb8a90 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Yfme08cpMtdNDjph990A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4NJjS0yBMXBZb38rkCgLqgPA9YK63yA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160091
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/26 19:31, Aurelien Jarno wrote:
> On 2026-10-28 15:33, Philippe Mathieu-Daudé wrote:
>> tcg_out_cmpsel() takes constants as TCGReg and passes them to the
>> encoders unextracted. In a release build, "cmlt v0.8h, #0" emitted
>> the illegal instruction 0xffffb057.
>>
>> Use TCGArg for these operands and extract the element with
>> vec_imm() before encoding, including before the LT/GE adjustment.
>>
>> Fixes: 006352d69f14 ("tcg/riscv64: Assert immediate in range ...")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   tcg/riscv64/tcg-target.c.inc | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
>> index a3d995e290b7..168932711796 100644
>> --- a/tcg/riscv64/tcg-target.c.inc
>> +++ b/tcg/riscv64/tcg-target.c.inc
>> @@ -1555,9 +1555,9 @@ static void tcg_out_cltz(TCGContext *s, TCGType type, RISCVInsn insn,
>>   
>>   static void tcg_out_cmpsel(TCGContext *s, TCGType type, unsigned vece,
>>                              TCGCond cond, TCGReg ret,
>> -                           TCGReg cmp1, TCGReg cmp2, bool c_cmp2,
>> -                           TCGReg val1, bool c_val1,
>> -                           TCGReg val2, bool c_val2)
>> +                           TCGReg cmp1, TCGArg cmp2, bool c_cmp2,
>> +                           TCGArg val1, bool c_val1,
>> +                           TCGArg val2, bool c_val2)
>>   {
>>       set_vtype_len_sew(s, type, vece);
>>   
>> @@ -1574,7 +1574,7 @@ static void tcg_out_cmpsel(TCGContext *s, TCGType type, unsigned vece,
>>       /* Perform the comparison into V0 mask. */
>>       if (c_cmp2) {
>>           tcg_out_opc_vi(s, tcg_cmpcond_to_rvv_vi[cond].op, TCG_REG_V0, cmp1,
>> -                       cmp2 - tcg_cmpcond_to_rvv_vi[cond].adjust);
>> +                       vec_imm(cmp2, vece) - tcg_cmpcond_to_rvv_vi[cond].adjust);
>>       } else if (tcg_cmpcond_to_rvv_vv[cond].swap) {
>>           tcg_out_opc_vv(s, tcg_cmpcond_to_rvv_vv[cond].op,
>>                          TCG_REG_V0, cmp2, cmp1);
>> @@ -1584,11 +1584,12 @@ static void tcg_out_cmpsel(TCGContext *s, TCGType type, unsigned vece,
>>       }
>>       if (c_val1) {
>>           if (c_val2) {
>> -            tcg_out_opc_vi(s, OPC_VMV_V_I, ret, 0, val2);
>> +            tcg_out_opc_vi(s, OPC_VMV_V_I, ret, 0, vec_imm(val2, vece));
>>               val2 = ret;
>>           }
>>           /* vd[i] == v0.mask[i] ? imm : vs2[i] */
>> -        tcg_out_opc_vim_mask(s, OPC_VMERGE_VIM, ret, val2, val1);
>> +        tcg_out_opc_vim_mask(s, OPC_VMERGE_VIM, ret, val2,
>> +                             vec_imm(val1, vece));
>>       } else {
>>           /* vd[i] == v0.mask[i] ? vs1[i] : vs2[i] */
>>           tcg_out_opc_vvm_mask(s, OPC_VMERGE_VVM, ret, val2, val1);
> 
> Similar to my previous comment. This is technically correct, but if such
> an instruction is generated, it also means that a field is not properly
> masked when generating the opcode.

Reworded as:

   tcg_out_cmpsel() takes constants as TCGReg and passes the whole
   replicated value to the .vi encoders instead of one element. The
   encoding is still correct, because encode_vi() keeps the low 5 bits,
   but it trips the range assert added in 006352d69f14 in debug builds.
   E.g. "cmlt v0.8h, #0" computes 0 - 1 in unsigned TCGReg, giving
   0xffffffff instead of -1.

   Use TCGArg for these operands and extract the element with vec_imm()
   before encoding, including before the LT/GE adjustment, so the assert
   keeps checking that the emitter agrees with the constraint matcher.

Unfortunately the GCC farm RISCV runners are down so I can not run more
tests.

