Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp103356lfo;
        Wed, 3 Feb 2021 02:28:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWxw+4w/PFKCQPwct1fjyYBEtfFBLDPeQmKkv/11ym8BjfdVcaniRlK8i7IiSvg0dSPc5m
X-Received: by 2002:a25:1387:: with SMTP id 129mr3094319ybt.423.1612348097792;
        Wed, 03 Feb 2021 02:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612348097; cv=none;
        d=google.com; s=arc-20160816;
        b=cwbnnu7maTxbgFUczDR7fTGwI8s0rFbU6FN5Snx3tcxF1NRBC/W3UxN6HJE5dToAlR
         VSMvxzo5uOPLVLOEZwEyCRIInI2WIxJbbBJNNI7iKY+NgLygQgi+hK29HUw9KF8eBfnl
         7INKDtdi6H7rg0hA8qwoF55Pa/9O9dND0c+nlkaRzHo60yIjZ2Fo542VoZlRTGt/lbjd
         3pUnK2/ll6U5FfbhmWd3oKGb1Zn3m6YXMhubIWj+TvN2Tqmfjs2fOg49uLwrWPalnQOC
         1NV1LY+sqTR41s0Pu5wUL5JpxmGgEAu0sV/ZiVN3yek/uqp4S6LuPRGSiws6KG3E1GTr
         gnUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=p2+qz0DjWkEkbZPan4bMlbGQBE07zRWTPTtmhEpp3FE=;
        b=GnxVjGrKOMwmzyBdiNTT74OkQBrb8qV09O+XwQipX7WH8ZHy+3BgV+9kl239MH/Ceg
         C9oVlGM1rS+mY778F6etJ/xW+petf1vVZjp8ZnSpKJsMR3lVkhQ89i49z4R6h0PNp+WH
         nviqcCx8Y7k+weu2Fz2tjCgdgSRiZOXse612wvXGOKHmQPRSgixfrUo8luR2RT29AvpB
         wVY/ThEx2uvgUvgSF+14s2UvOjgr04xsilZXOy/SGpdXts5aVj0CXl4MctTHFb7bhuh3
         8XtKBCLlXxsRjPEBzzW7tGXRrFabbw7QaVM56Q3iCCabWFNC9ieA8R8D3vPodRyJO5fY
         zfTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iyQgc4Y1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si2104311ybq.274.2021.02.03.02.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 02:28:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iyQgc4Y1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7FOT-000840-5k
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 05:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7FOL-00083c-A9
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 05:28:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7FOJ-0008C1-Cb
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 05:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612348086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2+qz0DjWkEkbZPan4bMlbGQBE07zRWTPTtmhEpp3FE=;
 b=iyQgc4Y1bMTNS15ipYRo0X6WLIiGe+PdCp9C3tjCAbL92H7RA2I0PFqorPfWdlKxoBX88N
 YkR5zISjE3EEtijGub0IzwwnXyrSbWin0gHw2d8MDTXe7hrrRAzK+HggKZEs127/SDwA3g
 cK9jFL+bwISYQdPZt4flVSxUZMZhTtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-ddn9cbMbOAaMmGS_7tbM5w-1; Wed, 03 Feb 2021 05:28:03 -0500
X-MC-Unique: ddn9cbMbOAaMmGS_7tbM5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 589DC107ACE4;
 Wed,  3 Feb 2021 10:28:02 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDA0D62461;
 Wed,  3 Feb 2021 10:28:00 +0000 (UTC)
Date: Wed, 3 Feb 2021 10:27:58 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
Message-ID: <20210203102758.GC2950@work-vm>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oiOC39FCfEP5

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Cc'ing migration team and qemu-arm@ list.

I'll have to leave the detail of that to the ARM peole; but from a
migration point of view I think we do want the 64 bit ARM migrations to
be stable now.  Please tie incompatible changes to machine types.

Dave

> On 2/3/21 5:01 AM, Aaron Lindsay wrote:
> > Hello,
> > 
> > I'm attempting to restore an AArch64 snapshot taken on QEMU 4.1.0 on
> > QEMU 5.2.0, using system mode. My previous impression, possibly from
> > https://wiki.qemu.org/Features/Migration/Troubleshooting#Basics was that
> > this ought to work:
> > 
> >> Note that QEMU supports migrating forward between QEMU versions
> > 
> > Note that I'm using qemu-system-aarch64 with -loadvm.
> > 
> > However, I've run into several issues I thought I should report. The
> > first of them was that this commit changed the address of CBAR, which
> > resulted in a mismatch of the register IDs in `cpu_post_load` in
> > target/arm/machine.c:
> > https://patchwork.kernel.org/project/qemu-devel/patch/20190927144249.29999-2-peter.maydell@linaro.org/
> > 
> > The second was that several system registers have changed which bits are
> > allowed to be written in different circumstances, seemingly as a result
> > of a combination of bugfixes and implementation of additional behavior.
> > These hit errors detected in `write_list_to_cpustate` in
> > target/arm/helper.c.
> > 
> > The third is that meanings of the bits in env->features (as defined by
> > `enum arm_features` in target/arm/cpu.h) has shifted. For example,
> > ARM_FEATURE_PXN, ARM_FEATURE_CRC, ARM_FEATURE_VFP, ARM_FEATURE_VFP3,
> > ARM_FEATURE_VFP4 have all been removed and ARM_FEATURE_V8_1M has been
> > added since 4.1.0. Heck, even I have added a field there in the past.
> > Unfortunately, these additions/removals mean that when env->features is
> > saved on one version and restored on another the bits can mean different
> > things. Notably, the removal of the *VFP features means that a snapshot
> > of a CPU reporting it supports ARM_FEATURE_VFP3 on 4.1.0 thinks it's now
> > ARM_FEATURE_M on 5.2.0!
> > 
> > My guess, given the numerous issues and the additional complexity
> > required to properly implement backwards-compatible snapshotting, is
> > that this is not a primary goal. However, if it is a goal, what steps
> > can/should we take to support it more thoroughly?
> > 
> > Thanks!
> > 
> > -Aaron
> > 
> > p.s. Now for an admission: the snapshots I'm testing with were
> > originally taken with `-cpu max`. This was unintentional, and I
> > understand if the response is that I can't expect `-cpu max` checkpoints
> > to work across QEMU versions... but I also don't think that all of these
> > issues can be blamed on that (notably CBAR and env->features).
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

