Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp958311ejk;
        Tue, 30 Jan 2024 09:07:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIo8xGozcKDx7BCkn3ybZt9z288lpTp3GpBpfY0owXXXFgMd1Yu7sQdYOV+grLGxSLm2zG
X-Received: by 2002:a05:620a:111a:b0:783:3a87:670e with SMTP id o26-20020a05620a111a00b007833a87670emr85703qkk.40.1706634442121;
        Tue, 30 Jan 2024 09:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706634442; cv=none;
        d=google.com; s=arc-20160816;
        b=oEmGB3yPz3/w+9P4GMIOqgPxqSIdIChKTN+mxR8x9D8VT0VEZZXuyDOzu6JNSg+SPd
         1QyQVDwIvFDUIfiLbcBZIeFNj2NjdfA2w6STr+Zsi5iLiLTHpna+iP3eR0VmzHezFXW7
         h7okEo+NAYP0f6pZ6FGvBS0tm2ISTXzJEF9OuaZGZr5Uc30ux3PR3Sauka+DpSpYRZ7e
         g5bj8SGSfSSDwlgFzCpVC5brmBQ1gcAxp0cekEhxn262f4NkUBpwMJMGRZb159AHQ9lk
         gRZ58LzmnvTWOPtf6SmtUShVxxFEiJEp6jb/yD8Cw2N3Ifsh7IOAb+Cv+T3Kv6Je1iVP
         XEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date;
        bh=JQO1+2K2kXEdgquT5XUcEf/h8F4VD8UP2WbMYYorQhk=;
        fh=qZodDmefMf8orPJm6GK86CcWu/8RREtcP3SShm5BYcQ=;
        b=fV+k7nELUsfou+yhuW+eC1s01AjfjeL+lPIgtZLi1L5y/VBYMziwZ481BqYk4E0RIr
         XiRTXuWb50N+n117OZBQnWj+DjxdlupHLRSdlVu/L4Jsy1zyr6WRz03sm7i0hCPzN8+R
         U7hOaKZQZH1l2qo4vDREyUO0jJmJiZIEqustNx2GjaOyJ2DkUohd8T6tVtZsrysg8ofN
         Wf3VrPQOzLXoNfD9K/idWx4uwy8iw7dkVXnDQB/IMdGYJcMPDOyfoh5DndrWwhxR9kMi
         XzkEA/WXkCbuc7ZWjDWWw/io25HXMcsKL4wAhp5ua3KKzRmdvfgsFnuV3k942m50OCKC
         6XvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020a05620a13e800b00784023a4545si3791770qkl.680.2024.01.30.09.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 09:07:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUrZP-0001Fr-QV; Tue, 30 Jan 2024 12:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1rUrZM-0001FQ-Rh; Tue, 30 Jan 2024 12:06:45 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1rUrZG-0002dM-5c; Tue, 30 Jan 2024 12:06:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.9.213])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 28E8E20232;
 Tue, 30 Jan 2024 17:06:33 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG6EX1.mxp5.local (172.16.2.51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 30 Jan
 2024 18:06:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00106b97671-13be-4df6-aea2-ec41010faa09,
 20D2C6FF0051686532C09B7171B66A66C8D21C17) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 88.179.9.154
Date: Tue, 30 Jan 2024 18:06:30 +0100
From: Greg Kurz <groug@kaod.org>
To: Ani Sinha <anisinha@redhat.com>
CC: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Song Gao <gaosong@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, <qemu-trivial@nongnu.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 1/3] hw/i386: Add `\n` to hint message
Message-ID: <20240130180630.0e269e7d@bahia>
In-Reply-To: <6E771066-49E8-448D-B90A-21766B108874@redhat.com>
References: <20240130155653.142283-1-groug@kaod.org>
 <20240130155653.142283-2-groug@kaod.org>
 <6E771066-49E8-448D-B90A-21766B108874@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG6EX1.mxp5.local
 (172.16.2.51)
X-Ovh-Tracer-GUID: cb3013dc-e91d-4a1c-a898-9d33cf76acd5
X-Ovh-Tracer-Id: 3213599812810480059
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtjedgfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeekjedtveegkeeileffvdetvddvgedtudduiefghffhgfdvhfegjeetkeehfeeknecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejpdekkedrudejledrledrudehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghnihhsihhnhhgrsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhshhgrnhhnohhnrdiihhgrohhslhesghhmrghilhdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhgrghoshhonhhgsehloh
 honhhgshhonhdrtghnpdhmshhtsehrvgguhhgrthdrtghomhdpihhmrghmmhgvughosehrvgguhhgrthdrtghomhdpmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmpdhqvghmuhdqthhrihhvihgrlhesnhhonhhgnhhurdhorhhgpdgvughurghrughosehhrggskhhoshhtrdhnvghtpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hnE1l/EcO9Gz

On Tue, 30 Jan 2024 21:43:27 +0530
Ani Sinha <anisinha@redhat.com> wrote:

> 
> 
> > On 30-Jan-2024, at 21:26, Greg Kurz <groug@kaod.org> wrote:
> > 
> > error_fprintf() doesn't add newlines.
> 
> ^^^^^^^^^^^^^^^^^
> 
> Should be error_printf(). Ditto for other patches.
> 

Thanks. Posted a v2.

> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> > hw/i386/acpi-build.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index edc979379c03..e990b0ae927f 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -2697,7 +2697,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> >                         " migration may not work",
> >                         tables_blob->len, legacy_table_size);
> >             error_printf("Try removing CPUs, NUMA nodes, memory slots"
> > -                         " or PCI bridges.");
> > +                         " or PCI bridges.\n");
> >         }
> >         g_array_set_size(tables_blob, legacy_table_size);
> >     } else {
> > @@ -2709,7 +2709,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> >                         " migration may not work",
> >                         tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
> >             error_printf("Try removing CPUs, NUMA nodes, memory slots"
> > -                         " or PCI bridges.");
> > +                         " or PCI bridges.\n");
> >         }
> >         acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
> >     }
> > -- 
> > 2.43.0
> > 
> 



-- 
Greg
