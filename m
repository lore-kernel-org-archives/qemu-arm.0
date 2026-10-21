Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DAF606AD06
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 16:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oXw0Okyr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3ancS1P
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJZ3H-0007Rb-3Q; Wed, 21 Oct 2026 12:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ2s-000720-8t
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 12:20:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ2p-0004pK-MU
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 12:20:05 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LFTwHh4158360
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 16:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7pVccf5x1st1Wtz5MHwGIaf6N9mPJdnj7/Zh0VgzTGA=; b=oXw0OkyrOdmSwXPh
 m3n47YaZM/INfwM8pTx/O/UshzmiuTlraIsVqrhSXC/tPRUP0LE5YQAs5CyiE0lP
 naTc4Mj/OPtR6OjEfT+oooUmHHExVJhPFdrOPgmpTUQM9BmUpNik/Mfza6PuyspO
 Swt6OgZj9dmVK8VyCMaSQkb2TG4wMOB5lBEFwdIenIirY7Q35dsqditz18vQeBBE
 vcQVauAdu6DgzqVEf0pQI9wRh5xkH1IABdfDCAUFVqdMX34ugNItI7z7Avuh/al1
 T4NylFBS0dywA0mYsbfLu6SMJ9MZoNzqLxJH1eqVQRmM6GBn+9k20xty1hjY+EWk
 O2CUHQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8t85-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 16:19:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-35cbea41088so1643940eec.1
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 09:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792599597; x=1793204397; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7pVccf5x1st1Wtz5MHwGIaf6N9mPJdnj7/Zh0VgzTGA=;
 b=A3ancS1PAYZBTlIc6xKclH6wOcB6bju7z9DRvlKvJlnlAAjIIfnVMGMoHMQGDv3J79
 HiwpTtqoREzCccZEXLtBvrsAnm+EXbgU4RgBsOb/K1KZ9iTO8zlwyEuPOFke5+UiiAlD
 vWMVMbP95vq/OC0hSlgFyLf3uhLf8RKBmQJ8jLEHfo38SHeFJOY3VSOqIJYcCJgP/s/a
 +J51svtFStBnedIb8+nXln7ptIkCA/VX7DoaBnxZ6Uxs3LUDHZ3JiSDC1zH4o5r+1+Hz
 8Mr8ppJrp2KRqeryMujbkUSEPOxHaMfk2lFN4LKbW4IElCJf1RHwp2oxBsuEuMwUvuvY
 Ixnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792599597; x=1793204397;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7pVccf5x1st1Wtz5MHwGIaf6N9mPJdnj7/Zh0VgzTGA=;
 b=1E83UlZcdg9kBdvhDTVM0w86hzmNLberlyx7mnVofgZ/z8WLHvQvWFZMRO7rf4YMsa
 UBRJCQNKciTf2AJoNln3PnPWmILUnntZf8kQ3tz6ACR6XU/K0daBvFOXjRcuEK5gb2Kc
 aD4e1eP6b/bj1n5ZOF/UfLQFGQXhGcXYVhkA+iDIvpZrMTk7CeL+5bEvK9zscVJmQVr4
 1gGEWRMAxRm3W4twRDsbGczpXETFRzLBxkplV0kwmxX+zl7TTt84z9jHrPRePw5RxHxr
 sM3thJrEYLNu4uoXyo5jEh3QSkJwnub86n7hOuGS6UQ7HTUaqAEqPx+KSDeD3l05+yRp
 usrw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxLd9nByLD77NUIpBXtM/tGitlMeCym5Xgo8TnferLXa83966XHeVZbGdeFgNUTBJw8nFf4o6OQ9w==@nongnu.org
X-Gm-Message-State: AFq9FYI/eC5Fv0F5CHXvijgxVxq8ctQzto2sxBse2XJjGppvZJ4E1cfO
 At4EooWj2vIWAwWQBcVla9g4WVCnQG7FgpYlfWKnT4dtxHEM5aXg6LRMx1HCWuWjxz1rmAGeEYi
 nro+DTnOxBGkypCnd5MNeXDl59h+1JNnWEzuP6USmAmf3Vtxvro5kEuCwX8oIStM=
X-Gm-Gg: AYBFou3FYYcqXY5HpIKhu1RKxHXzAPYJ7Ntj1mhkobYNWByvk40F/z7xCNLxDgg8JAi
 i36/C1nnmsBVG2gOFgtyggDLaxpAnn5zh+iLZ/NcwXscwtTZ7VCtOC2xwcwBR0FVm+MlErhz/91
 srrMAAvige30v+44iZ5Nhs11lAuoFpPPDYq2nOzTo7cg1faSTM7v2pK+mp7SunR5Ridl20YtvzQ
 BA7Z5LnRCwkDxH5vhWkbi6fXGZf5AU9srQ1oYgZ3lNALAWImo0l8BoyNdyopStdndRRMjiMWg+1
 enRz5gUD0HqYumKL5OhvIgQrobr5k+8KSxGqzKWVf5AADUberR4Xc8hq2fTYBcA8tGr0ihJCGUd
 zL/Q9RLrXz2zhJ3k+GW6m3Z9yiZh60ehLyXeDkgz2j5VACFQxKJdM17cOI61/Pz4LADQbQA==
X-Received: by 2002:a05:7022:387:b0:175:525c:90b4 with SMTP id
 a92af1059eb24-190a50ef799mr3480667c88.20.1792599597104; 
 Wed, 21 Oct 2026 09:19:57 -0700 (PDT)
X-Received: by 2002:a05:7022:387:b0:175:525c:90b4 with SMTP id
 a92af1059eb24-190a50ef799mr3480621c88.20.1792599596537; 
 Wed, 21 Oct 2026 09:19:56 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1903bf5d0a1sm7169316c88.14.2026.10.21.09.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 09:19:55 -0700 (PDT)
Message-ID: <c5c24e21-0836-4bf5-b5fd-848d276ac7fc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:19:54 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/33] target/alpha: Use a static table in
 alpha_exception_name()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
 <20261021031407.24862-6-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021031407.24862-6-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX8o7KPovF3pPK
 YDsIXJv2rjCRoGsqn7c5ET95rUhzPobM5ylwmeVpzQC9EpWqD0qZWcRr1E0CqlBDp6sgUQIxjg0
 XqTAwECWqgqKgoMUUdaq67riYrM4Nk8=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8e62f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rpH6MXs8h_YZi1gZqq4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: I8ctHu-QP9czLbAD63bhsozdUV_ZUcXG
X-Proofpoint-ORIG-GUID: I8ctHu-QP9czLbAD63bhsozdUV_ZUcXG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfXx0fqsSu8Y+Kc
 djxnHP1G5JACQTTriO65PdrWZIPkrTmT8TnXdBTeuOZefbavS+63Thf2PO4t9X9V4l+/ZsZi7Wc
 UUi1qtA76XwgPRpwQPoE5Jfs+tjLVDqwFLNLugco+Y9RyPJ4C53Fg07rVY98mwGdeJjVnnkVtHv
 ijs4d3VcKbOkNMxHZyt9wh96uz6j3ldbDmwvFCIdYZgu3kRw1u0yVh2YBulVX17IJXdL12LUnGx
 ETqUk/0i4nTQYCY0AjwFzMdQ9Rc2nbIp07O9jB80/Z7Sp1iQAgAzdxrWLe0ddWfqrfR3mSyVblh
 xk6+KGHPA9UKGamv4qZwerR9c8R/BjFZlnAENfDFcyoLqxNZbmh9KxKDLlMjHWlirs+M2qsO4fu
 bkzWkCvpFl8HGyZxV8REM2DVgzckl1aNOY6mpaacvllJnZF8iLJ52of9Lmqcp8/tzMffLiShBuN
 p5EnW6mfN/bpRzzx4qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210065
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 10/20/2026 8:13 PM, Philippe Mathieu-Daudé wrote:
> Replace the switch statement with a static lookup table.
> 
> Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/alpha/helper.c | 54 +++++++++++--------------------------------
>  1 file changed, 14 insertions(+), 40 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

