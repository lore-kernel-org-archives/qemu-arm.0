Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4227514wrq;
        Mon, 11 Jun 2018 09:12:13 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKQlFB1IVRD7FyFmsimvYwD9m14nG50IqJyjA68LdCpOe8u9G+o10SAhoIbMShu5HKUxlMZ
X-Received: by 2002:a37:1a88:: with SMTP id l8-v6mr15749001qkh.271.1528733533043;
        Mon, 11 Jun 2018 09:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528733533; cv=none;
        d=google.com; s=arc-20160816;
        b=cOK1RSn7k0bZhynYenHMg6mzlZ+uaLi/nNCEplUbYe5rVh4pqYMSv8q0HetDWpVAMf
         jxuAUgcTtLt5nE7goKnx/G5JcRcwHInrvgav6vzGEKKVBJoM/ACGhDlRM6CT8/AoExUD
         5yThf1h0JBsEz1MhxnfeB0oix24C6ud0WBcx93s4yhgChmGMWULOZZ6+C+vEzbPaCYhF
         GlFOe9xWEeuAOZ0gdoaoGkADfKMvHgHAE0uBDjo/ERTVgF5bueSOcH+3K027O9xaz+qm
         YUXrJIPANGwhkhvqWaHK7SS3aQ5LUB6q5TzSVDTeJoKDsXz83fVrw7CKvfShp/4xN0HQ
         muxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=2DATyebT9pFoi4yt5EORReo3xEgPtNvbuS+o2CySh5o=;
        b=l4Zvr5mVDDPVRppdN631Fu9IZ9TR48h/7y7qB4tNyNjrt22ryDZQvYSmR4ejq4K2eh
         8JDZWVKV7t9e9dY/iN8zC/M6KbBUhY1atwv+eSbJNvg/vT+LzdvTQj5Uo6OCBOgSRqfb
         Jey8Q1jVTYZlSBBJOX1X5sOxkF9CrjI37UsIzbSuCE5xqPbcl8+3hY9kN2NPHfC0c8SM
         +vcpoZiFZqBovV9ZGW5yUstCMdXJUF4LYI9olgiG8v6Qw1naMahZ+17WViMuPRLjiAsB
         Xj0ptzMr9NRg1sU1IjlYDa4JPqLTITgunK9b5+qj8YS59xu6l5e7a3Y5C54b5oizIird
         xUbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SA2+0iFh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l100-v6si12007426qkh.157.2018.06.11.09.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 09:12:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SA2+0iFh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSPQS-0004LL-FZ
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 12:12:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSPQE-0004Jo-Pj
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 12:11:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSPQD-0008WB-QQ
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 12:11:58 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:33256)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSPQD-0008VO-Ip
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 12:11:57 -0400
Received: by mail-ot0-x244.google.com with SMTP id h6-v6so24442396otj.0
	for <qemu-arm@nongnu.org>; Mon, 11 Jun 2018 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2DATyebT9pFoi4yt5EORReo3xEgPtNvbuS+o2CySh5o=;
	b=SA2+0iFhIkf72kZNG5oxQngJ5sxUM7P64koHgNJVpClWO38u4hsjAVEy4Q6rpa/Ii4
	YvGvFpJRD7rI/RaOFT8nMCT4xhNbJnsvndHjd8tF3j+ZviJBsTELaT7qocDlRWvyfnpv
	iZeyLtf31C3tKxEmvtqwWJnzhepQLctcekxNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2DATyebT9pFoi4yt5EORReo3xEgPtNvbuS+o2CySh5o=;
	b=WymojUBT8CiyGvNbDC0LEEoNlrMKfSdgPOmcnS8ET2bQVawYIbL1uF5LRKWJMfjpSE
	7xsbtKnYbDZudBjl/8oDNq6pib7klQsiNQfCqZ5sKGJYKBuNHIjhly1y7vJgQikB3Y4W
	TlS+59GpQTD+XYm4RguqINZlmtIFUQY4ZqJ6FHwdjufiOVesm4RbgmUlHleDzrIHUFwB
	LIJ/sGPfzY1bBIA3Iz6Z++8zk4NRZlaycX+FEfAizOvc4+ORkpQ3JYEztpCr9+q0bUYF
	FiqauiDa+gT3/8xaeTEzJhlbGWWY6S62vOJSDlbCuan6sf6xizyGp4p9CypfSNbcvJWO
	negQ==
X-Gm-Message-State: APt69E24QhSw1OMzTkWfzm29xwlhFfnbWrdu6rHaH+a5aAu3Cyd5LuHh
	8HodZQR+MLlkU+fKJ2szfWfXQE36dgCNKdGu94U7fg==
X-Received: by 2002:a9d:3fda:: with SMTP id
	i26-v6mr9651602ote.126.1528733516768; 
	Mon, 11 Jun 2018 09:11:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 09:11:36
	-0700 (PDT)
In-Reply-To: <54eb6ae9-d7e0-8a4d-6bd4-f8f1d0f00b92@redhat.com>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<54eb6ae9-d7e0-8a4d-6bd4-f8f1d0f00b92@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 17:11:36 +0100
Message-ID: <CAFEAcA_ePZZ6TCAyxyoBJtiYYOqY13H+U_Vau_+z9D6on9iaoA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v4 00/40] Use the IEC binary prefix
 definitions
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>, Qemu-block <qemu-block@nongnu.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Jiri Slaby <jslaby@suse.cz>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>,
	Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair@alistair23.me>,
	Fabien Chouteau <chouteau@adacore.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>, qemu-ppc <qemu-ppc@nongnu.org>,
	Cornelia Huck <cohuck@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fXOghtss6j5u

On 11 June 2018 at 16:55, Eric Blake <eblake@redhat.com> wrote:
> On 06/10/2018 08:14 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>
>> Hi,
>>
>> This series:
>>
>> - split the byte-based definitions from "qemu/cutils.h" to "qemu/units.h=
"
>>    (this now triggers WARNING: 1 added file, does MAINTAINERS need
>> updating?)
>> - clean hw/ includes;
>> - replace different constants used for byte size with their correspondin=
g
>>    IEC binary prefix definitions.
>>
>> Since v3:
>> - use IEC binary prefix definitions (Stefan Weil)
>> - rebased
>> - added R-b tags
>>
>
>>   hw/net/ne2000.h                          |  5 ++--
>
> ...
>>
>>   tests/test-qemu-opts.c                   |  7 +++---
>>   scripts/checkpatch.pl                    |  1 +
>>   135 files changed, 533 insertions(+), 431 deletions(-)
>>   create mode 100644 include/qemu/units.h
>>
>
> At least monitor.c and vl.c are missing from this list; a more general gr=
ep
> shows that the following are all potential candidates for this cleanup:

This patchset is already 40 patches long, though; if we like it
then we should just go ahead with it and deal with the stragglers
in a second series.

thanks
-- PMM
