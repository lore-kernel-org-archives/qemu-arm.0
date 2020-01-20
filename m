Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2381127lff;
        Mon, 20 Jan 2020 01:40:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqwWdssSZwx3SUwtdYKHjpAU5mTnZ7+8x8XI0/1izksKYHqvi/mUwxzZlhdUKpUEoK85mwiA
X-Received: by 2002:a37:490d:: with SMTP id w13mr47332514qka.221.1579513250827;
        Mon, 20 Jan 2020 01:40:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579513250; cv=none;
        d=google.com; s=arc-20160816;
        b=rBZORnenMsbwgaBH4elbZG2GW4qs/DRTGZoUDL2mrjOMJeZpaq8ff4LHErGHyFEbQe
         umYlSt66GT9RM1CckFZkxJnbfA4VcwyqzAaRbfdz2Os8shLSAHTtA4P75eOu7yM+WdIO
         Q/NXUJu80aTxvCyt1UV7LK1YebgE1rvkqhqGwveTukmA4DcDLsa8MB04v2ajcpBQfEoD
         onBZ9g+Bk8/e6nOYU3yuEga373OfuVy2L5CHL5p02UevrQ66Ucpun2H0wNqVQOybNldb
         Y9s0xAmGMmkm3EuB2RQWrE/A3vdcPFauBqErak0v1+XE8hC5JYsqzPu323bpcFlGZaKD
         /vlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=RpnQ6glcOAHFYOHgm0OzjRxP2VYfw7bPy9yfW4KiEOs=;
        b=J/Wp3fHxI6iGmG5KH/LvFA1Q6JItsxlbQC+O7gMFCkwqNfz3Org4s6/s5oVXQMz5lz
         EKYVQ8Bu7Pb5xZhVIWo5pnImd6qYiUxuuyDoFzneqnaSm4VuMnIhIJcbhBA/4jG/dWBY
         KqdROHDQ/kkQVAMEIJfXjdWKmyke3Zop/3fukLPjQ/8F11Ib4wgWJuUcC6gJHtu0N7E9
         2ZU5yb/yE9w6wSR3svBMrvom94l2j1HTJTGufYaFrdmhtxp5LbUin6cKZ2+d3xtw2gDc
         ZenteZIC6PGeEX4+GF9ug3jiVOe6btickgglpJTtKu0oXDlGQILeJlekWT+MC4xgmEpg
         WaHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hb/GR34R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q53si19669451qtf.391.2020.01.20.01.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 01:40:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hb/GR34R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itTYA-0000HJ-4n
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 04:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57996)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1itTXt-0000Gx-1U
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 04:40:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1itTXn-0007Dn-LT
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 04:40:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41294
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1itTXn-0007CK-Fu
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 04:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579513224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RpnQ6glcOAHFYOHgm0OzjRxP2VYfw7bPy9yfW4KiEOs=;
 b=hb/GR34RdBiWgTfvcSwhoTq4w8PRAktpxzl03H6SzUMlKpMxyTc/UdJPdgM9pOzFRl0BvF
 3AwqNJGrPU9kVN22/ve0A99pH17pVM1nZnRbVjj+L0ZWmyK1QaqSOMEttJpeKPncj7MjgD
 LvPcJdWTLEdTKSMcoJq5v07T8VsAxBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-S82e4SpNN0SdX3f_0WM3iQ-1; Mon, 20 Jan 2020 04:40:20 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD8CBDBB2;
 Mon, 20 Jan 2020 09:40:18 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2CEA60C18;
 Mon, 20 Jan 2020 09:40:16 +0000 (UTC)
Date: Mon, 20 Jan 2020 10:40:14 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 3/5] target/arm/kvm: Implement virtual time
 adjustment
Message-ID: <20200120094014.yvqucqj6q2weh2pc@kamzik.brq.redhat.com>
References: <20191212173320.11610-1-drjones@redhat.com>
 <20191212173320.11610-4-drjones@redhat.com>
 <CAFEAcA_u94O8WYLgB8DF=pu-3V7LrNWpiQFV5mDYeeqLj1Ee2Q@mail.gmail.com>
 <CAFEAcA9ZoOZt6Jh42hi6q91=kRM9T9z436J99NF+Ns5KVKUYow@mail.gmail.com>
 <20191216164355.i5rpfuqlfqv2z7m7@kamzik.brq.redhat.com>
 <CAFEAcA8NzQ8QYE2NMnviPPnmBn1Dwm4W_KvhMbwCNwFzkurK-Q@mail.gmail.com>
 <20191219143005.gw43k2hug2n5nvto@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191219143005.gw43k2hug2n5nvto@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: S82e4SpNN0SdX3f_0WM3iQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Cc: bijan.mottahedeh@oracle.com, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bda2RLVq3quO

On Thu, Dec 19, 2019 at 03:30:12PM +0100, Andrew Jones wrote:
> On Mon, Dec 16, 2019 at 06:06:30PM +0000, Peter Maydell wrote:
> > Your approach in this patchset reads and writes on vm-paused,
> > so it won't have the pre-2015 problems.
> >=20
> > It still feels odd that we're storing this bit of guest state
> > in two places now though -- in kvm_vtime, and also in its usual
> > place in the cpreg_array data structures (we write back the
> > value from kvm_vtime when the VM starts running, and we write
> > back the value from the cpreg_array for a PUT_FULL_STATE, which
> > the comments claim is only on startup or when we just loaded
> > migration state (and also undocumentedly but reasonably on
> > cpu-hotplug, which arm doesn't have yet).

I tried to get rid of the extra state location (kvm_vtime), but we still
need it because kvm_arch_get_registers() doesn't take 'level', like
kvm_arch_put_registers() does. Maybe it should? Without being able to
filter out TIMER_CNT at get time too, then if we migrate a paused guest
we'll resume with vtime including the ticks between the pause and the
start of the migration. Adding the additional state (kvm_vtime) and a
cpu_pre_save() hook to fixup the cpreg value is a possible way to resolve
that. That's what I've done for v3, which I'll post shortly.

> >=20
> > I've just spent a little while digging through code, and
> > haven't been able to satisfy myself on the ordering of which
> > writeback wins: for a loadvm I think we first do a
> > cpu_synchronize_all_post_init() (writing back the counter
> > value from the migration data) and then after than we will
> > unpause the VM -- why doesn't this overwrite the correct
> > value with the wrong value from kvm_vtime ?

It wasn't overwriting because we weren't detecting a runstate
transition from paused to running. However, for v3, I've dropped
the explicit running/pause transition checking and now ensured
we get the right value with a cpu_post_load() hook.

>=20
> > I just noticed also that the logic used in this patch
> > doesn't match what other architectures do in their vm_state_change
> > function -- eg cpu_ppc_clock_vm_state_change() has an
> > "if (running) { load } else { save }", and kvmclock_vm_state_change()
> > for i386 also has "if (running) { ... } else { ... }", though
> > it has an extra wrinkle where it captures "are we PAUSED?"
> > to use in the pre_save function; the comment above
> > kvmclock_pre_save() suggests maybe that would be useful for other
> > than x86, too. kvm_s390_tod_vm_state_change() has
> > logic that's a slightly more complicated variation on just
> > testing the 'running' flag, but it doesn't look at the
> > specific new state.

I think I've mimicked this logic now for arm in v3.

Thanks,
drew

