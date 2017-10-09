Received: by 10.223.197.9 with SMTP id q9csp2722544wrf;
        Mon, 9 Oct 2017 11:17:46 -0700 (PDT)
X-Received: by 10.233.232.14 with SMTP id a14mr10743925qkg.256.1507573066888;
        Mon, 09 Oct 2017 11:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507573066; cv=none;
        d=google.com; s=arc-20160816;
        b=jmgxHcBI3MJhe+rzaSdWTosCk9V1+jTgS7GXtaSMxUuFNCsv+GLFicfIFgk2+xd1a8
         1NpU4VNLAmBvs4BGeSLRMY09ur/aq0umQgdcMKaC5S+wgcTeIWhOFSvQ7vYyylUDmIiZ
         +6+8GS0GCVwHDEuFeZ0kaGh313L6RYuI3VWzxYV8eY/pe6cnLb90jWsAwa8ey2Kv/grZ
         ygDAY0+C7r9lBrAloHgrsh712sbMvOgh742SFU5gGlZeraXkeeV6x+6NMtwNde2dySjs
         RL0zwc0y8nmhfStLZvqV0eqhyYJuENdkxfNVpHjaQ0733pbOyqu2BKCxNT5HVLisVVej
         GjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=K3ZOiJealwATcwFs6Kt4Pbom0yLIzh5J3HyGrMd6c0c=;
        b=0N40th9bhf60r1GMJPqslyg+u7tJZdtQu5HXmiWD7JCDDQl2nFQ4lAVEabEUU8AXcj
         FfwFYo0rGMXELV1q83xHBaJxgpldcWqBqCnA0ynMZCbE6xHrKwq1qByHs8Ro4D5gngSh
         +3ECGonzpP9g2oZHenNWAhMar0SpO7buvKKX/IksJqtnYJkN2bxp5jYTutus95S0/m32
         imueQiUHF4Ad5sc/n1y1dllSGrFrX5oSmnFw5IUm1cntQBzYSiGAm4BjEoa7xGMD85I4
         3zUptWm0ZZfkb+riUc3uc2i286py+L13vlErwZYvVyNMxRBmKO8YAH06NxDFHOGnDF05
         rqFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CWue6bzh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q127si5932628qkd.153.2017.10.09.11.17.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 11:17:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CWue6bzh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1ccc-00088R-BJ
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 14:17:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1ccL-00082d-QG
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 14:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1ccK-0004ZC-Ms
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 14:17:29 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:48311)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1ccK-0004Yc-E2
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 14:17:28 -0400
Received: by mail-wm0-x22b.google.com with SMTP id i124so24720978wmf.3
	for <qemu-arm@nongnu.org>; Mon, 09 Oct 2017 11:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K3ZOiJealwATcwFs6Kt4Pbom0yLIzh5J3HyGrMd6c0c=;
	b=CWue6bzhPmpjsmPQwheOZ7x7LDe7kkbXG7xLRjh9i41CkG/6uSI16t6LeVllPmtsh3
	PGKzfX9Dv8xis6szmC+QtFN8Vpy0Y3pV30MH4xu9wnl/xF40vvd9Xq9nN6IGKUiTWdXi
	TtteoYLYQ/b32BOwm4VvTUj9FGiaBSb344YR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K3ZOiJealwATcwFs6Kt4Pbom0yLIzh5J3HyGrMd6c0c=;
	b=gP5QYneruWby57GuIU2BB2LOUJVjuhfzNDPgl0JBmpyv/MxHgpckH1y4ndPI1eNYy1
	zSFJwF2XCM1fDmVYXLKo7XuFQaOgsxIVxjox7IR5MRGLiwNDWsDikPVpb4vTs+4K7ZVu
	UTls2+7D8PXDKZRcsK58vmr2jUwEZH2g0GalHh8KSW/RHdDZT/veGgtwMLSFec/D9m5f
	bkpsFgc3DEJqdBefH6TDGVr7J8csaJmhRqSyEzemtGjVtvyFcDD+YbF7pwaD2Y3xP5Pf
	34o0ccuT3pLQCU2YbzEbMGbsSGgWccheJ7S8duLu5PxKyBSAo08ofYj2e3g7eVe17RFg
	OXBg==
X-Gm-Message-State: AMCzsaWsugubANSttdyPWQPGtcrKeBaOwlBXAczW15gPhyqOVv4ueltO
	zU+0uLnEpWPkJ3jUxowdXM4TyFyYMWUiRGqR1hcHMA==
X-Google-Smtp-Source: AOwi7QCkqTTpW8WvafLqIHwx3N50fHnQFzqdioJbK43cIfeeSe2Q+GA9jLcO0vk14PCaUyr95ADjk53uA8u8KyW5n4c=
X-Received: by 10.223.162.152 with SMTP id s24mr11541585wra.173.1507573047260; 
	Mon, 09 Oct 2017 11:17:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 11:17:06 -0700 (PDT)
In-Reply-To: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
References: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 19:17:06 +0100
Message-ID: <CAFEAcA_UfXaO-KEgXb+GSUT=XhQar_gxshUV_GWO_axcZ0R4sA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [RFC 0/3] vITS Reset
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k6sWBTefnThb

On 27 September 2017 at 15:56, Eric Auger <eric.auger@redhat.com> wrote:
> At the moment the ITS is not properly reset. On System reset or
> reboot, previous ITS register values and caches are left
> unchanged. Some of the registers might point to some guest RAM
> tables which are not provisionned. This leads to state
> inconsistencies that are detected by the kernel save/restore
> code. And eventually this may cause qemu abort on source or
> destination.
>
> The 1st patch, suggested to be cc'ed stable proposes to remove
> the abort in case of table save/restore failure. This is
> definitively not ideal but looks the most reasonable until we
> get a proper way to reset the ITS. Still a message is emitted
> to report the save/restore did not happen correctly.
>
> Subsequent patches add the support of explicit reset using
> a new kvm device group/attribute combo. The associated kernel
> series is not upstream [1], hence the RFC.
>
> ITS specification is not very clear about reset. There is no
> reset wire. Some register fields are documented to have
> architecturally defined reset values and we use those here:
> Most importantly the Valid bit of GITS_CBASER and GITS_BASER
> are cleared and the GITS_CTLR.Enabled bit is cleared as well.

The ITS is a device, not part of the CPU, so its reset is
implementation-defined but typically via some signal that's
controlled by the SoC (this is no different to the other
parts of the GICv3 which aren't denoted as being in the
reset domain of the CPU). For instance if you look at the TRM
for the GIC-500 it has a single 'resetn' reset signal which
resets all of the GIC/ITS apart from the CPU interface parts:
http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.100336_0002_01_en/index.html

The GICv3 spec 6.6 indicates what is supposed to happen to
the ITS on powerup. For QEMU's purposes reset is generally
considered to be a cold reset and we should always reset our
state to the same thing it was when QEMU first started.

It's not clear to me why we need a new KVM device attribute
for doing ITS reset. The usual approach for this is:
 * system reset causes QEMU's device model reset code
   to reset state structure values to whatever their
   reset value is
 * we write those values up into the kernel, which is
   sufficient to reset it

What goes wrong with that in the case of the ITS?
In particular, if GITS_CTLR.Enabled is 0 then I think the
kernel should not be trying to read guest memory tables.

thanks
-- PMM
