Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp646430lfc;
        Tue, 10 Mar 2020 04:46:58 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvA1zv91ZnlUX7VrNf2hFRzrWZE6kRqJayUBcRsB1rLlFaDY9tuIr2zLrpEjqLpTdou7C4B
X-Received: by 2002:a05:6214:118d:: with SMTP id t13mr17912933qvv.192.1583840818622;
        Tue, 10 Mar 2020 04:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583840818; cv=none;
        d=google.com; s=arc-20160816;
        b=uSmbLuPOWicL1eEILkcD4kZ3YI22Z/adR1WHhRYUfcs/mn0oJQVXG3R5HKCGWmKQay
         ozPNn05s+QeXiiy3FK5AfrRhmHYpSQSHvXLNCx/NP8FsIFo3IattMdKhYrl9YzdXhROg
         +0AozI7nD2M2l1jQrKEZOety38P0lNlfJ93CAz8q8VP5581m5Zv+UAq80fn5AF4fpK+9
         g0FpurlASaK0LhcYWTFsqVLE6mefyUYi24cWBsgVOeOewbxeXGn6rEioRb1Dxue6DiS7
         /b2C3G+4RzvkCa1nRJL5UsnYqCSKJzNMXI31JILGsNVgPz+nfow6VvqfWvRZMg4sOgGm
         xnug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=ZGqiBJ0CZ5WpkyFas6I7eUP/AIVUqtGGfpTG+U12qXY=;
        b=aMMG4BFAhFBiQg+pE6+lsvA7dd5S/RuDpUlqwMcrUumvxkhTRLFM4ifTdRPnJccvz6
         r527Hup2D6nV7i5VsmK3U5muejgEXScnSYzlsgmkPUFW6kM/GFR+XAifi6VG1ThFwY2a
         ikiAxdaHDq1WDiUxxXOnBQXVPp0u3x3vp58Y+xELKKsHSDJ9MesYCiVPRfMXK39El985
         Y+7GOdqi9UdKFVmRCLuBsUNye1XbPur/s7oNPIfxL6n6pultDALtghU1Zq6XjKZT6Al2
         XzEMhjry0M7/zIeo0ONPOefzPhHgtHBkAX8jg6w+61hnYQx/mSMXFZkW/ey6KiyzpCKM
         p4PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h0dMmd+X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t25si7304996qtr.245.2020.03.10.04.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 04:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h0dMmd+X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBdLd-0006LR-Vp
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 07:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jBdKv-0005Vt-HX
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 07:46:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jBdKt-0006Pg-Ip
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 07:46:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44835
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jBdKt-0006Mr-Bd
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 07:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583840769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGqiBJ0CZ5WpkyFas6I7eUP/AIVUqtGGfpTG+U12qXY=;
 b=h0dMmd+X39KdVSWpSIfikExeFVd77UuA1MK1qR7ck0PPMDWcjwuOyMX1YrIRYrNLjSqtvn
 fnlaVpxs5wV2uHmVm2Q+nVWQEgezG4MPPqd9GPTIxbdXReMD+FX0G40zaal1eWhsg4cVX4
 DAy3NTTNlW5R8w2TKgW0WqSImxbPFGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-Sc4CF4rQPUqcyMlVXzSYDQ-1; Tue, 10 Mar 2020 07:46:05 -0400
X-MC-Unique: Sc4CF4rQPUqcyMlVXzSYDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2CCA108442C;
 Tue, 10 Mar 2020 11:46:02 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74EEA10013A1;
 Tue, 10 Mar 2020 11:45:49 +0000 (UTC)
Date: Tue, 10 Mar 2020 12:45:48 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 00/33] Trivial branch patches
Message-ID: <20200310114548.GA6926@linux.fritz.box>
References: <20200309150837.3193387-1-laurent@vivier.eu>
 <20200309151621-mutt-send-email-mst@kernel.org>
 <8db36062-b45d-6c2e-c7d8-98dd2b9db06f@redhat.com>
 <0bb2eac1-74ab-bee8-e8d0-bac542562cdd@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <0bb2eac1-74ab-bee8-e8d0-bac542562cdd@vivier.eu>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q2KqDo6DLrKT

Am 10.03.2020 um 09:02 hat Laurent Vivier geschrieben:
> Le 09/03/2020 =E0 20:30, Philippe Mathieu-Daud=E9 a =E9crit=A0:
> > On 3/9/20 8:17 PM, Michael S. Tsirkin wrote:
> >> On Mon, Mar 09, 2020 at 04:08:04PM +0100, Laurent Vivier wrote:
> >>> The following changes since commit
> >>> 7a5853cec479a448edae0fb2aaf4e2f78c9c774d:
> >>>
> >>> =A0=A0 Merge remote-tracking branch 'remotes/mst/tags/for_upstream' i=
nto
> >>> staging (2020-03-09 10:32:53 +0000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>> =A0=A0 git://github.com/vivier/qemu.git tags/trivial-branch-pull-requ=
est
> >>>
> >>> for you to fetch changes up to 916c92503bd5348a33e561db600d8894bde636=
bb:
> >>>
> >>> =A0=A0 monitor/hmp-cmds: Remove redundant statement in
> >>> hmp_rocker_of_dpa_groups() (2020-03-09 15:59:31 +0100)
> >>
> >>
> >> Could you avoid CC everyone involved on the whole PULL req?
> >> I was involved in a patch or two and don't really need to see
> >> the whole series. Just the cover and the relevant patches
> >> would be enough - if I do want it there's always lore.
> >=20
> > I suppose Laurent used git-publish, which has this limitation.
> >=20
>=20
> Yes, I use git publish and CC are automatically added.
>=20
> Philippe, you told me some time ago you have a patch to fix this
> behaviour and only CC people on a patch base. Is it available?

Actually, I don't think it's even necessary to CC anyone at all (except
the relevant lists) for pull requests. These patches were already
reviewed.

Kevin

