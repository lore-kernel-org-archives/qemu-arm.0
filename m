Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp351788ejb;
        Thu, 19 Oct 2023 01:15:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaB5ONrRxBqBPDEsKARwcMZ2P7PCbxU9cO0K99QxaWwqx0WATJwga3/JW1kmSarOuvyDTJ
X-Received: by 2002:ac8:7e86:0:b0:41c:c045:2c87 with SMTP id w6-20020ac87e86000000b0041cc0452c87mr1782929qtj.40.1697703341504;
        Thu, 19 Oct 2023 01:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697703341; cv=none;
        d=google.com; s=arc-20160816;
        b=XnQwxLkzmLE/PEgY7j8Ydm4qmrrjh1+P2L1xgHiWtEcIlSANYY7qTFXONLq2FVe05k
         K9551mE6IOFBqc6c6pZVsUFXm30IT0tdGXERpAIfxDIquvIjaRks0pi3aUZdwYFmswAR
         bOCBPbk5yCEgc+vbNxlscJBDc8mAhgj8w0owkO8T4dU1OQ6QyU15BfwF13OHEsTjGFrq
         5r0dSg6f4o9jsuIhIn1XrKUR9qrVFp2Oi7Epsp/cCeO2Ja6EOyxhq5u2axVxhyfn5j8R
         fhF8Zh2odjZ7n43A0P/3IMcX9HdTfr0xxYJPgwdKm3SY4zZKrnbN5x5VQDgLM48vVlg7
         uiEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=c+JwufTlygzJzLLn/MxBZzJX10Nzy5Sd/Z/kcgewPZI=;
        fh=/coRUL1wBKUBvSHKckqPd31uAjBR6MoeU+vSbjwwHlw=;
        b=EZnHr5ivKHiAE2xaxuNrqAx8d/MMk/WmJWz48+sW2BBMoqq5In92WQN5OkN4UlJNPm
         WN1dqHg179PsgioHSEFBvg3IxYRFhzpIPXNdLuBOz39Xi3PdPTIs5Ri2RX61RyIJCm/c
         iyA+zt09/baeu4OalGE/MMMLH+L+yGjSFVPkyy2UF2ESk8iJsg+agfXsPzA+jlkrDY2l
         VGB24r4AN9fHifI3ioVVQCbud2ZrV3Sy1ot+cAjzQmdLPT7z8rDiwt0/EGp2pKYF8m9n
         XdVTYUci9RSo+O7LDuwCFFdIje14zPooFa4E+Pzvz+pKKPX9dwpWMTeLdxPFt1daCQce
         llBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UOfxP4b3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020ac858c5000000b00419858cf400si1189961qta.673.2023.10.19.01.15.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 01:15:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UOfxP4b3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtOBY-0002lJ-Ri; Thu, 19 Oct 2023 04:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qtOBQ-0002kR-Ni
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 04:15:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qtOBO-0003P4-8j
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 04:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697703304;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c+JwufTlygzJzLLn/MxBZzJX10Nzy5Sd/Z/kcgewPZI=;
 b=UOfxP4b3rJlaSUQOAFe5jtz8TIwjwTMGEVhkYHvwdsN5TpcjfhuYURYDCUH3mT2WPNVDG9
 0fu461p8HLVSEx42hnLjNXrL2C3TCimpIhC65GcYxjAd+YC3L9L7adUQGx5zV35zSEbCVv
 17+P6E6L+vG7nRK5AzvaJ1nnnA5RF1U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-BoW4Q1vbM6S8CrxSyXIR-g-1; Thu, 19 Oct 2023 04:15:00 -0400
X-MC-Unique: BoW4Q1vbM6S8CrxSyXIR-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CB4510201E0;
 Thu, 19 Oct 2023 08:15:00 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 070431121314;
 Thu, 19 Oct 2023 08:14:57 +0000 (UTC)
Date: Thu, 19 Oct 2023 09:14:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org,
 lvivier@redhat.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v5 01/10] hw/fsi: Introduce IBM's Local bus
Message-ID: <ZTDlf2jfj5tYGuSM@redhat.com>
References: <20231011151339.2782132-1-ninad@linux.ibm.com>
 <20231011151339.2782132-2-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231011151339.2782132-2-ninad@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: 6kZ7P6qgQzSj

On Wed, Oct 11, 2023 at 10:13:30AM -0500, Ninad Palsule wrote:
> This is a part of patchset where IBM's Flexible Service Interface is
> introduced.
> 
> The LBUS is modelled to maintain the qdev bus hierarchy and to take
> advantage of the object model to automatically generate the CFAM
> configuration block. The configuration block presents engines in the
> order they are attached to the CFAM's LBUS. Engine implementations
> should subclass the LBusDevice and set the 'config' member of
> LBusDeviceClass to match the engine's type.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> v2:
> - Incorporated Joel's review comments.
> v5:
> - Incorporated review comments by Cedric.
> ---
>  include/hw/fsi/lbus.h | 51 +++++++++++++++++++++++++
>  include/qemu/bitops.h |  6 +++
>  hw/fsi/lbus.c         | 87 +++++++++++++++++++++++++++++++++++++++++++
>  hw/Kconfig            |  1 +
>  hw/fsi/Kconfig        |  2 +
>  hw/fsi/meson.build    |  1 +
>  hw/meson.build        |  1 +
>  7 files changed, 149 insertions(+)
>  create mode 100644 include/hw/fsi/lbus.h
>  create mode 100644 hw/fsi/lbus.c
>  create mode 100644 hw/fsi/Kconfig
>  create mode 100644 hw/fsi/meson.build

> +DeviceState *lbus_create_device(FSILBus *bus, const char *type, uint32_t addr)
> +{
> +    DeviceState *dev;
> +    FSILBusNode *node;
> +    BusState *state = BUS(bus);
> +
> +    dev = qdev_new(type);
> +    qdev_prop_set_uint8(dev, "address", addr);
> +    qdev_realize_and_unref(dev, state, &error_fatal);
> +
> +    /* Move to post_load */
> +    node = g_malloc(sizeof(struct FSILBusNode));

This allocation pattern is discouraged in favour of:

    node = g_new0(FSILBusNode, 1);

> +    node->ldev = FSI_LBUS_DEVICE(dev);
> +    QLIST_INSERT_HEAD(&bus->devices, node, next);
> +
> +    return dev;
> +}

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

