Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp366796ejn;
        Wed, 19 Oct 2022 07:07:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5fnwvSd2p1/LXyVaEv//FdaIQlV9rs9dDtqHrrr0ZqZCnN0AchRVFfixmth/idveigvZBF
X-Received: by 2002:a05:620a:2844:b0:6b8:5f52:a6b5 with SMTP id h4-20020a05620a284400b006b85f52a6b5mr5624922qkp.351.1666188453303;
        Wed, 19 Oct 2022 07:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666188453; cv=none;
        d=google.com; s=arc-20160816;
        b=QvN68++pTzlhdk64NHi372xA+fAKjUCL6/mdUiQOAUAlB2ndv4jg1/cC/xl7v3Ivvc
         2+nynlIlTn6nSO6A7tuUhRm4h1/WGqqgdqTOmye9GRrLggpQYYo7phzTFnpL4TzJa4VT
         T54CyPk5Jxp0WfWFwW3W4YQPzJbAWjDskl4996FYp2tk1sM/0EN+KYHSPD1c1m1Bn7zx
         InVUtEBuJBtKm2dbCLzivH0r1DF0faGPKg7TZEaysDuiMZv6kOYhQGpBxJB4G3K7zBbD
         McftuX2wTG0HUQaEXqvLsUK8KWcNcn1bRbFLpf7l2UfpSa9QhQVUJ5KnuBYaDssVcxEi
         JSIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=bYXp/7z7CxUY/LvjrFaKKhgw5Sd733e6+8BM8y44Kls=;
        b=v+Q60/PMAO1kmwV/5iYr62nx0QA02YdLSvJNksDP/B818v9hglZJ1DmBXThM8llmL2
         XyosQ/pEc88lQBOUyhnbaTIfGf9XnNhLXsElFJ3xYAEA1yy6hejHe0bQKJRCdUh5xZYG
         A/ZC7W0EaY7DoV9Qhwkujfe8zyLHmjOQIUU/d1QS6H4qdJEmzdCQ9hbQjPLI5PzoGsnp
         Y3X7RALLFA2eslhi+SwG2RSf4nKrZ+VP2sXazNKeQkN+4TnRDm0sOKquhErrP3yJjxx/
         h94ta7Go+9w0gijWE1xLmCpTnlabIb8OK7dyDfAOy96ypW7AtXLmsqm8f8owlLdns0H6
         3Siw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q5cVHFUO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id nd10-20020a056214420a00b004b186aae371si7326643qvb.544.2022.10.19.07.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 07:07:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q5cVHFUO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ol9jH-0000tO-Kh
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 10:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ol9d6-00063b-Bt
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 10:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ol9cy-0006SO-9g
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 10:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666188059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bYXp/7z7CxUY/LvjrFaKKhgw5Sd733e6+8BM8y44Kls=;
 b=Q5cVHFUOEUx55YlNNP1imY1XCjKyMetW/FKONqTRKFV0vlVtv0pJ6ieAfvGmiUP1ZwzGpR
 zR7qEiHhZeB3AOvE7MpakE8ep+gv/XLW1XpfHqJj3s71uxMrRdNqrIidLfet2j1EWUJdUo
 2R+5sawN2eECjfJPj+QOLkEfHZZvrEk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-92fkU21IO7-P3JAW_lL_5g-1; Wed, 19 Oct 2022 10:00:55 -0400
X-MC-Unique: 92fkU21IO7-P3JAW_lL_5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35EA080602C;
 Wed, 19 Oct 2022 14:00:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82DF22028E98;
 Wed, 19 Oct 2022 14:00:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v5 6/6] hw/arm/virt: Add 'compact-highmem' property
In-Reply-To: <20221011231832.149839-7-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-7-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 19 Oct 2022 16:00:46 +0200
Message-ID: <87wn8vzze9.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +ZdYBt/mgf37

On Wed, Oct 12 2022, Gavin Shan <gshan@redhat.com> wrote:

> After the improvement to high memory region address assignment is
> applied, the memory layout can be changed, introducing possible
> migration breakage. For example, VIRT_HIGH_PCIE_MMIO memory region
> is disabled or enabled when the optimization is applied or not, with
> the following configuration.
>
>   pa_bits              = 40;
>   vms->highmem_redists = false;
>   vms->highmem_ecam    = false;
>   vms->highmem_mmio    = true;
>
>   # qemu-system-aarch64 -accel kvm -cpu host    \
>     -machine virt-7.2,compact-highmem={on, off} \
>     -m 4G,maxmem=511G -monitor stdio
>
>   Region            compact-highmem=off         compact-highmem=on
>   ----------------------------------------------------------------
>   RAM               [1GB         512GB]        [1GB         512GB]
>   HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
>   HIGH_PCIE_ECAM    [512GB+256MB 512GB+512MB]  [disabled]
>   HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
>
> In order to keep backwords compatibility, we need to disable the
> optimization on machines, which is virt-7.1 or ealier than it. It
> means the optimization is enabled by default from virt-7.2. Besides,
> 'compact-highmem' property is added so that the optimization can be
> explicitly enabled or disabled on all machine types by users.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>  docs/system/arm/virt.rst |  4 ++++
>  hw/arm/virt.c            | 47 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h    |  1 +
>  3 files changed, 52 insertions(+)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 20442ea2c1..75bf5a4994 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -94,6 +94,10 @@ highmem
>    address space above 32 bits. The default is ``on`` for machine types
>    later than ``virt-2.12``.
>  
> +compact-highmem
> +  Set ``on``/``off`` to enable/disable compact space for high memory regions.

Maybe s/compact space/the compact layout/ ?

> +  The default is ``on`` for machine types later than ``virt-7.2``
> +
>  gic-version
>    Specify the version of the Generic Interrupt Controller (GIC) to provide.
>    Valid values are:
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c05cfb5314..8f1dba0ece 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -174,6 +174,27 @@ static const MemMapEntry base_memmap[] = {
>   * Note the extended_memmap is sized so that it eventually also includes the
>   * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the last
>   * index of base_memmap).
> + *
> + * The addresses assigned to these regions are affected by 'compact-highmem'
> + * property, which is to enable or disable the compact space in the Highmem

s/space in/layout for/ ?

> + * IO regions. For example, VIRT_HIGH_PCIE_MMIO can be disabled or enabled
> + * depending on the property in the following scenario.
> + *
> + * pa_bits              = 40;
> + * vms->highmem_redists = false;
> + * vms->highmem_ecam    = false;
> + * vms->highmem_mmio    = true;
> + *
> + * # qemu-system-aarch64 -accel kvm -cpu host    \
> + *   -machine virt-7.2,compact-highmem={on, off} \
> + *   -m 4G,maxmem=511G -monitor stdio
> + *
> + * Region            compact-highmem=off        compact-highmem=on
> + * ----------------------------------------------------------------
> + * RAM               [1GB         512GB]        [1GB         512GB]
> + * HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
> + * HIGH_PCIE_ECAM    [512GB+256GB 512GB+512MB]  [disabled]
> + * HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
>   */
>  static MemMapEntry extended_memmap[] = {
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */

(...)

> @@ -3124,8 +3167,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
>  
>  static void virt_machine_7_1_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_7_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
> +    /* Compact space for high memory regions was introduced with 7.2 */

s/space/layout/ ?

> +    vmc->no_highmem_compact = true;
>  }
>  DEFINE_VIRT_MACHINE(7, 1)
>  

Other than the wording nits, lgtm.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

