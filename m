Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2173811lfg;
        Mon, 8 Mar 2021 12:45:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1WSakV8ywQP8Uty9Tk+psumMcztAkbMOqzGgE+t+2kifVdaNa/4qBm3UmN0D+6aZUcRMv
X-Received: by 2002:a92:6b04:: with SMTP id g4mr21347972ilc.223.1615236357007;
        Mon, 08 Mar 2021 12:45:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615236357; cv=none;
        d=google.com; s=arc-20160816;
        b=LqJkL054RnhaZuP6rlf28T7g/GFCrXLtL4HKHjiWhXQPMs3Be8oa9BtuqlZLXOjnRB
         xCwPRI7fV+HXGkLRqpS4IGE7yKaerJDNUjsJglWdG6OSv5F6+yhTq4MKCDzFCp4bjkj4
         WF6yxbO40tn85feFgb1wA3W2eAAQ4MAsJ9B7HeV4Xzjra6NkopopD7ktbaOo7/XyJ730
         d4ekx1ImMAK2RfUJBPT/UcjD5reop5iA3jnciAZSwUW+U6oUaNiTqnq93dROhJXEhMAI
         +gI7BjwO5Fnhdfe/13damMP5Zjj9Y1tHh9ogr+Tu9ZnGxmTiknQ7J5LKbza0QDgTd0dh
         Vgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8DznHYerOPOtkTEXJEAY2N/mu3UvWoXYBXaJgVA4E2c=;
        b=TtVi8fVfoanG+X3RQsM8fokoViObnViFDwP8iqZlqtVWMZrkRAqO0totevVAS1uEYF
         AEFXzwaANQFQaIcUeV77d/wzC85lQU7NuTKr/dLc91T8pFpPUK9DgX2XfQuCjqycpY4D
         vOt6zSD7izHgIcY77uoyStdsuo5ct6TlhV7cFd8GrooNW9ZRKj2hPSZHjX5Q3IHnQrMV
         gaO7fBBsTiK0tCYQ/ZKue69Noo9h38AcrMX1+4QkkpqR4C/COUswLa/1nMxRJq2rONP4
         wffQu2FOUD8eVAhHuGrIaKhThHxaztUiFDMbwSa4eItlQb9crh7XVy7ksNEeHN/anRu6
         /oYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iSZvYWU1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si11044617ilu.32.2021.03.08.12.45.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 12:45:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iSZvYWU1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJMlI-0001Mw-B2
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 15:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lJMkp-0001Kh-FB
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 15:45:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lJMkn-0006MX-06
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 15:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615236324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8DznHYerOPOtkTEXJEAY2N/mu3UvWoXYBXaJgVA4E2c=;
 b=iSZvYWU16TECHA82NeIptYAVSnr3MPAPr6pVbJpIN+A9zyVUdgD2Y9VFcuMPak7lhXGFcN
 fIwgtevFIE5/lL90+M5kQqQr6R7hmnwjkl8RaOgDiK7kyi2e0i4IsvvBJQDceybtlM2LfK
 QtMymCXTCt7WR1hYkJEX+MlKrQRuNrM=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-AABBAVh8P-mU3sLz9W2FQA-1; Mon, 08 Mar 2021 15:45:22 -0500
X-MC-Unique: AABBAVh8P-mU3sLz9W2FQA-1
Received: by mail-vk1-f198.google.com with SMTP id r1so1172066vke.11
 for <qemu-arm@nongnu.org>; Mon, 08 Mar 2021 12:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8DznHYerOPOtkTEXJEAY2N/mu3UvWoXYBXaJgVA4E2c=;
 b=CbZ8OMTvESkWVvibDyhbVv5dGfCJKxrCACGcV46RVslXTreTfUVX72GpgKkLUTwGgp
 nVgGmHpQg0LIi9aedygMvOYsbzPghZo/9rvzcDDEWy3kAbmOeTLBkOWSIJ18WcsY4HEv
 PRiEcOFv4tRTTK44wA780AyhJHGt3N7ELzhYHMDd1Df3ZlqZbq3ZLTH5u8q/HK5nOKNh
 iTpqGhMO0+RQUdmRnfy7Zw8CYrWp9ForqZ+vUk+lvunXxf5P6b96pU626ez3V9Qvn0Le
 Bq5XrCcxnivsi8EzsDcpeMuTqTRbsc4jCqQNSGsyAAhV9O+u4f9lvjPgNh5MxKvw8TV1
 Z8lw==
X-Gm-Message-State: AOAM531lJHy2yC9Cv4VoxjHgPdj9UeDtevdzh0VveOt4PEi+ZopTnFl/
 LAyAHlm5/IPoUiq7n0nA7k98kShg2w5zf+hn4fgLDoivPBOWpufJi4qOCkr7ovu+yVHsETsj80i
 YhFs0KrzEKoBFr3Bc7TKhz/O6nnel
X-Received: by 2002:a1f:b250:: with SMTP id b77mr15137765vkf.7.1615236322012; 
 Mon, 08 Mar 2021 12:45:22 -0800 (PST)
X-Received: by 2002:a1f:b250:: with SMTP id b77mr15137756vkf.7.1615236321792; 
 Mon, 08 Mar 2021 12:45:21 -0800 (PST)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
 <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
 <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
 <CAKJDGDaUrbVpmNRvJvc+psWXzNUk6s=u8NxsR6E727UjiwsjeQ@mail.gmail.com>
In-Reply-To: <CAKJDGDaUrbVpmNRvJvc+psWXzNUk6s=u8NxsR6E727UjiwsjeQ@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 8 Mar 2021 17:44:56 -0300
Message-ID: <CAKJDGDZ2yf_Z1y6qxmet=6rtH90C1BZ_cOGNW41Jk-d1EzJFwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oOgmwWSU6oPL

On Mon, Mar 8, 2021 at 5:41 PM Willian Rampazzo <wrampazz@redhat.com> wrote=
:
>
> On Mon, Mar 8, 2021 at 5:32 PM Niek Linnenbank <nieklinnenbank@gmail.com>=
 wrote:
> >
> > Hi Philippe, Willian,
> >
> > On Mon, Mar 8, 2021 at 8:52 AM Philippe Mathieu-Daud=C3=A9 <philmd@redh=
at.com> wrote:
> >>
> >> On 3/5/21 4:16 PM, Willian Rampazzo wrote:
> >> > On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank <nieklinnenbank@gmail=
.com> wrote:
> >> >>
> >> >> The image for Armbian 19.11.3 bionic has been removed from the armb=
ian server.
> >> >> Without the image as input the test arm_orangepi_bionic_19_11 canno=
t run.
> >> >>
> >> >> This commit removes the test completely and merges the code of the =
generic function
> >> >> do_test_arm_orangepi_uboot_armbian back with the 20.08 test.
> >> >>
> >> >> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> >> >> ---
> >> >>  tests/acceptance/boot_linux_console.py | 72 ++++++++--------------=
----
> >> >>  1 file changed, 23 insertions(+), 49 deletions(-)
> >> >>
> >> >> diff --git a/tests/acceptance/boot_linux_console.py b/tests/accepta=
nce/boot_linux_console.py
> >> >> index eb01286799..9fadea9958 100644
> >> >> --- a/tests/acceptance/boot_linux_console.py
> >> >> +++ b/tests/acceptance/boot_linux_console.py
> >> >> @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
> >> >>          # Wait for VM to shut down gracefully
> >> >>          self.vm.wait()
> >> >>
> >> >> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
> >> >> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
> >> >> +                'Test artifacts fetched from unreliable apt.armbia=
n.com')
> >> >> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage=
 limited')
> >> >> +    def test_arm_orangepi_bionic_20_08(self):
> >> >> +        """
> >> >> +        :avocado: tags=3Darch:arm
> >> >> +        :avocado: tags=3Dmachine:orangepi-pc
> >> >> +        :avocado: tags=3Ddevice:sd
> >> >> +        """
> >> >> +
> >> >> +        # This test download a 275 MiB compressed image and expand=
 it
> >> >> +        # to 1036 MiB, but the underlying filesystem is 1552 MiB..=
.
> >> >> +        # As we expand it to 2 GiB we are safe.
> >> >> +
> >> >> +        image_url =3D ('https://dl.armbian.com/orangepipc/archive/=
'
> >> >> +                     'Armbian_20.08.1_Orangepipc_bionic_current_5.=
8.5.img.xz')
> >> >
> >> > The Armbian 20 is not available on this link anymore. I can browse j=
ust 21.
> >>
> >> Cat-and-mouse game *sigh*.
> >>
> >
> > Just to clarify here: in this patch I wanted to only make the change to=
 remove the test for the 19.11.3 image.
> > And in the 3rd patch (tests/acceptance/boot_linux_console: change URL f=
or test_arm_orangepi_bionic_20_08)
> > do the update for to correct the 20.08 link. So each patch fixes one pr=
oblem at a time.
> >
> > Does that make sense, or do you prefer that I combine them in a single =
patch instead?
>
> Ops, I forgot about the 3rd patch in this series. That makes sense to
> me, sorry for the mess.
>

And, in this case,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

> >
> > Regards,
> > Niek
> >
> > --
> > Niek Linnenbank
> >

