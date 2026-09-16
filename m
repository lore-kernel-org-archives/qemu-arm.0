Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B305C982C9
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 16:32:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6sYS-00017L-5t; Wed, 16 Sep 2026 12:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6sYD-00014U-2L
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:32:06 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6sY4-00068U-1m
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:31:56 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GFetkS068918
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F1AREO69r44NgyUYJ7+qw6Vd+ao2yR0xyMzMBwd5clQ=; b=OBHxsmdlajPNH2yY
 joFfVh02B3jrkJKHyaATvVPyAPJHY6RvkJEZPzMwzFEUuaQ65lKX5aAyy8clKEBT
 xaaTQUYfdZ1aUEugDLs/BvCXVB1FzEalOvMHTYvEcMPe3Aqe/0JpDi74kuwB4/0J
 Vn97TDKlnO/eXvYmAoj+2CsI0KPaBAqFRTkwk+T7xur7epc7drOHIWbUsB7H9+Sp
 T9li3OiTCo430mx6Y0eGLncQuvfuim2khHSDnibdq6+ajKzJeQJhzF0dtIxxmCdv
 PjSl2ZakaYgFCdsqnVUQmi+E4tAqTh7rcq4S+d15BrZOYg/asS2kpIoLMfMwoiKb
 ZUJ33A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpc7sn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:31:49 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-4a49f09233dso4344945b6e.2
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 09:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789576308; x=1790181108; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=F1AREO69r44NgyUYJ7+qw6Vd+ao2yR0xyMzMBwd5clQ=;
 b=BvDw6euTVmtrdRvG7qsfrjaj4yn9jz3YD7cbJ+xXX5t3F7mK4C17tYJCosu4GOGbRK
 OmDXMlHUCyz+szQ25cl0y2dDtDkkvOfxmncylfUAGgC3JLYuErzarJor3vU9SHVC987H
 hMXVQXu/CMI40RR7lcM6kL2KYdSJXpuY7m8xHO6fJU20Y6zHCuNmKL5GLaPx5X8vY2CF
 PgfFh1ZEOyEI4GAMZ5Oi9bfdysQMIlMFLS2IZalOm5kcQ6pw6MvlV8f162wwvpU+7NhK
 17vcg9tfubwpc1YBM35lm2t8u8BE2dmlwJiDyJZPis/rG/6h0icubGenrcLqIZfp3mfj
 VMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789576308; x=1790181108;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=F1AREO69r44NgyUYJ7+qw6Vd+ao2yR0xyMzMBwd5clQ=;
 b=tTlLcs4K7crxEiPDFxwGeYXO4/Yf95FWwn+upz83sYUof0dDcuWBu9WAtssn/vMYyu
 1GsXcRCKg7avphEISJxr9siMiPF1IEkT5g0GS5PIs5vDQ3bbYnfq2AEF65irtaCmO1rP
 e4KNvpT3E2lFMG6HphLCFNtruwZRHkYJUELBGaAnSWi6iuha95hXFP/N+dhDx5t5pFmc
 E0mkSfST6ARqf1Yj2MSIoc/gZJzjflGsSnE52/DQlkyLWagBa1HuN3FZkUpvXqj/2O2D
 s/FWtm5aLCEserOXJOlHbJt8n07DmQUXAft+t3cebPikoX3MSTXnOgzcXkGLBM5eGGTI
 QoQw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwuVbD2BpyoaeSGVj1TfWuEnydSpjGA4xoIvGl0t8DT4cFisrcGuFeGtkItrwIktbU+yY+P/IuIow==@nongnu.org
X-Gm-Message-State: AFuF++lh9Q0nr0vc6UWxh7tJu+jjdFxA6HLep3dbi8J/QNtYRv2zCAqx
 MMolDHZm1zaX+ck4WDqZPoaZLTC4aAf4WMD0H2MYGlO+FkeO/2npiRFn6ZSsPIzGutqy7jjz9Zb
 n7nWeIfesyY1oLTP7Wn+JqPaxjGu4tmf60QPv/rCG33e1ubvEKfn1Wfk=
X-Gm-Gg: AYBFou3poKsEk1MRo/pPwLw0K0mHij86+fT5ZCWoBK/fiZSkCMxw2dAYRBiEG5upYoa
 jhglmnhRjxXkp0ranvj1O+ERlabud8muPgLN4uOn2ixv82Fvu67+nb6ZxyLodGX7eBqekdNqXf4
 g0pnWUyTyQw36aatiwXa3O8bynaAlL8uKsgbQab0ibwb2UFieqt83rQycq9aYtkx3ORWP+Teacx
 nt8ibLYQJe59savHm5agNHhBiYzeUCK7MkiUlLqNvc7E468HzUU6Q5t4nxwTnoqJnFsW+oQIMB8
 7jogdAILConecAUGNxVlJY3oM7k6x4rMH++K1qIWm2haOAm6fFfb2ZLk9lGdB987jfexJIucHc4
 dlzc0Ic38gEkZ+srldbufC9P9Dy32kd16MPsbLUGkm3I9uuAzXng699vSSnG3R9kDr5l3
X-Received: by 2002:a05:6808:1903:b0:4b9:a88b:888a with SMTP id
 5614622812f47-4ca4c49bdebmr3404457b6e.32.1789576308602; 
 Wed, 16 Sep 2026 09:31:48 -0700 (PDT)
X-Received: by 2002:a05:6808:1903:b0:4b9:a88b:888a with SMTP id
 5614622812f47-4ca4c49bdebmr3404396b6e.32.1789576308041; 
 Wed, 16 Sep 2026 09:31:48 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5a6a1a5sm9559834eec.5.2026.09.16.09.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 09:31:47 -0700 (PDT)
Message-ID: <65a743c6-54ae-4e2c-ae4d-08e1d6f87ef3@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:31:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/19] Revert "tests/tcg/meson.build: implement
 ./configure -cross-cc-* options"
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
 <20260916153013.2134555-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916153013.2134555-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyNSBTYWx0ZWRfX2bCezdyUc6YR
 zLV8IPTrVksxSRk8bxh91EEoQ8GAj4PHTvZMniqSciQ4YZoYM0i0M73GtWorGNWBq27SZbHyoj3
 kmCPzA+INhJN3+FFIl+MlFTCh86AVKs=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaac475 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qpEU-adqf6FSEL6AZwUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QZOOAxitPnc0F0X6Ipj3hJBQEzHE_VTB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyNSBTYWx0ZWRfXxgev3LcqOJqK
 LIKGqjG1Ydc6CAQmMaoXVOgeueW/h33yL1CidJdgPhnhFIpR5ig27UDmMl6GcfryycHldWAqn7g
 mz05X8AE7an0RrEGeDxgYMh5ARgX9ccrK3WiOr4tYXFPTFO/mO3DlAmihAIdCqCKiEVwECL9tiE
 G1PK4ZVVhfex0qhjGKUFQRcHUuWRK3mEFATTMoVAqiRkt9zudOcJzi2Y2jcwneIMvQv4qTMJk3e
 kYcT1sk+0kzdXK8PtMbhEhUgSlEU1boBxjbupsrimQ2Z+/R+DxeScJ3BFwX8ZaU0pt+Ky+iMZbv
 pEKa/pNzL6W0Uk3wVInAV6T24BxvH3Y7OQMsx83LyzYjpB6q/ZbBJbXxjNTEvd/Yo6mGwt/I5rz
 4w7Cn2COBi8ecfWuGl09C+byPI+PzfJKUUUntqDsdRfsWH6jzW+4VmAcoEVb8utjv20WRxTpTCt
 3pksqFhvJVh5/q2hDvg==
X-Proofpoint-GUID: QZOOAxitPnc0F0X6Ipj3hJBQEzHE_VTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160225
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 9/16/2026 8:29 AM, Alex Bennée wrote:
> We want to keep configuring of the cross compiler within configure so
> it can be used by the firmware.
>

Would that be possible to add in command message that it disable effect
of those options for tcg-tests?

> This reverts commit 7e1d54da6faf10e1fc70f6b3d8247068b80b1597.
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>   - declare empty container_command/use_containers to avoid unref var
> ---
>  configure             | 31 ++++++++-------
>  meson_options.txt     | 89 -------------------------------------------
>  tests/tcg/meson.build | 31 +++------------
>  3 files changed, 23 insertions(+), 128 deletions(-)
> 

For the rest,
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Regards,
Pierrick

