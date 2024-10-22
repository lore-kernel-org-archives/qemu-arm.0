Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2874308njb;
        Tue, 22 Oct 2024 00:10:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHA3pXJYu3d4YS80ftxAGt56z1HQJ/b1zzAWs6S1bfYO6brRvZmuLErzpVcBxzbNnt1Awy/ErSMj1XjA==@linaro.org
X-Google-Smtp-Source: AGHT+IHZvT2pE8EDjdLl7hcXAxzb5fGJTP9k20rZrao0dG54tujQ5ourN4YAvhMOp7RrcYvkhadJ
X-Received: by 2002:a05:620a:444c:b0:7ae:6169:d8f2 with SMTP id af79cd13be357-7b176888d7amr166010685a.44.1729581034825;
        Tue, 22 Oct 2024 00:10:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729581034; cv=none;
        d=google.com; s=arc-20240605;
        b=ZqDM8xAodWXi6EgRMANjUaUGovr0O0IcKnrhVvFuydUe192eyKZawMRm5ChSVfvE/Y
         PCbd0gK5aERnL970PJijUngFh2cPeoR4Izy2Rl/emau/vOWa90HeKZGsOewwxuO2PhqD
         1V9+RwVG8cDI1DXGrRgcj5/fKM6DoDdyUfvx4ZePbLle0yBHP8YzHHT+GGmEexcJdAoe
         wtgh2x9noUwOfynDn+7Z3sPR2AP0j3S4TiPSaspJVkt/QZoHif9O2fgG5qdfALh9DiSh
         knMngepCXg7GAV8XPdfk/8/OwqPfQjRKA8RniJ7Up/TbPpUGoJyBMUYB1uMkz4HPlQyY
         N+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=K6/fFoh8XYVNg/Ofx5U0Ca4c2O84JWJivPL9nzUHcGg=;
        fh=3gOFwMTnvUemFUvaLqla1pxcRgjeFcRdgBUbZSCB1Ak=;
        b=HXHGXXWRf1F5lsqSm2udg9M2TNbuXJ7zmkvOSqqr/ncm3j9N1MvqSTZQvxEvOPUg1e
         WSG/Vy2OiJIjIk7jZUGCKRA95/cAKhYMo5oBNesCo0zQHzRjBgH0TBsQoa+N1xK8YSsD
         zqysJZgmB/VmbtWkWS7k37x2wevpBxJ1zQfo2gxYtxTVqjIB+Mn7vDfN9lmv9+rT4IEj
         yKNWboBJ5YjGj7FBSOQTEf2or0rPU5kCb9+7EMxLgs7JapY4T5G0xDIleg5NKxElUdw0
         pl5Vxtfb83vb2dDPs68qitDFvDL80QmSaTp2mqRkv4RyMhitKNJIzM/4oTaAwHU1cezu
         ODPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GNj8ItR+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1659fd6easi573693585a.209.2024.10.22.00.10.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 00:10:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GNj8ItR+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t391h-0003Ru-9a; Tue, 22 Oct 2024 03:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1t391e-0003RG-QY
 for qemu-arm@nongnu.org; Tue, 22 Oct 2024 03:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1t391c-00007J-Gd
 for qemu-arm@nongnu.org; Tue, 22 Oct 2024 03:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729580990;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6/fFoh8XYVNg/Ofx5U0Ca4c2O84JWJivPL9nzUHcGg=;
 b=GNj8ItR+mCcjmcFh+CZZSeVOWCjQcns6STYgNWvmu+ROVuC0qDZ0JvyiwfygsAC0thknKE
 OOz8/EytLD2Kzbqwp9UxklaraCR1j2Bd4We4LtYrOtpS2L/ABhzpvQwNJahkX87rcLo00/
 Xt9EL4cLP2eO2kBSvVsAN3A8klw31Xo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-173-P60xCmVkOO6jQQpP8LVmVA-1; Tue,
 22 Oct 2024 03:09:47 -0400
X-MC-Unique: P60xCmVkOO6jQQpP8LVmVA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9D0801955EB1; Tue, 22 Oct 2024 07:09:45 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.59])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 12FAC300018D; Tue, 22 Oct 2024 07:09:42 +0000 (UTC)
Date: Tue, 22 Oct 2024 08:09:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] tests/functional: Add a functional test for the
 collie board
Message-ID: <ZxdO57heifGyI4lw@redhat.com>
References: <20241017163247.711244-1-peter.maydell@linaro.org>
 <20241017163247.711244-2-peter.maydell@linaro.org>
 <977b5038-fa06-46d4-946d-f60135ecf106@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <977b5038-fa06-46d4-946d-f60135ecf106@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.421,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.699,
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
X-TUID: P56gxYo8J4Mo

On Tue, Oct 22, 2024 at 01:11:31AM -0300, Philippe Mathieu-Daudé wrote:
> On 17/10/24 13:32, Peter Maydell wrote:
> > Add a functional test for the collie board that uses the kernel and
> > rootfs provided by Guenter Roeck in the linux-test-downloads repo:
> >   https://github.com/groeck/linux-test-downloads/
> > 
> > This just boots Linux with a userspace that immediately reboots
> > the board, so we wait for the reboot log line.
> > 
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   MAINTAINERS                         |  1 +
> >   tests/functional/meson.build        |  1 +
> >   tests/functional/test_arm_collie.py | 31 +++++++++++++++++++++++++++++
> >   3 files changed, 33 insertions(+)
> >   create mode 100755 tests/functional/test_arm_collie.py
> 
> 
> > +class CollieTest(LinuxKernelTest):
> > +
> > +    ASSET_ZIMAGE = Asset(
> > +        'https://github.com/groeck/linux-test-downloads/raw/225223f2ad7d637b34426810bf6c3b727b76a718/collie/zImage',
> > +        '10ace8abf9e0875ef8a83b8829cc3b5b50bc6d7bc3ca29f19f49f5673a43c13b')
> > +
> > +    ASSET_ROOTFS = Asset(
> > +        'https://github.com/groeck/linux-test-downloads/raw/225223f2ad7d637b34426810bf6c3b727b76a718/collie/rootfs-sa110.cpio',
> > +        '89ccaaa5c6b33331887047e1618ffe81b0f55909173944347d5d2426f3bcc1f2')
> 
> Should we wrap these lines to comply with checkpatch.pl?

While we have some line wrapped URLs in the tests already, IMHO they are
pretty awful to look at. I think we should make URLs be an exception to
line wrapping rules, provided the URL is the /only/ thing on the line.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

