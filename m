Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1338697lfp;
        Mon, 18 Jul 2022 07:37:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ttAc69CKkXqIe1wuc1OEex9MK5FZarSk3bSn7fy4Wg7gy6s3M3ukB91CBfsMnfFFYT94qT
X-Received: by 2002:a05:620a:288a:b0:6b5:3d7d:5c22 with SMTP id j10-20020a05620a288a00b006b53d7d5c22mr17302230qkp.603.1658155044993;
        Mon, 18 Jul 2022 07:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658155044; cv=none;
        d=google.com; s=arc-20160816;
        b=kZSh5cOc8raZoByUmNBflT8+ElZAwxfstRwCIYfByIFjlYu8U8WZgEs82huwdltuKY
         Apub6SroWfFTqwX4jtYk7EJtg3PY8Img2GLr25bcY/oMFUADxfs2I6jh9Y9mW4joCm/9
         Al3Olu2AWEPln42YhBqjx+itgUtd6C3xjHMqX8vQyERuUn5fmNbKD88z6eFMnNmfxqsI
         Mjv6lB2KkfYGXC8InTG7DkyKmTEMysq2EmxwKU94OAREHDEslRDBYqg2uzy/Nc6L7Egq
         t9i/0oThHGkUhumPbAYfuymxdQOUGskPYCatgkTJAIWNUVcmVkF9TipRiKUxrKBh4NIq
         Jhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=fjBX/M3VUQYW/3IstOcq0FchP7CfVgdwV5UVREED5xA=;
        b=WJ6A+Sm3kwYiBN/sW3R6cW08bGXFzmffjegkHwD3tQ+rwyZGPIjP5HFuWYpJN9LPKG
         NzLamPFZVPV23xgrRveoNfFMeRWrx6eJr0qkyK5Y23UYnXowlfKtcv+t9TxORQ5l6dNn
         j7r/mfgOUa0xWXNQiRIvO0DVraCQefECUOBaemCQmEeV1dN8qRmVgJe6DxxEdLuDZbmG
         FkO/AGVyWwN87lGiNY95I87wZZNUwSJvSm35m0dOVXOEDoWxM48IoEpVxvoPlqIS2wa+
         4yiGkR4uYyJbnrWRAjDQRZWD3PyMQx3ScRk7hI9/Mfm3QawbakZ2Hobn3EfK9iT2hMuz
         eC8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NlEfR1jr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay42-20020a05620a17aa00b006b5cc12c592si4254031qkb.266.2022.07.18.07.37.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 07:37:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NlEfR1jr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDRsC-0008Lc-H7
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 10:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRPx-0006jK-Jz
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 10:08:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRPu-0004Qf-DM
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 10:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658153289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjBX/M3VUQYW/3IstOcq0FchP7CfVgdwV5UVREED5xA=;
 b=NlEfR1jr7X1Vo5CTBjkeFAW8lJSdPnsmasl8Ei81scmNZw+B0NTVXCkVp+X5Z/3W14Xfgv
 9bjFVg6LGqtdHRRIONxWqbSnc33YMbEmnIa0vmzHZJp/d/kn2/0n6Us+EWtx7qTdxpyQwk
 KkUxV5n0H2AfnejRNZjeWJrXt4ZZTFU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-ieu1NenROc6mUXY-PvVqWQ-1; Mon, 18 Jul 2022 10:08:08 -0400
X-MC-Unique: ieu1NenROc6mUXY-PvVqWQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 s17-20020a056402521100b0043ade613038so8018382edd.17
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 07:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fjBX/M3VUQYW/3IstOcq0FchP7CfVgdwV5UVREED5xA=;
 b=s/8xQ7k4+Plx0Gr79PYda8YcP5WdSpA3Fggqj/ToaArV2ckoOaVKWwZ9i/W/i2nwcI
 BkiIBCyupi8p6d7iQn6hONnRWBcGP9kxC+SiUyuQnu4F/QGzSflgJLRQeURnu+ADYt93
 3YNDC8Fq2G9SdYnC50sIsm3+IuBuzlvNYcZy1zRjTTNh0uBdS1W4+KMyM4emzJaUbFmY
 4uoKVgZPRe7pCmNqsywEx/qPrPcHFNwYCUN+8dURTXQRpg6Un6AUlkRiWxowMraw/5Eu
 SC3g7Fy59pB5Hm5nZdAH07CO4g8+PQ5RXEApMOwV3b69VhYAc+1dDnCuuUqpcy6u+gS2
 Ncfg==
X-Gm-Message-State: AJIora+0aaZsW357Om6Ou0AboSyzhXN18fLj3ynTVDsfEZhTPwqdwJIT
 HKA8SdSNDcfNuAtG2Na8vktlbOOBMj5oPBSiZleUbrtGD4mIsva4EO88nyXUQRdsR9DhqT1+WZ3
 ZQbHBVgv/kOjX
X-Received: by 2002:a05:6402:51ce:b0:43a:d409:b3e8 with SMTP id
 r14-20020a05640251ce00b0043ad409b3e8mr36889855edd.166.1658153286980; 
 Mon, 18 Jul 2022 07:08:06 -0700 (PDT)
X-Received: by 2002:a05:6402:51ce:b0:43a:d409:b3e8 with SMTP id
 r14-20020a05640251ce00b0043ad409b3e8mr36889638edd.166.1658153284788; 
 Mon, 18 Jul 2022 07:08:04 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a170906d11200b0072b4e4cd346sm5486158ejz.188.2022.07.18.07.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 07:08:04 -0700 (PDT)
Date: Mon, 18 Jul 2022 16:08:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Hesham Almatary <hesham.almatary@huawei.com>
Cc: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <wangyanan55@huawei.com>, <marcel.apfelbaum@gmail.com>,
 <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, <mst@redhat.com>
Subject: Re: [PATCH 4/8] tests: acpi: q35: update expected blobs
 *.hmat-noinitiators
Message-ID: <20220718160803.06febe5b@redhat.com>
In-Reply-To: <20220711104436.8363-5-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
 <20220711104436.8363-5-hesham.almatary@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y4GGjZ3FujTI

On Mon, 11 Jul 2022 11:44:32 +0100
Hesham Almatary <hesham.almatary@huawei.com> wrote:

> From: Brice Goglin <Brice.Goglin@inria.fr>
> 
[...]
> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
> ---

>  tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
[...]
>  tests/data/acpi/q35/FACP.acpihmat-noinitiator | Bin 0 -> 244 bytes
drop these 2 tables, they are the same as default ones (i.e.without suffix)
so test will fallback to default ones when there is no matching file with suffix.

also fixup 2/8 to account for that

>  tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
>  tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h   |   5 -----
>  6 files changed, 5 deletions(-)

