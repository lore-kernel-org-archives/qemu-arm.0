Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp356877ejb;
        Thu, 19 Oct 2023 01:28:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB2RB9tOiLMwm98towkTdbhAS69WguRYoCC8oXIcDU2Pe0hiwh1Jx7fOqaKWPjJOuLCxka
X-Received: by 2002:a05:6214:230f:b0:66d:4d99:bd3b with SMTP id gc15-20020a056214230f00b0066d4d99bd3bmr1957047qvb.23.1697704127071;
        Thu, 19 Oct 2023 01:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697704127; cv=none;
        d=google.com; s=arc-20160816;
        b=0WbOlv0vYmDmx8K6h3HwSUUX3doJASc475xgNxqiNmp+lG4zu/jyh7UmuyH5jIqK+j
         TyLKe8VPOzaFOtkq/WPogj7iW3tNxTVTK86Pfcd5rVKq2Wc/AexFXQQg57yMf5EYEdOe
         qQz/DX5ZO5g0F+UlHShtfFbZ9JNjnRGk0jOmuCpAQ7Klgq55X6TXM3OXOi8ERLppzNzU
         KQnTRMcUyxQwJSghNrGXFRmaHowTuZfuMMoyuGUjhhTfHSo2QRUwIBfqVyOz4VIqLnJ/
         +wxweaO/MeXrNiWtVBS3JMXpgaHCkoGpg1ly2C/vVJNtTkDI+dzh2q36rhl5kAgxYH/M
         OP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=cyOQrlkmtEWk2Rw4BGDSL9kgufGXc/+aJHL9lbxL0s8=;
        fh=/coRUL1wBKUBvSHKckqPd31uAjBR6MoeU+vSbjwwHlw=;
        b=vxYo9OLtP2Zt7TUh9eH/CzLmPskvKySt5rkJ+zvymrrS55FMGrXcio+tPmo9Tb03wE
         PoSn2o2k8ci0TVwcjXv+vDu7Qf+sPFnXOJ2UBc8AKxJLwCT1cDRscdiL0aaY1efdj9t0
         EGMloosaRs8bvWomZ8QczNTrR8Vqwo6mMrjP//WIBhxS0gbbEjvo8jqPp5/ZOEW2DmBJ
         fcXKofQ41JpHZ4kEyUPODGdtz7wtvfKJwVL/sjzpNX57TeiBAkusetAw+uV6pWNE8HeP
         qp0ftl4VW9/IiugzMscqRHVxtNNf/Bf2p4TTc6xgEKUnLMyEdu7GKtwkVYRTkFu1lBXR
         iXEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XjmleTqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020ac8580c000000b00400ab98ce1fsi1206343qtg.727.2023.10.19.01.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 01:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XjmleTqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtOOQ-0004XE-8o; Thu, 19 Oct 2023 04:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qtOOO-0004Vr-R6
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 04:28:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qtOON-0000Qi-7G
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 04:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697704110;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyOQrlkmtEWk2Rw4BGDSL9kgufGXc/+aJHL9lbxL0s8=;
 b=XjmleTqKsH8nVzUgn9BfCn9X2yj6UnwIuX6uIAKypvlnI8yNjfUcBtX8Q39XjgZDYsgwYr
 TmKsarJBcW+HTXY754jgki4/nZNgiEBEsDurNsVzAI4zrM9T3OZUmk++jdXCYAygg8OVaB
 eNu/GbVo1iEDIPpNrH4w2gFAtqtlV8Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-NY4NCWI9M5ac7pcvjQS9Sg-1; Thu, 19 Oct 2023 04:28:27 -0400
X-MC-Unique: NY4NCWI9M5ac7pcvjQS9Sg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A17918115B1;
 Thu, 19 Oct 2023 08:28:26 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D02AE2166B26;
 Thu, 19 Oct 2023 08:28:24 +0000 (UTC)
Date: Thu, 19 Oct 2023 09:28:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org,
 lvivier@redhat.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v5 04/10] hw/fsi: Introduce IBM's FSI
Message-ID: <ZTDopoa6j+rD9pIp@redhat.com>
References: <20231011151339.2782132-1-ninad@linux.ibm.com>
 <20231011151339.2782132-5-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231011151339.2782132-5-ninad@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZkAAaeolmZl3

On Wed, Oct 11, 2023 at 10:13:33AM -0500, Ninad Palsule wrote:
> This is a part of patchset where IBM's Flexible Service Interface is
> introduced.
> 
> This commit models the FSI bus. CFAM is hanging out of FSI bus. The bus
> is model such a way that it is embedded inside the FSI master which is a
> bus controller.
> 
> The FSI master: A controller in the platform service processor (e.g.
> BMC) driving CFAM engine accesses into the POWER chip. At the
> hardware level FSI is a bit-based protocol supporting synchronous and
> DMA-driven accesses of engines in a CFAM.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
> - Incorporated review comments by Joel
> v5:
> - Incorporated review comments by Cedric.
> ---
>  include/hw/fsi/fsi-master.h |  30 ++++++
>  include/hw/fsi/fsi.h        |  37 +++++++
>  hw/fsi/cfam.c               |   2 +-
>  hw/fsi/fsi-master.c         | 199 ++++++++++++++++++++++++++++++++++++
>  hw/fsi/fsi.c                |  54 ++++++++++
>  hw/fsi/meson.build          |   2 +-
>  hw/fsi/trace-events         |   2 +
>  7 files changed, 324 insertions(+), 2 deletions(-)
>  create mode 100644 include/hw/fsi/fsi-master.h
>  create mode 100644 include/hw/fsi/fsi.h
>  create mode 100644 hw/fsi/fsi-master.c
>  create mode 100644 hw/fsi/fsi.c
> 
> +static void fsi_master_realize(DeviceState *dev, Error **errp)
> +{
> +    FSIMasterState *s = FSI_MASTER(dev);
> +    Error *err = NULL;
> +
> +    qbus_init(&s->bus, sizeof(s->bus), TYPE_FSI_BUS, DEVICE(s), NULL);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &fsi_master_ops, s,
> +                          TYPE_FSI_MASTER, 0x10000000);
> +    memory_region_init(&s->opb2fsi, OBJECT(s), "fsi.opb2fsi", 0x10000000);
> +
> +    object_property_set_bool(OBJECT(&s->bus), "realized", true, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }

Redundant Error object, just check return value of set_bool

> +
> +    memory_region_add_subregion(&s->opb2fsi, 0, &s->bus.slave.mr);
> +}

> +static void fsi_bus_realize(BusState *bus, Error **errp)
> +{
> +    FSIBus *s = FSI_BUS(bus);
> +    Error *err = NULL;
> +
> +    /* Note: Move it elsewhere when we add more CFAMs. */
> +    object_property_set_bool(OBJECT(&s->slave), "realized", true, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +    }

Likewise.

> +}
> +

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

