Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1182373lfp;
        Tue, 14 Sep 2021 17:35:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoLUyx7t2bbJuXWVz72tnsQoR6lotnh3HmHZsW5XGgbGjdbmzfILZC/bXPZqubCvcUSBY7
X-Received: by 2002:a05:6e02:1564:: with SMTP id k4mr14591729ilu.146.1631666144191;
        Tue, 14 Sep 2021 17:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631666144; cv=none;
        d=google.com; s=arc-20160816;
        b=fau2FIWx8Ai76ItsKxEIr0hfAsulwPw4EddfQa10Dl2+ytW6yJTDY52kNuRoASf6Ru
         PvucIExKZyM8lqRiGXGIn7aPFZs0w6SZCzQRcOGrMWtTKwQPJP7KDwhNIATfqDV+4tVG
         5t444JTA78VYDtEOLa4ZYF2/z0eHCTx/5nvt0VlAJXMWNf/jH+v25zUMuq+S6/V4gb0l
         p8sIlSlq4AaDzp2RkzKWh2P5vt5Fv16Bxx+ukW3HpWTA0q3Yov/20nCG+mFduLCWZQfA
         hnC904em7WByXsGdJhPoxcYwY23fAlMyLckncwWXC/nwzJGmWpH6hVexMuAp4s44Gxjb
         vLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LiUDq0+HPVB8E3/vskx0vkxSF4P9zxVVyD5OoW3+u9M=;
        b=R6xGUikRvZ9UEOM/hqPxEOAt/7tJH8NrOBEFP2H+4uBIvdaK/CWkzk6bw/xOMZAOUM
         BoDnc4wMNlr4itckdlc5uFotnG6GWzbbWeWY9te9n6LZANfEozvHd+mGSy/wUqbMQQ4g
         XMPN8TZEAzW8noevlprL5s6GGuvLpJjax4cTaemGo9u7zSNcuf2IUAyCW88xGvuy/7hn
         dDGY4WHXJm6N1eb3TiSoB4FFkhaBacWq0Vwy0XlWJyrVVeCT6a/9M8sMEvKpF6VJrXUL
         O1loV+I+9s+D2CGUlqS5Ca6x9NrzzGQaNLOdlvCJ4hhu6ONzSrrRddgJuAb0vI9l7VrF
         70AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CHGWALVb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2si12201341ioc.87.2021.09.14.17.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 17:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CHGWALVb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQItr-0007wT-IN
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 20:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQItU-0007tb-KS
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 20:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQItP-0001hC-Ff
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 20:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631666113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LiUDq0+HPVB8E3/vskx0vkxSF4P9zxVVyD5OoW3+u9M=;
 b=CHGWALVbmIZVoT9NLVjLrChG7bRxUFoe2m4Pc53niw+nsvM6Ij62BJKjNiXNCjVEMpypo0
 5Gf2qqyxiQIXasw7JpL7kfwOgvuXCkKCAGDS4LShcEzm1NSl0NM6D1IGYQtiBBDkQXB+Ac
 W7I3X+IFRxhdWpIO0GiCffz2Md8/q8o=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-CuZryurkPiemtLlOjp2Kew-1; Tue, 14 Sep 2021 20:35:10 -0400
X-MC-Unique: CuZryurkPiemtLlOjp2Kew-1
Received: by mail-oo1-f70.google.com with SMTP id
 q11-20020a4aa88b000000b0028e498bb328so883812oom.3
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 17:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LiUDq0+HPVB8E3/vskx0vkxSF4P9zxVVyD5OoW3+u9M=;
 b=orkBJheHmZZk3ie2HBhsaGkwiFWj+8KfXM8rJzua1wV2giXbRNWr28QU5NICYR31YF
 MyGQG5lOzEpUGE3nE2tW73HDoBBShzkQlIPGdA4xwYWf/XQ8tq0zyKRuX0ocIVol3OFQ
 FobCjkqsgnXwuJwkO59gXJR9H5z6TGvogpCWTwdqqXBzokCK2L5ez4rY5u1kqfE8kxsp
 oZTwMouIymJIViolfQzHPkvWJHULnC3k3D1K84A+B7nCo7w8D5boqm2l7n3zCB5ovDTt
 6HB0bwtVQfykE/HN/fOI2FwWxPb+vxTEgH3ViT7fIP3N5dUBRZi+VmJOHKHJ4f9Z9FGO
 P5ZA==
X-Gm-Message-State: AOAM532B+DwJRD06zWDYbOQCHgHn9rtkbfoGJDEistVunFWg1Fag2W5g
 9uQElJgX3YQwVSp3RubI5vR9xSWnUS1JxtpkYcRXRV+j3k0a9h6HlGdS3Nja7MPo+oFS+Osubvs
 IdF9hx158pW9VdqsSieiJ4fo6pKvb
X-Received: by 2002:aca:add3:: with SMTP id w202mr3310478oie.112.1631666110237; 
 Tue, 14 Sep 2021 17:35:10 -0700 (PDT)
X-Received: by 2002:aca:add3:: with SMTP id w202mr3310472oie.112.1631666110068; 
 Tue, 14 Sep 2021 17:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210708145514.1751773-1-f4bug@amsat.org>
 <CAFEAcA_ukc+t_BYddOSv7EF6O1qoVHGGj6sA5uumUgt0VMS_pA@mail.gmail.com>
 <CAFEAcA8PLvMUEzyu=sN4bn4mU30w1aajU+T+i__5jnB0QMZnqg@mail.gmail.com>
 <7cbaaf94-e255-a91b-8d71-ca720943bfcc@amsat.org>
 <CAKJDGDbxBYQ5O3Cim5evkNfFcLZ_FwFEe7GhQgE=WWHS7jODOg@mail.gmail.com>
 <88820040-ca86-1442-5dd3-68ecbf878c87@amsat.org>
In-Reply-To: <88820040-ca86-1442-5dd3-68ecbf878c87@amsat.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Sep 2021 20:34:59 -0400
Message-ID: <CAFn=p-ZZE9cXFOwgRBd8b3HEnjg2k1c77_ShzeYHfnPZcdSY0g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3
 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e221ea05cbfdde69"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D30fwhmv5T1s

--000000000000e221ea05cbfdde69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 2:30 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 8/27/21 8:01 PM, Willian Rampazzo wrote:
> > Hi, Phil,
> >
> > On Thu, Aug 26, 2021 at 1:49 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org>
> wrote:
> >>
> >> Hi Peter,
> >>
> >> On 7/9/21 6:00 PM, Peter Maydell wrote:
> >>> On Fri, 9 Jul 2021 at 16:33, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >>>>
> >>>> On Thu, 8 Jul 2021 at 15:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org>
> wrote:
> >>>>>
> >>>>> Since v1:
> >>>>> - renamed tests (Peter)
> >>>>>
> >>>>> Philippe Mathieu-Daud=C3=A9 (2):
> >>>>>   tests: Remove uses of deprecated raspi2/raspi3 machine names
> >>>>>   hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
> >>>>
> >>>>
> >>>>
> >>>> Applied to target-arm.next, thanks.
> >>>
> >>> I found that this seems to break 'make check':
> >>>
> >>>  (09/52)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_i=
nitrd:
> >>> ERROR: Could not perform graceful shutdown (40.38 s)
> >>
> >> I can not reproduce. Maybe something got changed in Python/Avocado
> >> since... I'm going to simply respin (updating 6.1 -> 6.2).
> >
> > I also could not reproduce. I checked and nothing changed on the
> > Avocado side. The version is still the same on the QEMU side.
>
> Thanks for double-checking!
>
>
Sorry for the long silence.

Did you get this sorted out? I don't recall changing the QEMUMachine code
upstream lately (Though I have been tinkering with it a lot in my own
branches) -- was the root cause of the failure discovered?

--js

--000000000000e221ea05cbfdde69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Aug 27, 2021 at 2:30 PM Philippe Mathieu-Daud=C3=A9 &lt;=
<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On 8/27/21 8:01 PM, Willi=
an Rampazzo wrote:<br>
&gt; Hi, Phil,<br>
&gt; <br>
&gt; On Thu, Aug 26, 2021 at 1:49 PM Philippe Mathieu-Daud=C3=A9 &lt;<a hre=
f=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt; wrot=
e:<br>
&gt;&gt;<br>
&gt;&gt; Hi Peter,<br>
&gt;&gt;<br>
&gt;&gt; On 7/9/21 6:00 PM, Peter Maydell wrote:<br>
&gt;&gt;&gt; On Fri, 9 Jul 2021 at 16:33, Peter Maydell &lt;<a href=3D"mail=
to:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>=
&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Thu, 8 Jul 2021 at 15:55, Philippe Mathieu-Daud=C3=A9 &=
lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>=
&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Since v1:<br>
&gt;&gt;&gt;&gt;&gt; - renamed tests (Peter)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Philippe Mathieu-Daud=C3=A9 (2):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0tests: Remove uses of deprecated raspi2/ra=
spi3 machine names<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0hw/arm/raspi: Remove deprecated raspi2/ras=
pi3 aliases<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Applied to target-arm.next, thanks.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I found that this seems to break &#39;make check&#39;:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 (09/52) tests/acceptance/boot_linux_console.py:BootLinux=
Console.test_arm_raspi2_initrd:<br>
&gt;&gt;&gt; ERROR: Could not perform graceful shutdown (40.38 s)<br>
&gt;&gt;<br>
&gt;&gt; I can not reproduce. Maybe something got changed in Python/Avocado=
<br>
&gt;&gt; since... I&#39;m going to simply respin (updating 6.1 -&gt; 6.2).<=
br>
&gt; <br>
&gt; I also could not reproduce. I checked and nothing changed on the<br>
&gt; Avocado side. The version is still the same on the QEMU side.<br>
<br>
Thanks for double-checking!<br>
<br></blockquote><div><br></div><div><div dir=3D"ltr"><div>Sorry for the lo=
ng silence.</div><div><br></div><div>Did
 you get this sorted out? I don&#39;t recall changing the QEMUMachine code=
=20
upstream lately (Though I have been tinkering with it a lot in my own=20
branches) -- was the root cause of the failure discovered?<br></div></div>=
=C2=A0</div><div>--js<br></div></div></div>

--000000000000e221ea05cbfdde69--

