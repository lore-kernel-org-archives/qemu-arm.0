Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1270332lfc;
        Thu, 4 Jun 2020 02:09:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxtTk2eiYIgPKaoJO/grczw1OBGbuaeSFhrmLkxswVAgBymvsTEe5qHiOc8pCPS91ImZWj
X-Received: by 2002:a25:14d6:: with SMTP id 205mr6483216ybu.113.1591261797587;
        Thu, 04 Jun 2020 02:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591261797; cv=none;
        d=google.com; s=arc-20160816;
        b=AutMq2oHNNl9fLolIPz4b7C597LL97kEJNWiGYM9+HesKj7tRg6o+lQy5iQSlXqV4G
         H/gYSEIv+2Umv1M/CWgC50LCScuaJnowgfyGMDlDroZXw/4laqBbb11jryXse3emW36b
         M+5P6TLcKvGvCg/y55tiXZVmy5wDdAe4ifdp3AfHZdGDsiE7qYEgcy5LKWoRL53kXtVJ
         TUn2dUW9GJQ0/MF7Uaf2D6dHsWYoYAekqExCUXn22+/Hm1WryRSRa/Gh7us+yUk3aX25
         6+7SNLQj5nsYAGSYGv2l6i8f6sktd+71zRJXahfD5RYqD9W6I5ZckGV/zn2/btu2ydMO
         Ckhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ahalv+0V/G1nISWzjqRyM11/DubG9KRM7EMm7qYESgs=;
        b=j2RkkgLSvwSvyvXZiEXnV5fUE36XY6WroE5QMWoUec7pLN+fMVYLQoK5aiwkAxfhx8
         XSEabsJXbU1nFvKDm4SUvDUwSGvBTgkTsW5FC4Qkuq5kevGGYyOMgLkzrnmkJJYMUhg1
         aqMVqfFQY/V5GuOJ0ehQGWfuHouR+UJ1+m0ev3CRY0CuCo+z8fv9G2bdjYipL+WKxggM
         rXQIXGXBNc19HfSYVXyTinsXrBxp3BMX3UI0VS80nnDWTyWiy/tHtk3556+qXhjq0pPI
         6RMzW2YgH9VFtnHtYCbIC2Oh7Gp/4ncn6sgtME99LJSr44uBG1IPADVNLcyzpQFK/10C
         5dsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DuL1re++;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125si3870990ybh.403.2020.06.04.02.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 02:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DuL1re++;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jglsq-0004oD-Nx
	for alex.bennee@linaro.org; Thu, 04 Jun 2020 05:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1jglsi-0004lu-9q
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 05:09:48 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43042
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1jglsg-0005sM-PL
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 05:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591261786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ahalv+0V/G1nISWzjqRyM11/DubG9KRM7EMm7qYESgs=;
 b=DuL1re++NFP30uM0PbCGimMnzSZSmbeUtiMDG6TmTFJBZ54wfjVc8IsnYJL4q8Yz2HZPNR
 2ooshmWDMx8gIohJUvjrYZZqWsrNh5dSw1O3OIBpEdUooW+nS7bLjXCFTwu6Q5Otvpg7Mr
 Oml3DCN4TlZEW5A4+3q2XzqI9GZWPz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-2QPCRuSnNWmU8EsGLgk2jw-1; Thu, 04 Jun 2020 05:09:44 -0400
X-MC-Unique: 2QPCRuSnNWmU8EsGLgk2jw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ACDF1902EA2;
 Thu,  4 Jun 2020 09:09:42 +0000 (UTC)
Received: from [10.40.193.170] (unknown [10.40.193.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5724A6AD0C;
 Thu,  4 Jun 2020 09:09:33 +0000 (UTC)
Subject: Re: [PATCH] numa: forbid '-numa node, mem' for 5.1 and newer machine
 types
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200602084151.480567-1-imammedo@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <ac504671-b836-32f8-1231-0ff0724ca7c6@redhat.com>
Date: Thu, 4 Jun 2020 11:09:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602084151.480567-1-imammedo@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:08:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 libvir-list@redhat.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 pbonzini@redhat.com, rth@twiddle.net, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hWuvG0kbOOvV

On 6/2/20 10:41 AM, Igor Mammedov wrote:
> Deprecation period is run out and it's a time to flip the switch
> introduced by cd5ff8333a.  Disable legacy option for new machine
> types (since 5.1) and amend documentation.
> 
> '-numa node,memdev' shall be used instead of disabled option
> with new machine types.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>   - rebased on top of current master
>   - move compat mode from 4.2 to 5.0
> 
> CC: peter.maydell@linaro.org
> CC: ehabkost@redhat.com
> CC: marcel.apfelbaum@gmail.com
> CC: mst@redhat.com
> CC: pbonzini@redhat.com
> CC: rth@twiddle.net
> CC: david@gibson.dropbear.id.au
> CC: libvir-list@redhat.com
> CC: qemu-arm@nongnu.org
> CC: qemu-ppc@nongnu.org
> ---
>   docs/system/deprecated.rst | 17 -----------------
>   hw/arm/virt.c              |  2 +-
>   hw/core/numa.c             |  6 ++++++
>   hw/i386/pc.c               |  1 -
>   hw/i386/pc_piix.c          |  1 +
>   hw/i386/pc_q35.c           |  1 +
>   hw/ppc/spapr.c             |  2 +-
>   qemu-options.hx            |  9 +++++----
>   8 files changed, 15 insertions(+), 24 deletions(-)

This works with libvirt perfectly.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal

