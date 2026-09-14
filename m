Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9354C88E67
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 05:22:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5z8c-0006qj-41; Mon, 14 Sep 2026 01:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x5z8a-0006pw-I7
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 01:21:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x5z8Y-0000w5-Vk
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 01:21:52 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68E2eJuL151549
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 05:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +KiUk0BsDUijxIsBMhNetXzo/kPDi1AenBAtUcgB4ic=; b=ClhWRsA3U4VQqr5v
 2jS+g54+7XSqh1sSHKZ4IZlYQ5LYhVJ3JyhaNNN3x+e+DEISQbl1BgyzV3q5JC0h
 Iyn1kkIQCrR/WuPmm/OzItmt1KpZVUbIzQnobm6z8d2+8auGLYtZDBBU8I4+vGba
 YgXZ9J1g/Hqbz0KH3T/+zJG9FhBfizA6XOZ+1HEa3aO9Qvg4aYKezEGjG+alsDNq
 nHLJwDKvNyE+Nw5U9ODdmma906mP8MUyfRD7cu3x1QNd+/3bZ48FsEIagN9RBq3a
 alVPgQcA9n/IL1UKn1Djl35tcO7YYZ50BPhiKqNsKxhr6SB1d8HDf5M9qvSQM0s4
 /ZCFGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k08ygh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 05:21:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-395543dc382so3889600a91.0
 for <qemu-arm@nongnu.org>; Sun, 13 Sep 2026 22:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789363309; x=1789968109; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+KiUk0BsDUijxIsBMhNetXzo/kPDi1AenBAtUcgB4ic=;
 b=dn3dJWawj+JU45cBdTmHvuYQZRgAikLuUKPfPt3e99Gqg8CD5Iry5rNoV7vunHmWUW
 G9gVWE6zhC7W4ILvPciShcueMunTHn8+WyckqCo1R1mwGUZc1vHY5PjT3dHMwUWGaxzJ
 V064XbVMo0fF2QdU8TKslehBwTsfgH1n2B2cUNLIq5NrOFdu5fB7Jbr2lYFgeNvCaZTL
 nH0kdcbOGA6nIOCqVP1ZaXjtW+WH5OwAO5zkKRJs3iIcf9vnt7YYRiKPZVFwPwSwK7rj
 pPPJxxh7hQ3mdx6yrno3aBXf+DcE/eoOFo8EGBWwaTosIfl4h1w2SwxoZdmsLOHSRv5B
 ofYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789363309; x=1789968109;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+KiUk0BsDUijxIsBMhNetXzo/kPDi1AenBAtUcgB4ic=;
 b=OiZqbftIV2ybMRLuU1oR263w7Glj9q5BhNlPaxCzcMpprxmZ5fdanXR5k+EgZJiXSy
 pFhzsn9lsIH5P81JbUaV5/2fvmG4XdmKTuB83JEF6oe+/DAOxUq7Ydz1ShD2wPoAnpJ2
 HX1br/L6o6v+1mDOO/EkrMdkFxWYmKvyMLKNpeKERPQkP2srtof3skSTfEhXSYJiqZPN
 SXbtHoRCLqCHzAdY35VQ0U/8aEnHTcGEw0Wr7sLPkf12vEvI4Pddnd+AhNW1P4WFi1yx
 ChKvs/3I7LVT5fx2WN0nwS6O7qqNu/F1qJcm+oi8uw7tfU/TW0KOEPj/3Kw4qCo35AZp
 uIGw==
X-Forwarded-Encrypted: i=1;
 AKwUvByADEgRNcQfQAzwVdUXO4OXOkw7lkXv+nD/hCwZXxgqr2KVo/LOwD/Cmdo4cVRaK5W1Vi7rJAX2RQ==@nongnu.org
X-Gm-Message-State: AFuF++k6yoSpiKXMdhH5TktMCnsP+v97NqVd8p3a7vatQ+F/HHbsYJQ9
 3oXQ7rPNrSf5Co33aYXAx/Yucv7dsI8FC3Zy84Y6mKT5A++u4BS8F02sI2F8ALK8xNBgcvIEdB+
 CC8ifD7KO46TwETKCFYhHWEe/pJHCo5GuS8PYguxDvkSFiP1nbgPws+c=
X-Gm-Gg: AYBFou0ez5tDi/3qvHxuQQvypgvb7NXW9u8ffhrWq2WCU2vmOj/70sKglKbO2R7Ie37
 7T2xAuz7bkLDVpX6k3LuTUW20XtUi41yU9o8DAXl88+/leK8uen0Dbo0cY6mh54WQfpFr+ESlbS
 6QqF6fZ4o0Y/Pf0wJgoCH/UQpw8jqeza41c8dIOIQX5XLKKvoirJdVeXlG0jBhpWNwfBggzR+mW
 WUBhL+gx6mcFyNAhJBNwKK/4dJdwWbDGfkl6XVk4l88wh2EF6Xqpyy2tg1iYHGYCoaW0+r40PFc
 lkg92ftOY3bs4fWHipjrKByor8OaRiovkMOo2GOS643BHn6NGMdNf9U6RNtjb4gzDyEMhhDZJ46
 sew58T6W/6r1I6fVvr/tXZ/0dCK9QmpKqFjgWwZPrpTVktswDboNZS/o=
X-Received: by 2002:a17:90b:3ecd:b0:39d:ba21:fd90 with SMTP id
 98e67ed59e1d1-39dec04f01emr2031244a91.16.1789363308665; 
 Sun, 13 Sep 2026 22:21:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3ecd:b0:39d:ba21:fd90 with SMTP id
 98e67ed59e1d1-39dec04f01emr2031196a91.16.1789363308226; 
 Sun, 13 Sep 2026 22:21:48 -0700 (PDT)
Received: from [192.168.1.169] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39d9afb1900sm5458621a91.0.2026.09.13.22.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2026 22:21:47 -0700 (PDT)
Message-ID: <16aef246-b1b6-402b-b0ea-1f75541aedcb@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 22:21:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] tests/docker: remove used _read_qemu_dockerfile
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Brian Cain <brian.cain@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20260910181504.1010916-1-alex.bennee@linaro.org>
 <20260910181504.1010916-7-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260910181504.1010916-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA3MyBTYWx0ZWRfX7Ngvnf5qaicY
 Y9RyWCNrU9GDKqys6chEeEIBEui1N4b18be6w+UAD8tvI0dB21WF1BS//rrz8hP8oXiTHHiEv2o
 hfm5jr6bvxyqNkCxmz43pMobZnjRXXM=
X-Proofpoint-GUID: n9U4oySc2KjVrWIRm3DQA2sCikUrqEZB
X-Proofpoint-ORIG-GUID: n9U4oySc2KjVrWIRm3DQA2sCikUrqEZB
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7846d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3VFnEwZfmNiA6ypndboA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA3MyBTYWx0ZWRfX6AbqC29KXDlL
 QvGj9Iw+t2c4SPKJZwbqHSUfz1Wa47RjqyqN28MMCft/Y6QQ6mo3tiyRfyb5Dri+GaNZcsEcRPE
 f8CJabEFL8JNzRJnnQdcjfrjCOXhzi6h8+a0psiRIXL8LfiVrx43W6OQIURVPqKurB9n6d1T578
 x+i5I4XdqI+ni5gSsC95KlZOm/t/2MHhL6eJSFqJB5cpxVfnzeatHbb0FTrz4p0thic6ZDyE9xA
 Cib5WEsNTPsFiGBMw8Gm/Z6ARXmSE/Ww17MsYh8KBRl2Wj1HbdCKKZpAH5qvP0CLDF75KMWYece
 xdhqWMNXh5O45jJZBNDah0oJONcKRHxwgWCyoivprtOf3QXzsQQw6uk83uKmTr2BUvYcX6NDLJ/
 j5LPmI746YsLzGuA7ueDAUkCX6adU1tnoApHxmTm36Kw+NoYQJxWIzwY7meQNQmapsYqq4C+nqg
 SIdy1T+qakL0UK/EW4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140073
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/10/26 11:15 AM, Alex Bennée wrote:
> This is no longer needed since the functionality using it was removed.
> 
> Fixes: 07056db1b50 (tests/docker: remove FROM qemu/ support from docker.py)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/docker.py | 10 ----------
>   1 file changed, 10 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

