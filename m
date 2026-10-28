Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39980606A31C
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJSDB7CU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ju4E67NQ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMAYK-0001z3-RT; Wed, 28 Oct 2026 16:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAYJ-0001y2-A8
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:47:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMAYG-0005JD-PX
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:47:19 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SIdUQ31920913
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AYMeulMkCmzs922Q+TBa/0IqF3dNps1kulv2tWpwqSo=; b=JJSDB7CUb91KFqlM
 CjHY9/GICUws1U+17MJdKjxNKt4mUgaBhthnZ8p+5lfc96SsJ+hU4oQxvevc0jNH
 ZYJjof1Scr1oYji6yMlk6R1J0eifhy50NCcSgeYhrjcHoBpP3LD4fXg5RmjFqWs9
 V+mGrlQ6jEhz8M/zJ8lsUkG6Y/pzzs6bO1saUzdtqxEuVrOvL52vT1/QHpz8c9T/
 8meoRE047+yGwZ4opJad1UJnMfRUTUN9WBcDRX5+OM/Iw9l2+weYtCNjj8BBliQx
 XXTcVXbk1b7iTprSWkWwuNHjtoniOb22Wwi/n/5FHGUMnghgIyqjJbCPCQPSSQDD
 /YFyjQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpre5w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 20:47:15 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1a2af4c8cbaso711301c88.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793220434; x=1793825234; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AYMeulMkCmzs922Q+TBa/0IqF3dNps1kulv2tWpwqSo=;
 b=ju4E67NQqgIR5AGdOvrXCdCMq+BdReTkZ/HpY+XT5DHHr8UyKrafj30ZBy58zVWITF
 Gh7tTdsMrDNga0nXYDu6k+agpcY05/yBpSpjwGEnEVal95dT25ApzRAgvW6YveNLHUxk
 oUzore1UkeQpI0Ted8tAS568mG3MeUHHM9M+7PfdOdiBdGpE2feCY7DYqVMINWHtlRL8
 on6s2ocpMNXyNUVSp0EpPWc/L5X56E6EHG6ETmZB17WSCJaOVkyxx9Ph8EQc9IbY/osG
 nYGYMXUhIjcEa50cfMjDnROUJolVILpJJ8fVA4FvUYLwn+XMUtqDDTC7r/rif9tFeat+
 QWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793220434; x=1793825234;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AYMeulMkCmzs922Q+TBa/0IqF3dNps1kulv2tWpwqSo=;
 b=pmyIaEcu0qyOUOtYVlDKRRKf6fPBQqDdg6DFepJCLThh0H0gyFyxzL+F7o1gvFNpg2
 WTiGPmgFXGiuh+1JRPwmk1yvxQmk4rmuyL+jqdMsp0u+28oThffhLVGyloCHsn3IDa+b
 mGWbVqJJlNAvnENEfUouTC321k2312f46cIpFMK4WYG07hSmRzrCmwylsl9Kqfp9n/kM
 aWLyH1tGeppBfsCdrC6857xlQJgAK0RWvOGuiHpGIaIMnIZeNchT4z63Mqq02uqDtFuM
 tLX8/lmaH4/Jg/Hvkcv2qnxdCHjt+hGbPk3L+3RBo4095+AXPX4kZTulA4HmWfR7xPFF
 JRMA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxcpO/wnZJcit0Oe1Goz3tRUJBc4STRagV3J9O3ro5n9yCQNlqcP97JJ0GNSrN0uaRoo9f2cnMl7w==@nongnu.org
X-Gm-Message-State: AFq9FYKH1G2BarqecSgCczrf1fh8tlFhKNsyKbphebumF67AV9+gw9oF
 J/iZDnE8y3BN4vA4TfyT9eGnVCBn/2+D92AhfRqg9Cw5yKCxz0zT4FOzsDrnuLmBWOAIqT319pS
 a2utYzNfS0mEshrTK2o1LWHJj6lrrrq/uKlRB5K6/XsD4qHQbWdxeNCU=
X-Gm-Gg: AYBFou0hPJ3HiL8/seOB2M+i8WNjztB567h3vDratpFz7fvaU6JwfLMWW5SjKva5eqV
 1FissztPZdC8Fz36JsH2pB1NZS1V3BtZ6NJFJg9z2H2Dy1fA3z97W+R7zeKyvDrBdWSDTBM7Z/i
 4UD23rBkB03lUvom6F9ejMuH1EVy7OcaoDyC9s2BDmmYvQSK3TLERW8zrIXekdY1Z+TLkFbu73x
 vc4X0CxMKWr9Q2epbPaUV24WJnE6lIFOAANXpBLpHOI7mYBRJ0+Oqc9clEwsVbpwwfzAPgJaopH
 nnbRZuch1pKN36uvQcGyrl57m6CX1ii93ofoRGBBIVL3JxzMvriawGGyeeURGFuRyGIkFHHGUEc
 lBKsBNq43+talihI0LpUUTjldPP/y8Rrs+/J4j1eNh5rZXlkZyX0rxH8fJhnep9wFr2t8Bi4TgS
 g264w5JSDEm+tCypXuJi2UC5cBmvSAljSjmMQ1e5c1AlI=
X-Received: by 2002:a05:701a:c945:b0:192:fd91:c569 with SMTP id
 a92af1059eb24-1a6ce01d383mr3885013c88.11.1793220434483; 
 Wed, 28 Oct 2026 13:47:14 -0700 (PDT)
X-Received: by 2002:a05:701a:c945:b0:192:fd91:c569 with SMTP id
 a92af1059eb24-1a6ce01d383mr3884972c88.11.1793220433718; 
 Wed, 28 Oct 2026 13:47:13 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1a75c814917sm8055903c88.5.2026.10.28.13.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 13:47:13 -0700 (PDT)
Message-ID: <1c0c84bd-d148-41eb-9085-6fc4f89f543f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:47:12 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] target-info: add target_loongarch()
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
 <20261028201557.2688-2-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028201557.2688-2-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX47vIITv7MPXP
 SB1757bg78uC3UtqEfPkJ1AI1CoG4RbA/jd8iWYhmkS+fGP1VsNv5y5qKu2MxjOgrN9wwezp4xM
 ImCR+hxPTRU6flZyuSiOClXfF/wOBMvfs3jFLckbQpKkRfRfcR+AqhOT3NnnygmReW4fzCIOgcI
 NWW13RmoeLeHu6HmFcwBONPCnnorbhzGXU1cIwYvGLS4I/GBfuNUckNN6sb0e9n6p9rIMvbwiSI
 4XzE75rqB0qH5ax6zwMs8pDG1q5uqpBsngqKD+Jh4R6kjnY4i8flGeCICJJsPyD2BjSejT++kON
 YUHs9iDeg2Ov1bo5gE+L+D/f+Jnr9z0f3SjAyq3vAZ+m30IoNcHtna8eHM/DLuOutkUqe5Mv9Dv
 Njn9pbqWMdC7DsInIclhjBIIptfptbfLQSWysMR1o1tyHrhcxazoR6N1WzMdv0VA6jNONCl3pyJ
 LaeiEQJLn0UMNPzGOBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX5g64O7uORDXG
 Jjc1Vjce5pzfIXpZtAJrl0xkAfpfZACpsYYT7MGJ8nKuDzyfRL0/P0RoyZesovmDe2iLhqaIZ4u
 z/dvVOHjpI7YFC/F+QKjRLmSosdK48Q=
X-Proofpoint-ORIG-GUID: bWzZ-s8Tzb0qFken71SvD1JXwTjRUzru
X-Proofpoint-GUID: bWzZ-s8Tzb0qFken71SvD1JXwTjRUzru
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae25f53 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CDSh6yXX78Sf7shxXIQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280082
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/2026 12:15 PM, Yonggang Luo wrote:
> Report whether the selected target architecture is LoongArch.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  include/qemu/target-info.h | 7 +++++++
>  target-info.c              | 5 +++++
>  2 files changed, 12 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

