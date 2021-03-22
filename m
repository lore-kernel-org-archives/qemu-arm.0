Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3779334lfg;
        Mon, 22 Mar 2021 10:13:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsdQImyorMYoEqm3xjydCoyLwAPG054zZrMuTA63EPntldwsy5x2M/4moOMoZX7Ht72Hhp
X-Received: by 2002:a5e:9513:: with SMTP id r19mr615620ioj.35.1616433236888;
        Mon, 22 Mar 2021 10:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616433236; cv=none;
        d=google.com; s=arc-20160816;
        b=FnWbzgVC+Z0YJE1SP68JeEFfDU+PmfDOKXBjy6h4BHmJsSMgiRrTpB1IzKO6KZTBtY
         EIt4L5R6+xSMbVoARN2Ksmo6hJ8FAoL9+yLgWqJa4e8bQHv/QKqfpRMuUMjaIqAa7TlQ
         85F3MHyCpurn8rgLpnbM48JA7JaRpg2AGqZQzgnkwmb79ta4t3EbcB0HULXCjTO4tfr/
         SU77nc+m1yeJ9LR3lTsbod259WolGMNxr4IqPWC5Cx8lxpwvh3G77bnwn99Y/5HJtGrW
         JFOBCfXO3tBcisMdeJkdu5nA49tetiJiE1FJNcIsCOgyvKxos927vNMeb7+XGlQ/TB3n
         b6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8VY3tCilkxsOn7PQH41opJ/GbzuJ5IG47FtySKPyw4U=;
        b=RoRlmGuA/A5NbRVds/PWofSQ8jcUSJhOniR8isIXeKpY8Nx7ztiuuST/ZzpJ8k7q0h
         CVHhx8dASqy554znEQigwtqADRs/P42xD3c8NQ3KT1SBo23iEVVL5JDiR/eISaQKUUCM
         2Ib8St7PxglyIId03mdQVRwk0Gj7RAzhvJ3ClP85bO8Z/CBZXVPZDh+tjlS/RGlt0BSM
         kxzafBPFda2xT37REzj9/VpbHKNZ28xrs7dTZ7KgREzGxc4pDnsLLM3os3HlkDXTeIg5
         qJvfznAhlI+ei/Csy+B4/4j/s2kLFCkNtjumRFSMVrbNRqf+IT36GHESZHfedTZDuggA
         T+6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RcQMEUsQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si8801669jaq.104.2021.03.22.10.13.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 10:13:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RcQMEUsQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOO7o-0004xO-3g
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 13:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lOO7b-0004va-8J
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 13:13:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lOO7T-00076c-4t
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 13:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616433213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VY3tCilkxsOn7PQH41opJ/GbzuJ5IG47FtySKPyw4U=;
 b=RcQMEUsQLYzuP13S4IqrYgEA4x9RJxcXB31vpS7XZzrgQWj8+91jnjQHCEnJHuI429m+Tc
 kRx16iSoR3RpSz7ehbYrixKQoC0R+wUmnBrl37i533vW/eKpMEokNBSxGF+5sFphQuJHDo
 fE8R9dH37YuvwDVzNaBLCqQ8BskW9LA=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-5gIs078XMiCUwppm1E6U1g-1; Mon, 22 Mar 2021 13:13:25 -0400
X-MC-Unique: 5gIs078XMiCUwppm1E6U1g-1
Received: by mail-vk1-f197.google.com with SMTP id m21so3263861vko.18
 for <qemu-arm@nongnu.org>; Mon, 22 Mar 2021 10:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8VY3tCilkxsOn7PQH41opJ/GbzuJ5IG47FtySKPyw4U=;
 b=YeCQG134TXH99DaDyv3GX1uf1ZGnZpddIoH2wevKVYSngSkbpgG7zoG8sbK/gRV50t
 OkBhLbd7UfD/mTnUvcINMVBEgUO76MqLVOcA50MDHlY1oASxtpLDq9RfU9hTAQyphAD1
 vm4C3OZo26ncfQXnFoQuh8OQIGjea8p64+Uw46S/3to82FfyZS8lXsDTAqOltV2nHHuo
 pmTv9SokoWNKg0GCe+vKqc2hLzVfFqS67RSOlixfDuiagwHMUBmDrPcon/fzn1k0V0p1
 yini6Oo2cHE/bHFiVErwLKkEw8qnc90qLIJD2gI7IsoKbFT3S5v39dofxf2R9Cmo4kjY
 0qlg==
X-Gm-Message-State: AOAM532YrczZj92WPlP7L7ogm3q+/nyBRzIhJobxoPo+b9jH+gb1/F3M
 ovkWH6vOnxKwlx4TnUPEs+ALgW16YKF0l9Y3F4g19Q+8/knoV19JUY8MmcEMKEKY31UGo9qcLvj
 A2Ho0xIm48Ob9/Q2RBgGrm9fELk4y
X-Received: by 2002:ab0:3388:: with SMTP id y8mr784466uap.113.1616433204029;
 Mon, 22 Mar 2021 10:13:24 -0700 (PDT)
X-Received: by 2002:ab0:3388:: with SMTP id y8mr784370uap.113.1616433202959;
 Mon, 22 Mar 2021 10:13:22 -0700 (PDT)
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
In-Reply-To: <CAAdtpL6vejm+ud+dJ8s4sQ-29P6-zP8LeZ4Hk92KKFrcA_TYhw@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 22 Mar 2021 14:12:56 -0300
Message-ID: <CAKJDGDaB1x1_6tb1Xh-NSs-Xu6iRp6W4oJC6Nkb2SqSg-E-8HA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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
X-TUID: uNOyL8MVSBBp

Hi Philippe,

On Mon, Mar 22, 2021 at 1:59 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On Mon, Mar 22, 2021 at 5:54 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >
> > Hi Willian,
> >
> > On 3/8/21 9:44 PM, Willian Rampazzo wrote:
> > > On Mon, Mar 8, 2021 at 5:41 PM Willian Rampazzo <wrampazz@redhat.com>=
 wrote:
> > >>
>
> > >>>>>> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
> > >>>>>> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
> > >>>>>> +                'Test artifacts fetched from unreliable apt.arm=
bian.com')
> > >>>>>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'stor=
age limited')
> > >>>>>> +    def test_arm_orangepi_bionic_20_08(self):
> > >>>>>> +        """
> > >>>>>> +        :avocado: tags=3Darch:arm
> > >>>>>> +        :avocado: tags=3Dmachine:orangepi-pc
> > >>>>>> +        :avocado: tags=3Ddevice:sd
> > >>>>>> +        """
> > >>>>>> +
> > >>>>>> +        # This test download a 275 MiB compressed image and exp=
and it
> > >>>>>> +        # to 1036 MiB, but the underlying filesystem is 1552 Mi=
B...
> > >>>>>> +        # As we expand it to 2 GiB we are safe.
> > >>>>>> +
> > >>>>>> +        image_url =3D ('https://dl.armbian.com/orangepipc/archi=
ve/'
> > >>>>>> +                     'Armbian_20.08.1_Orangepipc_bionic_current=
_5.8.5.img.xz')
> > >>>>>
> > >>>>> The Armbian 20 is not available on this link anymore. I can brows=
e just 21.
> > >>>>
> > >>>> Cat-and-mouse game *sigh*.
> >
> > 2021-03-22 17:18:10,701 download         L0067 INFO | Fetching
> > https://archive.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepi=
pc_bionic_current_5.8.5.img.xz
> > -> /home/phil/avocado/da
> > ta/cache/by_location/f2eb27a12b81ce15e93f340fabbced2136af1caa/Armbian_2=
0.08.1_Orangepipc_bionic_current_5.8.5.img.xz.nfwdzivg
> > 2021-03-22 17:18:11,263 asset            L0136 INFO | Temporary asset
> > file unavailable due to failed download attempt.
> > 2021-03-22 17:18:11,263 asset            L0368 ERROR| URLError: <urlope=
n
> > error [Errno 113] No route to host>
> >
> > It might be a temporary problem, but looking long term the
> > current setup doesn't scale IMHO.
>
> Also I just noticed I *do* have the image cached, even twice:
>
> $ find /home/phil/avocado/data/cache/by_location/ -name
> Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz -ls
>   131661 280768 -rw-rw-r--   1 phil     phil     287501560 Oct 23
> 12:45 /home/phil/avocado/data/cache/by_location/cac379e6a4480624b000dfde1=
b5d935454254ce2/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
>   131761 280776 -rw-rw-r--   1 phil     phil     287501560 Feb 20
> 00:39 /home/phil/avocado/data/cache/by_location/aac619d9e7ea3726ebc86c159=
fddfb9d3f6274a5/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
>
> But the hash is different.
>

You have 2 images because you fetched them from different locations.
When you fetch by location, the assets go to the directory
representing the hash of the location, This allows, for example, the
fetch of multiple initrd or vmlinuz files from different locations,
representing different files, but with the same name. Also, this was
one of your requests some time ago :)

What Beraldo worked on in the last week was a way to remove "unused"
files. Your cache is a good example of files that are not necessary
anymore because now you are using a different location to fetch them.

> Cleber, why not use the blob hash as a cache key? It is supposed to be
> constant...
>

You can do that by setting the test to download the file by name, and
not by location.

> Cc'ing Beraldo because I guess remember he worked on improving Avocado ca=
che.
>
> > >>> Just to clarify here: in this patch I wanted to only make the chang=
e to remove the test for the 19.11.3 image.
> > >>> And in the 3rd patch (tests/acceptance/boot_linux_console: change U=
RL for test_arm_orangepi_bionic_20_08)
> > >>> do the update for to correct the 20.08 link. So each patch fixes on=
e problem at a time.
>

