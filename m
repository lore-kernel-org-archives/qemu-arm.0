Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0F1CD6E55
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Jun 2026 15:58:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wU52K-0001Kk-GG; Mon, 01 Jun 2026 11:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wU52I-0001KP-2z
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 11:58:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wU52F-0007Qx-J9
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 11:58:40 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 651FZpuQ3372581
 for <qemu-arm@nongnu.org>; Mon, 1 Jun 2026 15:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lgPS1Aokeutc0awr2iH5UOBGjTYHZGfCMKVKhPP/HOs=; b=bQoap3qklYcYeRZH
 nxe8Ig+lhxk2rS2aspE/YaVftC6EV05fJdB4bM9c5wEtWh5W6r/tuIXLk1AX+ieV
 /WN0XHFEeX12Ia61Hu8TKPAgyTISg8BBvVuhXGQTt3NOixgutZGYG8Tnib//8y7q
 KPeMYPWK/wNnjO3WShRUrVJxgnwyW1sxARMZmE9oabsOBcgbWjuyHmD5Fnw1BVqW
 /L09ZCx04tn8TJgxiFD6sXOnIW+z9OQzvRkC6QqHNhGN8mjlkqlt4kgWMcFb5IWw
 +A7Yvb/IGYEDbA7frYQMVFNJpNygibGAKRlX3dBF/shMr1DTy9VjIfGdktzTzpeA
 92HoAg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jh9kt9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2026 15:58:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304df51ff3eso4290549eec.0
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2026 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780329518; x=1780934318; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lgPS1Aokeutc0awr2iH5UOBGjTYHZGfCMKVKhPP/HOs=;
 b=TOnRBQMdDImx39IQCcWIDFXfYj0FIO82x5BrwovCsIkPWL5H4o9tfSRa7AMMW2qE8Q
 GOQvFM5WWGWG9E//erkiRtxG0Imhla0+WEiaCGNv1ajk6+sjgmlCdcsMfIaqkWgMQUbX
 9hKSm9yt/jLFAjHDukeIAmppjQbQo+DoR0qqtAqjUWy/4WxYWBQad+7XoxhmOywhhMYG
 IdxQFcNsybAF4ib5r6yBQBKK/BWxhsnoQbAY22z/jL4adagpn8PmuqazdKSwSwjTx//r
 0ueWH/+tlMUDGdYGCnvJAsa34Hgw1XDnuEYDB2Dg+gOyNJ5hdK2518pHyTgrGNVAww2H
 3xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780329518; x=1780934318;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lgPS1Aokeutc0awr2iH5UOBGjTYHZGfCMKVKhPP/HOs=;
 b=kqcC90EN/xj4mgCqtil+CdE9T+67WqJi9uI/n+rw+a/4wS/g2TAepGML/smNsCfnhl
 Bub3H9GNfpbEp8/Uik0SKiy5RJl6sb+Qk5zRzJA359LZJ8VckZYHVtSDRlqdjULYHohq
 sC3iilB6bQYWCEmuW487JhGtGCCVN1hGrhu3e2wAoXYaJdj3ig3nX+B4dd3qKmxtAOfc
 Y576IeL4su9alzEkQrosN+W+e81eKE5XywTCdrioRpNjYCXlxm54E/ivZhBj5L+Myo7A
 fA5uGIcEPAcp/T+plRLCNbTH2xcH+bIYGOjw+gIWxvaQthedKWXqI9DQKeVn/W+9O/oX
 JqkQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ979wrp/5tfvBnOkvEIjjS4JfTpgpJim9Re6MWFO2yN4+Ny1jzFvW1vi3tO8H5xWfw6F+sIGXM2Aw==@nongnu.org
X-Gm-Message-State: AOJu0YwqWQH/DfhtG7XqVeNO+e34Z2rqV7BP5QMbIz9NReeprjY4s9Pl
 DFg69MA+a+Cf6lSy1QIsYL2npt80fGPkPbDNIbFnbjphxHlHqeZwbrdNocsPhcwavC+2h7EKX7B
 RNrSX+DgVvhNzUbKzq2bcIemNVbxaDaj+y+5Z3Lntyo1eQ0I3kg77z8Y=
X-Gm-Gg: Acq92OGWWiF/PK9KR2yRxiNzCwRN0uve00E23MKos0WEIAsBkcGYDuQm81o2LNkRdKT
 1Z9NvasR3SKRAxtloCEp3y9fNhPP5zQbZB2Y10vaufqIG6MiGwcjWU8j9VBVtMldUmaW5Hwsk4C
 SNXMX8oe8mWy3KiJQeoFYbZJs1um5AoSnnV/VG/plKBNk62M2nXrvbtz2bCqBuHGIMIdevsYpD9
 rKtO8dEYtpr58AfBYCz4XrkcL3RoJouzh4uSABdgsCj0CDlDAmpydIxwz79x+ybmqjUW8Ksx0ge
 mSfMhk38w6cNc/bxgFx7uycChU7SdRIhEOzSUgAUW3NNI/ISiVOm5fnnDw/hpVi8/dchwjfbMSo
 pBc7iLrObL+Z7ohL2XWpgXqCwAu9UHkv/P2ZBiS8orKykF8WfiSuTkYkxWJVnMojIbMDOp1Gafg
 aLDvRt9RYtjzKMiMuiwL7a9jZ1
X-Received: by 2002:a05:7022:61b:b0:134:def6:e73f with SMTP id
 a92af1059eb24-137d40280c5mr4553204c88.21.1780329517500; 
 Mon, 01 Jun 2026 08:58:37 -0700 (PDT)
X-Received: by 2002:a05:7022:61b:b0:134:def6:e73f with SMTP id
 a92af1059eb24-137d40280c5mr4553179c88.21.1780329516957; 
 Mon, 01 Jun 2026 08:58:36 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137b36c6700sm7056007c88.6.2026.06.01.08.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 08:58:36 -0700 (PDT)
Message-ID: <57d0477a-3bbd-4948-8e18-33df41991545@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 08:58:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gitlab: work around the inability to build targets
 for MacOS
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Cornelia Huck <cohuck@redhat.com>
References: <20260601143129.144786-1-alex.bennee@linaro.org>
 <20260601143129.144786-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260601143129.144786-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HPbrZW8TE819PoJics1UMcaHG45epZyj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1OSBTYWx0ZWRfX7dubo/K7bLD+
 aVpkZiCIIvkrwf9A64Co/qFPLRr16DdrmRX8M3+7tWY7gr5pJt1uWolq489Egsr/g0de7tOK0Nl
 Y1YA46QtLXEtI34lZyCTMJ/FfoQNR/9EWhpQ9lB4eBM6l9TsBBOABOoP6UWLGedMXrPmAajk7Dm
 7BoUBlEMMHqQfhEUiHpa9xUSeTjKTxJC0sdEiitfVdMolP8pRfwwEqeMi2Yjz5c2fQgHKx1Uh0U
 ViEGwtwwiUacvA13eX6EQaATErlNH8z+M6iLxn3/wC2P4nJLL6Gahiktk8DTuOv4hcXSDwLLX0e
 zsAJ209aiFD2miDEXzCklksJftn0lDMi77oVxEyt1W5qBEZBulgLwqRyD7xpN0nMpOWUqos1Xst
 rzSqJYGbOnqnwcQVnY85CTpOBpPcOiJvrZ2n8qEdIk+T1Ngun7u75EIQYMRu1c/zFBhNBokx96L
 /arJp1ntBDP45KYRDLA==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1dac2e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YHQvgl54SCjNhz-QoLoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HPbrZW8TE819PoJics1UMcaHG45epZyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010159
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

On 6/1/2026 7:31 AM, Alex Bennée wrote:
> Unfortunately a previous fix to ensure .ninja-goals was set for the
> TCG tests broken the ability to run check-functional-FOO. As we have
> now reverted we need a solution for the MacOS gitlab run. The simplest
> is to add an explicit make invocation to build the signed binaries
> before we run the tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/macos.yml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/.gitlab-ci.d/macos.yml b/.gitlab-ci.d/macos.yml
> index f61750a3f4a..8366b4ad564 100644
> --- a/.gitlab-ci.d/macos.yml
> +++ b/.gitlab-ci.d/macos.yml
> @@ -29,6 +29,7 @@
>      - cd build
>      - ../configure --enable-werror $CONFIGURE_ARGS || { cat config.log meson-logs/meson-log.txt; exit 1; }
>      - $MAKE -j$(sysctl -n hw.ncpu)
> +    - for TARGET in $TEST_BINARIES ; do $MAKE $TARGET ; done
>      - for TARGET in $TEST_TARGETS ; do $MAKE $TARGET ; done
>  
>  aarch64-macos-15-build:
> @@ -44,6 +45,7 @@ aarch64-macos-15-build:
>          --cross-prefix-i386=i686-elf-
>          --cross-prefix-x86_64=x86_64-elf-
>          --disable-plugins
> +    TEST_BINARIES: qemu-system-aarch64 qemu-system-i386 qemu-system-x86_64
>      TEST_TARGETS: check-unit run-tcg-tests-aarch64-softmmu run-tcg-tests-i386-softmmu run-tcg-tests-x86_64-softmmu
>  
>  aarch64-macos-26-build:
> @@ -60,4 +62,5 @@ aarch64-macos-26-build:
>          --cross-prefix-i386=i686-elf-
>          --cross-prefix-x86_64=x86_64-elf-
>          --disable-plugins
> +    TEST_BINARIES: qemu-system-aarch64 qemu-system-i386 qemu-system-x86_64
>      TEST_TARGETS: check-unit run-tcg-tests-aarch64-softmmu run-tcg-tests-i386-softmmu run-tcg-tests-x86_64-softmmu

Could make all be enough?

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


