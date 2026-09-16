Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AB6C982C9
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 16:42:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6shS-00054C-AK; Wed, 16 Sep 2026 12:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6shP-00053c-Q6
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:41:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6shO-00088d-5b
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:41:31 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GFeRlN3233347
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6qPigUD9fIsyQC74evRL8+c2D6v/j8LAmrNKWPC7+Ac=; b=NjKCLxAzW4Z2us9G
 lAts3Q/uv2nHuWXsvSnQi96apX2fPrm18pi/unNJ8cs8e1WzunRA/ARCamsufbiv
 ux7Q7RPx/ApuQ6qM+6YrKTDpt5n2srO4b7ve/w83+cwJuMpKWUwEizSe3cjjrncJ
 /79QeS+gXirSSpEr7HHUv1MPgMrjUyBkERe8ptxhh5dh3n18F/hfIxc23jDG31wG
 5lzMzhtnj4pcYoTkd3Xiwooo0ej+DAxwPaRHbF82DfuDV+TPijwbsv3aF8LXqsZC
 +cetyA9PJe7LUL10W/HlAxKgjV7UAiEUoXEytzQI3A0OaaXlq2w80g4S+d4hIZdd
 6y0gMQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywcbxc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:41:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cc1bbd7d6e6so4804502a12.3
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789576887; x=1790181687; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6qPigUD9fIsyQC74evRL8+c2D6v/j8LAmrNKWPC7+Ac=;
 b=ha8HQzV+czh1d6hGTyWoTWTP4ixNaUk1Wlq6bgjt3nGz322lyrwtI+a3+98NMs1e0Y
 ETSnfLFskSqq4By7fA1Uz1vix7OnmcuZWOt2Ba8SuE5lZXjNoqY8xIh3ELJEesKZXX/e
 vUddYkkiA9Gb4X+e+L4EeMtvefrH4fInf4chY9Yya3HyT8myifITvjyaspmLKNT962Cu
 XO/WNWWKX9whHMFTX47GsG/Pa6ubUt+oU21KxxZIHxfBsMgOJ+12uDchGpsy0kMb5XQi
 DfKmDtRKKC0Bkt2x44rirkiVIHV/W1L6bYUi2DOI/aOnky9XG8KPOxf7v4RFofY289EV
 1P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789576887; x=1790181687;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6qPigUD9fIsyQC74evRL8+c2D6v/j8LAmrNKWPC7+Ac=;
 b=Hy8YI6oYlS0q9s7oFcWHHVJWbFwR8rzCOuOrtZHjAmnCwUDm/JiUPf0ZzE3kr4MdLH
 sl64jH/vPL51ryK/oysTTWSlvEAPH21BYQuzqhrzxfErJAw2NtxkvFg10+hDgNfZW5zx
 6+/zAe5ZGltv4Eo6CM+fsOZU9nYRkw+7/8gHaoBC8pnm7lzVDpwe+uPn/TF5aDBRDmA/
 m0I7fUcJy7X6nfrBMc6qNiKwUiHa4cuXwCSFAJXJ0Zbg1jWp+cDXBekA/9oqMafdqn3+
 7XwUxTB6CtpilsuRmSQ+hlnfttZW5dih3eBtP+ZO1ps5yBTW0NnKEzHn1ixYukyn7ygM
 lEhQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzQ56jbaxO51va6WcfWa576utiZFWiZ1WYPSUooje0Jr4gzmWm4iXFBq+UsqnMrT16NOYbJtbSp3w==@nongnu.org
X-Gm-Message-State: AFuF++msbk96MKVtS/Fbg76P2R+y93ahgYkmtGWAtS57dH+Mvc36QZfH
 BwCETasKRgDS4Aa1CF9sFK4BO5wzp0AVlvX9yvB/HHrX0Ne0S18GFqqD0V2CsdXmLgvwecNQ15N
 4PSkyttJf2XTdUy6178sbZQeSRCDqS7ZHN/FhCY+arOqdcwgkBmK9x14=
X-Gm-Gg: AYBFou3kD9xlDhA9FHqVLnqP3UMbfJygtXBO9JqpQMTnbWXHdthP7gDzKTQ6jc+Z76x
 hDhjzY/G7Ch0x1FvhGiiaek2304nrI9obQWKxPLmrKEmyeGY2Mokiw4xF8EcoZD8Cd7f7RW7Ffp
 FLcVL6bjGgB9npRI9GH1ycALT5FJZ+UIkBVJac9ffx4mKrnZkCJu9KB5YkgVe/S8C+AQ3zJBcrj
 qxZxD845MaBTDE5KSBu26qGFa7O8GCzmDKTBCOpiwOIG0EGVGLJzvDk4tyjNRGIObuWKvUQJyGQ
 by0PxeL+UAWpCXnWvBzF1jlPQpUYgA0fUiXG65v0sVsuqA+Pb7Ey3Dz61ZzOtAOnES+gQi8O+BA
 gbiVsAcuKxqeTTMrtKFcOxsEn8xfd64TdoUXaOfrAdOTMz4zEDrWu9V3cNE+DZTdFTAQ6
X-Received: by 2002:a05:6a20:94ca:b0:3d3:b00b:26e8 with SMTP id
 adf61e73a8af0-3dd5f8123f7mr8115331637.28.1789576887263; 
 Wed, 16 Sep 2026 09:41:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:94ca:b0:3d3:b00b:26e8 with SMTP id
 adf61e73a8af0-3dd5f8123f7mr8115243637.28.1789576886759; 
 Wed, 16 Sep 2026 09:41:26 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5aa1e38sm9327051eec.16.2026.09.16.09.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 09:41:26 -0700 (PDT)
Message-ID: <85491ee1-f04f-4716-8e0d-3bb6580392e9@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:41:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/19] tests/docker: add container registry to
 configure and use
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
 <20260916153013.2134555-11-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916153013.2134555-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TF9N3n1F492zDng-mxSpfbcFOdUvf9MK
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaac6b8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=AVDwjEnD-0tbelgwmW0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyOCBTYWx0ZWRfX9P2EOc16uyqi
 woSPLtMXVhyFuOfip1w8s9uhj4c/16SGwnuwBKQ36w2QED+i3vw1rRDej2E8ASTEmgjmKfT4kWe
 kma4SxMiwEOCNWAw9AGWhta/yeB+nh8vGerwwjXU1YD1iwiKriG/Svm5hQv++6aexqVEeI8/qBw
 zuS93St5yGZMDgnWWorpc7qLT3dH4rMFTLi3FO13nleNSVNvu2ST73gBb/crAlW0RIAQQA2j+3v
 ydH17d4Av1wBsH+PBbVndq6LRojtb+jOoUKB+TObx/FXaFRdc5peDy82oiG8ldWVtjldfNnlDUx
 Cw7hwRdSoPh1QKl3gphRCAFzg5fz230kh5mMyQ6paz4H3npQS+q2JlZEVRJ16T5s2Du4vHoRmPa
 cDfk03MenWUr6A3eUAczKtENWUOnyVscOY3jVCsYSwFzt4/YRa7osdBuGFTbQ8vx928o+jJgWkC
 GumSDxuobJC+qqDi+CQ==
X-Proofpoint-ORIG-GUID: TF9N3n1F492zDng-mxSpfbcFOdUvf9MK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyOCBTYWx0ZWRfXwc2lhjjz91Ip
 ITXbGl1tl+b0GRB4dyweOUcxTy3rBKmXjOC9vF0MaPr7MEFfPjx4aii0YiQTXkQe58CJ++uNZwb
 qCX+rg5bvPB1m/8g9YxW+D2lCCahQrI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160228
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 9/16/2026 8:30 AM, Alex Bennée wrote:
> Previously we had the default baked into Makefile.include but as the
> meson container logic will also benefit from it we update the configure
> machinery.
> 
> For now we allow direct make invocations to override but for the
> normal case it is in one place now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - fixed conflicts from the revert.
> v3
>   - regen meson-buildoptions.sh
> v4
>   - merge conflicts
> ---
>  configure                     | 8 ++++++++
>  scripts/meson-buildoptions.sh | 3 +++
>  tests/docker/Makefile.include | 4 +---
>  tests/tcg/meson.build         | 6 ++++++
>  4 files changed, 18 insertions(+), 3 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

