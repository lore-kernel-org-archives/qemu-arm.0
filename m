Received: by 10.223.150.237 with SMTP id u100csp2111913wrb;
        Sun, 12 Nov 2017 21:58:23 -0800 (PST)
X-Google-Smtp-Source: AGs4zMY1eXh1u3CblLox9BJC5DwKJa9dTk+RhCoyGCANLmFUA4kT7c+ngAEdE21I1Txw9EBMrOpI
X-Received: by 10.129.84.10 with SMTP id i10mr1672290ywb.97.1510552703577;
        Sun, 12 Nov 2017 21:58:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510552703; cv=none;
        d=google.com; s=arc-20160816;
        b=VR7L+HNCPwzMsOLelcYl8oxlfkEPsQamSJwI2miftZVWzJ/6KK3r6VWSycaGz6UUvz
         YpQ0OW1YrvgHxXdF1SFW+j3K120Ev84+XnQn8gLMME7liQqcx6k7EYbyML7DlguM+1Qr
         NsOREXqmoxVz9L0dNo3RqRDVXfKrim5ocQwYFs/8LYpfrLOB8DQGYpjr6ilxnU5YGEIf
         9bvsCcpWfaoQpPZOIdvUjgVyziKSfpEpCF1gJsvwPgTyFef/Wz9vHZ46hxr2qivNBldf
         CKk68SvPR0Ga0fity92iWOLwgF43eiwpAFshbjpxSaU2G3BCDj9s8JPr3iMs1grMns8s
         kj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VAclyW+E6MviIr3rWF2HcwAvV0dTl+BrDv2wf0pntFo=;
        b=Sbqp1MNPgQJwWzu5kSfx4Woiws9pQzXjyEbDXmMS1998jKWay7LhcPHE2UyaFAI84u
         BRkErkAj3NYj+0MtCqgWrs2TXYK7kBr1Aj7YBM0PN6/XNlT1fZpwN1q+knqLl+5fm4VA
         7LAwsCulT8fdH0KVtrHqHDyry46QIQ7ZVri5jz1mN6JQ1+NXC8JoZgSOKRu+8DOQ6V3+
         mo+LaOUv8W80XFogvipob4kadCRkkBZMNQFj6OsiRZBN/4WZ7/u1f0CjN9Bkrp2GRycD
         mS64rUzksuK/EfVPvwio6cMQV4IWkHhIXlo8FJGB0N2uuK/XlWgjIis5D+h6uXzB1nFP
         4piQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fkKPt1HE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 14si1823766ybj.247.2017.11.12.21.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 12 Nov 2017 21:58:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fkKPt1HE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eE7lG-0005Q4-U2
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 00:58:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1eE7l3-0005NO-Gi
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 00:58:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1eE7l2-0004pP-68
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 00:58:09 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:54654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1eE7kz-0004oG-55; Mon, 13 Nov 2017 00:58:05 -0500
Received: by mail-vk0-x230.google.com with SMTP id s197so93504vkh.11;
	Sun, 12 Nov 2017 21:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VAclyW+E6MviIr3rWF2HcwAvV0dTl+BrDv2wf0pntFo=;
	b=fkKPt1HEtxDA5brO4eeRJebLvdGt8KlRaJIvVjVhB6B4Z9pMi++MxxEw4N2MOZUki1
	i4WN92kGNPNz1EzqZP7nqfkVS+ZM9v5Pm0NmrlK+ZH1oZxw1LMxbS551Id9wMpjg2NqC
	pzlz81PifySVGIngmQfbUbGS38umQcPTWvwi1xtsO5v8tUDLOBssaMRXQmS2Nc3433SE
	479dgBUt0+ZbhGsDz+c2U3jw1Ry6pNQ5zaf/m+3YEL43QB87S6nRhmGAR3urDgHivF0Y
	4Aqum33NveH9U71l7oAs2z5iNZD1vj3651bHwKaW7yzgIIso486J2JJz/JsnA1E+ReVQ
	ZRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VAclyW+E6MviIr3rWF2HcwAvV0dTl+BrDv2wf0pntFo=;
	b=ARe+ktWlGTusVzsjgzzntRNFUTSwOVi2LOT1QPLs9YhqucUGVxTocBDUNgaIcKWCE3
	OwYlqU22czCJy/xzSCCQ3iicq6qUzksh07q1f30T2pKZOs1LXR8aY1CqnSD7UfbkjLJX
	aKQQJIK5WWWDPQOubbUgF1wSSPklk7iDGSbFeTqLy1yWjtHvSlXcCtjcjoDanJab8z9c
	mL5BRSopae4Iq4SpkVes1MGYu8NqvAzcD2ske2YuHx+LWM6T/eVjl/kD16NpEoWJzFd6
	nodXd80nAehiyV6L2YJs6OLhxRGFc6A9nOwAN6wkvjKEh4N0yfAsJji/612y2b1hlr0W
	2Lpg==
X-Gm-Message-State: AJaThX5mGsz7OD5s2tI2okzz/HlFu+JpTAurJj5773iyDI6FvwM1LNdp
	XUadR6ionNzLfrsbakRRHp+BcvLPQCtg8+G5w/M=
X-Received: by 10.31.60.211 with SMTP id j202mr5636558vka.134.1510552684506;
	Sun, 12 Nov 2017 21:58:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.63.6 with HTTP; Sun, 12 Nov 2017 21:58:04 -0800 (PST)
In-Reply-To: <7b0613ba-5efc-0fbd-1373-664838e6682e@amsat.org>
References: <1510228971-6005-1-git-send-email-sundeep.lkml@gmail.com>
	<4beb4e47-0ff9-8251-6502-23824779edbd@amsat.org>
	<CAFEAcA-ATtAougvALVo=48p+jVx5B+Ejq60TD9dGYEQU2ReWCQ@mail.gmail.com>
	<5a7b721c-fe04-921b-b9d2-986c9930b00b@amsat.org>
	<CAFEAcA_0jvR90=N9Pd+oA2U6Yy=oF7vvNV67cEAsUYQFcup9KQ@mail.gmail.com>
	<7b0613ba-5efc-0fbd-1373-664838e6682e@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 13 Nov 2017 11:28:04 +0530
Message-ID: <CALHRZuqWzrNqrHaO-3A+_nOWLseav2U-jauAoCiN1e1yRC+ecg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a11437e042cbd30055dd6f4fa"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [Qemu devel PATCH] MAINTAINERS: Add entries for
 Smartfusion2
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
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T6DWj79fljfe

--001a11437e042cbd30055dd6f4fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 10, 2017 at 7:10 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> On 11/10/2017 09:56 AM, Peter Maydell wrote:
> > On 10 November 2017 at 00:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
> wrote:
> >> On 11/09/2017 08:55 PM, Peter Maydell wrote:
> >>> I don't in general expect to take pull requests from
> >>> everybody listed as a maintainer in the MAINTAINERS file.
> >>> That just means "I'm going to be reviewing and should
> >>> be cc'd on patches". Pull requests are sent by people
> >>> who are maintainers for a subsystem. Rule of thumb:
> >>> unless somebody asks you to send a pull request, you
> >>> don't need to do it.
> >>
> >> Ok, please apologize my misunderstanding. I still think the M: entry
> >> stand for 'Maintainer' instead of 'Mail', and still don't understand t=
he
> >> difference with a "Designated reviewer" (R: entry):
> >>
> >>         M: Mail patches to: FullName <address@domain>
> >>         R: Designated reviewer: FullName <address@domain>
> >>            These reviewers should be CCed on patches.
> >>
> >> "Designated reviewer" seems to duplicate the M: entry and is therefore
> >> confusing. Can we simply remove it instead?
> >
> > I hadn't realized we had an 'R:' tag in MAINTAINERS...
> >
> >> --
> >> Some people are not content with the amount of mail they get, and woul=
d
> >> like to be CCed on patches for areas they do not maintain.  Let them
> >> satisfy their own appetite for qemu-devel messages.
> >>
> >> Seriously: the purpose here is a bit different from the Linux kernel.
> >> While Linux uses "R" to designate non-maintainers for reviewing patche=
s
> >> in a given area, in QEMU I would also like to use "R" so that people c=
an
> >> delegate sending pull requests while keeping some degree of oversight.
> >> --
> >
> > So, my view, based on what happens in practice:
> >  * "maintainer" means you are in effect accepting some responsibility
> >    for the continued maintenance of some bit of the codebase, ie
> >    you actually will review stuff
> >  * "reviewer" is a bit weird but I guess is just asking for cc:
> >    without promising to actually do anything
> >  * somebody who sends me pull requests is effectively somebody we've
> >    given the ability to make direct more-or-less unchecked commits
> >    to master, so that is given out more sparingly and for larger
> >    subsystems
>
> Thanks for clarifying this!
>

Thanks Peter, Philippe and Alistair,
Sundeep


> This is more understandable (to me) than the "QEMU Maintainers" section
> entries description.
>
> > But MAINTAINERS is mostly about what submitters need to do (ie
> > who to send patchmails to), so it doesn't particularly document
> > how patches flow onward into master, which varies. (For instance
> > the block layer folks have a two-level setup where some trees
> > get merged into others before they go to master. ARM devboards
> > go through me, and "maintainer" just means I let somebody else
> > deal with the device specifics if possible but am still the
> > reviewer of last resort.)
>
> Ok :)
>
> Regards,
>
> Phil.
>

--001a11437e042cbd30055dd6f4fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Fri, Nov 10, 2017 at 7:10 PM, Philippe Mathieu-Daud=C3=A9 <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@a=
msat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cla=
ss=3D"HOEnZb"><div class=3D"h5">On 11/10/2017 09:56 AM, Peter Maydell wrote=
:<br>
&gt; On 10 November 2017 at 00:22, Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br>
&gt;&gt; On 11/09/2017 08:55 PM, Peter Maydell wrote:<br>
&gt;&gt;&gt; I don&#39;t in general expect to take pull requests from<br>
&gt;&gt;&gt; everybody listed as a maintainer in the MAINTAINERS file.<br>
&gt;&gt;&gt; That just means &quot;I&#39;m going to be reviewing and should=
<br>
&gt;&gt;&gt; be cc&#39;d on patches&quot;. Pull requests are sent by people=
<br>
&gt;&gt;&gt; who are maintainers for a subsystem. Rule of thumb:<br>
&gt;&gt;&gt; unless somebody asks you to send a pull request, you<br>
&gt;&gt;&gt; don&#39;t need to do it.<br>
&gt;&gt;<br>
&gt;&gt; Ok, please apologize my misunderstanding. I still think the M: ent=
ry<br>
&gt;&gt; stand for &#39;Maintainer&#39; instead of &#39;Mail&#39;, and stil=
l don&#39;t understand the<br>
&gt;&gt; difference with a &quot;Designated reviewer&quot; (R: entry):<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0M: Mail patches to: FullName &lt;=
address@domain&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0R: Designated reviewer: FullName =
&lt;address@domain&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 These reviewers should be=
 CCed on patches.<br>
&gt;&gt;<br>
&gt;&gt; &quot;Designated reviewer&quot; seems to duplicate the M: entry an=
d is therefore<br>
&gt;&gt; confusing. Can we simply remove it instead?<br>
&gt;<br>
&gt; I hadn&#39;t realized we had an &#39;R:&#39; tag in MAINTAINERS...<br>
&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Some people are not content with the amount of mail they get, and =
would<br>
&gt;&gt; like to be CCed on patches for areas they do not maintain.=C2=A0 L=
et them<br>
&gt;&gt; satisfy their own appetite for qemu-devel messages.<br>
&gt;&gt;<br>
&gt;&gt; Seriously: the purpose here is a bit different from the Linux kern=
el.<br>
&gt;&gt; While Linux uses &quot;R&quot; to designate non-maintainers for re=
viewing patches<br>
&gt;&gt; in a given area, in QEMU I would also like to use &quot;R&quot; so=
 that people can<br>
&gt;&gt; delegate sending pull requests while keeping some degree of oversi=
ght.<br>
&gt;&gt; --<br>
&gt;<br>
&gt; So, my view, based on what happens in practice:<br>
&gt;=C2=A0 * &quot;maintainer&quot; means you are in effect accepting some =
responsibility<br>
&gt;=C2=A0 =C2=A0 for the continued maintenance of some bit of the codebase=
, ie<br>
&gt;=C2=A0 =C2=A0 you actually will review stuff<br>
&gt;=C2=A0 * &quot;reviewer&quot; is a bit weird but I guess is just asking=
 for cc:<br>
&gt;=C2=A0 =C2=A0 without promising to actually do anything<br>
&gt;=C2=A0 * somebody who sends me pull requests is effectively somebody we=
&#39;ve<br>
&gt;=C2=A0 =C2=A0 given the ability to make direct more-or-less unchecked c=
ommits<br>
&gt;=C2=A0 =C2=A0 to master, so that is given out more sparingly and for la=
rger<br>
&gt;=C2=A0 =C2=A0 subsystems<br>
<br>
</div></div>Thanks for clarifying this!<br></blockquote><div><br></div><div=
>Thanks Peter, Philippe and Alistair,<br></div><div>Sundeep <br><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
This is more understandable (to me) than the &quot;QEMU Maintainers&quot; s=
ection<br>
entries description.<br>
<span class=3D""><br>
&gt; But MAINTAINERS is mostly about what submitters need to do (ie<br>
&gt; who to send patchmails to), so it doesn&#39;t particularly document<br=
>
&gt; how patches flow onward into master, which varies. (For instance<br>
&gt; the block layer folks have a two-level setup where some trees<br>
&gt; get merged into others before they go to master. ARM devboards<br>
&gt; go through me, and &quot;maintainer&quot; just means I let somebody el=
se<br>
&gt; deal with the device specifics if possible but am still the<br>
&gt; reviewer of last resort.)<br>
<br>
</span>Ok :)<br>
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div><br></div></div>

--001a11437e042cbd30055dd6f4fa--
