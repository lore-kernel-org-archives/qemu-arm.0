Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp598050lfu;
        Wed, 6 Apr 2022 03:45:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhpXXVh315N2YChcaGMTZErKSHN3BtkXfIBc66/2hqAepcYu8yqqvY9gFQ9/fH1NS0cbOp
X-Received: by 2002:ac8:5b04:0:b0:2e1:fef5:e2b7 with SMTP id m4-20020ac85b04000000b002e1fef5e2b7mr6840497qtw.335.1649241933551;
        Wed, 06 Apr 2022 03:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649241933; cv=none;
        d=google.com; s=arc-20160816;
        b=kg3Z2ZmXc6ICXVsdgNbFoP9zk9aI5unwi1NqxGPZA09a6YwgHPR9HxPy/F+BidBHc/
         r4tojuluLcoh9LLveIOETHMSx8DXrF92Ba8xfQXPqgJevcrzXdCk4R0QCLY70aHRVhBG
         XFcGOtG5nbrT1g3hYgTvNsKkDpxhtwQjT3ZMMoodmxZH782QwtQj+TYgyAG3P12F8jEP
         WXeoMkApL2DSA70T0KUOO4VKUHdO/77M05o5BA6uNxZqDdwUJl1vVWL54wwEbMry7Wxp
         JgEeurOuTIyXsGP3WwOZwWkviCcIQPU+H3bNni+f9XQhP7/eRWW4d6tuX6koe7J+W70U
         bG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=19ZK+idfav5a9yLDaL8FCUz3baVtCy3Cd1vzlhSSRss=;
        b=snBJGS4X9dYXj3veMz//jz+Ui5JvG8TpwOEz1cZ9IShRsjlQj5JvKYY995cX6uXS1B
         hNykScrLxoYvGL5Q5Nb0Clhw9r5QDIZWcJd+GGINKiRpv9nlwft905JtAxXbvJSaRy7j
         07R4clkj9spqAmSfHKT/gTbszI+/cbJ6ihnKVXuRYd4MdOHnHuYE3KcRt84a2f2lmsUF
         XsTokvS21VmdujC90iKLEZc1YZ+IkySddkECsdgg9be/LPGZzH6dlRH46JUeXzo8mb+q
         zqlurA9v152utntHxGFveQGc4M6qmGz/rIv+uopWoPw34n5xWg2fOXPmsMGllhMO1F6F
         E68g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VP8bsNsK;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ib11-20020a0562141c8b00b004413614f243si4284016qvb.388.2022.04.06.03.45.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Apr 2022 03:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VP8bsNsK;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649241933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=19ZK+idfav5a9yLDaL8FCUz3baVtCy3Cd1vzlhSSRss=;
	b=VP8bsNsKT3E0pICLtDAsfFnwaU2KUC8nq+8JEsvG/B8EMC5axFf8xWtYDcju37lHJE/1fy
	+JvXAZx+upkzVLssF56nr8PPjcBOcAn0L9Vc1JJgkAyf0uu7NpUIBs8cTR5757+NRk04hb
	Spjzjc2J+2Z4CbMbplDZ/y0iubfYLgc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-PSmx2jF3My2Ru2ZGMYSuyw-1; Wed, 06 Apr 2022 06:45:29 -0400
X-MC-Unique: PSmx2jF3My2Ru2ZGMYSuyw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48ED9382055A;
	Wed,  6 Apr 2022 10:45:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5CA1515A40;
	Wed,  6 Apr 2022 10:45:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 961B121E6A00; Wed,  6 Apr 2022 12:45:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: marcandre.lureau@redhat.com,  Aarushi Mehta <mehta.aaru20@gmail.com>,
  Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,  Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>,  Alexander Bulekov <alxndr@bu.edu>,  Alexander
 Graf <agraf@csgraf.de>,  Alexey Kardashevskiy <aik@ozlabs.ru>,  Alistair
 Francis <alistair.francis@wdc.com>,  Andrew Jeffery <andrew@aj.id.au>,
  Artyom Tarasenko <atar4qemu@gmail.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  BALATON Zoltan <balaton@eik.bme.hu>,  Bandan Das
 <bsd@redhat.com>,  Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
  Bin Meng <bin.meng@windriver.com>,  Cameron Esfahani <dirty@apple.com>,
  Chris Wulff <crwulff@gmail.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Christian Schoenebeck
 <qemu_oss@crudebyte.com>,  Colin Xu <colin.xu@intel.com>,  Corey Minyard
 <minyard@acm.org>,  Cornelia Huck <cohuck@redhat.com>,  =?utf-8?Q?C=C3=A9?=
 =?utf-8?Q?dric?= Le Goater
 <clg@kaod.org>,  Daniel Henrique Barboza <danielhb413@gmail.com>,  Daniel
 P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Darren Kenny
 <darren.kenny@oracle.com>,  David Gibson <david@gibson.dropbear.id.au>,
  David Hildenbrand <david@redhat.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,  Elena
 Ufimtseva <elena.ufimtseva@oracle.com>,  Eric Auger
 <eric.auger@redhat.com>,  Eric Farman <farman@linux.ibm.com>,  Fabien
 Chouteau <chouteau@adacore.com>,  Fam Zheng <fam@euphon.net>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Greg Kurz <groug@kaod.org>,  Halil Pasic
 <pasic@linux.ibm.com>,  Hanna Reitz <hreitz@redhat.com>,  Havard
 Skinnemoen <hskinnemoen@google.com>,  Helge Deller <deller@gmx.de>,
  =?utf-8?Q?Herv=C3=A9?=
 Poussineau <hpoussin@reactos.org>,  Huacai Chen <chenhuacai@kernel.org>,
  Igor Mammedov <imammedo@redhat.com>,  Jagannathan Raman
 <jag.raman@oracle.com>,  Jason Wang <jasowang@redhat.com>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Joel Stanley <joel@jms.id.au>,  John G Johnson
 <john.g.johnson@oracle.com>,  John Snow <jsnow@redhat.com>,  Julia
 Suvorova <jusual@redhat.com>,  KONRAD Frederic
 <frederic.konrad@adacore.com>,  Kamil Rytarowski <kamil@netbsd.org>,
  Kevin Wolf <kwolf@redhat.com>,  Kyle Evans <kevans@freebsd.org>,  Laurent
 Vivier <laurent@vivier.eu>,  Li Zhijian <lizhijian@fujitsu.com>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Marcelo Tosatti
 <mtosatti@redhat.com>,  Marek Vasut <marex@denx.de>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Max Filippov <jcmvbkbc@gmail.com>,
  Michael Rolnik <mrolnik@gmail.com>,  Michael Roth <michael.roth@amd.com>,
  "Michael S. Tsirkin" <mst@redhat.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
  Qiuhao Li <Qiuhao.Li@outlook.com>,  Reinoud Zandijk <reinoud@netbsd.org>,
  Richard Henderson <richard.henderson@linaro.org>,  Roman Bolshakov
 <r.bolshakov@yadro.com>,  Stefan Berger <stefanb@linux.vnet.ibm.com>,
  Stefan Hajnoczi <stefanha@redhat.com>,  Stefan Weil <sw@weilnetz.de>,
  Stefano Garzarella <sgarzare@redhat.com>,  Subbaraya Sundeep
 <sundeep.lkml@gmail.com>,  Sunil Muthuswamy <sunilmut@microsoft.com>,
  Taylor Simpson <tsimpson@quicinc.com>,  Thomas Huth <huth@tuxfamily.org>,
  Tyrone Ting <kfting@nuvoton.com>,  Warner Losh <imp@bsdimp.com>,  Wenchao
 Wang <wenchao.wang@intel.com>,  Yanan Wang <wangyanan55@huawei.com>,
  Yoshinori Sato <ysato@users.sourceforge.jp>,  Zhang Chen
 <chen.zhang@intel.com>,  "open list:ARM PrimeCell and..."
 <qemu-arm@nongnu.org>,  "open list:Overall KVM CPUs"
 <kvm@vger.kernel.org>,  "open list:RISC-V TCG CPUs"
 <qemu-riscv@nongnu.org>,  "open list:S390-ccw boot"
 <qemu-s390x@nongnu.org>,  "open list:X86 HAXM CPUs" <haxm-team@intel.com>,
  "open list:raw" <qemu-block@nongnu.org>,  "open list:sPAPR (pseries)"
 <qemu-ppc@nongnu.org>,  qemu-devel@nongnu.org
Subject: Re: [PATCH 32/32] Remove qemu-common.h include from most units
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
	<20220323155743.1585078-33-marcandre.lureau@redhat.com>
	<CAARzgwzXXKqhvP9CnST3iD_obfqCWn8Z+8WNcs0u-O_UGoM1-w@mail.gmail.com>
Date: Wed, 06 Apr 2022 12:45:19 +0200
In-Reply-To: <CAARzgwzXXKqhvP9CnST3iD_obfqCWn8Z+8WNcs0u-O_UGoM1-w@mail.gmail.com>
	(Ani Sinha's message of "Tue, 5 Apr 2022 20:32:28 +0530")
Message-ID: <87o81epk1s.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2EVvVBivvcrl

First of all: thank you so much for completing the "empty out
qemu-common.h" job!

This is what's left:

    #ifndef QEMU_COMMON_H
    #define QEMU_COMMON_H

    /* Copyright string for -version arguments, About dialogs, etc */
    #define QEMU_COPYRIGHT "Copyright (c) 2003-2022 " \
        "Fabrice Bellard and the QEMU Project developers"

    /* Bug reporting information for --help arguments, About dialogs, etc *=
/
    #define QEMU_HELP_BOTTOM \
        "See <https://qemu.org/contribute/report-a-bug> for how to report b=
ugs.\n" \
        "More information on the QEMU project at <https://qemu.org>."

    #endif

Rename the header?  Or replace the macros by variables, and move their
declarations elsewhere?  Not demands; this series is lovely progress as
is.

Ani Sinha <ani@anisinha.ca> writes:

> On Wed, Mar 23, 2022 at 9:32 PM <marcandre.lureau@redhat.com> wrote:
>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
> Empty patch descriptions are not a good idea. Please explain why this
> removal does not break things and maybe why the header got included
> initiatively.

Something like

    The previous commits moved most of qemu-common.h's contents
    elsewhere.  Most inclusions are now useless.  Remove them.

would do for me.
