Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003e00c453447sm5290606wmc.48.2023.03.03.03.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 03:39:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 907B31FFB7;
	Fri,  3 Mar 2023 11:39:03 +0000 (GMT)
References: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
 <20230302191146.1790560-3-marcin.juszkiewicz@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>, Peter Maydell
 <peter.maydell@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Da?=
 =?utf-8?Q?ud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH 3/3] tests/avocado: add Alpine Linux boot on
 AArch64/sbsa-ref
Date: Fri, 03 Mar 2023 11:38:31 +0000
In-reply-to: <20230302191146.1790560-3-marcin.juszkiewicz@linaro.org>
Message-ID: <87bkla9i94.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: KCu4ZydKirJG


Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

> To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
> same Alpine Linux image on both.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  tests/avocado/machine_aarch64_sbsaref.py | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/mac=
hine_aarch64_sbsaref.py
> index e36e53d4d5..fdbde4b891 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -148,3 +148,32 @@ def test_sbsaref_linux_max(self):
>          :avocado: tags=3Dcpu:max
>          """
>          self.boot_linux('max')
> +
> +    # This tests the whole boot chain from EFI to Userspace
> +    # We only boot a whole OS for the current top level CPU and GIC
> +    # Other test profiles should use more minimal boots
> +    def test_alpine_sbsaref_max(self):
> +        """
> +        :avocado: tags=3Darch:aarch64
> +        :avocado: tags=3Dmachine:sbsa-ref
> +        """
> +        self.fetch_firmware()
> +
> +        iso_url =3D ('https://dl-cdn.alpinelinux.org/'
> +                   'alpine/v3.17/releases/aarch64/'
> +                   'alpine-standard-3.17.2-aarch64.iso')
> +
> +        # Alpine use sha256 so I recalculated this myself
> +        iso_sha1 =3D '76284fcd7b41fe899b0c2375ceb8470803eea839'
> +        iso_path =3D self.fetch_asset(iso_url, asset_hash=3Diso_sha1)
> +
> +        self.vm.set_console()
> +        self.vm.add_args("-cpu", "max,pauth-impdef=3Don")
> +        self.vm.add_args("-machine", "sbsa-ref")
> +        self.vm.add_args("-drive", f"file=3D{iso_path},format=3Draw")
> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=3Drng0')
> +        self.vm.add_args('-object', 'rng-random,id=3Drng0,filename=3D/de=
v/urandom')
> +
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Welcome to Alpine Linux 3.17')
> +

This seems to get to grub before hanging:

  2023-03-03 11:35:53,696 protocol         L0495 DEBUG| Transitioning from =
'Runstate.CONNECTING' to 'Runstate.RUNNING'.
  2023-03-03 11:35:53,700 __init__         L0153 DEBUG| NOTICE:  Booting Tr=
usted Firmware
  2023-03-03 11:35:53,700 __init__         L0153 DEBUG| NOTICE:  BL1: v2.8(=
release):v2.8-335-g6264643a0
  2023-03-03 11:35:53,700 __init__         L0153 DEBUG| NOTICE:  BL1: Built=
 : 17:51:50, Feb  8 2023
  2023-03-03 11:35:53,703 __init__         L0153 DEBUG| NOTICE:  BL1: Booti=
ng BL2
  2023-03-03 11:35:53,707 __init__         L0153 DEBUG| NOTICE:  BL2: v2.8(=
release):v2.8-335-g6264643a0
  2023-03-03 11:35:53,707 __init__         L0153 DEBUG| NOTICE:  BL2: Built=
 : 17:51:50, Feb  8 2023
  2023-03-03 11:35:53,722 __init__         L0153 DEBUG| NOTICE:  BL1: Booti=
ng BL31
  2023-03-03 11:35:53,727 __init__         L0153 DEBUG| NOTICE:  BL31: v2.8=
(release):v2.8-335-g6264643a0
  2023-03-03 11:35:53,727 __init__         L0153 DEBUG| NOTICE:  BL31: Buil=
t : 17:51:50, Feb  8 2023
  2023-03-03 11:35:53,732 __init__         L0153 DEBUG| UEFI firmware (vers=
ion 1.0 built at 16:17:37 on Feb  9 2023)
  2023-03-03 11:35:57,556 __init__         L0153 DEBUG| ESC[2JESC[04DESC[=
=3D3hESC[2JESC[09DESC[0mESC[30mESC[47mWelcome to GRUB!
  2023-03-03 11:35:57,599 __init__         L0153 DEBUG| ESC[0mESC[37mESC[40=
mESC[0mESC[30mESC[40mESC[2JESC[01;01HESC[0mESC[37mESC[40mESC[02;30HGNU GRUB=
  version 2.06
  2023-03-03 11:35:57,624 __init__         L0153 DEBUG| ESC[01C/-----------=
-----------------------------------------------------------------\ESC[05;02=
H|ESC[76C|ESC[06;02H|ESC[76C|ESC[07;02H|ESC[76C|ESC[08;02H|ESC[76C|ESC[09;0=
2H|ESC[76C|ESC[10;02H|ESC[76C|ESC[11;02H|ESC[76C|ESC[12;02H|ESC[76C|ESC[13;=
02H|ESC[76C|ESC[14;02H|ESC[76C|ESC[15;02H|ESC[76C|ESC[16;02H|ESC[76C|ESC[17=
;02H|ESC[76C|ESC[18;02H\---------------------------------------------------=
-------------------------/ESC[19;02HESC[20;02H     Use the ^ and v keys to =
select which entry is highlighted.
  2023-03-03 11:35:57,628 __init__         L0153 DEBUG| Press enter to boot=
 the selected OS, `e' to edit the commands
  2023-03-03 11:35:57,632 __init__         L0153 DEBUG| before booting or `=
c' for a command-line.                           ESC[05;80H
  2023-03-03 11:35:57,698 __init__         L0153 DEBUG| ESC[0mESC[30mESC[47=
mESC[05;03H*Linux lts                                                      =
            ESC[0mESC[37mESC[40mESC[01DESC[06;03H                          =
                                                  ESC[01DESC[07;03H        =
                                                                    ESC[01D=
ESC[08;03H                                                                 =
           ESC[01DESC[09;03H                                               =
                             ESC[01DESC[10;03H                             =
                                               ESC[01DESC[11;03H           =
                                                                 ESC[01DESC=
[12;03H                                                                    =
        ESC[01DESC[13;03H                                                  =
                          ESC[01DESC[14;03H                                =
                                            ESC[01DESC[15;03H              =
                                                              ESC[01DESC[16=
;03H                                                                       =
     ESC[01D
  ESC[17;03H                                                               =
             ESC[01DESC[02C
  2023-03-03 11:35:58,724 __init__         L0153 DEBUG| ESC[05;78HESC[23;01=
H   The highlighted entry will be executed automatically in 1s.            =
     ESC[05;78HESC[23;01H   The highlighted entry will be executed automati=
cally in 0s.                 ESC[05;78HESC[0mESC[30mESC[40mESC[2JESC[01;01H=
ESC[0mESC[37mESC[40mESC[0mESC[30mESC[40mESC[2J
  ESC[04DESC[0mESC[37mESC[40m  Booting `Linux lts'
  2023-03-03 11:37:51,367 stacktrace       L0039 ERROR|=20
  2023-03-03 11:37:51,368 stacktrace       L0041 ERROR| Reproduced tracebac=
k from: /home/alex/lsrc/qemu.git/builds/arm.all/tests/venv/lib/python3.9/si=
te-packages/avocado/core/test.py:770
  2023-03-03 11:37:51,368 stacktrace       L0045 ERROR| Traceback (most rec=
ent call last):
  2023-03-03 11:37:51,368 stacktrace       L0045 ERROR|   File "/home/alex/=
lsrc/qemu.git/builds/arm.all/tests/avocado/machine_aarch64_sbsaref.py", lin=
e 178, in test_alpine_sbsaref_max


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
