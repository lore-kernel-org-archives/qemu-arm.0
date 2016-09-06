Received: by 10.25.87.130 with SMTP id l124csp586163lfb;
        Tue, 6 Sep 2016 06:19:16 -0700 (PDT)
X-Received: by 10.55.21.196 with SMTP id 65mr47380902qkv.223.1473167956086;
        Tue, 06 Sep 2016 06:19:16 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 88si21271903qth.150.2016.09.06.06.19.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Sep 2016 06:19:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhGHT-0005E8-BG
	for alex.bennee@linaro.org; Tue, 06 Sep 2016 09:19:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bhFqV-0006jS-Qp
	for qemu-devel@nongnu.org; Tue, 06 Sep 2016 08:51:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bhFqT-0005ri-UK
	for qemu-devel@nongnu.org; Tue, 06 Sep 2016 08:51:22 -0400
Received: from mail-ua0-x236.google.com ([2607:f8b0:400c:c08::236]:34351)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bhFqT-0005rc-Pz
	for qemu-devel@nongnu.org; Tue, 06 Sep 2016 08:51:21 -0400
Received: by mail-ua0-x236.google.com with SMTP id u68so28565603uau.1
	for <qemu-devel@nongnu.org>; Tue, 06 Sep 2016 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rc6O4FPZj0rP2xTOgJqM95JPEYOB5sN7PBpxv0xr0SI=;
	b=gyJ6eJEJrAwWJFlP9puIVz/NVfhbuPvGCEr2r/4ZmtMA72ppGe07N9O+6LlEGbTEQL
	W7WMfoyuhVjU6gtzIkdLysT481c/d+Bj0GkUgKqhOGZM6myYriQwgch19jTs8/vMF8uW
	F5SXOMM8Tg+Lyrqi1leZ/Mbn564vDxCvPtLYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rc6O4FPZj0rP2xTOgJqM95JPEYOB5sN7PBpxv0xr0SI=;
	b=l+HctP1h0AgDCAiLZzIMNIAOTknn8oqgWKVKXVWw3m2VCszRWZiJWl3d/bj7qnZhcM
	rdHQCd9oqUnytYN/s+pVpa43sY0oKhxokOuY9Y6eJaihi4cWBzj9/MXQZSo+zXjaKC41
	9VpKG4Dt2flXNB49HsFQVOhx9zEp8qkCQCxKlrsWOg4dmxHkncf2N8kZlP00UIWqijQz
	4ioNRVMJmfYalCzcCOmsENGIpjATuhcP3q6De+2MTlpsNJLwRv6BteU6cXBxIyjzpYkS
	JEblw2UscJN7DmgCZ9ahw+uoz+dNeISPULxzfd2d+Qh96DqJS5xbFzQmFC4iE+1qOk6A
	OoiA==
X-Gm-Message-State: AE9vXwO6UM6sv3gisSMVg43PJhio73605sZmQWIR0Vx69kPGc43CBwdhwbdM+l9TR5FpLuuQkLniu4q/XqIQctgB
X-Received: by 10.176.83.123 with SMTP id y56mr25501949uay.4.1473166281210;
	Tue, 06 Sep 2016 05:51:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Tue, 6 Sep 2016 05:51:00 -0700 (PDT)
In-Reply-To: <1473146346-27337-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1473146346-27337-1-git-send-email-marcin.krzeminski@nokia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Sep 2016 13:51:00 +0100
Message-ID: <CAFEAcA8Ybk0RybXNa_Ln+bo5Dfcx1d_bUq__PK48mzD0eaxTFg@mail.gmail.com>
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::236
Subject: Re: [Qemu-devel] [PATCH v2] block: m25p80c Fix vmstate structure
 name
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
Cc: Andrew Jones <drjones@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Amit Shah <amit.shah@redhat.com>,
	rfsw-patches@mlist.nokia.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m46g9NQhVQIs

On 6 September 2016 at 08:19,  <marcin.krzeminski@nokia.com> wrote:
> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>
> Correct bad name of the vmstate structure. Since this breaks
> compatibility also update vmstate version back to 0 and make
> all fields independent of the VMState version.
>
> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> Acked-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> V2: rewrite commit message
>
>  hw/block/m25p80.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)

Applied to target-arm.next, thanks (I fixed the typo
in the subject line).

-- PMM
