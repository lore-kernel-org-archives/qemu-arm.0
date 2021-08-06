Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp266895lff;
        Fri, 6 Aug 2021 05:46:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnY4yGs5HNgJjehpn9Daw/hKnjYnuIUkWPgjWpd6g1/GqXQckXxYUf4a/47DUppCwBQTKz
X-Received: by 2002:ad4:504e:: with SMTP id m14mr10671910qvq.49.1628253982827;
        Fri, 06 Aug 2021 05:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628253982; cv=none;
        d=google.com; s=arc-20160816;
        b=xyHSZKf3pewpcaF79cZeX7Z4yeSe4T1u/Bka0mnL2lwn47uf2X3InXi1cDlU+Kgfew
         ckGnwR9cXkXk0JvPKyF3pUaTBVSKnw2M8yPck/qAaFE4HyoA05CcGIP9IZrWudBcJ4lO
         KK9Yo2Iov/gz8XfBkaD7iYVDfIL5ZApkpGxq+4jjxsouVpbVZL9N+2c+YcI+eGJwB+Nv
         QprL2hzg7KWltiNXZLFcteJ4UdHGJym0EHmmIhUcSqr6nrsJt6b+xhl7AprO/ZF1KoSc
         92m7/yVf1tdsupMWgbiTlB7nKW+L6TTkIl8+8JffG4lmoYroC6e1gSpJxt0XgTzQ/iMW
         mxFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=tWk7Eror2WsriFeC+Kq9elwBRxemw0JH+zlqyc1UzjU=;
        b=ME6FMlzhIL7dqW8pjJ71D4NmzrbnwKMfkGCoNuNY2XUAvzu37DQ9QkPyKotK/Hti27
         wSaBxYKXnKoIq5B9wlhhOJldXNliwxhia18ocnjPfpVWd/sumJP+yjfe/41Ij+RRnngD
         D7pk4Hi2Ad1FkqzjnxspOtN+qlUjhDhUclQa+ZZHyvleDXynL1To5k5Yc2q8MqbMpuDX
         m3jt9HxD9F+x7v+VaHg+FSAchs/whKytz2IKZVr/lbpZeUdzjjQfctkPz7Bosdm7nn5b
         SPIYviTlNv8qfes3dJpR274tQ/Cmah36kbTY/k1djggJKmVw9ghk7weoYoD5wKZTmiCh
         ZuQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NHhX7CMX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl1si5163330qkb.91.2021.08.06.05.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Aug 2021 05:46:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NHhX7CMX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBzEz-00070M-Sd
	for alex.bennee@linaro.org; Fri, 06 Aug 2021 08:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBzEX-0006xf-1q
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 08:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBzET-0005D7-LM
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 08:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628253946;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWk7Eror2WsriFeC+Kq9elwBRxemw0JH+zlqyc1UzjU=;
 b=NHhX7CMX6hu6Vn+prfpiRLcFqPeDxsJvDaDjYSoDBxg1qWzHEj+dfGoX2+ljxtMzQHwYza
 2lfJ096ZDCGZ8G9cSsKRuvnPhe10SiMJ1CaQoC3jLMWdd24Qh1BAQw77521wA9UhmmXq2q
 27bhMzcchMKTAoTIUfNe8s9GdFuCyoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-rfeIVV4vNt-3XsLBdGPpHw-1; Fri, 06 Aug 2021 08:45:35 -0400
X-MC-Unique: rfeIVV4vNt-3XsLBdGPpHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69EB01084F4C;
 Fri,  6 Aug 2021 12:45:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54C78781EB;
 Fri,  6 Aug 2021 12:45:32 +0000 (UTC)
Date: Fri, 6 Aug 2021 13:45:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] bcm2836: Remove redundant typedef and macros
Message-ID: <YQ0u6bfOmHVrnylm@redhat.com>
References: <20210805214739.390613-1-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210805214739.390613-1-ehabkost@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uI/YYxwULIOw

On Thu, Aug 05, 2021 at 05:47:39PM -0400, Eduardo Habkost wrote:
> commit 58b350280e97 ("hw/arm/bcm2836: Restrict BCM283XInfo
> declaration to C source") didn't just move the struct
> BCM283XClass definition to bcm2836.c.  It also introduced a
> typedef (BCM283XClass) and two type checking macros
> (BCM283X_CLASS, BCM283X_GET_CLASS).
> 
> The typedef and macros duplicate what is already defined by the
> OBJECT_DECLARE_TYPE declaration at bcm2836.h.  Remove the
> redundant declarations.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Luc Michel <luc.michel@greensocs.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/bcm2836.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

