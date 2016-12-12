Received: by 10.25.205.13 with SMTP id d13csp1578011lfg;
        Mon, 12 Dec 2016 03:22:32 -0800 (PST)
X-Received: by 10.200.35.250 with SMTP id r55mr91684440qtr.161.1481541752458;
        Mon, 12 Dec 2016 03:22:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id l37si26098708qtl.48.2016.12.12.03.22.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Dec 2016 03:22:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGOgh-0005U1-Sw
	for alex.bennee@linaro.org; Mon, 12 Dec 2016 06:22:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGOcA-0004LF-9i
	for qemu-devel@nongnu.org; Mon, 12 Dec 2016 06:17:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGOc5-0008Fz-GJ
	for qemu-devel@nongnu.org; Mon, 12 Dec 2016 06:17:50 -0500
Received: from mail-ua0-f181.google.com ([209.85.217.181]:33174)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cGOc5-0008Fb-Bg
	for qemu-devel@nongnu.org; Mon, 12 Dec 2016 06:17:45 -0500
Received: by mail-ua0-f181.google.com with SMTP id 20so78258850uak.0
	for <qemu-devel@nongnu.org>; Mon, 12 Dec 2016 03:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WpHlcqPhuP/Mtfwey5jAwJSSDf32M2LARjqtdzZbyZ4=;
	b=SWSA4CMqSAjlppJCvzvL9+l/ppVi1G0iyJ7cz6A6Wx/dEm33oVquQFd5xX4CoI9sYn
	2o/Otb5mbSuxPAZbW7ldDkYups4s2P7/j3dVNKE8XnvR5B6YHzdIzJXFEoBhrUp1KgME
	T0DX6ZKbfA2aaLUz1062twSTnKChYrSCzBWX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WpHlcqPhuP/Mtfwey5jAwJSSDf32M2LARjqtdzZbyZ4=;
	b=dVhej/5DqpR5BmF5vrP1tHQCLCSAaKpwk8E115bIgvuPS685+8BAKP5x+hfTHplGMT
	/XlOrrjIGU90HITw1dfFvzygu0dJeRCju411J9Ku5N3BYsMy45Bx9xb9rtgjpvdEbPje
	Y1kyV7vU30Ibcdo2aB28HvBYBt7cUMHdsE+kTSwHsUSYuaETn7KOeOEmO5m2yUmWGFGu
	373yhJ91p9br6XlTp9PEezxh3flUcewz+zblGwFINeZ++TAs+c6oVMFykyUMPo2u32ol
	6N8vqWF4aEW30wmtlb1gIOE7b2Six6/4yYlbpRzmVoKmY7SABHwaJSELqNzrmO3y879z
	G28g==
X-Gm-Message-State: AKaTC01qca6S8KJ80N8HiYTNPeEV+Ambh06kKwp94V36vtNubzinnocv/GkgH2btqFNDS0HRvQj2EScfDJF5+Y3p
X-Received: by 10.176.3.137 with SMTP id 9mr61401634uau.120.1481541404745;
	Mon, 12 Dec 2016 03:16:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Mon, 12 Dec 2016 03:16:24 -0800 (PST)
In-Reply-To: <20161212105650.3nguwm6yswqwlzqc@kamzik.brq.redhat.com>
References: <1481301020-21777-1-git-send-email-peter.maydell@linaro.org>
	<1481301020-21777-4-git-send-email-peter.maydell@linaro.org>
	<20161212105650.3nguwm6yswqwlzqc@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Dec 2016 11:16:24 +0000
Message-ID: <CAFEAcA9DNr=DOrwpQBGgpXQZvmCXsNhVTk4mGALqkaP4McEY4A@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.181
Subject: Re: [Qemu-devel] [PATCH 3/4] hw/arm/virt: Rename 'vbi' variables to
 'vms'
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /mDLIgMppsVM

On 12 December 2016 at 10:56, Andrew Jones <drjones@redhat.com> wrote:
> On Fri, Dec 09, 2016 at 04:30:19PM +0000, Peter Maydell wrote:
>> Rename all the variables which used to be VirtBoardInfo*
>> and are now VirtMachineState* so their names are in line
>> with the type being used.
>>
>> Apart from the removal of the line 'VirtMachineState *vbi = vms;'
>> this commit is purely a search-and-replace of 'vbi' with 'vms'.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/arm/virt.c | 489 +++++++++++++++++++++++++++++-----------------------------
>>  1 file changed, 244 insertions(+), 245 deletions(-)
>
> We obviously need this patch, it's just a shame that git history
> digging will become a bit harder after it's committed. While we
> may be pretty confident we won't need another patch like it
> (vms forever!), we could add another patch or two to help prepare.
> I see that nearly half the uses of 'vbi' are for 'vbi->fdt'. We could
> add local 'fdt = vbi->fdt' aliases in all functions that need
> it. We can do the same with 'vbi->memmap/irqmap', which would
> eliminate another 57. Finally machvirt_init could easly replace 9
> 'vbi->bootinfo's with a bootinfo alias. That would only leave
> about 60 lines (currently, and not including the new local variable
> definitions) that would need to be changed on another renaming.
> Of those 60, 45 can't be changed, as they're referencing just 'vbi'.
> So we'd only leave 15 lines exposed to risk of additional renaming
> churn.

Well, we could, but to be honest I don't really see that much
benefit from all the extra work...

thanks
-- PMM
