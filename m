Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4728465lfp;
        Tue, 28 Sep 2021 03:26:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2Ai+lNm2C/vCBGM+ElZdbYXpHv3Relz+hDvJ1EukxjztpMr1FSa6PGjFcBY9T9PZa4sMh
X-Received: by 2002:a05:622a:1356:: with SMTP id w22mr4772163qtk.26.1632824784269;
        Tue, 28 Sep 2021 03:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632824784; cv=none;
        d=google.com; s=arc-20160816;
        b=ftKzXxBy41yBrtpZ3VXy93AjbVvamOtktU0350Vfv7TAfUYMLzx7b9ZUqecFFOL8mO
         0lFKUJHdf1A+0SCESz9LuOv51Zy8QGb7tN4YXZUF40mbLQg/MUqae9AEQKPh4roUYiyo
         WVVhSLm0Vnt/3K4Z7X8fJT/9W70C4xhqrUt0o7T196oOSDaXXpGIvzdXlbDvVq02vjVJ
         /knoe2+woWsgKQvTa1yzTyLziMY+rWtRxTA2g8kKcD2EnUHCtOPQKuH54lHS8jXPBLrA
         +Od2k9T4c9kIFfG4SVTODQz7ea8oBXPLWbEGThDLwBF3VDOwAZkkoAstbWvO4Gjv9Jl4
         95UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=1k+fGQfTI0idyPNYn94bJE8z+X8D7yRzKmkAmL4E0ls=;
        b=MMCkuc4f1q3WQUZOeIRhaWhXx4Ude51VbhV0/kmqeF+Mx5qSB4bqOJIwkRDjnlLpbw
         jJcC7mFRP/U4jL0YVI5yuEjmES09z0nRazPTvVonlQIaoQANVlAOhzya9fbaSBlSVT6a
         mCJIJWJkB8lIGLD6IfjasugZD8BtCswNP4L5Nyo5dBctgjDBR/fYjQFDA2VdVXWFJK7i
         0FJol8XlVmOOjKbEQULiNPP18B3KahXK8f3zCDVFhXR0vPHRFeZ0ZTLWpM9e53PEJS+P
         Al0cf9grm1mXaivtcTarRUSk7pCREJyCco+S2plrrNpfcnj4UJr2q09XlF+kvvxZUDHH
         3nnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KhCIyTlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si50586qkp.107.2021.09.28.03.26.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:26:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KhCIyTlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAJb-0005rz-Gz
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAIw-0005oe-Ka
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:25:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAIu-0006GD-Hx
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632824738;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1k+fGQfTI0idyPNYn94bJE8z+X8D7yRzKmkAmL4E0ls=;
 b=KhCIyTlRGND4lbsgvAY1xxv3/s1tyACDADALP+jhp9Mc8QnU2hdhtAqoj1uHcVpkinXB4L
 oXwdDg2tcpK+Rt/EKY53UcSvxURMQ+STBa4MZYubUSLveLfpyZ/zBUxMGZOk8GfvuBWuD+
 CFOBRWETmr0RHbkVemtupg+QT+ezYF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-9fXgmE4QOTum5B9U3rJmXA-1; Tue, 28 Sep 2021 06:25:35 -0400
X-MC-Unique: 9fXgmE4QOTum5B9U3rJmXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7EE8835DE3;
 Tue, 28 Sep 2021 10:25:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BC515C1B4;
 Tue, 28 Sep 2021 10:25:13 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:25:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 11/14] machine: Make smp_parse generic enough for all
 arches
Message-ID: <YVLth2CrXiBB6qAC@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-12-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-12-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EWhobA2LxctN

On Tue, Sep 28, 2021 at 11:57:52AM +0800, Yanan Wang wrote:
> Currently the only difference between smp_parse and pc_smp_parse
> is the support of dies parameter and the related error reporting.
> With some arch compat variables like "bool dies_supported", we can
> make smp_parse generic enough for all arches and the PC specific
> one can be removed.
> 
> Making smp_parse() generic enough can reduce code duplication and
> ease the code maintenance, and also allows extending the topology
> with more arch specific members (e.g., clusters) in the future.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c   | 91 +++++++++++++++++++++++++++++++++++----------
>  hw/i386/pc.c        | 84 +----------------------------------------
>  include/hw/boards.h |  9 +++++
>  3 files changed, 81 insertions(+), 103 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

