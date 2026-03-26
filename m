Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A021810AB82A
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Mar 2026 22:57:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w5tdm-0001kS-UE; Thu, 26 Mar 2026 18:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1w5tdl-0001kB-Ee
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 18:57:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1w5tdk-0001Hd-2Z
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 18:57:25 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62QMCpjN2583869
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2026 22:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ny/HhoUNm/tnHHrTn0jtbaIZMUa51jEYM0HTK49ptHs=; b=lGa6JG1PpDMNpPYx
 5ijEg4vMqve50vttUbNL2i03Cg9EAq0TjzN7xi9sNlxs3UcEjECVgMXqCaBZJEOa
 UH6JNdsmlIAuDwDoVmoF/EgcZ0RtPmKsw+miE5JUuu3Wb+IYrgdk8dT0ht9/TjxH
 CRQHOKOQI2T7V3Yyfel9GhiS36o/B2/qU5K+J1mVqsDBGAynvDBCH4SIt/L/rtps
 IW24FY+eTv4z41okwvjo71DsHo0JQ9iFrhCQ3gDjwFrbqViKcnXMx2tmwIUWbBvH
 zFZykxPhCacGzowfY06MQaRsvdbHmAfYvSveiCKJ8RwoZloHe/CMJQ9Bp295/z3K
 dgkmXA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6g3b5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2026 22:57:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2c1030ca85eso1048842eec.0
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2026 15:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774565842; x=1775170642; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ny/HhoUNm/tnHHrTn0jtbaIZMUa51jEYM0HTK49ptHs=;
 b=PYWWn92sWZ7l+b/MCjNJ+N09VNZ81RsXWFb65Jx4lE2Bv2LKdRCRUNE3t95IrurlDy
 mm5KSZ++GUuWxda4jXakPEMjGTVJThqXXHScvGZDdLJeezqHlCtKWizdh+VakL4+7brh
 LqGaqN3+hcY6WY+0/RwrBDxcCvG0Y+iGlGOA7iiWnefhR7/gvqyxzc2jRMx5kJweEe/a
 obFefZ4fhbw11WpoL5gylRI/Q0yEBnemBcugUJZEH3OpqBI2IbZB/cyok4fqMNsIOG7K
 BD+c2/C5ZE8QlUCyPT+0ohNnYTCYsISMZOKoQia9jmdx/fAUoTejtQ1p8b8myjORibby
 HumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774565842; x=1775170642;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ny/HhoUNm/tnHHrTn0jtbaIZMUa51jEYM0HTK49ptHs=;
 b=BoO+ED85NFJW+ps2C9hvuMNgC1G6fr2Goq2qx1eYDgK+1pyON2oYPq2miVib/Miu+y
 r1Kf25sYlknRASqEWk4oviG2j4JEVrLoZ5XZG6v41GjTK/XxyK1Wl5TDJ1BrwboY9jJU
 rxsf2lcGwNGzy2/dOFHigC5dDBTHtMC54y8I5djo1mpcXYtaku4Jylg12UqAqY8C3lz1
 0+y6eAD9EyAD2B1nDoxzSpfiQfAmQnf3dK+m5LzqTMOelSjnHpPmENt8+3A/3RAQ/Yv5
 Lp353w+Pj1Q3EyNvCj7mlyWfLy261fOIiKFuv4bFZu/xj29bhY+mWjD4CpsTn3vw+8c9
 jX1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu1o67njwTKagK9a28Hc9NcuXcDqTfNXV3uyKaVysqtCCdBhPxQbjSxtM9GKXxLtqzPUtYjvmYcQ==@nongnu.org
X-Gm-Message-State: AOJu0YzqGbxs1JlS/UWnSUPzWh0oTDe9n2RUOZbArTDJH48VYBlmdFA8
 oD5JdHqJjxPxJ4OJgGgaIOlHBQmkNylg1Sd2XCYdnLGAYgFcYScs7+OHfHhMyVan1eTMLjkJOaL
 wpw2VZQ2jAGn4fflv5YDrbNcX3D1gX3Sy1wln+TMdlmtVd6K3wjDVRTU=
X-Gm-Gg: ATEYQzzCyJxIbSfk3SBuSLVWITKw5zpegqbSCD0+1LSk7YzKuSn5H35GJPctgS8L25N
 f1/m+8Im2FDH8hMw90a8T3nVmKuTD71R0+W2QU1VxMEspRVlgG5e1Pehy/Dx3z9sPFEPyR37+R8
 iyk/7ny40veJHW2a7Pl8Z/i1xwUEJD+/Fssb2QQH3zTfInz0aogse9CBegTQmAt0PpMOuNgTgX4
 cdaCltNhSwNg+U9J1FvQ//a+XVXJGlWC65gzhnwOHt7moJ9xDvl30neLq3laElUacyIxbvi2If+
 f3UaBVDxEBeyudirSN84Hf7+6L1LVE89I8vYqaTizLbozA1kD0/vX8+I2nWhINRI847/zlkR8yT
 mxdr3sJnedXKojr65Q8/hJYZryKlHrtuYBa0dL2kko3ot3viUI2DJK4Exx0xqqeVgnMuaz2Spqk
 DQPAc=
X-Received: by 2002:a05:7301:d0b:b0:2be:837d:cc4d with SMTP id
 5a478bee46e88-2c185ca3a98mr256481eec.5.1774565841932; 
 Thu, 26 Mar 2026 15:57:21 -0700 (PDT)
X-Received: by 2002:a05:7301:d0b:b0:2be:837d:cc4d with SMTP id
 5a478bee46e88-2c185ca3a98mr256467eec.5.1774565841343; 
 Thu, 26 Mar 2026 15:57:21 -0700 (PDT)
Received: from [10.110.108.41] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c16ee2a41fsm3584018eec.28.2026.03.26.15.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 15:57:20 -0700 (PDT)
Message-ID: <fd4b0bdd-fb93-48c6-b0f4-228a7abfc8da@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:57:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i2c/aspeed_i2c: reset and migrate pending_intr_sts
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 GuoHan Zhao <zhaoguohan@kylinos.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20260325085450.126595-1-zhaoguohan@kylinos.cn>
 <cbc2f8e2-82d6-426e-b269-4921fa95b219@kaod.org>
Content-Language: en-US
From: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
In-Reply-To: <cbc2f8e2-82d6-426e-b269-4921fa95b219@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c5b9d2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=mNGNAPgbdfsAtg9pDooA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 4zAnRVYEbS-UlCqLCGME5YI15cQ2QsXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDE2NCBTYWx0ZWRfX32fNz+lK3o8l
 sWpmfGZZPYRB08JMLxtgJYPtlSwM3JKxM5LCjG9sDXowNXto9UEB4o+sHYRgkIwRxsEKwWiqPZW
 mj9ufu6rwzixg6h7PLHwtT+udZrlesMTFMNPAQKFFyY4qzy3eXuTA9d2VU6oFWn9LyxgyxFKetz
 ZdvzAE7XI6vq99TKjwJW0w6bZSec3EUe1sLlbBW2sWsez7zuP5xz3bQeH796e7ECLbbJOYOQBR4
 7E734xpNfMXWEOIkbo6L/rawZ9/t9rNEYrnoYTna8vEM4vaBsCg6ChXrDf5h5MDwP+rdHN699fW
 waTKmXluvAFIfcXC6flrp98AKNxhRAN0BuMrsJpDKHw08DeMyJJJXyT7H8ZhEf3uLmhWfcw9q2x
 N8l79u1RqKVuEwRVhplOTOKCHhEXFnkSZSF5eyNzMzVyVt0pf9W4XjJcS9LFtt/0FFeYtsFCtn2
 DVXDQdCjdUpJFw2KyDQ==
X-Proofpoint-ORIG-GUID: 4zAnRVYEbS-UlCqLCGME5YI15cQ2QsXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260164
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=jithu.joseph@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

On 3/25/2026 3:54 AM, Cédric Le Goater wrote:
> +Jithu
> 

Thanks for looping me in Cédric. Will be mindful of these next-time


Thanks
Jithu

