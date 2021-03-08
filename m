Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2172166lfg;
        Mon, 8 Mar 2021 12:42:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynsD1FbSU0luhG+Zuz6e16wJE9L7nFzfp04q3X6kH+VjYXnSb9JpbdnQWeCLrSvQGiWQk9
X-Received: by 2002:a92:c242:: with SMTP id k2mr22523121ilo.12.1615236169611;
        Mon, 08 Mar 2021 12:42:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615236169; cv=none;
        d=google.com; s=arc-20160816;
        b=eV0FPlIayQeh8IQOKSRp9UwKiyLhd5enQLqgDWJhyoeVig0f8mApO78xm3fAufZASF
         hhYXhfjAXCfNkWZKXCfFozamLkyMcCU2ygdGLPeru+/LvInGHqpu4F5SxMh/6dMI1H86
         1t5ZS3T5XqbI3uA0A9atZTdNoGgmKg0kWovGjsgktcghQBUe7MOteskNluDdkPjiVZxG
         VLqx25LvHA3hspOTYgwiCIzALrgNdqufDwEU3t3cUs2fwSJzW6ggBUMH9krlv0impnh4
         lgVsv5aur/cf8txgQ4wbUJmo0Lc6p3nQ8TqhnOIzNU1rwa9I1w+IP7FIGUAfSoVPa8Hi
         TNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rnFFJaV+HEHeXEQDTitf8PUdSYNLp3O6qCoSxvISh2Y=;
        b=CwIs+/LctDl8iTc6y7hO2NE+r0FN9VKhGZAxR+ELY0FJlQMh9NGF6qOkJbfFvwneVI
         Zu//VKLN+mbhwxa0Mp4nrWmcLagtLY2S7lvf1ScxFyW2Ngt9dEk77E77c4lDOw5yv2UB
         2aHFcSp+1h2UL13O+AAW98pNo9vSXCZn8Qm7BAU7Nm7hXXXLf6VWNLZYjHXEeP2IDd7o
         Xi3PQZPg68QB5FAkAfs4GMsx8V4OmA1hr524Lq5nXENqoRZEG3m3Uhmcu17Nu90FtRqN
         rmzzn0wDRPI3NoSQU0ofLU1HTXGjxXQCTiDcTRbUIk4h8+WLhCx/a/Y3omzhMfgavd2B
         l9Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JLvVBdfO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si11904533ilv.124.2021.03.08.12.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 12:42:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JLvVBdfO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJMiB-0007hd-H1
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 15:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lJMhk-0007hN-Mq
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 15:42:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lJMhi-0004z8-9c
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 15:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615236131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rnFFJaV+HEHeXEQDTitf8PUdSYNLp3O6qCoSxvISh2Y=;
 b=JLvVBdfO5yQZv/YPOdUVzieqOvBCGIGCFIPcAzVpRKbV+G9RKu+9b4kXlMnpE7nGSZVIPM
 2yr+Qu8QR7Zs44N9njpmC7szo+Fk2uX6kJp+aPFtwHAaJMsQxWK2yZWxbhF0qEonezst5A
 /xXCoMkhuAZLgyh2eh6ZqNAucLl89gA=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-0q_DBWB3OZeMcFHb3fXStg-1; Mon, 08 Mar 2021 15:42:09 -0500
X-MC-Unique: 0q_DBWB3OZeMcFHb3fXStg-1
Received: by mail-ua1-f71.google.com with SMTP id e15so1958288ual.19
 for <qemu-arm@nongnu.org>; Mon, 08 Mar 2021 12:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rnFFJaV+HEHeXEQDTitf8PUdSYNLp3O6qCoSxvISh2Y=;
 b=cTV/5zALZzh0gTaRtUaxFnYlX4Lvw0V+YJATU/B/24L06zS34lkPurxoZFB77F8Qe1
 dK38rzIOVISyHdk3s937Jcxn7ldjwW4DS6ieiCpSXqIEg9H4Amj7yGGVITM3CKdIiC+3
 RSDO/dzbW1eoU7qXYbtSErh/rjPJgyinc+RH+9o/kXE/0Fs+3YtibszQTdKw8l+bjki8
 xdLs13NP9GVU30adeIGXrIzF16ckN0hRlaZua0HXDs2iCDcBfh91qwRGUKsdcMt+mOFa
 zNykiIUieX0YhQVTlJ3n7X0WwIdIimXDF5l/4JWViVHH6KMx36H/lh4hmpRTLVwTwXEn
 2jSA==
X-Gm-Message-State: AOAM5324ZVeM164gtniNZgzV+2d5YUG9JOdsnnlCVml5uisw2bnWcGjq
 hDoSBerGGJ+faXBvKk2FzcHtO3C48hJ9DF2HlBpIxF1cAfgzDCnII9YIzPwYEWfBlYb8pk23Mvk
 spQcoXGvuUwmFErhOJPkbGi8wuJmz
X-Received: by 2002:ac5:cbee:: with SMTP id i14mr11601478vkn.1.1615236128465; 
 Mon, 08 Mar 2021 12:42:08 -0800 (PST)
X-Received: by 2002:ac5:cbee:: with SMTP id i14mr11601443vkn.1.1615236127900; 
 Mon, 08 Mar 2021 12:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
 <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
 <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
In-Reply-To: <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 8 Mar 2021 17:41:42 -0300
Message-ID: <CAKJDGDaUrbVpmNRvJvc+psWXzNUk6s=u8NxsR6E727UjiwsjeQ@mail.gmail.com>
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
X-TUID: dya6ONcqQzcB

On Mon, Mar 8, 2021 at 5:32 PM Niek Linnenbank <nieklinnenbank@gmail.com> w=
rote:
>
> Hi Philippe, Willian,
>
> On Mon, Mar 8, 2021 at 8:52 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com> wrote:
>>
>> On 3/5/21 4:16 PM, Willian Rampazzo wrote:
>> > On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank <nieklinnenbank@gmail.c=
om> wrote:
>> >>
>> >> The image for Armbian 19.11.3 bionic has been removed from the armbia=
n server.
>> >> Without the image as input the test arm_orangepi_bionic_19_11 cannot =
run.
>> >>
>> >> This commit removes the test completely and merges the code of the ge=
neric function
>> >> do_test_arm_orangepi_uboot_armbian back with the 20.08 test.
>> >>
>> >> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> >> ---
>> >>  tests/acceptance/boot_linux_console.py | 72 ++++++++----------------=
--
>> >>  1 file changed, 23 insertions(+), 49 deletions(-)
>> >>
>> >> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptanc=
e/boot_linux_console.py
>> >> index eb01286799..9fadea9958 100644
>> >> --- a/tests/acceptance/boot_linux_console.py
>> >> +++ b/tests/acceptance/boot_linux_console.py
>> >> @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
>> >>          # Wait for VM to shut down gracefully
>> >>          self.vm.wait()
>> >>
>> >> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
>> >> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>> >> +                'Test artifacts fetched from unreliable apt.armbian.=
com')
>> >> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage l=
imited')
>> >> +    def test_arm_orangepi_bionic_20_08(self):
>> >> +        """
>> >> +        :avocado: tags=3Darch:arm
>> >> +        :avocado: tags=3Dmachine:orangepi-pc
>> >> +        :avocado: tags=3Ddevice:sd
>> >> +        """
>> >> +
>> >> +        # This test download a 275 MiB compressed image and expand i=
t
>> >> +        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
>> >> +        # As we expand it to 2 GiB we are safe.
>> >> +
>> >> +        image_url =3D ('https://dl.armbian.com/orangepipc/archive/'
>> >> +                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.=
5.img.xz')
>> >
>> > The Armbian 20 is not available on this link anymore. I can browse jus=
t 21.
>>
>> Cat-and-mouse game *sigh*.
>>
>
> Just to clarify here: in this patch I wanted to only make the change to r=
emove the test for the 19.11.3 image.
> And in the 3rd patch (tests/acceptance/boot_linux_console: change URL for=
 test_arm_orangepi_bionic_20_08)
> do the update for to correct the 20.08 link. So each patch fixes one prob=
lem at a time.
>
> Does that make sense, or do you prefer that I combine them in a single pa=
tch instead?

Ops, I forgot about the 3rd patch in this series. That makes sense to
me, sorry for the mess.

>
> Regards,
> Niek
>
> --
> Niek Linnenbank
>

