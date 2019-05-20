Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp728442wrg;
        Mon, 20 May 2019 16:05:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCUo+VTh0KnYOrd6DcMJYgh3EPCE+/XkoZZt9ciT9GnwVyjvGmTwgCWChuQ+1sYH5j1yCH
X-Received: by 2002:a50:b662:: with SMTP id c31mr80026183ede.252.1558393503324;
        Mon, 20 May 2019 16:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558393503; cv=none;
        d=google.com; s=arc-20160816;
        b=UVQmRRWjwa44F4cpmKnjwFsgx0rsYOC34TPub0WyS4ARHV7Cs+LoRB1pU4HZJTZh5u
         ms9uem78FYwCEkOvM1EHVtgKCngxHMHbgh858S95P8OONdz9L2Wjeir8rwyrzYT8LBY8
         cp53fTUna/6/VV4SamngIB0QwUwlOglOnhJRb+YRH9RHieQmnaWXk2kejITu8dI7msPE
         ytRXAzhfBJOPaVW43GDdRDVvioGp1Ly3weeZ0J+4imYpsgWeaMrO+icFtedfNmz/BRDm
         H5JwdZBxz6Oqh86JGTYLtLgyuiSIzosTsX5kJYMU+fZfHJ5rD0y8xeSfob1Pnwxl72Hu
         Druw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=/FpleUe2HMMNa9Jbdwt1FroyJe/Y2dPsv4pkqvdEldk=;
        b=BBXgotNkphMRmy2ED5c0swhuCZBfy2bav9vy3bZ4sXsiGOHSm9vgNcASZ5Bs9xq/Zp
         kLDShRs+Hh2k9zjlAZfIlluXblbTVSpwF6qXD93BGfeyuZY+7IyIlIV5Sh+tjXmri0FV
         CWqJkGxZZbJrwjf4ZNU9u5c0bGYZWm3Mo46iNXoBgWJ2P1YEWAD0ADfnleHsCDRfj7Ce
         RGwrJ3/JkTPUa2MaY9wBMDvxiMz0zi+CdC7VPEmDVzf7fdhl22ywpSDPc7gGtRy4SK8p
         LqE0+yVblQ9n+FGMqKx09QPGLrquqbOm+yeOlzc7BggENvtrsM8Ce3gAqfCOPEh5RGe5
         PePA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19si4628088edb.436.2019.05.20.16.05.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 16:05:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSrL4-0004z2-Co
	for alex.bennee@linaro.org; Mon, 20 May 2019 19:05:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrKq-0004xZ-Fg
	for qemu-arm@nongnu.org; Mon, 20 May 2019 19:04:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrKm-0005AN-1h
	for qemu-arm@nongnu.org; Mon, 20 May 2019 19:04:45 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:42358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hSrKf-00055q-6j
	for qemu-arm@nongnu.org; Mon, 20 May 2019 19:04:38 -0400
Received: by mail-qk1-f193.google.com with SMTP id d4so9889743qkc.9
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 16:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=/FpleUe2HMMNa9Jbdwt1FroyJe/Y2dPsv4pkqvdEldk=;
	b=kOkuVyXr11aKKM/G2msj5v5MhJti4AYKJHaNqq9YgzYAvOoCo+YOv4fVcCoq+K0kuo
	Z+SKmk1cbnw3QyuDU2HaCM9Lsb699j0w/AwvKaYeVpwECB5S/b64BmihCpobch4mhPRQ
	BKXtMd6MjffQu8Q/4UkoXEZFK+u7EHRi1DmMwfnUz9CiD6yk7SYeJ404sbIBG/g4naQq
	wRyCQzhWartMY8Ooe39hrlek7N0xJcjT2cx5mfAMNfXGyYjGan5u8VWeRLJGUaUU85fQ
	KFs3AKmuaNNPjAf1jzsP6IyNAlKULMbBu9pSgqT0Jf67mbzUKQI54fw0gash3XtgN0fa
	ATHQ==
X-Gm-Message-State: APjAAAU1n4mxgYLVvI1HfMfo4X3lIB5payGl2fjvczuUiMD82Qk77mh9
	tZNid/3eJlE/WFGexKyrGUhDug==
X-Received: by 2002:a05:620a:1116:: with SMTP id
	o22mr59569418qkk.23.1558393472000; 
	Mon, 20 May 2019 16:04:32 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	r16sm6502126qkk.36.2019.05.20.16.04.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 16:04:30 -0700 (PDT)
Date: Mon, 20 May 2019 19:04:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190520185944-mutt-send-email-mst@kernel.org>
References: <20190419003053.8260-1-richardw.yang@linux.intel.com>
	<20190419003053.8260-7-richardw.yang@linux.intel.com>
	<20190514211015-mutt-send-email-mst@kernel.org>
	<d9d265e1-1052-9d8d-c749-5d1e5901f567@redhat.com>
	<20190516074110.GA11938@richard>
	<CAP+75-XHpLkekrmSxK8FFGkpPJQH=V0+2d6RonQTyJNcSHGaEg@mail.gmail.com>
	<20190516190033.6c8d382f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516190033.6c8d382f@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.193
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 6/6] acpi: pci: use
 build_append_foo() API to construct MCFG
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6bp/PmBXPFD9

On Thu, May 16, 2019 at 07:00:33PM +0200, Igor Mammedov wrote:
> On Thu, 16 May 2019 13:01:31 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
> > On Thu, May 16, 2019 at 9:41 AM Wei Yang <richardw.yang@linux.intel.com> wrote:
> > >
> > > On Wed, May 15, 2019 at 07:29:17AM +0200, Philippe Mathieu-Daudé wrote:  
> > > >
> > > >Thanks Michael for testing...
> > > >
> > > >Wei, can you add a MCFG test in tests/bios-tables-test.c?
> > > >  
> > >
> > > I took a look into the test, current q35 has already has a reference MCFG in
> > > tests/data/acpi/q35/MCFG.
> > >
> > > And there would be a warning message when reserved[8] is missed.
> > >
> > >     /x86_64/acpi/q35/bridge: acpi-test: Warning! MCFG mismatch.
> > >
> > > Is this enough? Or what more information prefer to add?  
> > 
> > Well, the test has to fail for any mismatch (not a simple warning).
> > 
> > A mismatch failure seems to be enough IMHO.
> Warning is sufficient, we do not fail ACPI tests on mismatch.
> It was a policy decision for APCI tests as far as I remember.
> We might reconsider it in the future but it shouldn't affect this patch.

Yes. And the reason is that conflicts in binary expected files are
impossible to resolve. So it's important that we can
fix expected files after a patch that changes them.

I actually have an idea for a better way to fix this:
a special list of "warn on mismatch" files.

A patch changing tables will add the changed tables to the list.
Then maintainer knows to inspec the diff manually
and re-generate expected files, and remove the
changed tables from the list.



Another thing we should do is drop dependency on IASL:

if IASL is present we should use it to show diff to simplify debugging
but at this point a verbatim difference is good enough if IASL is not
installed.


And I agree 100%: all this is a subject for a separate patch(set).



> 
> > 
> > > >>> -    AcpiMcfgAllocation allocation[0];
> > > >>> -} QEMU_PACKED;
> > > >>> -typedef struct AcpiTableMcfg AcpiTableMcfg;
> > > >>> -
> > > >>>  /*
> > > >>>   * TCPA Description Table
> > > >>>   *
> > > >>> --
> > > >>> 2.19.1  
> > >
> > > --
> > > Wei Yang
> > > Help you, Help me  
> > 
