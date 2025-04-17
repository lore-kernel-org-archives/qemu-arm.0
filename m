Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp641830njk;
        Thu, 17 Apr 2025 02:32:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a0:b0:1f5:769a:a4c2 with SMTP id adf61e73a8af0-203b3edf9c9mr8052686637.22.1744882350110;
        Thu, 17 Apr 2025 02:32:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744882350; cv=none;
        d=google.com; s=arc-20240605;
        b=dSHa+ND8B1E17WVjwFAqgP5TNmOUnjhUvkTmzgJmuOgXXAJZvxLkiSx7AVjhfglbzY
         BEKDlC2a5DYtSyEL6jolxG74q5W77iqYkCZvutqkFVD3Pd2KSsnXIFAPRsPnWMSX1UuS
         O6wQRI+FpplLx2Kv0dX2dEIBKamJeMekoPDBY0jFJ/Vyp++WBueNvjPGDQI7mqLmnlZP
         eASUmB1RVoREDaYsSh6RMcY7kOjep5AfXV8Vesx6IK99Pao5QD/i0/qnJ7yNtKRtJCD1
         zHWswl/z4p3Si/176A0MEsffkChzcokFVfH42zyDPQMiNMO2J5siX28JxvzxJ4sbAzcH
         jOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jg9liQY2yP5Kh3RtgdI7xjFe5GA+ZZN449PB22RqFLM=;
        fh=bzgPMdzuujmObE1/eAUUH1BHga00wqZ6VHdfguj0lZA=;
        b=B9+EBXBICsznn1BWRn/vIFiViMzXwmwi/n8rASal65FHU3WLbWpQcJ8Ed4Wg/HVs8N
         s/71RjpIAhyAYXJxv/OdkEiZ3qcf9ixTjIPrG07Ykt06FTDYNQh5eCNPYxU5MH+3wLgN
         F75Qx/VnAkAui4ZcCDStI9oF2tiz1/07Z359rtmlfxKfacw7T8CS6zIVOZ+dw4YFrGbF
         taMeonbiWCgI9An9gNLZeW3SiwbENkh4/+SMSY7xgV1JI0OrWn7kS9P72tHA0QJeZy9T
         Htk2q+RF2plNNlaNS7kgoc0RpTjTKfxWOwBavXpNG0DNbocFZ/p7In0APHKM+DwPgiVj
         FMKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LcgOJ2za;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b03f8931e7csor9007525a12.4.2025.04.17.02.32.29
        (Google Transport Security);
        Thu, 17 Apr 2025 02:32:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LcgOJ2za;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744882349; x=1745487149; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jg9liQY2yP5Kh3RtgdI7xjFe5GA+ZZN449PB22RqFLM=;
        b=LcgOJ2zah64EiIw2T3CEPAtarZEW+Eu6z2IEzW4gaH400K9ztrYPjtutiKXzVJe6b7
         0IIXrouF7ZewDltSWQ5IniqRAzq2M4mpZelpMmdNX1b5DuFyuQWLmD2PsPkNVihYFiF2
         rur7pDXBuRqeX/W9ELZ4ZDLHMJcxy6SCpi3eD1HlAIJvFg61O9OtBvyJ3/0MN/QXpyF4
         DeAdBBuPuFcUFwmsO8hq97XNLmy8o+w3Xuh+8MbnopX/kEQq+nCznhwNSmjB10Vt6fVr
         EB6ZU2iaRty9UfSVhILPoiA+BgqH3Sf4CE3LTC9wLJS2Zh74h+goMc1YmvS0dVnNtXEP
         O/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744882349; x=1745487149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jg9liQY2yP5Kh3RtgdI7xjFe5GA+ZZN449PB22RqFLM=;
        b=sMfyTGcfAq8zzTU5Lj8Qlo8skdyoHg5ytBGSSCXJLhb3qdF6ngr0q7k3ZG1J1407Lf
         5n+4ffUUkWe6doaH5Dy0xMSYzUVW1kk50KqJliy1+AF9l3XOhboT28qeE/gtNsqA3eoB
         AYpRSlS/5qmqbjhAViKX9XpaqvZxazQC+9qpPqAHElJJr4xGrrOB8paBMQm4uAcGQC5n
         0nHxqn7f/rryQJsvTtuUbb/Kbo7vnIV+yEQbd+FXLuv3O5ApwWwSX+aUOTQ8cG9whjQT
         4UgkXQCUc4eWEYKWYY+A6TH+2cCdv/iYyIAQbspt0/OuJFmu2e/jT6Ms/PIvqtF0/eUl
         KDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOPIrsuB+E37p90B63Q0s+z8rUhZeVUhN9noKewxhSIdR7GfDFoXr68vtGK+sPELbshPWW58DQdNTy+ROWv11Ffg==@linaro.org, AJvYcCXWA1fm6GX9YyjElIw+VUX4RRVz2mYx0b+uUfGXF56s3NViFoWf/rwEavkZpFP4GLqzULsENZcaGKpLLDHm@linaro.org, AJvYcCXxtactVTYP8uCvDnlcv96o6o2YKes1NDBSmjo5440xafXXDphkcLiprkYuwO795xatc7EeyJiqTDTzoiSBSMutQD0=@linaro.org
X-Gm-Message-State: AOJu0YwygAoG18p7syvAbtoxTJl+SQP29bRQZadWfrCA16WbYKMPU1N3
	TcVmW6qasz3PwXJYrGbpTGogCl7rvbsxH6wrV5LwNArwCvClvv0sLSvh2070Sf/duHmqlAaeTmh
	seOaf6EckqgBoJLM1JJTOL0eyLn+hy6kaM4E=
X-Gm-Gg: ASbGncv5bAT0biKnL2/jXE0yHOwtugSl/42PS4+KnXHjP0O0ggyXioqPa34dAJXlffR
	qxc6PygXkpAL89O7AWXU1wa8tkj9CJ1tDkZ0rCJz0AZRvazIElJ9LVKzREP9erV0KTlEVrShnJx
	UcmLC1V6yxPedhYWCFT87HTM8YyHiKRbonXVAI6PpV7WtNj5eSo5cSNaZ3B1WyRL4=
X-Google-Smtp-Source: AGHT+IF9pYKO14rulbqXlenJvlINTzUJkAGUA0aliek/nHp4sD+sVre5AM6ZYB1ZP7DJitiPcfZ6l9P0Gbm/9bQdhUo=
X-Received: by 2002:a17:90b:57e6:b0:308:5273:4dee with SMTP id
 98e67ed59e1d1-30863f2c4fcmr8184303a91.15.1744882349418; Thu, 17 Apr 2025
 02:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <9da41d784991f77e2c1f38d0781cd047b593e053.1744787186.git.ktokunaga.mail@gmail.com>
 <afe0abf1-2c33-47d8-bde6-8abc722eb212@linaro.org> <2d232dbc-4613-4352-8ede-3fd5dcefc32c@linaro.org>
In-Reply-To: <2d232dbc-4613-4352-8ede-3fd5dcefc32c@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 17 Apr 2025 18:32:17 +0900
X-Gm-Features: ATxdqUGGTv3OArB87npbRxwo9F2RaSZjhfG-gwWP-mNK2kFi5AGNRi4plJgSNmw
Message-ID: <CAEDrbUbQ2h1wj-KJqjYjcGPb4Pyp0te8ycy2DoJGENvT2+Mxcg@mail.gmail.com>
Subject: Re: [PATCH 12/19] block: Update block to compile with Emscripten
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Pavel Pisa <pisa@cmp.felk.cvut.cz>, Francisco Iglesias <francisco.iglesias@amd.com>, 
	Vikram Garhwal <vikram.garhwal@bytedance.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, 
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009cbd6d0632f61401"
X-TUID: hvM3TMzin879

--0000000000009cbd6d0632f61401
Content-Type: text/plain; charset="UTF-8"

Hi Philippe and Richard, thank you for the feedback.

> Actually what about checking the symbol presence in meson?
> Something like (untested):
>
> -- >8 --
> diff --git a/meson.build b/meson.build
> index b18c46d16a2..33185fdf315 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2654,3 +2654,2 @@ config_host_data.set('CONFIG_TIMERFD',
> cc.has_function('timerfd_create'))
>   config_host_data.set('CONFIG_GETLOADAVG', cc.has_function('getloadavg'))
> -config_host_data.set('HAVE_COPY_FILE_RANGE',
> cc.has_function('copy_file_range'))
>   config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
> @@ -2756,2 +2755,6 @@ config_host_data.set('HAVE_UTMPX',
>
> +config_host_data.set('HAVE_COPY_FILE_RANGE', cc.links(gnu_source_prefix
> + '''
> +  #include <unistd.h>
> +  int main(void) { return copy_file_range(-1, NULL, -1, NULL, 0, 0);
}'''))
>   config_host_data.set('CONFIG_EVENTFD', cc.links('''
> ---

Emscripten doesn't provide copy_file_range implementation but it declares
this function in its headers. Meson correctly detects the missing
implementation and unsets HAVE_COPY_FILE_RANGE. However, the stub defined in
file-posix.c causes a type conflict with the declaration from Emscripten
during compilation:

> ../qemu/block/file-posix.c:2019:14: error: static declaration of
'copy_file_range' follows non-static declaration
>  2019 | static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
>       |              ^
> /emsdk/upstream/emscripten/cache/sysroot/include/unistd.h:207:9: note:
previous declaration is here
>   207 | ssize_t copy_file_range(int, off_t *, int, off_t *, size_t,
unsigned);
>       |         ^
> 1 error generated.

If introducing a new stub isn't preferable, we could update the existing
stub in file-posix.c to match the declaration used by Emscripten. The
manpage[1] also aligns with this signature.

[1] https://man7.org/linux/man-pages/man2/copy_file_range.2.html

--0000000000009cbd6d0632f61401
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>Hi Philippe and Richard, t=
hank you for the feedback.</div><div><br></div><div>&gt; Actually what abou=
t checking the symbol presence in meson?<br>&gt; Something like (untested):=
<br>&gt; <br>&gt; -- &gt;8 --<br>&gt; diff --git a/meson.build b/meson.buil=
d<br>&gt; index b18c46d16a2..33185fdf315 100644<br>&gt; --- a/meson.build<b=
r>&gt; +++ b/meson.build<br>&gt; @@ -2654,3 +2654,2 @@ config_host_data.set=
(&#39;CONFIG_TIMERFD&#39;,<br>&gt; cc.has_function(&#39;timerfd_create&#39;=
))<br>&gt; =C2=A0 config_host_data.set(&#39;CONFIG_GETLOADAVG&#39;, cc.has_=
function(&#39;getloadavg&#39;))<br>&gt; -config_host_data.set(&#39;HAVE_COP=
Y_FILE_RANGE&#39;,<br>&gt; cc.has_function(&#39;copy_file_range&#39;))<br>&=
gt; =C2=A0 config_host_data.set(&#39;HAVE_GETIFADDRS&#39;, cc.has_function(=
&#39;getifaddrs&#39;))<br>&gt; @@ -2756,2 +2755,6 @@ config_host_data.set(&=
#39;HAVE_UTMPX&#39;,<br>&gt; <br>&gt; +config_host_data.set(&#39;HAVE_COPY_=
FILE_RANGE&#39;, cc.links(gnu_source_prefix<br>&gt; + &#39;&#39;&#39;<br>&g=
t; + =C2=A0#include &lt;unistd.h&gt;<br>&gt; + =C2=A0int main(void) { retur=
n copy_file_range(-1, NULL, -1, NULL, 0, 0); }&#39;&#39;&#39;))<br>&gt; =C2=
=A0 config_host_data.set(&#39;CONFIG_EVENTFD&#39;, cc.links(&#39;&#39;&#39;=
<br>&gt; ---</div><div><br></div>Emscripten doesn&#39;t provide copy_file_r=
ange implementation but it declares<br>this function in its headers. Meson =
correctly detects the missing<br>implementation and unsets HAVE_COPY_FILE_R=
ANGE. However, the stub defined in<br>file-posix.c causes a type conflict w=
ith the declaration from Emscripten<br>during compilation:<br><br>&gt; ../q=
emu/block/file-posix.c:2019:14: error: static declaration of &#39;copy_file=
_range&#39; follows non-static declaration<br>&gt; =C2=A02019 | static off_=
t copy_file_range(int in_fd, off_t *in_off, int out_fd,<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>&gt; /ems=
dk/upstream/emscripten/cache/sysroot/include/unistd.h:207:9: note: previous=
 declaration is here<br>&gt; =C2=A0 207 | ssize_t copy_file_range(int, off_=
t *, int, off_t *, size_t, unsigned);<br>&gt; =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ^<br>&gt; 1 error generated.<br><br>If introducing a =
new stub isn&#39;t preferable, we could update the existing<br>stub in file=
-posix.c to match the declaration used by Emscripten. The<br>manpage[1] als=
o aligns with this signature.<br><br>[1] <a href=3D"https://man7.org/linux/=
man-pages/man2/copy_file_range.2.html">https://man7.org/linux/man-pages/man=
2/copy_file_range.2.html</a><br><br></div>

--0000000000009cbd6d0632f61401--
