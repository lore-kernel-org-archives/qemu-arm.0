Received: by 2002:a0c:fe87:0:0:0:0:0 with SMTP id d7csp2140591qvs;
        Mon, 8 Jun 2020 06:50:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0Vzds5MmfwY8oKTAqysV3Y4bsB0ae+9R+UuVsrcFO6V3ZJaNi4Opz0ARgfM4FdFOfqOuq
X-Received: by 2002:a25:af10:: with SMTP id a16mr6369157ybh.121.1591624215388;
        Mon, 08 Jun 2020 06:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591624215; cv=none;
        d=google.com; s=arc-20160816;
        b=aH5jLUJFDKAplWUunW0u/075Taj3BI4nkjSfcCTDKr7uuD0sBAE7hT0cMB4DuWQZmB
         V8Yq/fn36NiJxFzk8nw5SDRNpEe07D1KZVg/tEtC5lLQNXtqS8QlW02j2NyOtLYu77sB
         1zz+aXX77J7wbOk0lPfIklgE8Vjc6VW1DIDp3e3PLpMju6gjkJ7XUdqBU6ka5baRoviv
         QenoKHRjclHD9IrI/ONdufCl+BShsk7exFc54SdfHQKXhU78PSE4OncCWFYgc4bGi4RX
         YzDa/oSHMkyFyGRsCuXmzTkF8fJS0sCnPqgCIrzk/Hn4hfIgIi3LWhUlQNFXqrPdgjtS
         ERaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=OndyBUIRhpFNYchSq2jliXF0SofGrtE/s9+Gs1XlEqM=;
        b=SQ5gA5OjSe5wfnpLuvRwtgpJ06gnWW+pjq5BXqonHqiUxm+k73FGUipPDW1Jwmu/T1
         ygogSswmmxqPCSRQnS/yXWUD29g/eQgxbPpORX3FCdTtj8yZCzWrV/L+pBwbzcEtNxSH
         ik1XkonfxvxLqTQOM7lg8x5wB1fXrlFRnTVUpV7V4h38Qc/tpf/HdAbU6bQ6uwH2k5Ha
         a4uf+cOi2eY+dF9HdTQnbhxPvPeEc552QmKcLOl4dhFGE98LfCYVKw1D2EfzmsinaYld
         KnRw4k1J0s/OkdB6hXmlColfaKbgwkdVuil7YdyIYRpwTUnfzrXlYIqOAPqDpWPm5tQQ
         Mkkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b75si13959480yba.453.2020.06.08.06.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 06:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiIAI-0001XL-Q4
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 09:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jiIA5-0001Wt-0y; Mon, 08 Jun 2020 09:50:02 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2110 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jiIA2-0008D2-E3; Mon, 08 Jun 2020 09:50:00 -0400
Received: from lhreml705-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 5209D2554581C8054EF3;
 Mon,  8 Jun 2020 14:49:46 +0100 (IST)
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 lhreml705-chm.china.huawei.com (10.201.108.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 8 Jun 2020 14:49:45 +0100
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.1913.007; 
 Mon, 8 Jun 2020 14:49:46 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: RE: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Thread-Topic: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Thread-Index: AdY3+/mIYt1+TQdDQmymnxAa7PkUWwBhkdKAAHDt5AAABBY/YACLbJEAAAWfgEA=
Date: Mon, 8 Jun 2020 13:49:46 +0000
Message-ID: <1e9b79f1f310452d8167a6ed29266ee3@huawei.com>
References: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
 <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
 <20200605173116.55419a1e@redhat.com>
 <0c91f4bab5d24bb3a1e7ca36d1d57221@huawei.com>
 <20200608140026.1eb49a8b@redhat.com>
In-Reply-To: <20200608140026.1eb49a8b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.31.156]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.76.210;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 09:49:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tYN24ApIH4Dn

> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: Monday, June 8, 2020 1:00 PM
>=20
> On Fri, 5 Jun 2020 16:38:37 +0000
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > > Sent: Friday, June 5, 2020 4:31 PM
> > > To: Andrew Jones <drjones@redhat.com>
> > > Cc: Salil Mehta <salil.mehta@huawei.com>; qemu-devel@nongnu.org;
> > > qemu-arm@nongnu.org; Peter Maydell <peter.maydell@linaro.org>; mst@re=
dhat.com
> > > Subject: Re: [Question] Regarding PMU initialization within the QEMU =
for ARM
> > > VCPUs
> > >
> > > On Wed, 3 Jun 2020 11:37:45 +0200
> > > Andrew Jones <drjones@redhat.com> wrote:
> > >
> > > > On Mon, Jun 01, 2020 at 03:04:33PM +0000, Salil Mehta wrote:
> > > > > Hello,
> > > > > I could see below within function fdt_add_pmu_nodes() part of
> > > > > hw/arm/virt.c during virt machine initialization time:
> > > ...
> > > >
> > > > > Q4. This function  fdt_* looks to be wrongly named. The info
> > > > >     being initialized here shall be used even when ACPI is
> > > > >     being used. Initialization part and FDT info looked
> > > > >     mixed up here if I am right?
> > > >
> > > > Agreed. The function has the wrong name. mach-virt has many functio=
ns that
> > > > mix the initialization and fdt building together, but those functio=
ns are
> > > > named something like create_foo(). Patches welcome.
> > > that was where I gave up on cpu hotplug arm/virt the last time.
> >
> > Were you releasing the ARM objects as well? Or are you referring to som=
e
> > other problem?
> I was talking about mix of FDT and device creation code.

Ok. I have worked around that for now. Maybe you would like to review
it in the cpuhp patches which I should be able to float this week to the
community.

Thanks
Salil.

> > > Ideally we should split out from create_foo() all firmware generation=
 code
> > > (fdt) and move it to virt_machine_done time + make sure that it could=
 be
> > > regenerated at reset time so guest would get updated FDT on reset.
> >
> > Agreed, just like ACPI part. That would be more cleaner.
> >
> > Thanks
> > Salil.

