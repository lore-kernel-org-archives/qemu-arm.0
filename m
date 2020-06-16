Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2732846lfm;
        Tue, 16 Jun 2020 08:46:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNP2GWrrlnWALbglv+VhhC3RBHqaOofg3lSl2eSKWoqnA4M+nQPIew1sK6ILGUlZ1bC0Dc
X-Received: by 2002:a25:348c:: with SMTP id b134mr5580128yba.105.1592322366852;
        Tue, 16 Jun 2020 08:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592322366; cv=none;
        d=google.com; s=arc-20160816;
        b=T/oRexdrwwryOwcZh2Ja/E+9UhUi02GZJPCSj2QzUPj4CpmCW5rXYPEwCk/eT4cADg
         Faqlf+uho5DGuw9Sn+POTw9wILG+Ek7xllv76+dtk65sGK38FHQtiniRRqxy3NL0NLHB
         tZcGAsZBTXQnamZ03qh43M4inUsu+wV3ruVJnFRtsIETmRMAG3T8XELJqeJFWR9T6Okx
         Pv0zT+pgoZXe0PcavMl0yKMY+vPqxulN1vWc9hzMiDZYV0l1odI0OtUPqMOa76usl/wD
         vCQM9B1PPiefA2MFexugb5aOcRw8In0cB1L7ldUhckZ74jA63Fn9q0Qp4jFBt4FelNKT
         5ikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=tKPQl7/IAT68akl9Ckfp/uPWqNuXCRIbQQxygkP4gKM=;
        b=0Zy3YAHjpJ+Qc5Rb1xdYL2cqKk+0m0FlLzNsdV0JfXBBxmQHQxj7C6dtcYC28W3k9F
         kwaESGM02nVcOaQO07DxB/Gt7TdS4bsTsjGCQ8jvhSUILnbf0jT5dqqm6nVyFywadkg2
         g/mLYhrooB8rhfBTUeGayl6cmr5NNfqtP+hAC7tkWz9MtAgcXSskBL/MxC9MsiWxfGz6
         OBzzBWxmYC+BOAZ804ICgrbKr0slqZ1aRCL1A9pt+plml4k/06tehdosGMCTefvBekgM
         MLcjM1zVFlOFKJLfAiBvdXYx7bbbmMJb2k91TaAzWI2N+TO36yMScEQWT5RFQglhthJE
         bjUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RB2ar527;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n191si16435933yba.173.2020.06.16.08.46.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 08:46:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RB2ar527;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlDmo-0007jj-60
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 11:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jlDmM-0007jR-Dj
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 11:45:38 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27491
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jlDmI-0000o9-GA
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 11:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592322332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKPQl7/IAT68akl9Ckfp/uPWqNuXCRIbQQxygkP4gKM=;
 b=RB2ar527cceZ3l0gA349yd3hGQfSMGIklbE+OfTnPSfTonSypJglnLvEGTEeFn0pZkTgLA
 BXobQpBtuVc4BXEPB+cE4T56mAuAB61U9K7phWOQR+KQZSHlUmlODoXa5snP6jvQ2+EJgY
 rIIlyVYLff/u2tFHtC9WIatIvBBfQ0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-OUhh_qsDMva4zQJIjKr9sQ-1; Tue, 16 Jun 2020 11:45:31 -0400
X-MC-Unique: OUhh_qsDMva4zQJIjKr9sQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02EA6EC1A5;
 Tue, 16 Jun 2020 15:45:30 +0000 (UTC)
Received: from gondolin (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F19A319C79;
 Tue, 16 Jun 2020 15:45:28 +0000 (UTC)
Date: Tue, 16 Jun 2020 17:45:26 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Add 5.0 HW compat props
Message-ID: <20200616174526.36e59545.cohuck@redhat.com>
In-Reply-To: <20200616140803.25515-1-drjones@redhat.com>
References: <20200616140803.25515-1-drjones@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:01:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Aue4YBNUsbyd

On Tue, 16 Jun 2020 16:08:03 +0200
Andrew Jones <drjones@redhat.com> wrote:

Fixes: 541aaa1df80d ("hw: add compat machines for 5.1")

> Cc: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index caceb1e4a05f..8b6e6aa7b138 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2375,6 +2375,7 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
>  static void virt_machine_5_0_options(MachineClass *mc)
>  {
>      virt_machine_5_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len);
>  }
>  DEFINE_VIRT_MACHINE(5, 0)
>  

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

