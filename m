Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d7-20020a05600c3ac700b0040ea64a7bbasm8793065wms.30.2024.01.22.09.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:19:08 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 993665F794;
	Mon, 22 Jan 2024 17:19:07 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,
  qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/musicpal: Convert to qemu_add_kbd_event_handler()
In-Reply-To: <3b4481cf-e1c4-4515-a7e4-80915cbe2bec@web.de> (Jan Kiszka's
	message of "Mon, 22 Jan 2024 17:30:35 +0100")
References: <20231103182750.855577-1-peter.maydell@linaro.org>
	<871qadh8g8.fsf@draig.linaro.org>
	<9dff82f7-d997-4092-8b5a-cd21963826da@web.de>
	<87r0i9ofxi.fsf@draig.linaro.org>
	<3b4481cf-e1c4-4515-a7e4-80915cbe2bec@web.de>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Mon, 22 Jan 2024 17:19:07 +0000
Message-ID: <87plxtmgl0.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZNnrpYOdqTQ7

Jan Kiszka <jan.kiszka@web.de> writes:

> On 22.01.24 10:50, Alex Benn=C3=A9e wrote:
>> Jan Kiszka <jan.kiszka@web.de> writes:
>>
>>> On 19.01.24 12:24, Alex Benn=C3=A9e wrote:
>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>
>>>>> Convert the musicpal key input device to use
>>>>> qemu_add_kbd_event_handler().  This lets us simplify it because we no
>>>>> longer need to track whether we're in the middle of a PS/2 multibyte
>>>>> key sequence.
>> <snip>
>>>>
>>>> Well the key input all works as intended and looks good to me. I'm a
>>>> little disappointed I couldn't get audio working on the musicpal machi=
ne
>>>> but that is not a problem for this patch.
>>>>
>>>> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>
>>>
>>> Looks good to me as well, all keys still work fine.
>>>
>>> No idea what's the issue with sound, though. I think I haven't run the
>>> whole stuff in a decade or so, had to search for all the pieces first of
>>> all again. The webradio service original behind this stopped their
>>> operations, at least for this device, but manually entered favorits
>>> still work on the real device - I still have one, though that is
>>> starting to get some issues as well.
>>
>> I navigated through the favourites and after pressing some keys it seems
>> to indicate there was a stream of some sort (or at least a bitrate was
>> reported ;-).
>>
>> The main issue I was having with sound was with pipewire - this would
>> eventually generate a lot of warning messages because input devices are
>> created but I guess the model wasn't draining the input buffers so
>> eventually we get:
>>
>>   qemu: 0x7f1490259500: overrun write:5859188 filled:5842804 + size:940 =
> max:4194304
>>   qemu: 0x7f14902680a0: overrun write:5860128 filled:5843744 + size:940 =
> max:4194304
>>   qemu: 0x7f1490259500: overrun write:5861068 filled:5844684 + size:940 =
> max:4194304
>>   qemu: 0x7f14902680a0: overrun write:5862008 filled:5845624 + size:940 =
> max:4194304
>>
>
> I'm getting these here:
>
> pulseaudio: set_source_output_volume() failed
> pulseaudio: Reason: Invalid argument
> ...

Yeah I get that with -M musicpal,audiodev=3Dsystem ... -audiodev pa,id=3Dsy=
stem

>
>> Is your image just a hacked up version of the original firmware or
>> something we have source for? I guess there was never a rockbox port for
>> the device?
>>
>
> It's an original firmware, nothing hacked. I do have some sources here,
> but just partial ones: U-Boot, kernel, not the complete userland and
> even not all kernel drivers IIRC.

With -nic user,hostfwd=3Dtcp::8888-:80 I'm able to attempt to connect to
the webpage bit the documented admin:admin doesn't work. I can see
/etc/passwd has something set for admin.

I did find:

  https://musicpal.mcproductions.nl/

which has a bunch of firmwares but the mpimage.bin is raw data (not a
jffs2 partition) so I suspect that is something that gets unpacked
during the flashing:

  =E2=9E=9C  file Firmware\ 1.68/mp*
  Firmware 1.68/mp2image.bin: data
  Firmware 1.68/mpimage.bin:  data
  =F0=9F=95=9917:17:29 alex@draig:tests/testcases/FreecomMusicPalFirmware=
=20=20
  =E2=9E=9C  file ../musicpal/musicpal.image=20
  ../musicpal/musicpal.image: Linux jffs2 filesystem data little endian

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
