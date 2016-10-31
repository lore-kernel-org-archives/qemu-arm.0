Received: by 10.80.166.35 with SMTP id d32csp98543edc;
        Mon, 31 Oct 2016 04:59:14 -0700 (PDT)
X-Received: by 10.55.6.11 with SMTP id 11mr15607604qkg.29.1477915154186;
        Mon, 31 Oct 2016 04:59:14 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t63si5891022qkh.15.2016.10.31.04.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Oct 2016 04:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34846 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1BFB-0007ik-LJ
	for alex.bennee@linaro.org; Mon, 31 Oct 2016 07:59:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1BEA-0007AK-CV
	for qemu-devel@nongnu.org; Mon, 31 Oct 2016 07:58:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1BE9-0006Tl-Nr
	for qemu-devel@nongnu.org; Mon, 31 Oct 2016 07:58:10 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36737)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c1BE9-0006Tb-J5
	for qemu-devel@nongnu.org; Mon, 31 Oct 2016 07:58:09 -0400
Received: by mail-vk0-x229.google.com with SMTP id p9so530519vkd.3
	for <qemu-devel@nongnu.org>; Mon, 31 Oct 2016 04:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3m9EUeN+mcMk/KuJUECpoMdtr79jc4wy7x9HJPlufyU=;
	b=NCAQs5E8YLHtM1U9pK1RkvQDm6Z9JZcHIgR3RPLiQyxmz2IYgAdb1Ki6SlB6dzGaTv
	VRyYtIU0vHrazIVWGYyrBKqwnYrHd7p10oet0+f+k6YDfmB3fBRyaf4NrEs0TsJpnSzd
	1APYgOQwbfoPu+9vmgRhpzO6Pr7NBOWEpzhA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3m9EUeN+mcMk/KuJUECpoMdtr79jc4wy7x9HJPlufyU=;
	b=UJT4lFkfkaCnf/tkdeoZBYmm3Y82WUgMP0YDkGkwm4DkYaoixMY3ogLflkB6Lj1dF7
	ZAuoAjd2O6cHS2zOVUjGeYFfE6ieOOReJMFzAydcmaYIZjzwloAfO1bxhWd27Y3qGo/9
	XSjEUMqsgrtc9apTDXMUXqistvW4qNUTHEkTWP5lnL3wOtROrsmb7+LVjNEx7OBs3ArA
	M2uUAjieVvMxU4p8eDS9TAAcju9GEdTEQDttv8kHikgOjZvKFyVgIxaWVwfVNadsx8VS
	4hSf5UxffvMYLmBaFfGRQrjZCiKQb8QD2i79pkLwc6wJ6ypNIPguBM1FyzZ0spnFAYZR
	24uQ==
X-Gm-Message-State: ABUngvcNxhI95DGG6v9HyNEUA73/IyNnB5gLvYVOQunzQwmsTZznVQkid2RRhgjb/LXMy4b7mtKdoIf/BzSH4UuC
X-Received: by 10.31.16.36 with SMTP id g36mr13843859vki.170.1477915088813;
	Mon, 31 Oct 2016 04:58:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 31 Oct 2016 04:57:48 -0700 (PDT)
In-Reply-To: <AM4PR0701MB21305EDB089D08768B7575EAFEAE0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1476771285-3680-1-git-send-email-marcin.krzeminski@nokia.com>
	<CAFEAcA-QTUvqJvHwd11-UhGGiatH4PKkupthGh9Xzw3C1vHRGw@mail.gmail.com>
	<AM4PR0701MB213042F89412D6561736F11FFEAE0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
	<CAFEAcA-KpYEiw3uCMh8gKMyP=OxX2Q35pQ8PCEHRFXkadcXYwQ@mail.gmail.com>
	<AM4PR0701MB21305EDB089D08768B7575EAFEAE0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2016 11:57:48 +0000
Message-ID: <CAFEAcA-hK_ELTaqqdz_NeGFB6QWFMwXn6ToZnDG0E2-V+qTDtw@mail.gmail.com>
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-devel] [v2] nvic: set pending status for not active
 interrupts
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
Cc: "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HdmUYKH+RC1O

On 31 October 2016 at 11:56, Krzeminski, Marcin (Nokia - PL/Wroclaw)
<marcin.krzeminski@nokia.com> wrote:
>> "after exiting interrupt handler" is the wrong condition to check.
>> You need to:
>>  * cause the interrupt line to be set
>>  * enter the interrupt handler as a result (int becomes active)
>>  * cause the interrupt line to be lowered (while in the handler)
>>  * cause the interrupt line to be set again (still in the handler)
>>  * check the interrupt pending state (still in the handler)
>>
> I performed this test, and when we are in interrupt handler (constantly
> pooling pending bit) interrupt is re-pend just after line is set again.
> V3 behaves in the same way.

Great -- thanks for checking.

-- PMM
