Received: by 10.25.21.96 with SMTP id l93csp1114881lfi;
        Fri, 24 Jun 2016 08:52:02 -0700 (PDT)
X-Received: by 10.233.216.133 with SMTP id u127mr5768136qkf.203.1466783522160;
        Fri, 24 Jun 2016 08:52:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g65si5306546qtd.118.2016.06.24.08.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 08:52:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGTOj-0003HB-Ii
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 11:52:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGTJx-0006A8-9Z
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 11:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGTJv-0003lj-DW
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 11:47:04 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34304)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGTJu-0003lU-T6
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 11:47:03 -0400
Received: by mail-vk0-x229.google.com with SMTP id c2so125588303vkg.1
	for <qemu-arm@nongnu.org>; Fri, 24 Jun 2016 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/fKKhFtgC1Cne5GvsTpqIFQdeismEg/L5+zN9BIkVFI=;
	b=MBlQd4D9gIJNYsL+3dfnYWfpRd6oTNwMvoXBH6bdwFtOER/ufmHCl01XfuehgwRl4x
	F9uKzJ/Tx5KqFMwRMGTrN5Jce1frOvWPghL0tyQBcyVeQJ8wLWN+ykh/PLzA1R11VaJT
	+MUX5VbfvrYRWt9SIn3a2GqUD5pBUERgEDxKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/fKKhFtgC1Cne5GvsTpqIFQdeismEg/L5+zN9BIkVFI=;
	b=Kkyj4KIK5dsmM2Vu6qwU/u9UkYbiWcMUw1UK9ppcycfKzRL/o3hbJzWTbtnu/WdCMo
	PVxPHKXIVtSrhZd1K7xTGXWZQbrvxbe2uiLRMHsFCBDeHu2hIdBxmMV3+YQ0ugTme4b4
	6BAauDUhzKwaELQAnjlY1keWzkvSWo4WS9v142ScXB62yoqmpCG7/k1nsiDQY6xDpHxl
	sX3S2c4Oyjvwt13duiYBdCjbGGZsKxNhFwD9nDnCWFojUjd3e/o7eFixhq6LyHoGEkU9
	YRP1E99TOzBB0LopU2yyv2mjm9KvljOX5P5BZjGGV2vUrOOktAgT4loY2hju0eMMlsPt
	FJFw==
X-Gm-Message-State: ALyK8tLCjkhgKvuoseaVl/oKlvcvhsuBzpIjc15R3lrcu0LxEzVloIVX33qiBNIjFbV0QkEKp2CsUOzA1o0VZx1R
X-Received: by 10.31.109.197 with SMTP id i188mr2834045vkc.157.1466783222431; 
	Fri, 24 Jun 2016 08:47:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 24 Jun 2016 08:46:42 -0700 (PDT)
In-Reply-To: <CAFEAcA-yDXDjNzHKRc+Tkt3SUZVRf86hxRcJi43RBom+9hmbYQ@mail.gmail.com>
References: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
	<CAFEAcA-yDXDjNzHKRc+Tkt3SUZVRf86hxRcJi43RBom+9hmbYQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 16:46:42 +0100
Message-ID: <CAFEAcA9t_F+baqqn0ecoUkszuERsR4njS7b9C3vYPBwjhOwWrA@mail.gmail.com>
To: Tsung-Han Lin <tsunghan.tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-arm] [RFC] target-arm: fix semihosting ram base issue
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MbmMcZfVyq43

On 23 June 2016 at 18:26, Peter Maydell <peter.maydell@linaro.org> wrote:
> I suggest you start by sending a patch which just fixes
> the 64-bit case to write 64-bit values, since that's the
> easy bit.

I ran into this bug myself this afternoon, so I wrote
some patches which fix this part and will send them out
in a minute.

thanks
-- PMM
