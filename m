Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1128451ejy;
        Thu, 2 May 2024 05:16:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEniN6e+5nSVTB6o05j+43/ISUZsoMULHWVoTie+HFH3+LudKzbaoZc/7CyCerA4CMZB3hRwAoNNR4XfwcFf2swBIecsSW
X-Google-Smtp-Source: AGHT+IFZLKAvrdtIGM2/zHeprpZTUIsAvbCDQ4eYdzqrN2YDQq2YASmSH1iaV+FSWRhqrMmc50Qk
X-Received: by 2002:a05:651c:218:b0:2e1:f6f7:89c7 with SMTP id y24-20020a05651c021800b002e1f6f789c7mr797925ljn.49.1714652202271;
        Thu, 02 May 2024 05:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714652202; cv=none;
        d=google.com; s=arc-20160816;
        b=iHkKY+a7GG2Mwg9+3GbLr8V3mBfkfPFC77g03SjluZ/bEAj6U8PSaZgYvmtTOOrm9b
         wPifeVeWLmsIYDIHQ3OxFmw+J6C5ns/qYC0N17Vf2BdPW1/uKksPfZLH0lqZhYfD1niW
         /9K4sekW00y0qW0QvZQqK6WzXquRnZCaQ928ZsNa/tioOkHs4QO3XLx+ti3HpEK3La8x
         yo92NKz8KXSWD9Q5Tffq8ba/Nmc7S52NloY9l8QFLvTwGQ0FPiymecAt5jyGoenQ+lAY
         VQvhOMEfY641M7NAmUrEoWMqKTLiGT573Rfi6jj42ZTnZ5/rz8KDEHqXJ0yMNy8Z5GXy
         2FLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=dMYitP7Vq+BpFO1f6Ueqlnu4u7GGKKaZQULRhMdXP4o=;
        fh=22r/u9W3d3xxxbdkFqCcgOHpeWRzCRJRnyquRaklBog=;
        b=X9Oo24n+xeiFPFWK1VCzZlV4SZoKyIX7eoCaK/CtIdzKGAXo+irgkAkJZzb12jPRCw
         QQRKNr1ttuCCq0ZNKWUkeAeKRinqDioa2a17uTwxz+VA8B61BzsYDroyrDDdU80Pxnkv
         ZO+QkpBfJdMJS8ki8TqZUpx0KoiM4ab2udV5XsNDGCglq193iNS1agmmfX4QB+UHiV3O
         CZHJvHxTAhDELd6O034/kTqvC7nNKBchokZh9sQ+ktA6Kn2JX7Db2oc5ddP/11JqCqaa
         QqAKsgrBDxfPNTH5MiIMIUg0jfvHFHkvUUE74curBBcwgeYGkuXOncdot8SAZGPFrOdb
         rggg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zx0o1gSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fc10-20020a05600c524a00b0041c7c1ff121si650264wmb.148.2024.05.02.05.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 05:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zx0o1gSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2VM8-0008V7-42; Thu, 02 May 2024 08:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2VM4-0008T9-Fl
 for qemu-arm@nongnu.org; Thu, 02 May 2024 08:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2VLv-0001RV-Ut
 for qemu-arm@nongnu.org; Thu, 02 May 2024 08:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714652154;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMYitP7Vq+BpFO1f6Ueqlnu4u7GGKKaZQULRhMdXP4o=;
 b=Zx0o1gSZJ1NMILGP+W3SQejKdKK9kKZ9p7ak0vGG7K+a9k7xvL7eP3vAYw2k08qutgxypd
 I+7ukpFfj3H/2weBkUKyIetT/05r2LJtiGiRjnYzll91kHddtqsCeIHJ2/ih490AfGIP+e
 9wJM3cT5j5zkOGDHhmlp5IaRvWdO5HA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-43-JDDgPq6LMye7SwQfj6dGwA-1; Thu,
 02 May 2024 08:15:50 -0400
X-MC-Unique: JDDgPq6LMye7SwQfj6dGwA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A728B299E746;
 Thu,  2 May 2024 12:15:49 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F916492BC7;
 Thu,  2 May 2024 12:15:46 +0000 (UTC)
Date: Thu, 2 May 2024 13:15:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clegoate@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org
Subject: Re: [PATCH 13/14] hw/i386: remove obsolete manual deprecation reason
 string of i440fx machines
Message-ID: <ZjOD8CpDVRV_OW-F@redhat.com>
References: <20240501182759.2934195-1-berrange@redhat.com>
 <20240501182759.2934195-14-berrange@redhat.com>
 <500cec2c-a598-4185-b275-a1435a848c88@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <500cec2c-a598-4185-b275-a1435a848c88@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +xMEs2E4GVnF

On Thu, May 02, 2024 at 02:08:58PM +0200, Thomas Huth wrote:
> On 01/05/2024 20.27, Daniel P. Berrangé wrote:
> > The automatic deprecation mechanism introduced in the preceeding patches
> > will mark every i440fx machine upto and including 2.12 as deprecated. As
> > such we can revert the manually added deprecation which was a subset:
> > 
> >    commit c7437f0ddb8ee45bf96d949ddfcbb7697ae3d415
> >    Author: Thomas Huth <thuth@redhat.com>
> >    Date:   Fri Oct 6 09:52:47 2023 +0200
> > 
> >      docs/about: Mark the old pc-i440fx-2.0 - 2.3 machine types as deprecated
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   hw/i386/pc_piix.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index 9f92504cc4..4137e03f6f 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -812,7 +812,6 @@ static void pc_i440fx_machine_2_3_options(MachineClass *m)
> >   {
> >       pc_i440fx_machine_2_4_options(m);
> >       m->hw_version = "2.3.0";
> > -    m->deprecation_reason = "old and unattended - use a newer version instead";
> >       compat_props_add(m->compat_props, hw_compat_2_3, hw_compat_2_3_len);
> >       compat_props_add(m->compat_props, pc_compat_2_3, pc_compat_2_3_len);
> >   }
> 
> This will conflict with Philippe's "hw/i386: Remove deprecated pc-i440fx-2.0
> -> 2.3 machines" patch series (which should easy to resolve, though).

Yep, there are a few places in my series which will conflict with
that.

I've just looked at Philippe's code and everything has at least
one R-b. I had a minor comment but I could address that in this
series.

IOW, ideally we could merge Philippe's series now, to reduce
code in flight touching the same areas.

> Anyway:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

