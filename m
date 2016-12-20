Received: by 10.103.86.17 with SMTP id k17csp206446vsb;
        Tue, 20 Dec 2016 05:33:07 -0800 (PST)
X-Received: by 10.233.221.130 with SMTP id r124mr8213008qkf.183.1482240787154;
        Tue, 20 Dec 2016 05:33:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q69si2409418qki.161.2016.12.20.05.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Dec 2016 05:33:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJKXQ-0000r0-S1
	for alex.bennee@linaro.org; Tue, 20 Dec 2016 08:33:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cJKXJ-0000jM-Kr
	for qemu-arm@nongnu.org; Tue, 20 Dec 2016 08:33:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cJKXI-0001kJ-QL
	for qemu-arm@nongnu.org; Tue, 20 Dec 2016 08:32:57 -0500
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:36704)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cJKXI-0001k9-Jo
	for qemu-arm@nongnu.org; Tue, 20 Dec 2016 08:32:56 -0500
Received: by mail-ua0-x230.google.com with SMTP id 88so20213197uaq.3
	for <qemu-arm@nongnu.org>; Tue, 20 Dec 2016 05:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=02B8DUf3rvj8SRpH/oPpKWu5Zm19kd6/1voYHaJbDis=;
	b=AtR3ELTmHud5dJcwgXIFmWEWsvxEFaI5t36ONFy2YgFjDPWPi+DKSnZSQm+9Dxxuvq
	WNbQFoMRn47sKQyR3bBoTK1s4frTk6LDwEEhjQonB5RO7uCuNeuwyUzt7zcHyPf4AmpD
	q9ZtSaoJnN3bHTfZSD8jm9K800knlhNh28WrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=02B8DUf3rvj8SRpH/oPpKWu5Zm19kd6/1voYHaJbDis=;
	b=Q+EDgFoiokc+P9XF3rxd18/BbpAm0VFIpOMrJHj4flfFmkPcAbC/72+52ETDyEmnF/
	2IBbth8eLsvWiMvxoFUyl3AntcHAxlktYA+hZ69sGHZ1fmHz5+r3VVlqy+V3neTT9H91
	IwHYnNk9pOxaFppB/8/4P00YLkLKsvoQRspz2zzCeWnSREfom9WM9eOrVBJ5n+cw3xPM
	5fHuslUjru4lpPHx3ZM2trakHzGNvqN0IxtRdr9T6VrwUl6zX5IvAtoooUXNLlI14a4t
	NKDmEH19RUFxi2+21xNEfcE5zZX0QJtTsSE/hEUlaT+78BY3WGZmOsJpq23YjYi92858
	+y9Q==
X-Gm-Message-State: AKaTC01pio0K9AI4UMs7Q6+6SGT0yPHNFxtbRCVDywRPerkRIXLWi/O5QrjI39NtXjnNcLTUCfspxSazQcrPFakS
X-Received: by 10.176.88.65 with SMTP id p1mr16923539uac.175.1482240775715;
	Tue, 20 Dec 2016 05:32:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 20 Dec 2016 05:32:35 -0800 (PST)
In-Reply-To: <CAKmqyKNXugCpkY_oHv=256wP5nve9hcsGep21UQuwyLE_mm99A@mail.gmail.com>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<1481625384-15077-23-git-send-email-peter.maydell@linaro.org>
	<20161213161152.GN9606@toto>
	<CAKmqyKNXugCpkY_oHv=256wP5nve9hcsGep21UQuwyLE_mm99A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Dec 2016 13:32:35 +0000
Message-ID: <CAFEAcA8nJfyQZHQCrmNkjBHOF05qErh1OJeRzcM_8obYvYivbQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 22/23] target-arm: Enable EL2
 feature bit on A53 and A57
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
Cc: Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BJdSsK9OicCG

On 19 December 2016 at 22:04, Alistair Francis <alistair23@gmail.com> wrote:
> On Tue, Dec 13, 2016 at 8:11 AM, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
>> On Tue, Dec 13, 2016 at 10:36:23AM +0000, Peter Maydell wrote:
>>> Enable the ARM_FEATURE_EL2 bit on Cortex-A52 and
>>> Cortex-A57, since this is all now sufficiently implemented
>>> to work with the GICv3. We provide the usual CPU property
>>> to disable it for backwards compatibility with the older
>>> virt boards.
>>>
>>> In this commit, we disable the EL2 feature on the
>>> virt and ZynpMP boards, so there is no overall effect.
>>> Another commit will expose a board-level property to
>>> allow the user to enable EL2.

>>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
>>> index 0d86ba3..bc4e66b 100644
>>> --- a/hw/arm/xlnx-zynqmp.c
>>> +++ b/hw/arm/xlnx-zynqmp.c
>>> @@ -258,6 +258,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>>>
>>>          object_property_set_bool(OBJECT(&s->apu_cpu[i]),
>>>                                   s->secure, "has_el3", NULL);
>>> +        object_property_set_bool(OBJECT(&s->apu_cpu[i]),
>>> +                                 false, "has_el2", NULL);
>
> Hey Peter,
>
> We would like this to be settable. I think just copying the s->secure
> (same as EL3) should be fine here.
>
> Let me know what is easier for you, if you want to just add an extra
> patch to enable it or if you want me to send a patch doing it?

I'm not really set up to test the xilinx boards, so I'd rather
let you test and send the extra patch to enable it for them.

thanks
-- PMM
