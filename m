Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED4D606A326
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 12:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U73ctGfv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T6xfsl2F
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOZrM-0006aG-KN; Wed, 04 Nov 2026 07:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOZrC-0006WV-VX
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 07:12:51 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOZrB-0000wW-01
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 07:12:46 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A4C1Rcr1764268
 for <qemu-arm@nongnu.org>; Wed, 4 Nov 2026 12:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +/gzBL355anQUTmmAMu+D1buk5BwDr6MMeYXZjrvads=; b=U73ctGfvc4K8fBQv
 KSwnTRvpGVn53SSRFee+3n/RA1p/dq9VGkIs7YmadmelUW4F7yN1IEeuwD0CW5KA
 WBfasPmdrFvUNPNrSZqnw3Frcant8zWLO/YNb30Kk/tfr9xqe82bvtbMhUrhjsk9
 2NrDhxJ2VDx8JyOFzzoq1TbIqL+E/tE/MMCNTqWOSUO4KAhmHfDFnUutk5NLUSal
 L/maz6FIzcsAslkmyCrh+bVjPvD50V/YwFvlkQrIffB2cOxexqJ2mmmUwF3gLwtF
 kjqTsfkMrzZj00FutXoUr4Wp8a7jYhlu/YmPD7EgrlXldT+DAHykus9L7qnWYzcs
 et5cOQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn01bn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 12:12:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-99063f4065eso58821241.3
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 04:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793794363; x=1794399163; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+/gzBL355anQUTmmAMu+D1buk5BwDr6MMeYXZjrvads=;
 b=T6xfsl2F21pIxvGkDlVtYSzF4ceOdrOAkJzoMbb1z756x2/k7YmmRDtrzDs6zzmjpC
 POURU1fLzRzmsHCTJJzNkdhR3Iwo/YRXzxR18nL4x3irMliuI1BymCa+e/Ej366yZMd4
 wf60Sv8k9vaCAbYJQ59HKHL6WhukYL95fASc3eLavbzYM4D4vxF46C+XGRIKZ2B/8vWR
 oKUKm/1PQQxfkeZt+iZsp1IKlFHtly323QHM/bBNXf+H/jqGc26X1FYsUUzWvJYKvuhc
 KGf/9TL9wExbUJJm8cKcaqfmElL0v4GEA0M9cqyr3uCPGQPxZ2ofLbS8E8pLc00RJifH
 owFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793794363; x=1794399163;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=+/gzBL355anQUTmmAMu+D1buk5BwDr6MMeYXZjrvads=;
 b=1eCSohTUFIlxUHO9zCtEBOS3fdmRn0i2vxRGcwu4wPsysNvFHK2EREp3rNjVH/Q2mh
 N7uYM5PxD4mPIVowocD+Kb+4IC60XIc3nAG1gA7umMP1/h95SO76bzWN1Su2OEv+lRiA
 habK604/7xY524XSt7W3cHE2zTHa8mDgpukFTYSa2Z1oMqta2RMyWGN0tke6engJFnYL
 H8/ozgBCghd7OSZAN561GXm1hf7lIBhc15H3IAf73ioXpZcJpF4PLfNiLL3nmDqJt+IE
 1BY4zBk2r4jpjUpPKf8H993heEVhelgxo8Ap8+ktjUW1Cl3J1J+gUpJP4VTBh0sfL72g
 /7IQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzZ+FKufWxd3lgReYMKdYkJUOE/xE7jqIPalHlkRaepgjMS/Vyh4duS2C3EXGf12gGZrgUWsxWI+w==@nongnu.org
X-Gm-Message-State: APuU4Z+MQAw1V8ezF5IU5UbKs18xRem2XLWxolkb0zr4N6GPdus4t0sg
 KgMuSh3a793RC34mN0L5MfiJzWPHT7S0KYn6yKgm/F00k1gCN5XsWES/NoiwL+si/N3mVCFLc8s
 hK1x8QokfEvZZxUFGaNp56P4UvF8xgi+o4AaYc1KVIGXkJAgx7bOKfks=
X-Gm-Gg: AYBFou0M+FWFoFaqThprRCbUdgGxuiNRjk7kZ3vptAlLRoMk3x/qC6e0tN47f3DBIGd
 tnIgk5Rd7pbGeWGLxXQ+48HyKBe8KYX5OVrJxlru4+qDyyl3j6/e1SEfoC4pZu8JFCmIAo2IG/3
 3tKlmH2q2MPEl4gapbYVzKPUW5VCrvsGWBTnXFoOGXE18eUSaWh+VoKQtSf9WjNH/usKHpIbS1w
 ZmDNBx0Q5YrZITY/U3Jgp6Nx0K5wq8qdlIjUdPpJMxbIEba02AwsDXPENwyqFTOmqHmCpetp0wG
 EzRKU9I6a5PFfb4O3fHbqylMFSavmzA0tGDFnzWxXUoWyaglW9E2iCKBVFqW9T0DPEEeYwiEl7f
 icJXh7pAfomPURftmPjda1z7J0XpZOhj6cpIQZpastJwg1xh3jBKb0vdcEqm1U8yqxpwvbUkluz
 bzHIn5lQ==
X-Received: by 2002:a05:6102:418d:b0:7cc:c104:6dc6 with SMTP id
 ada2fe7eead31-7d07261f9b2mr5162676137.14.1793794362833; 
 Wed, 04 Nov 2026 04:12:42 -0800 (PST)
X-Received: by 2002:a05:6102:418d:b0:7cc:c104:6dc6 with SMTP id
 ada2fe7eead31-7d07261f9b2mr5162671137.14.1793794362310; 
 Wed, 04 Nov 2026 04:12:42 -0800 (PST)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec9cd43bsm3760201f8f.14.2026.11.04.04.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 04:12:41 -0800 (PST)
Message-ID: <105d0d14-f3ec-4a83-aa82-96365f91c736@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 13:12:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 3/4] target/arm: Only allow GICv5 on CPUs without
 AArch32 at EL1..3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261103172616.2400758-1-peter.maydell@linaro.org>
 <20261103172616.2400758-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261103172616.2400758-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OCBTYWx0ZWRfX0VZ7BqN2lSEs
 eODZELf+GyQW8zsJQOo73/OXnNmRT17oMz4j2FeNbLQw8zFoa1xgzeK7z553LnB1pah6tXOpEoL
 LF+Xwf7KB07thOfvY+XE02Pl3X5Kln6t/cTjZYcD44KZot6EtmbpD53TdBlsP4eds+rdq9KK1gm
 o1GIbjikEG9pLMichPpfdrOQncHjsQVxpIf0t8QhjjtpfWX5RURYDPuqYLhvcuRunxoK8LTFZP7
 tjJ3CsvmHup0qYvT6oPZ5DL7sReOnmSWFo2Q4iPDUeqgqXJ/7wRkLHCSodngZ/pKwleAVeP3NyP
 p3RA9gE/azARrq49VZCANLi2PGMzya6FoK5B/Y0ctbWi72zg47grKdD/c+Y1gGF0nIlGlHIyuQO
 3hlFZim/BtQCGjXj9n1RiQLBCq8cGjs544cdKKVOQPLS2pXKBNf4rbJq/tqRRgz1R7ahX263qsl
 v75GVGXIC4kBkMDjhzw==
X-Proofpoint-GUID: vBe-mhDaZIn677bHGNeJYSLqCsyDgMkC
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb213b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2OPPvVUHo6XKvPPvzmcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OCBTYWx0ZWRfXwcI7j5nPBv15
 gr25wEMmYe0Sxwk7YhMVPuD0H564n0r5LnwOH50cYI6WidZnLHcgAZ73yZ9jTSmmVQQvrRktbFX
 UWMrFkTwCwzo6pXv4At9qrhTqzxAv80=
X-Proofpoint-ORIG-GUID: vBe-mhDaZIn677bHGNeJYSLqCsyDgMkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040048
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

On 3/11/26 18:26, Peter Maydell wrote:
> We previously allowed the GICv5 on any 64-bit CPU, with a hack where
> enabling the GICv5 silently disabled AArch32 for EL1..3.
> 
> Now that we have a separate 'max-v8' and 'max-v9' where max-v9
> correctly doesn't implement AArch32 at EL1..3, we can fix the "when
> do we expose the has_gcie property" condition so that we only allow
> the GICv5 when AArch32 doesn't exist above EL0, and remove the hack
> disabling AArch32.
> 
> We could instead have defined a new ARM_FEATURE_V9, but "allow the
> feature to be present on CPUs where it doesn't actively break
> anything" fits the way we've generally handled things in QEMU, and it
> avoids having a new V9 feature bit that we only use for this one
> thing and where it's not clear when we should be setting it for KVM,
> hvf, etc accelerators.
> 
> In practice the only CPUs which will allow GICv5 now are max, max-v9
> and a64fx.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h |  8 ++++++++
>   target/arm/cpu.c          | 37 +++++++------------------------------
>   2 files changed, 15 insertions(+), 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

