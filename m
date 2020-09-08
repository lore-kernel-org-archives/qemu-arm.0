Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp490954lfq;
        Tue, 8 Sep 2020 03:52:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwC5j0E8xnVK6DmjLn0PeGzIIJn3V/sDC55Be/pabkehf+tZsMdeNNjGdAtC+y4g4DAyrSe
X-Received: by 2002:a25:c2c7:: with SMTP id s190mr32559417ybf.161.1599562373425;
        Tue, 08 Sep 2020 03:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599562373; cv=none;
        d=google.com; s=arc-20160816;
        b=CZ/qlzmOdK+s72MCDIlMZk5jDz50clyQmYiA2cQ0DsgWd29sNbR3MGd2ElKoZWIKJ+
         DdJTIDbQZnHdyDNniO8YPYaW1tYtGYr6+7wJbLBS1Pp8BtYrzWjigGsNO8PAo+M7cTZ0
         fdhpjknKyk553UGjyPDXrBS183KIqxIo2jVrTkrwQpvD2ufpI1R1aM258NCYHPQgknsZ
         nDfFL4yVWRRqSoQWIXUsUXb2EOUF95D9VqtyBYFWfANBp/zJDdwg4K8DhF0z8PLgtoRv
         InM7uYgVRkbKfiYcd8sGIDvsqwZTmRVUKsykuFzVjGeO4T/8cyjEp4NBI1/u7idwuNr3
         bgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=mQrCMpTrpm2Ph1NxZysYlWZwHihjh/8Y/i1cDZu2xgo=;
        b=MdVrjZJXan6Kcu4fkjLYvflREv09/pBzpfebHOvJmRtXSqR7yy5fbWa1B0HqfQz0qn
         gWIOTUPTY/jZp8u0eFDhafBHRBGfXYwYnMIxjyj+5dbpU244Phw0F7RlTukq8bYw5YfP
         HgBCrU/PDxJ6zoQrqoi3K8RTOK0XU1+Bt+Guv8M3e7XPel/ocY4238G3Bo6sbcwHAbaZ
         Y1ZVjOMoFEVV7Xj+aUPOR5VkdQd0hy3MgfJ3o0v3ZlSYhvBF8e3aq6mmzLTUygw+aLEQ
         3gkS3wCDekSfkD18g06ZZcKdlwEhPzFlCF7IPID8us0PHGLtSs0If1iMahO6zrk0909h
         T9yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OESOpDBl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si17361330ybf.188.2020.09.08.03.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 03:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OESOpDBl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFbF6-0002j8-SX
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 06:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbEw-0002gz-Fd
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 06:52:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36946
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbEu-0003oB-Te
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 06:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599562359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mQrCMpTrpm2Ph1NxZysYlWZwHihjh/8Y/i1cDZu2xgo=;
 b=OESOpDBlG3A9Gt+uzYlZBtkOmXDH1e7C0U38wYFZq6UgNNU4MO3+2t8uGLd7/NkluGtOaq
 cXGrv/z2GjW9sIgiFuj1kzpbQHL6WofaenIXPmEtI2L8QDSWergzNVV5YElPm3XMwoL+Iw
 Ct9Go5Lhg4eGlcRG9g0ggccn9D7yWRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-C7H542CsPuyyuuZNfxfdeQ-1; Tue, 08 Sep 2020 06:52:36 -0400
X-MC-Unique: C7H542CsPuyyuuZNfxfdeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F92F8797E1;
 Tue,  8 Sep 2020 10:52:35 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91DF25C1BB;
 Tue,  8 Sep 2020 10:52:33 +0000 (UTC)
Date: Tue, 8 Sep 2020 12:52:30 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 04/12] target/arm: spe: Only enable SPE from 5.2
 compat machines.
Message-ID: <20200908105230.4c4ddlvspfjknftr@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <7ed8b1ff7a61132c6520f87213c61784ab0c331b.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <7ed8b1ff7a61132c6520f87213c61784ab0c331b.1599549462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: philmd@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jDzOehPCibRK

On Tue, Sep 08, 2020 at 08:13:22AM +0000, Haibo Xu wrote:
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  hw/arm/virt.c         | 7 +++++++
>  include/hw/arm/virt.h | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index acf9bfbece..3f6d26c531 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1830,6 +1830,10 @@ static void machvirt_init(MachineState *machine)
>              object_property_set_bool(cpuobj, "pmu", false, NULL);
>          }
>  
> +        if (vmc->no_spe && object_property_find(cpuobj, "spe", NULL)) {
> +            object_property_set_bool(cpuobj, "spe", false, NULL);
> +        }
> +
>          if (object_property_find(cpuobj, "reset-cbar", NULL)) {
>              object_property_set_int(cpuobj, "reset-cbar",
>                                      vms->memmap[VIRT_CPUPERIPHS].base,
> @@ -2553,8 +2557,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
>  
>  static void virt_machine_5_1_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_5_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
> +    vmc->no_spe = true;
>  }
>  DEFINE_VIRT_MACHINE(5, 1)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index dff67e1bef..72c269aaa5 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -126,6 +126,7 @@ typedef struct {
>      bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
>      bool kvm_no_adjvtime;
>      bool acpi_expose_flash;
> +    bool no_spe;
>  } VirtMachineClass;
>  
>  typedef struct {
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com> 

