Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5670289lfp;
        Tue, 5 Oct 2021 23:36:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztJfc5e9S6klh5tAca79zCME0RjVS3onkNFMb2tTFyT6FzUxbjyRpzFV9J4glRQMlESsbZ
X-Received: by 2002:a05:6638:35ac:: with SMTP id v44mr5771426jal.48.1633502183353;
        Tue, 05 Oct 2021 23:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633502183; cv=none;
        d=google.com; s=arc-20160816;
        b=FwflMDqYx3LdJQk77hDurqGzZYNskVdqb8e94fgFARhzZFDG8MhoIUdh9xbJoTrPvQ
         Gi+j3iWt0AZn6QIkvh3r9oOKRWyQTHU01mXSPhza7SLIG/Jzu3LtoLz+1ap1Fx+GoCrv
         RqhaEhRp/8kGLirpK8hcTdIYgBBgOCmRTi/JO3Fzo//3ZppdhMl7FLDtz2T713ei2Vgt
         5Qo3Lc5RCOs2kJQh/HOJOZ4p7HeydbFuISxSWCkeo6X85jZXvXdU7dduSkm/0YKxHZBq
         h7XrK0p5r3LpXjtVXoHW5gwVHsQ+D4BUUszhWYJqnSDQ2BICTzJO8cPkIR0R3LIs6XFi
         ve2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=2l9E43JkOrZMuVpdd8mAX/XuX5CbJ3P/IZfh7LCORXU=;
        b=eKP/PSX4t7KzPmI8Ts8i9PSdOBgY3pkz6XNid0HPCGKUqqEQTCWCniWZTMY5UBHX0W
         wOsSufBbvUFWjE8G8LB7QI3OZ1xM3wA0ReHIAyPv8geT5PdLN/A+zRGyckelj99qvnkW
         J6D5krT6Nm2TdYc/212i9pwHdPlwujW212Tuuoxih9SCtgO0l5zIc6tlqsXp2R/Hgykt
         AbQFWqJM+fkzU68Nkf2BYISI0wlc+s0qnq9I3eY7R0yhijrZItBflFfNNyEACViSxeqP
         LwyJBKUVc5bPS7mbBFxSee2lYNw9Dp3RvG1P7xXmJjqLGwb18R7MLVKEgkWZIYSdz4cD
         Mgtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J9YICGzS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16si9720640ilr.38.2021.10.05.23.36.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 23:36:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J9YICGzS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY0XO-0005tt-Kj
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 02:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY0XB-0005r2-Th
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 02:36:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY0XA-0003Y8-CY
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 02:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633502167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2l9E43JkOrZMuVpdd8mAX/XuX5CbJ3P/IZfh7LCORXU=;
 b=J9YICGzSECE7TUUM3Y9KUaWFfalGBN4pbkRdKPLeCxil92kUyGbADghovu2gmeuAN+AW7C
 1t6XP5dNc373wMeTQfftu/BPI36mI8ab50skU4/kPNrwXNUYvgm0T9p8ZLVAPMsZD5BPDG
 oENVCKRUvP0wGk6zhSGrzfPNWA9Zb0I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-I-1uvAsVO8W1Ub-oS2Y7hw-1; Wed, 06 Oct 2021 02:36:06 -0400
X-MC-Unique: I-1uvAsVO8W1Ub-oS2Y7hw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so1154269wrv.19
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 23:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2l9E43JkOrZMuVpdd8mAX/XuX5CbJ3P/IZfh7LCORXU=;
 b=KSlnpGw2KcFcv9/UlUkuYBRGTNRgHIzrDmP0p4t9fWaP/B0vTuxFU8BOedwNR4Gbf4
 8b/BrhAvZJ2444ZDyE82LCiNqgrGJumxW020mKVV5DCV6MlrRzim/l21K4AUvVxUlgNJ
 7aCJEwl1l1AFu0P12hHC23fl7KD1YTZd69geE0ljxTKKw8UGIYQNmqH2p1hMjkOxcnb5
 iEidYZdfknahjhlJ5Aamx2U+h/ofloUreKQGVSNEniKMXsaoUf1FIpsPQuX9/EF/6kWB
 VB2cF5YLmVjPVrS1UMOwY7McfoTZYqkgK3w83Uiuth+oVSZyfr+imMoBvYSRfNL8V/5z
 b1Yw==
X-Gm-Message-State: AOAM530nFb2RcYBdW/BGsa45c7PUXOB1HwdE2I6QfRfCJ+1vX4g1XEhi
 gHPKAUhc5eszDoZdZh2L+bjSa+LiP68x5oz64/cRrXhY3Gk39qPrgwsDgm/EPeeNGMqTBMT1bbn
 TG3jWO0gm65q0
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr7745942wmj.11.1633502165750; 
 Tue, 05 Oct 2021 23:36:05 -0700 (PDT)
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr7745924wmj.11.1633502165620; 
 Tue, 05 Oct 2021 23:36:05 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id l11sm5403075wms.45.2021.10.05.23.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 23:36:05 -0700 (PDT)
Date: Wed, 6 Oct 2021 08:36:04 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 05/11] hw/arm/virt: Use object_property_set instead
 of qdev_prop_set
Message-ID: <20211006083604.4ce3cee3@redhat.com>
In-Reply-To: <20211001173358.863017-6-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-6-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ysfhj+eGuuPh

On Fri,  1 Oct 2021 18:33:53 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> To propagate errors to the caller of the pre_plug callback, use the
> object_poperty_set*() functions directly instead of the qdev_prop_set*()
> helpers.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 36f0261ef4..ac307b6030 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2465,8 +2465,9 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                          db_start, db_end,
>                                          VIRTIO_IOMMU_RESV_MEM_T_MSI);
>  
> -        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> -        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
> +        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
> +        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
> +                                resv_prop_str, errp);
>          g_free(resv_prop_str);
>      }
>  }

