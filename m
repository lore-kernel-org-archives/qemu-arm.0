Received: by 10.28.91.67 with SMTP id p64csp3834741wmb;
        Tue, 20 Mar 2018 06:29:10 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsvZRGm8HWdytCqdUMMBmKkK3qJE5bsPlaPqj63mjJKi1Hotpg4T2YXuPjY4KtTenb+Rv0m
X-Received: by 10.237.59.253 with SMTP id s58mr23782345qte.83.1521552550533;
        Tue, 20 Mar 2018 06:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521552550; cv=none;
        d=google.com; s=arc-20160816;
        b=l5rzMX70RDZBjmSpICFoUEiGwtbiNLaqO0XDK7n3xDA8O0deW/m7enhgvM9xJQ75Lk
         pRoq6I+JKpC4KalfQ6dzKj/D4KM/ySleDVGSr7mpXvJYo0L9tAxmcpmEEl+TqdxFtRnL
         cq68DnylUL3hZPFrHRyKKWAv34Oe3jTp6oag3ReUpds0oK6JGvVPJ30wwxUqz7hdLy8a
         F82SreZpsBue3QjUVap7UCeOvdTErYRSS4ZCFEfMfzzC1yMxPMSvCKMhfbTihEL3S1xJ
         a/ipJnPjb5vXESvZFMllbsRXd23fyDukLgQ6sS+3QFaDSuompBg3BQ+sDQz9lRHD2nlE
         27oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=+bwIM9MKPC4MfDJ9MuDsmRISEbwv54SSpCtum9h2jmc=;
        b=qd4QDFh01yDs2dQ77bS2mqn55VZVPC6CIwd1FS/q4O9hejmYjEqA/R63fpG+8x7edQ
         6dGsEgNuHWOjfQAsDnBeG+6VWasLgcfRssSU2tJKKwBgns4by8eXJ9d+0DHNmUeYliET
         7BO7hX985gN/lfJdbpP1bL3vw+8S5O5T+GygOSGOikpWdgjXXdZSYSaBh72ReuKLHC+E
         UcmXZ3TkuJA7iQzA3GjZm8Bm+ueCc5kz1zijjYqTaVs1EONhR2PCrDYXOJamyAmdH1pF
         ETmO6PrJ7KapqHKsrG2UosynW5E6gy2rPMRBXlb9E+jwE/PhPDJB+wWsHiTfF4aJw8w3
         S6Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x83si237258qka.472.2018.03.20.06.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:29:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHK9-0000qa-Tw
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:29:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eyD96-0000uh-9m
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 05:01:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eyD93-0006Rj-97
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 05:01:28 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:51543)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eyD92-0006Q3-TG; Tue, 20 Mar 2018 05:01:25 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue002 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0MTbOB-1f8tgX41pf-00SM3a; Tue, 20 Mar 2018 09:58:39 +0100
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
Date: Tue, 20 Mar 2018 09:58:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521510562-529051-1-git-send-email-mst@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:2YhHCWiI+xr40SuCO1shGPAgbxTClsX4d8ca4N6X8Th9+/nXwD4
	Tr1xCoe/UbET7oyN4FDyAxhPfb0FPnIN+w4viGg0Mf604yVKDbBJyW+jJHIRTlGEtqJnATd
	tY0JzORzbiJJGN5+K2/GqGuuKsonUcudWTUhwe+qF4QslTw4oqsGhtdoBtGXPjrMJDzqe0O
	YxVR8LneBxQL9SDTBK/cg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:0jf/PQSAPaI=:x+TVr5Wc8wIQmoFydtgRQa
	uu8tXDcVA93Py1UsA5wdDFzdQ/8j+ko0n6lMeVV7oJG0BWOGnNHH97csnHkf7o1M7wsYMOqo/
	MURsCEuebe0lRWPuaiU5IdnQGv5KZ2K9ngM6orJsX7FcNaAYWW8DumUww0IY1gjKHcmCL287l
	zeXeRBa9QLR1ETdM4L+oEmolTClE+Rd7+0/r5kYTeXsuRKwP5iloJZgaVH2ZlGV+7vYY/6DaJ
	4E9pjUOXG9Uxy7h0G8pJfloE1KdlFLjmnvkPLV3yPXWKeMmKfMbKEqhi/AFhIPWVCB8ZG5G52
	UarbotMR1b3FP73l2ZtDSvENuH40SteT4x5uL6kKWOiVVPF5Qs3ZatfLfoY8pPDa07J9IgcXR
	MHoJ4N09YLojKLvmjgT011tXnvUez+kEtx6YPC86jD67jz/qqjlSG9107CAI3b3CWj0RiWEV0
	2eH+mBnqDnHu9DIeEMrbHH55NveYXANmKqp8HkzpcXAbirxpi8UGyolgrl0eDwOizSnyzeoa4
	1Sl2v6NLVRtLUOQjdhP+QqH31txzpq11BVQw43U9TvsM2eqxAh2IHQuxnv1zfcqjNIYWkyhsa
	YE3qh2H8Wmuw/tE9fc0+Nd+o6e0nh5cLYrxNBX7trDDX3nRPAizMr8owI152/yYyRPOUidrcD
	8EfU0yBq8o4rE0c2awIlPOX0X0m634Ln6J1vCq/Ps9n2xGK57STiGxwAosc6Acoe5pfxIIQxF
	wlRdA9SuKo4g8TsgYA6ZD51UNXIbX0Y7XmhCvMYxRr9T+fPFoM9oEGT2t2s=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.133
X-Mailman-Approved-At: Tue, 20 Mar 2018 09:28:26 -0400
Subject: Re: [Qemu-arm] [PATCH] qemu: include generated files with <> and
 not ""
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	sheepdog@lists.wpkg.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Markus Armbruster <armbru@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, kvm@vger.kernel.org,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Liu Yuan <namei.unix@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Stefan Weil <sw@weilnetz.de>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WzcHBnFS2InH

Le 20/03/2018 à 02:54, Michael S. Tsirkin a écrit :
> QEMU coding style at the moment asks for all non-system
> include files to be used with #include "foo.h".
> However this rule actually does not make sense and
> creates issues for when the included file is generated.

If you change that, we can have issue when a system include has the same
name as our local include. With "<FILE>", system header are taken first.

> In C, include "file" means look in current directory,
> then on include search path. Current directory here
> means the source file directory.
> By comparison include <file> means look on include search path.

Not exactly, there is the notion of "system header" too.

https://gcc.gnu.org/onlinedocs/cpp/Include-Syntax.html

#include <file>
This variant is used for system header files. It searches for a file
named file in a standard list of system directories. You can prepend
directories to this list with the -I option (see Invocation).

#include "file"
This variant is used for header files of your own program. It searches
for a file named file first in the directory containing the current
file, then in the quote directories and then the same directories used
for <file>. You can prepend directories to the list of quote directories
with the -iquote option.

> As generated files are not in the search directory (unless the build
> directory happens to match the source directory), it does not make sense
> to include them with "" - doing so is merely more work for preprocessor
> and a source or errors if a stale file happens to exist in the source
> directory.

I agree there is a problem with stale files. But linux, for instance,
asks for a "make mrproper" to avoid this.

> This changes include directives for all generated files, across the
> tree. The idea is to avoid sending a huge amount of email.  But when
> merging, the changes will be split with one commit per file, e.g. for
> ease of bisect in case of build failures, and to ease merging.
> 
> Note that should some generated files be missed by this tree-wide
> refactoring, it isn't a big deal - this merely maintains the status quo,
> and this can be addressed by a separate patch on top.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

I think your idea conflicts with what Markus has started to do:

commit d8e39b70625d4ba1e998439d1a077b4b978930e7
Author: Markus Armbruster <armbru@redhat.com>
Date:   Thu Feb 1 12:18:28 2018 +0100

    Use #include "..." for our own headers, <...> for others

    System headers should be included with <...>, our own headers with
    "...".  Offenders tracked down with an ugly, brittle and probably
    buggy Perl script.  Previous iteration was commit a9c94277f0.

    Delete inclusions of "string.h" and "strings.h" instead of fixing them
    to <string.h> and <strings.h>, because we always include these via
    osdep.h.

    Put the cleaned up system header includes first.

    While there, separate #include from file comment with exactly one
    blank line.

commit a9c94277f07d19d3eb14f199c3e93491aa3eae0e
Author: Markus Armbruster <armbru@redhat.com>
Date:   Wed Jun 22 19:11:19 2016 +0200

    Use #include "..." for our own headers, <...> for others

    Tracked down with an ugly, brittle and probably buggy Perl script.

    Also move includes converted to <...> up so they get included before
    ours where that's obviously okay.

Thanks,
Laurent
