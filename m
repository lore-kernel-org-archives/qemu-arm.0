Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5242504ejb;
        Wed, 21 Dec 2022 07:27:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs9uANgDa2/rtuF70Gvv88YSP6te0Kr5im2nkAYn96OngCLhcCnnAZnsDnXAj4gixigqso9
X-Received: by 2002:a05:622a:4a0f:b0:3ab:5bbc:bbe3 with SMTP id fv15-20020a05622a4a0f00b003ab5bbcbbe3mr2787742qtb.19.1671636429109;
        Wed, 21 Dec 2022 07:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671636429; cv=none;
        d=google.com; s=arc-20160816;
        b=wOlwomfrHFHB44XHF+/pkdaT6fJbggzVFCkT8HCulOvYJdOJA6/QJZkmAVpkFASDCE
         8meBlmC0xsr6A7GojHioLpwslFRH5LuhIOSGBKpMDbVWI9uS6ZaPYOqVsnsWgJHPC3T4
         Wl3gARD8mmejiF+lanAodqf9875mgV65Y9WjbJIBq//h5US3aNGY55oyrtcIiGrl/Opj
         IJvgyfIDM4SHTpUOZ1sPy7I+giKWx4Hscrj3qVTITFfBl6LgyKfWMdvKUtGDDrHcitja
         xL62Dwl+IFjKUTV4pR6tM69PLiD862bqZl4DUJyDhO/5dC4gC5eXQNeG+1P3NWN9Ybmg
         c3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=+N8MEUe3LKQ/NuNAlF/ow2P5V8BYwIs/I6C+6xZvLgE=;
        b=CE5ed1VLcxCSZgsIrvnN739KkxkETEx4PM9+s3zWiCQopiZ38lCd3iK7VE6H+6uTBL
         mPBnboVZZpQ+j+B+6HdTNE015XQmepKLN+kt7kHtYKLM/YRgmg/9drSu43Cj4FAl+iQW
         J4klTiUBjHl1v3E6hOvfz5Sl3RP3Db5id1r3B2rjeNnUHmrIL4kXb8sjcjlDUBdKS9Fz
         SiiTvvqj1+FVjiegSNEAb7raKVl8irS5omBVlBr9UeQFYyZtfY2lEX4wCaHk1y/eIwBy
         cLfrh0EZ0NywxHgBnE7olmhQVvGIefh09pIC7KWUSSas1ufpW/YRoBigGmxkmOT61geN
         ZWHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="KXXPmm/F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020a05620a258c00b006fec74e92e8si6482302qko.435.2022.12.21.07.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Dec 2022 07:27:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="KXXPmm/F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p80zc-0005sf-4P; Wed, 21 Dec 2022 10:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p80za-0005qG-Nd
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 10:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p80zZ-00078i-Cj
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 10:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671636408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+N8MEUe3LKQ/NuNAlF/ow2P5V8BYwIs/I6C+6xZvLgE=;
 b=KXXPmm/F+JmuUKWHVw6meW5uRTLNtN3C1L/Xer+XTZlxLIfoAj0piED1sxroIe8+7Atrp9
 u6ftXXVdaRB5qLfEpGqnkAW+2/9/pvCjiqAdWxT6wnnpdADWkfIsgB1ZnWIpM8a5ri8L8a
 qcBHPZNQ2RNCfLSEPQy1TfpQAHPI36I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-X1XeLrzQMN-PUA_XyG6rdw-1; Wed, 21 Dec 2022 10:26:47 -0500
X-MC-Unique: X1XeLrzQMN-PUA_XyG6rdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7785087B2A3;
 Wed, 21 Dec 2022 15:26:46 +0000 (UTC)
Received: from localhost (unknown [10.22.32.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 295E240C2064;
 Wed, 21 Dec 2022 15:26:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Zenghui
 Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/2] hw/arm/virt: Make accels in GIC finalize logic
 explicit
In-Reply-To: <20221221092850.61332-3-agraf@csgraf.de>
Organization: Red Hat GmbH
References: <20221221092850.61332-1-agraf@csgraf.de>
 <20221221092850.61332-3-agraf@csgraf.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 21 Dec 2022 16:26:44 +0100
Message-ID: <87len06amj.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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
X-TUID: phI49HEG++/i

On Wed, Dec 21 2022, Alexander Graf <agraf@csgraf.de> wrote:

> Let's explicitly list out all accelerators that we support when trying to
> determine the supported set of GIC versions. KVM was already separate, so
> the only missing one is HVF which simply reuses all of TCG's emulation
> code and thus has the same compatibility matrix.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---
>
> v1 -> v2:
>
>   - Include TCG header for tcg_enabled()
> ---
>  hw/arm/virt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

