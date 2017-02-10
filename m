Received: by 10.25.77.65 with SMTP id a62csp497850lfb;
        Fri, 10 Feb 2017 06:05:53 -0800 (PST)
X-Received: by 10.55.154.68 with SMTP id c65mr9282171qke.180.1486735553350;
        Fri, 10 Feb 2017 06:05:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q33si1327988qtd.32.2017.02.10.06.05.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Feb 2017 06:05:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ccBpe-0000Zw-IK
	for alex.bennee@linaro.org; Fri, 10 Feb 2017 09:05:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ccBpZ-0000ZP-Vf
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 09:05:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ccBpY-000111-Ru
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 09:05:45 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:35732)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ccBpY-0000z2-Jh
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 09:05:44 -0500
Received: by mail-wm0-x232.google.com with SMTP id v186so111079348wmd.0
	for <qemu-arm@nongnu.org>; Fri, 10 Feb 2017 06:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7Nn/Sq06TCjofjEVeuz6xK9C9ZEHQqVeVv6QTY9avH4=;
	b=idbWhc3Z8APqtjJw7EBcy1S22FM1Kv8k4J6zLeRR4G4WMPO34M1fstVQFMJ+PIfYNX
	6WYzq/tB2A4ZJxcj90TpA0mGtPRoP1sk3mo10c+yjxofLJfNuayYpKr/3xbmIXWrDzY9
	Q64mu0f9abjbbw1gP4uxmf1zXfuV6OqMjeV7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7Nn/Sq06TCjofjEVeuz6xK9C9ZEHQqVeVv6QTY9avH4=;
	b=bYpdhP+xJma1iQcW4M+NxaZdz8kalqekyJCQ01ubZMthgK34d9UlBZDRDX41RsoIr8
	KpauOww8ru79kDdPWB6IGsMl4zlDbnves0toYYVNK2yCXlXtpX0w8p4UhvpbDmz2e8jJ
	bkqdBZE7/QC6+H++cEHz9CVCdt0gWdXH86LIYASaoeJrTtscdV4zIyvrOiKM+ig21ESz
	apJQZWJHsVdaEXwIUWjruFQE/SDO7W+ctG8zitS76bm3mHJsYDufm7waENo2RYs/VFDS
	OGVgFCClg9J9Ib/9AfIfLvfekto6ZqXoSxYU56UbcQNgF5BlBhNyn7WorWP4X4n3mtT4
	cPdQ==
X-Gm-Message-State: AMke39mh2AzVtQkJ9ucEU31EqvHblo9jQ07adA7mghc7oI1j5TM8xhnGYFu47WVt2P9qwImeSJOH0rwopAhgFqpG
X-Received: by 10.28.4.10 with SMTP id 10mr29192948wme.142.1486735541057; Fri,
	10 Feb 2017 06:05:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 10 Feb 2017 06:05:20 -0800 (PST)
In-Reply-To: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2017 14:05:20 +0000
Message-ID: <CAFEAcA8Tn=gqLxruPBm4b=MvEnhn7qNbZt2k-Sfk0Hu3eS+v3Q@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-arm] [PATCH 0/9] Rewrite NVIC to not depend on the GIC
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
Cc: Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OP3KCqLrGEXO

On 2 February 2017 at 20:02, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset is the revamp of the NVIC code from Michael
> Davidsaver's patchset of a year ago.
>
> Despite some superficial similarities of register layout, the
> M-profile NVIC is really very different from the A-profile GIC.  Our
> current attempt to reuse the GIC code means that we have significant
> bugs in our NVIC.  The series pulls the NVIC apart from the GIC code
> (fixing a few accidental bugs in the process), and then once it has a
> place to stand, implements a few minor cleanups, a key bugfix
> (getting priority calculations and masking right) and a missing
> feature (escalation to HardFault).

Ping?

thanks
-- PMM
