Received: by 10.25.159.19 with SMTP id i19csp44275lfe;
        Fri, 5 Feb 2016 09:04:58 -0800 (PST)
X-Received: by 10.140.109.100 with SMTP id k91mr18139700qgf.54.1454691897939;
        Fri, 05 Feb 2016 09:04:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k11si16629261qhc.14.2016.02.05.09.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 09:04:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49526 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRjoX-00063F-6h
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 12:04:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jl4312@columbia.edu>) id 1aRjoQ-0005wM-72
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 12:04:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jl4312@columbia.edu>) id 1aRjoL-0001q2-4a
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 12:04:50 -0500
Received: from millet.cc.columbia.edu ([128.59.72.250]:34659)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jl4312@columbia.edu>) id 1aRjoL-0001pg-0F
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 12:04:45 -0500
Received: from hazelnut (hazelnut.cc.columbia.edu [128.59.213.250])
	by millet.cc.columbia.edu (8.13.8/8.13.8) with ESMTP id u15H2jue009763
	for <qemu-arm@nongnu.org>; Fri, 5 Feb 2016 12:04:44 -0500
Received: from hazelnut (localhost.localdomain [127.0.0.1])
	by hazelnut (Postfix) with ESMTP id BB57681
	for <qemu-arm@nongnu.org>; Fri,  5 Feb 2016 12:04:44 -0500 (EST)
Received: from salak.cc.columbia.edu (salak.cc.columbia.edu [128.59.29.6])
	by hazelnut (Postfix) with ESMTP id DE0A182
	for <qemu-arm@nongnu.org>; Fri,  5 Feb 2016 12:04:42 -0500 (EST)
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by salak.cc.columbia.edu (8.14.4/8.14.3) with ESMTP id u15H4gWw001821
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <qemu-arm@nongnu.org>; Fri, 5 Feb 2016 12:04:42 -0500 (EST)
Received: by mail-io0-f182.google.com with SMTP id f81so134763819iof.0
	for <qemu-arm@nongnu.org>; Fri, 05 Feb 2016 09:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=sqUxn6BwjcpeSm5/y4lUTnV9fc0RqqxgbsKgSFiTnLA=;
	b=DYnguaTT2uc5Qfqbf5EcFrcMI3BXNCgTvrqnJoxIOtSfDEuDWIjVZEGWmWDgxwNWWe
	w+YObbbqp4kJhBT8PKZ4NUb2OO7Pn6vPC2mesRckW0a75zQlxIbsaGXfypY90P+SxAIj
	8YVpqxbKP12Dn7dAW8XBx61HUGJCgazjCEN2M/kAgr8Eh+aXCQCkfprBjtfiet/lNhH3
	gHQwePX2oNNOZnZ64ZbwgTnzXTnhKZdGH8y6M2K3CFDgpj/KUOF/lEGtVga6SQfnDPjF
	nRC4c2G9Js1AKBqLJkD92VKMaPZV3sDjBKHe1rBTbPYvtMIqZ1fzRQJvuT0f/k7yc8ON
	PHRA==
X-Gm-Message-State: AG10YOTSyuYOAKEpHMmrRQdN6BzlocBZQvKq2qD2BvIZlivrC6rNyenhq1pFzGgOmRPX81THBRXTOZQPDsLfl7IWjfL7LuKfHG3hVBtrwsL8A528Zlrk9GLOpbOt+X6vbmxFmiQ=
X-Received: by 10.107.11.231 with SMTP id 100mr15126290iol.165.1454691882111; 
	Fri, 05 Feb 2016 09:04:42 -0800 (PST)
X-Received: by 10.107.11.231 with SMTP id 100mr15126279iol.165.1454691882031; 
	Fri, 05 Feb 2016 09:04:42 -0800 (PST)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com.
	[209.85.223.180])
	by smtp.gmail.com with ESMTPSA id 63sm7071585ion.4.2016.02.05.09.04.40
	for <qemu-arm@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Feb 2016 09:04:40 -0800 (PST)
Received: by mail-io0-f180.google.com with SMTP id 9so135594965iom.1
	for <qemu-arm@nongnu.org>; Fri, 05 Feb 2016 09:04:40 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.6.35 with SMTP id 35mr9531742iog.140.1454691880290; Fri,
	05 Feb 2016 09:04:40 -0800 (PST)
Received: by 10.50.239.2 with HTTP; Fri, 5 Feb 2016 09:04:40 -0800 (PST)
In-Reply-To: <CAFEAcA_zOvab002hN6OCUQgg_W2v-XzLdKipQO72nZRwBuTZGg@mail.gmail.com>
References: <CAHyh4xiVysLUreprtNnKMOLf0VUH2bTsF4thPwbkeFOfpDXFCw@mail.gmail.com>
	<CAFEAcA9P7OBcL4sAnLLoppUo8q40yEeyAt_5M_MYnNgJAxB7RA@mail.gmail.com>
	<CAFEAcA_zOvab002hN6OCUQgg_W2v-XzLdKipQO72nZRwBuTZGg@mail.gmail.com>
Date: Fri, 5 Feb 2016 12:04:40 -0500
X-Gmail-Original-Message-ID: <CAHyh4xhZnEtXzwkVkrZMM6w1OPF0d2EC6NfS0FdnL1A6yy=+rw@mail.gmail.com>
Message-ID: <CAHyh4xhZnEtXzwkVkrZMM6w1OPF0d2EC6NfS0FdnL1A6yy=+rw@mail.gmail.com>
From: Jintack Lim <jintack@cs.columbia.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=001a113f9d02c8539a052b08d8c9
X-No-Spam-Score: Local
X-Scanned-By: MIMEDefang 2.68 on 128.59.29.6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 128.59.72.250
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christofferdall@gmail.com>
Subject: Re: [Qemu-arm] Adding sp804 timer to the virtboard
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
X-TUID: tC6nO3Pilkjz

--001a113f9d02c8539a052b08d8c9
Content-Type: text/plain; charset=UTF-8

Hi Peter,

On Fri, Feb 5, 2016 at 6:09 AM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 5 February 2016 at 10:52, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > On 3 February 2016 at 20:57, Jintack Lim <jintack@cs.columbia.edu>
> wrote:
> >> About the clock property, should I also add the original clock providers
> >> such as sp810 and in turn 32k, 1M and smb clocks?
> >> Or canI just use apb-pclk, which is an existing clock provider in the
> >> virtboard, for all three clocks?
> >
> > For a virtual machine the clocks are all irrelevant anyway, I think
> > (we don't actually have any kind of 24MHz clock) -- we just provide
> > them because the kernel insists that the dtb says something about
> > clocks. So I would start by just borrowing the apb-pclk and seeing
> > if that works.
>
> Having said that I looked at the code a bit more closely and I think
> it's not quite right. By default the sp804 device will have a 1MHz
> clock. So you should probably arrange to tell the kernel that via
> the device tree, or it will think the clock is running at a different
> speed from what it really is. (Or you could set the freq0 and freq1
> qdev properties on the device to make it clock at the rate your dt
> says it clocks at, but 24MHz would probably mean a lot of overhead
> with timer firing.)
>

I appreciate your advice. I'll try it!

Thanks,
Jintack


>
> thanks
> -- PMM
>
>

--001a113f9d02c8539a052b08d8c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<br><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Fri, Feb 5, 2016 at 6:09 AM, Peter Maydell <span dir=3D"ltr=
">&lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.m=
aydell@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color=
:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><span class=3D"=
">On 5 February 2016 at 10:52, Peter Maydell &lt;<a href=3D"mailto:peter.ma=
ydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt; On 3 February 2016 at 20:57, Jintack Lim &lt;<a href=3D"mailto:jintack=
@cs.columbia.edu">jintack@cs.columbia.edu</a>&gt; wrote:<br>
</span><span class=3D"">&gt;&gt; About the clock property, should I also ad=
d the original clock providers<br>
&gt;&gt; such as sp810 and in turn 32k, 1M and smb clocks?<br>
&gt;&gt; Or canI just use apb-pclk, which is an existing clock provider in =
the<br>
&gt;&gt; virtboard, for all three clocks?<br>
&gt;<br>
&gt; For a virtual machine the clocks are all irrelevant anyway, I think<br=
>
&gt; (we don&#39;t actually have any kind of 24MHz clock) -- we just provid=
e<br>
&gt; them because the kernel insists that the dtb says something about<br>
&gt; clocks. So I would start by just borrowing the apb-pclk and seeing<br>
&gt; if that works.<br>
<br>
</span>Having said that I looked at the code a bit more closely and I think=
<br>
it&#39;s not quite right. By default the sp804 device will have a 1MHz<br>
clock. So you should probably arrange to tell the kernel that via<br>
the device tree, or it will think the clock is running at a different<br>
speed from what it really is. (Or you could set the freq0 and freq1<br>
qdev properties on the device to make it clock at the rate your dt<br>
says it clocks at, but 24MHz would probably mean a lot of overhead<br>
with timer firing.)<br></blockquote><div><br></div><div>I appreciate your a=
dvice. I&#39;ll try it!</div><div><br></div><div>Thanks,</div><div>Jintack<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div><br></div></div>

--001a113f9d02c8539a052b08d8c9--

