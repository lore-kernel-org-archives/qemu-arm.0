Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2613254lfb;
        Fri, 27 Nov 2020 09:20:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjWgqXtYByjKfol2TX1dlgkevmTvT+FKU3bDwYvdcp4WqxoYRWjMto/HFem583EcW19Yn9
X-Received: by 2002:a25:d6ce:: with SMTP id n197mr13879941ybg.210.1606497607404;
        Fri, 27 Nov 2020 09:20:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606497607; cv=none;
        d=google.com; s=arc-20160816;
        b=mOy2BSqktQFqlzjAz4VnmEWFsQE/v6RvDNkrwBVXQPWzCGQtdA8DIiqWDdB95JZWk+
         9+xkGig1A30rwN/7AXvWKvmbOEXnq9oLY00EsE9lDpjV/C/h1K5W3F77LfLhIvN674zA
         spgmlwTDihVOO7RC2olJrbGjYPSAOGhNzh9YmmZtl7wudlkNiRasztu3FHE8I+yHpNef
         GMNBRF/GoxteN49XoCYYGaS4gY6UEow0qD9oHJon8/WATlXznQJHgW9rBwY32rRNXmsA
         GpdjWVg7686qHp5PgpxY/3DTLQIFPhon08wLyBsu85LKXaWlvomUZN8xqU4Qrmit/Db4
         p5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=WpkWoFSqB2UtbilhxjOZtvQ6tnj66kdLS/x8OXpv3ag=;
        b=E7IbC6gfc8AIxMA77nH5BHRlnLQP4u3KfL+EGyHu8Jp+PYoJlHqVBt8c+IFcTNKPjK
         0qhaxf5Nu2/6643kttnGbH2sCxAzyfY9yTg6LSV0ay2SDt64GaotlIOiBoPuJdMVCfdB
         7VdkZ6xU4YHZ4I6O396ViRy44fl2VBrx1tCmvLLYlV+q6+NIbyEeOfDREkppeFKf8I4y
         uuL1x8cPq8+RbMTb5dxKMqkfiRKc4PtTo/1r61wAFsCkK0tlZzHSdcYz4SeEIrWXdLDp
         453JODnqwrRy9p8AI9R88CGrNE2A02XZXYL2i70xVyZ9ueWjWPiPEwplZ/fILi4/I500
         NVmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tik+Q8TL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g65si8795260ybg.77.2020.11.27.09.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 09:20:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tik+Q8TL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kihPi-0006eq-Oe
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 12:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kihNt-0005kd-4V
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:18:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kihNk-00024R-2O
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606497482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WpkWoFSqB2UtbilhxjOZtvQ6tnj66kdLS/x8OXpv3ag=;
 b=Tik+Q8TL2OJ3E/pkrrhuCHUWSmLAcwJrcWOIWi9dgtZ7LKPSEbK3T9EB58u4mRF0QvQ4wB
 ElOpX2jHWecK06pbMZ2PHLgNpfjiWK+z22WhbfTauf7tFa1Yw7CF+HNnuaAfA7XFVlM49P
 XNMsVeTreArt/I6rJkbg6UCAEGbROos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-Sy4QISk4MkmCXtQUY13x-g-1; Fri, 27 Nov 2020 12:18:00 -0500
X-MC-Unique: Sy4QISk4MkmCXtQUY13x-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D25BAE7193;
 Fri, 27 Nov 2020 17:17:58 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C0995D6D1;
 Fri, 27 Nov 2020 17:17:58 +0000 (UTC)
Date: Fri, 27 Nov 2020 12:17:57 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
Message-ID: <20201127171757.GB2271382@habkost.net>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
 <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
 <20201127164708.GZ2271382@habkost.net>
 <CAFEAcA_rt_aJTfBzAchUfCH5aKpSPReXWrVDC5mMEvyPughB8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_rt_aJTfBzAchUfCH5aKpSPReXWrVDC5mMEvyPughB8w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MP+ZaUAj3zr+

On Fri, Nov 27, 2020 at 04:53:59PM +0000, Peter Maydell wrote:
> On Fri, 27 Nov 2020 at 16:47, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > Do you know how the implicitly-accelerator-specific code is
> > implemented?  PARange is in id_aa64mmfr0, correct?  I don't see
> > any accel-specific code for initializing id_aa64mmfr0.
> 
> For TCG, the value of id_aa64mmfr0 is set by the per-cpu
> init functions aarch64_a57_initfn(), aarch64_a72_initfn(), etc.
> 
> For KVM, if we're using "-cpu cortex-a53" or "-cpu cortex-a57"
> these only work if the host CPU really is an A53 or A57, in
> which case the reset value set by the initfn is correct.
> In the more usual case of "-cpu host", we ask the kernel for
> the ID register values in kvm_arm_get_host_cpu_features(),
> which is part of the implementation of
> kvm_arm_set_cpu_features_from_host(), which gets called
> in aarch64_max_initfn() (inside a kvm_enabled() conditional).
> 
> So there is a *_enabled() check involved, which I hadn't
> realised until I worked back up to where this stuff is called.
> 

Thanks!  Is the data returned by kvm_arm_get_host_cpu_features()
supposed to eventually affect the value of id_aa64mmfr0?  I don't
see how that could happen.

-- 
Eduardo

