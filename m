Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5077153lfq;
        Tue, 22 Sep 2020 09:58:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxscMG3sOGmFr5dFgPkJ58k/nb9e8oyK/URA2yDd/GGetq6EYv6zby9jNn0PY2xxGclCOY2
X-Received: by 2002:a25:e046:: with SMTP id x67mr7908127ybg.342.1600793892228;
        Tue, 22 Sep 2020 09:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600793892; cv=none;
        d=google.com; s=arc-20160816;
        b=a1ownJ1AyYxXnjYgT8dKO2UKzFDYpQwG/hl15ROpdclo78IYB0iBlvi7lbBiL7wRwF
         IpvBCAl4FLr7+YFHMw0qyOcpGAvUA0RbGFYhXRPPcr6+qEmTZyjKSaiusklR05e+/xNd
         GmBwOjDcRbh6FTqZNnwfqs+qIRotLW8Ms/wv9ttPJrgSvVmjCu10/tJSV5TW5fOuFptF
         QKqzdWBuQrPwXx2teBap4oADip4es9CzETwIEMp08tFpy/JDJUa6LPWIGdf3dSh4eJct
         xO/mJfGAgVpCo9Doh/tYlf7G5PYetm6mGTUPt6Ofl+mD32ohsQPXdRcE/6W//e7PjDKd
         eIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gfsyb5lysBIdSfQQaxz5cxooYItsFeEgaOVO/+UrwjI=;
        b=gffYUhCJd7qGnbxD4OsS7dHov2DtCPhd6rPfuk+Z2K4vcGC1w2BAw40Ri6M73NntUB
         KiPhcGox/ZgLQ9znOWzd1jOf1Mr/KTVd1fOj/DSzJ7L5ylWRntdu/jVx9KodAokcUOls
         RcSD1lQVvpsqin4/j3iOYWNolt3GgjhEzPxIrVGRhRhBncL9OdS3l54Juqj2LuCdl/oI
         ae8c8lGNl1SOGwN+G6/4VmXg8MLiTXtujAUL/HBec38JjzppZb9wzwOy928Lqo68SXjd
         9BptPyCiVWpE3LS5Ag1+SqN0ZUDJz+nv8q/yV+cw7lE5/dekzV7FPmQYCc3QYNKO/wSJ
         GvuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Yc3t3CmQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 132si14895912ybk.433.2020.09.22.09.58.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Sep 2020 09:58:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Yc3t3CmQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKlcJ-0003wT-L2
	for alex.bennee@linaro.org; Tue, 22 Sep 2020 12:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kKlaT-0002Nj-Ky; Tue, 22 Sep 2020 12:56:17 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:38249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kKlaR-00066y-71; Tue, 22 Sep 2020 12:56:17 -0400
Received: by mail-il1-x141.google.com with SMTP id t18so17997264ilp.5;
 Tue, 22 Sep 2020 09:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gfsyb5lysBIdSfQQaxz5cxooYItsFeEgaOVO/+UrwjI=;
 b=Yc3t3CmQCSBiUCucNK9dqtYk4iEChGge1mj1wmQGj6OD3kn3fZy4ZuFMbCDZ3f1eFv
 itJO5SqrUUmEX2lIVo4mAPNnYa4a/txhYrI+1jhRBy07lmQZYyK8rYbM54Y0PaKR1WRP
 H0M7auvT+/9ggW1KYijsqgOJPZQO79oB/Ueu/LOpbnrqDsMJE73EvwUv7evjTcnWXCMx
 3dtc+t7Nkab0je1rj2JZCPgm6pfoU1kVne+FePm1TToPu6Znfkw3sgH1jclkai6FT7fN
 4TFOqBvPG0/7X7IIQKUrYqUU9v6UbeCwdRsXEBkzL5QBbUeafiuwHDv4jr/7bWvPZCjR
 nOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gfsyb5lysBIdSfQQaxz5cxooYItsFeEgaOVO/+UrwjI=;
 b=ffWCY0Hx6gso4GM2Lw6ER3VkRUatHutsgp8y2BxUCigUGAlBLX6xPilRfr5T9als0Y
 iIBUAq5lQnhkTmlGiPMyF8DVWiMcQ0k4zhiWEDB3YyMTNhnwEEo6cqloVsw8WTzu6QrM
 NVlwCy9/3atse7w/YytP3gQ0MJZqd3dH2D4iHPSxlV6u+fWkyQxGntTZEbemrd48X5OA
 mKZzPyqWG1YdFlPjXKRFx7ObvO9TBBmZM/PB3ytqG1h8NtXSDhOff4pZjxlCz7ZHt3+7
 cDZgKoRa1d9QkxTwd1HN2x/8drvsMowRAxfiVgR98d7gVxNF3Co6igfJW3VJfkFQtl2F
 cFEA==
X-Gm-Message-State: AOAM531w19Ew5OUdZLaMvbtD0+2ilA1sX0kBPiT28wbuQtjIpSysB4g3
 kYDV0omgCkZoBXWgDJZKtIaxLuuCbDPsBR2ehkg=
X-Received: by 2002:a92:4a08:: with SMTP id m8mr5445546ilf.227.1600793772665; 
 Tue, 22 Sep 2020 09:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200921221045.699690-1-ehabkost@redhat.com>
 <20200921221045.699690-20-ehabkost@redhat.com>
In-Reply-To: <20200921221045.699690-20-ehabkost@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Sep 2020 09:44:58 -0700
Message-ID: <CAKmqyKPWN+7wWBnQ5ar1Fn8k8M6Lk6qpxmuVaz-f-iQJOv9qSA@mail.gmail.com>
Subject: Re: [PATCH 19/24] xlnx-zcu102: Register properties as class properties
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JCQnn9RSpOtt

On Mon, Sep 21, 2020 at 3:28 PM Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/xlnx-zcu102.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 19d5a4d4e0e..4deb96bfcc1 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -208,20 +208,8 @@ static void xlnx_zcu102_machine_instance_init(Object *obj)
>
>      /* Default to secure mode being disabled */
>      s->secure = false;
> -    object_property_add_bool(obj, "secure", zcu102_get_secure,
> -                             zcu102_set_secure);
> -    object_property_set_description(obj, "secure",
> -                                    "Set on/off to enable/disable the ARM "
> -                                    "Security Extensions (TrustZone)");
> -
>      /* Default to virt (EL2) being disabled */
>      s->virt = false;
> -    object_property_add_bool(obj, "virtualization", zcu102_get_virt,
> -                             zcu102_set_virt);
> -    object_property_set_description(obj, "virtualization",
> -                                    "Set on/off to enable/disable emulating a "
> -                                    "guest CPU which implements the ARM "
> -                                    "Virtualization Extensions");
>  }
>
>  static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
> @@ -237,6 +225,19 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>      mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
>      mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>      mc->default_ram_id = "ddr-ram";
> +
> +    object_class_property_add_bool(oc, "secure", zcu102_get_secure,
> +                                   zcu102_set_secure);
> +    object_class_property_set_description(oc, "secure",
> +                                          "Set on/off to enable/disable the ARM "
> +                                          "Security Extensions (TrustZone)");
> +
> +    object_class_property_add_bool(oc, "virtualization", zcu102_get_virt,
> +                                   zcu102_set_virt);
> +    object_class_property_set_description(oc, "virtualization",
> +                                          "Set on/off to enable/disable emulating a "
> +                                          "guest CPU which implements the ARM "
> +                                          "Virtualization Extensions");
>  }
>
>  static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
> --
> 2.26.2
>
>
