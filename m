Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp324732lfb;
        Mon, 4 May 2020 04:11:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypIVy2xfpE4n+V0x6QMWOgb8GNKqZ4Q2Wpb2eWremffhPACYQgr4vwmjWa2dS7MYquw/AGNx
X-Received: by 2002:a37:b587:: with SMTP id e129mr15481681qkf.226.1588590674029;
        Mon, 04 May 2020 04:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588590674; cv=none;
        d=google.com; s=arc-20160816;
        b=Uf6UspmMwxN0mbxzigR9WDyEJ6O8z609h28Vj0ZRU6YMJvQf+lp/u2sz5rXNB0g1iX
         bLFByBJSawk90xfXwxYn7vQl1yIo/SeA38ZhMI4vv8cNohbh57vWpYA6/rwo/IGear21
         20En5aw9QaHB2IGco02A0zLl1jNAW3RReHTswAwIDBZyOfWykd7Ji2tZ8O3P/IHf/WLC
         ACcIy09gEiiFTcBuVZXXv3PQhkz2NHui6O/UuM61RF2hIGQSWt5QkL7/UUCQSPbsanRf
         Hb25bmeZUynwz/6DEbFE1p8ObF2OBYH1hEFMXsIQLQ6gC6FJpynCwJ6qH3baLY3ElOY/
         sG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=YZjGnMCiHmJYbjiJ/fe3Il00znteutgPvYBgPWceCqQ=;
        b=DEaIeLj+ymSD1jRMV6foPwAfSay0VtNUhXGs8XhuXl1CEuAqhrKq5lkBSUnG+9YeS1
         +Yek4ye+51AKey8C1i89nfW6o7TzVbDzfc93xud2cffPcT79nyGQYSaxoY30neMqNRk/
         cHZWJtc+5pO8USfvcZF8CFgSvlXu5BSVbwI/3i3wX5EspFhc7oPDWj9s5MF1w6cOSzQ0
         xgU/8zoG5VOBT1piL2H2V4aaNLFRJvfvN5EjyGZBN+2gQ/n8VFhDbRSIzNOC0CUWyT8M
         SfCfXYJZqBYwA7hfZmIfOgG977bS/p8fVrJcJrsTTper4doriNHjooIKw71sRrzNk7Dc
         cu3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GXxsBVou;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id w18si3550832qkj.244.2020.05.04.04.11.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 04:11:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GXxsBVou;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVZ0D-0005Wr-BV
	for alex.bennee@linaro.org; Mon, 04 May 2020 07:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVZ04-0005UW-QY
 for qemu-arm@nongnu.org; Mon, 04 May 2020 07:11:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38435
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVZ03-0007qt-G8
 for qemu-arm@nongnu.org; Mon, 04 May 2020 07:11:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZjGnMCiHmJYbjiJ/fe3Il00znteutgPvYBgPWceCqQ=;
 b=GXxsBVouxCs+WTTXW2pKO7p6rsVnLgrbHEjw5VVPOueGtx2eg6lWhNf/3sskhBc8XMVI3X
 mHsSybJNroRfHZQ5CDzyZhY4gXnfLsZTmKzJKou8RdxWGI46RxFHRkCp0ib2DImxIuY9TQ
 ephzrQVSSp8Q4PDTEEkN1m9b/JmmfVg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-VYVduVcpMrSralesY_R0iA-1; Mon, 04 May 2020 07:11:01 -0400
X-MC-Unique: VYVduVcpMrSralesY_R0iA-1
Received: by mail-wr1-f72.google.com with SMTP id y10so10568400wrn.5
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 04:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qQR7JIyV7xdFWnZQx7qSyec0iQUn4M2fJvZ9LIIPelc=;
 b=LVeiy7cnPQh+BGD0ckTDMqgHrR/J0GkQhwoW3iHqITbyLX2eSE7x41ZwMzAuwC3o8H
 YDvkod4wKGIMVStpZ+EXT9CTb0wBKKjWIVQx3svAmP/KFoNEOsfbYP16Mqwqb01xhJ/P
 cR7DeTSz4rlvtF5JustKK8KVtMy0HFlCBkgUVOzYslSjbQd+qHI630fCbzKEYf04iPhe
 gFw/q6aSIP9JvD2bJ3cdbJltiVfwnsTBFXlrmJvQE+KUHZVns+gtftbI704lwULUUaJW
 xmVSooyS8KiJuNxy2C46dNX2WEtCKcNReHIhzfkz76s9K8eCiWqWb9HvDsOd0m0y+llp
 EtsQ==
X-Gm-Message-State: AGi0PubqX9OS3fXQnliOLShw0O0yqQFC9zXwq1uHvcdBe6/o5JfPPP8p
 2ljAsfpRKZFZNC2scxGGlb9MKz6avThUleYKhUFxM3sX4JIXg0fU+Emv+siAyoxFcp8boYQ52/5
 wi8czFIBoYK6P
X-Received: by 2002:a05:600c:2314:: with SMTP id
 20mr13774338wmo.35.1588590660038; 
 Mon, 04 May 2020 04:11:00 -0700 (PDT)
X-Received: by 2002:a05:600c:2314:: with SMTP id
 20mr13774305wmo.35.1588590659738; 
 Mon, 04 May 2020 04:10:59 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 b85sm12922636wmb.21.2020.05.04.04.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 04:10:58 -0700 (PDT)
Date: Mon, 4 May 2020 07:10:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 0/7] ARM virt: Add NVDIMM support
Message-ID: <20200504071046-mutt-send-email-mst@kernel.org>
References: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
 <158748197516.25490.13137194821077838492@39012742ff91>
 <20200504055608-mutt-send-email-mst@kernel.org>
 <CAFEAcA_VGtbjpVTb1VE1XCT43JODjkW8o1zSsVmzO3fg1+fr+w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_VGtbjpVTb1VE1XCT43JODjkW8o1zSsVmzO3fg1+fr+w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 04:24:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 prime.zeng@hisilicon.com, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ko18SvWKkOnV

On Mon, May 04, 2020 at 11:06:48AM +0100, Peter Maydell wrote:
> On Mon, 4 May 2020 at 10:57, Michael S. Tsirkin <mst@redhat.com> wrote:
>=20
> > > ./scripts/checkpatch.pl --mailback base..
>=20
> > > 2/7 Checking commit 5554e78b18ea (nvdimm: Use configurable ACPI IO ba=
se and size)
> > > ERROR: Do not add expected files together with tests, follow instruct=
ions in tests/qtest/bios-tables-test.c: both tests/qtest/bios-tables-test-a=
llowed-diff.h and hw/acpi/nvdimm.c found
> >
> > This beats me. Where did we get
> > tests/qtest/bios-tables-test-allowed-diff.h from?
> > It's a different patch, isn't it?
>=20
> Ah, this is a bug in the checkfilename() function -- it uses
> some globals $acpi_testexpected and $acpi_nontestexpected, but
> there is no code to reset these when checkpatch starts checking
> a new patch. So if you only check one patch in a checkpatch run
> (eg by just passing it a single patch file) then it will work, but if
> a single checkpatch execution is checking several commits
> (eg in the way patchew runs it to check the whole series of
> git commits at once, or if you pass it several patch files) then
> it will give wrong results for the second and later patches.
> I think the variables need to be reset at the top of 'sub process()'.
>=20
> thanks
> -- PMM

Good point. Will fix.

