Received: by 10.223.150.237 with SMTP id u100csp2350793wrb;
        Mon, 13 Nov 2017 03:40:50 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYMW8XzyfQAdijO59GSu80aGNGlJzH9Msqn7lWZ7ofyppeYtdhULO5YZNZjvJR43I1J+YeH
X-Received: by 10.37.76.198 with SMTP id z189mr5184971yba.129.1510573250243;
        Mon, 13 Nov 2017 03:40:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510573250; cv=none;
        d=google.com; s=arc-20160816;
        b=bigXFG4j1gzGLsYwYoT0luaz24MOfEFV12LVPhRpTAy+3AcC2FULUwDbqzv2jvxJNz
         WYbio7TFAFfza0nUhB3aowaqhojKQct2iV/fuAAfVa+i72oXYOC+uA2DUFPJTzLC/m9C
         LErEnZ9ASzyuSbE0fO10h9BXuJhCiBKh/e1fJWle0dYT6ci1yNq4mRiXjkqoIcx8UoB5
         4YhWsoouKCRZdG0ovtOukJkukqzSos1D4iUA+/k7Qqf0qCbHC+sCJOaLiqBAOlQuczJ1
         e6vmXNr7sz0Wx/d0kGwZ653dQ0quY988SrIOIurnoKvjojp6MqSIjLfI3h57ZoL9yKDD
         cz2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xEU2sSdHknTxdcn5aUxOgbLNMS705ieTTfGSP/QoDuw=;
        b=l9fMSy/WbT0FNaE78+JY06ZFIbEAoO7zI9XL6I+MbGXnLFa2TFyA3DVguPhhB3RQPM
         g1vbMOzc4hXKHnn24sHlfbwGz62TtnfQDIV/XsP7ZQxCSeY9GabchsoIxfAC3McuA7sy
         MahGB23kiq9SJNPKvLF+8JZ2MROKmu6N2LmeGdGWmPjZxXCVw5EkaWD1SNe7Te2qVVqC
         A4q+becirt7wgBYqVz9tf8aqUaBoLlA+eXuIFctl+9UMZtSBs2/fcgDgbLYZ+3/PNA2C
         hM9IBNXp3cNGAIYVYQ/E+S6bmp2d1HgMAJ91piqSu5IeimBbpOfAjzoS1Eu65J4mM5tf
         fwug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FheqsYza;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x66si3472266ybx.647.2017.11.13.03.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 03:40:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FheqsYza;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eED6f-0000Rp-MI
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 06:40:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eED6N-0000L6-MT
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 06:40:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eED6M-0004OH-FB
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 06:40:31 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:43361)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eED6M-0004NY-7V
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 06:40:30 -0500
Received: by mail-wr0-x244.google.com with SMTP id 4so14160864wrt.0
	for <qemu-arm@nongnu.org>; Mon, 13 Nov 2017 03:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xEU2sSdHknTxdcn5aUxOgbLNMS705ieTTfGSP/QoDuw=;
	b=FheqsYzazSaXv5jBdz1XeGz6unjNsYxAoBN0Z8dUjBK0izlcxTY8TosZsmz1SotiJX
	6b4Xz/DKhnXhwqsSea1rKKJmzeraut7g3xBQV1aOvuk14oXDJD0yoUeUV0KMG18BDG4O
	B3I2CG0wi+L74dMy9WmrDiWy1Sa9w+K8e78so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xEU2sSdHknTxdcn5aUxOgbLNMS705ieTTfGSP/QoDuw=;
	b=CX8KQboi5Xq5sx9kUcKTllRE92VMSI/MiunN0hGnNyQVS6TJO2+CSmVdWzLmdNCZhJ
	KXaLDDKW3DYwHonYzZ1F9KOGgUgbdyX3suwDAYZQTSDBIGLR/7QipoyXJ0XP6bPIzsY6
	4eWchXeM/8KyQoJrTJpgrcU+yRdiges18PVGOfugl7UNytQ+sWIMEby5lRdg9ZRq4D8n
	CwOvX0So8rPPNbawdpqlehA/2SYbjnwvm8RJSKv5vzigd3XWraeA/O+ohWwDoPOM5sKg
	RAvpusaRYagx2Y89BZn/OY1hBZ9yKNwKF/lHMPHOyQVoZlP3G7gGUhAcUeia0Niid+1d
	iyQg==
X-Gm-Message-State: AJaThX7E1R0aZQgibgVxFyZL5OG0oAZ7fJbsK+40vv09sYVp87EW6Ior
	Hk3QGcofz5s7oo7LTlieXi+1GC8Rst45bX1lAlafzQ==
X-Received: by 10.223.169.80 with SMTP id u74mr6582143wrc.178.1510573229021;
	Mon, 13 Nov 2017 03:40:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 13 Nov 2017 03:40:08 -0800 (PST)
In-Reply-To: <1510343626-25861-1-git-send-email-cota@braap.org>
References: <1510343626-25861-1-git-send-email-cota@braap.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Nov 2017 11:40:08 +0000
Message-ID: <CAFEAcA-CLWOs-MS2Yyer5jWzOK7VUVex5Y1N-L7zjy0KDyJ6Ww@mail.gmail.com>
To: "Emilio G. Cota" <cota@braap.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [PATCH for 2.11 0/5] TCG/ARM fixes for 2.11
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sBmoIK64l6Di

On 10 November 2017 at 19:53, Emilio G. Cota <cota@braap.org> wrote:
> Some MachineClass changes to fix TCG initialization of some
> ARM boards for 2.11. This was originally reported by Thomas Huth in [1],
> where Peter suggested a way to fix it. Further discussion in
> another thread [2] followed up on this.
>
> As a result of that follow-up discussion we also got some Zynq changes from
> Alistair [3], which I'm including here since in order to test them
> we need the first patch in this series.
>
> Thanks,
>
>                 Emilio
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg00078.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg00502.html
> [3] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg01842.html
>
> Alistair Francis (2):
>   xlnx-zynqmp: Properly support the smp command line option
>   xlnx-zcu102: Add an info message deprecating the EP108
>
> Emilio G. Cota (3):
>   qom: move CPUClass.tcg_initialize to a global
>   xlnx-zcu102: Specify the max number of CPUs for the EP108
>   hw: add .min_cpus and .default_cpus fields to machine_class
>
>  qemu-doc.texi           |  7 +++++++
>  include/hw/boards.h     |  5 +++++
>  include/qom/cpu.h       |  1 -
>  exec.c                  |  5 +++--
>  hw/arm/exynos4_boards.c | 12 ++++--------
>  hw/arm/raspi.c          |  2 ++
>  hw/arm/xlnx-zcu102.c    |  9 ++++++++-
>  hw/arm/xlnx-zynqmp.c    | 26 ++++++++++++++++----------
>  vl.c                    | 21 ++++++++++++++++++---
>  9 files changed, 63 insertions(+), 25 deletions(-)

Since this is fixing Arm boards and I'm putting together an
arm pullreq anyway, I'm applying this to target-arm.next.
(Eduardo's reviewed the patches which touch the MachineClass
and option parsing code.)

thanks
-- PMM
