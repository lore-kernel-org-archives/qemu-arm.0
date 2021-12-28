Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6683065lfb;
        Tue, 28 Dec 2021 11:28:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpmH89xyGmLR5UItRaO8a2FNn3FEB2b9Qzz3zz2LSizg45IrN212ZK8NJpawWWiEGsizXw
X-Received: by 2002:a5b:c43:: with SMTP id d3mr20455273ybr.385.1640719736798;
        Tue, 28 Dec 2021 11:28:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640719736; cv=none;
        d=google.com; s=arc-20160816;
        b=CUF6SVtsM38UOrsresb0CPTCUzBuYygIMpjepW41E5DxBqN2c51yVNruDQOAGrLunc
         ZGWFofPW/9FCvx92tPXjV1mzHeKK3BWpVs2elyUvYPj+Z7S+OuMK2P9WfbAzWxXItT+K
         aHRNwh1s2a34dW/64SAqreZILAMuEJNUmmjEo6UWaFN+8aUKPW/0YFAxvuHA1you0MnY
         MIOs0KUw700J0qMw44SoIJSwRFdqbvOQUBB32MvosWjvOKs/Qq4UgjXMO7Ifsv6G7de1
         4PCW2xa9X6FctIFxQQwHNO0daQYuOA0bDLFbuTU7SHfovZ1KQ/IihBuuN4c4DCENVhVx
         xtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qzq6ZcjbayTNJfL4IrlU4jb+5rwVP1q8GDO8/MTd9GU=;
        b=GYDdXxRhTwG0fJE3naBzRqRI/3yudwOzxOirE1TZZgIV9DWHPZ0o5U9cQFoX5//+NK
         6TI9zzN+fYNuhOP0Le2JryS4odRShUSdzfcp2lpAIoApLv26+Cv4WM/zrBDUVa8VQrxY
         TSuzPPcGmmUSHqgGuvmrxdNYmasHg7FJqtvKmziWxxWYi8c3BD/CW7H62Rmsv+9nO7bM
         wpUwplHemEXWCNk7VTM7o4eXjWUH/+tGDUituw63q2+y2iFl6JNPcjm2mmMJLWOgtLd+
         e5XJtZSlgSdEIxYxoNkPfHc8qWUSU3UCjYXhEgttPVtZ8S4bwFDDD1nV1cJ/jt+MDQcb
         Tc/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RmCZj9UN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d129si14341063ybb.606.2021.12.28.11.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 11:28:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RmCZj9UN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n2I9Y-0008Af-72
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 14:28:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2I9G-00089b-On
 for qemu-arm@nongnu.org; Tue, 28 Dec 2021 14:28:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2I9F-0002x0-BP
 for qemu-arm@nongnu.org; Tue, 28 Dec 2021 14:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640719716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzq6ZcjbayTNJfL4IrlU4jb+5rwVP1q8GDO8/MTd9GU=;
 b=RmCZj9UNT3FcT5pTVNQKapln1RkcLWaYojVXtSYzUabq7arBqmSztmRszF9m/yX8n8TZBc
 YhD5IUDPI/MtAzmw3gOeSj/UkeDKxi1Fys9vxTq/ODAMaRifJHGI3FPTDNR1JG15GE3mr9
 kt1H9xoeFzeSsVD7pgfe49Ft8LlX2XA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-q1S1GareODWmj131Ef3FnA-1; Tue, 28 Dec 2021 14:28:35 -0500
X-MC-Unique: q1S1GareODWmj131Ef3FnA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l17-20020a05600c1d1100b00345e7624489so2746703wms.9
 for <qemu-arm@nongnu.org>; Tue, 28 Dec 2021 11:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qzq6ZcjbayTNJfL4IrlU4jb+5rwVP1q8GDO8/MTd9GU=;
 b=G3IveXM9+Cv+olc45hFOO+j/jv0Cs7SVL2AWp/lW96AFnBmyz20VlDzsCH0+jkQtEH
 H5sbUl9gyRkreKPRsMTjPDYJjXCEeYLkQt7eXPsAiY62J1xngagn8yUeJNg10ZKlR6Gc
 BMATk39QX7X6GP/uysX8vZB+qHsqX1vySKjYVDWFE/WHPcx5O6Sc5uMLBtHRAPNT5QGF
 W+ufcjX+3M273WMaZ6HMMbz9G2QV3gWJmgvbMCC45DxWYsMCA2YTBjaCbkdHlbUiJyGD
 HPnPzSM8VqnqktEYe/0cV5e19hf/PMxsdxO9vc23YXr/A9Pvm7U8X0uDekNgTjT4LArL
 9BYA==
X-Gm-Message-State: AOAM532vj04JJtVMvzLhlbszajLYSAW6TM1t1BLkBdyJabLHuxkldw9H
 slc7Sj7mHGe+JtJukzh7jd2ZcxZM75qwpqvpQPN7WEQCXCCIMbw3WN4sX4bdVbvd63vkA/DEeGN
 hcoJAMGOG57xR
X-Received: by 2002:a05:6000:108e:: with SMTP id
 y14mr17582072wrw.69.1640719714287; 
 Tue, 28 Dec 2021 11:28:34 -0800 (PST)
X-Received: by 2002:a05:6000:108e:: with SMTP id
 y14mr17582048wrw.69.1640719714065; 
 Tue, 28 Dec 2021 11:28:34 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id r9sm19329735wmq.18.2021.12.28.11.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 11:28:33 -0800 (PST)
Message-ID: <c91bf7a2-f9c7-a7fd-4d58-88c0e1220533@redhat.com>
Date: Tue, 28 Dec 2021 20:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 06/14] tests/unit/test-smp-parse: Keep default MIN/MAX
 CPUs in machine_base_class_init
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-7-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 29XWo5USDJ9Q

On 12/28/21 10:22, Yanan Wang wrote:
> Most machine types in test-smp-parse will be OK to have the default
> MIN/MAX CPUs except "smp-generic-invalid", let's keep the default
> values in machine_base_class_init which will be inherited. And if
> we hope a different value for a specific machine, modify it in its
> own initialization function.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/unit/test-smp-parse.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

