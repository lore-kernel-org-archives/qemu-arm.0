Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E268A606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YHIP6k6u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbBg7jiq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMAcu-0005H1-VN; Wed, 28 Oct 2026 16:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAcU-0005DN-0D
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:51:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAcR-0005kH-Sx
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:51:37 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SIPQFE1898445
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /oekYVVq3nE/weCVogNCmjoEoUAJgEM/k26Ub8/q9Bk=; b=YHIP6k6uF706cdQg
 39zDjTg+fJavoSLRkYU1Opruvg1IZvQzeD1HzYAA0JmTY5aMTWhRzNDYxpciEZzf
 +UefSKobdSBOIMDJgI9pr/XKZpyutzXd+0hxG34iQbl332fyu7pP05RfQf/0nQfs
 elbt8eEqfOwyD3Cv82f5Q12XWABcuuMzMYVb+ROrDTyQzOB4JrE4+8B+6HJgLsLF
 Swn4ZSyMpFJIk6p9SOoRikvlK9VIw89OKLTehoT+m24GFEeZhI2+WyNdKOQecS4J
 6B3uhOXalQagYlI5vH3e9yXx2B9LO5FwPTCZxX3pvyBqe46bb3ViAYpEvNEyM9MH
 la6/DA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehjg5n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:51:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-36a1e2485fdso3029916eec.1
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793220694; x=1793825494; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/oekYVVq3nE/weCVogNCmjoEoUAJgEM/k26Ub8/q9Bk=;
 b=YbBg7jiqs/tUBVV2JvpUYVx+jQhtl5xV1d3zbDJU0bGfA5gk+vCfJ4bc+ZKLSxM4Nc
 gvEEDj8SKSvccDj7tQGLlQUIvPreaQCxuCvCQticIcSXGo1lRuzdub5k0wZl11F+X5pk
 5c+nWR5XxA0LOJ5QgvY4r1Ir9rJkfQDRSiOOXIpcN3TyJECY0eDNfQN+UgOSzxBFYfBG
 9rhu/jrX8yxR0wNlIuL/nyh1rSn5yZw+D+gyFdB/pltdm8+8C18Bqz/PDxLwKxDazskM
 P4hawEOpVMZct5gHfuAkXXwg4Et4IXb7KWUTytoSO89FR7K2onZlkjpMHz953I1RJvDJ
 MzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793220694; x=1793825494;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/oekYVVq3nE/weCVogNCmjoEoUAJgEM/k26Ub8/q9Bk=;
 b=hwdERaC3hovC8k9pppaD8GaDBkLhK3FzQJMA7u4L2Nt81P58rHglXWatJbICvt3nDx
 B+INtKTgOMx7C2DWJMyZyzpF1yllI3+ZaLKe4v6f79GBdY2/AA8FvXzZ1+bfLaTrn7KZ
 ZWg371X3Q8hb4Ahg4p0et5IE8myoEhbbn7RQeRdN8XS7aslAUN/mFwrIvtodldQ/E9Ae
 0+m/ur24cDokAErNm8TJSpw7EG7iw/wIlJjE+r2p01OAtvmW1wqLG7WkR2UegfCioYrX
 7qWrQrCc4WIZX09u+/kQta/anU/CXBdne04xJ5aWYFizqjPyG4FyUpGTKFvE8V6hBqAK
 /CNA==
X-Forwarded-Encrypted: i=1;
 AKwUvByDBHbNYYA+g6iBa6Y1ea9X+hbLzfhMgZbP85uuz6LG6Aab8d8B7fhqWSrqvLYd6cCpHqKKRtvQXA==@nongnu.org
X-Gm-Message-State: AFq9FYJxTuYy/GFM0MzKtW29KTgGIYCUqmExcH//7KJ/sGXOoRGGp662
 Uu4SLJPQmYJkTZny4VSbv4nRxGlz5CO6YTpAx++5Ugb/V4PzWzrgaN/F3uumSA1oEVRtXHP06Kl
 GfW5MEt1wiLIRYjjAJg3S0Q29MyRMSVjofRlgqNmEA5JVmEKYwUsrnkc=
X-Gm-Gg: AYBFou2k2J67NlpGLyrePPEUqq6zC0/kG4aui1gaFCElv81mwdWoWs7M3JBWpafvM/f
 q0hpjGkC9g4l73q82+3ecoR7OtmZwKR5+TBhxSh88b12fmG0NmC89vnmOXKmEcz7tK5JXUojsVP
 MPEgSY+suAwx9PuZSZoc7BSkZj9J6/TLIW/Zb6b63sbj9Lq08cd/aaPnKaz+u4xgIP5/IUo51XN
 6WVJ/n4r194qWDOkgJV8dfQ8c/BhLZrpKIUZAUjbkRSIuSjjf0ij5kbZ2UtheJoleQApl+3kjEE
 fg9wuLGmq3kajc0xO/dX2BHK13/mw7dkVlL2Sc0vE/x25/GGCCRiupXDiOJ+UGzncMmpdQQ9/fa
 REGi4wUR/t6/JnC1RUriGagwt4UXbhcHD45dMZs3rWdx0663UF0Qbjd4vof5CeKsK+mzC4IeuVw
 OTjlvpNnn98lkcsA1M9eeoWyxOGAz6wiPaSb4TPatn7co=
X-Received: by 2002:a05:693c:6009:b0:361:1dd6:531b with SMTP id
 5a478bee46e88-36a203d42b0mr3163846eec.26.1793220693462; 
 Wed, 28 Oct 2026 13:51:33 -0700 (PDT)
X-Received: by 2002:a05:693c:6009:b0:361:1dd6:531b with SMTP id
 5a478bee46e88-36a203d42b0mr3163813eec.26.1793220692934; 
 Wed, 28 Oct 2026 13:51:32 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a23908449sm9521686eec.11.2026.10.28.13.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 13:51:32 -0700 (PDT)
Message-ID: <30c84eed-3260-4f13-a3a9-2dda58c1a89d@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:51:31 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] hw/scsi/scsi-disk: register s390x scsi-hd and
 scsi-cd variants
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Farman
 <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20261028201557.2688-1-luoyonggang@gmail.com>
 <20261028201557.2688-8-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028201557.2688-8-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MyBTYWx0ZWRfX4ChPuiuKwmCg
 oJkd0oJ8UrE9Rw41BTEjMOGFdfnyXTtRkIJ1jDtr1H5Ov0zjEbLVZz1kU4Jllrj/jbY9kv+wve/
 1+eFYl99zez6mIgw4rpmRR9q3GeHWYlMw4xprCXeEy7/93SS39O6/+4pGf8+4Tk52tGFE4JgOC7
 61OD1SjoAzfuMcxtPADIjjcpCNjczOfnxMuivHvQc6/craYc94wUaRl3JFQihEs9SgtZt8Cxltd
 pZphsKG1l01nMU6Wyq2lyu1divJkWv49CKaHbxdILvkgtJO3nxvL/b9GRw2ImCm/BrsAPpUgZC/
 Cdc+N9Qp7KOf5N441pLA7Z0lSTxNue+T0Te99vcO7kb75cCxhBpRDKgFss5O22bGhh2hAHI8ahV
 8lUC6JN3l0rM38x+E4zW1oLYHA2qXT+vtN4oS4e0bdQoJQAqxEAbFkP79xGVi20An38JGiwGUjO
 G/PIk7QyoSgEwPTxiJA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae26056 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=DVt02nBQAYtqlOVpk1UA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: R0GrPJhad8iWupD4dWytdHg-bawFOZgN
X-Proofpoint-GUID: R0GrPJhad8iWupD4dWytdHg-bawFOZgN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MyBTYWx0ZWRfX89azMiekJZX/
 9/KHez0nMC9Ewn6PgsMwMktyUWLq3icpTbkRglp7MxAoJYm7t3DeBGjIy+gfNwnuqgzvd1Qdsk4
 M+qstpSSCyiRzoE/9aWm89TkRkk92hw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280083
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
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

On 10/28/2026 12:15 PM, Yonggang Luo wrote:
> scsi-hd and scsi-cd added the s390x loadparm property from class_init
> when target_s390x() was true. Register a second type for each name
> that always adds loadparm, and select the two with target_s390x() and
> target_not_s390x().
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  hw/scsi/scsi-disk.c | 43 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 10 deletions(-)
> 

Looks good to me overall, let's just keep the !s390 as a local callback
here.

Regards,
Pierrick

