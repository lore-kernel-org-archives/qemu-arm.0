Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4212038lfc;
        Mon, 31 Aug 2020 20:18:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwARtQUhsFFIyawiIxzYbnlp1YPFpB5e2lH1t1HxztklsA3xfTBSwAMdZJE9q1S9BR9BuYA
X-Received: by 2002:a05:6902:4a7:: with SMTP id r7mr6632594ybs.482.1598930294669;
        Mon, 31 Aug 2020 20:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598930294; cv=none;
        d=google.com; s=arc-20160816;
        b=XPETZptaXFKK7fxNB48/cWj9Cb0xcAw8JDJgEUCarjrL5jZfcUD7eeZmkLSroTiIoE
         vOGed/bCOdG7sNWxPC03osJYELSp02/u8jDJI6o+XhdAtTvcAgXGjcUjCZSzyAfaGNkN
         buoR8MybwyJQuIdfwAfzPTMZR3/X/kpnj0VF987gCnkJDa9g2WfLw2KWHZDQWrkoSM++
         ryhNM6IyEZwHO8ZX1jP8aO7SqdVMjSbkXQV6PAmu//D4sHYkchsRYIxReMeW7LWXicQb
         44KoEmlLU1MiF0PY9cn8Xj57euK9VZ623F2PGGi5wcywP9m+wmTd4QrvrJdcmEW/gTvB
         k+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UhWlYaTCpKFEvdVrcqy0M8TIDbH2UzIE8/0Zarc8u38=;
        b=awra8/nvLsEXpeNDlPm4+AzC0I4JvX7kaxwSU4+2uMSakPLcGWiif94HtQTO7YyULz
         qpDwU0+GF5JFPecmZSbVEGTKlC5c0UCAM6/p7YspQsAVgfWTLzwdgocL+Ki5ab6IDcCl
         7G0mOB7MxU+nTEwkeIAwl+OYbMkcFMBp3YYGeso2FYIT/VDK3jSBl/j0XWNxniWb/F8B
         3G0cD/snxcLkS/vBD9x+0SlSiVeEP9jBG+XrQNnL2WQYFxbrg8zmfo39uXR8N9udPB6i
         RVbudfM8PpunU5Lk8Qs7DowlPKb7e+/kArayGKGdBGU8oUgveJIOclZjUALMg3oQ5/Gt
         Kr0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hc3nvnYB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w66si12349291yba.190.2020.08.31.20.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 20:18:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hc3nvnYB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kCwoI-000123-3y
	for alex.bennee@linaro.org; Mon, 31 Aug 2020 23:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kCwo3-0000kH-5o
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 23:17:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21811
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kCwnz-0002Zp-AV
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 23:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598930273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhWlYaTCpKFEvdVrcqy0M8TIDbH2UzIE8/0Zarc8u38=;
 b=Hc3nvnYBf1MsuHiyflNNeIFqNZOrVcGyohnr9mmh3Xhrs/t/l21yMFlXer5XDeKmOJtmZM
 JCQulghMc/GYm2bgkLpcisxaNSdkP6dkVqR8lGUJjv/IqTD7DdLSBC0Avv6sjjfv60CHP+
 Mz0eeh7PIWwPA+6tgUvceb4taQk9anw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-LeWAl1EFPsSm6aGVqOORdw-1; Mon, 31 Aug 2020 23:17:51 -0400
X-MC-Unique: LeWAl1EFPsSm6aGVqOORdw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8D328030A9;
 Tue,  1 Sep 2020 03:17:47 +0000 (UTC)
Received: from [10.72.13.164] (ovpn-13-164.pek2.redhat.com [10.72.13.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E049B5D9CD;
 Tue,  1 Sep 2020 03:17:35 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] util/hexdump: Cleanup qemu_hexdump()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200822180950.1343963-1-f4bug@amsat.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <17019b64-30b7-1cbb-701d-c3760a8e13d4@redhat.com>
Date: Tue, 1 Sep 2020 11:17:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200822180950.1343963-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 22:05:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Zhang Chen <chen.zhang@intel.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 42k9T+q5YWXY


On 2020/8/23 上午2:09, Philippe Mathieu-Daudé wrote:
> - Pass const void* buffer
> - Reorder arguments
>
> Supersedes: <20200822150457.1322519-1-f4bug@amsat.org>
>
> Philippe Mathieu-Daudé (2):
>    util/hexdump: Convert to take a void pointer argument
>    util/hexdump: Reorder qemu_hexdump() arguments
>
>   include/qemu-common.h    |  3 ++-
>   hw/dma/xlnx_dpdma.c      |  2 +-
>   hw/net/fsl_etsec/etsec.c |  2 +-
>   hw/net/fsl_etsec/rings.c |  2 +-
>   hw/sd/sd.c               |  2 +-
>   hw/usb/redirect.c        |  2 +-
>   net/colo-compare.c       | 24 ++++++++++++------------
>   net/net.c                |  2 +-
>   util/hexdump.c           |  4 +++-
>   util/iov.c               |  2 +-
>   10 files changed, 24 insertions(+), 21 deletions(-)
>

Applied.

Thanks

