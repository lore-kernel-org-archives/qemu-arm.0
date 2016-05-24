Received: by 10.25.30.65 with SMTP id e62csp827827lfe;
        Tue, 24 May 2016 09:37:45 -0700 (PDT)
X-Received: by 10.55.111.66 with SMTP id k63mr4402512qkc.2.1464107865658;
        Tue, 24 May 2016 09:37:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x41si3270912qtb.45.2016.05.24.09.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 09:37:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5FKy-0000BU-Uj
	for alex.bennee@linaro.org; Tue, 24 May 2016 12:37:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FKv-00009H-7S
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FKo-0006NU-2i
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:37:40 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:35151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FKn-0006NE-Uu
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:37:34 -0400
Received: by mail-vk0-x22d.google.com with SMTP id f66so29325704vkh.2
	for <qemu-arm@nongnu.org>; Tue, 24 May 2016 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EPQW9RZM3KLDug3lBIw7G5c/l2lMYo0ynbVmh91I9UI=;
	b=KwHCwEpj9dVnblA05T/jojs3rrzjLYqOFiji7Lyhxj1Kho+CmoKkG52ltaoCawt0Ez
	S448k5kuWY0w3K3K0HmShWHiiE/AXzxW2th1a1aCADPjDxJSMtSVJKMKFlEPbu6W24ab
	TlwWm+7f2clAxDqCr2jncsiFV7ttzEyw+ssTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EPQW9RZM3KLDug3lBIw7G5c/l2lMYo0ynbVmh91I9UI=;
	b=hCKurvVJwsS8CgyuOEQAzJU9ASet1X8p/HbYhS3Xrl6rUjhgn0xfEpRJ5TDxYWlMdO
	dRXRE02ZtBvUGlrahA272LSsoiinIP3qLmS/u1L2bFkbBiLf+F5vlcPMGgJtak82OcwW
	5dElOgmeh0eVKnCSlQvuaEfKPZf/lm5nKNHmicKRjiiYzlSxhik/yfsdFbQAqZr1OauD
	suUipO8OCZEyoCOMxeFq9NWaPHVpm9kbyrEe3cCLCuF0idBqi41PqadK/+6MnFimpF/+
	H+4ZgyPv7rO0mpTn4zdndOZyeXqe9UbrjETjj0w551je0rujb+piRNTIy53oWwOta21E
	xnQg==
X-Gm-Message-State: ALyK8tJH9Qclb9zBIOsovn9Ymo/W1tkj3xYFWnOWXh2WJyTJxwwfzOzGmGBf8O5mlpgvkgr96xilsyAvqHRHTEUc
X-Received: by 10.31.81.199 with SMTP id f190mr2504971vkb.139.1464107853491;
	Tue, 24 May 2016 09:37:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Tue, 24 May 2016 09:37:14 -0700 (PDT)
In-Reply-To: <20160524163204.GV16305@toto>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
	<1463698459-31312-4-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA9+ow6BAhqk5hUeoR50gUhX0TJy75r1ViUZJ-vEbLawJw@mail.gmail.com>
	<20160524163204.GV16305@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 May 2016 17:37:14 +0100
Message-ID: <CAFEAcA8dKJbZ6-uC4_MQEWPpL_-NAgwft36aLiou2hMGCN3zRA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [PATCH v1 3/5] xlnx-zynqmp: Make the RPU subsystem
 optional
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n4hSCbPko8UD

On 24 May 2016 at 17:32, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Tue, May 24, 2016 at 05:26:54PM +0100, Peter Maydell wrote:
>> Do we have to create them in the set function so we can
>> set properties before realize, or could this be deferred
>> to realize time?
>
> Yes, I thought it was recommended to avoid object creation
> in realize. But creating the PRU in realize works too.

Well, it is recommended, but only in the sense of "prefer to
do it in instance init" :-) I think we prefer not to have
complicated behaviours happening on property-set because it's
a bit unexpected (but sometimes it's necessary if later
property-sets wouldn't work otherwise).

thanks
-- PMM
