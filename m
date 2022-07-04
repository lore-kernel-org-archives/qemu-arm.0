Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3125199lft;
        Mon, 4 Jul 2022 03:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tGq+2tCGtYfynszcAyHnQGLlwxs8eThlJbxQK3Fl7OMbjGH+/8nDvLyvY0bHWqv2Zvoh1H
X-Received: by 2002:a81:a24b:0:b0:31c:95d5:1725 with SMTP id z11-20020a81a24b000000b0031c95d51725mr5845120ywg.403.1656931579607;
        Mon, 04 Jul 2022 03:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656931579; cv=none;
        d=google.com; s=arc-20160816;
        b=tO9VHiZfYF2mZGh9KRt10CspGBSfWKxTYHUUjg+1zmwKiDxd4sbH06lCFQ5/M/OvvE
         a3sVY3VEeHlmRtICty9QtXvKuAVTEWUPjjkhr+l2ZqIJ091X39MHzMrtD4/hiaaCCOpx
         U8ByJnGpE45CVgLj2n8nMp+QOQUHC3ysLOSWjZX6a1pNWSJ90eTk9yr3ec1rnloHU+Zp
         QGtwlOQUvPSrLb0KqN7QIo4PjOnETwqt61xQs2S0xYE+BcZVNBOpGtdn4TX4RNbpCdFa
         S8p9wgSh/atanTZCIinBBVBeABtJUUctfyn0DQrSYDX/n3M1BIUDzA54UWyuKDgTRocg
         syNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=eyo1thwmR4Td1isJ9cIu6PGKySnWgDx/CgrPK4PZVZI=;
        b=jtm3XvbVo/x/KjVNepodieJ5onjRwRqotfAjzb7kG9vNV6rlTGP6sBKtnzuxIwr0Fx
         +nMtOPs2XNqQKSa9lwfh9MXNPVhvfn7A2RQCVLCwdrGPA03lyOYhx/PKMO2yTnRjIe8V
         PpAqp6hxIYjFWEJlUlziDE8uaSnn3u9OBRgQyJZDFtQYPmu5Hehh7UPWBvpWoS8u3y1t
         J3omY7YotWfwbLWz/yMBm1B/es4jPV2lWg245ZG7d1gWaoL+yq4eqvBv/3KsUFXStTkE
         ZLjeK/513ZC2IjoUVNKzaLkjO3hWRBl9sagrkjrfc5ZCszBoZaBVOCehwpbteD/RQi15
         2MQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C5RQLdxa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5-20020a056902150500b0066cf4f8d6ddsi36661969ybu.382.2022.07.04.03.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 03:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C5RQLdxa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Jat-00082l-20
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 06:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8JaS-000822-HQ
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 06:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8JaP-0008EV-Ab
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 06:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656931547;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eyo1thwmR4Td1isJ9cIu6PGKySnWgDx/CgrPK4PZVZI=;
 b=C5RQLdxatGSvfx5zKnWrN7AFkJfXuRQCLSsjeB9bFeBKVHXvc+sTexPtM0Fz76FOF/PV4t
 KXdt9bbEhAuO4REUUV9N70mTkABRLzoTbU73K58Y96O/2g+wJmX1Yo43N+/5UduDaGyQsO
 c+CgevyXLenhu1zLana0RlRaGxgnXu4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-pN1FJLlZN5quwsPB5UqtMw-1; Mon, 04 Jul 2022 06:45:44 -0400
X-MC-Unique: pN1FJLlZN5quwsPB5UqtMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 221D6811E7A;
 Mon,  4 Jul 2022 10:45:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E87F2026D64;
 Mon,  4 Jul 2022 10:45:39 +0000 (UTC)
Date: Mon, 4 Jul 2022 11:45:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Brad Smith <brad@comstyle.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
Subject: Re: [PATCH 1/3] scripts/make-release: Do not include the edk2
 sources in the tarball anymore
Message-ID: <YsLEz8Qj3QmaISxF@redhat.com>
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-2-thuth@redhat.com>
 <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
 <YsKvalrPIO96wWuP@redhat.com>
 <aacf7432-6f0b-b8f7-bdc4-116e3873543c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aacf7432-6f0b-b8f7-bdc4-116e3873543c@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: GSXGbe6MDIzD

On Mon, Jul 04, 2022 at 11:37:11AM +0200, Thomas Huth wrote:
> On 04/07/2022 11.14, Daniel P. Berrangé wrote:
> > On Mon, Jul 04, 2022 at 08:26:34AM +0100, Stefan Hajnoczi wrote:
> > > On Mon, 4 Jul 2022 at 07:45, Thomas Huth <thuth@redhat.com> wrote:
> ...
> > > > +cat > sources.txt <<EOF
> > > > +The edk2 sources can be downloaded from:
> > > > +
> > > > +https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz
> > > 
> > > Please use QEMU's edk2 mirror:
> > > https://gitlab.com/qemu-project/edk2
> > > 
> > > QEMU mirrors all dependencies so that even if upstream projects go
> > > offline we can still rebuild all of QEMU from source.
> > 
> > Note that the github/lab generated tarballs are not signed, while
> > QEMU's release tarballs are gpg signed, so from that POV this would
> > be a regression no matter which site we point to.
> 
> Maybe we should point to the edk2 release page instead? I.e.:
> 
>  https://github.com/tianocore/edk2/releases
> 
> Anyway, it's IMHO certainly not *our* job to provide signed edk2 sources here.
> 
> > Also it would need more guidance on what to actually do with the
> > tarball, as if you merely unpack it into this dir, it won't work
> > as it will be one level of dirs nesting too deep for QEMU's
> > build scripts to work.
> 
> I could add some wording how to use the edk2-build.sh script with a
> downloaded edk2 tarball if that helps ... not sure whether it is really
> required, though, we also don't provide instruction for building any other
> firmware yet, as far as I know.

Well my thought is that currently you can do  'make -C roms efi' from
the unpacked release tarball, and with this change, that no longer
works. So we ought to explain what to do to get that working again.

This doesn't neccessarily means docs. It could just be 'make' prints
out an error telling people what to do, or figure it out itself.

If we split off the entire of the 'roms' directory into a self-contained
firmware-src tarball, the 'roms/Makefile' would still "just work".

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

