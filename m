Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFB3CA5FC1
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 07:41:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBowF-0002tO-5V; Wed, 30 Sep 2026 03:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBow3-0002X6-FS
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:41:05 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBow1-00049p-OV
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:41:03 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68U7dQVS1556131
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 07:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KyKit9WCjDeTtyAlNdb2ea+rcHXYLKrTYDd8Nz4tcaQ=; b=Pydy/tsqFMU5YzVO
 C0KqtbIMZNXfaLMuHYqx5YdzLp1MDmiG7ByriZvQaGyAbv9UP7pIYXF8xiWYVrs+
 Of2f2yjdtYTrlCDdh21wNJv/JuJGc/hI//hISa+Haiqk+4P2yj2XrDXnlScKa71m
 4bi+zRe2n8/tPZDd40To5lGgMfKw4jQwx+NIuuKrwyew3iHTjZqwqYpK+1hZIcIf
 rdJ8bk9xH9PFvHQ2L33VqPmSDZbsehJYGTINycwsx4qDO2H/NG62OcYj/xyYIWbF
 Sa6oYVzisRWagtxUmNYUh+Qvl3c0C7uchfLS44Y8myHf7YVVoNmD8wJv1h95KHLN
 2RWJzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c02f0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 07:41:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-939f248907fso489908685a.3
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 00:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790754059; x=1791358859; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KyKit9WCjDeTtyAlNdb2ea+rcHXYLKrTYDd8Nz4tcaQ=;
 b=gbJtsYghbTwP+CXLLDzUhJxZ/1QM2jvGC7I4JP0D8ollb42QFjIR677guBA17H3w4j
 SuA0hs8tKCuGJWgr2sWc9E7H/Jv4Z+SWvyhhxYbLvvDMRzaDDdK2cctAIt7R85K+M6UF
 bBTFG40zMLHwtv/tdc2JNcUAU6UrvjnDgbJKWTsT7Q9Tf8rVgu4JfaIGZkOtTyXC4d9c
 ++rrKvhdroZRjqepApliwlfXSQaLJz1d6AEuQ4mj9vMCQeWlQlNM8O2103Ijw0YaLem7
 UgzryeaQy9BdwDfTvmXXqd67tnbeYolkq0mvCPBoW/z7wiLcFnO4wum1hdfobOh7VZ1F
 as8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790754059; x=1791358859;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KyKit9WCjDeTtyAlNdb2ea+rcHXYLKrTYDd8Nz4tcaQ=;
 b=vn9C+keajsLNzdF/etIJSPxpPDo5Yl3rxqflaWNkEwvm2VvGehJxlWuuHT6ywcgCW/
 YqBFTBxFSSJvyv6o4XEmPQtBW3UCeiNPljJ1DmDCXYkRza5SBnQI9aPTdhALDjOAPeqJ
 qCZJDYUqksjgoAGMQiwa3wp2uPtzqVYLCr6n+Z0c9ZPVIozrosLsnJt+BUXWK9fRgRVI
 W9wVeGhvgKM0DhgtB9VO1PYGzwzb6asW3QKr/4VxgP/pMZhuXBh7i6MOrFrgzJx+j9zl
 lMplxBa2vMA0KzqjtmLlGg7MJ/eU2AUBGNWl+42Th0in/xavfSBXE80bjh2Hud4zH6KY
 qY5A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwOEML2SiY+9be5FL9x46RLjTXAT4pmVo2p0rhTn0nplegPUQWUxJ6MRYpwdS0PIoR/TFsSpA+koA==@nongnu.org
X-Gm-Message-State: AFuF++l57ftD9yZGiPwxc9p+f2WFh53AavQHDzIiVwiAlijsFSeksDms
 wEdrw0mcAuLkUi0dJU0plLj975K+m2Ga5N3IfFODSyljdVNAhXOyxET9RsPkY6pVzfZzbWeK9VZ
 AJ+8s2m2aUMeI/5To+ACmRuKu5Y+flzZp3CWXNlX8kVuLU4Vnct3Zp/4=
X-Gm-Gg: AYBFou0W42cnnbI+WFVtVX3MTJuRgyqUBGhkPK6lM/swRLUUdzGUfXC2qJOq7BdCC13
 mTeuibY9ZtpqN91DqMM2LTLJ7k3PPGyzuLT1Mc/hqw3KKx3o2lrehLHCmqL/snN+2fWQ5t6OJPZ
 4H/a7jOou2II/oiyaC+oMMh5Rt4Z2sginMaajIfqApvW8N7afDim+4+iStdmzB+Awbjag8XGxSi
 cm5fvPqLRmifXHIGEYuKFtmQyYO+mzIBeleTPLGAKk9iV745u9pgBEfDc5D/2SR8mYkaixKtEqI
 f9yTItRdpgerPdNB00X2M1u6S1O5my5ZP23od/Xyz2RQzB+eSkp7ESgrWDcdt6xkb9BU7H1ouQQ
 8sHOGOdS5Pu2IQ3N0dIQ=
X-Received: by 2002:a05:620a:1712:b0:939:7e19:ac3 with SMTP id
 af79cd13be357-93ca9752a1dmr69962985a.45.1790754059040; 
 Wed, 30 Sep 2026 00:40:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1712:b0:939:7e19:ac3 with SMTP id
 af79cd13be357-93ca9752a1dmr69960685a.45.1790754058491; 
 Wed, 30 Sep 2026 00:40:58 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.49])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a017b7337bsm18893565e9.3.2026.09.30.00.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 00:40:57 -0700 (PDT)
Message-ID: <0f6a7e4f-11f2-41db-8309-1568f335f7cc@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 09:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/11] hw/arm/aspeed_ast1700: Use unimp array and table
 for unimplemented devices
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260930072501.2612119-1-jamin_lin@aspeedtech.com>
 <20260930072501.2612119-10-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260930072501.2612119-10-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzMCBTYWx0ZWRfX4ymqSarzlfPE
 ju01RtOUGmI/MuMrxbI3HO2H/1QnPkG0oj/h8rMP7wHVQCASApYgFM4RdTo99QA9A7z2Z1YKTVs
 UocIbBsrqbzjLIxrp6o8bQoOxy/Ggg0=
X-Proofpoint-ORIG-GUID: wz9d4czFbrXcR3cqAGZljlaLg3KkAzTe
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abcbd0c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7g8aA7A78AY7OC82r+w+4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-GUID: wz9d4czFbrXcR3cqAGZljlaLg3KkAzTe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzMCBTYWx0ZWRfXxwWhSbGXZks+
 1J/xjjcNUkwm/yQ4sJ4lOnrzmCrfagLuHdjcTzHSjvraA1W2RGhpq7oqH4i7jkd2uVhW4JjeXZ+
 X4eBU9/clQAJRzNNjFZmaFgL8hnlc0stX/zSCc4Gtbxwz1TQ/TWF+xmFTz4Uei59sU9NKN+IAJN
 fm6n3upfvmvmCggibjtQ3S+tMvmo+mPhd6w+U67oyYNYx/f9kNTvWh8To2cKJ3tALDPBinCKVfB
 0OWG1rhs+wCo8kzzk1Q6awhowZ/uKLc9ujk6fxbrgBCmztQcE3YI1nrNAhFhlgdRjjiBiXne3yk
 W1VAAbKaag8Fs3HGC9U+kLCXUWyUWIceff2v3xApiGB7kjUX5hXoqc2dRw98tTRXfH2rKdYxTF3
 YUvSjkFG+r7EY8UZlcj0Ip+vyDTbkGNM5p2exhly3fMaAphUnRA5j45vvlSeGH/VdfNS4DbdFGA
 eAjkgDI2y31m35rj0cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300030
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 2026-09-30 9:25, Jamin Lin wrote:
> Before this change, each unimplemented device needed its own field in
> AspeedAST1700SoCState. This made the code hard to maintain.
> 
> Add an "unimp" array in AspeedAST1700SoCState for all unimplemented
> devices, and use the AspeedUnimpDevice table to describe them. This
> makes the code easier to maintain and read. Convert AST1700 to use
> them.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   include/hw/arm/aspeed_ast1700.h |  2 ++
>   hw/arm/aspeed_ast1700.c         | 42 ++++++++++++++++++++-------------
>   2 files changed, 28 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

