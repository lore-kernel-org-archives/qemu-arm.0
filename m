Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EB0606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fc+VMftG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cOnwmgxp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWv5j-0004b0-In; Fri, 27 Nov 2026 07:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWv5h-0004Zt-ON
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 07:30:13 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWv5e-0006Nu-MR
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 07:30:13 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ARApLU7273499
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 12:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k7JqZatHZnHEIGwwjJrjx0rXYDJvA5LRez0gYS0yY20=; b=Fc+VMftGlGzZYWpa
 e4Fk0GEcIT76GMBsvR6vtSSrjocybOS3WwLkqk2PhC4e538GL6LTZdlDEHohZy6N
 5/VwjWCG5p2TkD+J1TB2JYuo/Z6zqFBQw/6Xoo8WKfSc0GRuQHxmy6QnrBAeqNKF
 +/dWs+478s2o9kNV73dU6Du+KfL66TwLfzKW+sUCOCfhR63+4xKo98NXR/WomC/A
 58uSpwOXaTkf0XvINkzmraKTLmfJfXWAe1HfKX0mAPwCvP4bK6okgI4FtLBzK/Bz
 Pa/ahvlavPqS3tPxHwGl7DSUFZp3FrubTSpD1daW3r/y68bZcACVP2cLWndE+UID
 QM5qBQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49aymp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 12:30:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91b937ecbb4so129666906d6.2
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 04:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795782607; x=1796387407; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=k7JqZatHZnHEIGwwjJrjx0rXYDJvA5LRez0gYS0yY20=;
 b=cOnwmgxpMnDzak+SpD1WGJzfPbP7zbCnwpeR91IHJyjjNO1dq5glIjN6fEoOP8aLub
 6rvJOrBw83yCYgqoEXf5l979xAvO84s6Nf52BihLe7vgqBcPWan+EcFna0mdRPt2XISG
 3Xkdubl640BZh8LUEkkYzof63bWBoGfJfNublUxdkSNcPXB0A0BE9Cn6ZZETgeogFhVV
 q2gn/6pAHcX2GbcT3DNKsCRUJ2SbX5v5vFQfat+Z+bNJyfnSkiKWnB+IXKg1hZUsZr6i
 0vx3mXaRJOug0gE9QnJSXP46e8PR3o53F40NX2ReW9HGzLK492VZodV+t38r67LTj2A2
 eYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795782607; x=1796387407;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k7JqZatHZnHEIGwwjJrjx0rXYDJvA5LRez0gYS0yY20=;
 b=jKbGRpXyBi6MFkk5KHefFOsw/6yLDmTNw6mrYmXgEu9hpgBVHfLCLU3fDO3hZCrns7
 Edqn3OcHYyFwXv9A9ign8dAw9/fBMtFXLFLBUtKY9bDjf73t2IavPhGXtD5hz2YOgnwl
 5n+QU/Iux0nk16SQ3z3NPOuy8/NivPh7ihf3yOItUukw+BoB/PrPthBiUgtmKAuB3Tg7
 jgxQ8FKZ3GPilnTrGywxEeF8cZO3BQNxd6+4j8IoK+E3N+/5EtTDZDB7VtjmC/IVL9p8
 7RH7b05hPGsQo5Zmv4zzOJ5fNRMmhRw6LXjbJC2eoHUzIVdcHtqOghF16w0rR56HK9mk
 fzlg==
X-Forwarded-Encrypted: i=1;
 AL+hErGXPkXa8doPi1l8GNzHSfJ6GsDVO9q4KoqKN6HDfQ64g0JzXSwjCHjyp/LBYXQf/X+ZyayzkqQtPQ==@nongnu.org
X-Gm-Message-State: APuU4Z/AXbgwZ/B9EaKdtfN8I1IeEamUve6edVsku0zIyGqAf0vJFpFJ
 e0d92kTN8hs/gM36KveuZbE1WDydubKLR17/elO5/ocW/iY2Mj9MqEPA9xq6oOfIlTlcvnsplkX
 McIpE7KUgixCwoc0tSEhLWKM4R8uEmbq1FE5JEciuwNDnt5I94EoWpl4=
X-Gm-Gg: AZFdTZcIGAE7Wf7vtF0y4UpNrgKCAjMptbzIaf1afF9X+ZHlNjJKzPQYXfQXKp0F1Hg
 NofviqKmpYHD9W3/MLSBKDFjWo+kj4hMd7bpeyGEJdeYUqhNWtwVTWi/N6qGVNUQPMx3/cygWkN
 46vjEi3ZFjI7sQF/M/b/D/wKHD/aSFO9ALBH3+nsN+JJDC42J+cMg4xyAS3EnelGSBUdZMIypGx
 bTI9W9dDgX4pLiBo+fI3SMmKRowgFrSfuxITf54fgTFQUdLnzvHASk8kAthqnp5iR0ZEkzniAwr
 UWMvtERmGCAcMekyKrd7OnldlmLEQO5cs9IbxM6JS1rcV7XRMHIgB/r8TapjqOa6nXnMN034qt0
 UYynWy2TvLOtSFlKsuUoWhvZTq2a1d6RSm1l/2nMsupYSfF9UWOFaJbUxyzAWp+rYV2NgilnPtY
 tPLLEHnrA=
X-Received: by 2002:a05:620a:460e:b0:949:7792:1106 with SMTP id
 af79cd13be357-949ba823b70mr4232239585a.1.1795782607182; 
 Fri, 27 Nov 2026 04:30:07 -0800 (PST)
X-Received: by 2002:a05:620a:460e:b0:949:7792:1106 with SMTP id
 af79cd13be357-949ba823b70mr4232230585a.1.1795782606497; 
 Fri, 27 Nov 2026 04:30:06 -0800 (PST)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb905f1489sm448989185e9.0.2026.11.27.04.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2026 04:30:05 -0800 (PST)
Message-ID: <2f8ed23c-8994-4ce5-9bbb-4ffc333c98b5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:30:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] accel/tcg: Widen TranslationBlock::flags to 64 bits
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
 <20261126233604.67722-4-philmd@oss.qualcomm.com>
 <awlUl2by0PPZ2K7N@hive.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <awlUl2by0PPZ2K7N@hive.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XHb7Dtoilp4KJmD8xc5s3qG_IqK8U0Up
X-Proofpoint-ORIG-GUID: XHb7Dtoilp4KJmD8xc5s3qG_IqK8U0Up
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX40eYN5wgU6v9
 R0difClg2facdqnFtg9crqKA0pUqtYfZcHf0et3hh1TP53e4k5uXSS8VVvK6HQFs+IJ1qdBzO+t
 c3OxrKCJi44fDa985WS21BKv6m0Sc3s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX7G127w8Dtw/2
 nRaD9QXyel+RkKL3NqKln726hQ4pCU6Wctc35aXZyEvJw7Dy2lNZZ3sK/vgIg1/CzPSmJCiEVgr
 oIhlPwoDdiDbMD0OIFNvqNOjFBPmLuq2tyrsnsXU1MbdVG+eTO4EujZ4fDNsgl/owcxxRf3G0En
 i5cWqPdEeyQWYnExpn4MYxMkWZ8YxJyUM9TUjb28g6oop3Xc4yO30t2z4rFoXA/BJTafCM6FT24
 YXEMtmOvt5JYMe4rIbGlXA1RpBfayzNyEKUkdDUSIcNA7vHTmwF6lKBt3uX0G1WLxywYRuy13Da
 tOVL6Eb5QmR47k8xMPoZ9CTg6k/YZG3PrbkxSB51+mt6iJupypJOVWUL9wHHcAq1wku3jwyFRqC
 b9FDI2OtQ1T1BtqM8VSXJnQaSb8X0vOxxOHKj5TnC5N7xjYLKjoVs/RsMh0H11mrzCCYa4jWfMK
 uLS/gqt+yoFYnR/M2ZA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b0977d0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KnPQmDxLMlpLnhrb3zkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 27/11/26 12:03, Anton Johansson via qemu development wrote:
> On 27/11/26, Philippe Mathieu-Daudé wrote:
>> 32-bit host support was removed in v11.0.0 (with commit 372ec46b9f
>> "meson: Reject 32-bit hosts"), so there is no reason to keep the TB
>> flags 32-bit. The wider field fills the 4-byte hole between icount
>> and tc, leaving sizeof(TranslationBlock) unchanged. Widen
>> TCGTBCPUState::flags too.
>>
>> Feed the upper 32 bits into the TB hash, and adapt format string.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   accel/tcg/tb-hash.h              | 5 +++--
>>   include/accel/tcg/tb-cpu-state.h | 2 +-
>>   include/exec/translation-block.h | 2 +-
>>   accel/tcg/cpu-exec.c             | 2 +-
>>   4 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/accel/tcg/tb-hash.h b/accel/tcg/tb-hash.h
>> index f7b159f04cb6..819b594618aa 100644
>> --- a/accel/tcg/tb-hash.h
>> +++ b/accel/tcg/tb-hash.h
>> @@ -63,9 +63,10 @@ static inline unsigned int tb_jmp_cache_hash_func(vaddr pc)
>>   
>>   static inline
>>   uint32_t tb_hash_func(tb_page_addr_t phys_pc, vaddr pc,
>> -                      uint32_t flags, uint64_t flags2, uint32_t cf_mask)
>> +                      uint64_t flags, uint64_t flags2, uint32_t cf_mask)
>>   {
>> -    return qemu_xxhash8(phys_pc, pc, flags2, flags, cf_mask);
>> +    /* Fold the upper flag bits into the cf_mask slot. */
>> +    return qemu_xxhash8(phys_pc, pc, flags2, flags, cf_mask ^ (flags >> 32));
>>   }
> 
>  From what I can tell, while cf_mask ^ (flags >> 32) does increase the
> probability for hash collisions it should still be extremely rare.
> Currently the only possibility for extra collision is with the riscv ALTFMT,
> BIG_ENDIAN, SDEXT_STEP fields and CF_COUNT_MASK, from what I can tell.

Hmm qemu_xxhash8() takes 256 bits, but the lookup key needs 288.

IIUC your analysis, better to hash the upper 32-bit flags and xor them,
so they don't share slot with cflags, as:

    return qemu_xxhash8(phys_pc, pc, flags2, flags, cflags)
           ^ qemu_xxhash2(flags >> 32).

?

Cost is of one extra xxhash32 on a tb_jmp_cache miss.

I'll rename the misleading 'cf_mask' argument upon respin, we pass
the full cflags since bf253ac606de ("accel/tcg: drop the use of
CF_HASH_MASK and rename params").

> IMO, for the time being this wouldn't cause any real performance issues
> compared to say adding an extra word to qemu_xxhash8().
> 
> Reviewed-by: Anton Johansson <anjo@rev.ng>
> 


