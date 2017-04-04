Received: by 10.25.15.230 with SMTP id 99csp166189lfp;
        Tue, 4 Apr 2017 04:53:22 -0700 (PDT)
X-Received: by 10.55.217.71 with SMTP id u68mr2308613qki.272.1491306802804;
        Tue, 04 Apr 2017 04:53:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x62si14804094qka.141.2017.04.04.04.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Apr 2017 04:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cvN1W-0006uF-AU
	for alex.bennee@linaro.org; Tue, 04 Apr 2017 07:53:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cvN1P-0006tt-98
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 07:53:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cvN1O-0006Dw-HF
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 07:53:15 -0400
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:34040)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cvN1O-0006Dk-9H
	for qemu-arm@nongnu.org; Tue, 04 Apr 2017 07:53:14 -0400
Received: by mail-wr0-x22f.google.com with SMTP id t20so6711178wra.1
	for <qemu-arm@nongnu.org>; Tue, 04 Apr 2017 04:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bdYSvtT8g8M0voyHMR2doU3bL8bKk8xKa9AyPC+rbi0=;
	b=b7diCRJKD9xtPzJJ/CzC22l/VcHM6sqFTyHDtOaNyGuVW/Iy4TREt0W0LNp9geuuFF
	TqURw5kcUG0z7ge1BPuyC2qKw9m4096Rw5ln4dpIhVTDmSd9Mlkv6Xb5H0k+Hu3o8Vzs
	s18NUXuK9zpVbC7emvQa7cql9aJrGnNVdfyJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bdYSvtT8g8M0voyHMR2doU3bL8bKk8xKa9AyPC+rbi0=;
	b=GIEHurJTFinmkz+yNqIlF4QglCVWjOrAssZJZ7rhSuwE5UY7bHXmW1eynMeHpReTJe
	/WO6HeuzugxZLwtw5YsTqrdfZXIiNs0w+ENCt2tqHPi4PM063msCsqLVbbRhGoJj0gQH
	U90vVbT8BbNtKfdNRuL5XfH3wOCTs+A7WbDTOcQp8lyiil+/cbNSI4Tg+HyPY6OvE90y
	uPvdlOrw6M6+B0RlMKSwlZIE8W5L2q96ICBTdByL07CSgnSjeD8ir2JpT4tWusAOrd6D
	7x7iFQTneag9T9unA0oFQDdGdV2QF0+GeVm16ADEd7/qxNjA1yacRxSXUCo9lArXuDG8
	cDow==
X-Gm-Message-State: AFeK/H0FszCxYaQedP1xZvmsGGDBu0GMhN626TomgnK+tlMCuG6md6UrD8daQxhhaSbJx485Dn08PfSWSPMtuT9k
X-Received: by 10.28.226.215 with SMTP id z206mr14124514wmg.92.1491306792839; 
	Tue, 04 Apr 2017 04:53:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Tue, 4 Apr 2017 04:52:51 -0700 (PDT)
In-Reply-To: <20170313184750.429-1-krzk@kernel.org>
References: <20170313184750.429-1-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2017 12:52:51 +0100
Message-ID: <CAFEAcA8ErNnDj9XsJGG0ziDyeCA+T_N-HZf1DhXSAVTvzG=wPg@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: Re: [Qemu-arm] [PATCH v3 0/3] hw/arm/exynos: Minor cleanups
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 035h/ikcKQ2w

On 13 March 2017 at 18:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Hi,
>
> Minor cleanups, no dependencies.
>
> Changes since v1
> ================
> 1. Patch 1/3: Address missed Philippe's comments about error reporting
>    verbosity.
>
> Changes since v2
> ================
> 1. Patch 1/3: Address Eric's comment.
> 2. Patch 2/3: Address Peter's comments about "const".
> 3. Patch 3/3: Use "unsigned int". I had impression that no consensus was
>    reached during discussion. If that is wrong impression, let me know.

Applied to target-arm.next for 2.10, thanks.

(I wrapped a long line in patch 1 that checkpatch complains about.)

thanks
-- PMM
