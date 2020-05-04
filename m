Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp259156lfb;
        Mon, 4 May 2020 02:46:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypKlV1QFjh7l1y8qTuWEMzy+4ahlnVDusHXXONKScULfMcdspnClcw3TBFnVVcWtkM4u1e3I
X-Received: by 2002:a37:8207:: with SMTP id e7mr15489252qkd.475.1588585604435;
        Mon, 04 May 2020 02:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588585604; cv=none;
        d=google.com; s=arc-20160816;
        b=cNmLIRDo5NJwzmc35tWu+zoF7OeEL5W+R5WYi6yV+QgIr41OJ3Z31/Kw5zKePcTPsx
         6qZ/jwg2/SykxcpLd0RdmKMq7G8bo5OzsEBCxQaAeqmbBMYBQPs7rz0OMBNYQFgOySyF
         U1sOV2mWoXZgAUqZj9QVGZzbG0ONrHq4ju6/+Cy63co2Q8H1n0xht09R1OXHB78JK1/c
         KESaFV8VCU9uNqkS3wboEfYXSl443c3CyxEkOPV0QSrAO0JjPjns9B410Ks8n12UOoH4
         iJ9WesXP1y4q4EhXG6gdiN/xliEEoEkxCCDSkIwxJS8XvJ75SWe/yfbN0DZwyyYn+IPG
         J1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=dX7pyjGG1bJhzdWUvtt+aOn1HRKqQEIlsG74zemzzb8=;
        b=Ee6wPrTUv6F7oW3irK+etTrAlf42/uS+lbCDs7wjcgT8NEYbmGrpgqBjXAD49bi4I9
         MdFjqK8j+yF41OG/QHSxaLZKZW2nZbP1uKTipQ2HMOOn+Dm1VIvoMo2+qY1u0C+IUfva
         KQ/Pt0hp+ryFl0Ef4r0QBJ4pOVFeDJA5su1UZZmrEoPw6oTYGAzYUCNY9/iVIjayBohd
         5vNP1uIv8B5O7b2ADdhvJh0ZFSa/uar/16/JMwa3i+zmJ7paPrnxsozwReS7a0LjnjNR
         loxsCWvkUdQVqqqezakbnqNJcz9SKwpS6mqT0xucyma6o7wISZRFlsU67Wz2GFgPQbRH
         MGiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F4FT5mQX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id o22si6648156qtl.251.2020.05.04.02.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 02:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F4FT5mQX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVXgR-0004Im-Or
	for alex.bennee@linaro.org; Mon, 04 May 2020 05:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVXgI-0004F3-PN
 for qemu-arm@nongnu.org; Mon, 04 May 2020 05:46:34 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31920
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVXgI-0003j9-1I
 for qemu-arm@nongnu.org; Mon, 04 May 2020 05:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588585593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dX7pyjGG1bJhzdWUvtt+aOn1HRKqQEIlsG74zemzzb8=;
 b=F4FT5mQX0ULJbR6FD16+NjQ5em+lGGapzEY+JD+VJYT8pfe0tO/rWS5nZSSAaKXYLsmmvz
 Q4KiVFEOhAZ17IOjmX0+YJOqFPYu0Zs2OFm64QqCaJCmtocU7m4kMGIar/ZxpQfERxdwXp
 zQZKkFOtpVV2kTJH9XdKMFuvuxUbjjo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-3xSHYZMrPkenpNcXraw0UA-1; Mon, 04 May 2020 05:46:31 -0400
X-MC-Unique: 3xSHYZMrPkenpNcXraw0UA-1
Received: by mail-wr1-f69.google.com with SMTP id y4so5424895wrt.4
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 02:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T+pWPjECyB0tBu10pP0AVCD/WE7tR/PWJFyjiPlZNog=;
 b=Y/2cnAvZXAh+V7pT4YQF0Edcnmu0yQ0qNc3Lo0VRcQubHHi6M3mIsn9clYnBM68Fv2
 qAwTPZqNHHzd6RSq+dsNTSGfYO+A++bbUj/UUl6fwYvuHytuFLXeI4KiCwM12z9FwKr4
 DrW/nALwD+y8N/uhtWfqhcM64pIGiwdZU1tfdhI1MolIwwM1ywjGpD5gsLJNMcev2DOq
 Ne7b7jN4x4dMr7x01rYM7SSw/qZTlP3NFcx2OcLDgiOL0hB3u/lfx/a4AuLrphW+h2n8
 lfeOWm9rCdamH/TLUeYNcA9wf20QwnmhAlhI7b+MwqmApsTA/xAmpA/5kStKXchT+5rq
 06Yg==
X-Gm-Message-State: AGi0PuawG+QR7DNmCmiRIfevwBUfv4EdtfVfE+62Prh+AA1p//0uST9y
 hdnE3X/kTK9VVp2ge778Djsrdh+gp+52aEijHlJ5U5kujlp0IlvZIFFPuJgroQsZg9H+5tQwny3
 kcnewQT41y36k
X-Received: by 2002:a1c:154:: with SMTP id 81mr13557564wmb.48.1588585590589;
 Mon, 04 May 2020 02:46:30 -0700 (PDT)
X-Received: by 2002:a1c:154:: with SMTP id 81mr13557545wmb.48.1588585590360;
 Mon, 04 May 2020 02:46:30 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 h188sm14103963wme.8.2020.05.04.02.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 02:46:29 -0700 (PDT)
Date: Mon, 4 May 2020 05:46:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 0/7] ARM virt: Add NVDIMM support
Message-ID: <20200504054547-mutt-send-email-mst@kernel.org>
References: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
 <20200504011252-mutt-send-email-mst@kernel.org>
 <CAFEAcA-nkbCZNj0dbVgcN4ajRVx-N0Yvy5OEFuRewJyRGWfjxg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-nkbCZNj0dbVgcN4ajRVx-N0Yvy5OEFuRewJyRGWfjxg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:14:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 prime.zeng@hisilicon.com, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J8Zl1hmtei5v

On Mon, May 04, 2020 at 10:29:18AM +0100, Peter Maydell wrote:
> On Mon, 4 May 2020 at 06:13, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Apr 21, 2020 at 01:59:27PM +0100, Shameer Kolothum wrote:
> > > This series adds NVDIMM support to arm/virt platform.
> > > The series reuses some of the patches posted by Eric
> > > in his earlier attempt here[1].
> > >
> > > This series previously had few fixes to qemu in general
> > > which were discovered while adding nvdimm support to arm/virt.
> > > Those were sent out seperately[2] and are now part of Qemu.
> >
> >
> > Mostly ACPI stuff so I can merge it if I get an ack for ARM side.
>=20
> Happy for you to take it; all the arm-specific bits have
> been reviewed by various people (thanks!) so here's my
>=20
> Acked-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> I notice that checkpatch complains a lot about
>=20
> ERROR: Do not add expected files together with tests, follow
> instructions in tests/qtest/bios-tables-test.c: both
> tests/qtest/bios-tables-test-allowed-diff.h and
> tests/qtest/bios-tables-test.c found
>=20
> Does that need fixing, or is the checkpatch test wrong?
>=20
> thanks
> -- PMM


Hmm I don't see a patch in this series that changes both
tests/qtest/bios-tables-test-allowed-diff.h and
tests/qtest/bios-tables-test.c. Do you?

--=20
MST

