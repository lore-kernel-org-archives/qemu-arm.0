Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1394028lfb;
        Tue, 12 May 2020 11:20:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypIkdY1pki7wONFSEHf+wVCGpNtoiELo4PLN6F7RlmMJiWup1MUxFhr63e5yA3H/kGDCSP/y
X-Received: by 2002:ae9:e858:: with SMTP id a85mr22107849qkg.478.1589307601167;
        Tue, 12 May 2020 11:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589307601; cv=none;
        d=google.com; s=arc-20160816;
        b=0Vl/2BIs2PwSkAT8fF5uCgq1oZBeMP169dwsR2Etejok9ze507a3qSZB9EestE70mg
         AiZICLOBg/PfYq9/uTRuzj7LdvY6VtmtduwJ8TbP8PUgQmsyotSt54G2E+mSdT/lu8lx
         l3Fk+hAu9aoAoAFyDfWfBWHyd27d4gEpdANEcHffYtvvtg0loFABR508giueztCPtUuX
         weLb3e7LT8p86TTUw7FBBTgzqELY4KOO7V2Uvwr5SgghQ+s0Ar67GMo2Sy0Y0FyDqG1f
         zDP8mH4YXs9KIdFHXws8/raR6Z98/nxOwqgsV8rdlyprk4GgWaCy4TiLIJ0iYxHfZwsQ
         DGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0lqs+neV0GOf9SwpBPCkfjro3/1blwfBwfl02q4MqgM=;
        b=IK29DIxWNEWRcPNVh1c3MgeHkvkyFM8zvmdaGvw4nCXdjuphXqPHQ0CpgRV8NuWJhc
         Z39etmNd4h9dwLbSU6ssCTLVOj4JVGExNxJ8NhvB3O1B44LkaX1n/GeZRPfPz4bEoSqT
         5cpUHDptwR4pyQbl/KnfDMnOWxUfgz/WxxZHjt4nKC7Y103gpyOGbxhe28Zcj8WkEvGh
         bQB8vNQaP6blmNsj3vgdZ7xBPKdP94fXQmARk2pBybh6k87FJ6f+vGldK0sTYY9Zzkvl
         vJJcWg/WaDOGAGo5FJcq8hQx3nObu1606fP4RC3xxJyDqqrRDkSdTfupHXB1k4bTJ65K
         4MOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fYG5AwFH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si3042346qvt.170.2020.05.12.11.20.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 11:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fYG5AwFH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYZVY-000393-GN
	for alex.bennee@linaro.org; Tue, 12 May 2020 14:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYZVN-00037g-IG
 for qemu-arm@nongnu.org; Tue, 12 May 2020 14:19:49 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26148
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYZVM-0003jP-Bp
 for qemu-arm@nongnu.org; Tue, 12 May 2020 14:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589307587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lqs+neV0GOf9SwpBPCkfjro3/1blwfBwfl02q4MqgM=;
 b=fYG5AwFH+lX6S0CjEX8kawtcbD8a8+fwyhuRICbr+yPzhEvDc0OE3AsEcMr570Y9IWvjY8
 R/NaPTzDCxQHH/2t0yc4btqCa6E5wZjj7LkzVxw2Fq/vySaeTYbXXKGw0QLnH7o7vpGDqd
 GtJD2apEqoQTaB97LagX1HJD/5HZwEo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-Om5oRySeOnWtzzy4-c39Dw-1; Tue, 12 May 2020 14:19:45 -0400
X-MC-Unique: Om5oRySeOnWtzzy4-c39Dw-1
Received: by mail-wr1-f69.google.com with SMTP id z10so3308809wrs.2
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 11:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0lqs+neV0GOf9SwpBPCkfjro3/1blwfBwfl02q4MqgM=;
 b=RjZINNSwA6neWW0GvDPaA9J0D4ntRGIRb9FOsyUvWfkSNopPzzB3bjCXij+44NyZfT
 +nZ585mnfpHdUjrTFv0w9H6o+LXVXW+CNEPkKEMtLpaMOF71olMlVbo7/Y9SnK34oe6M
 nC8/yGfM3b0TtxAqCYSsZD+KZj3vm/HYLtP0O8UzS6QLFlcMAFd6cy/9aNb40y58/Zi/
 IXl8OpP164V1WLpL2vpKM+dNT4shEABjLYiarA0oZj3fdzp4aw/r8rxmlrSHDtWTgRFN
 Km0C2wltoGaGW1pu0vAhZ5SNNqQ5QWtj4PJsC4YsqqfM81jU3GhgyhptpxO2vqRxda+L
 Myrw==
X-Gm-Message-State: AGi0Puax+ASitMvd7FnpIuxImUsQZv6zE12GeRNuY8wiOCJ22hXE0M9F
 gLURQx07sVOk6pvsw6zobQ6DNHcaMOGxIWSpp2HYqmDbOb9RdXj6l9wNGt7r3VjX1kzMffsorVB
 y+O/Aopk/xIyUpsHjtA/AZaW2t8qP
X-Received: by 2002:adf:e511:: with SMTP id j17mr28538492wrm.204.1589307584626; 
 Tue, 12 May 2020 11:19:44 -0700 (PDT)
X-Received: by 2002:adf:e511:: with SMTP id j17mr28538392wrm.204.1589307583347; 
 Tue, 12 May 2020 11:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200512170704.9290-1-rad@semihalf.com>
 <16d128a6-c07e-d2d1-129d-c4047d0da3ea@redhat.com>
In-Reply-To: <16d128a6-c07e-d2d1-129d-c4047d0da3ea@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Tue, 12 May 2020 20:19:32 +0200
Message-ID: <CAP+75-Wq3imeKOLd8qY+8OQ0Bjq_X8Z+n1Z=KqogKX=Qn2c0fw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update Radoslaw Biernacki email address
To: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Leif Lindholm <leif@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 01:41:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jz5BxTxZz95R

On Tue, May 12, 2020 at 8:18 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 5/12/20 7:07 PM, Radoslaw Biernacki wrote:
> > My Linaro account is no longer active and stop forwarding emails to me.
> > Changing it to my current employer domain.
> >
> > Signed-off-by: Radoslaw Biernacki <rad@semihalf.com>
> > ---
> >   .mailmap    | 1 +
> >   MAINTAINERS | 2 +-
> >   2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/.mailmap b/.mailmap
> > index 6412067bde..668da447e3 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -46,6 +46,7 @@ Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arik=
alo@wavecomp.com>
> >   Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.=
ibm.com>
> >   James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
> >   Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
> > +Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
> >   Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
> >   Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
> >   Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1f84e3ae2c..a9d6893036 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -799,7 +799,7 @@ F: include/hw/misc/imx6_*.h
> >   F: include/hw/ssi/imx_spi.h
> >
> >   SBSA-REF
> > -M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
> > +M: Radoslaw Biernacki <rad@semihalf.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

And now:
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

=3D)

>
> >   M: Peter Maydell <peter.maydell@linaro.org>
> >   R: Leif Lindholm <leif@nuviainc.com>
> >   L: qemu-arm@nongnu.org
> >

