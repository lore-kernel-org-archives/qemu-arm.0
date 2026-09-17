Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565D1C88E72
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 22:14:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7KMr-0004u3-20; Thu, 17 Sep 2026 18:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7KMl-0004su-Ay
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 18:14:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7KMj-00079R-1c
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 18:14:03 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68HLuQ182390179
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 22:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3TyzcUYyeyW34xSerpbdL7SQrBgiceMJZuu2otGUeJc=; b=UVK6b6jPgx862SFF
 YF5XRPlFnGbvGkPicoNMoeu69Qj9JoyLVsrSl6LN5J07TKdjwcol0RGDAB0FcZBD
 KivdMzD9jQ96MJLa6siMf7MNtBZpW7xrij/JMA2vgLR5r9fbIu4cF5mCD7u9JEXe
 OVJhAgC+ztkAbL/spJZTs8RMTm9+5CeVk++qY5Z7R6G1yX0mtbxN/tDM5lUBGKgx
 dPpu2TBoE+12DdPi2OH8kmDzf7mYIm/QnChrNJ/OINbNpbsqwdnZFh2SliW+moPA
 c/ZYQ1PAv9BuQ+RoYsJRzOkMNTIN+LQQ/6kK6XV+mdqKQdumPDXBKx27HLJBupox
 +iC17g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdr23g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 22:13:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2dd753a52bbso2591345ad.0
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 15:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789683238; x=1790288038; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3TyzcUYyeyW34xSerpbdL7SQrBgiceMJZuu2otGUeJc=;
 b=dWXebd1xan2eGdhZBGJmhl4flMoL0kJ976iIjAfuMWxVOXQ9A7FA7JztmyKtJpa9Ve
 68Rr1EPgECF6L+2ZmzjHTe3L1mOV9T3PA6Ca9qTNeXWT27VOtGrUzZJlmp6XUF8oXuPw
 lotM+EsZngSyaUuKubTA46Vosivo6swBYytWy2zyhXModlb631ZXXqv1NmmFPufp1Z/N
 ig4kU95LvBd11lfmSRbgcURAwGJeHQ8TBPsZQou9h6gPX7ZVVrfR19EQmsoH+iiRR4nZ
 7YO8dChKgINvUwgbRHsRlChkZzgDtvizx0zePxjU9BWuutBpzFGjc/bXcksbrZAvs8qZ
 KP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789683238; x=1790288038;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3TyzcUYyeyW34xSerpbdL7SQrBgiceMJZuu2otGUeJc=;
 b=VpB+TNBFW9qLkkq8UEjxi8yo38ZTySk2C/TNfrWisY/zKOy8yF+T47Dalf4DxxRXnp
 3l0K54pZ4wOfsjjhO9ha3ijs/kxW6QYriMI+d8eJFPrYUdmDH6svi6Qckq60za0O4vLm
 i9yiEj3LB8TfWzeFWRZ7loFP7TvM92RDxN6zejuEE6oKY4K0Tnn2fLKPyG7wXnuB7vqw
 RjVXfWyezDRWvX03TDIfdxdpo3WpD58/MfrHb24f8u3WYl/97wopUz1iCytg1AvHFELq
 srcp4mufWajssGuA2ANPdIZVCpjhUiIH05w5jWmDCxjAXHpltP7jIuwDvt++HEmeb94N
 HGdg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzy9rkR0dE/WLU8wAXZXXkqt7fhEiUXDvydmMgddT7CW2qSJBEG0ukRkD7rd046jiLip7GZ/lQ4Vg==@nongnu.org
X-Gm-Message-State: AFuF++mwgyyK6E+J3yFGqEFOmeYC8XnmUuXek370m4zN/vy1GBArtzoy
 7w3xU3dEYJrAqS8DyVXLxqXdN7ywJOy7OhzgiB1a/Gn7r3YmeGP52ZtgRd7G2nZi2goaGG4mz+8
 G+eQblN4rPIB2TnFdkIKESRF3BGPn6qHyg/ZrS9JVyFBs+xuFbAs872I=
X-Gm-Gg: AYBFou3WKLlfHhcfl4JcEBHeWVvO03UcGmbhfQisCeBNrAz+AHailqmMSQSlm9wvJLA
 ZnlI+Vl5O+hpjgXSZ6gSLbOdSyfe735UrtkxYvTQE/uHOjRkQxiBLoKfuEVQMw8OV5ogOEpPcXg
 BkP65Zcrc5+doMk7/55+uK13GvdFAqArmPrlntpMmQd8jsddXwDGqmmHCjePIGTC92tkd4HIo+a
 a588QMjJbkYIzaUn88gfeXjiOl+uowkAnJukfygOhuP/90m0/I39GLYJiR2bHg7yDUY/L+0zJ6B
 uOCC4UH70LK3rPl1ax27teo+vHbM7i496May4E1SeeFlWbwdMHopRbkavV8odP5AgIZ9iycFoXk
 6D4tbezD5yJriG5qvZkFzrV9JkOL4psDuHt2Yx/LDFOTXtyP6IdAQEMLei1+T8Rg8u1ij
X-Received: by 2002:a17:903:2f0f:b0:2dd:88b4:6920 with SMTP id
 d9443c01a7336-2ddb1b9818dmr10988055ad.22.1789683238483; 
 Thu, 17 Sep 2026 15:13:58 -0700 (PDT)
X-Received: by 2002:a17:903:2f0f:b0:2dd:88b4:6920 with SMTP id
 d9443c01a7336-2ddb1b9818dmr10987605ad.22.1789683238105; 
 Thu, 17 Sep 2026 15:13:58 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5af6593sm17388659eec.25.2026.09.17.15.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 15:13:57 -0700 (PDT)
Message-ID: <792f28b5-57c1-4947-bed2-0216517b0989@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:13:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/17] testing: various docker clean-ups post meson tcg
 conversion (pre-PR)
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Matthew Rosato
 <mjrosato@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, Brad Smith <brad@comstyle.com>,
 Kyle Evans <kevans@freebsd.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260917165602.3405537-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMxOSBTYWx0ZWRfX8B7VfaP6NRkD
 9OCgz0UXprJEecm1JOuPz59HdfX6NO4cFumfIwOaMbn5BKfUxs02m/ZCc5PnH2KY9ro9ET7cbfc
 p/+mNXhktpLUySFUMSXhYM0Nfa6zpb8PH9EWCPv/8U4n/+vUw85zZeW8aXX4AJ7q6wF0Hy/z37o
 TF2uMVzvuervEDjOm8WZRMFT+zFlyJcM4MdJodi9bqWh4IRvJFnzeuPQNyJlSt6AteF3jNcmUJm
 jxKgte7MPI1rKQdK5TV73zJM++IZIvgIKHev42L0xQolT01bsmQKTAoQqnwVFP1KXJd/Tlfeb4+
 0FPBSK142M0TxVxTkW6NA4BaaMvP9wI9Yui/uPS8VqnXJyHvL6I7cN8BrtEiOYOVQNPapESaOlB
 mAXEhFJGlBTaCK/PO1pGiexzEwKOPV7ELnsiqaERiNAus1NiuwrTdDqhZ0jqvQNypD26ILR7Ku4
 UvwbYQljR4kgzmKGjxA==
X-Proofpoint-ORIG-GUID: H7BmhJW3sbrGZ9AioRMWLJuNBSCq39Dx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMxOSBTYWx0ZWRfX+GYKFjdUEsbq
 DQOPL2LDDcDZ/W85lkmJh2OKeoUY3kvNKkHqxkBvm2SSpwZVwM+a0SrNUR9raHxGP9JqAYkK/DM
 rWCv1Cxyb+2BxbdV/lYUxn7ntV9bFwU=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aac6627 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jza3IugBXPv0DvMHRPAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: H7BmhJW3sbrGZ9AioRMWLJuNBSCq39Dx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170319
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

On 9/17/2026 9:55 AM, Alex Bennée wrote:
> This cleans up a few bits and pieces although doesn't totally solve
> the issue of an apparent stall while meson builds the docker image.
> However with these changes there should be no difference between the
> meson build and the equivalent "make docker-image-foo" invocation.
> 
> We also finally get rid of the ill-advised magic caching support in
> docker.py.
> 

In addition to current series, please find here additional fixes,
notably for John's issue on Fedora:
https://lore.kernel.org/qemu-devel/20260917221117.274619-2-pierrick.bouvier@oss.qualcomm.com/T/#

It can be directly applied on top of current series.

Regards,
Pierrick

