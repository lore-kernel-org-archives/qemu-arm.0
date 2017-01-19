Received: by 10.25.190.12 with SMTP id o12csp309534lff;
        Thu, 19 Jan 2017 05:32:38 -0800 (PST)
X-Received: by 10.55.152.69 with SMTP id a66mr8185562qke.172.1484832758284;
        Thu, 19 Jan 2017 05:32:38 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20si2602324qki.280.2017.01.19.05.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Jan 2017 05:32:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUCpP-0007XF-HM
	for alex.bennee@linaro.org; Thu, 19 Jan 2017 08:32:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cUCoQ-0007F7-0k
	for qemu-devel@nongnu.org; Thu, 19 Jan 2017 08:31:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cUCoM-0002JV-A8
	for qemu-devel@nongnu.org; Thu, 19 Jan 2017 08:31:34 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:33920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cUCoL-0002J0-2s
	for qemu-devel@nongnu.org; Thu, 19 Jan 2017 08:31:30 -0500
Received: by mail-vk0-x234.google.com with SMTP id r136so29313442vke.1
	for <qemu-devel@nongnu.org>; Thu, 19 Jan 2017 05:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zxBvPF4qwDC5arM9pwOY87PIJs0cYbxolw2Bha1W4Cc=;
	b=hY92eH2ZKGiSFslxti8tHd+81zSh1rGIN/pGwUs17HL0SohsLEjyNINhTieo5VC+nh
	Mgd44szMIInOr86drPgVKstFX/ntdOQ368zacsxtWs1eFUIn9ZbJTtHz+mMgyCp5b7bw
	d+3/PcuUVOCuDAW4durUICPhYU4edwUp5u78E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zxBvPF4qwDC5arM9pwOY87PIJs0cYbxolw2Bha1W4Cc=;
	b=Kt4Z/+RbkfpZndgLgerzfXjvYPvzd87Ou2hLheJe6XqMBiqc28vNlKSftkHNBt+fG4
	6Y5ibECg17DbqGEanzifiOZV7m0OedD3zjutDKcOUPavRXCGIyvijJhW0ATKWS8lfAY2
	GEvDlMJr1XuwyoEbWzETLlnY4b8jMSnZ40OJfXdOQGB8ghcQzV8+FuNes7nNA3HQLuW0
	5W69R1RhBMVSzbKoyL5thZhGg3H3DTrD5hBobTg2rOgZU0Ct8c8CgHX/iUCwyRuKATnO
	5tMxDiyEclp8axxGktvIkUp5Sx5+KjLkKOvyZrF2XpHiarOwB6dgJyg1HH4iUtesw51P
	tRJQ==
X-Gm-Message-State: AIkVDXJFtP5P3KxLJ7vu/K5q5v/ScAYZj233awD8Y5L+nHpIEgbcJXih4OTdV8oULNnsk8P/QxXa6eaD5aDKZ+0t
X-Received: by 10.31.73.198 with SMTP id w189mr3602259vka.170.1484832688496;
	Thu, 19 Jan 2017 05:31:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Thu, 19 Jan 2017 05:31:08 -0800 (PST)
In-Reply-To: <CAJy5ezrSHXMoiP5M3nBjP0BPqCwk898JR3zc955O91S4B+nW3w@mail.gmail.com>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9N_YXFCPo8ja-Nan3roL=gdNpFQHoLk_aw6tDixwoT3w@mail.gmail.com>
	<CAJy5ezpYPaEdWG_4JQaQTL56EZYDT-TCYLaFtrKzpZUcu9DKHg@mail.gmail.com>
	<CAFEAcA_vpCFVGF6M27E8DK-phs2EvXKXr3k+h5ZXmERayL8jhg@mail.gmail.com>
	<CAJy5ezrSHXMoiP5M3nBjP0BPqCwk898JR3zc955O91S4B+nW3w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2017 13:31:08 +0000
Message-ID: <CAFEAcA-+jEd7PBxRLbU5Rd-jc+O=rFJfrsVsSmYF+uD4mZWwMw@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 00/18] arm: Add
 virtualization to GICv3, and enable EL2 on 64-bit CPUs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DWN9Ey6SDbu7

On 19 January 2017 at 13:02, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> Nah, if I find something we can always fix it with follow up patches...

Cool. I've applied this series to target-arm.next.

thanks
-- PMM
