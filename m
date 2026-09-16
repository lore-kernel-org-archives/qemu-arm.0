Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F6BC982C1
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 16:53:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6ssy-0002eb-P5; Wed, 16 Sep 2026 12:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6sss-0002WN-6m
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:53:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6ssq-00021l-0j
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:53:21 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GFeONF3709176
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bmsg9N0IAmFISpiINErCYaMzufanm7zRhFZFD1yArM8=; b=MEtatbTH2IAF5COP
 AoWWA0mmfJ+n1N0Y/uj/UEx53F9CJ1A1t7n0VZvsSoPxE25FWmoHyZ4RFQjKCPGw
 ahalxt7rs9pdRf7ZiFyZOKvOIA0ojYyvqMI/wBAK8xILqjcqxb1cv94jnh1H6g5X
 xYiVhXy+kUicdqmEVAd7oGKbJ74W18x1bq9BB/QaR495+TqFP7lnS+sbDSu9CycM
 RfwDxWSs24V3UVO6KDkk+9VoUfrjLYe3ar5AJitoUFf0enloLJ1wvGN9vooEYu82
 Hfq8jWd8cV7/8sUg9rRvM+awx1ZJLoTWn34Q+c7U224pLs8xZbW1FKXvXdpFoOVC
 +TPmNw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfm09w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:53:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-38f57e31b6eso5906643a91.1
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 09:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789577597; x=1790182397; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bmsg9N0IAmFISpiINErCYaMzufanm7zRhFZFD1yArM8=;
 b=drUH41woWn+ened/xGiLgeK/7bslmE4XYyTcJSJlhOuOdBLpqBOuR5eQHJvo7BwOeS
 VBpIaf1IJZ6PuRXbv56rvhTClPXWuoyjDk5o9h2vo4JRYLPiwrkcRJUTzv1uxcmrENm0
 iasiIG3fsZWsCwHqueF2PbFe1RXfyIfT4JPzVbpNkIaF39fGnH54rtNzHvEe4h4SPMh4
 Lg6QJyKvQFBGZ2AZ5yUmlSK6s3ZtPRtaDHkaWx52EwtAb/00Bomykzt5qxcxVp+x+wwP
 dQd3y+hE6w/tWezddP+nKW6Ndxvlo/ZWTGn9GMo6gDEm0ygPWOxIjEx9jjNQlmfThxXQ
 O/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789577597; x=1790182397;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bmsg9N0IAmFISpiINErCYaMzufanm7zRhFZFD1yArM8=;
 b=WLWFuWispnVCJWxSy6kTv32oE/jEPTkPKhiXq99gPzY2ST2UI26QQ/5Ke8P9gzgQCF
 FHpASXk0zvuVmvfcPQWivi151Xl/1WFRLKLzxNTsJvHWAyNEHXd3PZZVumMWp5htPbuE
 znYCF3iNyMBxHm6pE1cUFVMsI39mD5LwnRt9h6x2U/BnVT1TgmDtlKNDaYAoFRA6Pq9S
 qJ5FSpvG8QN6c7rHZCar6LmuegH9xP2wO59i957lpX5dkQ+2MO+V4XDuf4tcMAtUQaW+
 klEXLO4/grOONPPF2D2rUcETgDHzjirG9MYYXoII6i82+r41X6pscvsGcb5xH5oZ9RwF
 ffng==
X-Forwarded-Encrypted: i=1;
 AKwUvByX1DzUX3Z0OfoJwUA+8Ut2ZZJvcU/VoTun1tnfY92VcTZi6K+mH4m8Em19QuBnokaKDHsB/NTQ9A==@nongnu.org
X-Gm-Message-State: AFuF++nkVxr6oHEL1dwipJHFeThUiBorHPPCo6f881Ci+ilf32vIv4ZM
 R/ySPzm/2vHpB787PVkZPVEepXyYWv7lS4+YRyPLofjJ0QMbjmgpnOgaInfHApN5Rf21o8XCplp
 6DmTZGktH1LeanwX+cCiklZlL84/F0SUjAn2UHgriHdIDhiRX78iAMeo=
X-Gm-Gg: AYBFou0Zp/UEiZcuiaOg1/htZcCTxhbLeHJSerSEkrHD47GDjez/mRsm+zmtSOgmtfI
 hkPdC3+j0seiyavYYcBLMCcdqe++XSNv9XPnln6wbcXg3R1fM5J0OPJ2BYQplaEJbOVdhQ4g8cd
 6wzU4eQ2XOrSEAFNnxgcLGi8fgLVPB9WTWZLj5rTmumW1MisoFP17Jht4gzXxzLeSZcyeZewJzv
 8+C9GFfykf0IU/Clbp5IxqzV3XeZh9YytpWvvtFICiBl613eRkaaoBco7IJC7DMmZEgFsu3nSfD
 qUqCdFNRqIVNxKKaQUHknTV5fzi4BsSd1rNvjyuArNasHk+RR9CmRl6k6Q8LViE9MYLD8tx2uze
 7iBlTVh48bEHxwnA+7lHsXkQ24LzcR0yO2QotrFuWdF3ARO9FUZijJ22XwwQQayOi/Wps
X-Received: by 2002:a17:90b:2585:b0:39d:f351:8f0c with SMTP id
 98e67ed59e1d1-39e1e48b580mr7335842a91.13.1789577597077; 
 Wed, 16 Sep 2026 09:53:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2585:b0:39d:f351:8f0c with SMTP id
 98e67ed59e1d1-39e1e48b580mr7335762a91.13.1789577596570; 
 Wed, 16 Sep 2026 09:53:16 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14395bf6e8esm8510534c88.0.2026.09.16.09.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 09:53:15 -0700 (PDT)
Message-ID: <9611055f-1634-4303-92bf-b0f310888954@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:53:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/19] tests/tcg: add console property to docker image
 custom target
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@kernel.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Song Gao <gaosong@loongson.cn>,
 Kyle Evans <kevans@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Brad Smith <brad@comstyle.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260916153013.2134555-1-alex.bennee@linaro.org>
 <20260916153013.2134555-19-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916153013.2134555-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaac97e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xZ1q1ZhPBkdByaIqt5gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzMCBTYWx0ZWRfXx81j0aQEbjlh
 S+TaKtPl09Cr08Db69fHE5I6vmKUbQfXdn2wt6cKwD90bgC0FZH3QJB7OVhEwr+RWVDeNHeOrRZ
 SPR10YQ+2IcJqdavV4pk0+h9JThEVUceEcslD9jFaCNXlZQhjAm/P2NtthKkPkCAprOIQb6SpL0
 tr8PA4mg178jGpzDmdHq89rl1M9sGGsV5bYFMoBmVIgQrUbJE9GooU8ryAMAjs3mBvdiixODWcM
 DHclT+rFhKsMqtKvkxhrwg6uPeXC9EFXdMMv56MsAD77TYs82kRLyOUxHh6o0KYqyvj7Xt4j6HZ
 1gOie2W7cMoF8CFSU+ovSuMpaa87qpYp002gUexiuaf/cpLDwZ49akLxhs+nLFGQ58N30YMyMBt
 ES2vfFyF0VraGMM+RqrmnCFPZhbOFz8Fz8p/YkLBBRkJ+PEUV0E9PP/eVkSVFUKnmNd57T1TgDz
 kh30rO3WOMZNDLzvLqA==
X-Proofpoint-GUID: bD5Voya9VHTT5oz6Y8Nouikk3KyQ-ZRO
X-Proofpoint-ORIG-GUID: bD5Voya9VHTT5oz6Y8Nouikk3KyQ-ZRO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzMCBTYWx0ZWRfX224LONuO9Rvn
 4ah/ZedLYrSoOpsglWOK6LLOdBDFiBV7WIMaex6ac3gmCyfJtff9JSb3SaS83b1Tl0iQFmaBEco
 gp5lNxyVDBTVsqAT8lkzjN1td6i/L0I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160230
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

On 9/16/2026 8:30 AM, Alex Bennée wrote:
> According to the meson docs this serialises the target in a special
> "console" pool which also disables the buffering of stdout. This helps
> avoid the appearance of a massive stall when a docker image is built.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>



