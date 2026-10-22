Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D167B606A319
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Oct 2026 21:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PYif2NlX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CtMskylN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xK0hE-0005Sz-3P; Thu, 22 Oct 2026 17:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xK0hB-0005Rh-Fr
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 17:51:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xK0h8-0007Po-Ro
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 17:51:33 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MHtCtD060317
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 21:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tgof4xeQxDUPHvATTXpvhIEikVuTeNgO2i8Ax4Ed4BY=; b=PYif2NlX7XoDc+6E
 NNcnxysH0svNwW+EMqVhpFIWFNki/foOfl9F5+kEACAFHjGV7rNuMWHe9echd/2i
 GC25DAE6HiveFbBgU91BlmAJumgyTZ5bDj4dzVVYMgDtp2xF4+YDZjKYTm6kmD2d
 C2/rFikls2kJQtIoR0BQr4YZ8/4KC2afH9JTeQrZyiVn+aACaAQZ7GA7B5yQbyk+
 wOwtVZhl1UZzG6Db0NrjCRd5ivYyvpChxA/TROrmvDYNrGqknT+TML9EwWiEJAJx
 uXw5BTVncXkV5bj2Ab0EgsXF9WVLT3as/bXrqCpjRNdZfzMDayB3zCcYBYftuG2o
 t1yGzA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahs3um-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 21:51:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-36637676140so425808eec.0
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 14:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792705888; x=1793310688; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tgof4xeQxDUPHvATTXpvhIEikVuTeNgO2i8Ax4Ed4BY=;
 b=CtMskylNZH6zItinYKHgxM6l/1uw7o8IEvBg2Mu7GhUzv2aNvlaKBGVmUIryPHZxbC
 tpJcqXEJun8jwOFkb/Mh8dkt8JA8cKJuPqdCU58/onKq6Tv6RBCupZdE36M3UCdJ4tjq
 ryXilD5xOs3aGlkznfxJUqJmq50/EPQ1yrEJNXKYOTZkE8Qt+uFU9fCo9TR5dV0N4Rd8
 VRqD9nWaIpipjmecQm3E0kzbQrYjzaIe2PmCVA3IINA77cYhD2ZBLzImh0YjmYGorNRK
 0uLQfvx50YaGB2AXnbbdkek9vz9oe5RLCYAHMjqKa2b8PoXOXJAYxejUcNr6CI9Dl4Wz
 flQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792705888; x=1793310688;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tgof4xeQxDUPHvATTXpvhIEikVuTeNgO2i8Ax4Ed4BY=;
 b=bz1a6hWvZAKKoirf/yo1KupItGsvf5Mmx4WHVDxAVg1sXcIqJ8IbD2mcJ0uswtxg2j
 H4ITS80mrqoWXKvC4psQQUt0Ex59hM6EYryRLqQ2grhKtW97X4TkrNaftyBW4MCen7KL
 3PmACZonn5S7Zx3F0Z75At1Ut/FqYYaRxNd3u+Dhg2dA+GK2oTsFJPbGFvjMlGyxDgiW
 yPPXZyJxzcS5pyiFlD6JFmBx8jO5tqtDUn9tdTNAjAx2F5ARSFZO1jeu3ZCB4VT1mC9a
 5FxxsbOl6ByWhUkkY9QkhHXXXR7VHRC5cwBGL34Lo1h/AcZ/f9NrGEvwIhcj8plYk/li
 EkWQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxJy5NdglF047nRYL0T1hp8BftbXm2cNQt6e5dpXXroSrqI1rd9X0J1ajrGKY/1UI8qmncqktih3Q==@nongnu.org
X-Gm-Message-State: AFq9FYJsU68IITV5p57glVzJdsIkoRh93P7NXLS0OHwqtfJrcc6gnYhO
 7HChL2mxPXdHN/EULQ5eAGEV2P2Ta9nS8o6yEtZKozFfpT8cAV4oQnfHyelZ/QBqD89K2kk3OTt
 UG68c1ea9ygT79HsRJciRUVJXcdIxI5QkHTlgmr/Ve6ALRH8/a3oFYlU=
X-Gm-Gg: AYBFou24eMQpYSQfXL2NciksLz5juZbZCbM/oJQJ7DDX5BK6EeG4pRsm/l/v+tNn19a
 uymY3SeRJVne3/Ny990KfQddbzy9kfJhdtIXIUSkGue4mQCWEpgnpCKRcW7TQnSQvcU9KuZl8fP
 wSMcv/EcEqk5gOXSHxdXq+ilQHZ/nC0FA+mqqRSLNfqzqX7EB1arztQxUJRxE5F0j+/lV/jVpvu
 JtncqGIdsgexmWB/wO+Hhum0J+twHKBHoJEn8SWhKWwP7gm6tJ6qPa7roXBxHYCa6MuXq55vVOA
 DoGy63KydLogUy8aiSGBwymGtK7u6cN+3x372OeNIHG0e7UUbi1oeLB+gD7+Wb1fw8TDLWMidhG
 hdEw/7Z3yZseHDXUmxMEJp9vcMz4O29zIrCWlDl9yrKn1qjbDj7R7NOJ3KfT8121r8vd4qw==
X-Received: by 2002:a05:7301:1a16:b0:358:36e5:b81c with SMTP id
 5a478bee46e88-369d97e9d05mr485087eec.31.1792705887454; 
 Thu, 22 Oct 2026 14:51:27 -0700 (PDT)
X-Received: by 2002:a05:7301:1a16:b0:358:36e5:b81c with SMTP id
 5a478bee46e88-369d97e9d05mr485036eec.31.1792705886817; 
 Thu, 22 Oct 2026 14:51:26 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369d9d5e9e2sm651187eec.4.2026.10.22.14.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 14:51:26 -0700 (PDT)
Message-ID: <97d994db-940b-4687-9596-cc4ef2f30ff0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:51:23 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] gdbstub: add gdb_register_internal_coprocessor()
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
References: <20261022-query-reg-v3-0-7ad902b9a7cf@redhat.com>
 <20261022-query-reg-v3-4-7ad902b9a7cf@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-query-reg-v3-4-7ad902b9a7cf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfXxwyMNYLPEc6V
 niuTweWxBJMd9rxYguJgaD80mRIAfv/6ieA8M+jcsd1xr0dqqXzgvhwtBtmj0V9odg2NakRvLPW
 0xNMgSIblpbxCen0i9PBU4mc1GbaPsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfXxbpp9qRDqjcs
 jnABhMV3ACEDCkc4szXQbHNWrtWbqHZFmqG7x60doAOBpOX/fTiwgxvKAlBgQZVVXbgxRdMS0he
 wVFeK3jNgYwMXzN7vl+SERj8nLcG05MPg2xoEG+S8tXh50Fqdpn+peJx4E8WXZTUSO+8E+cYGb1
 Uz3Q2vedCIfxO41ik4f47+ZNlOcf2A3tQyBzgORvOPnKKMc0YCDdPYgkKXS1AMNGKsXxHunnTGd
 AljjS+2YJpTcXrkxsq71lOW/XE88J+TeTDf6roP8wJu5mG6NUGxA1MfEoXNSPajUYcO+kPy1h/I
 HdwDMalRfCOhf7xrwuXLbASV3neW2OyGip2gXmMG/uUDATPuzGJrUH88skbLSXKECGxN09T3HJG
 t0qlqSCGniW/QGjhQAcN/if9p+HidzFnaRHd27qL/3L5J2IRnmdqvMDHn5uGRsI3X5dBxV3vRwI
 Afu3pJCSsGdTeIWIRag==
X-Proofpoint-GUID: 6kUEi7nmrrie3KykmUX0cTiqUES4Wuox
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6ada8560 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=pK9UF8FOw1_8_zJS-xMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 6kUEi7nmrrie3KykmUX0cTiqUES4Wuox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220087
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/2026 3:56 AM, Marc-André Lureau wrote:
> Add support for registering coprocessor features that are only visible
> to QEMU's internal APIs (HMP monitor $register expressions, plugins) but
> hidden from GDB's target description XML.
> 
> When a feature is registered as internal:
> - It is excluded from the target.xml sent to GDB
> - Its XML is not served via qXfer:features:read
> - 'p'/'P' packets for internal register numbers return E14
> 
> This is useful for exposing system registers to the HMP monitor without
> affecting GDB's register namespace. Exposing aliases or synthetic
> registers through GDB's target description can cause problems: name
> collisions with GDB's pseudo-registers, independent register caching,
> and missing DWARF unwind rules.
> 
> Internal features must be registered after all GDB-visible features to
> keep remote register numbering consistent. This ordering is enforced
> with an assertion.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  gdbstub/gdbstub.c      | 71 ++++++++++++++++++++++++++++++++++++++++++++------
>  include/exec/gdbstub.h | 21 +++++++++++++++
>  2 files changed, 84 insertions(+), 8 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

