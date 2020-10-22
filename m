Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp6302661lfa;
        Wed, 21 Oct 2020 22:58:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMnnMNSZ4pmsXIzEZbfQhtwWyeRXZOxpOWT/V8GEX5EhchOlwfKgKaLOethGsi/xoDpLsa
X-Received: by 2002:a25:9701:: with SMTP id d1mr1009341ybo.409.1603346327707;
        Wed, 21 Oct 2020 22:58:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603346327; cv=none;
        d=google.com; s=arc-20160816;
        b=rU49d/z2xcc2HvjJKIuOlzd2g5Uz4k+tqvUVUfCWkoX9VGPAUPVMMcGEpLYIsDkhEW
         SMUYkpyGqASxsARjkoKEtRTa1k2nR9X2mEY/29PDpy+KEdTTXfeXe+czjjc7hsZocJ/1
         2naxGv1Hd/MNf5qgSSFYig7aXmvkZgaXJi/WxIe70wuI+8cupLsjNN1Ob1lJkLDIO3R3
         6B1LSmBSmRGkAa90v5/IkWbZnTEpm2rCkVhJdVrjD1d2i0wbRA6nujT/E2/C+wpB9jHx
         qmFPInE6DRmwSa0UdEdYDYSzExj+dJWRpoD5ju/87zchXAHB6hkQ9963o+YWn4NLO8DB
         5z7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=u0By4YvDUOGxz/k0AI3JmlO+7SFpsS7BdlQBVD9xAYw=;
        b=T5w7SFRGXQSDWp6/noAypGWLGKWp1eqcRaBXMbnKJXWbxRJ3DsU0CeuqrfTOU3gbX6
         OrGvNxhopGbddPNwcWbmPm11/3O3JsNFsDMWGD2NHj0hIiThB4y48nD9SULQAdklAfu0
         8Y7Qp3RMQLlL0K8uu6ztaNvtBVip96lJNBHOZ2GE0P0EiLRWcICotzjTDx7NFaBm213N
         YvAm3Ke8qutEtJolZJxo4PSctsnRhW6qlWBKoidKzfd7pbwlh5P/MloPwNZcMpi6ckKx
         GDNiqOlVhR9g0C9gd89IXTVHBJy+hjUSm8q08s0GLrykO83ee6BiqyQ3q80T2qbcPb26
         zxiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h04KHuib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si349540ybm.280.2020.10.21.22.58.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 22:58:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h04KHuib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVTcd-0005Iu-1C
	for alex.bennee@linaro.org; Thu, 22 Oct 2020 01:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVTcA-0005Aj-WA
 for qemu-arm@nongnu.org; Thu, 22 Oct 2020 01:58:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVTc8-0003GE-CZ
 for qemu-arm@nongnu.org; Thu, 22 Oct 2020 01:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603346293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0By4YvDUOGxz/k0AI3JmlO+7SFpsS7BdlQBVD9xAYw=;
 b=h04KHuibbbTGxX6AsrSznWsEEIUtp28DxY9zvTfxLKpwzuoowTEEvkygImQOqM3ig8zIYd
 tfFOty2Lov4tOyHTJCZVjhhaSyuhl8f5/vFJbBISKD1sOYzyKfygtXKOrvEmekI6QhGq8S
 QB7up6n5sG1tvKSr2ppgw+dlI2+XoN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-6-t1gR-nOV-GdcU0WkLNuw-1; Thu, 22 Oct 2020 01:58:09 -0400
X-MC-Unique: 6-t1gR-nOV-GdcU0WkLNuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4F7B186DD54;
 Thu, 22 Oct 2020 05:58:07 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C48C76EF41;
 Thu, 22 Oct 2020 05:58:04 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] hw/misc: Add npcm7xx random number generator
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org
References: <20201021213544.3399271-1-hskinnemoen@google.com>
 <20201021213544.3399271-4-hskinnemoen@google.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <96e31c8b-2339-975a-bab0-5693cd02e09a@redhat.com>
Date: Thu, 22 Oct 2020 07:58:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201021213544.3399271-4-hskinnemoen@google.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 23:30:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: venture@google.com, qemu-devel@nongnu.org, wuhaotsh@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vLkd6unsmPjL

On 21/10/2020 23.35, Havard Skinnemoen via wrote:
> The RNG module returns a byte of randomness when the Data Valid bit is
> set.
> 
> This implementation ignores the prescaler setting, and loads a new value
> into RNGD every time RNGCS is read while the RNG is enabled and random
> data is available.
> 
> A qtest featuring some simple randomness tests is included.
> 
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
[...]
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index f7b0e3ca9d..473935c3a8 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -140,6 +140,7 @@ qtests_arm = \
>     'm25p80-test',
>     'npcm7xx_timer-test',
>     'npcm7xx_watchdog_timer-test',
> +   'npcm7xx_rng-test',
>     'test-arm-mptimer',
>     'boot-serial-test',
>     'hexloader-test']

Please fence this with CONFIG_NPCM7XX, too.

 Thanks,
  Thomas


