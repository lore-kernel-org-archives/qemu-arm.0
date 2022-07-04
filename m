Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3084739lft;
        Mon, 4 Jul 2022 02:31:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZ32JmDWpsQ83RlTONZbbnQ8homfE8oOP1SpuJ/T13qJgGJ6fi6VgXX2JeUGJiA2kbVwBm
X-Received: by 2002:a81:5a86:0:b0:314:1495:8491 with SMTP id o128-20020a815a86000000b0031414958491mr33798556ywb.419.1656927080798;
        Mon, 04 Jul 2022 02:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656927080; cv=none;
        d=google.com; s=arc-20160816;
        b=tUTGrBWU/l35aELgWZrEKybyWgTp/IdFJjWh1V9l9X3ClYDHdYdEpgcC8awv1ZLNvU
         F0T7xQT3+loWl32E5znCFJ8FNpdXSBn19UZ+fKKWHEH2JikVw+SQ2O//ixp9h0GxFvkt
         QJ9j3UKmLjEvWB7GgC3lzLUB62ynQ/jFVsTI0kUz4TH97J2FBeNwfqupzVV1LJN2mqFi
         0RtZtIHMwDNJXVX/caS+k5LYPJjUeYR5db0QDwirw/hN3h+jlVd6rw/2mRVnFjYhyUee
         FL69MlY6Ug6r2hvjDUps0yhjOOCy4JAJOtjLSte7zgQwsx6sdXIU9a2c0uMw6DE6Xm4E
         V4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=iqsagBJZGF+4dntZHoMtQa+tIxJQuqumJeqHrTl1sHI=;
        b=ggRiZ80p7/qGRpHPFMjcIgwVJXcVSMZra6IevMvTBV+zRWy1wC/1hzSyZpPIafAcX+
         l5kAuOum8FLel29C3aMiSsyXJhky2c83oAQvDMZH7kpBz6eCcWOw3RQq8wjCMWNuelzc
         Yx5nezjm7JnBRrVop4x3pcv3lBazu0TTLmW1LciUmszppMnZkScNkmuX4hAF3QXvbzup
         puXIblxmNTlXlCZY90QrZJ4BNuvDZnelhd4WBKLaXwRoP46veB4kPppGeDsdptV49tdZ
         ZeW2KT64jIpAJWTqnXdR4rfVc6EWSA/47WHfAxKs6Sf84gRYOxrdAcidUbqh5WAg6v3Z
         0c/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QL+8+dNY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130-20020a250688000000b0066d99c3f308si16499021ybg.678.2022.07.04.02.31.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 02:31:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QL+8+dNY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8IQK-0004iQ-57
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 05:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8IPS-0004i0-5D
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 05:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8IPO-0004MV-EH
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 05:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656927021;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iqsagBJZGF+4dntZHoMtQa+tIxJQuqumJeqHrTl1sHI=;
 b=QL+8+dNY0PgZBh9XFboqWgFmfYv95+b2lM/hbwv+wf75glbsWj9dzy/Bcjs7B2Is1xfDRi
 yt+Ov3eDxy/0ZhJZmViJq5fthjeM1bUTMm0wjv3ezX1cW5JorKivOp4fat/bR1DADjoYmc
 cXQsWefgJYNTJDrVCAWyaAsLl+K7PZY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-hQyOJ6W0NjSzd0NoZMyKDg-1; Mon, 04 Jul 2022 05:30:18 -0400
X-MC-Unique: hQyOJ6W0NjSzd0NoZMyKDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C1A81C01B2D;
 Mon,  4 Jul 2022 09:30:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABD0D40D282E;
 Mon,  4 Jul 2022 09:30:14 +0000 (UTC)
Date: Mon, 4 Jul 2022 10:30:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Brad Smith <brad@comstyle.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
Subject: Re: [PATCH 0/3] scripts/make-release: Decrease the size of the
 release tarballs
Message-ID: <YsKzJE0haLxpHRxp@redhat.com>
References: <20220704064254.18187-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704064254.18187-1-thuth@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eLD4ykupFfqn

On Mon, Jul 04, 2022 at 08:42:51AM +0200, Thomas Huth wrote:
> Our release tarballs are huge - qemu-7.0.0.tar.xz has a size of 119 MiB.
> If you look at the contents, more than half of the size is used for the
> edk2 sources that we ship along to provide the sources for the firmware
> binaries, too. This feels very wrong, why do we urge users to download
> such huge tarballs while 99.9% of them never will rebuilt the firmware
> sources? We were also struggeling a bit in the past already with server
> load and costs, so we should really try to decrease the size of our
> release tarballs to a saner level.
> 
> Fortunately, edk2 has a permissive BSD license, so we are not forced
> to distribute the sources for this. Thus instead of packaging the whole
> edk2 source tree in our tarballs, let's just do the bare minimum and
> provide the license information and a pointer to where the users can
> download the edk2 sources instead. This decreases the size of our tarballs
> already to the half of the original size.

Regardless of license, we are not required to bundle the source code
and binaries in the same tarball. We've merely done that because it
was a convenient & easy way to approach the problem historically.

It would be valid to not ship *any* of the source for the pre-built
roms in the main qemu-x.y.z.tar.xz file /provided/ we ensure that
we *always* have a qemu-firmware-src-x.y.z.tar.xz file alongside it.


> Some few additional MiBs can be saved by omitting the sources of the
> skiboot firmware, which has a permissive license, too (see second patch).
> The final patch is rather cosmetics only - it drops some additional
> .yml and .git files from the tarball that are of no use for the normal
> user without the corresponding git repository.

I look at a few more scenarios

  * Current tarball:            119 MB
  * minus edk/skiboot source:    54 MB
  * also minus edk2 binaries:    45 MB
  * also minus pc-bios/ + roms/: 19 MB
  * minus roms/ only:            31 MB

IOW, cutting the tarball in half is great, but if we split off firmware
binaries and source into completely separated tarballs we would win big.
If we fully split off only the firmware source we still win quite alot.

IOW, rather than special casing edk/skiboot, I would prefer to see us
have make a consistent approach to firmware.

Either

 * qemu-x.y.z.tar.gz              (only qemu maintained src, 19 MB)
 * qemu-firmware-x.y.z.tar.gz     (pre-built blobs aka pc-bios/, 13 MB)
 * qemu-firmware-src-x.y.z.tar.gz (source for pre-built blobs aka roms/, 92 MB)

Or 

 * qemu-x.y.z.tar.gz              (qemu maintained src and pre-built blobs, 31 MB)
 * qemu-firmware-src-x.y.z.tar.gz (source for pre-built blobs aka roms/, 92 MB)


The second option is probably the least disruptive option for end users
building QEMU directly, while still giving distros most of the benefits
they desire. And probably easiest to put into practice for us.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

