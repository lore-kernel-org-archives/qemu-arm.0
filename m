Received: by 10.223.150.237 with SMTP id u100csp3172068wrb;
        Mon, 6 Nov 2017 15:33:54 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Q0M8/iswZcwgjFJ+lloTBNkbOO4mwICJcCftaNM7XMda1CzXd9x2q8gw9Iy3YPohNj2edM
X-Received: by 10.37.209.215 with SMTP id i206mr10831299ybg.395.1510011233927;
        Mon, 06 Nov 2017 15:33:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510011233; cv=none;
        d=google.com; s=arc-20160816;
        b=Du3SAjSkdPriYdhAICpfXIQrgt39gT6xee2hjDoAH8LpJ4t825jepjTAPilZ9+nKpV
         11AjdwGju4hIsK1rban9XiqajHNl9itJDnAdncnwQTUGmj72IP+MHomKrRGujHm73/tR
         9xH70M330HjV7ds+KABcn66IqYas8joudGSKPW0B5DRIN5fI/S2chqCdhuYh2XKDO7wi
         mTNcBYpD//5/XKTD5KRQWlyoft0JP35EqjKwOurKLTQEdPEVM1c/TJwig+RMFhWJYGBg
         PdDWPdz6e7tQSu2eY1L2dOdp534ChqgzCmjE3/Flth5mwTNDiSMGqfpUFQPlPSzEDS7L
         roNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=CAbaqC/0Jkryy1DkoNnLcugWdjRLzCZk+Z2NsvGLZPc=;
        b=endAgZWuUlSK81r+ANJd8phT8nAvWE7tUrwnrygXDY9UsZctcB2oO5wR92+eRjrTne
         SsE5ktxoaGegpz4Vwm4qdRqhFZJg4iQ/Vy4KP0atYrb8seo6vAI1cwD3ZlrcJ4+PgUYS
         7zlsvcrF59THqjc3NSQdVK7K7Vtnk1+q816JlE/tOMgs4Df9lx78si1x6C/3aYT93vhf
         BxMWq6lcWifP0hym8HMXtS5y5bz8HMFDrIDzYfvzJp9+1/f8KAhWlE6xvyztMVs7VBy8
         iMXcZ3ZjeDUcg3CJ3Ez80WcN210D37uhF5NnNZNbN7KsSA64GzoSPBvguOvpomA1n0K3
         d/8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nxwPHJVo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c82si2757767ybb.547.2017.11.06.15.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 15:33:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nxwPHJVo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBqtt-000055-C3
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 18:33:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eBqtg-0008Vo-MA
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 18:33:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eBqtf-0002WH-NP
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 18:33:40 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:52356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eBqtd-0002Vd-EC; Mon, 06 Nov 2017 18:33:37 -0500
Received: by mail-wm0-x22e.google.com with SMTP id t139so329516wmt.1;
	Mon, 06 Nov 2017 15:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=CAbaqC/0Jkryy1DkoNnLcugWdjRLzCZk+Z2NsvGLZPc=;
	b=nxwPHJVonO6Lmulro8c7eAL5JLsWapboCggfkGhlohC7CnL3wSkgOlhmql3WpwrPiA
	Cz4S9foBcT/7g8YnmjslC0PDW7Ce2pIUYHx3ztd+3NBweRAj4x2b81wqqGfKpJGMQ0xB
	cx4oteBrLNkyb9DKjK3+2tXF6qgR0SiVXqNSTN+CY93Wthddmkp0zbDEaoGipXleHGj6
	MWeBvMY3u3+1PxHTeE1GNQDEnehxMOd3WJ5TYgPTCra7n1r/entZJXWB0Ame8GUfCoCi
	B7f6m55OECRo0SIi+wjYkHokgHJo0lhieepavDt2SV6l//Ypa3I+J9SSml0bq8DU+RcE
	9Ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=CAbaqC/0Jkryy1DkoNnLcugWdjRLzCZk+Z2NsvGLZPc=;
	b=CYXZRcFMcMDHepLAKo0PYHX5Xsr2lqdkDhI51kk68/SHNUPep0q5nxTgQNfTDi7vsU
	cEhMgAEtjVJpTidDjAABdHqeVNY7Pl1JyBnXL5m46u7rric9X4XihGCYHQDsaQ9FKWWf
	1gNk+rPE9ugmlbbUsTNJwtEhDLSnOJvhLRhC5ZCmd7G1iG+tZlN6Roix59jzXe+CnuFK
	awnGbjy2bFfks0c0mfVqriBqHcN8s5GXmu3Iun7qvL4kkQ8qQdAy870k841Y4aJ7qHKr
	VtxYqPa41+feXOgKyDXUlT6tT/N/d9f6DSs0WmNtRqd6Cx25oav4ioLXAAC2u9k6aKr3
	rveA==
X-Gm-Message-State: AJaThX7UkhZq67nmcKIcjPQS7IhsxohrsQ1n4YNYjTTwrVIWyh/hrVdv
	buiQ9NRYNiXrivVf5qTJSML/wlSAGkMMl+7itfU=
X-Received: by 10.28.230.77 with SMTP id d74mr5860674wmh.75.1510011216323;
	Mon, 06 Nov 2017 15:33:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Mon, 6 Nov 2017 15:33:05 -0800 (PST)
In-Reply-To: <20171106232145.GA25246@flamenco>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
	<20171106141022.GO3111@localhost.localdomain>
	<20171106215454.GB2152@flamenco>
	<CAKmqyKOSOHdpzfu_WMPWo6Mh_kfmYhem0nR=BD3_hUws0tGEww@mail.gmail.com>
	<20171106232145.GA25246@flamenco>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 6 Nov 2017 15:33:05 -0800
X-Google-Sender-Auth: UNOcId2eHVvnsYrk3tK2eepJlPw
Message-ID: <CAKmqyKM20ibTxSFQ5FE_fzgOkcHfjXmrK36mpKswz=ZPwfMshA@mail.gmail.com>
To: "Emilio G. Cota" <cota@braap.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw: add .min_cpus and
 .default_cpus fields to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GQ04/BLPgnNm

On Mon, Nov 6, 2017 at 3:21 PM, Emilio G. Cota <cota@braap.org> wrote:
> On Mon, Nov 06, 2017 at 14:32:35 -0800, Alistair Francis wrote:
>> Sorry for the silence here, I noticed these were broken just before I
>> went on holidays but didn't get a chance to fix anything.
>>
>> For the Xilinx case I was thinking of patching the machine code to
>> sanely follow the -smp option.
>>
>> -smp 1 -> Only create 1 A53
>> -smp 4 -> Create 4 A53s
>> -smp 6 -> Create all the CPUs
>>
>> I see a lot of advantages in not forcing the smallest number of CPUs
>> to be 4 unless we really have to.
>>
>> I do see a nice advantage in being able to set the default smp option
>> to something not 1 so the default closely matches hardware, but users
>> can override that if they want to.
>>
>> So for the patch below I like the default_cpus option, but for Xilinx
>> at least I would like to patch the logic to follow the -smp option
>> instead of force a minimum.
>
> Agreed, honouring -smp would be the right fix.
> Just note that since this is a regression we need the fix to
> be in for 2.11.

Ok, I can spin up a patch for the Xilinx boards in the next day (maybe 2)

>
> I just took a look at the non-Xilinx boards. It seems simple enough to
> substitute the hard-coded value for smp_cpus, but yet again
> I see "Property" structs that I'm not sure what to do with.
> For instance, bcm2836.c:152:
>
> static Property bcm2836_props[] = {
>     DEFINE_PROP_UINT32("enabled-cpus", BCM2836State, enabled_cpus, BCM2836_NCPUS),
>     DEFINE_PROP_END_OF_LIST()
> };
>
> What is the purpose here? To enable/disable CPUs with -global args,
> just like it's done for the Xilinx boards? Shouldn't we just use
> -smp for that?

Hmm...

>
> Also, note that I don't have a way to test these boards, which
> explains why I'm reluctant to change board code. But of
> course if board maintainers step in, I'm all for it :-)

Yeah, I see.

What about if we set default_cpus to the -smp option that is expected.
Then on some of the older boards (like the bcm2836) we print a warning
in the machine init() if the -smp option doesn't match that?

That way the default args work, we allow users to specify a overwrite
but we warn them that it might not work and it ensures all boards
follow a similar flow.

Then if we can test the boards and know that -smp 1 works we can
remove the warning.

Thanks,
Alistair

>
> Thanks,
>
>                 Emilio
>
