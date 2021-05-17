Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1346660lfm;
        Mon, 17 May 2021 07:47:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfRGpEXHG4HSQosf8jBRJ9fmqKnGopZOYEZc/q21B6I/jGT8BwQkjy2/adtkuiGHwqjcEH
X-Received: by 2002:a02:8787:: with SMTP id t7mr348453jai.53.1621262846689;
        Mon, 17 May 2021 07:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621262846; cv=none;
        d=google.com; s=arc-20160816;
        b=dQ/1wK8UBr5cKYTFyTW2moCGILCBcufU6PgnuYE1tUPvs2pcMlk4uzf81CENEcQU87
         o57tZslBkytwK5bYEv4HqYd8NUlkmqfpwlZMcxiMrNywbJSugOokXOwC63hMS631AoaZ
         qnRtZgpZRAL4dYo7DXz/1fUuiIf4xQzhDD27/SderzCbnfRlme14TWhzWs/hWtxTRHWz
         VkHc7l7XDChDnnmCZWqMG3zhgkzfEELDcpI5OXCcJjQrAQ0R6DwUTSOUsrahDmDrH7xO
         d9uwoW3/oJuQrOnZ/N03SLYOzeRRE3LYk1ltOtLTNEE0ktY2FvaSEcKndu7D2W7z6LF/
         qg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=A0m9610KHBDqyXGLxD+94zA/BoAoO+gjcWgSE5YCfy0=;
        b=DqVznbym4BAxDPzX6ED2opO9kiDFQPDHZHCiZgSI/TXwt+db9sky/t3eCQl7qMKnqF
         VfiegTVpEHOzSjbRaf8ZzvMtTN5Foq1j8ls/IdoJnbYua0q8ebjXtXhmbNGXUovqIF+L
         STRHZW9T2BY8BJ5x0OWAL5tZa8ru8p2TrVV6ryntZsz+ACk9YylTeRuSzHb8B8RZU9qd
         mxOh2LbJZaPTkOUJgQpodQ/YpLppdPkOjokWK03Alu1i6jPJ8BAbOwHcGGsuDVkRBTjU
         OAAIf3IRMm8fVbNIDfejWWohJ8nItCDSVpDsxoyVvlUEy0q7DtzJxWSdQMLEhu8wXRTi
         N3Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UqYNbQr9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si17946721jas.102.2021.05.17.07.47.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 07:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UqYNbQr9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lieWk-0001JC-1S
	for alex.bennee@linaro.org; Mon, 17 May 2021 10:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lieUo-0006oy-TZ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lieUn-0000zj-9H
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621262724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A0m9610KHBDqyXGLxD+94zA/BoAoO+gjcWgSE5YCfy0=;
 b=UqYNbQr90bY4T2STH7jrbegHBk7GmluXeRG++WUIgAjk7FZa0VfUbxaLno0+LfFMpupQg6
 eoxz2VIg5wybkE/3PtHgruD43drZo2do5SEL7x43U1yawUfQzxaAnvl0u78UvMco44fWMP
 YeRHo15I5oZrsPhqmVGrNnS0CUcQzyk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-FbaZbU2WPcySIp7S8hqoBA-1; Mon, 17 May 2021 10:45:22 -0400
X-MC-Unique: FbaZbU2WPcySIp7S8hqoBA-1
Received: by mail-ej1-f72.google.com with SMTP id
 la2-20020a170906ad82b02903d4bcc8de3bso1141758ejb.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 07:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A0m9610KHBDqyXGLxD+94zA/BoAoO+gjcWgSE5YCfy0=;
 b=qb6xzW8ruuJQ5pzdui7QJht0gnyzHJcEzh0EM1bzxRxKdYaPFNGHbjiIbEd++P8dPG
 elgyh6B1x7PEK5frvr4XCMc8esip2nyHF/AycIITJ62vBlq8ZYWiLK8GvTKZ4+y0pIhS
 3ukjZx1sx0xcrt5xekaGS9gqfagKyzzrbIMTqkuopgKadVO0PvceyTIgkkxDpyL9qeWf
 flmMtqbCrYG9/knNrJs+blVX9i+vHpziDx3GqIDvx1BuwtqWU2kvfdYC9eJDNUJuBew/
 llSkemBDFOeIvhzvWMyf9Xfs7odmEBmU9DK0eBHLBiFiI8nZIcpx4QeGvfEmwpZl72An
 1lRA==
X-Gm-Message-State: AOAM530lBofA+BOvxAi9Vw4QpLt+jW4m22nTdwh1DfQ9LxTpYA/L8/wd
 +KfTz6gxXPUQDQFvy98yYcnykBc4rK1eWq3gYauPsSBxR2qCRKOZYuV12VS1ZUnWB81mq1mhfS1
 XX1q9QlEfBXwpecc=
X-Received: by 2002:a17:906:a103:: with SMTP id
 t3mr276571ejy.334.1621262721429; 
 Mon, 17 May 2021 07:45:21 -0700 (PDT)
X-Received: by 2002:a17:906:a103:: with SMTP id
 t3mr276529ejy.334.1621262721088; 
 Mon, 17 May 2021 07:45:21 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id j22sm9084243ejt.11.2021.05.17.07.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:45:20 -0700 (PDT)
Date: Mon, 17 May 2021 16:45:18 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 8/9] hw/arm/virt-acpi-build: Generate PPTT table
Message-ID: <20210517144518.enuc3x2eyzixvgx4@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-9-wangyanan55@huawei.com>
 <20210517080223.sajp445x5qsy57fq@gator.home>
 <2dee4bda-fe42-15b1-3a22-22decbc0dbd0@huawei.com>
MIME-Version: 1.0
In-Reply-To: <2dee4bda-fe42-15b1-3a22-22decbc0dbd0@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y2+DB3izpOp8

On Mon, May 17, 2021 at 09:43:34PM +0800, wangyanan (Y) wrote:
> BTW, it seems patch 1 and 5 were possibly missed for some review.
> Any comments for them too? Thanks!

I reviewed them and agreed with them, but you already provided my
s-o-b on them, so I didn't bother giving an r-b. Feel free to add
my r-b to both, if you'd like.

Thanks,
drew

