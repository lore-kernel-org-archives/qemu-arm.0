Received: by 2002:a05:7022:458e:b0:46:22f1:8c13 with SMTP id cf14csp4952447dlb;
        Wed, 2 Nov 2022 01:58:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7QEV478CBEQaAHTZ+HnW9O5wc9OHT4g5E0rCgp2xdpXNuIkN1LwSve7ASl7CEmVVLsSTDE
X-Received: by 2002:a05:622a:284:b0:39c:cbec:e1f0 with SMTP id z4-20020a05622a028400b0039ccbece1f0mr18755264qtw.451.1667379521835;
        Wed, 02 Nov 2022 01:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667379521; cv=none;
        d=google.com; s=arc-20160816;
        b=HryjmDvA5SSm7YRPJ1h6ea+TfgxjN8aw2I4VVhK1oTl6eCJMH5itqGylvgBbXlwILL
         UfAxH2Tg0hAkDbNwiqc7MgBUVh7XRFx0QA2fxo4PkEayDcS0hQSTnsOzCVwizahqCYzn
         a9tFApJUf2RopQf14indXys8hpxI8TB+5a026SkC4LLd19p+KkXUahSwvj79gOZ9+hcF
         uuMBQ7KC6kDjUFPTAHxdW+RTZpiQCRtJ2zizLU7Hr0L3keeckjUf9t49JERRf1XUC593
         AaT82+5Ufu6UDphw9un+miEVlfcHFDSi2LdxAcD8G9fTG7mMp59KhJLZ1D1rd6tA8X3x
         4UwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=Qu3FjAQZEyErNwM/6amQrLAxS3Xs8cUJdPDkh+Rw9r0=;
        b=kZQ/lHdWcTQR4tXBWRKdQMvcSgZmBj+M2zosz22JErm5oibWI4dqDcJxbUfcaH/TyR
         QdTTKkv/KzJ14FoRM1FrFPT3eucIL1J56wLgu2dkz465LiW4O/scAOpByp2TTLMo4rb7
         trSecI8HSbwn3/SRn2ywFBNBpaKHoevrPeD0hmZQg3ELBukuMI48oySqIcSwF6UtUeQ9
         mEw0Dnkp5L9Xw82dPBEl3+REBCWdZ+gWgkW/PgbaFLoxgs7xNU6/iV2sItpWQYAAVoaj
         EB19MVA5mbWyJlT39rC6ODfiO217apFQl/861zUVyyIe1K4RGmMGIAhK570QwLO49+f2
         Qkuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U8J99pzA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a05620a430e00b006fa2b244460si5955057qko.630.2022.11.02.01.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Nov 2022 01:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U8J99pzA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq9Zw-00031o-43; Wed, 02 Nov 2022 04:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oq9Zb-0002i2-Jc
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:58:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oq9ZZ-0001yQ-6G
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667379484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qu3FjAQZEyErNwM/6amQrLAxS3Xs8cUJdPDkh+Rw9r0=;
 b=U8J99pzAAqHg0aJrNx44eBB8eUnLWdXF3hMB6UzWESWjrBewImBCc5BIbeDZjEZZ9rXhE4
 MYMUYS8ZjRrRcI+b2TkNueqetUMLlaYPcXxDqlD5bYtR3kS2yhO2T4LcIGhehSCKfI9Dtp
 8hL3LBaj303vNpX/iHOuAfCEBbuX4qc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-vgOW4mwkPJO1Tw19IppLMA-1; Wed, 02 Nov 2022 04:58:01 -0400
X-MC-Unique: vgOW4mwkPJO1Tw19IppLMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D1571C07582;
 Wed,  2 Nov 2022 08:58:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DA8640C2065;
 Wed,  2 Nov 2022 08:58:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v7 7/7] hw/arm/virt: Add properties to disable high
 memory regions
In-Reply-To: <20221029224307.138822-8-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221029224307.138822-1-gshan@redhat.com>
 <20221029224307.138822-8-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 02 Nov 2022 09:57:58 +0100
Message-ID: <87wn8dspgp.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +C3q/m4UxiZ7

On Sun, Oct 30 2022, Gavin Shan <gshan@redhat.com> wrote:

> The 3 high memory regions are usually enabled by default, but they may
> be not used. For example, VIRT_HIGH_GIC_REDIST2 isn't needed by GICv2.
> This leads to waste in the PA space.
>
> Add properties ("highmem-redists", "highmem-ecam", "highmem-mmio") to
> allow users selectively disable them if needed. After that, the high
> memory region for GICv3 or GICv4 redistributor can be disabled by user,
> the number of maximal supported CPUs needs to be calculated based on
> 'vms->highmem_redists'. The follow-up error message is also improved
> to indicate if the high memory region for GICv3 and GICv4 has been
> enabled or not.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> ---
>  docs/system/arm/virt.rst | 13 +++++++
>  hw/arm/virt.c            | 75 ++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 86 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

