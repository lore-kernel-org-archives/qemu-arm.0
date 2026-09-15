Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F391C88E77
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 20:49:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6a5J-0007Hf-D2; Tue, 15 Sep 2026 16:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6a5H-0007H1-D0
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:48:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6a5F-00082N-LR
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:48:55 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68FItjZf377473
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 20:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PDDcox6XIolEWmMdxtVZWjE5lnF/fbOaI18229N0ODI=; b=GbiMhs3K7qTy2rt/
 eLdlPDICIXVYZAqaAtL96GgZFXvgSjjNsVNf/YSujQ40BaRsGCcDJTT38x4mUvfe
 74nX2BKZdmgBju22XBHZhVeZzA8kxz4zz0QztiELb1qyUiTAWCaGvqn7ZRmbXXq8
 wWb3HVhlcVBtgdZW66uPtA6pR/wKR/Iutnl0vAYVEoFIoBQDNMUjfQXemivJfYYz
 cHFKtcavAIAoFwD5VyK1CBup6du2cntc+AgwZRU7e2xYyKZuli31EmwG0G3+Qrl0
 tHvWYu7sxiKejYvWiJ8JlYAuWmkq1FmMCmPUsixLvBBYfCeTxNdBRFa8qI2nV5sy
 i9PGlg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9ru2e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 20:48:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cc1b80835d5so6199333a12.2
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 13:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789505331; x=1790110131; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PDDcox6XIolEWmMdxtVZWjE5lnF/fbOaI18229N0ODI=;
 b=W1N0Gi2EO6bi/lKzssS3vYsU2ynprq0LSUxI0kUvSN8d5LWqZg1UtSfu7lKLWfqytc
 p4i+AN+nu+9f8DvzxDsVEFNm66QhnXihJRIxEcgpxmvio/drvxQ0UcyZIlzxSIHkBf2G
 xTkYIKuMJB1AFE+e7IhjgT197P7p3d+Hq2KQJ1FU7o+JAFMAjJ88DoGiAwOWV6BU01+W
 EB1pAoahoC2JNUmP3dMXcxQZKY9O+K/PORy6Bhdyq8qwbTibEA4euq23KvRYqvy0iTu6
 +obk+D+tCzuh2quVVZ3SsC/Cf3+khLpsR5FHtxoZf3VjabOQSqpDf38aAQo4fjmSi1UP
 jhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789505331; x=1790110131;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PDDcox6XIolEWmMdxtVZWjE5lnF/fbOaI18229N0ODI=;
 b=ITKTKU5vQe4Xh3kNBG3k/jvgCeotLfI1omz1IlEKL46biG+EJaiz56jrmQNggpiLR0
 NjDLdZvANKjLr8v8lHGmbhMBbbrFwSbzyeCbs2lDBwg4IoB74cVpXFpMUk5GXToEid8B
 6jXdALSvA8sw3facS/gegdZn+oLlHNHjKRckpX22TD6G0mhlt3sHdUURaErTH0Cx4heS
 /7UdVUo/chH7TiZjhKQ6DC36PM3TUk7VHa5nwgjEAnJ3jRGYVRozhVlAwEW3lyqqq7kr
 Y08JtGWQhzlCjuOx6CyhyM24fNUeFnZMeQ7/4ro0MvSEbgUFbg1ROPc9TkR25soJa1mT
 cVzw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzH4Uve9n9UEWe0E+DN8ublfbQ2Hq4Z8iwnJi+CoY5db6poS7d3lPfgEE4bBP5e8aR1sc5vD1a1JQ==@nongnu.org
X-Gm-Message-State: AFuF++k1BiBwrNd6Wo0LApJyhYXR4FmRbDsZqijcD2BND8PRXR89Nqrw
 RstM6Oa9Y4qpdpqELrLsyYruCQQuePOoagAkc2iSyVK2eZQuYpHN1nO944d1zmHvLTu8uy+ZUVS
 FDXBK7vL//E4MdBphJ6rRnBwq9mVCAr0Vxk2I6M8SURIwM52t/lG8FUM=
X-Gm-Gg: AYBFou394dMubWyNendw7hLS5DAfl2gQQh7d8OzulXbv4ayOSymMQwGNxwtFuxuwM1r
 nZErY28h6bTYoSec2t8n1oY+wa+wDPfcf1KdIKhcCGcOCYG681taCHJBb6zC1/KEbD2IPgF7zsF
 T4dnk+oG5CZZFsEzSIAZeZv4stqz8J+uIAG+740oupaEmf4cZX/6egwjHIkNChtRbUAD1OB1QhD
 ZPheFm3f8VuQmOKDAaEhg4IhNG99ufKF5t9NPfU5wV4iWIgOq6d30nC4xcugUWbdM74sPKmH68o
 XRcsyXu2S97S5dIroi4AEbSYzHRuV5fJZFOnKNyZgO9fNlugu7A0ZTQCHCwhZAndN/30Yn+0ZzG
 73aSTtryGswsJBurwTFEhkDpOESCIhCnYwuyoaqFjyPdGTnuLsIAxi3+3+Hqyv7JOntts
X-Received: by 2002:a17:90b:4d0e:b0:39d:f5b6:ca47 with SMTP id
 98e67ed59e1d1-39e1e47abbbmr125095a91.12.1789505331283; 
 Tue, 15 Sep 2026 13:48:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0e:b0:39d:f5b6:ca47 with SMTP id
 98e67ed59e1d1-39e1e47abbbmr125056a91.12.1789505330713; 
 Tue, 15 Sep 2026 13:48:50 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5af6593sm1385342eec.25.2026.09.15.13.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 13:48:50 -0700 (PDT)
Message-ID: <3b18751b-3d78-439c-9348-b4ffa47ecc95@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 13:48:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] Revert "configure: remove cross_cc and gdb
 detection logic"
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Kyle Evans <kevans@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Brad Smith <brad@comstyle.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>
References: <20260915201601.1207839-1-alex.bennee@linaro.org>
 <20260915201601.1207839-2-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915201601.1207839-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aa9af34 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=c6L8vRCQTaNpNBqIKPgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Klaw0NiQm7aAts92hMLuu84lbhg65CwC
X-Proofpoint-GUID: Klaw0NiQm7aAts92hMLuu84lbhg65CwC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMwMyBTYWx0ZWRfX91MZzHv5w++J
 I+fTbIV4XWCLULADG9X2VtmTJBIJIZz6HGml6d+6y8tRGExH1AfDrfFojHY0n7JGrSktu95PN7W
 WGcxa7c2XUsKZnEgzGn3qDt1Tm6ccN4OMSC/JyMDXOQ1tDYJHpApgds5Z37tqAtEjosU4Zhsr3Y
 IE4lTwElREIZPGPM9IXe6h3KU1HtQZiwDz4FeaZB9eNw8HcIDfZ7JaAiS58609kntgYh+sCAlxv
 0wFwH2cgE7tWxnl9gePvsEEu+PXoZGx/eQ1KyGiQh0Hl3y/926m1rhPOeG+ZL99mxLUVc6guDkZ
 V4Z1jT6wuAW8DFpTWooDgX5BjPh4BnXv9TynwhoPUfq8Iyx5PARLQmvHuF5LD3YHmFnbvAfEmS3
 ZHCCNNvsKxfNwmQ0eADfm0i/7/TYAn7iCA7gpdhfcQQtoxY9ex0olw7/PJIOtxgp/j63SXia4zR
 XuGBtOxWr7tmBYatVlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMwMyBTYWx0ZWRfX8aGuV4bUBmCJ
 fyXIBqrLWaAX3J+p48sApQhLIvXrgmoZbbJayh63WlPx48l9LL6lugdXddY0VArDrapHyjZIsS1
 GIbHERbyhUIKYV3lEumRc16ZLWtgFU0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150303
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 9/15/2026 1:15 PM, Alex Bennée wrote:
> We want to restore the logic to configure as it's also used by the
> firmware builds.
> 
> This reverts commit 031f935567ab8abfa4e84682ecea08915ca9656d.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configure | 461 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 461 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

