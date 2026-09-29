Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1A0CA5FA5
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:15:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWjh-0007BS-4y; Tue, 29 Sep 2026 08:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWja-000756-GH
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:14:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWjY-0002eh-M4
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:14:58 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCEEaL931985
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p59NJOt4h6rQH7UZlYf95Pn6Hfc87EstH3PiRygGn/g=; b=mDBEg2NbYeAROLUg
 CZ3kAm0GGN0HlybNijDQUybrda+Jr0cnDjx5GR//ybE1IAiPaGx60loOaIhR0dfF
 ZQJUyTvVPTu8ZE0TrWvXRnZh3qIQTkhqKFSXv7/j21zF91tOSczilmdbHnqVDYaz
 yMj+aD9C7xBQYbuub+YxaXlx7rroSxZieWJpWGlOQxCN4HpRq3cIXVGftbk99hok
 BeqZpa2r2g3RA3+RIW4oY8+6SuRkfowm34ViUv3gLSWp5zgACBCLsVSmFbD1j3Jc
 87wfFddqntFokm8Dt2HY1uomN0XAHVz2L5oMFDI0heh7bnpn0dftX8/9ukkjPg/l
 9KGTvA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxhvuf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:14:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7b206156cc6so3434945137.1
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684095; x=1791288895; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=p59NJOt4h6rQH7UZlYf95Pn6Hfc87EstH3PiRygGn/g=;
 b=TOlSt6+XfzDipBOLJQ59K4SR9sGL9yLqCS/hz3DF4zMxk7rNO/G+JTbeDmvnbo4w8r
 atCqqHkOhwSGRQSq1GKBIydi3C7VZ62eFMJZNSzLUjKxgXmb3It8zeF5RctXaS3uxyGS
 pNzI/Ki/AKrkfxnv4VNKIKsalJ41F1/G8OC3j3R2Wtq1ie6F5jMsCQ7IGEiFULpwzPTD
 j89uqqgOKTKQWzsUhxWfRjBmSpmfcLtvllXO6M8ZSWvUU8UyPg3kbMC0yqwT18BStDqB
 4Eo9XHJljvlIvgiUuAmdwpH+1D+31AY3dq+/FBnasidSjbm8dDwGAsqlVS9jmkLlG+Kh
 0POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684095; x=1791288895;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=p59NJOt4h6rQH7UZlYf95Pn6Hfc87EstH3PiRygGn/g=;
 b=Fp3GncF7AVdrOHRrYdZ8JB9jS3ILcAlOTZbhKJCORR574Xwp2XxkzF2BDN7yxR46uB
 5AzpExET2EISq+unoBtEbJC2HY/ZrzskN7W/mKsvhwQo0DRXG+sm/ATGr6ANe9Bb9JXH
 /vZPwigtdnI6yWX6d2dQ/hZojWVqYNhH1UPFUXhkTjGw6lUujpZeJZJ7sbKH8Z8L/JMr
 ty7CkxYrzZ9uXSwc/VtsOOMyuh7XuoUbp/G3nQy8EP0hg4dVIcJvTE75F3id/sbcagHs
 23Yqtxo6FU5e6lirFgDB8zlSVezXfC2k0y1MJXGctinteMnSyYcNUOxBb10SkutwG8cD
 qq+g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxj9BYHcafJC8haUjVhADvsrEB2JvsnWST/PQnHN50lKCiyuWaDd6yGFjD/Ssz2jwACt21ssnc6iQ==@nongnu.org
X-Gm-Message-State: AFq9FYIUnUF8QkcmNAr++3buMvGsO9KXZJdHIp3GgX77gX3wzr+q6At+
 +JyZiGM0jMf1IiBq/8v50ICcnSbUemmJ6cTE9hPtWJWjvzEuIocXvKNg7Adl50dmsywTfFomGuH
 0EgLPQvMkA+DHP9KzzJKi63EDvX1wcZjuVWGF64KwatGsHxHGMrbrRC8=
X-Gm-Gg: AYBFou3v1ktjcuSIJ0w5otHiOrajMa0AN4EfDR02DXOXWC7zn1i28THWLvLCeOZjHzr
 y7lHxBaomjNpDrswq4fUDf0Rup5ja/+P/VoUXHrIdrn3Lz/nfC+NBSdYYtbD1N1ocLCYYCKKygm
 DwcEfy/N3a/tdXRHy7fzVd2ZK79ZTnc3XX3BSGd21WP+W+MvSuBOEZ7vJhL+IyTsDLLQt1GvvnC
 zH7hjidYVz98yaRMsORIcpb51iUtUfry64GcuG7Ghh6sbujGkUtfRSvT9A2xJ7I0fGonyjd5Low
 MBknNp2LcTu6xRsk0EaCVSqCsxuyYLRnJLM1zQVuAGRd8j+2MEamPvbdqCzoCH2jaH0I19Tg3nQ
 wGnfNwRy89K6xzyUgTA/gT3qY50UAsjGtXQ==
X-Received: by 2002:a05:6102:55d1:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7affef29fe5mr3462398137.8.1790684094980; 
 Tue, 29 Sep 2026 05:14:54 -0700 (PDT)
X-Received: by 2002:a05:6102:55d1:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7affef29fe5mr3462389137.8.1790684094412; 
 Tue, 29 Sep 2026 05:14:54 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00d47eeedsm30180655e9.3.2026.09.29.05.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:14:52 -0700 (PDT)
Message-ID: <3d90de54-5665-4a87-9fd9-a1488af2f493@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:14:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/42] tests/functional/arm: Add console test for
 `mcimx7d-sabre` machine
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-11-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-11-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfX4I23KTA/9xld
 7YVuxaQBPyQ/paBSjwhGjde/+sm2/mgMXVFj0saPeS7jUNOW7dDJ3q9zpl4p10AAbdoQTWQfvLx
 jbzuICeZ0pKWvZiecK/glL6w7/0GpkQ=
X-Proofpoint-GUID: Xx_FPR0QFPeKl19l0ng-qiUvfLi5SF8a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfXzS6hjZouziyN
 iNlheOFEjzjWXPQ5jmR451Zt8hqhKbPkg90/ihF7vJOm7LraeOHW1y9sy0SnjhPHFIJXh8/CV3G
 OvxqIA40FKsHma4kHU5CuQsH1wzK5Zqr48vKTrxb7oeiVnPgrOo1hF70oOdciGhGxOaor+L7rtT
 MLWRnaom4gaqpxGVwNBMkiYVEvecAS7ybu02ghmUNaIaKsofYi2pzq0KZrIjfpvlt8diWH2dWFj
 KfY48bTKeYkOgY1QHnYZeV6esr0rTGZE6fYmtDa2kwIsX1BEFiHFhlaOFXfBts3CJrHMQk3fDYe
 uomRi1njNWONVxPCDx/vFfqAmajwZGDTED2VpSNRiNVyRJk44kKzppG2LL0CgFNuFKPpqgIPdpJ
 MRpiqRw5HkznS3LDboJA78VpIEe9d4KsrzSoJQBDzLHPUA5kwtrZxR/fLwWe6xWNZ+G1Nide+tY
 1VIN/XH7WCSzsv7EEBA==
X-Proofpoint-ORIG-GUID: Xx_FPR0QFPeKl19l0ng-qiUvfLi5SF8a
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbabbf cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290048
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

On 21/9/26 23:46, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   MAINTAINERS                                |  1 +
>   tests/functional/arm/meson.build           |  1 +
>   tests/functional/arm/test_mcimx7d_sabre.py | 46 ++++++++++++++++++++++
>   3 files changed, 48 insertions(+)
>   create mode 100755 tests/functional/arm/test_mcimx7d_sabre.py

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

