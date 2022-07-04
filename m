Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3052235lft;
        Mon, 4 Jul 2022 01:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uPrDKi1J8TX2TFDEAXj6OFrCmD1mEauXDI2Ma5KwjEtJLt5toDYBLIh3v67qZywZtC8TM8
X-Received: by 2002:a81:af06:0:b0:31c:96f9:ccd6 with SMTP id n6-20020a81af06000000b0031c96f9ccd6mr5264119ywh.457.1656923998870;
        Mon, 04 Jul 2022 01:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656923998; cv=none;
        d=google.com; s=arc-20160816;
        b=ES1hMO5ZNxEgUnNFrOwgWlHzXLvNdE3uIBoCGVhZXDC1xT8Pvs461H78ujJB/3lRJC
         BUzPSOrYlBILdqaHz2WKpSqvip4mT6LQBEue/XXScP8DR7x1yaTxlTUrhOoNxNTDt5Bs
         I+t5lfTDr/4Vap+uc9EMYsCwbv0JBLkVXuZUVnb/44Hc4LN/Wl/+9WKcZR8DSb4GkxIh
         DYW3u/3fnWTsX2+GSlYDaNcB6wA0+P0hoSeD25MF5uXqpUo/NqDS/3xLr8Pabq8qea2C
         hDuv0itWzhBZD3jiLVeNYs4kMoDnEtyh/Paym8UAEh/WnzJfLOORrRzzpJdwXnjBB/UF
         Iizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=u97tIqI87SbHXlFdTvKKuz8JvezULXN/ErX5RpuSJeo=;
        b=XXZMx25WAvpkZ62qyQu4OehiB35VMqajyEeV4aJj9YFLe/Lv8KH7siZ0+vqaUtCwpy
         dYfU3Po4JkmJr7HYEYpcnH1Tro/Pum6dxCU3X6aNhHlhRucjJ2qIJVzBxv8Q2XFLTX7b
         /lhYrYgaljSkE4ATMNDO8YORy8nfS+AZRohnNQMMnQESRSLD7nIglM7ST9jD9rRoYZb3
         QYG6ViLsNXKHsefFeXzypeA3v9/ewZJApTb5V0/mhCvnYvTqExqDtqDdW6/I5HPhMhGZ
         5QWhA029Mq5aol5297tRpbn4+4F1ZYeiW7AuXzPhMx2G46kqO4FWc1HZ0DqAPomz4bsx
         +xHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 81-20020a810554000000b0031c832bc00esi8401978ywf.351.2022.07.04.01.39.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 01:39:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Hcc-0003Ko-8K
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 04:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8HcG-0003Jp-Cd
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 04:39:36 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:42017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8HcE-0005ED-DN
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 04:39:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.124])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8D33021DA5;
 Mon,  4 Jul 2022 08:39:22 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 4 Jul 2022
 10:39:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00449402aab-2ca5-4bb5-bd83-09df08a76224,
 37F03A08AC6718E95FD3DEE1BCAFFD005826E168) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9424bafe-0c77-8fa5-3ab2-4f3bec35ff6a@kaod.org>
Date: Mon, 4 Jul 2022 10:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] scripts/make-release: Do not include the skiboot
 sources in the tarball anymore
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Gerd Hoffmann
 <kraxel@redhat.com>
CC: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, "Daniel P .
 Berrange" <berrange@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 <qemu-ppc@nongnu.org>, <qemu-arm@nongnu.org>, Brad Smith <brad@comstyle.com>, 
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-3-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220704064254.18187-3-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 46f26c0a-aff0-4fac-a6d9-aab3b35b5890
X-Ovh-Tracer-Id: 12049943755605969735
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehledgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhihohhonhesnhgvthgsshgurdhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IOFlbYogjIFX

On 7/4/22 08:42, Thomas Huth wrote:
> The skiboot sources are licensed under the Apache license, so we don't
> have to include them in our tarball as long as we continue to distribute
> the skiboot license information in our release tarball.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   scripts/make-release | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/make-release b/scripts/make-release
> index f79ed7a2ae..176304f30b 100755
> --- a/scripts/make-release
> +++ b/scripts/make-release
> @@ -19,7 +19,6 @@ pushd ${destination}
>   git checkout "v${version}"
>   git submodule update --init
>   (cd roms/seabios && git describe --tags --long --dirty > .version)
> -(cd roms/skiboot && ./make_version.sh > .version)
>   
>   # Fetch edk2 submodule's submodules to get their license information.
>   # Edk2 is distributed under permissive licenses, so we don't have to
> @@ -48,6 +47,20 @@ https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz
>   EOF
>   cd ../..
>   
> +# Same for skiboot - it has a permissive Apache license, so we don't
> +# need to ship the sources for this.
> +cd roms/skiboot
> +skibootrev=$(git rev-parse --short=12 HEAD)
> +head -n 38 libstb/tss2/ibmtpm20tss/utils/tss.c > LICENSE-tss.txt
> +head -n 50 libfdt/fdt.c > LICENSE-libfdt.txt
> +rm -r $(ls | grep -v LICEN) .[a-z]*
> +cat > sources.txt <<EOF
> +The skiboot sources can be downloaded from:
> +
> +https://github.com/open-power/skiboot/archive/${skibootrev}.tar.gz
> +EOF
> +cd ../..
> +
>   popd
>   tar --exclude=.git -cjf ${destination}.tar.bz2 ${destination}
>   rm -rf ${destination}

