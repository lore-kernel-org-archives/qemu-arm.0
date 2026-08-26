Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EB9C61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 19:07:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzIx9-0004j6-5z; Wed, 26 Aug 2026 15:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzIx6-0004ht-JP
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 15:06:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzIx4-0007s3-Qb
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 15:06:24 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QGugE71408692
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 19:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rYC8rWwb2CJyBe36pC2ps6aD4zJ9K5r9WG37Oz3/QqM=; b=GsKqzTFy/xc7tA60
 rff8ZSei/77hxQtWZjUvmh7QBlEBRF3xv52NTCdljENJxpyy2mfYGKX3gFtwaM1O
 A3UqqnUxaOGC+sPG+xpp2TsD3zfA/saEcXrOV/QVMRkZjlVhxf4tuvoKXwLsmYSt
 2mwnCo8n9nw16wvgkAAUQaFAb5PhCJHSHAT6LGGQ6iorf1eY45MfdhRyGWjAIJfg
 q8+kKdBb4kR006i51KpdhVxQnArGm0c49SmhY/cL6bZH951/tjDZ2pzLOK1hJ1k5
 2aZdoI0VOo84bDYqv6gayHt8D7AU4XSghSt5ZgQNMrpvzBONz8E+kvu0x0fQdkXz
 KjKPKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n23px-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 19:06:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5283df62d68so16751381cf.0
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 12:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787771180; x=1788375980; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rYC8rWwb2CJyBe36pC2ps6aD4zJ9K5r9WG37Oz3/QqM=;
 b=VgZyF/HQz7cZFy1KZ0dK/f73Dq6hdl+Z8NT3rSN1CFHJrQJF2E+AYcd6CCX5flBFgh
 /fCHlAthgN2nnAGqeGRhRJ5377UNYR+xgiudRdlAwQZTK1cvPAMhVWRkONfsmPCxpOra
 4b/zfGkX1lYAbwJikrmLwgW2ewYwxwUu/rBk/Z4bXonFh0/qCnWUcgKaVcMf3CxTMf11
 vBR/38FSFYvf9Yud7ByVBguZTeR/qVIdlDJWjpvxgA4unXi34HmpYg9vbFdCfMHUjZNx
 COBq/3I3dlGss5toEmd2fTYnNUWXOM+tcYO3Wa1QsALrNCM0ABqEsZSS5q08OYT8BWxg
 DCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787771180; x=1788375980;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rYC8rWwb2CJyBe36pC2ps6aD4zJ9K5r9WG37Oz3/QqM=;
 b=eVyo5yl6BGGpYKB9pmfWAg9SYtmMQ6j5mfIr+2LqKrgIQVio/M47ddTh8SbkCgiLCC
 XGma8YX8HCIrGSJInM8ZTZrZ7Int7fKOnm2dSQbhEjqxF+Ch7B5Ocnf+nWh/bT63yIyj
 2Z0fIr1/oPD5CQvJQz4iOLzc4Qm90z4jILBhcpNt5GmcjCbEG+85UfPmUe1Jc7w7Cdnk
 aOzTXuHSy3y7QFxQb1kNOTTdl4mePx13x5pbH7wWipvDSSLkHOF8oaDqg98RGEao5SKq
 YH6bppwT+WCHoEo/XrDjmlp3DXa+FVamRVFnppMckxzaCMbvFmstzTwr/fZE2iurbzb7
 hppw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpmuDtLBsZDz927Nl3bB+9MK12bkT18shn2wMvsyIWO27A4yvsVOy7S4p2CfttRF3mZAkNKobbVBQ==@nongnu.org
X-Gm-Message-State: AFuF++m+0ygkjcCrPtuCMvSSl4sZXvJsFZGxmz9tZ/VRlPK58aKlHNay
 RUjZAbQ8byWE83NAi+HjjjxoiRtRPddulKN94mVQIyvt+r0b6pUK+GtloVt9mLf2HX6XhB4NARi
 wDp+lYkcP3Zq7Exi1nQO7w2ssB+KBZbwrcYYBmJS57rXNof15q6VZ4Zo=
X-Gm-Gg: AR+sD102Us5uTqrkbeC14qfpTYyiJz8igjKuS2cK5d7xRq03z0uQJzbhAulu2JsGkJw
 H9VjXjfXZGV2vFwODtjp/06Nkvp8fz0I8kODWHd4A/UrZzlTUZRz97MhO7oHa4lDR9bDLv+STOa
 DpSVxPfb+RpAPWejmt8vXtSX5mtD3HpqE+OqOGMGB4N3lgWYruO0xoN+Vo93AI/WNd9oY/g03qM
 Wi+bQiQ5a1KhgyicwaKDm4Wg0zjCEnCXFv0hdj2FaWThgkksYAs8rV/M+09Z7HpAPaVgrR/18NT
 4YJPMRXMyr7NpdByRb1owHETCAikxRx3wMxP38zxrlQrFblRAomCruF8NUiw8YZkciKO9jGIWgo
 eqsiYTDfx1kGATdMKk6iIc7QVWFPUt2TYs5OmbNy6ch4=
X-Received: by 2002:a05:622a:5c07:b0:51c:f3:34df with SMTP id
 d75a77b69052e-52e42377f32mr103323721cf.30.1787771180110; 
 Wed, 26 Aug 2026 12:06:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:51c:f3:34df with SMTP id
 d75a77b69052e-52e42377f32mr103322361cf.30.1787771179413; 
 Wed, 26 Aug 2026 12:06:19 -0700 (PDT)
Received: from [10.254.188.74] (134.171.88.92.rev.sfr.net. [92.88.171.134])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8b641fsm5762088a12.3.2026.08.26.12.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 12:06:18 -0700 (PDT)
Message-ID: <845658f0-5d70-46b5-8c3f-a018f18f1b17@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 21:06:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] single-binary: link ARM and RISC-V into
 qemu-system
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Bibo Mao <maobibo@loongson.cn>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alexander Bulekov <alxndr@bu.edu>, Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Glenn Miles <milesg@linux.ibm.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, Darren Kenny
 <darren.kenny@oracle.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Ani Sinha <anisinha@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20260826184229.1145-1-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826184229.1145-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pnfpWIw7btu2AifJpCMktNqw_AxodQmQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE1OSBTYWx0ZWRfX9nhgoG+q7jWG
 mqnFfSDNitt3E9Kk9g1DTY6aH35F+czWgG1y+io0LJIfyfXKXehxXcTzFxodgIWIhqnc/YQ0caF
 dl1aszwhXGxSpgc9dh3/Y9eKGKiYSXU=
X-Proofpoint-GUID: pnfpWIw7btu2AifJpCMktNqw_AxodQmQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE1OSBTYWx0ZWRfX0ai6X/6XizWP
 NTyIeFOEY1K93rJ590KxB+SgB1wwAn8kpTc34BK0clISYnPYHtKSI+7feMFcG028PbimplwjMCV
 uyY/Jz2bFYfVKTfXis7Qh5xo2tHfSWHRNY/kBjdUue0y5ok4CTPw2dw1i0HPHq4mo8Gs9Q0tzvx
 5C1KdhYMmzCpS+Z23int8nKHmd0nQw9YeXDWEAXQeGmjGvzjJbKx3xxzFm0bTMPgqMRsMCMEcSX
 CGB7SptKs0tmkfRzCyBXlu1XYIjpihbrp+OcMM2kOxJBlKU88Yt7SxFnyBI2975RJqQ8zhkJz2V
 evCDEA/K8AqMi/MYHjRyCDF75wzDTiTUUYPOWDGbxJ8SXOTLu+PdjxwhKIXMrL1lw6bTEmpa1bD
 EVWEfwkqthzbpwJvC0kycwkZlVreiAewWgAeE2XV6YYqchjSZBl7wUGo1veCk0KvAatkba3HFRT
 6qqKKkaNBricaQXqiTQ==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8f392d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=o1isufRNksZXpKP+aqnsag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=q2Dha5Rnfv4IMWUVstwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260159
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

On 26/8/26 20:42, Yonggang Luo wrote:

> Changes v1 -> v2:
> - Drop little- and big-endian TargetInfo variants from this series.
>    v1 registered target-info-<name>-le and -be, selected is_default from
>    TARGET_BIG_ENDIAN, and accepted -target tokens such as aarch64-le.
>    v2 keeps one TargetInfo per target_name. Endian variants are later
>    work, not required to link ARM and RISC-V into qemu-system.
> - -target help/? lists target_name only. Unknown names point at
>    -target ? rather than printing the list and exit(1).
> - qemu-system with no arch suffix always requires -target. v1 could
>    still pick a unique TargetInfo when only one was registered.
> - Keep qemu-system-$TARGET; qemu-system is an extra binary. v1
>    described installing per-arch names as symlinks to qemu-system.
> - Do not build qemu-systemw for the combined binary. A Windows GUI
>    twin would keep using exe symbols from DLLs, and data exports
>    cannot be delay-loaded (qdev_prop_array / qdev_prop_*), which
>    would block enabling modules globally on Windows.

FTR I'll wait we finish discussing on your v1 before having a look
at this v2.

