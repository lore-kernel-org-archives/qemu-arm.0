Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6556023lfb;
        Tue, 28 Dec 2021 07:59:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYIiCdIXIvV6mcS5nvK91knf97HmsJhTVFoqEnB15PJftgRfhHos9fb782zTADcfu4qo63
X-Received: by 2002:a05:620a:4628:: with SMTP id br40mr15672139qkb.519.1640707187415;
        Tue, 28 Dec 2021 07:59:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640707187; cv=none;
        d=google.com; s=arc-20160816;
        b=xSCMy9By4tY7+S4YaNkqg3uUOsx7/qaoyGTNFdDhjEGqJS5KT47ZLP2F5OTLxJrq1p
         xVREBuJEoiQSBv8HiQ0Op1SdiCDRvilIvcqQTjYvUFKUNoN4cntgfhGp6LZR3UiscHae
         /aDybApzbw90p/n72ucNBAm0lcwR/bIzegKS3Tamwus9t+pUxE79mw+ggHwowasS6nKs
         Q5DxU8DOB94GhK1gQXSHaM1Q2wzUQvAf2ZNX7Lcf8ZbXC2yZP7cc9UjHvXIn6cHguH/I
         oEBahkQ4ZWDw5rh3IJogVKH2v68LYFooT8LYY2Rku4UX4vw8L/CEmNgYYtdKdun8JIrY
         90dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ZGcJBwijnT6lsW2cmcpAHJRXtPZdbsBzyN25kTDyf1U=;
        b=qxOHdMHXx1fRsuorDeGMl0tWWW40eEJ9HXon1D+3FW6JqYFjZvNtiSjW/QRPqPFVHr
         bn5vkkFHpwFgOn5I05PwGs7rH1Oy6iE0ElkEHFlQKkTaQVj7ruyHtBX2nEYwM9tzeepH
         izZ4FFUNpHrtOVblCH8Y3Mamiz/gWuerbFzKN47HOxDMcjVe7Q7hBnt/69ffz086uAhx
         GcCqXyhCVvGb+GGZDpBu3+rO1A0/BFmdZC6CJ+0yb1BlnqyN6QK+IspL7yvTPNtMOVSP
         T1r4qU4sayRrULXwoDI78Z2DdiBHpeIc3qo0gTaFAELJnJP2sd8WvZSAj9UY224RxzQd
         P26g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TJftfb8M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si6166917qvo.577.2021.12.28.07.59.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 07:59:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TJftfb8M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n2Et8-0003Hy-Rh
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 10:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2EsB-0003CL-RN
 for qemu-arm@nongnu.org; Tue, 28 Dec 2021 10:58:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2EsA-0006hK-Ij
 for qemu-arm@nongnu.org; Tue, 28 Dec 2021 10:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640707126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGcJBwijnT6lsW2cmcpAHJRXtPZdbsBzyN25kTDyf1U=;
 b=TJftfb8Mtd9LAP672f5OF2njpzOqOdbpK64J8f7P1AnDILla2bf/kxuQWpYQpYamjL8A5O
 UcX09RS3oVLZR6ko9IwIjJPjn1kzB9bcsY7fA/yAeArdglR0L4oQK5tEsK0X8akfxWnNtS
 BtmqEBM5dQzA3/SGXHQEk/6vL20vMQM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-fKE9NDD-P--H1g_-7RMx2A-1; Tue, 28 Dec 2021 10:58:44 -0500
X-MC-Unique: fKE9NDD-P--H1g_-7RMx2A-1
Received: by mail-wr1-f69.google.com with SMTP id
 s23-20020adf9797000000b001a24674f0f7so4011592wrb.9
 for <qemu-arm@nongnu.org>; Tue, 28 Dec 2021 07:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZGcJBwijnT6lsW2cmcpAHJRXtPZdbsBzyN25kTDyf1U=;
 b=Q1nMgf1Kv5tq3EgYbi7eyyFU9JMlJqYzY3JWX21kXV6Vbqr1UIHeixDp9wIgsvA4NL
 WnqH0aOmH75hURBIcrr55AjQzUbvsTNa4bnQAjCbJclMvfjtVP6TOOCmzY3YfTL+FUvD
 /FSfbbGzpeCRO2QDIawjeP+80HNm582+wIcrQquMicKUvIW5SQnh0e5zBrG/6PMWbO8r
 VDNTBo57zBOejEAfErqySzsJpr7QNtbtMwXcxkeO32YXZKkWz4pj5fUfVh++qaVtTmLd
 wxeD/q32aWnZ/dBVQ1RueD9EIx9/q1DWr/hynEHtNcl/sjXgegmPaaxVoPNUkF545fRE
 fyOw==
X-Gm-Message-State: AOAM532jWK/KBtphlP9b7DtMlyoa3AZjIN2zEFNZjWlr1i/EymyWYdbm
 ahO5Mr7trrOVLMag3sbG8qQHUb7nXtijJu8C7D0iGJ5Rkh2WENQ3o6gHybYIw6nfrdOaKzM5dhj
 GzmatYT7Zqnfk
X-Received: by 2002:a5d:6289:: with SMTP id k9mr16550969wru.501.1640707122942; 
 Tue, 28 Dec 2021 07:58:42 -0800 (PST)
X-Received: by 2002:a5d:6289:: with SMTP id k9mr16550961wru.501.1640707122821; 
 Tue, 28 Dec 2021 07:58:42 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id j14sm18618460wrn.88.2021.12.28.07.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 07:58:42 -0800 (PST)
Message-ID: <240917f6-f56d-c2ad-39d4-84e0b7530290@redhat.com>
Date: Tue, 28 Dec 2021 16:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 07/14] MAINTAINERS: Self-recommended as reviewer of
 "Machine core"
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-8-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-8-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2bhDFbBY6MWB

On 12/28/21 10:22, Yanan Wang wrote:
> I've built interests in the generic machine subsystem and
> have also been working on projects related to this part,
> self-recommand myself as a reviewer so that I can help to
> review some patches familiar to me, and have a chance to
> learn more continuously.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

