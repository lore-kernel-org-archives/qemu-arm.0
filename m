Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD992C88E67
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 05:15:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5z2T-0005MG-FV; Mon, 14 Sep 2026 01:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x5z2H-0005L6-Mj
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 01:15:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x5z2D-00081r-Kw
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 01:15:20 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68E2ebEx4040727
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 05:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dNkk3tQAfDfj4nTzI5OvmqgqCT0Kjr+UKCtPL2FlYaI=; b=X+1aXmVSQrSjyvGH
 utOVeYqhA62o5H8PT0gyesGKMhtP+pp3D9IpEYCJ4yHDHITX/cqLz2n5XGq4mBOL
 de8qH8ryHcc8lCf6xCrw2CaCEwVygUbZwlzVRkcSEMJ1x8SRJ9tpDW801NU6oo+2
 5fhg+At0bC+pBsTp2QJMQsrLzP02Pcc5jgfLNOFWfpL5EZWA9NGgUTmgbO/k137o
 JlGYthFoe1u5PIqDqGx30kGDorD3oSF97kQzkWzoEuFG1lv+tNVyS/jTGnjBoqDJ
 ECNWVbnN9BxHqvMDm830k38HkhnMIQBb3Qq/73qGSum6uYUEWkR2ttuT29o8lnXK
 dRW+SA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dn4y0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 05:15:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-39b6416441eso5696175a91.1
 for <qemu-arm@nongnu.org>; Sun, 13 Sep 2026 22:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789362914; x=1789967714; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dNkk3tQAfDfj4nTzI5OvmqgqCT0Kjr+UKCtPL2FlYaI=;
 b=DKH08GrydvzXoBZz5NFaYKqzGJpefn3PubqgDf+Qkfs6TN/OuoA+yiNfVrB2p7rKlQ
 tMSjjx8YzuwQXRzV8WSUtTXxjOK+l0L0bjxLpSlDCV5aWkHnyGlxK0x3tSsy88ZeIR2r
 C+uJLKCNSvcY50Cui5HefXsRws2q+uWhbClULRMwe7eklTmXWi/UpUqCZYXYnrtei7+9
 Wxf8Krl87SWkG58v0Q2hQlI4DnJwv/jMvmEQbB2Dk8eZpA294T0pJ1OUlB5cnO85DcXG
 D313l/KY40yieiwOkA4wyWBl86P3AMYKzw5oVy57y8s1e0qNyNWSSTfKZUsfy0WdAi9C
 y2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789362914; x=1789967714;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dNkk3tQAfDfj4nTzI5OvmqgqCT0Kjr+UKCtPL2FlYaI=;
 b=fpRdMaGiW+teYFo83a/lnhj6E3NIjIK2pdq5PzB3ZVRKyrgm+rEBmtelx74UAEywZP
 8bOs4q3B2wSIVqopw49Ik3Bjd+HZD7K+9yxrjh0ScoEAEtvjxxq/fBaceEG/nZHX+alZ
 0KdX7/RRaDQ50cHebXh+btBjAyZ8IsHddhIq4IQtTQIa44M0F06wQqEkkuiEptuPtOjc
 iuWLMxeMh52HIvq+rt+Cxamgl1qAVF2ew7sscakSzB7BTN/Uu5A/RTQD2az9liekfuYS
 NCARDp9puOMNLBdu8wlBLdXU9Dbav1wk7PbDP6ZVY2dCEU7Ox0c7emqSQQLCyVXXIOwS
 ApOw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxCVDUgwmCI6mEX3xaIT00Sn6hMCS5Lo+QQRUP3e1cg5ipFnGIQctZyfjbVH9z+d4JrGZY/zwTD3w==@nongnu.org
X-Gm-Message-State: AFuF++lu12oLSAx45ebwO4p3Oz1nsbNz5cHeuvR5D5T/icfikzdKDg/Y
 w/SHbsusoRV7z/lsTVMtCouyerEqGutlPdYvOOfhQwjb/LM2sqAtvxDQYjFZ0Kt+O1QHWbFyf23
 pF5twNDI1cvCChKOboey+E6nyrwGfACxbC6WjBe6HJ6QSvKOYo109Vhw=
X-Gm-Gg: AYBFou26LjrgL2qAvNT+7TuYXGsyqjYU5QElFUnUSGL1i5QdnveI8fD/wlUxx89KxBj
 1D+c0ePMQB2eM1ESkDdg/y+a3cBG2Ul8mfZmCbr9zxBFR/K8noejtfUYVb76JgUpl/rNzWbCkMP
 YDH7aznMppUrg0zROOH8QRXidZgb536o6JyE2mxW+Wx1oV39Rn+Nc4ZzRN+UmZUY47rIR9xMXkK
 w5Bqj9ccmwfmxQ5E+dtDngRhXQUJeDtNg7Wwwccau88wAM1gDvKAoJaFd2AaSR0GwPhQXQfz3RI
 drL0e1peIczxErfBLhcH7N0rXFkLVyCFT7ioWXvx4p5By8NaZ1tSWeuqSAW53rpmivCBQAIfTnb
 m+Q8O/eeHoBiFG69jLfvPouoNh33Ep8XILSQFEmhcwetFuS2hM4pPz2Y=
X-Received: by 2002:a17:90b:3e4f:b0:39d:84af:a0a8 with SMTP id
 98e67ed59e1d1-39dec0f7cadmr2517442a91.25.1789362914011; 
 Sun, 13 Sep 2026 22:15:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3e4f:b0:39d:84af:a0a8 with SMTP id
 98e67ed59e1d1-39dec0f7cadmr2517386a91.25.1789362913616; 
 Sun, 13 Sep 2026 22:15:13 -0700 (PDT)
Received: from [192.168.1.169] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39d994d8af1sm19815095a91.11.2026.09.13.22.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2026 22:15:12 -0700 (PDT)
Message-ID: <78b4bda8-02cc-40b3-b9aa-137069a54811@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 22:15:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] tests/tcg: use --add-current-user when building
 containers
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
 <20260910181504.1010916-5-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260910181504.1010916-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6474oHLABqPc3mXF2GI3qOdTP6EIHIbf
X-Proofpoint-ORIG-GUID: 6474oHLABqPc3mXF2GI3qOdTP6EIHIbf
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa782e2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=6MO-9ogwpX_7n3OspGEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA3MSBTYWx0ZWRfX2Xb6wsr6jzT1
 j6xup3ovYkrWUWzDeDJVnhToOfZolg+YpQsPrs16ltLr+yleU+WjYPJ9V+TTuwoaXjChBePYDnq
 8dzjO1VwLbJmsRgZQ8+6zDWacVAuMNY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA3MSBTYWx0ZWRfX88mWiIwBYlni
 4spLzOydahQ1BvxUrpjL2xGTofzmYfc3Tk6+DMTnPaJmrYeL4LGnhvVZi1ykUxMao5tT8UAbLCS
 CFu1GkX0JoznC7etUExnpjWQU9TeOiRqjO52bWxDdHysLmH0fD6yDdUjzWD86N9Kuj9OMrLSUwF
 hE+6f9Mlv3Hk1xbJpqYJf3S0Gp5ApV3Sgrtk33PGKQwwEn8TtatRBheArfNsoNUf+OjJJIQRL0G
 c4kxEfjLDfl2i4GMLYInhkEXMrk4GPlS58XGz/gxZ5vG9gBO2aqkeY5jmTxVT1jMwlREi2btPXy
 pZ00t6L8sgINs5PlNkVmRBs4BEKwYlsTEVKADcjinr8wAb+Zq3qOvLHQ/rbCk+ubtR5Qo1nh9ne
 Cl1wRrEq5NrsuUvFCD6uJWQerWpxlA4gn07mLZ9yMf5edqgVck1CBMzb47jvOvz4LE08laZUwWN
 oKBM2JkwFPGM7LVBzEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140071
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/10/26 11:14 AM, Alex Bennée wrote:
> As the meson tcg build routes the container builds through docker.py
> we can also clean up its hack which involved appending a RUN line to
> the dockerfile. All the dockerfiles that care will work with the
> --build-arg.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/docker.py | 13 ++++++-------
>   tests/tcg/meson.build  |  3 ++-
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 

I'm not sure why this was added in the first place.
Technically, running the container with a specific uid (whether or not a 
user is declared for it) is enough. The only errors you can have is if 
some specific commands ran expect to check if user exist on the machine, 
like sudo for instance.
For our need (cross compilation), it's not needed, as a compiler will 
never check who is $USER. Files written will still have the correct uid 
on host fs anyway.

Do you have more info on this?

Regards,
Pierrick

