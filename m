Received: by 10.80.163.71 with SMTP id 65csp3804001edn;
        Fri, 7 Oct 2016 07:35:55 -0700 (PDT)
X-Received: by 10.55.41.217 with SMTP id p86mr19381301qkp.241.1475850955796;
        Fri, 07 Oct 2016 07:35:55 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o188si10252972qke.147.2016.10.07.07.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Oct 2016 07:35:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsWFe-0004W3-K0
	for alex.bennee@linaro.org; Fri, 07 Oct 2016 10:35:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWDj-0003MO-1p
	for qemu-devel@nongnu.org; Fri, 07 Oct 2016 10:33:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWDg-0007Jv-Ti
	for qemu-devel@nongnu.org; Fri, 07 Oct 2016 10:33:53 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:35699)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWDg-0007Jl-NY
	for qemu-devel@nongnu.org; Fri, 07 Oct 2016 10:33:52 -0400
Received: by mail-vk0-x22b.google.com with SMTP id 192so46997887vkl.2
	for <qemu-devel@nongnu.org>; Fri, 07 Oct 2016 07:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=do7oMrFWqdbRX7Q2TXEs9J/ILcB0neoaT+kFj0F6aJI=;
	b=DKzQPBlCb88M56TvJqCIVf7d11KqDBS/yhib17MRjzJBwxvsxSIlK5wqa1651tCAC4
	1T4+/eI0vqUdZAIK2I9UGDbF6LE8alGO8XJIZf7EH/M0I2EIA21DcKEVJ60RuEuxjOFM
	28LnNR2Fq3mrgrDOV9e5S2tAI/YfBb8n3f0/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=do7oMrFWqdbRX7Q2TXEs9J/ILcB0neoaT+kFj0F6aJI=;
	b=Tbplwqa77N93xw0eiwqHB6Ln+rBSJGQ6WA0DVT8CUpkhoI5BBBavP+W1l0eY2h3Wca
	bISIjaNs8Si1lISAxpr4VLbWvxfPxR/LUilW+ucts+FU4YVTSYmIMxGmK+jisSNA3Way
	yZVQRfgVsAiyE+crnFspbFXCPSwmRWVIAB25TTekq3GbKs1gEdu+aJDs1915l1GZX7g8
	JzMh3MgbiLBvUE09350yfG21KxCYQs0za3Dm+dciazQaa4Wj2gO8cSFfrL2X9mFRI9J/
	/aAmTcqGTwMIjlDryiSdIIOlFdfI6VkLC4SMLGyULpvQwbCOOfffPioXtuJCXKFzdHL7
	k6Ww==
X-Gm-Message-State: AA6/9RlVb371g3imkmvHi68dk+YzILRVl1RKoOvbrAbG3kVtjthtR/LCJUkSQlE+RmxMOy2/+SG70eQ/K+FOF33U
X-Received: by 10.31.11.138 with SMTP id 132mr3515522vkl.165.1475850832134;
	Fri, 07 Oct 2016 07:33:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 7 Oct 2016 07:33:31 -0700 (PDT)
In-Reply-To: <20161007140959.GA1831@stefanha-x1.localdomain>
References: <1473520054-402-1-git-send-email-m.olbrich@pengutronix.de>
	<CAFEAcA9UoqKSqH+b_zF435u+pZQCdGWu_KDGFW=MH+71Q_j6ng@mail.gmail.com>
	<20160923063317.kmsbek755fcun5ea@pengutronix.de>
	<CAFEAcA-MCsLWEFWcFFQqgOxUb-su+k=tw57X2-z85k1u7+n1FA@mail.gmail.com>
	<20161007140959.GA1831@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2016 15:33:31 +0100
Message-ID: <CAFEAcA-cdT_UqrHrEjN6e2O3EuqQNid0xvSKb2mEKeh2Ytd8TA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-devel] [PATCH] hw/arm/boot: allow using a command line
 specified dtb without a kernel
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Michael Olbrich <m.olbrich@pengutronix.de>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cs1lFChUM4Cb

On 7 October 2016 at 15:09, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Thu, Sep 29, 2016 at 06:58:37PM -0700, Peter Maydell wrote:
>> I think we have two choices:
>> (1) just go ahead and remove the error-check, on the basis that:
>>  * for some boards -dtb is useful even without -kernel
>>  * -dtb might be ignored even with -kernel if the specified
>>    kernel isn't a DTB-aware kernel, but we ignore that
>>  * -dtb is ignored even with -kernel for target archs/boards
>>    which don't support or use DTB, and we don't warn about that
>>  * we don't warn about -kernel being useless for target boards
>>    that don't pay any attention to it
>> (2) add some kind of field to MachineClass indicating whether
>>    the machine can handle dtb files with/without a kernel
>>    (and perhaps also whether the machine supports -kernel at all),
>>    use that to gate the warning messages, and update all the
>>    machines to correctly indicate what they can or can't handle.
>>    This would let us give warning messages when the user asks
>>    for something we're going to ignore (including letting us
>>    fix up some of the cases we don't currently deal with as
>>    enumerated above), but it would be a fair chunk of effort
>>    for a fairly small user-friendliness gain
>>
>> Thinking about it more, I'm inclining towards the simpler
>> option (1). Paolo, do you have an opinion here ?
>
> The error check doesn't seem worth the effort.  It's a convenience
> message to notify users that their configuration is broken but we can't
> detect all the cases where it's broken.  It doesn't seem like a good
> business to be in :).

I agree, so let's apply this patch as-is; added to target-arm.next.

thanks
-- PMM
