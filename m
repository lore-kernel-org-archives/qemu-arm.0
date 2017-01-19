Received: by 10.25.190.12 with SMTP id o12csp293334lff;
        Thu, 19 Jan 2017 04:59:47 -0800 (PST)
X-Received: by 10.237.33.209 with SMTP id m17mr7830036qtc.59.1484830787231;
        Thu, 19 Jan 2017 04:59:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h56si2568708qte.96.2017.01.19.04.59.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Jan 2017 04:59:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47528 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUCJc-0002rn-Mh
	for alex.bennee@linaro.org; Thu, 19 Jan 2017 07:59:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cUCJW-0002rd-K3
	for qemu-arm@nongnu.org; Thu, 19 Jan 2017 07:59:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cUCJV-000184-Ud
	for qemu-arm@nongnu.org; Thu, 19 Jan 2017 07:59:38 -0500
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:34666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cUCJV-00017g-Qq
	for qemu-arm@nongnu.org; Thu, 19 Jan 2017 07:59:37 -0500
Received: by mail-ua0-x22c.google.com with SMTP id 35so32535683uak.1
	for <qemu-arm@nongnu.org>; Thu, 19 Jan 2017 04:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s6rFr5npdHWa86+RVj2swMiwmJo6a224KzFLQIr0qls=;
	b=fKd2G0v/CNXNgZ/QjNLC82dddWVLKZdjxF4Xt+GGMp0V7I81Cp8Y2DxVY3uyCMWewj
	CMN3amWUQvWa6MmPKzcSXIh7n91R3rhGWPnjRKRfUINfQYmYCp2xkIEom7bzD6Ea7218
	N6cw4vZ9Ep8Fk3xdB+/0bQusJJv+8SMo0RCKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s6rFr5npdHWa86+RVj2swMiwmJo6a224KzFLQIr0qls=;
	b=UfEZxf9hKYvE3NsON0GGuLxxi6j1x/G7pcBiQE5mw8nS4pxpMA0w7/gj+omoc1xdY4
	TDFdXzQH2eUHOZSUUyLEZPWb9tesGrLWqy79Fxiyl698RzjUjVCohy5I9x0pQqvHU9DM
	jr4lBizbcWUoB0jTD+NOpewAwJUXQPX7iQcV94Sg2llFXoGlGrMvtA7SF4sO+tELMrBW
	TViSKkkPIZLYGXDM64qfl+ekpSdARti6KuFbRuuX0C7SWQTzw4IJvSZ4Q9VoPrBp0IvM
	9fOeUiGlsrS1rzO1Ze89mSbq5o7VERftrd+vj2yYqPUrM7SdttGHOAzRbGZrhWX3+C4v
	ex5A==
X-Gm-Message-State: AIkVDXLsf0bYwCZaWrTSQStGCv6jf/RuwWqQXjLc/fNuxtk/VBKjp/tdlOAjrh1BjoDen3041LBdEc/vsp/c14EK
X-Received: by 10.176.71.87 with SMTP id i23mr4629691uac.144.1484830777163;
	Thu, 19 Jan 2017 04:59:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Thu, 19 Jan 2017 04:59:16 -0800 (PST)
In-Reply-To: <CAJy5ezpYPaEdWG_4JQaQTL56EZYDT-TCYLaFtrKzpZUcu9DKHg@mail.gmail.com>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9N_YXFCPo8ja-Nan3roL=gdNpFQHoLk_aw6tDixwoT3w@mail.gmail.com>
	<CAJy5ezpYPaEdWG_4JQaQTL56EZYDT-TCYLaFtrKzpZUcu9DKHg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2017 12:59:16 +0000
Message-ID: <CAFEAcA_vpCFVGF6M27E8DK-phs2EvXKXr3k+h5ZXmERayL8jhg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: Re: [Qemu-arm] [PATCH v2 00/18] arm: Add virtualization to GICv3,
 and enable EL2 on 64-bit CPUs
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
Cc: Andrew Jones <drjones@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QlcwKArQFPm9

On 18 January 2017 at 09:17, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> Hi Peter,  I'm on holidays and won't have time to review for a couple of
> weeks at least...

Do you want me to hold off on committing the GICv3 patches
until you get back and have had a chance to review?

thanks
-- PMM
