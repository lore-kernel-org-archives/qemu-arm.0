Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3FBCD5BB0
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 17:52:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQU3M-0005ti-2D; Fri, 22 May 2026 13:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wQU3K-0005tN-6i
 for qemu-arm@nongnu.org; Fri, 22 May 2026 13:52:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wQU3I-0001Jl-J2
 for qemu-arm@nongnu.org; Fri, 22 May 2026 13:52:53 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MHg0S23601949
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 17:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Bvzjqd/tBZR5BEb6eCZ+vtt+IYFTKabiCLcyJUBzguY=; b=bMZnSaQavz26bocZ
 JRzUtf6Ov9KHzwJEVPvtdKzxMjFvq958uz2xZkGKk/agzjzCDj5ay7voyxd6auoW
 GLaOkYAKS8kv3fnITu+nX/k75XeHJ2utefliiu2BFKpFXJ76kOkwlywe3So9rWMW
 mE1k5qxDpCjZEtnWHVysZRsN0WjQ7zrurOGJDWs6B/a3h8wr4w7diyrPq5BpZAbe
 sOH77ZUKGSkfV7Qzp0lIJY0A9kVZ8EqVm7PJQoFAVTU1YZ6FdITrId0cHUpEz6ar
 rpGSaiUNz50o3klfejd30aeYq3XZZvYDW0KSX6HSBXgQPjYJU2hXecWC8oK15L6N
 Rq2pTg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaury01m5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 17:52:51 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-135916eefa0so7311759c88.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779472371; x=1780077171; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bvzjqd/tBZR5BEb6eCZ+vtt+IYFTKabiCLcyJUBzguY=;
 b=TA5b60J49V/PexSxqo4k2BPIRPoY8pgSkP6xiGSH5PVMuoRimBwKxJXFxnsWC+Z6RU
 ivboM79mod3tWbaG4x4kXPrQU/yE0jzpMzn4ocsSwZI3uPhBEiMVyRo8EKDnzfhGy1Ef
 xIw4f4/4xEK4/mBXer1nPqI5LRebnerCUc3rcfzWZTNNDVgX4BVSMk51Lr1n4XikDhvd
 ntvCz9PaZgWBmRu5H+/y490h+7WojtxVWdebu6Cr50F9Lj+rpcWSTyHDuIFjiFKnujaE
 +ZqE+KHm9XqtmTUmFzh9fgt172C9szvcXHU5HUcaNe2eA1g46Zp1EBb/cy24Oz1CPCqb
 UATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779472371; x=1780077171;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bvzjqd/tBZR5BEb6eCZ+vtt+IYFTKabiCLcyJUBzguY=;
 b=jZWjFQ/I2rq06mUzNRV2kMAcoBOOHkjHt/txUBe/wxxuKiNcRMPNV6WGOCYhiL2nS7
 6wsTUy4xcz4+5orwSDXZx55GjJ3CTrxvN8aDYdsao9qqG6LK7bzNFTT3BQd5QNIg0CN5
 FtJQJ6Lnx0+obt9SFFQykydQos4FjukQn0r5WzN7Q3oQj+lIV+j79iVdfBTaEG4sjJLQ
 4Kv9oeg2wyG/8GQQCXJ/eWsQCV1R+6RshBUeOSvF6h8/7vscqPZNE9Y8ry213KOtCjcL
 R/iwxm1LiqhIijmiKmMW3J3mUQcThJzMdCiTpHqartiuANNOQEKxU8Cndl3RoftphERH
 j2cw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9VIA/wbcwVzOryZogkETJkHkSSPWJTo1uvMxgxJ/XrlhOi4U8QAvfALFxQa7PgbjItHPeeQSFmaQ==@nongnu.org
X-Gm-Message-State: AOJu0YwNyFzCp9omp9EH9kbd5AQVpQI82qeqvmIckau99J0xEoYnPMWY
 AzDlmIkwe/w548BnDWzFuNZ8XMxrYG9gb737jqTTdS5bPJXfREFW3XHXUAqfZ6jaHsbcPIv19MB
 Fb/d7DletiBvCzW962rfOqSG1pGqHqF578DjQliKwcwbfFaw63D+vSQA=
X-Gm-Gg: Acq92OHE59a10HwiNnODIdGPQb4VKdTiztNAzaEcvx7I7BxBYOgKZCDI6ag5mUN0P0o
 B/39IU0NzMbyOAc6Q/UVnyGmDthYOhtJfcsMooNk1ChesrEyuwGgRPketxKofL6AffI9Xw63M11
 8+KAmlg3QFQOIjMETfwDmOLOu09V+Z3okCDKYnAeisZsB5Po0z5w2VL1fR1Tt2S0/VCJh/nsLur
 U193IZY0bzkY27PsC8qu1ONmtoGrAK0Wmhq23rF2x79AyBBcQAmQlCm5yG6vPb8+qghsLH2qNC4
 sxh7B3ygXAEre0kf3GwXj4hb8NQL/RafyvwCUAsjvWlR+WRD0SOIVAXVvq7V5txtnemzUDsh49u
 BGRu90h50n7UcNXmtk6+teIsV8d5QcGht5Sclgc9Oz4wTLxIhgt5B+TJtR/hZOwtKfVCbwEp2Tt
 grbtPvf8BeOIpiqSqZpPNDd9Z7
X-Received: by 2002:a05:701b:4189:20b0:136:777a:1df2 with SMTP id
 a92af1059eb24-136777a1f92mr816206c88.11.1779472370683; 
 Fri, 22 May 2026 10:52:50 -0700 (PDT)
X-Received: by 2002:a05:701b:4189:20b0:136:777a:1df2 with SMTP id
 a92af1059eb24-136777a1f92mr816195c88.11.1779472370159; 
 Fri, 22 May 2026 10:52:50 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1366a2e672asm1766652c88.3.2026.05.22.10.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 10:52:49 -0700 (PDT)
Message-ID: <549a4e6c-b3fb-451e-98c0-db6478811389@oss.qualcomm.com>
Date: Fri, 22 May 2026 10:52:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] gitlab: add MacOS 26 job on gitlab runner
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20260521131739.540157-1-alex.bennee@linaro.org>
 <20260521131739.540157-8-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260521131739.540157-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3OCBTYWx0ZWRfX6qhfNxTdEmLK
 G2g5P6UG+b4mXId2G30KhimfQJi1aTMaZKEUOOjvl2AVlfwdZG02X3O6WuzscDKg38ZKdEaWdwj
 g1IjHWZxx/KvmuRG+/Vpk8O2LdBDauCa3I9FOqyFWKPBiOqWzZW8Hj445GcbtavOBWI/LxHkeZA
 f1br8V4HvuXYmsY2TxPED0FA/kjIATUVmM6z1nmlxJ3aML1I+tj2526HMcuzbiuAv4vVMh2KDXy
 5zWwLK6Il7QK+IW6dEbtT14aMnPPjF2ACSaVtLIwwEfje1lkOYUxQhJZQ0u2ZE9uXdaAgdNWvso
 a1Kt/041s6hvvhmDGSDqCeqHDYAMdw077SzI1UbEPzLsgjstPl1mGPsHwJLms7QX93/swwgbiXa
 UDyoQpOBVpGVhuUlhbmnCUJX5r7Ss6jYxQ6H4IQhC72U1jyqYhE5YPNeM46fPiETQsTP80p2CDo
 2prgD5tBg5Z5V+W1xLg==
X-Proofpoint-ORIG-GUID: 8lsawDX2XEcXgsWxJwwKR7n1vtFs7N4G
X-Authority-Analysis: v=2.4 cv=d8fFDxjE c=1 sm=1 tr=0 ts=6a1097f3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=t4vobd5irhleK6ilZBoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8lsawDX2XEcXgsWxJwwKR7n1vtFs7N4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220178
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

On 5/21/2026 6:17 AM, Alex Bennée wrote:
> gitlab supports 3 MacOS images with 15 and 26 being the current
> supported ones. To get ahead of the curve lets enable 26 as well.
> 
> It re-uses the same brew list but also attempts to work around python
> configure failure by setting DYLD_LIBRARY_PATH:
> /opt/homebrew/opt/expat/lib/
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> 
> v2
>   - call runners directly, seems to be working now
>   - drop debug lines
> ---
>  .gitlab-ci.d/macos.yml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

