Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C42CA9EBE
	for <qemu-arm@archiver.kernel.org>; Fri,  9 Oct 2026 21:59:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFIcH-0007BY-Hm; Fri, 09 Oct 2026 17:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xFIcE-0007BD-6H
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 17:58:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xFIcC-0006NZ-GE
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 17:58:57 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 699KhVja1417471
 for <qemu-arm@nongnu.org>; Fri, 9 Oct 2026 21:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S9ZePIPCHQPP0Hlpo5PmoQBgXZ9ndzr7/twaEce3jBk=; b=mFlm4scXDkwCi18G
 Sn3I6DcNx0zzqfY4WFAO0RtmmTlclThJ7moLJZ18h3ebUbnszUuRQVOjpo5yoTLr
 wzoOSKis1d6a1GlrUTjaR4Vv5OBjzp95tiZi3Zs0GXQl5b4ycV9b2vI0pPTdCSmO
 5DGuL/ZqoFhsgmjLOUIXru99W//B1iyb8lD0nnXNtH/j4pUeQ82Pub6uuVXAWiOy
 3kyPY+uUI+nCfP9k9Ww7CYrecAhCwE3LTsg6YAeAZzyJJvQI/VJD6+Zivfm/BNvf
 Ee8Q4bDzqkSMomiXFnMXc+XWTvvYwDcNX1NfJaQer9OZ9kU/R6z7enpcY9zevqpQ
 dMsgJw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t88vpc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2026 21:58:54 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1383723dfddso245182c88.0
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2026 14:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791583134; x=1792187934; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S9ZePIPCHQPP0Hlpo5PmoQBgXZ9ndzr7/twaEce3jBk=;
 b=VfPila43Zr0WDjuVrxSlkvC8o9wLQ0Riy42nG8ohuG8HvIqYXjRLZ3EIjivPwF8GYY
 lXH9MqfiRI57BDcvblQ2b8TNizITuCPOY+b8UnyUL5oEzs1pWUTy7huaetMvuRDT495X
 56xLrwjl5c2rk3GLDliVEh9AyDH/96X6sOHU0efuht6qHsJO3fGRZXe+QvKNmkjHPep9
 vaOSqSf5PJiL0ZFc0DwpGUjcsoWQ6rMKU8LjxBWg9ct34KDazztTzqcmcxcqMa8Q2caQ
 fDLt4lyMx+kOBruC2JLBnZi/NfNxRp3lCDBZcbJrNOM+RgYI/PGF4GgjOqNjciLWHdhH
 YPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791583134; x=1792187934;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S9ZePIPCHQPP0Hlpo5PmoQBgXZ9ndzr7/twaEce3jBk=;
 b=g0haKvAYbKdY69JeAiI26ykdnlusngxk9yii04l0Cgi/MwLwhl/AYs9T64lx6YHftV
 uB+++YKKWJ6KZO94FCFs4mWQtozBZH2o+xw6Zt/dLsiYj51BA1r6JyTeSpqVwxubUs0O
 fzuban5lNCKXrCk38SNc1C4SVm9tAMTxQIr5OVBAJFgnGS7dhsCrl2SlStRkh+uEAfTp
 DhGHPwMymPTOZs7A9qYSh+6yrteMlEYQg3eaMpdq3paXru0ZRwlLJE4PIa9L2N3pY6ny
 vxoALOUoPPaFyb15JGWAGuNDIGV0XlCtmWlL74TWw7MAAj2wN9eugAPU6KXv/oahT6v+
 IJOg==
X-Forwarded-Encrypted: i=1;
 AKwUvByIegdlqInVKYkE2cAgL93DNedBK55HuXmSf2q6XyiAyiWMAH1E/PJx93pQMsRrmqcqAKks+0EBkA==@nongnu.org
X-Gm-Message-State: AFq9FYKoLjuQ09kEj5t0rWmUYzBzowPbjdy9Q87KnhDozwPJmlbjpN+y
 MHvqatILKFU3rB9GzGReaxZYP3xOSBoTRbC3PN2rCZLSYcKELTEm66Q0A4+MGn9yUBD3li6YhCr
 8jV8gvTb1B9qBXVGMeaFANyAdgy4nxsjPO3MyaEtK5VQgehQUGJYfL48=
X-Gm-Gg: AYBFou1ssqFuceDb9VrNeAd/hrcRhCZLwHfQruGvVqmN5GY7MDMrR1Qcqkly7dn1jkT
 PFPXOsLdAB/uQhJTqG8IBb18SybuR3BdFbMtfrsYAHyiXibIWVnTbt/T5ogSK6Ho6z4MiOCso6q
 Av1bMyaC5Ihy5WAO4eyEaIv8+uLX7jGvKX8b0DuzBvyWAdpClMZJEUp6DmBnalE2UvndJtrbYsc
 qi0CbpV2QirCAFHML+ZTwZOA/HPVbJKprMSZ02GlTYruYfgMFzyIIU+nFOG3Ep4ZtDF0iuzwfOq
 VOozYgKipgGMDqeMTA8khjnl1MSlnbNdyW0GMhHaqett5eua2CILMYIqEjUwY2uxkKV4i4emSyS
 6GzPYw5BvGUHSGeI+U/a4t4qjmCY8NNZxIvrSo1EXa0R9F37dYgxzHNZglrlD89SWqHfjqw==
X-Received: by 2002:a05:7022:5f14:b0:143:2973:3240 with SMTP id
 a92af1059eb24-16a61d5bd77mr3297458c88.29.1791583133778; 
 Fri, 09 Oct 2026 14:58:53 -0700 (PDT)
X-Received: by 2002:a05:7022:5f14:b0:143:2973:3240 with SMTP id
 a92af1059eb24-16a61d5bd77mr3297430c88.29.1791583133137; 
 Fri, 09 Oct 2026 14:58:53 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a1becefdsm8255218c88.7.2026.10.09.14.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 14:58:52 -0700 (PDT)
Message-ID: <9ee6fad5-4117-42f2-95da-818d5b4e0aa9@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 14:58:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] qom: pass TargetInfo to the is_available callback
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <3631c54a-5ad7-4037-a21b-37c3c61d712d@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3631c54a-5ad7-4037-a21b-37c3c61d712d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tgcSfXFLuKh9BUaQOZiKOG_jvtWmnzCT
X-Proofpoint-GUID: tgcSfXFLuKh9BUaQOZiKOG_jvtWmnzCT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA4NyBTYWx0ZWRfX4Dx3v1aGwd9T
 MpFPiBFdZBfp4c0rTQDzYUmvmDM0nfyYFY1s/h4zdgUSxiEYwht3Nj3n3asEh8KPZL1Tpmr5f4q
 itKBXL2QzHebn25OrTh8J5jI6igX5Y8=
X-Authority-Analysis: v=2.4 cv=JuNkP84C c=1 sm=1 tr=0 ts=6ac9639e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=fikX_qdtNkxtpiNuNakA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA4NyBTYWx0ZWRfX3DGGf/9piU7z
 Va8vHZWvMzxnwog3t7xgienkbQb7FJZycu6UwbsqdX3oUjPHe0a/Yez3Bz+7znx3SPVxk30WWzx
 3PG+EOhXj3psGc2KG576hctipEVT3t7qm9qetRAEAStwWmQN1VlUk/NR5pXu+/M0UjSUhObquAp
 YcIffEYwGdESW42SFILIDQar7Q8Ct3vrAzB1XDP3zdLgLoxq6JgJzOlpNgB+WPBNR0xroG2LJbW
 PBCzdVY6BrsH+NpbIXR+TijYCUwwKFtPoSTZN++l0vW1AL4sUs1vdsEaunTaHZUi+u+Ep+uLzB/
 FcO5ApMohcvNxmanVWTMlGsKy/MbdpyoIo9fUhbpB+Obg/MSMkCgtnE4for8RlrJucxjpfLbfHC
 LnhmZHWu1Nd1YsbraLdRCft/27tlvuQ0auaYqYLzOgGZ0ad8pqQL5Bn+nNvY8MHiFb/ywZSXR9n
 iNULxdFmHZgLNjNmArQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090087
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 10/7/2026 1:46 PM, Pierrick Bouvier wrote:
> 
> I'll pull the first three patches.
>

Now merged upstream (40ba85501c0b6ac2a7319d3804dab072edf67564)

Thanks,
Pierrick

