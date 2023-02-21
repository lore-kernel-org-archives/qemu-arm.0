Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3118801ejb;
        Tue, 21 Feb 2023 02:22:57 -0800 (PST)
X-Google-Smtp-Source: AK7set8G3mHjnwsqjfX6iUBKS8fk8FB5KyX42lCDTBZf0432jQWYXr9bBODkCLyuFUvFSHihqIO7
X-Received: by 2002:a05:6214:cc3:b0:53b:d514:724 with SMTP id 3-20020a0562140cc300b0053bd5140724mr6071036qvx.26.1676974977270;
        Tue, 21 Feb 2023 02:22:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676974977; cv=none;
        d=google.com; s=arc-20160816;
        b=L/pKbNGSQ3quIfVP1/2Q0FKZfZwI1HTX5xHL+ZGEvsnOez80/9G4zkoeZ2Jg5L02dG
         e5Ce4poEl+tJNSyeeFahyJ8E3KL3s1tUX2BrvTuzsL6ikqJXM58Ve3oRcltP6+5IBdFV
         RspUsznemThJrlhX1YyjcQwMk6af2L6FtWHqnLv+P/uwnVSyHEhZfEiQWIFg3enf89OI
         WbGneWyIKeFpU7DiuNUD7J7oBfEKBbX1J5xiSAWvHUzEtQLjpwsYltkyP0bCrTkZd99M
         IRw594bJya9l9dPrA2EwAqGE/7LTjgUX2YsxWCaU8BCX59pXPvxbwXMLYv/I5SUMGVUr
         PPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=HMBbiwxRi42ZlqQWSU0k1MBIEpcwEwpc0lTZ8GcmjRc=;
        b=CC8sRk4IiMdqBBoEXYFiExt3Cq8zsETYb7+8d4ZXdlC4MLzeY0Rphu0noHLS9VrrDm
         4U9J5jfeGjcPar5reHBNuohWUCB394Yst71LVmUNHHsUqAtiGEi0H+YbUEItVQ8rirV/
         37fXR2/WGgMdjA3gm7sczTswcP/RfFPYzx/7HiLKawNi73+dhzPj8P7o4/yOxuBUmuTu
         sos63izucFxPYNPJlSeKOKqFDqJfVjnaylnV32RowMwPffIDelTV8ViICQ7xCFn9kCPy
         iQzJjQGAhAA/Sua9EuMNDHVC8yXHHihX8Br1qq8GzeOaYPiG+A+IwT0YC6hQGegShHfA
         IB0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ok2gGr2L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a0cf5cb000000b0056c23bb1597si2956966qvm.88.2023.02.21.02.22.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 02:22:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ok2gGr2L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPmv-0006gx-18; Tue, 21 Feb 2023 05:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUPmn-0006fl-95
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:22:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUPmk-0004W6-B0
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676974926;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HMBbiwxRi42ZlqQWSU0k1MBIEpcwEwpc0lTZ8GcmjRc=;
 b=Ok2gGr2LA6OjZXZcbxxokYtyvnKEGkXgrqsJGjcajUg5dUG/kMtwnP3AXyH0PeXshIfchS
 WWjHn1Us54Xr5i3LbD9SYsMUTvYofYxoYF8kI2g8CfRodwOJZnoJgbhI9Vt/eiiojCbx5C
 7795yLxoA6F0x3pZyYo5yQQeKq8RKuQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-GquoxEBXNsqKg9dDvQ-K2g-1; Tue, 21 Feb 2023 05:22:02 -0500
X-MC-Unique: GquoxEBXNsqKg9dDvQ-K2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01C17882822;
 Tue, 21 Feb 2023 10:22:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D01CDC15BAD;
 Tue, 21 Feb 2023 10:21:58 +0000 (UTC)
Date: Tue, 21 Feb 2023 10:21:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 01/15] util: drop qemu_fork()
Message-ID: <Y/SbRIw+VIPxo/nA@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
 <20230220214859.3792171-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230220214859.3792171-2-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NpOMkJDpYrRb

On Tue, Feb 21, 2023 at 01:48:45AM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Fortunately, qemu_fork() is no longer used since commit
> a95570e3e4d6 ("io/command: use glib GSpawn, instead of open-coding
> fork/exec"). (GSpawn uses posix_spawn() whenever possible instead)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/osdep.h | 14 ---------
>  util/oslib-posix.c   | 70 --------------------------------------------
>  util/oslib-win32.c   |  9 ------
>  3 files changed, 93 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

