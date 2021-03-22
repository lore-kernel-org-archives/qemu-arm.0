Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3798828lfg;
        Mon, 22 Mar 2021 10:39:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJEmG241U/gPYHkTv98M9YU2DS1aPtnZd0rU11qwllyt5dPE8ymbwBTHw3ClAvQGZv81h3
X-Received: by 2002:a92:d843:: with SMTP id h3mr1002004ilq.306.1616434765206;
        Mon, 22 Mar 2021 10:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616434765; cv=none;
        d=google.com; s=arc-20160816;
        b=qFe3iXmNxgelfCIUwhpaY+9RIzbZLTPpxxWY+5Djc6BDs+W3V5MPwK+MBMl/mJCNTC
         JpI2bfL5WPEGO5dr/Y4JP17Iepea0phIcWTIvvCMs1e+/MtRNNimnoJPSU75jvMWTivA
         K1MeTJa8I77pH37SPx+/6Vp2Ff8U/wfmmnU2iduZtVC7JpGBbbZTMaQPsj3x5y40NWdA
         WS5q3JwsE+BVbZcxdQaNGjB09RY8U0dgeEq4wjaK4FYb4i9wzwpc7bxBC263UHeRoDmi
         mgbXE+tsqJp0ej1DIlC7UkKPI9Wr7dNA+r7N6pLOY9oheSsWPBIh3G+TmzQAS9O34JXu
         gX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9jkRxVz10NTAO6oOGCkFraMZfJgO07oUUg81Pkexlc0=;
        b=KVrVvyHkJgeyCDxrURLMpLnqR4zeZoQwv7eUm9q+ZFV2MR0TUiSNZGZ3bH59a/aNdO
         nsPTVFUsPT/u054UQE1pXHaYTbI5koOR+r8cvC/XnXMOiiaJKLeRsAlYUGEak6q5to1A
         6xe4CbDx6rc3jlMtrji4juX9ZCODh1GQ6vI2EwkjrIuNhv0L95ILMhY7yo+Yh3CdWXz6
         V+PiuZ9wzPW9hi7EDgKz56nDQ1hNGfQ/O1gZUVAoAHJQsr2CkPW+DG/toFM3YMc+gNnC
         3u60VBApnRlC5trwrvHrj9Vf25L0/I9xfUDgOJDPyhNLSWLJNocGZUuWsvQyvH3yBAQP
         LldQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ewIGAA8y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si8885278iob.94.2021.03.22.10.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 10:39:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ewIGAA8y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOOWS-00033B-Er
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 13:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lOOVz-00030z-97
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 13:38:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lOOVh-0003Q7-3e
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 13:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616434713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jkRxVz10NTAO6oOGCkFraMZfJgO07oUUg81Pkexlc0=;
 b=ewIGAA8y675JkBt9zddtYs/8vj52vsWvwbO7uFTaCJnmh+TYo/8Nic91C1n/HuxuWHIomR
 UzZ2xe2TEGefPXJ2cP9G7dOiEtyr/pDOrpZRuyASJu6ow1j4w0Tw/80WIXwbynS8Z4Qmto
 rBCnzzC7OWnTqAIUT780pqRtQiADhFs=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-ykMvDqlzN9qZrJ4RAB-tCQ-1; Mon, 22 Mar 2021 13:38:26 -0400
X-MC-Unique: ykMvDqlzN9qZrJ4RAB-tCQ-1
Received: by mail-vk1-f198.google.com with SMTP id n196so15989924vkn.23
 for <qemu-arm@nongnu.org>; Mon, 22 Mar 2021 10:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9jkRxVz10NTAO6oOGCkFraMZfJgO07oUUg81Pkexlc0=;
 b=j8/Tod03Xv9aFmRGAPPH5Dskok/yV+w18mEzVIu6q8etJBmg37Ks15SOikKTlOM31L
 ebAgaNLa2WcGENZ3c+wa7dJ2lZrsZg03V30JMBUQgglghTFA39HsFftQnXYx6wAz1ahw
 zb8KA3HJZZlzjtyYxqUrPUzibKM2bIsU9AXmtb8DpxBj5Ueldnag5lFVmnSQbUZmOh2T
 vMtVNkMj0E4ZKMnK0y1vx3kJ3vs9TUPy2SaXmDIkcn33t4MPpO6/rt9T1eUpzOzryjzl
 WACiUuznbSPJVREhhlEzcgQhIQfk1+B5SY/92SkbeGsuNzJs5s34pnzCqIj1c/M1yuYk
 HL0g==
X-Gm-Message-State: AOAM531CYML2Y+ZOC+39kg2ndjy6iSuWoG7cyGhhDAPlxjao1Jx5DMNH
 gVMJy3yYtpnNXUmyEkvR7xibOGAhIZDclDZP7M2Wj9GQb1b2pU3tbmRemV+XNWZGVJXKBKz987P
 srQP0PONjfuUD9t9Fbw5OCok1bH1H
X-Received: by 2002:a67:fe93:: with SMTP id b19mr886904vsr.1.1616434704650;
 Mon, 22 Mar 2021 10:38:24 -0700 (PDT)
X-Received: by 2002:a67:fe93:: with SMTP id b19mr886883vsr.1.1616434704332;
 Mon, 22 Mar 2021 10:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
 <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
 <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
 <CAKJDGDaUrbVpmNRvJvc+psWXzNUk6s=u8NxsR6E727UjiwsjeQ@mail.gmail.com>
 <CAKJDGDZ2yf_Z1y6qxmet=6rtH90C1BZ_cOGNW41Jk-d1EzJFwQ@mail.gmail.com>
 <fe4d5ba3-643a-70c0-417f-73d5ccb5acda@amsat.org>
 <CAAdtpL6vejm+ud+dJ8s4sQ-29P6-zP8LeZ4Hk92KKFrcA_TYhw@mail.gmail.com>
 <CAKJDGDaB1x1_6tb1Xh-NSs-Xu6iRp6W4oJC6Nkb2SqSg-E-8HA@mail.gmail.com>
 <f41851ea-b696-d3a7-9753-a1a1cc5fa6d6@amsat.org>
In-Reply-To: <f41851ea-b696-d3a7-9753-a1a1cc5fa6d6@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 22 Mar 2021 14:37:58 -0300
Message-ID: <CAKJDGDY14P2=mU9mFVwfteZ3PjvJCS8S6nBT2PW_3cESWxeBTg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FdM/U9G7c4nb

On Mon, Mar 22, 2021 at 2:24 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 3/22/21 6:12 PM, Willian Rampazzo wrote:
> > Hi Philippe,
> >
> > On Mon, Mar 22, 2021 at 1:59 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> On Mon, Mar 22, 2021 at 5:54 PM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >>>
> >>> Hi Willian,
> >>>
> >>> On 3/8/21 9:44 PM, Willian Rampazzo wrote:
> >>>> On Mon, Mar 8, 2021 at 5:41 PM Willian Rampazzo <wrampazz@redhat.com=
> wrote:
> >>>>>
> >>
> >>>>>>>>> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
> >>>>>>>>> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
> >>>>>>>>> +                'Test artifacts fetched from unreliable apt.ar=
mbian.com')
> >>>>>>>>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'sto=
rage limited')
> >>>>>>>>> +    def test_arm_orangepi_bionic_20_08(self):
> >>>>>>>>> +        """
> >>>>>>>>> +        :avocado: tags=3Darch:arm
> >>>>>>>>> +        :avocado: tags=3Dmachine:orangepi-pc
> >>>>>>>>> +        :avocado: tags=3Ddevice:sd
> >>>>>>>>> +        """
> >>>>>>>>> +
> >>>>>>>>> +        # This test download a 275 MiB compressed image and ex=
pand it
> >>>>>>>>> +        # to 1036 MiB, but the underlying filesystem is 1552 M=
iB...
> >>>>>>>>> +        # As we expand it to 2 GiB we are safe.
> >>>>>>>>> +
> >>>>>>>>> +        image_url =3D ('https://dl.armbian.com/orangepipc/arch=
ive/'
> >>>>>>>>> +                     'Armbian_20.08.1_Orangepipc_bionic_curren=
t_5.8.5.img.xz')
> >>>>>>>>
> >>>>>>>> The Armbian 20 is not available on this link anymore. I can brow=
se just 21.
> >>>>>>>
> >>>>>>> Cat-and-mouse game *sigh*.
> >>>
> >>> 2021-03-22 17:18:10,701 download         L0067 INFO | Fetching
> >>> https://archive.armbian.com/orangepipc/archive/Armbian_20.08.1_Orange=
pipc_bionic_current_5.8.5.img.xz
> >>> -> /home/phil/avocado/da
> >>> ta/cache/by_location/f2eb27a12b81ce15e93f340fabbced2136af1caa/Armbian=
_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz.nfwdzivg
> >>> 2021-03-22 17:18:11,263 asset            L0136 INFO | Temporary asset
> >>> file unavailable due to failed download attempt.
> >>> 2021-03-22 17:18:11,263 asset            L0368 ERROR| URLError: <urlo=
pen
> >>> error [Errno 113] No route to host>
> >>>
> >>> It might be a temporary problem, but looking long term the
> >>> current setup doesn't scale IMHO.
> >>
> >> Also I just noticed I *do* have the image cached, even twice:
> >>
> >> $ find /home/phil/avocado/data/cache/by_location/ -name
> >> Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz -ls
> >>   131661 280768 -rw-rw-r--   1 phil     phil     287501560 Oct 23
> >> 12:45 /home/phil/avocado/data/cache/by_location/cac379e6a4480624b000df=
de1b5d935454254ce2/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
> >>   131761 280776 -rw-rw-r--   1 phil     phil     287501560 Feb 20
> >> 00:39 /home/phil/avocado/data/cache/by_location/aac619d9e7ea3726ebc86c=
159fddfb9d3f6274a5/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
> >>
> >> But the hash is different.
> >>
> >
> > You have 2 images because you fetched them from different locations.
> > When you fetch by location, the assets go to the directory
> > representing the hash of the location, This allows, for example, the
> > fetch of multiple initrd or vmlinuz files from different locations,
> > representing different files, but with the same name. Also, this was
> > one of your requests some time ago :)
>
> My request because we were fetching different artifacts for different
> tests but all files had the same filename, i.e.:
>
> url1://path1/to/vmlinux
> url2://path2/to/vmlinux
> url3://yet/another/path/to/vmlinux
>
> I was obviously short sighted.
>
> > What Beraldo worked on in the last week was a way to remove "unused"
> > files. Your cache is a good example of files that are not necessary
> > anymore because now you are using a different location to fetch them.
>
> OK, I'll watch closely how you decide a cached file is "unused"...
>
> >
> >> Cleber, why not use the blob hash as a cache key? It is supposed to be
> >> constant...
> >>
> >
> > You can do that by setting the test to download the file by name, and
> > not by location.
>
> How so? Isn't it what I just described earlier we wanted to avoid?
>

Yep, but if you are sure there won't be another file called
`Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz` that means
another thing than what the file name describes, in this case, it can
be fetched by name. It will still check the file hash to make sure it
is the file needed, but it opens the possibility to download the same
file from different locations without duplicating it in the cache.

For this case, I think it makes sense to fetch it and add it to the
`by_name` location in the cache.

> >
> >> Cc'ing Beraldo because I guess remember he worked on improving Avocado=
 cache.
> >>
> >>>>>> Just to clarify here: in this patch I wanted to only make the chan=
ge to remove the test for the 19.11.3 image.
> >>>>>> And in the 3rd patch (tests/acceptance/boot_linux_console: change =
URL for test_arm_orangepi_bionic_20_08)
> >>>>>> do the update for to correct the 20.08 link. So each patch fixes o=
ne problem at a time.
> >>
> >
> >
>

