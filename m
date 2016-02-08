Received: by 10.25.159.19 with SMTP id i19csp1324667lfe;
        Mon, 8 Feb 2016 05:18:32 -0800 (PST)
X-Received: by 10.140.93.87 with SMTP id c81mr34975677qge.46.1454937512194;
        Mon, 08 Feb 2016 05:18:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10si30401502qgf.109.2016.02.08.05.18.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 05:18:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:44643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSli3-0001KG-Mo
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 08:18:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSlhX-0000qR-1V
	for qemu-devel@nongnu.org; Mon, 08 Feb 2016 08:17:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSlhW-00067i-9C
	for qemu-devel@nongnu.org; Mon, 08 Feb 2016 08:17:58 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:34373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSlhW-00067X-47
	for qemu-devel@nongnu.org; Mon, 08 Feb 2016 08:17:58 -0500
Received: by mail-vk0-x235.google.com with SMTP id e185so94612936vkb.1
	for <qemu-devel@nongnu.org>; Mon, 08 Feb 2016 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=T7ZIC7ltKKEjM8S80IjbcdsmLzZD0TU7UE11AsnptW0=;
	b=hMB7ws4kZtmDnGC7KdwDldVA//J9cOnWXZOaUXPgOI5UwHsmQT+vh9jmWVgR5FrzDy
	ARxLx7E2Nr52dJv6rGxUdl/2DITFVVHLTry5/yHJPQqCM0/NNKbigODUUDL5UuxpvyDD
	h/DjMezKo0HhCHAmx6H6d6C+kNfhTVFWB4QCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=T7ZIC7ltKKEjM8S80IjbcdsmLzZD0TU7UE11AsnptW0=;
	b=JdNOxYB/HWntZ/UHYnhMAxgNbGJ9mANbu8fnuBUIPLb4ot7cuiIKWqPpq3SNNBf4U1
	M12aUplC4ne0pEht4MNDPqHDKczlEMea9Im83HeSTE/nFmSOgIAD+Wt9c7DWymdPKOjQ
	ZIvXlDr1si51xL8CGUQuJoyd0HEH0wQVKWP0KRXmzby70AJk1TGpvfW2Yj8Ln/Wpqv/B
	FXwT/gdBSKCYzeJ5IJ2oJF/L9TkI0pQAHGROV4b+LulCOHLWm9TAmGQqFj1oqlEb/TEw
	p2gbGi6k18Sxc2HufEmyqv/7hVz9drsKr8W86eKHVTI+47YS/zLell6XJkVVst5EHIhV
	LtqQ==
X-Gm-Message-State: AG10YOTIY99Yd2nF+FvJmzREEqdiXgnesf4oNNaCN0RVdL2ybrwtaekpF3hpHy2HxGa0Ytw8sio4JwhQkY4urU5I
X-Received: by 10.31.141.2 with SMTP id p2mr20359658vkd.37.1454937477476; Mon,
	08 Feb 2016 05:17:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 8 Feb 2016 05:17:38 -0800 (PST)
In-Reply-To: <1454683067-16001-1-git-send-email-peter.maydell@linaro.org>
References: <1454683067-16001-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2016 13:17:38 +0000
Message-ID: <CAFEAcA9RBtFw75=UF3tSS8uK-EF7OuhSDVfNdhuHOx-8KiPdyg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: qemu-arm <qemu-arm@nongnu.org>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 0/3] target-arm: Fix IL in
 syndromes for FP and copro traps
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dEpPBhYd2B+u

On 5 February 2016 at 14:37, Peter Maydell <peter.maydell@linaro.org> wrote:
> This series corrects a bug I noticed while reading the code.
>
> In syndrome register values, the IL bit indicates the instruction
> length, and is 1 for 4-byte instructions and 0 for 2-byte
> instructions.  All A64 and A32 instructions are 4-byte, but Thumb
> instructions may be either 2 or 4 bytes long.  Unfortunately we named
> the parameter to the syn_* functions for constructing syndromes
> "is_thumb", which falsely implies that it should be set for all Thumb
> instructions, rather than only the 16-bit ones.
>
> Fix the parameter names to a less confusing "is_16bit", and
> correct the places where we should be passing in 'false' rather
> than 's->thumb' for syndrome construction, which are the
> coprocessor, VFP and Neon instruction traps (all these are always
> 32-bit for Thumb).
>
> The calls to syn_aa32_svc() and syn_aa32_bkpt() correctly still
> use s->thumb, because for SVC and BKPT the Thumb encoding is 16
> bits but the ARM encoding is 32 bits.

Applied to target-arm.next, thanks.

-- PMM
