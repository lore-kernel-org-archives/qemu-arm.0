Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3364360ejm;
        Tue, 25 Apr 2023 02:21:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350bCLNEkijC+6BfDt8JvflQsZdvCK/TCT/WUCZaun8gGzdRqXuUERC0nXpfNmZNFThkKKmfs
X-Received: by 2002:a05:622a:45:b0:3bf:d950:efc4 with SMTP id y5-20020a05622a004500b003bfd950efc4mr27774543qtw.26.1682414487914;
        Tue, 25 Apr 2023 02:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682414487; cv=none;
        d=google.com; s=arc-20160816;
        b=xWgxebJbW++GO3gptXrFbwzzfJSL+NXZnuWJ3MsBdnPuFt+DgVhdy+3C1Hv2bqki0/
         gxxHuQC5Ti62mWsZGCMa5rTaY8DZjKzsqjVVq9wpqX/SxEqUWd0ZrJ1wdd1hY/2hEDz5
         oXLenams//MyNKx53H7+NuOikpDlfZzaMZcEb2kVihwbbWqguvW6gtD5aqZVO1556+jx
         ywBSSWZLyX3a93WMsnGuscLeUaOsODwmg391/PNyrKRTIGg3VwJ9ob9sEWbTr0dnEo/I
         l9KqrOsNNCM4R3iu/3EUcEyz0cYF1A6FiOCKyzAXvz5f5egmgpAS80xAwWv74tsv7VVS
         CaRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MN9oXgsc8DHoo1VpyjDGkHB8D0MhxIlnzkrg3+EvyyI=;
        b=CbyrwbZ4+l8CFrR70mq/J4x9BYuDuVe3ThK3mF7MygUZ+AjDqYFLim9oe+qpXC+GAo
         d8DEkLL1iJA1FyEzG2AkxAaIrwUJrZPLpw7A+C1oBUNZoeWrnnmkaoBHDETFxleS9YlG
         WfmW/ZhKD4p/ZCcc1d5m80DFecOXtD5X8R4bpuga3HGkHdxc8im3/BfTOMWo7uwQnsl5
         rNYjofL36QnXhf6RRuAR0z0KjpdbsPITqPPyAvN+Oo+2jR7aUmQ+mbzxU4xqpvcaKQcT
         hA97XlvAh/QSPqvUnb765bZZ1wFSTHiDdDB2Viana9KdoA04gUWWiDWFwBLzVUSBQDAD
         xVfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aGZ/on9n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020ac85a88000000b003e4ddb60eaesi8299828qtc.682.2023.04.25.02.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 02:21:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aGZ/on9n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prErS-0006zr-BO; Tue, 25 Apr 2023 05:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prErR-0006zj-BX
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 05:21:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prErO-0004wc-O3
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 05:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682414477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MN9oXgsc8DHoo1VpyjDGkHB8D0MhxIlnzkrg3+EvyyI=;
 b=aGZ/on9nG7bNvfy4DgDwdXyl2eiDNRTiS9i1y14j2wViga5oKgERkrCFDRMJN44KB2e8UU
 3t4KhJPrsTg2sgVX6OZ2A2F5ELGdj7p7bm4nrPDMjBzGyAc/6dR3RxuhPiSaqjq7aZYrMd
 hg1nwNyXajOMujNo9ANVBBNb3gh0P8w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-NcblF5VAPYW89NHH9hkMag-1; Tue, 25 Apr 2023 05:21:16 -0400
X-MC-Unique: NcblF5VAPYW89NHH9hkMag-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f195c06507so53504895e9.1
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 02:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682414475; x=1685006475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MN9oXgsc8DHoo1VpyjDGkHB8D0MhxIlnzkrg3+EvyyI=;
 b=NnJdAKUD/HP+ipoYsqs/NRpRHmxbbEohJXTAI5KY9mH/9hDB3egSoJnK8lxQkamQn/
 as82vHYIPr1vBL7bgCaFKu/KkjiKK8wGBdkODBABquUooCzf6aB+o/Uv/e/cSciU9pZ6
 DsXNwjoxJXFBs5fgoOn0A5xunNWd55tHavEgxgnlWKUbxgCcQaYIJb7tdsjv1nEcE9NI
 MxMmcvQ+tQfnJShg9jmcad/IjuWd54Ia1sszMHvYuvEyifgwi5Fyu17pmwrPyhneglWf
 q1nWgiy8i79P2eG2/KPHUqzIi5at1h0Su9GY3sRAPeYhW26r7sxta7b+tKoG3otB7Spp
 Qqvw==
X-Gm-Message-State: AAQBX9fTEFDYc+QUPFHFViyaV2rkxfezLJijSoMjRi0qtLqq12zBFRAh
 fI8Aw4mqXUXN/GO4Lutx1T00JZFssPvfjXuEpMg1uPQjEarc8wtu+w97CMi0gISkwcm4uiBPd0e
 JjmD1VjVYByu1
X-Received: by 2002:a1c:4c13:0:b0:3f1:72f2:25c4 with SMTP id
 z19-20020a1c4c13000000b003f172f225c4mr9575513wmf.13.1682414474862; 
 Tue, 25 Apr 2023 02:21:14 -0700 (PDT)
X-Received: by 2002:a1c:4c13:0:b0:3f1:72f2:25c4 with SMTP id
 z19-20020a1c4c13000000b003f172f225c4mr9575496wmf.13.1682414474606; 
 Tue, 25 Apr 2023 02:21:14 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a5d4a07000000b002c55521903bsm12609942wrq.51.2023.04.25.02.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 02:21:14 -0700 (PDT)
Message-ID: <90e96d55-fc8b-52ec-6747-4fecd10e9e10@redhat.com>
Date: Tue, 25 Apr 2023 11:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] aspeed/hace: Initialize g_autofree pointer
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230421131547.2177449-1-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230421131547.2177449-1-clg@kaod.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HcF3eEPgHH0v

On 21/04/2023 15.15, Cédric Le Goater wrote:
> As mentioned in docs/devel/style.rst "Automatic memory deallocation":
> 
> * Variables declared with g_auto* MUST always be initialized,
>    otherwise the cleanup function will use uninitialized stack memory
> 
> This avoids QEMU to coredump when running the "hash test" command
> under Zephyr.
> 
> Cc: Steven Lee <steven_lee@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/misc/aspeed_hace.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 12a761f1f5..b07506ec04 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -189,7 +189,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>                                 bool acc_mode)
>   {
>       struct iovec iov[ASPEED_HACE_MAX_SG];
> -    g_autofree uint8_t *digest_buf;
> +    g_autofree uint8_t *digest_buf = NULL;

We maybe need a checkpatch.pl rule to catch such bugs...

Reviewed-by: Thomas Huth <thuth@redhat.com>

