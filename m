Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp2371162lfu;
        Fri, 29 Apr 2022 04:37:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfdC6tAjG6ZCac0rn04Xdm9t3XE/8UUOOGclKOazpOxImaIAEAYDNwKOkrAf6LwRK/b1PP
X-Received: by 2002:a37:41d6:0:b0:67e:4494:c5e9 with SMTP id o205-20020a3741d6000000b0067e4494c5e9mr22794629qka.605.1651232222953;
        Fri, 29 Apr 2022 04:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651232222; cv=none;
        d=google.com; s=arc-20160816;
        b=Oobd4UsqPM9/eMrmghi4bH7XLJXCamZoakU81eQSAJFexTERSW9Oe3AEXk6kymxema
         LFl2jTP+c7wFIUhsNI/y2wRXaxth4dudm0PcskOTxyIj6X1oyc+PIf/JYe5dXv3cEQzg
         skp6qB/+5oXFqmWPhKfIePwaKGp7aN+dXeHnE+3e4qVsVIamgiU4ab0ni8y4Jdr1+gcW
         I3ha161izxAtb+g2gasCBQIa7u3TpqawPmy+Q0kYdr3KzWrRb6AW2aZkT02a5HQVsTaV
         Sl6z+Tpc9MdTvJaWyL7ScK7+ePE7qNuwqtMtEbNILY1d73bvwUp8hh8lE/E6H1H1gxHa
         xofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xs7xibSltSfFBYUjw6xBqS2e0JsXplY0AnS75z5I2Ak=;
        b=ozQERAJi2GEuWctBRamOpqoD3ic7M06n5fWrNDdKwsyg8I2PzauxM0nWQHVgxOolmD
         jxD/KHblN2FQ8afkXAiM7j2uEcIeQOFBIbQ+vVrTvLGlnDE4/ZJo8ZJArHU6F3Vb4qt2
         j4FIg4X8tXJEcZ94M6BtpLX4rCpw6S0+VJI5mtxVHAO4/E0r5Yp46eel2VRBQ4fnFGnG
         g7O0ty4+Xgtqg8bh3atQHWaEsIT9TeEYTsHiIcOmM7mao86NyYvhDDpxFc4r19GfGvTl
         u6vect+7GQBJ0uIaeia3U2Qw3POMq+7TG85bSc1bTb3ydBkDX8scp5CYz348AcoXvn9a
         tG9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=awS8RRta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020a0cb18a000000b0044998f0750bsi2279041qvd.325.2022.04.29.04.37.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Apr 2022 04:37:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=awS8RRta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nkOvm-0000xF-Co
	for alex.bennee@linaro.org; Fri, 29 Apr 2022 07:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nkOvb-0000wQ-LZ
 for qemu-arm@nongnu.org; Fri, 29 Apr 2022 07:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nkOvY-0001I9-Fp
 for qemu-arm@nongnu.org; Fri, 29 Apr 2022 07:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651232207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xs7xibSltSfFBYUjw6xBqS2e0JsXplY0AnS75z5I2Ak=;
 b=awS8RRtaa9T3XDbkB1iI6PLqhS51BCHDPMmMvWfcBWjM/0mk1AKE/D3DfNqrGzxeY/Nlc2
 WBlvrK7Nguv40dyALmRC6kww/KbIc0K4Olp+GmBL8zLhFbmVkG5NMkY5DYV8H6aUbN68yl
 YbyE0YA+3lLUc+4kxJAh6iIx4/ewij8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-Qq4GkZNQOcSdoWk7pSDQyQ-1; Fri, 29 Apr 2022 07:36:45 -0400
X-MC-Unique: Qq4GkZNQOcSdoWk7pSDQyQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l33-20020a05600c1d2100b00394059572d6so2326577wms.8
 for <qemu-arm@nongnu.org>; Fri, 29 Apr 2022 04:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xs7xibSltSfFBYUjw6xBqS2e0JsXplY0AnS75z5I2Ak=;
 b=g9RE/LSPmb/HbM938xeSxq1/dFNVWmZAMujQB7XvqpYFJYmk229JV0KmmbGs8HKRQv
 92OPNFb1c0qZHTZZ1raWVQrS+KnssymN5haPRMgaBOr1570d9J6UePzhI0c+e0FCxD6H
 tWRSNnIq0FC3EvHcga6qIV6w2DdGFHkTybbn3hW5vGacKM9h9KSFjcy1Mi6z4syhuOhE
 TAUJ4WDRwTKzmlFvqwBlUCMG1ih6m9VsdGG7xK9kuvsoO7LkRl6ZoShf4l610SxbygrR
 mF+r5pLicEepWVpZphjiZ7Ex2fgteUG0fRqU23N8FU6MBgosiQ2Ycc6vzjMGeTCR/Emn
 i0lQ==
X-Gm-Message-State: AOAM530hf9efQ/UvCFDYg3UAHdKJGZaNK+3ccjiP02j45/lGOchyA2/e
 Ugk1MZtK5T/We5YbhYpF5zQMt66DcUQgMXljp7FZP3vHLnKwlRlX0BTZRw2BpqcGwXvA4HSr4/I
 kmctY3jvjc5Vo
X-Received: by 2002:a5d:47aa:0:b0:20c:4b28:3aab with SMTP id
 10-20020a5d47aa000000b0020c4b283aabmr1696563wrb.142.1651232204433; 
 Fri, 29 Apr 2022 04:36:44 -0700 (PDT)
X-Received: by 2002:a5d:47aa:0:b0:20c:4b28:3aab with SMTP id
 10-20020a5d47aa000000b0020c4b283aabmr1696527wrb.142.1651232204155; 
 Fri, 29 Apr 2022 04:36:44 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 o30-20020adf8b9e000000b0020ae802da1fsm2540537wra.90.2022.04.29.04.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 04:36:43 -0700 (PDT)
Received: by wheatley.localdomain (Postfix, from userid 1000)
 id 1706D6929894; Fri, 29 Apr 2022 13:36:43 +0200 (CEST)
Date: Fri, 29 Apr 2022 13:36:43 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 07/18] Introduce machine's default-audiodev property
Message-ID: <YmvNyzUtCmL59gi8@wheatley>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <49192ccd62fc98c474bb0b627a22cc28a634e8b8.1650874791.git.mkletzan@redhat.com>
 <Ymaq1ouZVKD5kZfV@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a6QkXSPlD76aLoSD"
Content-Disposition: inline
In-Reply-To: <Ymaq1ouZVKD5kZfV@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>, Alexander Bulekov <alxndr@bu.edu>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PycJQoAYMqiK


--a6QkXSPlD76aLoSD
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 03:06:14PM +0100, Daniel P. Berrang=E9 wrote:
>On Mon, Apr 25, 2022 at 10:21:50AM +0200, Martin Kletzander wrote:
>> Many machine types have default audio devices with no way to set the und=
erlying
>> audiodev.  Instead of adding an option for each and every one of them th=
is new
>> property can be used as a default during machine initialisation when cre=
ating
>> such devices.
>>
>> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
>> ---
>>  hw/core/machine.c   | 23 +++++++++++++++++++++++
>>  include/hw/boards.h |  1 +
>>  2 files changed, 24 insertions(+)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index cb9bbc844d24..d055a126d398 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -596,6 +596,22 @@ static void machine_set_memdev(Object *obj, const c=
har *value, Error **errp)
>>      ms->ram_memdev_id =3D g_strdup(value);
>>  }
>>
>> +static char *machine_get_default_audiodev(Object *obj, Error **errp)
>> +{
>> +    MachineState *ms =3D MACHINE(obj);
>> +
>> +    return g_strdup(ms->default_audiodev);
>> +}
>> +
>> +static void machine_set_default_audiodev(Object *obj, const char *value,
>> +                                         Error **errp)
>> +{
>> +    MachineState *ms =3D MACHINE(obj);
>> +
>> +    g_free(ms->default_audiodev);
>> +    ms->default_audiodev =3D g_strdup(value);
>> +}
>> +
>>  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *mach=
ine)
>>  {
>>      int i;
>> @@ -867,6 +883,12 @@ static void machine_class_init(ObjectClass *oc, voi=
d *data)
>>      object_class_property_set_description(oc, "confidential-guest-suppo=
rt",
>>                                            "Set confidential guest schem=
e to support");
>>
>> +    object_class_property_add_str(oc, "default-audiodev",
>> +                                  machine_get_default_audiodev,
>> +                                  machine_set_default_audiodev);
>> +    object_class_property_set_description(oc, "default-audiodev",
>> +                                          "Audiodev to use for default =
machine devices");
>> +
>
>Hmm, if we add this, people might reasonably question why this default
>audiodev can't be used for everything, instead of making other 'audiodev'
>parameter mandatory.
>
>For the x86 machines we have a property tied specifically to the PC
>speaker.
>
>  -machine ...,pcspk-audiodev=3D<name>
>
>
>If we assume that's the desired pattern, then every machine which has
>a built-in audio device should gain some  "{$device}-audiodev" proprerty
>where '$device' is some reasonable name for the built-in audio device
>of the machine.  This would work better if a machine ended up with
>two built-in audio devices and needed separate audiodevs for them.
>

Which is what I wanted to avoid because it creates huge amount of names
which are not easy to find out.  I imagine that the default audio
devices which already exist are not much known and mostly used as-is
without the users needing to figure out what they are.  Especially those
that are enabled even with -nodefaults.  And I expect people who just
want to just emulate an old Palm do not really want to specify the names
of both devices which need an audiodev, especially when one of them is a
touch display or something weird like that.  Moreover you cannot specify
anything for these devices currently, so you cannot use two different
backends now.

I understand that the naming suggests it would be a default audiodev for
anything without one explicitly specified, but I could not think of any
other suitable name.  And I felt like having a default that would be
used for all devices defeats the purpose of removing default audiodev.

If adding a machine option for every such device is the way to go, then
I can try changing that.  Hopefully that would not turn into another
18-patch series =3D)  So should I prefer that route?

>
>>      /* For compatibility */
>>      object_class_property_add_str(oc, "memory-encryption",
>>          machine_get_memory_encryption, machine_set_memory_encryption);
>> @@ -961,6 +983,7 @@ static void machine_finalize(Object *obj)
>>      g_free(ms->device_memory);
>>      g_free(ms->nvdimms_state);
>>      g_free(ms->numa_state);
>> +    g_free(ms->default_audiodev);
>>  }
>>
>>  bool machine_usb(MachineState *machine)
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index d64b5481e834..5be1de50af03 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -346,6 +346,7 @@ struct MachineState {
>>       */
>>      MemoryRegion *ram;
>>      DeviceMemoryState *device_memory;
>> +    char *default_audiodev;
>>
>>      ram_addr_t ram_size;
>>      ram_addr_t maxram_size;
>> --
>> 2.35.1
>>
>
>With regards,
>Daniel
>--=20
>|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrang=
e :|
>|: https://libvirt.org         -o-            https://fstop138.berrange.co=
m :|
>|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrang=
e :|
>

--a6QkXSPlD76aLoSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAmJrzcoACgkQCB/CnyQX
ht1L6hAAmMVZ/BUDTGZsVp8Msf8pXJ6hsh+4ky0mjtXrSKwsf5j8EBZCgZsS2bkv
InA3tu9fZXKKiEv8EuZOjwRlqcsAw/m7aLbQRfuLlt2VBe9OBdiPBjzx471B2oTK
50TnrfcbMgwjoejjcM+xzjLfHH942DYL/WZwzqtsRCA1FJ1uXUM2ntU69rsc6IhE
xv3oLb+lE4icR5VOsXi+o6aIw5BMftBhZfHa/BwdstO2hrEChtQdY7afNRaRkSmF
MjVC0a8c7XqK57WZzqz5zAk+0RCI3s4p+hOwA3v7c1IeTv09h9euMqZ69kLyMylo
dOjos3hEF/accNB35M6SBzhzXwMjkLqe2EPHGo8cJqa+nz3I8dd7sje9yHhXr+nb
WzHpwZBJ705OPviOPqfBKMtl3mlfoRqoDxgcUDonoMOlUuWpNmdyKT7oP9Io8mMk
I6DvX0zBIgjRcC/2VAFjvaqVaeCD5TF51lXUEh07YH44JFseMAxCX+af5hxbRvhA
K/hsDnPHXmJx5c9wHFCwoRHPLq5CMpbMrmpsnv71QuF033zRPjV9q2N8x1vm/XKm
OwLjhL4ydxXcU+s43PiD8qbS63fgLlyYPFIwYdQynC51hk+1qhiWbQFTaoU0MaUw
p06DoTBa9bk8r1+vL4uzVlLm1Pci2SZ0IKWmDT21m+aVxJ2coYk=
=SorZ
-----END PGP SIGNATURE-----

--a6QkXSPlD76aLoSD--

