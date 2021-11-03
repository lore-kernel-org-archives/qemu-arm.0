Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z1sm1776304wre.21.2021.11.03.04.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 04:48:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B3D061FF96;
	Wed,  3 Nov 2021 11:48:54 +0000 (GMT)
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Simon Glass <sjg@chromium.org>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-arm@nongnu.org, =?utf-8?Q?Fran=C3=A7ois?= Ozog
 <francois.ozog@linaro.org>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
Date: Wed, 03 Nov 2021 11:39:32 +0000
In-reply-to: <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
Message-ID: <87ilx9jw7t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BmBUUWzUXv1y


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 27 Sept 2021 at 16:18, Simon Glass <sjg@chromium.org> wrote:
>> On Mon, 27 Sept 2021 at 02:48, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>> > So what is missing in the QEMU-provided DTB that it needs?
>>
>> Quite a lot. Here are some examples:
>>
>> U-Boot has limited pre-relocation memory so tries to avoid
>> binding/probing devices that are not used before relocation:
>>
>> https://u-boot.readthedocs.io/en/latest/develop/driver-model/design.html=
#pre-relocation-support
>
> It's up to u-boot to decide what it wants to touch and
> what it does not. QEMU tells u-boot what all the available
> devices are; I don't think we should have extra stuff saying
> "and if you are u-boot, do something odd".
>
>> There is a configuration node (which is likely to change form in
>> future releases, but will still be there)
>>
>> https://github.com/u-boot/u-boot/blob/master/doc/device-tree-bindings/co=
nfig.txt
>
> I think u-boot should be storing this kind of thing somewhere
> else (e.g. as part of the binary blob that is u-boot itself,
> or stored in flash or RAM as a separate blob).
>
>> Then there are various features which put things in U-Boot's control
>> dtb, such as verified boot, which adds public keys during signing:
>>
>> https://github.com/u-boot/u-boot/blob/master/doc/uImage.FIT/signature.tx=
t#L135
>>
>> More generally, the U-Boot tree has hundreds of files which add
>> properties for each board, since we try to keep the U-Boot-specific
>> things out of the Linux tree:
>>
>> $ find . -name *u-boot.dtsi |wc -l
>> 398
>
> If any of this is actual information about the hardware then you
> should sort out getting the bindings documented officially
> (which I think is still in the Linux tree), and then QEMU can
> provide them.
>
>> Quite a bit of this is to do with SPL and so far it seems that QEMU
>> mostly runs U-Boot proper only, although I see that SPL is starting to
>> creep in too in the U-Boot CI.
>>
>> So at present QEMU is not able to support U-Boot fully.
>
> My take is that this is u-boot doing weird custom things with
> the DTB that aren't "describe the hardware". You should be able
> to boot u-boot by putting those custom DTB extra things in a
> separate blob and having u-boot combine that with the
> actual DTB when it starts.

It's not entirely without precedent - for SPL (which I hope is secondary
program loading) we have things like the guest loader which expands the
plain HW DTB with some information needed by the bootloader and the
primary OS to load additional blobs which have been put into memory.

In effect the DTB is being expanded as a signalling mechanism similar to
things like fw_cfg and other things we use to control boot up. Whether
this affects the "purity" of DTB as a "just the HW" description is
probably a philosophical question.

I agree with Peter that just allowing the merging of arbitrary data into
the QEMU generated DTB is going to lead to confusion and breakages.
Indeed I wrote the guest-loader because instructions for booting Xen up
until that point involved dumpdtb and hand hacking the data which was
silly because this is stuff QEMU already knew about.

>
> -- PMM


--=20
Alex Benn=C3=A9e
