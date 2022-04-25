Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2418947lfk;
        Mon, 25 Apr 2022 07:18:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPUthUEqNzyb6HsxRcJrqyyIsCUpuxs9FMcarPiUTmZZOP5utrTK8iZIr7YIW8yppUL2rV
X-Received: by 2002:a0d:ec41:0:b0:2eb:54bb:85a9 with SMTP id r1-20020a0dec41000000b002eb54bb85a9mr17012903ywn.242.1650896323964;
        Mon, 25 Apr 2022 07:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650896323; cv=none;
        d=google.com; s=arc-20160816;
        b=iMmpomQtnKIbdnXzFXmI9e4pfzTm1lPjeoppN3QpozLUmMNUxKGKwGSLzjf+SYWJ1Q
         VDqcf4etjD2LsB/rlw+FgKiRbzm+ZFjFeKJe4apy07tyPm/PvGXrGimrVzxT4n2YU/+L
         x/+TEiofOlobRCC7wHbtZ9yoIb7Yr+YgvqElXZpgIXLGWhe+GtjvQloiapbtkZXPaPzl
         RdmAhG3h3n6UBQw38HofzEjs4M1tgeZnPQ5pyNeHco5bN/GP3LOAk8kEKYmUCwjbdggQ
         u+4zVJtm4v4RaD56NmLasgpTdk9VuGxOt3aUo4/lggQtFSQJTerrx68ReyIG46gaFCOR
         b6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ExwT8WzLcU8f19xNfeKZvAQG6E3ph+XMhoWT4DZe4W4=;
        b=zFj6OTjnpaAQAsULPiFEa7CwJQxeLa0lO3H39R0tSZgTnhdbMJUzI22tpED72GRZi1
         bwKuimLoGUgMzWSl7NIqBCwQPzlsgp91L9wuDR7rZq4pfsIELXEprbpH1gKvSGXrpoNF
         BXlnAwt6m1o93PQ6F/FNgxe3E7kezPdv/lWFbr3679Lg5rzE/pDNg9buMtMHz16w/IAk
         m4VaOTm8+p/tEnwCnJyofQyq5L/wD15ppq5fq0WPnR8npAqDWOsQIPlMiRWMVRQE++aF
         62WECWLiVSiXtZ99lFjzDi2aNVSn64kpVnu6xUTo9yu3ceVqXIlduqUYCDzqBkVwvM+q
         ioIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="RG7F/B8y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a81e107000000b002eb4477f46fsi9502537ywh.443.2022.04.25.07.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Apr 2022 07:18:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="RG7F/B8y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nizY1-0006ZN-JD
	for alex.bennee@linaro.org; Mon, 25 Apr 2022 10:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizOh-0006jq-Rp
 for qemu-arm@nongnu.org; Mon, 25 Apr 2022 10:09:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizOg-000232-4b
 for qemu-arm@nongnu.org; Mon, 25 Apr 2022 10:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895741;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ExwT8WzLcU8f19xNfeKZvAQG6E3ph+XMhoWT4DZe4W4=;
 b=RG7F/B8yi6wC9CGoQ4Om6y2A93aTDepBNLbaGrSsXRgkiVE9kcz5mLZfJ4gYbEJO93xT6+
 41YZJmHZhG9fdcf/bOVIvO82dU9P581497VL9Kzkb0j6uT8S/0JUNfSL4ag+u19j7fjr3k
 KXjFKKEZlo7qL+pw5NUPQexwb/hwvIY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-olWat9NcP9un5TCHKNS6Zg-1; Mon, 25 Apr 2022 10:08:57 -0400
X-MC-Unique: olWat9NcP9un5TCHKNS6Zg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D250D380673D;
 Mon, 25 Apr 2022 14:08:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71D4314C1E80;
 Mon, 25 Apr 2022 14:08:52 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:08:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 04/18] hw/audio/lm4549: Add errp error reporting to init
 function
Message-ID: <Ymarcq+U4gMdqia5@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <be1bf295b3c6a3dee272b4b4e8115e37c2a772b5.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be1bf295b3c6a3dee272b4b4e8115e37c2a772b5.1650874791.git.mkletzan@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nGMMRO6TFz12

On Mon, Apr 25, 2022 at 10:21:47AM +0200, Martin Kletzander wrote:
> This will be used in future commit.
> 
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  hw/audio/lm4549.c | 3 ++-
>  hw/audio/lm4549.h | 3 ++-
>  hw/audio/pl041.c  | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

