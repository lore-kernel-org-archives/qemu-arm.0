Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3108818ejb;
        Tue, 21 Feb 2023 02:06:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/n2pkNY0/jgIQybCLAEWDsGertj/k1TWZlrR5KF8q/eyjsV5wZy2C9PVhndjqMjn96txeD
X-Received: by 2002:a05:6214:301d:b0:537:7484:8d1c with SMTP id ke29-20020a056214301d00b0053774848d1cmr7520141qvb.30.1676974016570;
        Tue, 21 Feb 2023 02:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676974016; cv=none;
        d=google.com; s=arc-20160816;
        b=s+OPbty/GvqWYtU5GEOzk2V5h9KeF3UuTwpQYo0Bc41UGDQINjf6Fw9qSUmegPKKvl
         A45Bd3kxaKZW5GJ2J4pfq+TVgk6FkefIq7skDpkPlWamyB9dPRXaFvUe7D88i4mJ2WnV
         c6gIhooLBB6ARbv69RJoZISdZU3zRmKhuDoVXxp89s6w7pzorC/Y8G+n7/doW9J7MEr+
         iLagbcv7cUQNk7B/JMDDZUaFkINJ9OJ228ply2scQB3E3GCZczifFl9gP9LmAwUEauYy
         2RJz64LE72rFBrXl2MnQwwUsUVavrzyVxsViF3wqLfw8OrPo8opTiG5XBWTgEbYYur5f
         f+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=H7EaGnMEI02WRh0sPDME1v5xdwxansD5J6eyouc+hlQ=;
        b=jA/fKe7aet56PJOzVqj0JAGMNIB5e3GvtUpEFpA9IaPRIcNf0xwTvJwGg+1IgAFsYv
         giZks7ELHcHZCXG8Lr9mCOy9EXF5Rj0ks3Ku4oBThsGSHx81+IxNe7o4OQRrwokKpfWv
         AZUP/0Bj5hqoY6tC3mronMyhcfyxIWd2XPOl2iZEnnzSf/db9vYQYI3nji7VBXqFcGcD
         cdmeNW/vDR9f98JNrcdRcP4tOnYPwbBFwrcFYvuoY/v2LxOEOeR1UsPM1Kqa/ls9qaad
         XF2ZViXQNsv9rC0rmQTK6exqUtV7BxXyKoa75nFqtghlOnu21VAJhZMD22laEGcPG5dM
         DglA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DFliF8kA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020a0cf3d4000000b00570bc9840dasi9510465qvm.479.2023.02.21.02.06.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 02:06:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DFliF8kA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUPXo-0007n6-GP; Tue, 21 Feb 2023 05:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUPXl-0007mI-9F
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 05:06:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUPXj-0001Jm-Hy
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 05:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676973998;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=H7EaGnMEI02WRh0sPDME1v5xdwxansD5J6eyouc+hlQ=;
 b=DFliF8kAYVeOEKsjcgUTFU+fzoInDRpZFyztwfmgEJ8+FubF029AQndqN527+idyaPVir0
 Wz1iEyTy3WqjcEwkCBsZmtgY6DyiimAMR/2jL7ZM67J3LJFe7wq7FNK9neKaic00PEEdUK
 3J0dlMI4BvWB9oBmrW5hMPDElxXIt3Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-HYjLLf6OPoGqHC0XzqInxw-1; Tue, 21 Feb 2023 05:06:36 -0500
X-MC-Unique: HYjLLf6OPoGqHC0XzqInxw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2D5629AA384;
 Tue, 21 Feb 2023 10:06:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DD51492B02;
 Tue, 21 Feb 2023 10:06:35 +0000 (UTC)
Date: Tue, 21 Feb 2023 10:06:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: Detecting qemu from guest on arm/hvf (apple arm)
Message-ID: <Y/SXqGGZhN0OJu7V@redhat.com>
References: <20230215234846.GJ95670@funkthat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215234846.GJ95670@funkthat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: t01JBErhbeie

On Wed, Feb 15, 2023 at 03:48:46PM -0800, John-Mark Gurney wrote:
> Hello,
> 
> I was wondering what the best way to detect that FreeBSD is running
> under qemu/hvf on Apple ARM?  FreeBSD doesn't see the ACPI FADT table,
> so I'm wondering if keying off of something like the QEMU0002 device
> in ACPI is the best way?  Or is there another option?

Aside from Peter's suggestion to check for actual features that
matter, if you genuinely need to detect a specific platform,
the virt-what tool is generally what I point people to. It has
loads of checks in it. It can detect QEMU on aarch64, but doesn't
distinguish KVM unless SMBIOS is present too. The 'virt' machine
type will include SMBIOS, so I expect the KVM check will probably
trigger for HVF too.

  http://git.annexia.org/?p=virt-what.git;a=blob;f=virt-what.in;h=01e9acaf689416d9bff6eaca1b849dc4e798a0af;hb=HEAD#l340

This is wrong from virt-what POV, but I presume for your needs,
you'd be happy to detect *any* hypervisor as you'll want to tweak
the clock frequency for both HVF and KVM VMs

If you do come up with any tweaks to it, patches would be welcome.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

