Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp445172lfg;
        Fri, 5 Mar 2021 07:27:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyz5iuB036PZtwbMzpQZyau/LXFCMnWoyHnkBctv5vwxhgSE/oRsn55MyhXj5BC9erYdZGj
X-Received: by 2002:a05:6e02:8e6:: with SMTP id n6mr9263440ilt.74.1614958065988;
        Fri, 05 Mar 2021 07:27:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614958065; cv=none;
        d=google.com; s=arc-20160816;
        b=rvzSU8xbbvtWcFiv0jCCCAHQ2J7u6DCqmYoJk1Gugp4eKAKuSuEKLijmvDZwnrnWMw
         tusAydxiRJRoN7MhOu/fMEwJs/P5b4LExMrh48mP+UKQ2lgrX4WPCbg4EIGpjxl+Ohc2
         AXlo0ngbUniqxwjeDdI7P2veZjGaRz1dB5RKSnhSifKk2QZBfd2Dv0P7CTvP7Ml2CD0Q
         7vzy2ioaz128WDtWigX+OI80yazInI2AEoeCSxOc5SKuNqIGd/NxlkvQyq73BZHMPT2e
         2GrIJDCD/s+ylSV5ypauKWD0lHGZpJRpXxEgiD5QLHc8w3FybDJkw79mepLyXhwLiM26
         idYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMAUvqNGXNUP26qIooE+TI8ERGxpQYZlxXuohT5EjFw=;
        b=wzVZ/5V6+9C8pqhEUN3htQwYMBJeCfjlJ4Ug6ZJLIjZAi8vhltnBFRY4l7MTdNAYMe
         sLB3bk7tOToRfLUpzkXvO8SFKL/j70ixHAEkgYLXSCH3rS9U/bTGe9yogYOoq3uiAteo
         NPZkwtb3oB+hjv729IOeHllZFdN53qPYUvyr+SUpdKPSduvK1xJcCi9dBGbUw0AuPDZi
         0CyDArQaM+owCJV+xR0qFQqps1k6le34yIPn+oERd/IrUCxWROAHVtKO6aU6tkeAwphB
         Tv/Nb9bRwMzPh5i0BSH54zval7IZ5pWZQURLOZ96PPmdFkDzQZmVVnxHgezb778qeCXB
         xGSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JPOOX1xj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si2558301ilu.130.2021.03.05.07.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 07:27:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JPOOX1xj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lICMj-0005Bo-9t
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 10:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lICCF-0005zC-K6
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:16:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lICCD-0002bF-Um
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614957413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IMAUvqNGXNUP26qIooE+TI8ERGxpQYZlxXuohT5EjFw=;
 b=JPOOX1xjFVsU0NE1RobcKeW8KFVUtUphLXWkNVHQjmXRbZ5o+WnbIJvZrKyfYvtDCftx+E
 jLPqFYNTx3UBvFD4Z1t44pz3XTLvrsoB+XZwfHb1CR85yQ77S3gSkb7UQwro38OCpQJl51
 nFOzRuCrR4tI3WfuW129WTPjS0R7QyU=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-mM4rq5o8NKaRiV_Jpi9kmA-1; Fri, 05 Mar 2021 10:16:51 -0500
X-MC-Unique: mM4rq5o8NKaRiV_Jpi9kmA-1
Received: by mail-vk1-f198.google.com with SMTP id l2so703191vkl.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMAUvqNGXNUP26qIooE+TI8ERGxpQYZlxXuohT5EjFw=;
 b=VJZuShWpHnHBK4X3a5aepkaeItyXlYA9QyW3CLUmSTx5SSls6NMwa8q4Bd8Jzr8U8C
 8nJ+irovXbZponE4tU67HnoIFb27xbRexr/RgvBmT3hAXpBHex1m9xR351kKbRcVIM/c
 9q90aOsigffUOpy/Ed5snv4NOJquW7ahUHV0wJ3yM0DX5YyqUVnPEBrbDAbmUTy1k4HC
 t9bDiJDxTBVX4fjrWj3PLsCqMBMI0dlhnvdr2mxvCx5rmM4ZBExUtaCtKT+EFnDYWuGQ
 gppl6IFZCdNR/3Gz5EGMxXaefP4K9ff6gl8n3UskLy+eQ9MojByNmA0Bh9uMAdiWYect
 MuVg==
X-Gm-Message-State: AOAM533u8fXncZgOvw1JW0pymMEbNGFVG01XvmO+j+D0VJl0D/a6VdCN
 FfrFR6+06pvHhkBOYSZ7+jugPm31RdewLmaBV3/odH6oEk63TLHzoo2T/u8Maf8WU0eAVbEKBEp
 uy+jyYMztOExB3R/OZaxG8/bwLe9usEM=
X-Received: by 2002:a1f:8f17:: with SMTP id r23mr6899220vkd.2.1614957408856;
 Fri, 05 Mar 2021 07:16:48 -0800 (PST)
X-Received: by 2002:a1f:8f17:: with SMTP id r23mr6899011vkd.2.1614957407194;
 Fri, 05 Mar 2021 07:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
In-Reply-To: <20210304203540.41614-3-nieklinnenbank@gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 5 Mar 2021 12:16:21 -0300
Message-ID: <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 b.galvani@gmail.com, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GtwEF94cAtsI

On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> The image for Armbian 19.11.3 bionic has been removed from the armbian server.
> Without the image as input the test arm_orangepi_bionic_19_11 cannot run.
>
> This commit removes the test completely and merges the code of the generic function
> do_test_arm_orangepi_uboot_armbian back with the 20.08 test.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  tests/acceptance/boot_linux_console.py | 72 ++++++++------------------
>  1 file changed, 23 insertions(+), 49 deletions(-)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index eb01286799..9fadea9958 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
>          # Wait for VM to shut down gracefully
>          self.vm.wait()
>
> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
> +                'Test artifacts fetched from unreliable apt.armbian.com')
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
> +    def test_arm_orangepi_bionic_20_08(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:orangepi-pc
> +        :avocado: tags=device:sd
> +        """
> +
> +        # This test download a 275 MiB compressed image and expand it
> +        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
> +        # As we expand it to 2 GiB we are safe.
> +
> +        image_url = ('https://dl.armbian.com/orangepipc/archive/'
> +                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')

The Armbian 20 is not available on this link anymore. I can browse just 21.

What if we change this test to use local assets, for people that have
them and for CI that has the files cached. See
https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00614.html
for details.

