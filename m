Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7AE606A31E
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Nov 2026 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJ+uIdKX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aAnuw9A9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVpPL-0002yD-6D; Tue, 24 Nov 2026 07:13:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xVpPJ-0002xj-Rl
 for qemu-arm@nongnu.org; Tue, 24 Nov 2026 07:13:57 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xVpPI-000752-B5
 for qemu-arm@nongnu.org; Tue, 24 Nov 2026 07:13:57 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOAutc3749671
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2026 12:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c5VpHWiFoK/H27Lbql3AFfyumLEtodqfBmX5nCBLmhs=; b=XJ+uIdKXh9JMfzek
 rTGphFk0KQHpgI5RMw9qiSDe0ZkIzS9NQ5Q/9Ry/jlCsUen/j1GuHrcek/frFt15
 aKw0K8IdpfSAg90JfgyDH23W/A7XzgdDXGSc1kDjBID5p99zjqie8pg1wwm8zRXV
 BlkGQ8vP5r7T/9ml/zYdKCS/+b4adjC17oBBaMr8OeQ/a3UUR7BDbD2cFo+r32JK
 HTwjtPX/o3Pk56Qf3VIsa6KuIJiT5abecuTOTw1pa8uV/4CJgyTvHeN+wGEF0Irg
 nvHPRcXvsy3eosDEhXYqwQivtPnzpUC4ARI8WId4LCnbFaT5XvAOKgKp0dKsYVEo
 /qTwPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb2myh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2026 12:13:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9495af07676so697574585a.2
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2026 04:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795522433; x=1796127233; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=c5VpHWiFoK/H27Lbql3AFfyumLEtodqfBmX5nCBLmhs=;
 b=aAnuw9A9q7rgLjy3hUdkNkz5GfnANUGG1yhpPi8lV3X8sQjoKbYjfDKbCCkwmXLX+h
 jjsTS6dFhcRm9CXyGdpnP1nuVldc350P//mu+0zHDaJcsni61TPw1cfTdllSK+thuA8r
 kCxJOtTaP7iDPXu1ZqSaBz32poc9m6/taVLhHy3yPRvhV1aDY1AVJZM3YU87+y1zZ48l
 EHvi827DW3lax5s7Qm+JkL1ELtGsRU3x7CQJJi9VBja/pHVCytaLJ5JhWUxCn0c8wP8l
 ZTVnP0iIJQBONwNtsOjkInBJcUU3bpGTYLrjK59NLahrTAvKz56c95wy/CsWCgvvbgXS
 nQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795522433; x=1796127233;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c5VpHWiFoK/H27Lbql3AFfyumLEtodqfBmX5nCBLmhs=;
 b=teTNGvTTlHmGOyjO8BCt2J4xfLaxV2WEJ8c7AaD0pf+sp23/jVrLelCitjk5+ssMOB
 N8FZPSekA+H4Kl/q/O05aIFQgvf6bdSj0Zb7DXw1qERDIjuH+w15MNQW8jKgWetupN95
 tH5BOEsglux2LCKX5FsTAFFUif6mFQBA8JQbv88fnHcjTtRolC9+Hcti1XIgISJRulG1
 OF4xUi3xG1mOaSScE/fYGDOL+aTPN/Iz37+/Dq8cY6hHBPJ/we5ZzBCAmWvgtFS6QLK3
 OuL9nu3qSwA5HLv/xULsQv7LtIhjUMBDzvwpveH+gqtK43Nkv07EdDnK4STw0E8MNnDu
 8pOw==
X-Forwarded-Encrypted: i=1;
 AL+hErFh8hiMuaXVIvSFC/x+1zrj2eqJQSl7EiepCUPfp+zLAAcsEUSY1RkQ9jOGVcuuG/qhQJjtnCRjlA==@nongnu.org
X-Gm-Message-State: APuU4Z9Lh9uhnJAklPHllN0LdWn4U7McwmdQTWmQdo5dJMd6LRiYSrqN
 TWKi3muC3Dm5obQRRcLjvHM2rXcLac0bBAAmXMVyCh+gQWT7w3d29uWeR0HPD8p6YFdCwfbNLIG
 /3aiVPGZmnneFSZbumv7aAbYnHJ7Y/9sGSW8L6KX512EjQqEJN8aRxdN26qJNKwYT0Q==
X-Gm-Gg: AZFdTZeOTQVz11AIWMRRwfgs1PKY9mzEaYpmy9lgoPJq7L46Gidb1A2htF/I8EcaBIY
 8T47Qqr8b380bzciX1qq5XEbTlooBjVTMVKeZgMjijbdpp3U48g/7a3tB3pdy/nVamHcf8ETeWb
 cDwfZI7ZHPL0eWAEdYH87UcTAB9hL6nmcEfejt3thagLiJkq1fvoq+YDhLhpbiFUEHe+XbiNg3V
 LwnGtiO5Vzl0IeiSejAavKhPxj/wmIUdtfYz5kPld6PZjmy2Ym61vuLQ+7831TobPn56ZIDZHcO
 jrRO4DtXCkyb+pY6e3S81Xx+GVjMbtg/pOeZZJY4nRpDRzTCkM4wVkwWzE013lRfXZq3RJxtiU7
 bFOf1FyCKNThwO529g4EyFVeikPI3nIlXdvugSYVJw2nHwdBU91tWXw784MVfdjsu1SuRrCeXqX
 lq1wxPr5Q=
X-Received: by 2002:a05:620a:44c2:b0:945:dd80:75d7 with SMTP id
 af79cd13be357-949ba9a5803mr2576037785a.41.1795522433325; 
 Tue, 24 Nov 2026 04:13:53 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:945:dd80:75d7 with SMTP id
 af79cd13be357-949ba9a5803mr2576032785a.41.1795522432816; 
 Tue, 24 Nov 2026 04:13:52 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906817ccsm228311165e9.5.2026.11.24.04.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 04:13:52 -0800 (PST)
Message-ID: <648356a5-eade-4f18-b0c6-2a4800a1686f@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:13:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/intc/arm_gicv5: Fix value of the IRS_DEVARCH register
Content-Language: en-US
To: Zenghui Yu <zenghui.yu@linux.dev>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20261124120509.19746-1-zenghui.yu@linux.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261124120509.19746-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b057f82 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nYj6kyQ59m4fXELB2ioA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: F3dllgpYhfEBa91MF0i4uC3cW1GrrhOf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfXwy3XcgCCjtii
 SlO6pRYZI2GVhxEXFBJdSMyVFBhT/H0GXQMAy3hYypkJOfZyTFsS3PyGD8rFdOd9EuezZQMPgrf
 KKzxQoS7hOxwA45TNXTl+4189+i0uso=
X-Proofpoint-GUID: F3dllgpYhfEBa91MF0i4uC3cW1GrrhOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX6Dy0Af7X4XEo
 J7/OqGA49gL+tANyeU7zvp7TJDdCi7160rwN8lGoqoCvyW061LPW3HaNGYenuVtotX0GuhuVR08
 3TqfMIyzwOPwesOHMxqTBO9E+CPm45CAmwsdIFlYcIEfMkqjAQV2PSbS6OBMpZosZRy9/dPLbSu
 uxG5ezLEjtE4kdvn1bTyKS0yxm9070+QpLcVi1XwgIbBsKJ0Nu0542s6hUU6s3l+GLjVVKWqSDW
 7JIY+eWsOF7LBzGP6s7s4uReJspvz63NMWxc2mwSwLD9q07MbecRcF62wO/K4TFTon+FK1JwDZT
 X0oDwKvBJaeuSGYh8JxcjpO1Y45JXKCkcZmlr7vT+R1CXO3mxfVCAv8eeb4CZ9aAp8N4fnkCMHt
 nDIzO4FJNuKZyHkqlwrwqkP5rlN4P1pku4OhHKhikmB7VALiEviyz4GI2GB9CueJjHiTQrEmXWu
 b4kmOy3Z3O/r9cX6mBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047
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

On 24/11/26 13:05, Zenghui Yu wrote:
> The GICv5 spec says bits [31:21] of IRS_DEVARCH are 0x23b. We wrongly
> shifted it by 31 instead of 21, so guests read 0x80105a19 rather than
> 0x47705a19.
> 
> Fixes: 22232793ecb8 ("hw/intc/arm_gicv5: Implement CoreSight ID registers")
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
>   hw/intc/arm_gicv5.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

