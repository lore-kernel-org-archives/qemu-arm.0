Received: by 10.28.71.27 with SMTP id u27csp3127832wma;
        Mon, 22 Jan 2018 10:33:18 -0800 (PST)
X-Google-Smtp-Source: AH8x227b8loaBFSkvX9gSel0Z3UdvrLu+WUmEnvgbuINHWJfNayyIuRaDTXwlpyGQ+bw2QDQ6E1b
X-Received: by 10.129.240.16 with SMTP id p16mr8297742ywm.210.1516645998370;
        Mon, 22 Jan 2018 10:33:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516645998; cv=none;
        d=google.com; s=arc-20160816;
        b=PfC1bKzoaaDxwF0zGVtavz3AiM43sbVmrrux2dTR5GAsr9a+FwB7CrtoCs3Ilkvcyc
         RbRJpNa9trGnJPz9NzztEYoFOG7U1YlHz6qvzlsXKNxa1xcL4TZEdam7jjOk83I55Jsh
         IupbfrZUHgPt8m9pj6k/lWwbHSTJ5zk2bPQyhSUZzdO5h+HtyubA61U5rsr/JTJuxEN0
         JYIgIqReJ2xuQMG7fiqG2AjdVUCldUAq6fMNORjSVgws+NuGhE0XO0NaYxEou1J4k2ew
         lRswQcSk5nFGzhbXA3IFIqDvU+ZbXolO4Z+erKzr+yF1TZspeUAfZhx6djZ8wflja17a
         bx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=lPpIGTjIoUC/PxYKdHQIN2cyhtX0X9td9ZstVO1RwZU=;
        b=unTTtzuM2kzThvlmQLWFjNRrc6izxfQjKuNEwb2+OpS0B++MAbsnqniVRSieHa6lg5
         2Ya4nwP7g6AOlQViELXcvk1vrGZdEzfCHG3pYa8sxC89WRrWUZ438btdwYqF2MW0erMx
         NvTgj1CjOpfpfyVRlxzVga3HT7uzmOmjn/QbDiZCGeLW++r7mkqeP+wz90h2xutrR9ze
         NRJVH8TKVYbHyUUyW83+mZrBxzbhzadYPOIGa9x+pMM+4bIsvjwFOHQg91VDx3vtbSqq
         jKGNxSqE9V3BXfVocAtuk75oK7RDiaXImYJQrAfOh9JYBXlb8jiEnySqqENLAmGo05/U
         8hBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f9si42322ywh.587.2018.01.22.10.33.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 10:33:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edguD-0007Ra-Sq
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 13:33:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1edgu6-0007R2-IT
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 13:33:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1edgu1-0003IW-QH
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 13:33:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:2291)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1edgu1-0003H3-IA; Mon, 22 Jan 2018 13:33:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 549EF8762F;
	Mon, 22 Jan 2018 18:33:04 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69C6A60606;
	Mon, 22 Jan 2018 18:33:03 +0000 (UTC)
Date: Mon, 22 Jan 2018 16:33:01 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180122183301.GA31237@localhost.localdomain>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA-UO5Y_ACSZ2EEQEzgy30wdfEm3u8wUrBrXWaQaE_v+Kw@mail.gmail.com>
	<20171209010811.GJ3037@localhost.localdomain>
	<CAFEAcA9oG=+mJ+jSGTM_z54S09gjHoFowDkOvofdkhJd+g3=Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9oG=+mJ+jSGTM_z54S09gjHoFowDkOvofdkhJd+g3=Cw@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 22 Jan 2018 18:33:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 0/6] arm: support -cpu max (and
 gic-version=max)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3SJceQubEogd

On Mon, Jan 22, 2018 at 06:06:26PM +0000, Peter Maydell wrote:
> On 9 December 2017 at 01:08, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > On Thu, Dec 07, 2017 at 07:37:31PM +0000, Peter Maydell wrote:
> >> On 7 December 2017 at 18:14, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> > This patchset adds support for '-cpu max' to Arm, along the lines
> >> > of the existing support we have for x86 targets:
> >> >
> >> >  * under KVM, -cpu max is the same as -cpu host
> >> >  * under TCG, -cpu max means "emulate with as many features as
> >> >    possible"
> >>
> >> Forgot to mention: -cpu max for qemu-system-aarch64 will
> >> be a 64-bit cpu, and for qemu-system-arm it will be a 32-bit
> >> cpu. (This differs from all the other TCG CPU types, which
> >> behave the same for the 32-bit and 64-bit binaries. I think
> >> it is the same way that x86 -cpu max works, though.)
> >
> > Are they going to be represented by two different QOM type names?
> >
> > (In the case of x86, all the CPU classes have different names on
> > qemu-system-x86_64 and qemu-system-i386).
> 
> (Just pulling this thread up from before Christmas...)
> 
> I guess a better way to approach this would be to ask: how is
> x86 implementing -cpu max, ie what is the required view of things
> that I need to provide for target/arm in order to have QEMU
> behave the same way x86 does? Did we write any user-facing
> documentation for this feature?

About QOM type names:

On x86, all CPU models are resolved to "<model>-<suffix>", and
i386 and x86_64 have different suffixes.  So the QOM type name is
"max-x86_64-cpu" on qemu-system-x86_64, and "max-i386-cpu" on
qemu-system-i386.

About the implementation:

On x86, the most important differences between CPU models are on
(boolean) CPUID feature flags.  "max" just set all feature flags
to *get_supported_cpuid(...), meaning all features supported by
the host will be enabled.  The other fields (e.g. CPU
vendor/family/model IDs) depend on the accelerator: on TCG we use
constant values, on KVM we use the host CPU values).

About how it should behave:

An important expectation about "max" is about the
query-cpu-model-expansion return value.  Having a property set to
true on the return value of "query-cpu-model-expansion model=max"
means the corresponding feature is supported on the current host
and can be enabled on the command-line.

The most important user-facing documentation related to "max" is
the query-cpu-model-* QMP docs.  It probably needs to be updated
to contain more specific details about how "max" behaves.
Probably we could have automated tests to confirm if some
expectations are really fulfilled.


> 
> (The code in this patchset makes '-cpu max' give the same
> QOM type name for both qemu-system-arm and qemu-system-aarch64,
> with different behaviour depending on the binary. If that means
> we don't provide the same behaviour as x86 then I can change that,
> but I'm not sure where the difference is exposed to the user?)

This is not how the QOM names work on x86, but I don't think QOM
type names choices have important user-visible side-effects
today.  Choosing unique QOM type names is more important to make
the code future-proof for when we merge QEMU binaries, than to
make user-visible behavior consistent.

-- 
Eduardo
