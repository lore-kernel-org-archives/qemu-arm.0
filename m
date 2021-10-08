Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2390739lfp;
        Fri, 8 Oct 2021 04:20:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkEDTI+0r1+yNkRadZi8gpPzpnKqTZkpuxeyF8YyMtTMb9HnOYsHpX9ZXv5uB9vuwM7vom
X-Received: by 2002:a05:6000:1acd:: with SMTP id i13mr3204132wry.351.1633692032304;
        Fri, 08 Oct 2021 04:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633692032; cv=none;
        d=google.com; s=arc-20160816;
        b=OKRma9KwHAj/7Vxkw30adoy3jLPP20He1OCIuahOMjQRN6LYQS5KeWpc3Jp3fbaoKW
         2icLuXaLDIcMHbo2acvsoUdjVdWsizTgTaR279u//Eu7O3KXyA2yN1oqntJQQI/AYxUu
         IQSlShi0GDAuFHtyb74G31qZq7TvmiRXYmOfFfJGlYffCfR4saefCK5H0Yk9HGNe7F+o
         JTatn3oV3KrrGNVaPprf1pH5B02DcDOeCds6B9NJ2GF0IE59NfB1Ifpa5uiKXDb9cJCz
         7ieyxQd1VkB/eD6AouirN5g8//+BHItzMOdzolK/qamDE7VDJBJWLdB0UuM59RRGLRyf
         E1wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=njdwS3qA9HYLmO7MOo128edRCaGaQP5rQMro/Xs8WiY=;
        b=CgY5vJph3tj4ajG4l7g9XEQ04EkWjuD5HS97fCiTqMWZVJCYETfAnyOKVKwB0gZSh2
         9O+isMpd5HOMWPBCRZqLGLF8hKpNESSHrKpoG0RNwZFc/UxyozHvQukTRncwEs/IvhZc
         6XMkUqIrB/+ZSDA3EGE2wfTGUT22HqGIC7HIFThb7gEsJix3t2BbdUF9GVANI86uR9NH
         iQJ4Ld3k3x4AdUkv88mwxgQiBBV+9h312jgUoSalpJBcfFyw8RdaVGssZJrwdej8MQLR
         RBo3FmaVCmmBUy8sMZquSxV/aGPgpksw1sJvqP0UWm1x3kIQ+l6AvyJjMbAkhs2LURQW
         L1Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 217.72.192.74 is neither permitted nor denied by best guess record for domain of arnd@arndb.de) smtp.mailfrom=arnd@arndb.de
Return-Path: <arnd@arndb.de>
Received: from mout.kundenserver.de (mout.kundenserver.de. [217.72.192.74])
        by mx.google.com with ESMTPS id s13si3241961wrv.193.2021.10.08.04.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 04:20:32 -0700 (PDT)
Received-SPF: neutral (google.com: 217.72.192.74 is neither permitted nor denied by best guess record for domain of arnd@arndb.de) client-ip=217.72.192.74;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 217.72.192.74 is neither permitted nor denied by best guess record for domain of arnd@arndb.de) smtp.mailfrom=arnd@arndb.de
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MGygv-1mVDHI2rA3-00EA0l; Fri, 08 Oct 2021 13:20:31 +0200
Received: by mail-wr1-f50.google.com with SMTP id t8so28901272wri.1;
        Fri, 08 Oct 2021 04:20:31 -0700 (PDT)
X-Gm-Message-State: AOAM533lcUDMrmo2Ansd1VBvnKB4UypNH5APbgNFRDMP/ZS6aucZHf9K
	i9lpFNe2UoFH+Vxkz38FAx8shX64PWw98H1JfpI=
X-Received: by 2002:adf:f481:: with SMTP id l1mr3209844wro.411.1633692031269;
 Fri, 08 Oct 2021 04:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <877deoevj8.fsf@linaro.org>
In-Reply-To: <877deoevj8.fsf@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Oct 2021 13:20:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a09c2wFUMargRkonYQA6mUMnGK-+Lmrt4rDGEog5M3+6w@mail.gmail.com>
Message-ID: <CAK8P3a09c2wFUMargRkonYQA6mUMnGK-+Lmrt4rDGEog5M3+6w@mail.gmail.com>
Subject: Re: Approaches for same-on-same linux-user execve?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, Richard Henderson <richard.henderson@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, assad.hashmi@linaro.org, 
	"Eric W. Biederman" <ebiederm@xmission.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Arnd Bergmann <arnd.bergmann@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2U6gW095DVeUQSX2SGx8hs3E/eQ94EIzZsM2DUwvgC6kqUZoYzy
 Y7lrg7OJpuS+s4WhbJA3p/4lhgySSaTkBi8VzdhyhCNVx964gfpWOMgImthGuS0w6Hguv1/
 qPm7uZlcZb/ifEwiZTj17B6wHx8CGxg9gTI8QTDL7hzUeDn8f2ez4bxCFAcjZ7W2BF2HENr
 YGaghrq28HPDp2cZ8uusw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4WSSLnnvX3Y=:++3z6EmfKdclcSV40ykaOK
 WRP0OLnZ8QexJbGeFmvZRdH+5Q93n1karYu7VMM5eJ2USk2iHmjMkHAfPEqKCYruhbpY4F2/z
 4aiQLhpTq09yHBEIvjgCoxPD1TyRTtwnHqnoy7cqMDob5qSWS8E0+fSFxHjNPGZv8RzLnbdAJ
 eVW9wrhDWLgqSE/idgU1DN7VL+iSEDOku3tE1EJnhMjwNo0jBmrkgGEriAINq6bBfp6fnE9QC
 j+HEfLA6PFA6EEXIexlj2Ua7gGK2OnqyXMUr4thF0ts/WAX0zxS5d0rPqaZzZCx6QtIpndCZb
 Ri1C2zJsz3TTv92sBUAVmWTk7CvVkjChH7/NorILHUlEKMPODpXhh1dARCQKpV9ij9tBh+6wn
 HUL38sYma6B4EQ0uKwctWeiJLgA+NTiXVINVSpWnYJ/idEAhnB4ZJfcNHj9equaG+0w0AoxrF
 Z+8N/73bsvwf0xkAWyv5FMPDYa1AAJtJF4QlP5LOTgAWsm4ejtsyrVsCkBSqyi/sV7AzMkoUf
 Hus9W/8RgbV+CIAbrlZxDUjWyeR2DiNnrNDRbdTH4glKKYWqgKUPWn2CyA+qYvNnxgt8T7Fzj
 OKUhC9bLRAbX1dwpc4Ut11meOIfabfRX9VJGRFcT57+iNEN79uzR7CPI00sCo5AW6875RjYLe
 hkusPMKrO6PxfTLTmL+MvMOwI8TpvwM59TQN+saGd3UAa/QddcNG0yREexZ7uxYtE6uL16+OF
 D7V07hZXW435/c2aGiN6X0BOH0l5BIJdPCjnIQ==
X-TUID: UOSbfQungyaG

On Thu, Oct 7, 2021 at 4:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> Are there any other approaches you could take? Which do you think has
> the most merit?

Reading through the ELF loader code in the kernel, I had another idea:
If qemu-user could be turned into a replacement for /lilb/ld.so and act
as an ELF interpreter rather than a binfmt-misc helper, this might address
a lot of the issues automatically.

It would need to be a statically linked binary so it doesn't itself require
an interpreter. It would have to do the job of ld.so in addition to
the emulation, but it could do that by finding the real ld.so somewhere
else and running that in emulation mode. It would also not work at
all for statically linked executables.

Not sure if that makes the tradeoffs better than your other suggestions,
but it seemed worth bringing up.

       Arnd
