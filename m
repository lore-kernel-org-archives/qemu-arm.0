Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E54FC982C9
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 16:34:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6saC-0002sm-EC; Wed, 16 Sep 2026 12:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6saA-0002re-Mv
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:34:02 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6sa8-0006cf-IM
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:34:02 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GFeUZV1855070
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xu9BucOMThpQE135nkEPejiy0LPsp3beGuKiO06zwy8=; b=iWNJpdgumjF8GX5e
 1CoYwVFUoGhZq8TK2zc0fSMPI8ngz4eXXvlC4wtZmSmqQbHW2MyzGm/b0NiJA0sE
 9BND1K+uR6GfZmwf1Gx0NoJ3rzhbCUfaDJx4s4zTTDFC2yuzaHQW/TlnIt7CqW6H
 D1Qhjubdyc2uX6+ybQ3s6LpRRlZMAlxry91QC4sUxhg49ewYS0CIZN0BSS48QVrE
 QByFPvcn7DnUqT0fl3O6GLKSvEctGt/9Bn/KXzZaaIeIu8CgM6Xj0dzArjWWQOWW
 GdunpfrlzVJN1keRu2tTPefgg53SjFdmfYSDptvUqHpekIf27cur6Ze8R9B077ES
 tiWAaQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3t2dt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:33:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-86a880e91f0so10030657b3a.2
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789576434; x=1790181234; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xu9BucOMThpQE135nkEPejiy0LPsp3beGuKiO06zwy8=;
 b=iu5l0hxt+CtX7x6FYdWviSXMEmcR6UwHAvaXBp91K0nLlua07y8mBWCE99vCJA6x4m
 yZoGuwakGPoP4ONeZHWEtKKXTp5MYMNebHlx8LcWd3acgMwUnWhDynmJW1gGhcQZgisA
 Q4s5MFWJJvDxCAlIeIVthyk92r5WhxBSQwffM1ayMBbLfBMJ3Ijpoq39ix+W5za/0hEe
 x7P6qaJig142lOdw/vAVsgpN3GguHc2TIvLUI+8jlomEe6vVkCLzrjGZRZj5e2kJcy23
 /0czybOHrhv0pRNxpkFm0AIHJPhdMc74FHiMm8H8G/LnkaByzBXZIKIi2AdFlQddHkX8
 1t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789576434; x=1790181234;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xu9BucOMThpQE135nkEPejiy0LPsp3beGuKiO06zwy8=;
 b=HfvdOHP3Q0l0/PzPH4Ly24gEvsIqmhei+Dp1SyZ3CzqThMx49UKd5Nb+TP9iu5r3BJ
 Xo6kMwmnXqybuu8fOrKSNbQX4cdobt9eurDmCJ+EeebWNCE9TUx2GTfHtYS37fSum+tH
 TvmBW6ix7jtYlTaVUCRjLUxHBRzUAZMn/WPN4ZgfVoedGCLQCkR2L+/9jZHiajlqORhl
 YXCS6o/2Wi9q6+aKvzdNYLzt63xoSc1UBlbsasiS3IdenBP/VtC3/lMnWz/fYIdI7mJX
 DdfCROEGa0Ii5Jpfl3iMGy5qTcpbiiqQ/ywykzVEc9eIXSkJ74Ov0+0ogqF3sx4oCer/
 MZnA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw0B9hgSJCUkS3aiD7jnoOGKOGS3RDL3Fo1F+8DA8G05SijerSbh+zQ5f0sRfpz1IuevLCtrnZDVQ==@nongnu.org
X-Gm-Message-State: AFuF++n1wPHCWRKXsIaGFRpacw/L99+MDr+7Z0HTniXFFJByiglDdirq
 6qfGIfSVdzZTEoHOWDsCdMkRB1oan2cbuiCC33WlPA+xz1bzNd9oYHkBvKoi//GUVr6WtvJPnf/
 oHx+s6PcgkaaArH3qhnmIavb+gCNTkO1hOCVjrOoxOZlQNZh5U0XQ8Ag=
X-Gm-Gg: AYBFou1NaV/5Wmz6aOajYh/CyspYCfPjGKXL4xGNPw9jMVXc2YjEhC4nemFNMMNR288
 3eyUl+BR51KQk4ekxL2Yyf8P9Bbo3JUVci6XD7LlBtVo4mJsdYoNvEv20VaKsXmrsS61b1UiO1G
 mzdEkn6FVM7q2MIymSvbit9Ku3jm+N72DQSJipq+3C5RzpVnh3uAjb98rX5PRo/Pe2k7tZSgGa8
 9tFkk/qzzqp6nOcfj65OqRPVi1NMmmoD6J43ojmsyG2xkMAhUPUUV0NolmbM9S6qjIstzqnunz5
 JQ/Pu+T0Gl5s9keePbWLQ2YonQ+aoewiK+q/x7iifzIQm/e2rxb1S6NeLdedNnUqgSSK0NNysZL
 LBVoOB9vohwBzsMFQa6osPamFZVwU8rKPZffr1SCZbUZgKni1uPKSB87lK1Qq7mnS1nGQ
X-Received: by 2002:a05:6a20:748d:b0:3c3:791e:5e18 with SMTP id
 adf61e73a8af0-3dd5f405d6cmr7427563637.7.1789576433723; 
 Wed, 16 Sep 2026 09:33:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:748d:b0:3c3:791e:5e18 with SMTP id
 adf61e73a8af0-3dd5f405d6cmr7427483637.7.1789576433295; 
 Wed, 16 Sep 2026 09:33:53 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf596e1f6sm10434898eec.1.2026.09.16.09.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 09:33:52 -0700 (PDT)
Message-ID: <ef0cab70-4f36-4de1-bfdb-18501d801728@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:33:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/19] Revert "tests/tcg/meson.build: implement
 ./configure containers options"
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
 Richard Henderson <richard.henderson@linaro.org>,
 Jared Rossi <jrossi@linux.ibm.com>
References: <20260916153013.2134555-1-alex.bennee@linaro.org>
 <20260916153013.2134555-4-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916153013.2134555-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyNSBTYWx0ZWRfX9pqKjxfpAjUP
 HMLU1QG9ixiLki4qPBq5my0E3b0jCPSG7xPc+Hml/uLGIeVyTOwx9hdj2sAi3+c4X0vgTanzpsm
 8jmd2nbxI+OcMZrLuQsoMtk3U/I2+NB2lYpsDBe0UHTUYuhVt5l5HrQZhDt6sZjpQNZ3W9KUV13
 4hpGUUiMeOs7hCsR9D/QeiVhmiL4efQiA7dAzcGOLfS/TXFUSX69oCRR72liQC9dcVITm3zZNTj
 8rP67tuZC03rMRDOXqVDk242YUbRmJvWwlFbGnHbwMp7xegr8C7LPdaw1Pi5UH8kn8k3HODwVPJ
 n6OJQNvRiYq5kMGax0Bm90tDVjoX4u+EmBLU1aEnO9R/2Sp6jvL8RJ/tFTPg/I/eToqT3cnzPNx
 7ZTCz5IGG7prilQPj0mR72CzO6XyakbRnowTxU+fMDe70CkgJBF3Seyn4FfWozOoAKSyvJP0hsy
 TCiM+eQWzWS36iv+JsA==
X-Proofpoint-GUID: 3Y_mb7UrNsDNGjfXoAu02cSV80AElD3d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyNSBTYWx0ZWRfX7ctd9a5MbegI
 zmGx4ysrYmkFUP+KdIy1/h08CSsHimRayYOt/NUjs12r3sqwekvyslOK8+VBBGT8kjYCZeXocH8
 nzNOWNPx15UgYs4jW6kEe3Sd+57k3AQ=
X-Proofpoint-ORIG-GUID: 3Y_mb7UrNsDNGjfXoAu02cSV80AElD3d
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaac4f6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VnNF1IyMAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8
 a=p0WdMEafAAAA:8 a=7o4-j5qfEsKhPH1t27MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
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
> We want to keep the container configuration inside configure for the
> firmware builds.
> 
> This partially reverts commit 522b299ca4316d8cad57f9496ffcba87dcc20719
> while keeping the plumbing to disable containers within meson.
> 
> Tested-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> [AJB: untangle changes since]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Jared Rossi <jrossi@linux.ibm.com>
> 
> ---
> v4
>   - tweak revert to keep disable reported
>   - update commit msg
> ---
>  configure             | 14 ++++++++++----
>  meson_options.txt     |  3 +++
>  tests/tcg/meson.build |  3 +++
>  3 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/configure b/configure
> index bedde58b8cf..6084a7a065e 100755
> --- a/configure
> +++ b/configure
> @@ -260,7 +260,7 @@ ninja=""
>  python=
>  download="enabled"
>  skip_meson=no
> -use_containers=""
> +use_containers="yes"
>  rust="disabled"
>  rust_target_triple=""
>  
> @@ -727,11 +727,14 @@ for opt do
>    ;;
>    --disable-plugins) plugins="no"
>    ;;
> -  --enable-containers) # enabled by default
> +  --enable-containers) use_containers="yes"
> +                       meson_option_add -Dcontainers=true
>    ;;
> -  --disable-containers) meson_option_add -Dcontainers=false
> +  --disable-containers) use_containers="no"
> +                        meson_option_add -Dcontainers=false
>    ;;
> -  --container-command=*) meson_option_add -Dcontainer_command="$optarg"
> +  --container-command=*) container_command="$optarg"
> +                         meson_option_add -Dcontainer_command="$optarg"

Not sure if we want to keep this option (meson container_command).
Related if in tests/tcg/meson.build can be removed also.

>    ;;
>    --rust-target-triple=*) rust_target_triple="$optarg"
>    ;;
> @@ -1718,6 +1721,9 @@ echo all: >> $config_host_mak
>  
>  echo "SRC_PATH=$source_path" >> $config_host_mak
>  echo "TARGET_DIRS=$target_list" >> $config_host_mak
> +if test "$container_command" != ""; then
> +    echo "CONTAINER_COMMAND=$container_command" >> $config_host_mak
> +fi
>  echo "SUBDIRS=$subdirs" >> $config_host_mak
>  echo "PYTHON=$python" >> $config_host_mak
>  echo "MKVENV_ENSUREGROUP=$mkvenv ensuregroup $mkvenv_online_flag" >> $config_host_mak
> diff --git a/meson_options.txt b/meson_options.txt
> index 66d3689d14c..daf301ed48a 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -389,6 +389,9 @@ option('rust', type: 'feature', value: 'disabled',
>         description: 'Rust support')
>  option('strict_rust_lints', type: 'boolean', value: false,
>         description: 'Enable stricter set of Rust warnings')
> +option('container_registry', type: 'string',
> +       value: 'registry.gitlab.com/qemu-project/qemu',
> +       description: 'container registry to cache from')
>  option('containers', type: 'boolean', value: true,
>         description: 'use containers to cross compile tcg tests')
>  option('container_command', type: 'string',
> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
> index ce208e686ff..890da7b81e9 100644
> --- a/tests/tcg/meson.build
> +++ b/tests/tcg/meson.build
> @@ -101,6 +101,9 @@ if get_option('containers')
>    endif
>  endif
>  tcg_tests_summary += {'container command': container_command}
> +if get_option('container_registry') != ''
> +  tcg_tests_summary += {'container registry': get_option('container_registry')}
> +endif
> 

Rebase issue?

>  # plugins come first, as we need to build the list
>  test_plugins = {}


