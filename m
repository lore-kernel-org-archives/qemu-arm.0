Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3777946wrq;
        Tue, 10 Jul 2018 09:46:45 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc2c5U+P5O7SuMH4hxP331se6Wljs4aRegqYXS5nBcyZPWW4tZfATL5D60ibfFrCtD+sfsj
X-Received: by 2002:a37:ddd5:: with SMTP id u82-v6mr22260366qku.420.1531241205772;
        Tue, 10 Jul 2018 09:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531241205; cv=none;
        d=google.com; s=arc-20160816;
        b=s7c2p9uVLVuE453JUnYBtuPn40gLYEuC0KG0fqseyqHEtdU2zVD/nSapXieEokbATi
         p1STHlxM5jb/Piifwz/gim90u7vnpD3Ryvprhhs5NOazIVsby8zWzaipqd1/vVWgkgAz
         g03Km2i/BGTk8WEPf8HLWz7j5RKdFRpwpbVwwgQuvEbg5RHOwVkOf2q7AxePIRJEEa/J
         b6yceWo4yh6TzO+l+Kc1lYIFlGv9/ICUjeECFhHOkiJfLqCxzmblH5fGc/RbDyvzPRtB
         iN2HdIs8YxVXR2zeuxZ5pIj4YKKzPBf/Z/lRQZPTHjiVpCa3/ZSTlxewhXRoDUHxr/ZA
         3qGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=vUR5Pl9SEoXSnBkg/BLR6eKyGEW9zWBbQPUu8Nf2n3k=;
        b=K8KZ7D2JPj+ufk53nwM963iyg8iaovgkxYFZVYqscN6sa+5hft+r19kJsVh6Dv9ylG
         hkh+RDbM98jIUhbf4evRoh1QJjR+AVP/dJGI7ov5BFW68t70U72xu9IlpIBd1LcNTQQE
         gAmVrnfq3zy3Xm/GldP+CMHfofgBN2756g9qu7WAfP/2DzSJ51zCLMkUGPnvl3B45DAy
         TVj4JzTsXiEWexMTzSCGS6f7Vvin6xpBusCwrqgcE9uvR5BUY+nZCCqMvzh335s0zIh4
         EXvAjuwEnvV62usLfg5dWocgz7sIPl1HcP42FQTKwdO/Dha9GA04mJXSIMXRw1FPuL27
         AhXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3-v6si9449892qtl.309.2018.07.10.09.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 09:46:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcvmn-0004Vc-AW
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 12:46:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1fcvmc-0004VW-7k
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:46:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1fcvmY-0007h8-V9
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:46:34 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42379)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <th.huth@gmail.com>)
	id 1fcvmY-0007gu-OZ; Tue, 10 Jul 2018 12:46:30 -0400
Received: by mail-wr1-f68.google.com with SMTP id p1-v6so15323577wrs.9;
	Tue, 10 Jul 2018 09:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vUR5Pl9SEoXSnBkg/BLR6eKyGEW9zWBbQPUu8Nf2n3k=;
	b=SZuf/YRWpslpM+qu8KP9lfWaQNgNmPtP5hdQN7eJbQqoEbIkjeGNYjHUsbY+GdK7Ui
	RncV3lz5HWHEsR4tlGr8hqzJkEMUINRQEqRlqeoZ6E1mBVXxNQv685apjM31un8y6OFn
	EeSZnXmFVwfHKVzid7pa/uxVj2KlhDjuXQun7tf+gWndxGiVHGFo3ZsPbTjrvUrg4Nkc
	5F1fthTvJJqiWfUuXdGj/fmh/w74lwlg59SdcSGHafsllKY0K0BMlPmvkFdDGrDKwRq1
	9JPROjwhYIgpBEncIuIM2wUzUI3HYbovtg3XJpgujrjncmGWMQwpfnrwtOJGMpWSWALm
	YgiA==
X-Gm-Message-State: APt69E0v9izNbQfg4+pL+rlu33QvhtWq2fXNj4XzIF4pSPE4SZ2pRIgU
	T8d6QuHe03vaOjH6UGhpMcI=
X-Received: by 2002:adf:9148:: with SMTP id
	j66-v6mr19269564wrj.118.1531241189580; 
	Tue, 10 Jul 2018 09:46:29 -0700 (PDT)
Received: from thl530.multi.box (p5791DA2E.dip0.t-ipconnect.de.
	[87.145.218.46]) by smtp.gmail.com with ESMTPSA id
	t13-v6sm4335677wrr.74.2018.07.10.09.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Jul 2018 09:46:28 -0700 (PDT)
Date: Tue, 10 Jul 2018 18:46:25 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180710184625.409f3de4@thl530.multi.box>
In-Reply-To: <CAFEAcA8gpNbc=a1r_OBNV+KOu0CDbM1X7kH1__1G6rrADry8Mw@mail.gmail.com>
References: <20180702130605.13611-1-peter.maydell@linaro.org>
	<CAFEAcA8gpNbc=a1r_OBNV+KOu0CDbM1X7kH1__1G6rrADry8Mw@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [PATCH for-3.0] boards.h: Remove doc comment
 reference to nonexistent function
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hQsmfaY8mqfF

Am Mon, 9 Jul 2018 14:15:28 +0100
schrieb Peter Maydell <peter.maydell@linaro.org>:

> Ping for review? I can put this in via target-arm.next...
> 
> thanks
> -- PMM
> 
> On 2 July 2018 at 14:06, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > commit b08199c6fbea1 accidentally added a reference to a doc
> > comment to a nonexistent memory_region_allocate_aux_memory().
> > This was a leftover from a previous version of the patchset
> > which defined memory_region_allocate_aux_memory() for
> > "allocate RAM MemoryRegion and register it for migration"
> > and left "memory_region_init_ram()" with its original semantics
> > of "allocate RAM MR but do not register for migration". In
> > the end we decided on the approach of "memory_region_init_ram()
> > registers the MR for migration, and
> > memory_region_init_ram_nomigrate() is a new function which does
> > not", but this comment change got left in by mistake. Revert that
> > part of the commit.
> >
> > Reported-by: Thomas Huth <huth@tuxfamily.org>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Doesn't strictly need to go into 3.0, but it's a trivial
> > doc comment fix...
> >
> >  include/hw/boards.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index 79069ddcbec..d139a431a67 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -35,8 +35,7 @@
> >   *
> >   * Smaller pieces of memory (display RAM, static RAMs, etc) don't
> > need
> >   * to be backed via the -mem-path memory backend and can simply
> > - * be created via memory_region_allocate_aux_memory() or
> > - * memory_region_init_ram().
> > + * be created via memory_region_init_ram().
> >   */
> >  void memory_region_allocate_system_memory(MemoryRegion *mr, Object
> > *owner, const char *name,
> > --
> > 2.17.1

FWIW:

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
