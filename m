Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C62C5DF81
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 21:28:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wycDc-000179-UW; Mon, 24 Aug 2026 17:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wycDb-00016m-Rh
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 17:28:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wycDa-00069D-BT
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 17:28:35 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67OJH0NE3914641
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 21:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EC9i/Vs98Bl9qctb5pSeKgTJ8AFF5sc5PnkfNu49SC0=; b=d2FagLHf00childl
 ky0bWl9G91DUeCsg42UhLmdFuFc91Pdwrrci+Qsbf8iqlvNy5qLudk5buzaAwzRu
 PpOjCWjuTl0txaXdX8jKTJF0NZBVhYj2OzSAXfUpJ4LU1qnYA6KutBZhP8vNTVUL
 f33urP+LdhvwgNu7HtYcvqDY6Pj423EO2nkpRj7RZ1S/vc0jxhfXZPxQ7+wAi7/b
 93KUsVHBgnjPg0A95c6woj2IY/GjNoufa5hK3jN4cDLdKv2h/vY1t+wy927nXQH5
 5LveQc39Jb9wABewLJ8jdq1pE1dx6x45P8KAn+72+xGUlLixixRh5prEyZzDnXrp
 o1wEFg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8pkdj1kd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 21:28:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52769fc3f2eso57343701cf.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 14:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787606912; x=1788211712; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EC9i/Vs98Bl9qctb5pSeKgTJ8AFF5sc5PnkfNu49SC0=;
 b=QnQZpScnzB5fqaigQ2dS+pdvUnmZqsWTk+AhscwLEb3QNGgGwl7Q5ibM4puB7Px+q9
 e+aUfzVJwzkUbAW1tISQKwBGQiLJpXU6R6v8RYgoIN9ecShBJXGe9or7vu5VyHHTedWd
 5zKsyf7fxuD+ewQcfB9h7PhVK7IfaznSttyaqwxs4GFBF5WDmfIOQYH1Pk0Dv6yBl3XX
 vCB5jhjHV6ubCcNAT3h8oTpZw1HRCmX3M8P1IMPz94TX1G888P7insKXke2d3TbbrWr7
 6BxAN1Migt8M3P+ir9VvyB9ZpYZIGgTOfCk3JNV7kWPUS/ZtMHP60INJqzb6gYNjMBQf
 Vndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787606912; x=1788211712;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EC9i/Vs98Bl9qctb5pSeKgTJ8AFF5sc5PnkfNu49SC0=;
 b=rd5PVigbOa4El4p7EJxICNhdZ7ogPmVsbei48/ObywHz6iqprn/c+z+HrF5evOwfsL
 TFTG1lZLk9Xfd1IvDzAg35tQ6bAhTBTmH8CEv8jmcy65922aSMqWn9SbpmaiDJZNQjZB
 BiN6Rhg+luKqANQcKxFc05H5K6MxGxUZM0kueIbqHEXXNsyPqjPJvmkIfJcOUzhDNu0a
 g+2HnKBGc5NGbUMa9HaPgJYZ3QTJwsDBq/HkAOsa2qXw1g0SUPcED8+jwDcl54YlR4X4
 GlfaeIO5aizeMh1b8O09X1Xm7ELOAKPFZYEaEq5lMIjkYHKjh0CE1ELj1vcANIGGyl3j
 T15Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqwoKhwZxv0IRXwJLY/v6PM3l13TE5OETXtVHvTXPfeAVZpkmp6r/nJTEiAxrt5fhjDVzF3c2Tkbw==@nongnu.org
X-Gm-Message-State: AFuF++kN3NE6hAYyk1H4bT9zAquJ7WETVOEIDJVi0ecKdRxaFu6eCllo
 UTXNNorR5pDB36aQU6hMloyk41jo5ZJo1+gw6tGvLn53tUdspbfJR7K+YJ3IgmGwKe1VbiCwU/d
 qefjbtLxfUiaC48+Em7sp/jxsRri/J833KVvX9Hm2UKU2V8XOWkptRKI=
X-Gm-Gg: AR+sD11eMhVbE2DIeJp/q/mMARu2086xSOg2f9pEz87tL/y2xYq3JZ/IDEfONVx0g3w
 uQ5VIc/kLfRX+crONSFy+tIXQI38etRQyYE1Ra64CygMEgGGfum0yeoDEGob6/z6AtIO4OPJkGW
 S4Wbzi95s1mTpr7cmv/u/mQqv2fHniSGHqc7pST3ENoOK+p9N7vkyYA0I108WqiLAKKhtblgO5W
 zJDRstF4TIx5GwZCcsYuX72z4PhHJCzwzQZ60fv/CG11lo4Fdfv+YeSmLf6uBz6+RslVriVtmLa
 SUYm7cGVGxhVTZ5g/z9Q8rGXT3Mql11dlQ8Wb13Tj7VaoKLgc/hvtJITijxpFNTtffbrzMeiu1O
 95TrwouL++jv+YwlDw0LDsFgfVFAFR1nJTpsUh2YpQE9Gn29oyeM=
X-Received: by 2002:ac8:7f8d:0:b0:51c:257c:8164 with SMTP id
 d75a77b69052e-52df59fb802mr275796261cf.25.1787606912089; 
 Mon, 24 Aug 2026 14:28:32 -0700 (PDT)
X-Received: by 2002:ac8:7f8d:0:b0:51c:257c:8164 with SMTP id
 d75a77b69052e-52df59fb802mr275795751cf.25.1787606911691; 
 Mon, 24 Aug 2026 14:28:31 -0700 (PDT)
Received: from [192.168.20.232] (82-66-243-121.subs.proxad.net.
 [82.66.243.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499d636efa8sm7371685e9.14.2026.08.24.14.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 14:28:29 -0700 (PDT)
Message-ID: <1a491e92-d7e7-446a-9b08-53b12a930be3@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 23:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] gitlab: add arm-softmmu tests to the macOS build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, zhenwei pi
 <zhenwei.pi@linux.dev>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, devel@lists.libvirt.org,
 Fabiano Rosas <farosas@suse.de>
References: <20260824-fixes-for-11-2-v2-0-352c6b890402@linaro.org>
 <20260824-fixes-for-11-2-v2-3-352c6b890402@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260824-fixes-for-11-2-v2-3-352c6b890402@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE4MSBTYWx0ZWRfXxGbBWgq2ojqS
 2P/BVMDl+e1lUgCTAUcQAQzyLBT6AYh8wy+cxGWatNwCTOPqooxZ1jKz+k3ovL6mdz42JzUvMk5
 dh1/YsGt93ykvK2ped0ZfFfgCOVu500=
X-Proofpoint-ORIG-GUID: rLmcuv4y0G66oVNG7SGBiv2o1GWuTrvG
X-Proofpoint-GUID: rLmcuv4y0G66oVNG7SGBiv2o1GWuTrvG
X-Authority-Analysis: v=2.4 cv=Kq19H2WN c=1 sm=1 tr=0 ts=6a8cb780 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=lbskcjEx90pOFJH4cTSgiA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=BlQpyKfjmoaOCmFpA6cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE4MSBTYWx0ZWRfX4D4jB0XFvgrE
 S7Dco4V4AN2VRP7Ok1obEX67Ys8CF2RkDQrYpe+qRAkdHdKZgo2DYRHARH0dMiX4hM1Bu1Tfx0w
 wYypvf2VuVkf6hwtlPuMjuGDCRWDYIQEUot3JjOy/tEJJOtkqZPHTpC12hQ17lVJuucXhIgBUjn
 RD+HpcG8jLj8vEUs56DJKPfH5bRJ3kXAEO5yjxv3fJS88f66fGmUQ1nh0gpgp8jFAWBtwc0PCB/
 XBaPcW3rxP8HBvCvI8KbBoZQvcNHeApgGfSIV8RwM88uXq9kjnCEx+OzYG75k6u+U6LpaGbQJOa
 yR/UwgpGqBCVThRnnJe9jKPsS7JwgcM83eyoJjGXLoNpeTaDJPfWNNcdn/GSlW1FwcTN1liEsU3
 87KmWDm6gc2PtNhdTTCS6vzHlfZGEIJ7lA0Axd0uHyjmmrGK1vhfcKcf/64ZsYajAJ8jaTdWXSN
 aVcxWJUToIBFe8Q/+Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240181
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 24/8/26 17:24, Alex BennÃ©e wrote:
> Now we have fixed the compiler issues lets have at it.

The rational isn't clear about the benefit of adding this target.
32-bit is already covered by i686, ARM by aarch64.

> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Message-ID: <20260723200904.224413-4-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/macos.yml | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/macos.yml b/.gitlab-ci.d/macos.yml
> index bdb3eae18f0..40b9b637b3b 100644
> --- a/.gitlab-ci.d/macos.yml
> +++ b/.gitlab-ci.d/macos.yml
> @@ -22,7 +22,7 @@
>       - export PKG_CONFIG_PATH="$PKG_CONFIG_PATH"
>       - brew update
>       - brew install $PKGS
> -    - brew install aarch64-elf-gcc i686-elf-gcc x86_64-elf-gcc
> +    - brew install arm-none-eabi-gcc aarch64-elf-gcc i686-elf-gcc x86_64-elf-gcc
>       - if test -n "$PYPI_PKGS" ; then PYLIB=$($PYTHON -c 'import sysconfig; print(sysconfig.get_path("stdlib"))'); rm -f $PYLIB/EXTERNALLY-MANAGED; $PIP3 install --break-system-packages $PYPI_PKGS ; fi
>     script:
>       - mkdir build
> @@ -40,8 +40,9 @@ aarch64-macos-15-build:
>       PATH_EXTRA: /opt/homebrew/gettext/bin
>       PKG_CONFIG_PATH: /opt/homebrew/curl/lib/pkgconfig:/opt/homebrew/ncurses/lib/pkgconfig:/opt/homebrew/readline/lib/pkgconfig
>       CONFIGURE_ARGS:
> -        --target-list=aarch64-softmmu,i386-softmmu,x86_64-softmmu
> +        --target-list=aarch64-softmmu,arm-softmmu,i386-softmmu,x86_64-softmmu
>           --cross-prefix-aarch64=aarch64-elf-
> +        --cross-prefix-arm=arm-none-eabi-
>           --cross-prefix-i386=i686-elf-
>           --cross-prefix-x86_64=x86_64-elf-
>           --disable-plugins
> 


