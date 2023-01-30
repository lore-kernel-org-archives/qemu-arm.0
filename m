Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp935211ejb;
        Mon, 30 Jan 2023 05:12:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8BfUvIPtfAjr/sFy0OhyJtL0EI4M5M+rObFoLUcjmAO3enrgpmFMuf87bDEOZ5FRN/WbWs
X-Received: by 2002:ac8:5c91:0:b0:3b8:3391:bde5 with SMTP id r17-20020ac85c91000000b003b83391bde5mr12689879qta.26.1675084372759;
        Mon, 30 Jan 2023 05:12:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675084372; cv=none;
        d=google.com; s=arc-20160816;
        b=gg7h0y1H80aF1H+SRLcSpZWeFQ8iVbwf5Blg7Wy7A/1euA2+uRILl8brufY7IYM6Vt
         XJl19s7E1t0KEsWu6QromuMpK482YGx/KPBcJlNWBFwY9P9klF8+z1TCqBJ+9JUOQWmG
         HVNUGJiXA8ryFvZdQKwG6NSHIDz2Ajzz0ldEx7hoGD80W0JqnrDoXZK8fcTPlhRrMRx3
         inbyWG5ZF91i2ZHniQyN0UXyg0WE2Kqr7QYdWxPvsnhJ/rmKkO/KEuqgfA/+QVyynDVz
         Dv1339EgllGnQpxwcOG2+4i3+mH/Jy9A1je3eLBVVR3Ctub63a36oaao/epmjHFOSnSm
         OR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=l077ML8x2aUA3BfSYxSnF/pmWEsvNiSwJ/mn/qtcnMc=;
        b=ZQlS4A0rH0UUqrioxZyuRuaG8tBDe9PusnSOg+1+Ax+cbwkNj+rHASuNYFLnSdh7ty
         F19cc1aysfOSC8LEBPWgvFDank4bGh8dH28vcGQuvBDIGgfkBl+Y51yEXA9ilojggLbG
         6fDs+MG9MpfGX69QJDj0VngXaHG2dN1aZZ14bwFFqg2ln9MKYe/p/wcCK5mVWr7k0mF1
         5qc2/0FJi1MjJmRk4/ktCT6YjT+MkjrGJ27FmkHAr3FaAfRm3mNRrwGxCH5nUKcXjm7h
         OLXks5INhv9izS8gZb5N28aX3pW4r/MfNUPi3lTpHbNYWpIJbLwDpIPwgobcipA7wKEh
         Srjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f61BFCAy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19-20020ac87dd3000000b003b8109ff6d2si6445393qte.590.2023.01.30.05.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:12:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f61BFCAy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMTxe-0007iG-Up; Mon, 30 Jan 2023 08:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMTxd-0007ed-Ey
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 08:12:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMTxb-00046d-EX
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 08:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l077ML8x2aUA3BfSYxSnF/pmWEsvNiSwJ/mn/qtcnMc=;
 b=f61BFCAyhwlYgrfoKxJ2D3Ip3XRnhwh4gQvPgQExCV9C8U8+eBobpyRlt9bnVeyPse0Re7
 0/HO47MWag16cnC/9gpfi1xo5VWBl+vETuauAcHFh+RMqK0V2lngvKiaILkhgXhi1ThD97
 o2Z0P2qLnIT4a/E0j3U6yLjZ0gSPULM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-iyGpN8YgPiKfsf49FspL_w-1; Mon, 30 Jan 2023 08:12:30 -0500
X-MC-Unique: iyGpN8YgPiKfsf49FspL_w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DD93100F90A;
 Mon, 30 Jan 2023 13:12:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 629F7492B05;
 Mon, 30 Jan 2023 13:12:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6783421E6A1F; Mon, 30 Jan 2023 14:12:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Warner Losh <imp@bsdimp.com>,
 qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 kevans@freebsd.org,  berrange@redhat.com,  groug@kaod.org,
 qemu_oss@crudebyte.com,  philmd@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  quintela@redhat.com,
 dgilbert@redhat.com,  michael.roth@amd.com,  kkostiuk@redhat.com,
 tsimpson@quicinc.com,  palmer@dabbelt.com,  bin.meng@windriver.com,
 qemu-block@nongnu.org,  qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 04/19] bsd-user: Clean up includes
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
 <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
 <CAFEAcA8E98v5X5ekA16c6Fby2HAhOC5G4JYnN9TkrA9G7rVzvA@mail.gmail.com>
 <20230127100052-mutt-send-email-mst@kernel.org>
 <20230128052729-mutt-send-email-mst@kernel.org>
Date: Mon, 30 Jan 2023 14:12:28 +0100
In-Reply-To: <20230128052729-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Sat, 28 Jan 2023 05:29:47 -0500")
Message-ID: <87mt60b1z7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: pYNQxx/7LfMk

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Jan 27, 2023 at 10:01:57AM -0500, Michael S. Tsirkin wrote:
>> On Fri, Jan 27, 2023 at 02:54:30PM +0000, Peter Maydell wrote:
>> > On Thu, 19 Jan 2023 at 14:42, Warner Losh <imp@bsdimp.com> wrote:
>> > >
>> > > Also, why didn't you move sys/resource.h and other such files
>> > > to os-dep.h? I'm struggling to understand the rules around what
>> > > is or isn't included where?
>> > 
>> > The rough rule of thumb is that if some OS needs a compatibility
>> > fixup or workaround for a system header (eg not every mmap.h
>> > defines MAP_ANONYMOUS; on Windows unistd.h has to come before
>> > time.h) then we put that header include and the compat workaround
>> > into osdep.h. This avoids "only fails on obscure platform" issues
>> > where somebody puts a header include into some specific .c file
>> > but not the compat workaround, and it works on the Linux host
>> > that most people develop and test on and we only find the
>> > problem later.
>> > 
>> > There's also no doubt some includes there for historical
>> > reasons, and some which really are "everybody needs these"
>> > convenience ones. But we should probably not add new
>> > includes to osdep.h unless they fall into the "working around
>> > system header issues" bucket.
>> > 
>> > thanks
>> > -- PMM
>> 
>> 
>> BTW maybe we should teach checkpatch about that rule:
>> if a header is in osdep do not include it directly.
>
> To be more precise, make checkpatch run clean-includes somehow?
> Or just make CI run clean-includes on the tree and verify result
> is empty?

scripts/clean-includes isn't quite happy even after my series.
Offenders:

    ebpf/rss.bpf.skeleton.h
    subprojects/libvduse/libvduse.h
    subprojects/libvhost-user/libvhost-user-glib.h
    subprojects/libvhost-user/libvhost-user.h
    target/hexagon/idef-parser/idef-parser.h
    target/hexagon/idef-parser/parser-helpers.h
    tests/fp/platform.h
    contrib/plugins/cache.c
    contrib/plugins/drcov.c
    contrib/plugins/execlog.c
    contrib/plugins/hotblocks.c
    contrib/plugins/hotpages.c
    contrib/plugins/howvec.c
    contrib/plugins/hwprofile.c
    contrib/plugins/lockstep.c
    linux-user/mips64/cpu_loop.c
    linux-user/mips64/signal.c
    linux-user/x86_64/cpu_loop.c
    linux-user/x86_64/signal.c
    plugins/core.c
    plugins/loader.c
    scripts/xen-detect.c
    subprojects/libvduse/libvduse.c
    subprojects/libvhost-user/libvhost-user-glib.c
    subprojects/libvhost-user/libvhost-user.c
    subprojects/libvhost-user/link-test.c
    target/hexagon/gen_dectree_import.c
    target/hexagon/gen_semantics.c
    target/hexagon/idef-parser/parser-helpers.c
    target/s390x/gen-features.c
    tests/migration/s390x/a-b-bios.c
    tests/plugin/bb.c
    tests/plugin/empty.c
    tests/plugin/insn.c
    tests/plugin/mem.c
    tests/plugin/syscall.c
    tests/uefi-test-tools/UefiTestToolsPkg/BiosTablesTest/BiosTablesTest.c
    tests/unit/test-rcu-simpleq.c
    tests/unit/test-rcu-slist.c
    tests/unit/test-rcu-tailq.c
    tools/ebpf/rss.bpf.c

To support automatic checking, we'd have to fix the ones that need need
fixing, and add the remainder to the script's XDIRREGEX.

