Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1596905wrg;
        Sun, 16 Jun 2019 08:29:02 -0700 (PDT)
X-Received: by 2002:a9d:22e4:: with SMTP id y91mr52347374ota.40.1560698942758;
        Sun, 16 Jun 2019 08:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560698942; cv=none;
        d=google.com; s=arc-20160816;
        b=Zw7lzyL41aUDXwHUuL46t5UCiACDD7wUPmfxboWBqiEPriWvHtQgwFk3Frc8d70V6q
         7l3tLhSeF6f7m8WW2EWkAIyGOBuxjgGo0epZjej8KD+c0Hk6Sm6VHbb5rSjUcLofjkuf
         68qBx/SahWqV+hVXcZ1eIcmaqMe/S8xnNrQx+IFhQ06p96AH6r+4oHB5cFxzlyYd/CYD
         27tB5DYIZaUwqdzMmeCgspQVm0hKL0enxRH9kG2M2ih27c0mixGxqdExpVNRtSonKhfz
         R4owiWTWBThvT+aVlrUTgiKngZQTUHqD5mUsIkJi/YVW8uqh7GRHUn0DYfFkgan/41CW
         qX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=vK2oPIWdX926GUcGpRQ9GL1RbklUyvCRcQMw7+hazb8=;
        b=kvYy8dOsBqk69OQ63WXl3ZcnqTrNTnPZ86XjK8sSPiZ2RAd7E9jp4W/fc4dKkXVNwh
         fuUGyehLhtV776M5HFwLG+A5od+Ju+PTXMA5Zzk7Lb6cTlOddfnULqpQ3JWlAud8OquI
         mGe0B7/8cl+lQX1YOj6dsQqCUh7DpomDebuFH/x+kH4hpVoj2dANMjoJmjOHWokf3fXk
         zDr9ysebTCZhLlMIwbIMhe96PJmrJKuAa8wh7Xsbd8Fffw7Mj4uWhIq1I1bDqpfqpfbu
         3pMi+Y9sxBOn3WUCxc2uu7O9X9e1NZse8NZTiyD1bTZHNJFu744xFGeHSL0Bbdi3FZiD
         H4Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mTM+odr6;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <aleksandar.m.mail@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l16sor3418393oib.19.2019.06.16.08.29.02
        (Google Transport Security);
        Sun, 16 Jun 2019 08:29:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mTM+odr6;
       spf=pass (google.com: domain of aleksandar.m.mail@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=aleksandar.m.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=vK2oPIWdX926GUcGpRQ9GL1RbklUyvCRcQMw7+hazb8=;
        b=mTM+odr6KdX0eBMiBRnRwhCCANR/YCMH9Ykxq7WcRPtje3A9mz1cBGL3Hd8aojwPSH
         2/afOJKbZhuovnINjMjb2uSl9eUd/ixR49H9uFZ/oCOwQ4O5VH1vuzB8Ns/OrCrd6djh
         A07QqeTd1EIuhN1gdfXGag4PKJMH9udd9hxMpWm7RqYVMwiID5yTTpn9Q/l3k2dTluRT
         b2H9brROds9vBysMzlSBUoJA3MG36WD4CLrUq5no1LDv7Z+M7+3Q2DuXXTY22Nf2u9jR
         HyR7L0VoTjFbu7GamRxcxneCVUtgRZZkRXfjGgN8lPvxryr/pnq3ZBifbVgC+ro6hBW5
         46Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=vK2oPIWdX926GUcGpRQ9GL1RbklUyvCRcQMw7+hazb8=;
        b=QgHmdDohcBX692eeq0qke60WOGxKn3A2ZpvB1pE8kPaiiRy89Js2Zj1NlyrmFE/8Nm
         pKfKYgfCpgkqgP8Kk6Z1OGAdxQvIlGZpCdEJU/aOGCsPwbDx1ahQVHKSNjzRMacneixB
         oEU4+lI5YHW7qhBG99XNTkhnzIF8eq5hm+LvmzwnPYxdv/MBmLIh7aYG/o8d+/iX+oAz
         cuDFcj7wvpXnWDLm5eBSqinWSDgGsolY2gi6NMCDq4KaemKCeamEwhUcjnb3Zn/kza3k
         YcBuAp9XhYlKF9JxmB4FVNAceuVHYoVc/+hGgmHE65hEeTBrX3oCN9p64OsMRXdB5nXK
         QdhQ==
X-Gm-Message-State: APjAAAUjRtsb4epBdQ0xt7wK0eFlwY1kgtF5L3r+PHap7YLZuDgLOZjJ
	hXeCBfjimdXzdwmxTB/w/AhLVsj91qEBGDhe988qlUl6
X-Google-Smtp-Source: APXvYqwgIiGIbcXzgePDeYz01EDCKPRHSoMIe0MTuQapCcIyL7EEKapTTak3/vGGYJIIhWTAUDOeFKK3ETEBvfoRmuU=
X-Received: by 2002:aca:c2c3:: with SMTP id s186mr7410618oif.79.1560698942297;
 Sun, 16 Jun 2019 08:29:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e4:0:0:0:0:0 with HTTP; Sun, 16 Jun 2019 08:29:01
 -0700 (PDT)
Received: by 2002:a9d:20e4:0:0:0:0:0 with HTTP; Sun, 16 Jun 2019 08:29:01
 -0700 (PDT)
In-Reply-To: <c81017d4-0ea0-99f3-854d-6ab4b514a15c@redhat.com>
References: <20190531154735.20809-1-philmd@redhat.com> <CAFEAcA9TJGq-8fMv2amQEEGz9QKCNWYwJxCXrjqSh=Yc87yTww@mail.gmail.com>
 <947e851b-4b95-3126-2eaf-d5d16f8b831b@redhat.com> <431872249.25606899.1559321648368.JavaMail.zimbra@redhat.com>
 <a3cbd83c-a942-25f4-d424-bbbc0013acec@redhat.com> <c81017d4-0ea0-99f3-854d-6ab4b514a15c@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sun, 16 Jun 2019 17:29:01 +0200
Message-ID: <CAL1e-=gEsF=-ttE5Ts=drjRGjOT9nCOmka+adj461U95w--sAw@mail.gmail.com>
Subject: Re: [Qemu-devel] [RFC PATCH 0/2] target: Build with
 CONFIG_SEMIHOSTING disabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm <qemu-arm@nongnu.org>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	Samuel Ortiz <sameo@linux.intel.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Aleksandar Rikalo <arikalo@wavecomp.com>, Miroslav Rezanina <mrezanin@redhat.com>, 
	Rob Bradford <robert.bradford@intel.com>, jhogan@kernel.org
Content-Type: multipart/alternative; boundary="0000000000000e9b7f058b728a6c"
X-TUID: EaoPuuKrP+zy

--0000000000000e9b7f058b728a6c
Content-Type: text/plain; charset="UTF-8"

> Aleksandar: Can we use SEMIHOSTING on KVM MIPS?
>

You can assume the answer is no, we can't. But James Hogan, who maintains
MIPS KVM, may have different view, and his answer would override mine.

Yours,
Aleksandar

> For ARM Peter said:
>
> "semihosting hooks either SVC or HLT instructions, and inside
>  KVM both of those go to EL1, ie to the guest, and can't be
>  trapped to KVM."
>
> Thanks,
>
> Phil.
>

--0000000000000e9b7f058b728a6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
&gt; Aleksandar: Can we use SEMIHOSTING on KVM MIPS?<br>
&gt;</p>
<p dir=3D"ltr">You can assume the answer is no, we can&#39;t. But James Hog=
an, who maintains MIPS KVM, may have different view, and his answer would o=
verride mine.</p>
<p dir=3D"ltr">Yours,<br>
Aleksandar</p>
<p dir=3D"ltr">&gt; For ARM Peter said:<br>
&gt;<br>
&gt; &quot;semihosting hooks either SVC or HLT instructions, and inside<br>
&gt; =C2=A0KVM both of those go to EL1, ie to the guest, and can&#39;t be<b=
r>
&gt; =C2=A0trapped to KVM.&quot;<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Phil.<br>
&gt;<br>
</p>

--0000000000000e9b7f058b728a6c--
