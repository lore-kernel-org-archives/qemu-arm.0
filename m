Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3507741ejn;
        Tue, 18 Oct 2022 17:15:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6q5bVNZQBUX2fBO6pogoZt1zbPpirPJwGIP/k3Pw+VpJSlW39moB/0r1Kmoml41/PMA9xJ
X-Received: by 2002:a05:620a:f11:b0:6cf:be4e:e953 with SMTP id v17-20020a05620a0f1100b006cfbe4ee953mr3764640qkl.437.1666138554374;
        Tue, 18 Oct 2022 17:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666138554; cv=none;
        d=google.com; s=arc-20160816;
        b=fRJobuxn0sMOfFh88NdsWh+wMBJGte2MXRwCPYC3qEsBCyOAONa05XPbmEVkkbUpfy
         5Gh52i6d01KzaLZ9tYrV/vetE/2+CVGLVHbJE4yo4d8iHuEtoTlyYVNrzzFpa3uqY9o+
         Gkyhnj8kpiSRP/aFpYW2gKG6/nfcJMyAKmAC3LkMMvI1g+5IMSbhouWlY+7VFJdeH562
         JhvA0jPEY29aXiIB63FS4DSqWOE0nECW3bymGvVTMOr4YxuWpywjDINeCK3MRNmlJWoG
         LOjpKtO1Ddb2C0dqzPgYPFfsnTtd4Nj//hnyTbb6wu/CrNtFSnWhS8MctSgJIS0dJqcZ
         OAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:cc:to:from:date
         :dkim-signature;
        bh=ARf3uXqVt12fLKqg7KRoJGi1xBS/PgeqHNZWKDlh2QQ=;
        b=tCvb8irP8cWY5QmV7kUn9HKsdvRAejCY2GZ27FkiJcMOIGFgx5Vv4WohFS7n8ZQhq8
         Ua1/AExvs7Ow8OWY8CWO2qbESC5qX/7zXnJdc7iOD8cq1QfQhBq9qJEl9S2XzMgqd97P
         5HBBwOd4narDkTk5aHYpooRw9tSzD9YF0rv93pTq9BK9yETIynpR1byHWtpJe/vTT9wl
         GelIQ5i1zp6mslY4fcQPo8s3+qVXHauDl/PvEvvAMrPRExMlRvsmrfbLV2adwD8MDlFP
         Se1FkswA7ic8O1CXQIVd+S/fq5iMN9lgaPapxWa+poUr3jUkNH94OnZR/dObWlR6CGPD
         e83g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Io+QfxDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm11-20020a05620a198b00b006eb52f0e3b5si8278403qkb.603.2022.10.18.17.15.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Oct 2022 17:15:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Io+QfxDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:46232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okwkS-0005IY-Sp
	for alex.bennee@linaro.org; Tue, 18 Oct 2022 20:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1okwk7-0005I8-LO; Tue, 18 Oct 2022 20:15:31 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:41518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1okwk5-0005lJ-HS; Tue, 18 Oct 2022 20:15:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84277B821A9;
 Wed, 19 Oct 2022 00:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE917C433B5;
 Wed, 19 Oct 2022 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666138524;
 bh=6i7KAYuzLBv0qf0M4B6AwUOT+eo1+bQqCOc9SAEYLRs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Io+QfxDfonOBKqwTUft1nb9xK9O8l5Hdqk61KgxQgIg41zaRWM0IPAiMV2gwUg994
 HqKLJET0l6EZ5K6PsLUw+Atms/XdlnnUX/WC9ipkvfSn25jsGJ7yXdBJwUYWxSozIA
 4v30wsJgiOuYdpPrmKXwDsmwEIRozJxXd6s5Fol8IP4i1HQLuZy5aQ6tZnd3++1BiW
 9NLgdq5lagA7sJ3Za2jx8usP+KnuuiBYxMmLlOR33LOxHW+RmSu3FSOQ4q4Vl4SVDe
 ndTZlJj6fx1tg4CjrLCgJq0+03RQ+T0lQENf+qNMWGOaw0vcA+o0LUj21bW+ShLuVN
 IkRnjXPNk/5og==
Date: Tue, 18 Oct 2022 17:15:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, 
 stefano.stabellini@amd.com, Peter Maydell <peter.maydell@linaro.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
In-Reply-To: <460a480e-4e91-8d78-60da-59b9cc98beee@xen.org>
Message-ID: <alpine.DEB.2.22.394.2210181241320.4587@ubuntu-linux-20-04-desktop>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
 <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
 <alpine.DEB.2.22.394.2210171345450.2351079@ubuntu-linux-20-04-desktop>
 <460a480e-4e91-8d78-60da-59b9cc98beee@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=145.40.68.75; envelope-from=sstabellini@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N6oFhZkh9VDu

On Tue, 18 Oct 2022, Julien Grall wrote:
> On 18/10/2022 02:26, Stefano Stabellini wrote:
> > On Sun, 16 Oct 2022, Julien Grall wrote:
> > > Hi,
> > > 
> > > There seem to be some missing patches on xen-devel (including the cover
> > > letter). Is that expected?
> > > 
> > > On 15/10/2022 06:07, Vikram Garhwal wrote:
> > > > Add a new machine xenpv which creates a IOREQ server to register/connect
> > > > with
> > > > Xen Hypervisor.
> > > 
> > > I don't like the name 'xenpv' because it doesn't convey the fact that some
> > > of
> > > the HW may be emulated rather than para-virtualized. In fact one may only
> > > want
> > > to use for emulating devices.
> > > 
> > > Potential name would be 'xen-arm' or re-using 'virt' but with 'accel=xen'
> > > to
> > > select a Xen layout.
> > 
> > The benefit of 'xenpv' is that it doesn't require any changes to libxl.
> 
> I am quite surprised. Looking at the code, it seems to work more by chance
> than it is intentional as the code is gated by libxl__need_xenpv_qemu(). So it
> would not start if there were no emulated devices.
> 
> > It is even backward compatible so it could be used with an older version
> > of Xen/libxl.
> We don't really gain much here. IOREQ is a tech preview and anyone that wants
> to try it should really use the latest Xen.

I think that's fair.


> > Backward compatibility aside, if we come up with a
> > different name then we'll need changes to libxl and to manage those
> > changes. For instance, if we use 'xen-arm' that would mean we would need
> > to handle per-arch QEMU machine names.
> 
> Right, so the main argument here is for simplicity in libxl

Yeah


> Looking at how 'xenpv' is built, this is really expected to deal with PV
> backend rather than emulated device. I do expect some changes as we go along
> to be able to add emulated device.
> 
> Furthermore, libxl is not the only toolstack out. So I am not convinced this
> is a good argument to keep the name the same.

Let's think some more about the naming strategy. From a QEMU point of
view we could choose any name we like (Vikram please confirm), the issue
is really on the libxl side.

Today libxl understands two QEMU "machines": xenpv and xenfv
(pc,accel=xen is the same as xenfv, I'll use xenfv in this email for
simplicity).

xenpv is for PV guests and only provides PV backends, no emulation. It
is used on both ARM and x86.

xenfv is only used on x86, and it is for HVM guests, with a full set of
emulated hardware (PIIX3, etc.).

The purpose of this series is to introduce a QEMU machine that:
- works on ARM (but could maybe work on other archs as a stretch goal)
- provides PV backends
- no emulated devices by default
- also can emulate selected devices on request

Certainly it is not xenfv or pc,accel=xen because they would with more
emulation by default. This is more like "xenpvh": an extension to PV
with also the capability of emulating one device as requested. It is not
intended to emulate a full PC and doesn't do that by default like xenfv.

If/When x86 PVH gains the ability to use QEMU as IOREQ server, I would
imagine it would run a QEMU machine similar to this one.

This is also how I would imagine it would get integrated in libxl: as a
xenpv + individual emulated devices. Not as HVM for ARM. The other QEMU
command line arguments are inline with the xenpv command line arguments
rather than xenfv command line arguments. This is why the libxl changes
are small to zero to make it work today.

So, I think the following options work:

a) call it "xenpv" because it is an extension of the old xenpv machine
b) call it "xenpvh" because it is PV + few individual emulated devices

If we call it xenpv there are fewer changes in libxl. If we call it
xenpvh there are more changes in libxl but we can distinguish xenpv from
xenpvh (I don't see why we need it right now, but I could imagine it
could turn out useful in the future.)

I would stay away from arch-specific machine names because it will make
it harder on the libxl side without immediate benefits.
