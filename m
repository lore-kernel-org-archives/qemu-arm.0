Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939B1606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 17:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EdVg1DAW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9C5MKna
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVXa1-00036A-9E; Mon, 23 Nov 2026 12:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xVXZy-00034U-5U
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 12:11:46 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xVXZv-00020h-M3
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 12:11:45 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANGGw4r2340303
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 17:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Qp3ZH8FYZUKqpSfnD6oLIFr7AHh5cCrHjTiKxCYtRgU=; b=EdVg1DAWBfZz4rdq
 7BwAYze+nbBXLISz69KdaoUswO5xgp4ogVy3sNKOzSNDoxcsPBpRWcf+CvYIObv0
 7VS1kjcYLJ+bQ2vhXaAwoT9g7Tin1VeLYZgchstHRMtjBlajIsLPwtiPKuDQCqB9
 HbvwatfwsgaWIzPzGAS4j/4UQUSjv3TWc2MPmet7vIiDo3LnrVAntOIl38UCddi7
 mZDz9Z70FyIOEFpXSd7wUsSan08DG7wD4sY04NsDdp9VXrWrKHxgZnVw2MZAvhEv
 PIdam9W04aoDpk6exwrZhYrB7iBcQNRSmDcvHyE7vd5c0LsS7iq8EwzLQ8sFCEgw
 /GJhTw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx2r08-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 17:11:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cd5ca3840c5so3699520a12.2
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 09:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795453900; x=1796058700; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Qp3ZH8FYZUKqpSfnD6oLIFr7AHh5cCrHjTiKxCYtRgU=;
 b=b9C5MKnaJOaeBpNIwmQTcfIrR47YExUrgRLVWUNfN/lDjMu4ATb0dWfIoyueCa6JXA
 7A2BDOzZ6NWbhiotZeT45qDzIWSa8DKssO5v2N3iu5MZY/GRZscMnDYE23UmE3Ua/4PU
 r32wdImwJwfqMZWa7ZL8N8+2MZNZ2/DiStq2XuOMFrVtEDSNx7gs7cvr77uku7yJ4NZj
 8sTcoytuwfb61POXNV86BdFae/4Yzud3yVX3c5My1L90JbdtTXwWo0W8PQoajMgcDkIt
 CcmrvdmrGIpsvCXcfMZuGvGaJ5QIOtdHNcI20EQSdfaaa0XD98JlRj2+aAfwydWOWk2B
 hrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795453900; x=1796058700;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Qp3ZH8FYZUKqpSfnD6oLIFr7AHh5cCrHjTiKxCYtRgU=;
 b=nIov9d5azF5nDmgn9atx6XfgXG76KougQGxqbJWcY3g9TVLpsfgD1eVMdvTtXNjX+C
 gLUKT+9VsUDNAAWwXfPD3AvMfZW0IA1iUfEQFdn5KbIfCgF1/6Fgm48ugUx3VZBWSXuM
 6B0P0BGwUJzF/fPDScD6nKv5/Jhj0RVmiLorrrJDfACBjPUzkEP6cJh7UgOmt1rGJntO
 g4JB3yGSBOmq2NJ1wQ/ayojFC5WExD25h5FOMl4PFnPwbo/YGwYPtiy6ElFh2jZt6rol
 7+sZY4qx94Z2iADTd1GItxMMYN14w+aYsGURD66jQgD1yzNPnkyJLnev/4IkXbBa2n6T
 MP7w==
X-Forwarded-Encrypted: i=1;
 AL+hErEEn1Xwr7r1wJaFUz2WUMrAehm3O0iep9j6cf7aLTNaZ95ydMILioJAr8BBwEgO7HESl2TNLFEg1A==@nongnu.org
X-Gm-Message-State: APuU4Z+WJuAsiHZDfMRUplxJPJNkPxrPNuGtFjaJVVC3vFzc6c4BzvpL
 sVSKUpLY05X4beCFqFC2Gm0hFUO8mUQcIUQiVYubFYhzv/66GZTOasPj48tzMSWX6cfSt/RK466
 bwIkwrYvNIukhi5wF/K6xTnqmMzQGyrlVfLG8/7bmAgZExDO1c7Pb3Vc=
X-Gm-Gg: AZFdTZdOVrukCo5ADGsz62US7Lyh9JD3QaNqTTxamD4GQAdWZ8TQ85GHmpwKJi7Ds93
 WaMOIoSTedWgtKx2/JK9rhqEyNmapjsUWMS2GKqTCOgL/DjOHgzbQg+vWIgug0kNTOWNdiyjNZw
 x8ZO6NObRWZ3HrhruNfV0O4xunvKsO/2wqDXNcQ8rs1IRhaT7UmlzQoaArFnZ2gVQ+DVHWdTeue
 i77Kln64YTDUzcMJ3mUQ0P97EJNQMcW9cnWIbfeIjPtUVobXWz88SIDmX9kqAQs64NsGjW0ac+A
 AKX38FWJIWqjlFAHfm6gHx6AdW9R/4lIrE+wkpt5i21byb630VWwLnVo1rH007O1WLrhIzhI54a
 CK8xoUxo7xPgzLGrqkMVAaaFW78KHOaB7unPT+S5ryaVPPlLlojAE689DYtKh2BuVlmO3Qeb2vb
 4Svgk1Tgdiw+ict7VA6zcvlHSnkmcRygQrBub9/x+taz0=
X-Received: by 2002:a05:6a20:96d1:b0:3e1:9220:9d10 with SMTP id
 adf61e73a8af0-40283cbd00emr6338412637.35.1795453900286; 
 Mon, 23 Nov 2026 09:11:40 -0800 (PST)
X-Received: by 2002:a05:6a20:96d1:b0:3e1:9220:9d10 with SMTP id
 adf61e73a8af0-40283cbd00emr6338396637.35.1795453899835; 
 Mon, 23 Nov 2026 09:11:39 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8c873b25bfasm5952948b3a.46.2026.11.23.09.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 09:11:39 -0800 (PST)
Message-ID: <423e551e-cfc5-44a8-8061-2dd454248a42@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 09:11:38 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] tests/functional: misc fixes to functional test
 suite
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, Eric Farman <farman@linux.ibm.com>
References: <20261120121458.3723625-1-berrange@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120121458.3723625-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b0473cd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=c0_jobgDb0B2UsOWms8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: iBq3j85r676BfyzZ3BPiz86n62JMLXib
X-Proofpoint-GUID: iBq3j85r676BfyzZ3BPiz86n62JMLXib
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX6Bw4/9nSRfYZ
 FuO3Q6VzHQh6MfdrQam78cHasAf75Raof2PC4/aQx719OEVgZrZ1SCTnXYZUeJUdz5vhbHIlL+/
 RiaMogFI5hp2tjzcemhHPiZM1f/kH/M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXy0mrOZRe2NV1
 qsPpDlF8UADGpNMuL3faqYEDf5aKTJs9hS+GRthvMU2U5Mqu0+1zmdaNawt2KrTjZU0tYLEx6cu
 TugNfIgszu0GYt0Zr7cN8Vd+xSgAj4u8qHltUTFAK6oVrTV/8PZsnXRIF75PyA9RKkPP7zR/v+7
 Oi/i68p9d2z/Xfijnzt1iyXqZEaoTXLlmPHHC3oufDeimKVs6bVn62zjZH1W6XZcf8p3QCJrFOr
 1d/XtQ4KtT3cGBOP+SI8VuL0HAHKt2qPctmXcic8ndqreetx4ntd/YWHJinRjyfdSrnXIH0kp66
 tg/4xV6Y06rfeJvnqg2cbeJDKol3QUrhNmXnj+wL15GRJ8Cx8zI4hNxmlq0GoVDtOuFQqlld/RO
 //dtdgeMjVbCLzGMiBtSSPynniQdMHey0KT24381hB5fmJmD8ZtKDGjH8lWUIrQ2559YYN66veq
 UHKlBrVqz9JhCKKDx0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 11/20/2026 4:14 AM, Daniel P. Berrangé wrote:
> The first 4 patches fix failures to download a number of assets
> whose URLs have been deleted, or moved, content regenerated, or
> put behind anubis.
> 
> They will need to go to the pending 11.2 release and stable branches
> too.
> 
> The remaining patches are bug fixes except for the very last
> patch. Those can likely all wait until 12.0, but cherry-picking
> some of them into stable would be reasonable if desired.
> 
> After this series is applied we have one unresolvable problem
> with assets for MIPS, the yamon-bin-02.22.zip file hosted on
> AWS is throwing an error about using the wrong endpoint, but
> I can't figure out what the right one is (if any).
> 
> Daniel P. Berrangé (12):
>   tests/functional: update to newer sunxi kernel package
>   tests/functional: update sha digests for tuxrun kernels
>   tests/functional: update URL to rs6000 firmware
>   tests/functional: add Accept header when downloading assets
>   tests/functional: check if we are served an Anubis challenge
>   tests/functional: don't write timestamp unless successful
>   tests/functional: delete tmp file on interrupt
>   tests/functional: honour make jobs in precache
>   tests/functional: don't display stack trace on download fail
>   tests/functional: always raise AssetError when download fails
>   tests/functional: only run pre-cache once per class
>   tests/functional: optionally display download progress
> 
>  docs/devel/testing/functional.rst       |  6 ++
>  tests/Makefile.include                  |  2 +-
>  tests/functional/aarch64/test_tuxrun.py |  4 +-
>  tests/functional/arm/test_bpim2u.py     | 19 +++---
>  tests/functional/arm/test_cubieboard.py | 15 ++---
>  tests/functional/arm/test_orangepi.py   | 19 +++---
>  tests/functional/arm/test_replay.py     | 12 ++--
>  tests/functional/ppc/test_40p.py        |  3 +-
>  tests/functional/qemu_test/asset.py     | 83 ++++++++++++++++++++-----
>  tests/functional/qemu_test/testcase.py  |  8 ++-
>  tests/functional/s390x/test_tuxrun.py   |  4 +-
>  tests/functional/x86_64/test_tuxrun.py  |  4 +-
>  12 files changed, 123 insertions(+), 56 deletions(-)
> 

For the whole series,
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Regards,
Pierrick

