Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92028CA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:26:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWuN-0006X3-2y; Tue, 29 Sep 2026 08:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWuL-0006V7-0p
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:26:05 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWuI-0004Bl-GQ
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:26:04 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCE6cY931782
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bvayp27AenJtn/jzWJtZmCPamXWuYGdKPUOK9U5A64I=; b=PlYzZ6dyTuYPD6B9
 ns2FGtkiaN5vlrIWzFhMVmQgDvuX/9u+LpZRCNEC+9dtRNEUhWDv5s7VghcD/hSt
 Qw+AGrP32DJVDsSgdtCvTQPJ3IdT3/SxgnjQsHBf+Lpllr6ESP+rN5kv6yMcX+zJ
 vIUy5tvX2H8uQKkw/S5Gkd2Uzt9B3oNZstUmrufEbLS6tMm/QQ3QUPEXXUaBFNFx
 8vOaP4bKwo9j57qktMl0NnjTuN2pY7/HqmIwsJ2wXyDCyzR+Hsa3NNG4jd1F9x9z
 uF8p2hpMVEKrCehJ7k0q3QLIqz6twryX4e9iMDFTvI1O6kSZiAoyDl2qj2BshqQh
 r9UzTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxhx1p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:26:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93a05d645acso886107085a.2
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684760; x=1791289560; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bvayp27AenJtn/jzWJtZmCPamXWuYGdKPUOK9U5A64I=;
 b=AlGqh2xzsnIevahh5M+3Jk7d0zTKnTZX8NRPpUiFiTh7GI9WxtpyOFpNDgZh8dLgas
 wgZb1dQ8K9kKpnv7f5lI5xUpMV5kIXg0zfVNuKE8/3dBBWXRBMxZ9RvDP1Ozhx5g0E0d
 vwjvIRt4HT9c6/YRKAQMQYPOUfpk7Fx9h2q1Q4j+7WFRdNb9qn1pax0bFKIYw3Ir7n7A
 PT9QFfm+xbGzUf1yhukVfxTppkkgopVdZhpEZd34ZvtSKQ2nsnGyUFiNzmhL2M+Fcmsl
 Iz9K+GibrtSqrA3qKUxgVXgDirLkF+TgIfj36qXpS2VBkk5VobuZewFV+V339IDDP9ND
 XV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684760; x=1791289560;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bvayp27AenJtn/jzWJtZmCPamXWuYGdKPUOK9U5A64I=;
 b=wOuNeElzYjHe/0fSqQdBcilxYkhTkPrWvg9fNcAo8pgr7XPehBZHaD6j0y7/O7WT3V
 fSo0fR6qhtneNtlKFfuX5WGyCYuiUJx+xz/yqImnAvHfo3KYUPNNHiMe1hWScl3URA5c
 iv1uHZcDhc0xpB1rGhobPw1X44uuSg+PFqp8Lywze9QBSbFLYZBQe/aMxiFfWL9kFGaq
 PLrXSYSs1O643Uj7n3eSVJGwhlvyXERWMY1WLPau8qbyG44hVwiJv4meeObzS6GQZqGp
 9nWzBzwpdYmqqhlPRK3I+hYzAy0qOQSwVTA7doo99ZOnDwnljj5vhEdTlP2DssvikGqv
 V4zg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzmk+JGLwGQqOmuN/EJDOfSrab9cJFQKpAX5qxb0b1bsGCFCUIjxpVZJjtGMFBNI1JPimDyvkHShQ==@nongnu.org
X-Gm-Message-State: AFuF++nTDOFVBvUK8RMz9z9m03vZ3O4CjzEe2xGvuodqUJjqVUtmziTR
 JH50Tq3DjIJSoXB5VBSBVjWPyUOzm4hwingchP12ixM1ibwvDyxhRS/iL0LajskciTMoT9hK/lT
 ov+X6JG19HoiHYFJSvoYJlpAg7iBfnVwO2jKEFOUyZk6uy5NftKfz2tE=
X-Gm-Gg: AYBFou1QRHT8W3J4lbgXs/cBoE7cX0CWjYXUxHtdU6iwgjrRb5AAy8T4x6CtiS+l+An
 liDMYOGDnjEoUikms0DReYCGIjEV0hJH4fhqc7Ldo10gw7wcs7ArloFCEuN6L1nIs0wVxEUM16K
 ynne+4aYffDLAAL2fYyLd/iuWUOBKnVmmCfQuXLzNJc2e84I78P6m7XZoRd5iShyBO2myONrm5/
 ATIx+Zse0VluH0+M2gJZrpC822Gram18MDqrvw/pKASSRXgNSYw/dKLyE8YZgJ+JPKfwfk9agdo
 DmuRuhBA/a+xx75gEFV0HhYINjagcbwQnPtAU9faPKIJ6yVTZM4iiyEbMjDv7o5fQkt62xqYquh
 PiAM6aF9kwKHCNtXd8cHt7ynbx7cj4E/DtQ==
X-Received: by 2002:a05:620a:470b:b0:93b:f402:a204 with SMTP id
 af79cd13be357-93c43cfca2emr2774302885a.51.1790684759645; 
 Tue, 29 Sep 2026 05:25:59 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93b:f402:a204 with SMTP id
 af79cd13be357-93c43cfca2emr2774297385a.51.1790684759107; 
 Tue, 29 Sep 2026 05:25:59 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af50a3c49sm3747284f8f.34.2026.09.29.05.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:25:58 -0700 (PDT)
Message-ID: <22a3e1af-b862-4f70-bb1f-9ff96f0bb0f1@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/42] hw/misc/imx6_src: Avoid casting from void *
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
 <20260921214710.29422-36-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-36-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX+GV7kQkqRGa7
 vJgzMgFFn+a7TaCONuNU5LZNRbSKRfFtcq/lPGc/l/ONjjFmIJGSx7YlQSac+xcBTglYsq+i3+f
 vZVPLCL1t87xmGl08+1udFAdk5NajJY=
X-Proofpoint-GUID: REVuQ6QIvgLJpEB5gVbHoo2j-ca8DUCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX1Rux0sfMTkg1
 hc0H2/vpu+swT1VAfTDyifjIUgz1OAeYLIyyQrvP83dpOXPI/UEEI2EdQnvUOVoFBSeU8mvbLCX
 sz0MsnC5b9mXxSndicVnLBGnQM/3vIDGQPSbPqPu9YXXI4kWCDt29TW8xSL8SoYQDXNrSlSt9oV
 7ZDW1tHiXnETxpbZmf57ATOgokAVIq4cxnBliWjnQ9y1RgfT9A9jSn7RkgVXo1HVCpjYOWTYCTG
 PF9id4etzy91paEJRY2J3Bhrs+mpB6ASNzH6IL7WUQdb2c1d4xF77eU52AjNocg/LELGRbXDoTB
 D8lG8XLkuuQloQmACQBcLdCcpsbwA09N14sjuPaonpQKoGbRxmSGv1gy48IJLc1CpD2KSzaeq0V
 +rc4QniKtSrjkGMf7zvxD+fyDJ5bCtI2OLQnOJUnaUEu2Bz2Pcxq46hC06bLeIF8eJSgwPM9rd3
 0/ai8bGNB1ejceowa0Q==
X-Proofpoint-ORIG-GUID: REVuQ6QIvgLJpEB5gVbHoo2j-ca8DUCX
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbae58 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iphPbDPzkScA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049
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

On 21/9/26 23:47, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/misc/imx6_src.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

