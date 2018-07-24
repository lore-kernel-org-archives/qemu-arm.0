Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp6753613wru;
        Tue, 24 Jul 2018 05:24:16 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcLmNUui5b1d/MJNjoHJQaQSGfsM8QMTbEHB6mi6H4DtjLnYq96ldhmo3F0Q4RC2Vo9JV2i
X-Received: by 2002:ac8:218d:: with SMTP id 13-v6mr16219123qty.122.1532435056476;
        Tue, 24 Jul 2018 05:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532435056; cv=none;
        d=google.com; s=arc-20160816;
        b=1GV/0/raDVlR5EBh62cYtWD/PML1kWS6w+KqPUj4i0gwU9zV7Dhp2PCRpZU04pya96
         7vzVZcwsQiS1DniFExgEEU9BymWURnSypzBIQw9HYA14S7jkbccg7pfOREeaF1KZVht3
         jRcm87i58Ok5AV1cGmGXe59OrHfvUAlMw9ly67AoiHbBWnViYa8P0zvwNbZGybgp5FEM
         dzeeGddyZk2XP8qkQUghVsxqvcZu1kjz46sqe4w2JIqakAJUKM6EahAX59H5zMlLC+Di
         xQ2vJ6zSzsl8jL3P/D9C29QNYJths0Ryjkl3V2HEIHWhvB8EPbOFHW7zl9SF16rg9saR
         bPIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=L6DDu/x6PjPhhJCprDvcGyLbbs80zhLkT/+6x60SQMQ=;
        b=tOEdMJqy04+IAutraweMPL4bmVXJ3lydOJxp1SrXyHH0OQunYxuw1+3c/MVbN+QYk/
         QBocLhQ8X6+okD1i2JTRxA+awJ1UJE3fuvcVbgSWgu2FUO48nwlrOmlopLAIcWGFd0cl
         Fo3jNYKXFoNa7Nt3XMkpeCFyEomuKSfNuEX7ll1uJgT38FiOBGUHryW5xHr3bgxGtM6r
         D0vgxN260ZJFRJm3bmOFAd7TGV36RsPr7HYFs3SUWg/EDKEFvAnZoKmaMsUPN8X2IvNM
         4OOYYqlRwz5RuISNB4x7XL0abmwpQRssBbWCTKrJ6ZLaYt0Na23yIBsHdOIzjQ/Tpwa6
         sc6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JiS7cQpa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n57-v6si3026602qtf.327.2018.07.24.05.24.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 05:24:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JiS7cQpa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhwMR-0008UF-UX
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 08:24:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fhwMH-0008TP-7y
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 08:24:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fhwMG-0000UX-A6
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 08:24:05 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:41444)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fhwMG-0000UN-3l
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 08:24:04 -0400
Received: by mail-oi0-x244.google.com with SMTP id k12-v6so7065750oiw.8
	for <qemu-arm@nongnu.org>; Tue, 24 Jul 2018 05:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L6DDu/x6PjPhhJCprDvcGyLbbs80zhLkT/+6x60SQMQ=;
	b=JiS7cQpab/xj/OQlQ6mOpnKcKBx5Ey1Oy1N6kGoaCx7Kaw19QgxGQawzQ0gH/g2OYz
	un+FxiftqnYB3wqG0sZDPD9exMlhVxfTnZs2jltmDPA4WedKe3ov8l51bB2rQwd2mfVQ
	hs8sOLnFT303DBJfnGpGZJWyga/Fi3EgZnPSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L6DDu/x6PjPhhJCprDvcGyLbbs80zhLkT/+6x60SQMQ=;
	b=R8ae5XI4Z8HMwqSl9mipCzH0G0rtXYWxHMW0RpY6phgBP6HheLLbwZF+UD+DVzAj66
	HM5QH9JmL2PRi9El610B/3M9ky6eAlWupIZlGxQ8lcpSlo933/RIth2R3DQpUMmbXfsz
	3P5yyvD++BUE60xqCxYSGTp+CRKPY1gVVyLyJZ3J4v3TWXW8dfwjmXyAsWWiPotWIHyh
	aHEscAQoZnZANFOXKxMQjHrYn/BC75QwtzC+AUn/XH2RWcbzikwvfQAQBMThMEmW3Joo
	rBnZfsprFXuj6lufbi9g8WBvb6zh0kt4zPxBcqhGr7wIrMQyXuDR8NH+8yzp45Zs7lrD
	0fRw==
X-Gm-Message-State: AOUpUlELsLt9BTX1qJy2Ealv5oeO3KCPhiWewZCo26GVDA9F7woiImzh
	oxId2L9QEsjVELh+WYIYpOarI4PZzKx6IzbP7mxQ5cHZ
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr3152900oih.102.1532435043430; 
	Tue, 24 Jul 2018 05:24:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 24 Jul 2018 05:23:43
	-0700 (PDT)
In-Reply-To: <20180710160013.26559-1-peter.maydell@linaro.org>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jul 2018 13:23:43 +0100
Message-ID: <CAFEAcA8t3+4A442TakdmcvYSh5s1iV80oJhJnsmjdzG19PTZXg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 0/6] accel/tcg: Support execution from MMIO
 and small MMU regions
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: quk+ErCuKsKu

On 10 July 2018 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
> This series adds support to TCG for executing from MMIO regions
> and small MMU regions. The basic principle is that if get_page_addr_code()
> finds that the region is not backed by a full page of RAM then it
> returns -1, and tb_gen_code() then generates a non-cached TB
> containing a single instruction. Execution from these regions
> thus performs the instruction fetch every time, ensuring that we
> get the read-from-MMIO and check-small-MMU-region permissions
> checks right.

Hi; this series has been reviewed, and I propose to put it into
my target-arm.for-3.1 queue, unless anybody has a preference for
it going into master via some other route.

thanks
-- PMM
