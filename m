Received: by 10.182.105.169 with SMTP id gn9csp1231094obb;
        Mon, 9 Nov 2015 07:47:24 -0800 (PST)
X-Received: by 10.140.97.34 with SMTP id l31mr14119959qge.30.1447084044232;
        Mon, 09 Nov 2015 07:47:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o128si11495635qhb.60.2015.11.09.07.47.24
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 09 Nov 2015 07:47:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:53535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZvofD-0002HF-If
	for alex.bennee@linaro.org; Mon, 09 Nov 2015 10:47:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZvofB-0002FG-W7
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 10:47:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZvofB-00024J-0v
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 10:47:21 -0500
Received: from mail-yk0-x234.google.com ([2607:f8b0:4002:c07::234]:33214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZvofA-000249-Ny
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 10:47:20 -0500
Received: by ykdv3 with SMTP id v3so181187013ykd.0
	for <qemu-arm@nongnu.org>; Mon, 09 Nov 2015 07:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=S2LBksdiqkBeovsD89bjLKUrVzmI3CkwhYH6IgG/xjU=;
	b=zev9r8sHbdismH2Le9UTugaqxoZJBzu2uzYVzbg6HMlOTRoY+jhzK4CSMhLvRt0S24
	fBG+mKC69OzCN53xpmzRk/rnk6IiscR4okdhbIQSHhl4N0mdqTEtAEqSAU+3Du4Yuwab
	Hzx1f0AucosxqKn6yqgEsSz1WEqPjnNAzFRmrTnXkErwk2uhv7oIRTE8DifCImMX56K4
	tUZCDVvZQZbTOyyjq1h+eYSr/M9CTk3H7V0Tdz8kwnXP/dJpJuy1KidC7lS2vh5p75v+
	2v1qj1cyWBBTklWv/6VASN7xeGEaRrk9PrbAK3bbA/5r3eaz0lUDJiBOFXhpS0EzWiVI
	SCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=S2LBksdiqkBeovsD89bjLKUrVzmI3CkwhYH6IgG/xjU=;
	b=c/n+kAaTfXYk+I2rU2tgJyHKnhS/ZTx0V0zGD2kpn9Ho8F2nJD1K8Ybds2BpFauv6E
	aqeotbJra1ga2MrkT5nG+GlY3znw+Zk5tarLQHgDxGq2xjnMMDRL44OrAOBeNlxPP7JB
	RnKsCXnq4cJkaSkvqP/zNojIcHG85wcQJzs60fk1rG4v9oEAa2iJf5HsEc1k2dg19oh3
	mJLg9hma90cg7oLteR0aqwXkrp21JYqnPUdE+KhWfZ+CxgMdhb7Wj/iVi0ZbPQM4SIEm
	M2bE91GUkW0TPdx9WI38zOV+oGc5lDnG7+yscI8dT8C8MPKLV/keeOQ0fNu3TOU7BdJQ
	Me+A==
X-Gm-Message-State: ALoCoQnYZFbYX49s95Kl2Is0jNuS66tRMjMtTarXA9jC/Tw15vp38eA146FJNcIqIFm8Dq+9XgYm
X-Received: by 10.129.75.131 with SMTP id y125mr27067260ywa.48.1447084040147; 
	Mon, 09 Nov 2015 07:47:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 9 Nov 2015 07:47:00 -0800 (PST)
In-Reply-To: <87oaf3jww7.fsf@blackfin.pond.sub.org>
References: <1446909925-12201-1-git-send-email-drjones@redhat.com>
	<CAFEAcA_Pk7_MourHFc-SLCQ-StTfc8ssZ_Kz6HahE5=9bxMHyA@mail.gmail.com>
	<87twovpqg1.fsf@blackfin.pond.sub.org>
	<CAFEAcA8rsWg=9ZV75ZmJYPrPznUH-bQObvzHUem1Tciv3_5CaA@mail.gmail.com>
	<87oaf3jww7.fsf@blackfin.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2015 15:47:00 +0000
Message-ID: <CAFEAcA8Rh9ts2r-nMGbNm7Y=SpdxL4gv0ch3CBWOHiHTRMeztg@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::234
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: error_report
	cleanups
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nFV7O+ye6y4c

On 9 November 2015 at 10:21, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On 9 November 2015 at 07:44, Markus Armbruster <armbru@redhat.com> wrote:
>>> For consistency, error messages should be a phrase, not a full sentence,
>>> let alone a paraphraph.
>>
>> This is in direct conflict with wanting them to be actually useful
>> to users :-(
>
> I appreciate your drive for useful error messages.  Judging from the
> error messages we got, it's a rare thing.
>
> Let me rephrase.  The error message proper (the thing emitted by
> error_report()) should be a phrase, and it should be short and to the
> point.  It can be followed by hints.  Compare:
>
>     qemu-system-arm: Unable to determine GIC version supported by host. KVM acceleration is probably not supported.
>
> and
>
>     qemu-system-arm: Unable to determine GIC version supported by host
>     KVM acceleration is probably not supported
>
> I prefer the latter.  The error message proper is short and to the
> point.  The hint points to the most probable cause.  Sensible line
> lengths.

I agree that the latter is preferable; I had been under the
impression that we weren't allowed to use newlines in error
messages, though...

> By the way, the error.h API supports this message + hints convention
> since commit 50b7b00.

Thanks, I had missed this useful improvement to the API.
How does it work in cases like this where we don't have
an Error* to fill in?

thanks
-- PMM
