Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp208141lfb;
        Wed, 11 Nov 2020 23:37:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyH7ofdx8YmTKvqbsU/hNRnDzRWpWJjmTVyXxErInPtiAXPnkMU4sFDq7DnEvTKJhoetQu7
X-Received: by 2002:a25:9345:: with SMTP id g5mr28633386ybo.208.1605166632255;
        Wed, 11 Nov 2020 23:37:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605166632; cv=none;
        d=google.com; s=arc-20160816;
        b=A7m76BytMq1po4OwJT5AO9N4La8ptQyyd8ClE5tefOIlCichM/kc4vWoFJZt1FR3lY
         1hm4WfVegmAhtEggsQc1fBqAEO5JjLrXaIxsAG6rX7mLBotZLiuTlEUj+1WYfUi93loY
         rTFHKMPiG9vNzcSWIVRMmcyfYaVQajY1+cH+2ykN1IECiVI3dMhb5M9REecrNa0cTp0O
         G+JUBGTd0YighdcNTD3z5em+Qqxh8d41N1HFPUOPeLxctT3FwDr180qogaw3DGBv6ggN
         CWoWXMPVC5412AtAlFrMkdwB7TkAGIKfNbd0Yx0SPrTWo/kkuwe6/70wmvhvh/5ZiC6b
         nD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=frucbt3NJxjTlMYcCMvxFBrXRT6d2XPVWj3BlT44pJ4=;
        b=QWVX3iNxP2YviFi46PBuNTKJGAxbqaerafMIGcMlbm5RUl2mwQ+l9YERVnXq6bLTE5
         mHecBc4e7KPMozb+MgGSM3ELfaN7f/TvuMnFFC0H2feWXvMBUfbH17Z7KKZrOf+c82wR
         UihG5p1ZfBzzhUFamdzyEyv6zMqkmYux3wHAglDZj4kMvy5OCKoqJ8Vsc/JnF2ofJitH
         l5oYPr9ojaXI71GbjlFL/0JI+YUBD45KYarp30TJT0XnlpcC4DcGzMA0nAKnB7eS3w+F
         RofO/QYWc/YhYYKvK8h2f1DaOBSjfxg5YyZyM4nQzEtMDxdNrFTWJuRVixCktKRTMxyG
         9sLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dOg+dkqQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si4407512ybm.271.2020.11.11.23.37.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 23:37:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dOg+dkqQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kd7AN-0003Wq-Kp
	for alex.bennee@linaro.org; Thu, 12 Nov 2020 02:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kd7AB-0003V0-Cq
 for qemu-arm@nongnu.org; Thu, 12 Nov 2020 02:36:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kd7A9-0003W9-Ok
 for qemu-arm@nongnu.org; Thu, 12 Nov 2020 02:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605166616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=frucbt3NJxjTlMYcCMvxFBrXRT6d2XPVWj3BlT44pJ4=;
 b=dOg+dkqQ+S/RGvWNjM6emmb3QZBDJi8bxEiiNfLMZP9ynbMef7VHnw7fGtU5LDGCUZ52/C
 HqDkZD/PDn5MgVNITgEmAOq8j5Je0tAdIt99lxi1I9eazQhAWzmx0WzoDECkUTXF+P7JQl
 OMF1qUsi3EfnQbZeGXhEpaAXXJSCpZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-F8UJDFHfMsKWpnnnbDmdpA-1; Thu, 12 Nov 2020 02:36:53 -0500
X-MC-Unique: F8UJDFHfMsKWpnnnbDmdpA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CC5081CBE3;
 Thu, 12 Nov 2020 07:36:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-74.ams2.redhat.com [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6651375126;
 Thu, 12 Nov 2020 07:36:35 +0000 (UTC)
Subject: Re: [PATCH v2 2/4] ads7846: put it into the 'display' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201111164710.644863-1-ganqixin@huawei.com>
 <20201111164710.644863-3-ganqixin@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b8c51d7e-c16e-36a5-4500-e1e1cbf0d48f@redhat.com>
Date: Thu, 12 Nov 2020 08:36:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201111164710.644863-3-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:51:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 laurent@vivier.eu, armbru@redhat.com, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, kuhn.chenqun@huawei.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TcdmrjsrCkO5

On 11/11/2020 17.47, Gan Qixin wrote:
> The category of the ads7846 device is not set, put it into the 'display'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
>  hw/display/ads7846.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
> index 023165b2a3..b455cb5acd 100644
> --- a/hw/display/ads7846.c
> +++ b/hw/display/ads7846.c
> @@ -163,10 +163,12 @@ static void ads7846_realize(SSISlave *d, Error **errp)
>  
>  static void ads7846_class_init(ObjectClass *klass, void *data)
>  {
> +    DeviceClass *dc = DEVICE_CLASS(klass);
>      SSISlaveClass *k = SSI_SLAVE_CLASS(klass);
>  
>      k->realize = ads7846_realize;
>      k->transfer = ads7846_transfer;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>  }
>  
>  static const TypeInfo ads7846_info = {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

