Received: by 10.25.21.156 with SMTP id 28csp301437lfv;
        Wed, 24 Aug 2016 05:24:23 -0700 (PDT)
X-Received: by 10.55.191.67 with SMTP id p64mr2966887qkf.44.1472041463644;
        Wed, 24 Aug 2016 05:24:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id p28si6149617qte.44.2016.08.24.05.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 05:24:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcXEF-0006vA-5B
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 08:24:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bcXEB-0006ux-1A
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 08:24:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bcXE6-0006jb-R5
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 08:24:17 -0400
Received: from mail-ua0-f177.google.com ([209.85.217.177]:34903)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bcXE6-0006jT-N4
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 08:24:14 -0400
Received: by mail-ua0-f177.google.com with SMTP id n59so24689425uan.2
	for <qemu-arm@nongnu.org>; Wed, 24 Aug 2016 05:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PC//YTdkCFaP5DBPNe+hs/4/tMf1lzGC5TavxNVka/o=;
	b=A7e1trnto3pQ93JnvbcnE+XBr+tVIVfisyspDsaFe18yq+2hYqJxlIYSRx5wkNkkT8
	sNCeSLkt4BGqmnIhrpVkFl8Ja/3qmUZrraCSfckmvNYHI6XeaJ6nt3+Qempp32x064HV
	dmofy2fIkqLrOAg9xgUarLpu8sIzH/o/11gkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PC//YTdkCFaP5DBPNe+hs/4/tMf1lzGC5TavxNVka/o=;
	b=CreVSYiJO+Nlim6h0eJ/JUEq3s6jBqsvfGEKgNXKG+AN91Ac/He/EqFdv9wmFy8/FJ
	WgR/D2UMqAn8x2wNMO+nW6INYGRJBZ9ajpPGeBxK2dEw5/y0qpUrCLCVrzMlgsflQXRB
	CX9fi8653ZegkJw698kyKrI8E1A3gUnXvikk6/s6sZqmqcq8guJBNxgwWYnydMuEemk1
	eSQhs2ExBa3VTxye0wGlToJFd5lBQb5k83ssxa/sRRqCdQNkOiruYBbFyN8Yg7a2vyHb
	Dt+81ikCEMpKPm6/ujuED2hFgbRNfHJefUZp7tDWj2Y4A3DBKk5G216IietOc9GTn1+S
	lnpg==
X-Gm-Message-State: AEkoouuDrIBI0a2dHuy3SDLqM5oz0DQT1CE1r0KCaaEAJGClOSAcliZCQlq8xBenAdrbbJnHLMzCqN4WiCQIn9tS
X-Received: by 10.31.1.6 with SMTP id 6mr1519748vkb.82.1472041393958; Wed, 24
	Aug 2016 05:23:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Wed, 24 Aug 2016 05:22:53 -0700 (PDT)
In-Reply-To: <2076948386.5196666.1472039115921.JavaMail.zimbra@redhat.com>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
	<20160824083457.GA2032@work-vm>
	<CAGn-Tghj6gSgqD1s3ynb0zfodNwruhvMqK-P=7p0jvYVJc4ykQ@mail.gmail.com>
	<CAFEAcA9EkuHT4uV8RS1-ZaJBWWNrs87sGkmvhw0MfWGcAg4eoQ@mail.gmail.com>
	<2076948386.5196666.1472039115921.JavaMail.zimbra@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2016 13:22:53 +0100
Message-ID: <CAFEAcA_UgBBW0e6+YFb-=J73bz+2iQSTFkMSzcA-VNKAn9r9Sg@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.177
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/7] Improve buffer_is_zero
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>, Liang Li <liang.z.li@intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Adam Richter <adamrichter4@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S+Xy+mMfedN6

On 24 August 2016 at 12:45, Paolo Bonzini <pbonzini@redhat.com> wrote:
> It does save a level of indirection after the first call AFAIK, but
> it shouldn't be measurable.

It's worse on first call, but I don't think the subsequent calls
are better than straight pointer-indirection. It's been a while
since I looked though so I could be misremembering.

-- PMM
