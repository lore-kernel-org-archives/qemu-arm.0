Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1179459njx;
        Fri, 25 Oct 2024 09:24:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmdHxH0XRcFKMOhKAd4l06VSr+g7P0/iAeyysyhoRy9qt2s4PVJiknmHPGwdQnrDDdTejX/QcOdt6CtQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEfP2xt05qdr1j5xgvfnW41Az7/7E76K/AyqFwOoLE/McSwkAY6WDqutwPSk85XZK8ll8S3
X-Received: by 2002:ac8:5993:0:b0:461:15fc:8110 with SMTP id d75a77b69052e-461258c8b13mr72805101cf.7.1729873465255;
        Fri, 25 Oct 2024 09:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729873465; cv=none;
        d=google.com; s=arc-20240605;
        b=b4R9I8MhGM6ChCh5EVBnmlfn/Xtmi4AiPZAia+oDmp3fpa4jYVF7pPe8DHPch/uFzF
         Wc6U6fsg6tORYFwzPy/M6CueUcXmL/2yhPrSTkNcQFyx0pmEApO9B3IvG1QAJZiJiA6j
         Pv4m5ZHY3fl56UF9XmrxXF2G15fj8rU0if0s4NuIq+dnuBDEu8GXYT+GkGcT7WgL8JtG
         crndVrVYY1FW8qmsC4kfC/SmFW8rjIOQEEYEguEEUJBuv0UaMgscI8Vokmvl5WupicN/
         W0AP/n09v39zhUdNB+90w8NO31TOQ7XrylgyqgNzQv6wi9vtkC/sWYrq2G+1sudurIpI
         GO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=htuntEKJ84Pi1IcVEYSsFNh54E5EXmLgaahQ440DmJk=;
        fh=VJZ+APJyJOzTPku2G20FE2EJo4GrkR7rzuvXD4FSiJw=;
        b=ksgE2DyFEk1u8C6lQrUsOTPlk1N0s2B5i/KyAI2cUroJcCbGGJjRL+y3ZlQo+GSECo
         7YipuRTgxYihIzdaITfVmFRzQy9iuVmhz/rw64V853Vhq4wumKkrIofFu/o+H2J/o4O4
         wIMj3swWe8nuWeGlspFRT49ar+fTfn5G7bObe6h/TIpqFCffGCQ8Bk6XSRXLh+IVZl17
         yDLXhbjIwicbVIqDSs+iTsS5Rq6GwgELlY+Z5joKTIskryeusI8p7nqc4EFCrjN+0t3S
         dxo0OUIp0H2hUzYqERIJiIE8X0Kvnh0wmkN8FyGZm/jbIk8KQtjUC3+v/h1jHm02m0Pf
         VweQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bE4mDRli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46132358f97si6989121cf.382.2024.10.25.09.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2024 09:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bE4mDRli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t4N6n-0006w2-NQ; Fri, 25 Oct 2024 12:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1t4N6m-0006vi-76
 for qemu-arm@nongnu.org; Fri, 25 Oct 2024 12:24:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1t4N6k-0007aA-E3
 for qemu-arm@nongnu.org; Fri, 25 Oct 2024 12:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729873453;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htuntEKJ84Pi1IcVEYSsFNh54E5EXmLgaahQ440DmJk=;
 b=bE4mDRlinsneTuvDS9WcCr/Mua2rsJh5u7ldNJpCxpH9Mofs9VepmfKtvJ0K3kbKZJaPOZ
 NDnhnp0XpYurISKL0hzMJyXjQKaRNK88QQY1pSzR7aGWN6D5c43E/BccOZ/vavFs46wsjT
 gAQ4jdmY9eSYQab8eU8KvNxhF6U+fDs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-VngtK0g1MHObaHsCaWdYCQ-1; Fri,
 25 Oct 2024 12:24:08 -0400
X-MC-Unique: VngtK0g1MHObaHsCaWdYCQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0CC691956096; Fri, 25 Oct 2024 16:24:06 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.164])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 620071956056; Fri, 25 Oct 2024 16:24:00 +0000 (UTC)
Date: Fri, 25 Oct 2024 17:23:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: qemu-devel@nongnu.org, alejandro.zeise@seagate.com, clg@redhat.com,
 qemu-arm@nongnu.org, kris.conklin@seagate.com,
 jonathan.henze@seagate.com, evan.burgess@seagate.com, clg@kaod.org,
 peter.maydell@linaro.org, bcain@quicinc.com, sidneym@quicinc.com
Subject: Re: qcrypto_ivgen mem leak and possible issue?
Message-ID: <ZxvGHesrhPlQri__@redhat.com>
References: <60849a6166bba234230bc1761835cc188a9f765f.1729858348.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60849a6166bba234230bc1761835cc188a9f765f.1729858348.git.quic_mathbern@quicinc.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.454,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hHRrzeJ2gn1S

On Fri, Oct 25, 2024 at 01:06:01PM -0300, Matheus Tavares Bernardino wrote:
> Hi,
> 
> Since e3c07527f3 (crypto/hash: Implement and use new hash API,
> 2024-10-08), we've been seeing a memory leak in two check-unit tests:
> test-crypto-hash and test-crypto-ivgen. Looking a bit further to try and
> plug the leak, I got a bit confused regarding how the result crypto
> buffer is handled. Looks like we are allocating different sizes at two
> different places, and I'm unsure if these places follow the same
> convention or could be breaking expectations from one another...

There was a screwup in the commit you mention causing a memory leak. Can
you check whether it reproduces after

commit dde538c9a76f328a92c532893e97e18785d57364
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue Oct 15 13:25:36 2024 +0100

    crypto/hash: avoid overwriting user supplied result pointer


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

