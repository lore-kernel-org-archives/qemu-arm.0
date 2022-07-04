Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3094777lft;
        Mon, 4 Jul 2022 02:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u861DWvzVSG3gooMVUZinELO3EcgXC4VKxOZRwNMAf8O/94vFuuh3p6mT22tHViv6VcbmB
X-Received: by 2002:a25:f88:0:b0:66d:c5bd:f5cf with SMTP id 130-20020a250f88000000b0066dc5bdf5cfmr23189632ybp.77.1656928384708;
        Mon, 04 Jul 2022 02:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656928384; cv=none;
        d=google.com; s=arc-20160816;
        b=ItyjgYHREoyZjAak4oTUBADmq7TuCCK6KQu6VQMZwAvqsbBXgSH9VGAyBRnifK0NH8
         RNB/MDojvOHmk4EDD565WX2v6euMMzl2edHpEE+yQecnjtBUaEfj/FsN7OQBqGlwinwZ
         7HQLe0TPZzpr0zdKWFi8LtKJW1lBLlex4MspALx+7jGSb9tBobSv2fxG7LN1PIMBjYXp
         BMzi7RdVHtX2ogZr6XVEfFtULn7b1THfQhICCc1c8fEMD6e9iczlgQIOG8DJ3xpudDPg
         fbYzyCHmn3fYOrGxPSydgoDxwgVtOC2JB5947CUNsiM+m2zIj9bsGGSSiaPMTV3Yg4Ax
         CMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=hHF6+I3bdNUdgcc6Ld2ZSr8vTZm6lH/GHbLTzmH0uZY=;
        b=Gp99Qk9c8vFyfXugFqAJ5d0LATwC9a6NmQLpi4YbrEG8v+CTMSGd9xrDeUC7KUGAlv
         feH1s2ASqm360RHqN1qzPrrHD7ezPcXci9pXgtz+j0F22fKBImpcmMqaORrRHX7PpM8/
         gjdOJf6TNWrXYX0izchLbwAG8fKCNdMjdc2UnSdaD3yswVu9Nx2qIAerLHe/mxbnLASd
         tOu8WtncRFHgQhzbohiKvlNIyXVswsKf+lj9+ZurnOPWyX+ZNlrj3UbCAAOUEwzLX9jw
         pCxJRQnm1460cCsJaaVcaXPoX9BfIL4VDyQM71H8/ilMVMUEM6X+rX+6H1ATWBYiy6Pl
         7Xmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GOGHTZdE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bc5-20020a05690c000500b003177a10783asi48608967ywb.403.2022.07.04.02.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 02:53:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GOGHTZdE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8IlL-0006uc-Vz
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 05:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Ihk-0001L9-5H
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Ihh-00071R-77
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656928156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hHF6+I3bdNUdgcc6Ld2ZSr8vTZm6lH/GHbLTzmH0uZY=;
 b=GOGHTZdEogHxhC7Ji3qK3LzMpk2JjImQieorMto8aBJwZqpU08jzf2LkOKbzxNewE39kaW
 V5veP0eJsCbT8OXA0VC5s9mLDkgWZ29fIVphJCkRPaxVG32U8RSmGLz7Qp1CbOa7YIjJ8b
 8y4RfPzYkR6LkiWDBKVgvdJU07Tv15s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-JgYG8SKGMZiXhM61Bt0ONA-1; Mon, 04 Jul 2022 05:49:13 -0400
X-MC-Unique: JgYG8SKGMZiXhM61Bt0ONA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFED0185A79C;
 Mon,  4 Jul 2022 09:49:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7791640E7F28;
 Mon,  4 Jul 2022 09:49:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 13B2518003AB; Mon,  4 Jul 2022 11:49:11 +0200 (CEST)
Date: Mon, 4 Jul 2022 11:49:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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
Message-ID: <20220704094911.233y7qv2wsiwxyai@sirius.home.kraxel.org>
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-2-thuth@redhat.com>
 <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
 <YsKvalrPIO96wWuP@redhat.com>
 <aacf7432-6f0b-b8f7-bdc4-116e3873543c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aacf7432-6f0b-b8f7-bdc4-116e3873543c@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zhdRQ7ywCjxL

> > Also it would need more guidance on what to actually do with the
> > tarball, as if you merely unpack it into this dir, it won't work
> > as it will be one level of dirs nesting too deep for QEMU's
> > build scripts to work.
> 
> I could add some wording how to use the edk2-build.sh script with a
> downloaded edk2 tarball if that helps ... not sure whether it is really
> required, though, we also don't provide instruction for building any other
> firmware yet, as far as I know.

The instructions are printed by "make -C roms help".

We could teach roms/Makefile to either automatically fetch the sources
(be that the upstream edk2 tarball or a qemu-firmware-src tarball should
we go with the approach suggested by Daniel elsewhere in this thread),
or throw an error with instructions when they are not present.

take care,
  Gerd

