Received: by 10.25.205.13 with SMTP id d13csp719122lfg;
        Tue, 17 Jan 2017 14:16:25 -0800 (PST)
X-Received: by 10.55.107.71 with SMTP id g68mr35497494qkc.259.1484691385513;
        Tue, 17 Jan 2017 14:16:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b46si17607453qtb.31.2017.01.17.14.16.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 14:16:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTc3C-0000p3-Q5
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 17:16:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTc33-0000nc-Ok
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 17:16:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTc32-0005Bu-U6
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 17:16:13 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:36747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cTc32-0005B0-Nv; Tue, 17 Jan 2017 17:16:12 -0500
Received: by mail-wm0-x241.google.com with SMTP id r126so41870853wmr.3;
	Tue, 17 Jan 2017 14:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GlE1uPvowifBnkI0jYss6FbBxZVjn9Kb0MdszWZYV6o=;
	b=gBzPz881PgGaHe39aBFFBTSAh0IBKZe4+P6dcB/D2Ql0ufM1oD++c+Q0ze7DlZWmgf
	zu4HrwaPXbDCfV7K7o+TQ8lhreJDHQ7gO7sw+C8tEl1YTD1CYFS5ervFnpJmsyOxFuaT
	0cHo+mfUP4zL2d9E7Mv5xfQrW6xVKwM+aCgl+eAtEF4vXAa1H7u0JKJLkZh68GdIWkQK
	wQYfLD1pgDb1ONFpJnzhuWuovI/wm1UkbTKLaVsV/FgJf4xLp+FCE0Vt6159pEsJ3aBI
	CA+StEJojg4j0N6wrOV8XkiLjFc+xUvFJ1IaGt8PxHqhtQAG/n3AuGbQm11Lf1VIIolt
	a/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GlE1uPvowifBnkI0jYss6FbBxZVjn9Kb0MdszWZYV6o=;
	b=Pwc25Dr35mX7/VBBDhqOmdGRcAcc6eaMLJtDLAzbhbwUfRQ3w0jYpqkvTqoNQ4UfFj
	6qfFx5fLazSYBnTW3a8NF9F1+o1MHZS7AlTh+mbm0t3/Tdn5ELqcEHY4OQunoasWtTvW
	W+/363zjCUnF57fXksZo/gmnWNk+acIngZexjqSrI/Ovt0joPelfK997SPzCUmYhBRbw
	PCMY1nZnkmd5HqS853Oyo88n/QnHRKZdNonoxpBPXPaD0gYy6W4E7YQp2km0fnV1FkB8
	Yn7bfNzBSknfTLs7ZfN98n0SrWv3C7r9hGqK6P9+DfNRLj2lrhHOCiq9uRUgh2QRV3VV
	xyPw==
X-Gm-Message-State: AIkVDXJe9n1p4Lzvhz8ZnsO1N+l8IUvCiQW1i0r3cDvl3PDVVGYkfagSlpCfMZmmCrl9jXXgZELnmLTDo5esSA==
X-Received: by 10.28.15.2 with SMTP id 2mr19739720wmp.66.1484691371702; Tue,
	17 Jan 2017 14:16:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.154.68 with HTTP; Tue, 17 Jan 2017 14:15:41 -0800 (PST)
In-Reply-To: <20161228131452.jt37cfqteqkhb6hn@kamzik.brq.redhat.com>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<1481625384-15077-24-git-send-email-peter.maydell@linaro.org>
	<20161228131452.jt37cfqteqkhb6hn@kamzik.brq.redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 Jan 2017 14:15:41 -0800
Message-ID: <CAKmqyKMEVtSBg7GuB1qzexkcSxrxW-xqmBPe=-zXcUkbpuapxg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 23/23] hw/arm/virt: Add board
 property to enable EL2
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Zq5yu8GwaYH

On Wed, Dec 28, 2016 at 5:14 AM, Andrew Jones <drjones@redhat.com> wrote:
> On Tue, Dec 13, 2016 at 10:36:24AM +0000, Peter Maydell wrote:
>> Add a board level property to the virt board which will
>> enable EL2 on the CPU if the user asks for it. The
>> default is not to provide EL2. If EL2 is enabled then
>> we will use SMC as our PSCI conduit, and report the
>> virtualization support in the GICv3 device tree node.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

>> ---
>>  hw/arm/virt.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 43 insertions(+), 2 deletions(-)
>>
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>
