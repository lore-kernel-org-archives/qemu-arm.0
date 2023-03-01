Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6999193ejc;
        Wed, 1 Mar 2023 06:10:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8y6Na7GPbg9c8nFxqOLXobktJd+irfOEUOJ03SPahZ0fhcu7cOzqEcmxgAOj0qRnADBPOo
X-Received: by 2002:a5b:108:0:b0:a31:8080:2028 with SMTP id 8-20020a5b0108000000b00a3180802028mr5318682ybx.41.1677679805797;
        Wed, 01 Mar 2023 06:10:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677679805; cv=none;
        d=google.com; s=arc-20160816;
        b=ZR2U6FWFDiJ0Tp4W++YGYqU7/UoiWd2sdzXuq7+L/F67v7CYwgo0dXXXIwIOEyayGm
         EkcftjoAcwIQhWrq+JNxkKRaunv/I/IdK6bs3GgzqyDG0J/8cYErKxA55ryvXGGhpw2Y
         u/cIWB7DYPmEAuJL/oB+4bOjqPRFcd4OJfdhmmLCINO5nZsvFedUX2CuI7jdLPeqv4+t
         h755xfBZevHMADW3cK0LtHOjkW2EPmNpbK1FvmpI/6ehYEvZcgiP4VUsge3OzK1zBXsy
         qmSeN2fUh+9Rdki7SJBxttClFWM2FxdjCzJVupyfq4xHMa8JiKKjMtR8mM7pjHGIHRZO
         Gi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=SL4Mx1u9PRTtlDNjVCwdJnpam7mtkh6o1cTY3iQw2tk=;
        b=jUJ3VKZHnRkYVUf64AjZ+iAbnyU+IUn4DsdlzGqCQe5YQujvyeALpPLQGMt0vWs58y
         4Fyu8tffQYx6hLPQ14kZQrXQeWPXL1cwBaR/Dut35fUp1l3sZg2KCeixbUFUnO67YDHn
         wv5TrAgJIAgk5/LeBo6mXz/mSRroXB4vFVr7UsX9ozeFACrthMzEg6O1iLEa95J0DkEY
         Cea2XthyDxU0LVW+YFh16TDMhmBuVSTvoV0iTqrrhZCIQAP5VQM5102HFFrgoGyosJ//
         v+j6dH7alLP+kgud7kCk2gUuIt5dcq33KPt7kwrhJtqDmOObSmo730Yl3eBVIqu8tNDu
         iseA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RWSfpaUS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020ab066d3000000b00660a59414bbsi4149779uaq.130.2023.03.01.06.10.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 06:10:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RWSfpaUS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXN9V-00074G-Gm; Wed, 01 Mar 2023 09:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXN9O-0006qT-Ox
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 09:09:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXN9N-00067A-3c
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 09:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677679784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SL4Mx1u9PRTtlDNjVCwdJnpam7mtkh6o1cTY3iQw2tk=;
 b=RWSfpaUS/lhZL0xGA9/U4jdlKa60GDhx6pYHamnd3SO4SYiVj0m5utmfniMtJX5Du0zttO
 87pwzgXn2ujKVZOSzDduQsJAxhOtp+ONlocWwvuslFbn+C/ql1rH4vnbb45pY+pScfYXRB
 JBCsT3OUqylRxccn9WCOiqv1/1EbEJM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-v-kTnx1uMJuRDiovN4XenQ-1; Wed, 01 Mar 2023 09:09:43 -0500
X-MC-Unique: v-kTnx1uMJuRDiovN4XenQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 m7-20020a056000008700b002c7047ea429so2601236wrx.21
 for <qemu-arm@nongnu.org>; Wed, 01 Mar 2023 06:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677679778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SL4Mx1u9PRTtlDNjVCwdJnpam7mtkh6o1cTY3iQw2tk=;
 b=5B7tsvJ236Jsihtntucih19uE0/XAAv8vcu8GeOaLAU5JB4fWrviFq3Mh/wNNZIDHW
 W7kgMMVmPZVG/FN2/pkQCox2qa3dIlhR3pwbY2MfZGVcnmvh6r5uwve8Y+tb158FP8Yz
 BRbOdBUAKvrFBvz4qJpsIoFCMdmkaDBFLlQkvIpSIhGFZvNeL+xloMzLCGyNFAtdWZ7L
 3Cy3qChhcfwcFYYsl6mJtyhMbwUShXtEp+7w7ZkY5N3zmQe8dGFqSZCwcPNiZbDfFjF4
 f8AA15mj3I3weXEHLomifISdHk43r2QCShhE9qDg8/msjuJdVYftYTGdH9Tu3Ek5+CIL
 G/Dw==
X-Gm-Message-State: AO0yUKXSmCPxZ4I0FRTFIeDm3zcxC7SgEw93zR48WBcmqn4R0El8/qc9
 rAEhOgYeKAfL5OWJjoa/6ArpLaTK0woefmw4j9bv9wydpOXVWxgthI5M4wiHRuyI4NffQeEWi2s
 9yJc5Ap91xxFM
X-Received: by 2002:a05:600c:3b28:b0:3eb:2da4:f304 with SMTP id
 m40-20020a05600c3b2800b003eb2da4f304mr4948055wms.17.1677679778525; 
 Wed, 01 Mar 2023 06:09:38 -0800 (PST)
X-Received: by 2002:a05:600c:3b28:b0:3eb:2da4:f304 with SMTP id
 m40-20020a05600c3b2800b003eb2da4f304mr4948043wms.17.1677679778223; 
 Wed, 01 Mar 2023 06:09:38 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 n33-20020a05600c502100b003e8dc7a03basm20209830wmr.41.2023.03.01.06.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:09:37 -0800 (PST)
Date: Wed, 1 Mar 2023 15:09:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-riscv@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH 05/19] hw/core/numa: Set QDev properties using QDev API
Message-ID: <20230301150936.1eaf5697@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230203180914.49112-6-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
 <20230203180914.49112-6-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5twY4PCF1RqJ

On Fri,  3 Feb 2023 19:09:00 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/core/numa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index d8d36b16d8..9b6f9848e3 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -34,6 +34,7 @@
>  #include "qapi/opts-visitor.h"
>  #include "qapi/qapi-visit-machine.h"
>  #include "sysemu/qtest.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/core/cpu.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "migration/vmstate.h"
> @@ -740,8 +741,7 @@ void numa_cpu_pre_plug(const CPUArchId *slot, DeviceS=
tate *dev, Error **errp)
>          /* due to bug in libvirt, it doesn't pass node-id from props on
>           * device_add as expected, so we have to fix it up here */
>          if (slot->props.has_node_id) {
> -            object_property_set_int(OBJECT(dev), "node-id",
> -                                    slot->props.node_id, errp);
> +            qdev_prop_set_int32(dev, "node-id", slot->props.node_id);

broken, see cover letter reply

>          }
>      } else if (node_id !=3D slot->props.node_id) {
>          error_setg(errp, "invalid node-id, must be %"PRId64,

