Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D2B606A31C
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 22:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJXlsX6a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VBgCa2bJ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xT577-0000lC-0r; Mon, 16 Nov 2026 17:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT56z-0000La-D0
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 17:23:42 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT56x-0007WB-U6
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 17:23:41 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGJfUlI612688
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 22:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YC4v6Zew/6WokAUPz6W7Kan/LlUOmvwgNs1ZfUn0OXs=; b=hJXlsX6a4PxtBmdi
 u3ypYnTCd9JsA1S9lLdqNxH9JYjYOM/nt8bDNGnr+huh/GmCjxGCZry2IXMTR/ys
 2tUJkaiidByme/zrrFdzAqQOAr1bDcxgB26AUrCKVuxE3yvIRVa2wkGJTwwJqE0B
 e902J+eBgEjd8LdiWKWZxC9GgOgb9Yxm+qqWorUch4UqwKwJ6oIuBwUZZeR3ix/p
 6nbl04LWNIihFIhbdCOTMOWgK2uLwalWIADNtU7nwvKz/413QMgEdDYT8WRkI/wK
 RER9Ez4jWpsHqYAK5yycvci+GKgyA/m6PHsWyiOt125sAfRvtaR3snyz0BAkiJVd
 6n1Kwg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6gjx2p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 22:23:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91b937ecbb4so29031966d6.2
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 14:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794867818; x=1795472618; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YC4v6Zew/6WokAUPz6W7Kan/LlUOmvwgNs1ZfUn0OXs=;
 b=VBgCa2bJJxv/zzhx1Uno/m5MWBhK1dWRMSCdnbdWyTO+aNvl2VnTOjd8RKFC6kRzLm
 c2i9VVAqoUhmD1oGvZunsuRwy7Uu/fpYbIPf+HEMCfky5Ma8o8nuf/G2w8iFtD+vJChb
 2YutaMrDQld6aeqDJykQH8ERHB2KeL9gKmYu51Ayg8TxFZDes+GlABCXiUNCtH51j8we
 CRgKqmsSSuE05q1j6LO2wRgMQ+69rniWF6j0S2btXk3Nx2XLVzYSWjpQh86h7fn/YMNR
 b1CjqSFdWVpSXZYXiOM+0aO9zcjk89OvOECzUeLixmdscv89FEe+8E4QlHnyWo6cmhl1
 PQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794867818; x=1795472618;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YC4v6Zew/6WokAUPz6W7Kan/LlUOmvwgNs1ZfUn0OXs=;
 b=nHQDkuFpWzMlsZSZqtch9EzC3QXSy44XMPxbwS+Bb+2sn1KhcLZ8tlDCWHKixitLQ4
 F4ZQhff6VfywZsCd6RWJg5x/9FmHvBnJXBHutylpJkFX6SMhUp0bgSi6ASw3envBWZqD
 1aY/fbHJiMg+JAMn2jZqzBTcpJpiQ3FeNwmPZ/T7h0wNkNRSvCeMiqXHubNctdGOUQHF
 AHCdfS9uoaB4Jd8SX9Xnviv53AFPZedQT4As43KryoyRJLW10we61mvlQhGCFMjzPZNO
 HKgCzgzQenW1tJJ/MqzaGVq5e1cSDc/go1qVgHAc5EayZlHt1pUqiNkb9XXO646hnmE9
 wL1g==
X-Forwarded-Encrypted: i=1;
 AL+hErGiBzWUaYU86o7omdleDpd8YerFU3UmgGob79ZTLtNiQnG1SDYxur8Usym/pJlKgswvm3XzLWRqIg==@nongnu.org
X-Gm-Message-State: APuU4Z8D3/QRd5bH4skg2mL/KBCrphI8iVcdw5eBfU8cEVnNlnzhy2hY
 p9zLxp3+QzdqdDWhdm5LdIx2m9Wdd05kks754YYXpUCH92UDMSfwYEdpmCZ7x96EClAM+tD2wn3
 TaQlXPpJVUgQx3OVmYm47ycC4R1pr3LcLwZaf1oM2nL7hTLXmNDmF840=
X-Gm-Gg: AYBFou2xRC3x9HBCSdfmCtbWlWvTW6neS9gzPL+emcBLVVq2X8oI6mfYdk1uIUeMroW
 bCuYQMgIus8clkMua5Wj/BvAcY6oOB28xQJ4ecTOHhK5mjV36L/e+DEF0wN2cehwD11yYRnlewc
 Tx+UAu8gXu+IcRaKWNezmz1RbQPZfWcRJxQJiAHhcmLQlO8bcfOPqLHsqBCOuqvh3j5HKqTVEDl
 VfIPkUa3e5l9eTGFnIfDN/IqsEoOVoLMpo0h8P5+THx9LyrDZTacwPRedE2hZD53fgmka8yO6Ti
 j4F5cU7ArD5u9WtL/tjyFJla2CMKjVl30KUZMVQOa6ebVVBZFea+H1LWj6eHkMyrAzyKmM55rTv
 mFvzJkK4Pi2mssRfKf6cnnZI4qETGe6FZ60BeHuYE50yTCyRsXL1iqoWBFRu5UcTfNaUAej+PUb
 zU9ofC2HE=
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:f11f with SMTP id
 af79cd13be357-9494bcda704mr2056770485a.75.1794867818087; 
 Mon, 16 Nov 2026 14:23:38 -0800 (PST)
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:f11f with SMTP id
 af79cd13be357-9494bcda704mr2056764185a.75.1794867817337; 
 Mon, 16 Nov 2026 14:23:37 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d03b104sm25199906f8f.6.2026.11.16.14.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 14:23:36 -0800 (PST)
Message-ID: <2c9704a6-b0b1-44b8-956b-d7c877621c46@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 23:23:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/block/m25p80: fix write enable latch after WRSR2
Content-Language: en-US
To: Yifan Wang <w-yf22@mails.tsinghua.edu.cn>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, alistair@alistair23.me,
 kwolf@redhat.com, hreitz@redhat.com, clg@kaod.org,
 peter.maydell@linaro.org, jamin_lin@aspeedtech.com,
 kane_chen@aspeedtech.com, farosas@suse.de, lvivier@redhat.com,
 pbonzini@redhat.com, bin.meng@processmission.com,
 tangtao1634@phytium.com.cn, Chao Liu <chao.liu@processmission.com>
References: <cover.1794558546.git.w-yf22@mails.tsinghua.edu.cn>
 <0c80a9c01452a8695b46a6d9fa920f9a14f4de47.1794558546.git.w-yf22@mails.tsinghua.edu.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <0c80a9c01452a8695b46a6d9fa920f9a14f4de47.1794558546.git.w-yf22@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4OSBTYWx0ZWRfX6NZGcgLjtwEW
 9SELSvvu+0HZbdS4dj8rluEkHSdBXeLwTFjiYDob4u3Qm1zrFYXNgzHNqdcZzrUnRvES2pPRReY
 F40kt7BqFV7gGfSvw6mubuZfFE27HGmEGMFl653M6JQP+K1CVrtXjJvuWFPSYdj1uBf44/kLn9z
 CS2feqQkayrjs2MPgUDUpYMzouwq23E9dFRIGlFzJ2oqs+KbkQUqsPRMO+7gO0cgonWTZE/dF2D
 OmDIYaxZltEkItjJtJScKl0trDvrAkrcBFvkKPelVAEQ6UaxdON5zMKI6IbhRCxq1V6vVrc6YIo
 r+EV4aoVCv382y8f9fQ09XHkMPDesBsZEMDDZJ60MAhwZ/0Hkbj96hc75G0w7f4BJDbuDD+qXPS
 cim6QjC9TBE4C5DGWfnd9DdrGjjZAVvLIojMYx2+r0uFVUldguCOo8BH4+4oiVqo+Pe+wm7ZjRu
 x/03bk5+VQZJVvms/4g==
X-Proofpoint-GUID: 7DShcYlACM_pgMZWarmlxrYUhIk5ZkBj
X-Proofpoint-ORIG-GUID: 7DShcYlACM_pgMZWarmlxrYUhIk5ZkBj
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afb826a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=FRSEYCzRAAAA:8 a=EUspDBNiAAAA:8 a=4p6pNRT08ujvsq3huYUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4OSBTYWx0ZWRfX8y5VobzWhCK7
 Rz3kb8YLcWM9/DqR68HMbWJvlM0ROh7P9btM9m0AgdQXr9Qd1vFBVLVpfDA3CAauIc7h3gmHEbz
 1bO2baXrUUw7oNEq3uCcztjk387rwoQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160089
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13/11/26 10:41, Yifan Wang wrote:
> From: Chao Liu <chao.liu@processmission.com>
> 
> The flash clears the write enable latch when a WRSR2 command completes,
> just like a WRSR write; otherwise a following program or erase could
> proceed without a new WREN.
> 
> Fixes: 9785731ec4f7 ("hw/block:m25p80: Support write status register 2 command (0x31) for w25q01jvq")
> Signed-off-by: Chao Liu <chao.liu@processmission.com>
> Signed-off-by: Yifan Wang <w-yf22@mails.tsinghua.edu.cn>
> ---
>   hw/block/m25p80.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 2a882c392c..d0a8ecf1b8 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -853,6 +853,9 @@ static void complete_collecting_data(Flash *s)
>           default:
>               break;
>           }
> +        if (s->write_enable) {
> +            s->write_enable = false;

Directly assign? Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> +        }
>           break;
>       case BRWR:
>       case EXTEND_ADDR_WRITE:


