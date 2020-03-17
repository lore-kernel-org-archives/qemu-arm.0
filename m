Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1632443lfe;
        Tue, 17 Mar 2020 07:36:33 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuNdulSZoStFwjpjMybFRiSwV3UGyDv2DUMnKUl8LK61YjVXXCSbRk0NJdP4v/4wl/HQv01
X-Received: by 2002:a37:bc1:: with SMTP id 184mr5103945qkl.57.1584455793196;
        Tue, 17 Mar 2020 07:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584455793; cv=none;
        d=google.com; s=arc-20160816;
        b=wNRhSMgPdIAuUSI48yuCD4PI7m7ZtzSrRHvafWdfhSVy7PQY+lhXqEosKDYTLEWrem
         GOEnHuQ07q/SueDKzMdqnHzAr2NI1o1gfeD66Mr7I9wOqJ7zYUXddreoc/DSSQ+2j7/r
         SzsQphOigfpAuRu7G3DL3wVU6RRTDd+HUuLawi75CK5lLNMsFFTcw3t4z7tEd6pBfn4Y
         P2o3JAtwM5BIsnJvkfTpLBUAc0jAfwpHplo4+5ufITnIdsgSaHnPcO4iWOKMM1IVw/FT
         7/BV5VEvVDkl2AvlT+HElTs1SHQ0EmJh+rpZBPHFKcUf6ymUoDGC1BMzETywnwC1Ag1Y
         Dxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=VJHYpdUhlXlHilDsciLtfAG4qlypYMH79V8zbhLt73c=;
        b=Cc/cXA+GJQ7suWArn3pzN1pm14E0TA3BbsTFs5K3HZKZKanDWfBszIjPdUJ7DQ3/1s
         STK6CzUlxHPYRyn6Owb6U7CooXV2gwkBAbksxGwjuqq+nNi3tooeJWRkzdMVUQgf3Asc
         dgJWTfK2qojHs3RzLFBjdiaMmaBjQ5BRDvzlEhjM8KF3O5bV3dI9ja7XVPsIBPvO/PVB
         cIOtAasiuPJetl8OBaweZNG/xpiXi9xwqdauXLq48dLibrJepNueCcfZm7Rth2aFj9Ba
         hcTJc1MFwguLVebS71KqAutKtlq/f5ClBEotu042pXil1X5xMRCkIBVwgEFM3dPRC9IF
         xjNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pvx5b3No;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si1962158qkp.40.2020.03.17.07.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Mar 2020 07:36:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pvx5b3No;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEDKa-0002cE-JA
	for alex.bennee@linaro.org; Tue, 17 Mar 2020 10:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1jEDKS-0002bJ-Ar
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 10:36:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1jEDKR-0004W8-EQ
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 10:36:24 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:29788)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1jEDKR-0004TD-9n
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 10:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584455782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJHYpdUhlXlHilDsciLtfAG4qlypYMH79V8zbhLt73c=;
 b=Pvx5b3NoQ3vEiucDHr9vDnWxKpxPs5uHVlb7oGSgyIdLiR562MuuU75r4icprywJ7icYDy
 kTlVkhQCWCpJi9wl5AqFrIGZI6g8KNsGieiUjvM4V9TIw965n8Pm228sh0dVikeVjBrdKT
 K1Fx+s5NB5m8bXPwL6FM73DOvrrgL1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-TbSTdG9NPTaNRdcHbajZjA-1; Tue, 17 Mar 2020 10:36:19 -0400
X-MC-Unique: TbSTdG9NPTaNRdcHbajZjA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A63FA801E53;
 Tue, 17 Mar 2020 14:36:15 +0000 (UTC)
Received: from localhost (ovpn-118-148.rdu2.redhat.com [10.10.118.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 742645DE52;
 Tue, 17 Mar 2020 14:36:10 +0000 (UTC)
Date: Tue, 17 Mar 2020 10:36:09 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
Message-ID: <20200317143609.GG1817047@habkost.net>
References: <20200303100511.5498-1-peter.maydell@linaro.org>
 <c71dbe77-a883-361b-e33c-ed85ce07c0de@redhat.com>
 <CAFEAcA-gZnOVD9MPwUBCcA4fvrTSaE1xEvd9dyr_r1RctiPJhg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-gZnOVD9MPwUBCcA4fvrTSaE1xEvd9dyr_r1RctiPJhg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qfWwhWdcs6SQ

On Tue, Mar 17, 2020 at 11:09:22AM +0000, Peter Maydell wrote:
> On Tue, 17 Mar 2020 at 11:01, Philippe Mathieu-Daud=E9 <philmd@redhat.com=
> wrote:
> >
> > ping
>=20
> Eduardo said he'd queued it -- I've been assuming he'll send
> a pullreq for it.

It will be on today's pull request, sorry for the delay.

--=20
Eduardo

