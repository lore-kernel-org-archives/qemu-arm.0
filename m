Received: by 2002:a8a:84:0:0:0:0:0 with SMTP id s4csp417461ocq;
        Mon, 3 Oct 2022 03:08:21 -0700 (PDT)
X-Received: by 2002:a05:622a:100f:b0:35d:862:7d87 with SMTP id d15-20020a05622a100f00b0035d08627d87mr15217292qte.328.1664791701155;
        Mon, 03 Oct 2022 03:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664791701; cv=none;
        d=google.com; s=arc-20160816;
        b=ZRNmh9vTK8vJEk7knKVIoqor5gr5n29CiI89yxZkEuVB4rAXZui0B1Hv0JsNhINaF9
         WqT0x0Kqq8cVwWhEGbG+nF5FDoTWAQvgSm3FuxO6Z+4jUTS4AR1cRtR2yAR9J2vdGuNr
         a42+qH7rYkTEQiniP5hklkWwXqKLhc+KG8h5+KaW25xXWNKuoKJ1EuWIKIcAGQrKB8dn
         cU6yzAGcbcfFDJvsQHo8FHTB3JZFgGfSkYeYCBiYt+0Mx68pI8RcegQzyytHG5J3N06W
         U9Ao2X0uFhJR6REo9XBC/oL0/Zg+vtSkmtrPC4RboyM1aJOJSz9iRgKiPUzNDKxfANYw
         II9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WbQyWeXVv/Uvf3u9MYTUnka9mu0yb8heu+71guWzDVM=;
        b=Me+DaJXXVmGqFK+Tqn817y3Ovh+YF+xZifnUDzQ/415U3MRW20fGchNLz+g2PD37nl
         aXEBsjGYffoJIXME9wHmKqmpDUItoCTbaMzzojfrp8ry8kEWCxZiTKpcKL3KzgpD6G7K
         9tfzP4T30aiBbNIPeGxDnika1Tv0CnB3OQfJ1ovq2GUo4l1jKhTyDvAOd+A+w+ftyGPc
         BZiTfUYjZ2TGVpw00h6qp+YEoDfUl0i28zWaPFf7SJt+otY/VSXlphkxf3SuU5NTOvTp
         QnfCzsNKWyEotzctOkYSy3w31T3BCVC0rm117NEWwZcQF0HWnx5YlZlPG2PkhJzJf51s
         JBUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="Y/0reL9j";
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m21-20020a05620a291500b006ce4050d69dsor2043649qkp.78.2022.10.03.03.08.21
        (Google Transport Security);
        Mon, 03 Oct 2022 03:08:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="Y/0reL9j";
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=WbQyWeXVv/Uvf3u9MYTUnka9mu0yb8heu+71guWzDVM=;
        b=Y/0reL9j6CYsH6JPP4Dpbv17qULyRH8gHqfi9awOROb5xwV9b6lM/B1Ug45R1nuWlM
         a+KzJoGc5KyCteJxhr9x7/F6YmvzPISj/wOxgshyAz7+m/d+wWO5btDJ9ownEf27cv+N
         VAAQlPh7p5sb7NC4GSP4066m8vLTafXiCGy1bHlaAuFplCX6VAOl2+XmGwH6O26AUZ2/
         ulzGRBIKcivnRJNBnujqjAUMlala36olTclDxEth1Vqi4Oq+vhhWNaitzQ+9fSNLWK8I
         CagRbF6aGt/j2IE5twnCJwX2hPlgm1mB1kQmgqNnn24DhbYDDMp+750f/doLSkOdyVFS
         hOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WbQyWeXVv/Uvf3u9MYTUnka9mu0yb8heu+71guWzDVM=;
        b=Wknv1r4qjKGJNAfTY3KwGMDnXDcDBM6JSHfxL0Qk47VgjHyVCs6dmox3KHC8H5qQKB
         JMLFR1e1clLprjgJbZy4TRGOF7Ai2Z6QeZeH9phW07P9uYwB4VrH2mCrbBM07p3uxLIq
         kdxMEPB/xWDG4hnwHXS4RmhMkp/PeqZT1IzaXjKmf0XSfR+5ig360DTPClm1ZaATpQXF
         rAkWykZxqS16YvZdb2nMoSwmKJPJvslyYOqdlzsGtCLMTg613jCL/3DmomzYhLs/hpaF
         5cz+DuK24eirFCQ+RyQYX+p6Hor7bJp7HyK4hbP5v5BfKJQOJLfqCqKcZ9chWhCuE1SB
         RLhA==
X-Gm-Message-State: ACrzQf0v1caclNwckOaOmf+4sfsNjrojKHItyNefyg7xSdJFEU4SrSoN
	ggZUk2E8/z7b6pPF+6wCpC3Z4LXXARoYJdRSm1o=
X-Google-Smtp-Source: AMsMyM6mOTLiRyFU5XZ8vrjHYhl5rtMjjVhWHSLHv79vy0/Kx60SB1boci2KZ4dLSyQx8yOKZiHcnvYpwWWPCqpSJdI=
X-Received: by 2002:a05:620a:1b8b:b0:6cf:4dbc:e0a9 with SMTP id
 dv11-20020a05620a1b8b00b006cf4dbce0a9mr12755498qkb.342.1664791700805; Mon, 03
 Oct 2022 03:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com> <CAJ+F1CJ3cTdNwZEQ5i+05mgYXXngyRAF6MoX6JFadsp9tKEgmg@mail.gmail.com>
In-Reply-To: <CAJ+F1CJ3cTdNwZEQ5i+05mgYXXngyRAF6MoX6JFadsp9tKEgmg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 3 Oct 2022 18:08:09 +0800
Message-ID: <CAEUhbmXXUcW0jb4VXBHeemjZoHD2fcnzMmfo=rX55BREN2KXHA@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tests/qtest: Enable running qtest on Windows
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>, Ani Sinha <ani@anisinha.ca>, 
	Bandan Das <bsd@redhat.com>, Beraldo Leal <bleal@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, Coiby Xu <Coiby.Xu@gmail.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Darren Kenny <darren.kenny@oracle.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>, Gerd Hoffmann <kraxel@redhat.com>, 
	Greg Kurz <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Joel Stanley <joel@jms.id.au>, John Snow <jsnow@redhat.com>, 
	Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Konstantin Kostiuk <kkostiuk@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Markus Armbruster <armbru@redhat.com>, 
	Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Qiuhao Li <Qiuhao.Li@outlook.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Willian Rampazzo <willianr@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org, 
	qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: gOA2+wn8VX/K

Hi Marc-Andr=C3=A9,

On Mon, Oct 3, 2022 at 5:26 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi Bin
>
> On Tue, Sep 27, 2022 at 3:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> In preparation to adding virtio-9p support on Windows, this series
>> enables running qtest on Windows, so that we can run the virtio-9p
>> tests on Windows to make sure it does not break accidently.
>>
>> Changes in v4:
>> - Do not use g_autofree and g_steal_pointer
>> - Update the error reporting by using the GError "error" argument
>>   of g_dir_make_tmp()
>> - Remove the const from tmpfs declaration
>> - Replace the whole block with a g_assert_no_error()
>> - Replace the error reporting with g_assert_no_error()
>> - Update error reporting
>> - Move the new text section after the "QTest" section instead
>> - Use plural in both cases: "on POSIX hosts as well as Windows hosts"
>> - Use "The following list shows some best practices"
>> - Fix typo of delimiter
>> - New patch: "tests/qtest: boot-serial-test: Close the serial file befor=
e starting QEMU"
>> - Drop patch: "chardev/char-file: Add FILE_SHARE_WRITE when openning the=
 file for win32"
>>
>
> Could you post a v5 rebased on the current master? thanks
>

Sure, will do.

> (I think most of the remaining patches are simple enough that I could tak=
e them in a misc PR if they are not picked by subsystem maintainers)

Thank you.

Regards,
Bin
