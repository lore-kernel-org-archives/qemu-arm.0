Received: by 10.223.197.9 with SMTP id q9csp10159283wrf;
        Sun, 22 Oct 2017 20:29:29 -0700 (PDT)
X-Received: by 10.55.97.85 with SMTP id v82mr17196310qkb.124.1508729369080;
        Sun, 22 Oct 2017 20:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508729369; cv=none;
        d=google.com; s=arc-20160816;
        b=UzSiki8ymRTXtc8fvfh6fUAAXM0uHbz0YGwzskltEkDlTfTWf5SiQzM0WwLh9H4+7z
         w+wPMsfzzEBcCULpoe94k+cOqbG+GexEekF+BrD7KW0HJDVfnDCFKdhHy2naI14aqAoa
         Szrxxw8gBIznBTZaRPul5macI5lwN6LaLItLfVKiF0FOvmx29OR8Ge0Z2b4qPkEhbeaf
         IH9E95vwT4cBUr0gpw+fCaXBZbREjKzqlIoAnnWKcfbwjdu/JSQEuCPT6SdQPQN02ktU
         aIyAcpLbpSnL+OMjfwFJs1z6K7ooQ0YY8kzA+xALGP7EQ3V1aoB/gtb8L4r5r8qz2vx0
         ztiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=k7wa6uD7EbIpC4hz9e3J2WxOfD9EGsVH86vJd4oi6fM=;
        b=VIXJkMxv0zva8buQmZJLeZy5Z5X+e51m1IgpOE4wfO4ViAWmbZvuDy5/9LLr0YnvrE
         csvFNfxLxXLmI+vZfn97AarhJP6hZrbxzq/q/B6NjCbwU24XyyFpvlhRukVFZvnVCFev
         MPMLIl1fSqQEw2NOu7ntunA0spgx+ta5eWn8Qu5nQyte+7w6IJ3W+yK7XGqwKJVyIDjJ
         MwUvepXqgH4SDRFkxm5PW7SCL/id2W/lZgpkDDLw2Y1SMVm43E02qVIQ8TKg5GHHm2ei
         ApQhQmTXdCsDdhNEQlY168RhzLIocC/I8XDRYrCMWZlyavnkdp0PL5MGGmyynwUD/ewc
         CHVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IIypoKZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p6si492677qtd.439.2017.10.22.20.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Oct 2017 20:29:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IIypoKZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6TQc-0004RX-Q9
	for alex.bennee@linaro.org; Sun, 22 Oct 2017 23:29:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e6TQT-0004QE-Js
	for qemu-arm@nongnu.org; Sun, 22 Oct 2017 23:29:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e6TQS-0003qP-ER
	for qemu-arm@nongnu.org; Sun, 22 Oct 2017 23:29:17 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:54671)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e6TQP-0003pP-Fw; Sun, 22 Oct 2017 23:29:13 -0400
Received: by mail-vk0-x22b.google.com with SMTP id n70so10322430vkf.11;
	Sun, 22 Oct 2017 20:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k7wa6uD7EbIpC4hz9e3J2WxOfD9EGsVH86vJd4oi6fM=;
	b=IIypoKZhAHo+0/p60ERSMTTgwbLWot1VMmyS5EQOGzhdUhY3fiZYn61I8EJlO9OTn/
	25hzZeJvqRcRGgSHUiPmek1qA9aPYUXjYRcvG4S4Y+66zSf/NuTkrYgo4L06puzn0i6X
	7+5hiL8QCcRJ0bfGcUK7By9OmAS4bgosDxyHrsYkjtc8X+LGPPDSQ6GSkwj2074db+VJ
	W9J0B1nw+qm/r16HfcscA8pGStvaKwp3H4TXSrqgqVO2qFkB/9mIOQXhzg8sUdj194QA
	mk7UmRekesgpcRTe9qK2Jrm3ng+Fl0HiyKtlL5jgdwrtOWVKe/6J0Z6unn6N8D+7jkhT
	d5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k7wa6uD7EbIpC4hz9e3J2WxOfD9EGsVH86vJd4oi6fM=;
	b=jjsOJka3s4+YqNfWOhjIeo0aU2kJtrY1sXxHM6IBCA9elDzcdx8l/pbBpBf23WYX42
	DqlIuu5IPfKjJRgjhGfQWclnZg6Keqm+8gvYE21FY7LPY44d2caxKIEakmqeCshzxc1y
	zFt3XYOOiFY/EBizn3w54o6abj4kFVWhUuw3D7R9x0yY807yssiK5I6VA5T83kYJIwTg
	fi5B38x+RNRmr8sUokNWJDi0hn4vcnOWgX0+QIGlONH8lXnQKO+6Ni6fJQFrsT/U07je
	gvAijsRRhl8lH2CEwTbK0QblW+HsrPs2ROvOJ32Is6snWDGV2bwCfTGGANwIwtsLa8ga
	SKAg==
X-Gm-Message-State: AMCzsaX+UtUiHW0wPUkfoKw1E95L5BzDxIPc4m8uM7jrokGdA33ZiKKH
	DD5MclpxIjCk/PJvGwdWvB4ywTTAhJ2HXau/urQ=
X-Google-Smtp-Source: ABhQp+QHNMvPWYOvfFO36TM6z2ZWEB0LLNf6bnwyKT4C9OSqVZpcFyW/TQ32pkmQL8NpmOy3ocz9dt0bNHWM7vwJ/SY=
X-Received: by 10.31.185.198 with SMTP id j189mr8553897vkf.172.1508729352689; 
	Sun, 22 Oct 2017 20:29:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.63.6 with HTTP; Sun, 22 Oct 2017 20:29:12 -0700 (PDT)
In-Reply-To: <150868113318.482.11705826106714639873@b58463cdfd5f>
References: <1508678882-4327-1-git-send-email-sundeep.lkml@gmail.com>
	<150868113318.482.11705826106714639873@b58463cdfd5f>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 23 Oct 2017 08:59:12 +0530
Message-ID: <CALHRZuqhSJC9t3Xrc6-yd3EKcaNUp3NyR+i3FW=i4C7Y16acxA@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="001a11439d98211f12055c2e6dda"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu devel v3 PATCH] msf2: Remove dead
 code reported by Coverity
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
Cc: famz@redhat.com,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZLwxMzrLl49f

--001a11439d98211f12055c2e6dda
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Sun, Oct 22, 2017 at 7:35 PM, <no-reply@patchew.org> wrote:

> Hi,
>
> This series failed automatic build test. Please find the testing commands
> and
> their output below. If you have docker installed, you can probably
> reproduce it
> locally.
>
> Type: series
> Message-id: 1508678882-4327-1-git-send-email-sundeep.lkml@gmail.com
> Subject: [Qemu-devel] [Qemu devel v3 PATCH] msf2: Remove dead code
> reported by Coverity
>
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> set -e
> git submodule update --init dtc
> # Let docker tests dump environment info
> export SHOW_ENV=1
> export J=8
> time make docker-test-quick@centos6
> time make docker-test-build@min-glib
> time make docker-test-mingw@fedora
> time make docker-test-block@fedora
> === TEST SCRIPT END ===
>
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  * [new tag]               patchew/1508678882-4327-1-git-
> send-email-sundeep.lkml@gmail.com -> patchew/1508678882-4327-1-git-
> send-email-sundeep.lkml@gmail.com
> Switched to a new branch 'test'
> a1c66b66e7 msf2: Remove dead code reported by Coverity
>
> === OUTPUT BEGIN ===
> Submodule 'dtc' (git://git.qemu-project.org/dtc.git) registered for path
> 'dtc'
> Cloning into '/var/tmp/patchew-tester-tmp-egubaaoc/src/dtc'...
> fatal: Could not read from remote repository.
>
> Please make sure you have the correct access rights
> and the repository exists.
> fatal: clone of 'git://git.qemu-project.org/dtc.git' into submodule path
> '/var/tmp/patchew-tester-tmp-egubaaoc/src/dtc' failed
> Failed to clone 'dtc'. Retry scheduled
> Cloning into '/var/tmp/patchew-tester-tmp-egubaaoc/src/dtc'...
> fatal: Could not read from remote repository.
>
> Please make sure you have the correct access rights
> and the repository exists.
> fatal: clone of 'git://git.qemu-project.org/dtc.git' into submodule path
> '/var/tmp/patchew-tester-tmp-egubaaoc/src/dtc' failed
> Failed to clone 'dtc' a second time, aborting
> === OUTPUT END ===
>
> Test command exited with code: 1
>

I did not understand. Is the error related to my patch?

Thanks,
Sundeep


>
>
> ---
> Email generated automatically by Patchew [http://patchew.org/].
> Please send your feedback to patchew-devel@freelists.org
>

--001a11439d98211f12055c2e6dda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<br><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Sun, Oct 22, 2017 at 7:35 PM,  <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:no-reply@patchew.org" target=3D"_blank">no-reply@patchew.org</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
This series failed automatic build test. Please find the testing commands a=
nd<br>
their output below. If you have docker installed, you can probably reproduc=
e it<br>
locally.<br>
<br>
Type: series<br>
<span class=3D"">Message-id: <a href=3D"mailto:1508678882-4327-1-git-send-e=
mail-sundeep.lkml@gmail.com">1508678882-4327-1-git-send-<wbr>email-sundeep.=
lkml@gmail.com</a><br>
Subject: [Qemu-devel] [Qemu devel v3 PATCH] msf2: Remove dead code reported=
 by Coverity<br>
<br>
</span><span class=3D"">=3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D<br>
#!/bin/bash<br>
</span>set -e<br>
git submodule update --init dtc<br>
# Let docker tests dump environment info<br>
export SHOW_ENV=3D1<br>
export J=3D8<br>
time make docker-test-quick@centos6<br>
time make docker-test-build@min-glib<br>
time make docker-test-mingw@fedora<br>
time make docker-test-block@fedora<br>
<span class=3D"">=3D=3D=3D TEST SCRIPT END =3D=3D=3D<br>
<br>
Updating 3c8cf5a9c21ff8782164d1def7f44b<wbr>d888713384<br>
From <a href=3D"https://github.com/patchew-project/qemu" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/patchew-<wbr>project/qemu</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pat=
chew/<a href=3D"mailto:1508678882-4327-1-git-send-email-sundeep.lkml@gmail.=
com">1508678882-4327-1-git-<wbr>send-email-sundeep.lkml@gmail.<wbr>com</a> =
-&gt; patchew/<a href=3D"mailto:1508678882-4327-1-git-send-email-sundeep.lk=
ml@gmail.com">1508678882-4327-1-git-<wbr>send-email-sundeep.lkml@gmail.<wbr=
>com</a><br>
Switched to a new branch &#39;test&#39;<br>
</span>a1c66b66e7 msf2: Remove dead code reported by Coverity<br>
<br>
=3D=3D=3D OUTPUT BEGIN =3D=3D=3D<br>
Submodule &#39;dtc&#39; (git://<a href=3D"http://git.qemu-project.org/dtc.g=
it" rel=3D"noreferrer" target=3D"_blank">git.qemu-project.org/<wbr>dtc.git<=
/a>) registered for path &#39;dtc&#39;<br>
Cloning into &#39;/var/tmp/patchew-tester-tmp-<wbr>egubaaoc/src/dtc&#39;...=
<br>
fatal: Could not read from remote repository.<br>
<br>
Please make sure you have the correct access rights<br>
and the repository exists.<br>
fatal: clone of &#39;git://<a href=3D"http://git.qemu-project.org/dtc.git" =
rel=3D"noreferrer" target=3D"_blank">git.qemu-project.org/<wbr>dtc.git</a>&=
#39; into submodule path &#39;/var/tmp/patchew-tester-tmp-<wbr>egubaaoc/src=
/dtc&#39; failed<br>
Failed to clone &#39;dtc&#39;. Retry scheduled<br>
Cloning into &#39;/var/tmp/patchew-tester-tmp-<wbr>egubaaoc/src/dtc&#39;...=
<br>
fatal: Could not read from remote repository.<br>
<br>
Please make sure you have the correct access rights<br>
and the repository exists.<br>
fatal: clone of &#39;git://<a href=3D"http://git.qemu-project.org/dtc.git" =
rel=3D"noreferrer" target=3D"_blank">git.qemu-project.org/<wbr>dtc.git</a>&=
#39; into submodule path &#39;/var/tmp/patchew-tester-tmp-<wbr>egubaaoc/src=
/dtc&#39; failed<br>
Failed to clone &#39;dtc&#39; a second time, aborting<br>
=3D=3D=3D OUTPUT END =3D=3D=3D<br>
<br>
Test command exited with code: 1<br></blockquote><div><br></div><div>I did =
not understand. Is the error related to my patch?<br><br></div><div>Thanks,=
<br></div><div>Sundeep<br>=C2=A0<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
---<br>
Email generated automatically by Patchew [<a href=3D"http://patchew.org/" r=
el=3D"noreferrer" target=3D"_blank">http://patchew.org/</a>].<br>
Please send your feedback to <a href=3D"mailto:patchew-devel@freelists.org"=
>patchew-devel@freelists.org</a></div></div></blockquote></div><br></div></=
div>

--001a11439d98211f12055c2e6dda--
