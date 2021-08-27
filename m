Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1683871lfb;
        Fri, 27 Aug 2021 08:23:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMcerRoLvlFnPc3dtTSdc2yUu6506VkKe+4SrnIXaqOFRmUcwv1bz+NELw0zVnllVZBuyx
X-Received: by 2002:a05:600c:1d0d:: with SMTP id l13mr6968534wms.100.1630077780690;
        Fri, 27 Aug 2021 08:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630077780; cv=none;
        d=google.com; s=arc-20160816;
        b=XGvaNBQZs8Za7tfp3FcLaqJdNtaVZ46XlzbZUVYDcKSZFz8IpHTDcU37+T/m5DCt8t
         7dts/MuIqiFJXFbW6P2UcFItq1sVKh+TlDAT5P0I//wnhmvjhWn8r7RoI88H4kPYVWtg
         0DhWFbltGmncQ9VzligUqS9daDMXtQcsmZ063zcWPAvYAV5sUzgrwD4O6h5joI/R7GEc
         OQBI3dm6NhDGL4LRUCX3IrqH0h9zCvlNp7TolsHjKuLBuzQm72h+OtOhHVcNqdG86jt6
         aAvNx6anEWdZNXJMECq3GpFmPjDbQsCtYZ9yMpLfm1aY6ZKD78TThgKPyA89DywA0Rbp
         hs3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=eLFf3MysqdUFyiQMXljB6OxcrsjEu21j1ielAltXj2g=;
        b=fkLncKS3Qq3kzjb51SvLDUVyfKhz5VimXmJOFvl0x/cFngYFu3K0FiQ1tZZuWlc0Pi
         nCF0I2NBirSI4AM5vzopmB4X1dRLZ6zy1ylDhY0yqYqRXBd8H77Kf4IYAMx1SeGqi0mX
         /YG2OlEWYlCmvWPoH/s7GJCiVYjE9LQHinuR5rBO18pJL3piex2l0VILNa09MxYJfCPP
         0wG1aqFVqEosfrr+knk7YzsxDDBMI6THax2W6LjRnbVpHKyfdRewx+/cVAg49RqP3Gov
         A5f3xTaDH4tkQygzCoKn95+XvUlJCOwv3p/9oV70GGT+3vsmN7HKSVpFuJeRbPziHIj1
         kCBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="EK/lE0uJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11si6309080wra.163.2021.08.27.08.23.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 08:23:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="EK/lE0uJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJdh5-0007BT-Ru
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 11:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mJdgt-0007BG-NB
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 11:22:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mJdgs-00063A-1L
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 11:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630077765;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eLFf3MysqdUFyiQMXljB6OxcrsjEu21j1ielAltXj2g=;
 b=EK/lE0uJmDdugeYVVO4ZbIHjEzV5kb1dOXMSQB/pU1of98f0FaVnwc6w8g4d9hlWIg31Su
 uIX28Ze7hIJqYdMdVBpMi4FTjO3QfFf88dzHgyHrphjvmF4Aw0Yv6H+QS+OUJvkDtHJvJ4
 x/LrGLCGTA904uj//NM3GF4JzorMwOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-zvQUBmo1MR6Y7_gLLQHWTg-1; Fri, 27 Aug 2021 11:22:38 -0400
X-MC-Unique: zvQUBmo1MR6Y7_gLLQHWTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8B321019647;
 Fri, 27 Aug 2021 15:22:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C01A19C59;
 Fri, 27 Aug 2021 15:22:35 +0000 (UTC)
Date: Fri, 27 Aug 2021 16:22:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 4/3] gitlab-ci: Don't try to use the system libfdt in the
 debian job
Message-ID: <YSkDOQbUH/Xm9ajM@redhat.com>
References: <20210827151718.178988-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210827151718.178988-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /ZmqquBThd92

On Fri, Aug 27, 2021 at 05:17:18PM +0200, Thomas Huth wrote:
> libfdt in Debian is too old to be usable for QEMU. So far we were
> silently falling back to the internal dtc submodule, but since
> this is wrong, let's remove the --enable-fdt=system switch here now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Sorry, I just noticed this after sending out the first three patches already
> 
>  .gitlab-ci.d/buildtest.yml | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

