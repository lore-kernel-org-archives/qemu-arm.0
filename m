Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp502588lfq;
        Tue, 8 Sep 2020 04:09:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3hr8ajqfBc2RiRpC6/tGL0zn7Kq4HGbkNtnyc5hzITEtyQRyVdz+g/Y+otMLMFrp8Gg7c
X-Received: by 2002:a25:81c5:: with SMTP id n5mr3807004ybm.223.1599563344203;
        Tue, 08 Sep 2020 04:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599563344; cv=none;
        d=google.com; s=arc-20160816;
        b=tPPCoMe3PYKlDDmWQEbydWezqnPXoIQHJAQCKbGC24kfkayy3SLN7CQWntCoL0MgWc
         mVquCYDX6LrOqIq705YTyeoQ7bkCRrqMpO0ehHl6YuFZ8m8scv1EVCkrCiU9ya/5hCqx
         jNnlYCp9jNLDcVA3hicKchYHGNXLJx77t+fRBefYUr1aYVxRIGY4dzzZ2869CxfuwHz5
         Dg5AYNMuxoDhBPGyZXsZYMguqTKvaQhu7VA1U6AMehvDkLyN8bZx7ceHHdjgGw2vPOSL
         LQw+fMzITAseNq0ovnBRr1GjFCUs2bxPaCSBPMlwtBnlDAf8wtw95sIpSfkS790NPQ1M
         AQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=B2YFXAtYJPTXxZW9VyxBR5mpscba9PqGxdSijpkMk7E=;
        b=lehcE3ka1ReEmRclLrQzMsB6Bf8qbfRlEg3L2bMRz1tJAC7gFnQbR4spAxyCW0N5ri
         1AW1DAi00+W4VdL7/X0odcvU7aOvjiNZz5kE3cnqFVujac/e7FfkL8NiL5FN/N4jQuuQ
         atkkaI7Rd09PCZ/9TwIEpAEFsl27lwo6ViCW/jZRx0Pep/eRxrTmyjmR9Gc1xD0z/ZmX
         eA3bdVbQIWMO419NHd4Qc4RHYeO2JDEp2sBg8gaUw20ma6y//3QQM1MfnE4TsNBTsa2f
         oI8YGDP6ip+tmLKelhkhGMsKA1hBSuVlpFLg1OItylnNJu7qBFj4WlpjUGerNXdWCE+9
         J/jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T7sGEDo3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si20505570ybk.331.2020.09.08.04.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 04:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T7sGEDo3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFbUl-0000vP-LB
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 07:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbT1-0006Z4-QI
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 07:07:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38369
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbT0-0005gc-C5
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 07:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599563233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B2YFXAtYJPTXxZW9VyxBR5mpscba9PqGxdSijpkMk7E=;
 b=T7sGEDo3N53F4yQwBNCBRoK4YHAhKT4SB796tg297uboXekRogpgn8kx8ZWsFwSKN+z4gy
 W0gexNT5cQ+aW2pK7NYkiNqg9klSML9sZ5fp9Epnh584sOluazoHKJPOdkcKhhRG01jp3f
 d1XOnoINEQOw+5/yUTLBq563O0KWtfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-hF6ZzyEmP_i9-MoGRqESJg-1; Tue, 08 Sep 2020 07:07:08 -0400
X-MC-Unique: hF6ZzyEmP_i9-MoGRqESJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C778E8030CD;
 Tue,  8 Sep 2020 11:07:07 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D1CC5C1BB;
 Tue,  8 Sep 2020 11:07:05 +0000 (UTC)
Date: Tue, 8 Sep 2020 13:07:03 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 08/12] hw/arm/virt: Move kvm pmu setup to
 virt_cpu_post_init
Message-ID: <20200908110703.6ozfos27iyq45bv5@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <7982854bb6cdb90390ea3f3c39c2801ef84fd2e5.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <7982854bb6cdb90390ea3f3c39c2801ef84fd2e5.1599549462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.001
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ez+beII9N6fX

On Tue, Sep 08, 2020 at 08:13:26AM +0000, Haibo Xu wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> Move the KVM PMU setup part of fdt_add_pmu_nodes() to
> virt_cpu_post_init(), which is a more appropriate location. Now
> fdt_add_pmu_nodes() is also named more appropriately, because it
> no longer does anything but fdt node creation.
> 
> No functional change intended.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
>

This looks like the correct version, but you could also pick up Peter's
r-b.

Thanks,
drew 

