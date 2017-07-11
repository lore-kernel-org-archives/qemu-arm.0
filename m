Received: by 10.25.44.15 with SMTP id s15csp4797375lfs;
        Tue, 11 Jul 2017 05:56:54 -0700 (PDT)
X-Received: by 10.200.44.186 with SMTP id 55mr10250657qtw.173.1499777814305;
        Tue, 11 Jul 2017 05:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499777814; cv=none;
        d=google.com; s=arc-20160816;
        b=V8UFupCVH3wZNa992Pv/V3GR5f5Xn1DgJ7VFZ5hwPASLb69/MCTj6gKOsk+YUaQ2Xl
         IKjnqwVTZnuGhcr+3mQi8Hzhv4z1aXXDftVxObsNd3j813oow1carMkvpmLh4ctRTB9f
         4c9XgPoA0KSSL1BEmbJ88oBdpruRBFpXEmtiDAw+ZQR0yFUvOyTjMWZ5Tewks3t3LnHs
         12TSkFs6ZhMKQPV4+9uaiWWtIjvwjezBZuAc1E0jI7lXmpCfFd1V2yUajSVgsxo4Xmkz
         jBn1CdHTrlPHvloR8zSvSLn3AIw71SaG45fADSVa1E2PG/ODJ+y+E15domzdoO4xSDAw
         fCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=s1SFkWropgD+lD86GAAqFwoPMm9uJWbXivmkklHNdE4=;
        b=ySGiYFAzU/Shh5OY8TcFjk4zkvg6aZYcX7aC5Z3dUz3E0W6mAquz5TkkKQjFJ5JPYJ
         G+SAa+ohTJ++GKj1jxhbPC+B2m9IIPSncsDjuUzZz1gFj8SMtlXtVikeI9SHIVV95ZBT
         aTZ/ce26XGI/TCupnYg4OjghXAflBUoR/SnXoADufOGz4Z6vQB6kudEoLpvso9k87uyJ
         4EG269rxdKaUeIqkC3bVLrmmQfDxKnQkHdgusAm2GnJJHb/4IkwgSRL5RkFC858Gb6Sd
         n0/IIsjCBSMweglsI++MYbgdLhyFKvh/ktpFk++QrOC9ifRHss0UarvZi8f8Vw9FKYif
         1KTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=QNYWYh6N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id m1si3933926qkl.153.2017.07.11.05.56.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 05:56:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=QNYWYh6N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUuih-0007Yc-Mu
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 08:56:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUuXi-0006Wr-Pd
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 08:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUuXh-0005rO-VM
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 08:45:30 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:33026)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dUuXh-0005qw-Of
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 08:45:29 -0400
Received: by mail-wr0-x236.google.com with SMTP id r103so182126401wrb.0
	for <qemu-devel@nongnu.org>; Tue, 11 Jul 2017 05:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=s1SFkWropgD+lD86GAAqFwoPMm9uJWbXivmkklHNdE4=;
	b=QNYWYh6Ncl8e7QhK9z5nxEbhwBb95xrwlxxeeyeKUgEPjVQdDIZAPHcrzFvHhw/8Ma
	4h6x+WUrJlZ9TE2mZI8UqiUOLZo6SRSjDjm7+/2g9U9zgFpyacHCbYfGmo6Tne0/bU7G
	o9mWktTexkFLgY6znE5EEIoU6A4AmWu56DCZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=s1SFkWropgD+lD86GAAqFwoPMm9uJWbXivmkklHNdE4=;
	b=hgH92SZMHe5ifX3Yq6+tO8jICB7L4QjdVJd9/YfBWJPDIL/p2gpKviIZ/JrIge8Kv0
	CW+GGLt6Xj8R4TuYEdQM/CpGRqcBiv0ID/Wt373PHhKOl+83ngZPdN1qGxn+MgE3Vhem
	5Mgt1pEI1j0VF9Lo1jNHuS4azecGsKE/0XOjNpMj2uXVKnq4jNpwWXja49jGbbq/HWUz
	3h+GZ+UthflPXGoUWU33sBZ4vw0FwU1Vg2z9x63jv/ci/7XFnyvvGZ0PD3X7Cszh0pDx
	pc11C2+T6RPWPdPDfSx/6MBBL+tQU1XJvNs1TQbmFRW7gTWSevChtIXL43C1dADwJT2B
	BcIg==
X-Gm-Message-State: AIVw11191wDMwLsDgBgQF9IQiPfA10txdixTrFcTg+ZblaSrnxyEF0Eh
	CKaQ9H67TEu5xH+ZGby/2Kt8pfc64me/
X-Received: by 10.28.129.203 with SMTP id c194mr6112846wmd.120.1499777128544; 
	Tue, 11 Jul 2017 05:45:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 05:45:08 -0700 (PDT)
In-Reply-To: <CAAdtpL5_Qfy9h_Osa=tyMDMu4LhOn2mkXA-jYpmpgYwbDJq0yg@mail.gmail.com>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<CAAdtpL5_Qfy9h_Osa=tyMDMu4LhOn2mkXA-jYpmpgYwbDJq0yg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 13:45:08 +0100
Message-ID: <CAFEAcA9kLCXqt7Cpe-gMGcne8z1h7_ttyf6DwxpLUmuqEonNTQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe@mathieu-daude.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-devel] [PATCH 0/7] ARM: implement MPS2 board (with 2 FPGA
 flavours)
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iJ4uAfmVBC+p

On 11 July 2017 at 13:11, Philippe Mathieu-Daud=C3=A9
<philippe@mathieu-daude.net> wrote:
> Hi Peter,
>
> It seems you forgot to add some files to MAINTAINERS.

True. I'll add this patch to v2 when it goes out:

    MAINTAINERS: Add entries for MPS2 board

    Add entries to the MAINTAINERS file for the new MPS2
    board and devices.

    Since the CMSDK devices are not specific to the MPS2 board,
    extend the existing 'PrimeCell' section to cover CMSDK
    devices as well; in both cases these are devices implemented
    by ARM and provided as RTL that may be used in multiple
    SoCs and boards.

    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 9529c94..10f5cd6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -380,7 +380,7 @@ F: hw/*/allwinner*
 F: include/hw/*/allwinner*
 F: hw/arm/cubieboard.c

-ARM PrimeCell
+ARM PrimeCell and CMSDK devices
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
@@ -394,6 +394,10 @@ F: hw/intc/pl190.c
 F: hw/sd/pl181.c
 F: hw/timer/pl031.c
 F: include/hw/arm/primecell.h
+F: hw/timer/cmsdk-apb-timer.c
+F: include/hw/timer/cmsdk-apb-timer.h
+F: hw/char/cmsdk-apb-uart.c
+F: include/hw/char/cmsdk-apb-uart.h

 ARM cores
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -455,6 +459,14 @@ S: Maintained
 F: hw/arm/integratorcp.c
 F: hw/misc/arm_integrator_debug.c

+MPS2
+M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/mps2.c
+F: hw/misc/mps2-scc.c
+F: include/hw/misc/mps2-scc.h
+
 Musicpal
 M: Jan Kiszka <jan.kiszka@web.de>
 L: qemu-arm@nongnu.org


thanks
-- PMM
