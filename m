Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp351984lfc;
        Thu, 21 Oct 2021 06:56:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOH2N/76fXeRNWw4NUb8e6GDWsTjYShYSSgNetGygm2L+Ex1SAg2FptcDmNibZix/HVB8h
X-Received: by 2002:aca:d08:: with SMTP id 8mr4386991oin.101.1634824576048;
        Thu, 21 Oct 2021 06:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634824576; cv=none;
        d=google.com; s=arc-20160816;
        b=YLg9G+UbAp0lqulRa2iFgqxf9SHhANdLNeWFjA7BUIPEqwtOO6HD/uGOwzDROU71KX
         kMC0zNIMARijynlzlGXSAtC2PKA3xDYNDeaIwwwIypDakFilEtXZk8O2KKFJpJ55PAvj
         0Yhzl+6PP9UGwUGe909JPNmhFphqbd66Mvb30trTXAEhqHf4stBrZusCj/SXl6fOq/2G
         T3DRR9eZYY6Q5LlBc0W4ZhKqM5SxOoD9Jn5gSHdhspoUJYd5I8UcARbqWD2Hysvd/zyM
         Y54Pg1D5yVaMqRXt9ZLsL0OCG9i1gFL36zoJDZZfKYTrc8gJDQo10acAsC7U+gmNziyM
         gIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=RhF0SY9PHDqTfFm24g0QML/ciZDfF6UC0iRTlq5Px6o=;
        b=DQCswWVC5+F9hEAFRk91AFupkByziQRj4mjIGwJ33L9lJvXeg+7HdEclSrioo3ONYW
         KWwKXLQXjZ5UDzot45V/IRMrcQDQ8i9r5mvG+ERZUW0LRykn1qDZLYMqLH1QKP3aWlOE
         LdREMZvNFIdcGH6aqspDdCITyq7+HSEBvnYoopOgN6AAvBxxKdV9kxjdpkv1nXhQWWr3
         tU10gQMBdJ9mJDz3QjZ0nzbky/Frn7Y9Ad1XchHtlN5lAVhuUaIwl1oWrUlN4YydKG0+
         TYg2npnFa901t9boHPk+2x8Z2N5twosUJV0CULF3Nf0kjwfZlGeD49r3/6vfsPoYFgZP
         EmAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CrIOFKyH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u130si5755764oib.21.2021.10.21.06.56.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 06:56:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CrIOFKyH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdYYJ-0006Na-AV
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 09:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYWV-0005J4-DZ
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 09:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYWR-00077w-LI
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 09:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634824458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RhF0SY9PHDqTfFm24g0QML/ciZDfF6UC0iRTlq5Px6o=;
 b=CrIOFKyHbasWGrhusvIe6i0Jz01aQEn2lj9fgLMiVpRARmccbQoLlAZ7G0bdQnxbplHQQt
 FpRHz11n3DFh+sfGeaXhRjuE7jr2CxK6Fjb+6QH8xasHB1rjo+GC3KN+711vEhJ5vlHqgp
 yO2dJ5/dUdUkRdCYn1u2uaeNpSduLuo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-jjfxI4GMN0ugrXTJeHHpPw-1; Thu, 21 Oct 2021 09:54:11 -0400
X-MC-Unique: jjfxI4GMN0ugrXTJeHHpPw-1
Received: by mail-ed1-f71.google.com with SMTP id
 u10-20020a50d94a000000b003dc51565894so365791edj.21
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 06:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RhF0SY9PHDqTfFm24g0QML/ciZDfF6UC0iRTlq5Px6o=;
 b=6jB9TYpfrFzxg9pw1haPmjxMqEw90BumZf4aUcUXBlYEcW+RzF65iAhG7HlHxF5pd0
 52Qh4h6wW8WRuDMh0sz9KmYzp2KoKzdEBqbmNFP+tOQ7LH08odtcSrIcnvHP7m4TS4Bq
 TJxsPOwOXzhUM9zLyBV0OXpWlJN3CntBSIYwa0awEb3dycLzwKIZpOJOEDXIVluXz0u2
 grhr4018kc1ZIFxu7Zlauz3DBm49X1BVbMuXo+OavkdwjVwxn30+72yDsacLOZOOf7vh
 Z3sVsWpqzGcdS4o8UETV19xELzaKGmgtTveFf0Jkjz8HQ3UYw/6AGW1jQ3WUaEqEASnf
 KEkg==
X-Gm-Message-State: AOAM5328lzCCFiziicD94Jm2qPJVjKGDJKJlOk43XJ6+YGIbhbWOe2Ez
 tnEvU+UBPbkV/wPHjtG9lBYqNlvShfT8jTYxPVZHL7K6lJI1MLtkbvlmwJlVLT/mvOwSDmq2G0M
 dVSaIeph3pwzB
X-Received: by 2002:a17:906:fb91:: with SMTP id
 lr17mr7632096ejb.256.1634824450471; 
 Thu, 21 Oct 2021 06:54:10 -0700 (PDT)
X-Received: by 2002:a17:906:fb91:: with SMTP id
 lr17mr7632071ejb.256.1634824450319; 
 Thu, 21 Oct 2021 06:54:10 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id l23sm2577195ejn.15.2021.10.21.06.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:54:09 -0700 (PDT)
Date: Thu, 21 Oct 2021 15:54:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 07/12] hw/arm/virt: Reject instantiation of multiple
 IOMMUs
Message-ID: <20211021155408.43f999ea@redhat.com>
In-Reply-To: <20211020172745.620101-8-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-8-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, ani@anisinha.ca, pbonzini@redhat.com,
 eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yf1gH/gUX1Wb

On Wed, 20 Oct 2021 18:27:41 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> We do not support instantiating multiple IOMMUs. Before adding a
> virtio-iommu, check that no other IOMMU is present. This will detect
> both "iommu=smmuv3" machine parameter and another virtio-iommu instance.
> 
> Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3da7a86e37..25db8d4262 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2441,6 +2441,11 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>          hwaddr db_start = 0, db_end = 0;
>          char *resv_prop_str;
>  
> +        if (vms->iommu != VIRT_IOMMU_NONE) {
> +            error_setg(errp, "virt machine does not support multiple IOMMUs");
> +            return;
> +        }
> +
>          switch (vms->msi_controller) {
>          case VIRT_MSI_CTRL_NONE:
>              return;

