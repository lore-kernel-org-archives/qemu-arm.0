Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B9FC982D2
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 17:16:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FiN-0003fL-HS; Thu, 17 Sep 2026 13:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7FiC-0003PU-FQ
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 13:15:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7Fi7-0004CT-O3
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 13:15:51 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68HH5W4m2887094
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sDEIPvYKyNyT/2/HBHIdky6h30jGWEfDdxTFyPGViJs=; b=jpmgSYmzGcAfj1TX
 Mf4918LiV8ZhdbqYnB/YZ6AFki4ZK1+eqZyY9ZRgKe/PrbvUVQIHwRHHN/VnSeKH
 F6LrURJIENr0T7/GnilcVjn9c0hc57WqfnulNHCwi6hVWt81hJkpOJG+L8t0wu6Q
 uopJ69Cbplhc/4IMDS3CXd0a3aUJkXvETMJesAnAp/2dvJmA8vr/nk9Y/T9+nYIl
 tFX83XyDAQB3Px8KUQYM+nFRCaRvAQgA33WBiOmgP525t9j13EDe2TfHjkb0J1im
 WCw3zLouutv+LPlyErL9Au6N2v7XNe8MGW/v4jGa2wyF6Tm95f1U+UMGwhvCza2w
 uZHrMw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6gvqb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:15:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-cc4216aee8fso1400565a12.1
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789665345; x=1790270145; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sDEIPvYKyNyT/2/HBHIdky6h30jGWEfDdxTFyPGViJs=;
 b=GuE8GcOc5Eg2pY3FW2x0hUyMGzWtvaHgHHhgfbZGCkn0sDG9dgPTGQFNcZUREuJ5QI
 KWM2TISvCpdghgN96/t7wmj6/rmmgwAA+m+2UNM7csO88ZrDZZwgE2mMi3kovoYjTHVU
 SYw4fFTRQxf384dLLT3Rt6ZxeOW1BUL13RRTNzv1hhJmnDy1DQmeuxGcDXewYf4XFJlk
 paRUlKN4BBA9fMuSOnoDebyhOsR4UiEp3O3u3UV6nv6E4mATEFq1U1JgQiKf8hjdbYZS
 FQtYwDiAMADqhuY004980cU4cB5/NJeUdvqQOvJXaGNbyeCMIURsAu7dTVKLdhiJp9g7
 lyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789665345; x=1790270145;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sDEIPvYKyNyT/2/HBHIdky6h30jGWEfDdxTFyPGViJs=;
 b=vinDtmJlGNZiIG/6bJaaJff539krvtDjT/cvIFep8HV8Ke0vXY/CdeEMgkxNz69GZO
 fE9I7BnJI7MYZmcjZUTf+Hq2LKFtNAgTxRMT4ynrK8SfipUqNOBrr6pBCgKH/d9QZfXI
 nVKvMTByXE43PWVgd3WeKPYEUWZgS7B/TH4MvcWB6CPoARRD6RJ5HRWVZeEkgaC9p34A
 rdhISgP/Q/SVgEttQYwy3RH0TwBXj/sqyOmrliKRYFIfSq4f9wyybwoMWj9raKumk47t
 mfcEbkELk0TbPhzQSMVOQDwx7WXKU2vBSuZ86I/cTM1LZ10l8rlSrActOOiNk8ataZD0
 aYCw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzHxe7FpQyMQ0OhhdRZk7O4laHhbE0Uhvid3N1wEMO5tD2G4tpPJ+fskMDBgEaIkmBmrJO9DwvMDQ==@nongnu.org
X-Gm-Message-State: AFuF++m8akGW46yRs/8zxNBV3Ps/v2FPLnlDpt18fwZRZ7qwzFn2+skg
 s5+mdbhQm+RSDMxPzMdU0aq/YT0ewTu3KqR83rl/3opKw6vg26B80Sj1B1DbET2+v4BaU5E4PO1
 h2lYMFC80PeYv7V+ubbpUt5XS59+auC91jGhEkzyjgj1DoJyubSWb028=
X-Gm-Gg: AYBFou2fCOJawf1c1uAYG5ucId0uTcES9Abt9UrTZitsoYJehVeQoBZJGdA0CpqNnJT
 FJKCERO0YAP7PWeRMcoOGUoyvuiHTEy3weQAk9jcoO/J0jnvyr1LCD00E0WiPb0aJbOvtoLUTaz
 iV37qn69BOC1eGsZZdKMx/wwU68R0GA7f1oR8m3qc1Wje1t6sNQ/jOYE5eO1YuQBz+XAaDTtTOL
 HntKTJ7klscGG3Ct6TyZEsyx00EOnRlDSG0F9pJhw2d5NVu8M/w7sxs9cR/SOyMhTRTEBEoyuAV
 gwaKObuVM8IavsuAdJ25kcdgosDmHcX46orCRCHckvaXsHRQDf64LUI748skDtAi7mvAD3L/k8b
 j7XLq/XVeK7f8txf+55DkW8Msc8cVBk94RcwS/E7IYki61GnlNyIrTa8xfGKu4MkXXwtq
X-Received: by 2002:a05:6a20:244f:b0:3cd:67e9:8565 with SMTP id
 adf61e73a8af0-3dd5f40b753mr17273269637.9.1789665345456; 
 Thu, 17 Sep 2026 10:15:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:244f:b0:3cd:67e9:8565 with SMTP id
 adf61e73a8af0-3dd5f40b753mr17273215637.9.1789665344899; 
 Thu, 17 Sep 2026 10:15:44 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5b030aesm17206653eec.26.2026.09.17.10.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 10:15:44 -0700 (PDT)
Message-ID: <c22145d9-ad2b-4120-828a-e1497ef25539@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:15:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/17] gitlab: drop check-tcg from clang-system job
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Matthew Rosato
 <mjrosato@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, Brad Smith <brad@comstyle.com>,
 Kyle Evans <kevans@freebsd.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
 <20260917165602.3405537-18-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260917165602.3405537-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0NiBTYWx0ZWRfX7pH1ia0pvXV9
 6yyyvgpw5/sTnL6brwVddgsR3rI3WzpmHvTqqraqtQrVVDFXdu0ufVLGrE/p51+q0D4qgNRclgH
 LFR+WbWh9KzNbmFRhS7oHy4KqekwxcUF+7yc16bU5j7z5ilgIILl0rakh0SuvCnPdSphO7DEpXt
 22nlUrQuFbn5Gn+u2h3gLYG0A61SZ/Yy81vPuUFnl/PXj4i97quuqn+1OZkCVBiNOmEfON0gY83
 IAeeAmb6fq7JfeoIgVS8jvF+AKALi54IJ98wZQvkXjvePt1Wb8nkC/vYAz70TYO2wZnez52a3w0
 NV9dCvEho/xuYirHHCr5hcN1He7OfkWvdCfws/1zni4bVs/Rp+owON4LNoUUs9fRFBMk3609XFL
 gDHkJBPanIxUPkrvY2o4gZ8yni/bR9ZHuVky2LAExcC0uTotXJyhhu8LlomAI1YO9u1VWKivNpC
 PTBkEJiKoSJr52JF6Kg==
X-Proofpoint-GUID: 08RRiLG-RA3_4rHzZ3HjY3tc4fVWZITH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0NiBTYWx0ZWRfXzxPArTl//BXG
 17Ib399pbxnjjPzriJ4J4ZdY6tyJdIV1SMSqYKErq3i98LR+Rl0AkOezKfM9mKPEGiN7HGd8cvJ
 iquUjxWOX1/tXHtufkIJFTuMZQXdeJo=
X-Proofpoint-ORIG-GUID: 08RRiLG-RA3_4rHzZ3HjY3tc4fVWZITH
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac2042 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=e08o81-_XzgC-ilA6U8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170246
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

On 9/17/2026 9:56 AM, Alex Bennée wrote:
> We have no cross-compilers in the fedora image so don't bother trying
> to run the tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/buildtest.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 5f21703645b..a97cc0b20b8 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -441,7 +441,7 @@ clang-system:
>      CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-ubsan
>        --extra-cflags=-fno-sanitize-recover=undefined
>      TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu s390x-softmmu
> -    MAKE_CHECK_ARGS: check-qtest check-tcg
> +    MAKE_CHECK_ARGS: check-qtest
>  
>  clang-user:
>    extends: .native_build_job_template

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

In the future, we could use clang with -target X, however most of tcg
tests don't build with this compiler.

