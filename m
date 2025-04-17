Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp639771njk;
        Thu, 17 Apr 2025 02:27:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:4484:b0:73b:ac3d:9d6b with SMTP id d2e1a72fcca58-73cf293357cmr3404606b3a.4.1744882055458;
        Thu, 17 Apr 2025 02:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744882055; cv=none;
        d=google.com; s=arc-20240605;
        b=O/gu7w55Vby+11/wmF31hnTrxg7gt0zyAgACkcsIhXZtfLtvMQI+u06Vtn2rSWeibc
         ZJzbBYuWRKWUffF+flOrork+AZr8Wa9P3avyO/mrpH2OJgOelRVTfPrNoodO1dEJ88L4
         g8/VKHsNsCynCPmnRx5SYJcXkkGBMYZIey4AB79QbacFbYphRqOfffoTki/a4lZX80Pz
         80asoZ+Ft5UNOcq4vjCM8qaBB3KFzkVjW4uoSWpiPLORutLYiQ6kDn2/XDadtK80L7qf
         bDAGjA0U3zZdFO1vFVyIPlaCABifNcb1MyziUG2DxzMawa7NpoWzrnWdbhjUGFKJ6hSc
         PITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Rmq6tnV3oobqPR6ZeDk8CKR3QdvTx9T6LSTEeuuSMFg=;
        fh=+iRxevmgakKJdfD9Ht/yJ5gYP7NJTDiGIBh3Keo8Qjo=;
        b=fyyCtOV6bHssTUPRA/jKhPLqos5XS8gU2Hq7mB6vkTXT4H/n2AI7uojMMRU7Agj9yE
         5kcpxZc66N8aPyx5DDE3MHa9sW+aOBPJCbkIfOK/WFFz/UfbY6kk3p2nb5EZdX9Toj6X
         PNRG3lIYv9wJa+i3KasDpBUQ9Ocf4hCmFydULIGBcrS82/SuflwRZA/gQE4Bwro59+QO
         MceSGwAU877IdQ/ejCEdHg7QkEV9xvsohKpuP+NRVx8A/wktn4P6tvZ11knW5vk2PbJ/
         Fan0Y4L72aOnkGUF383JIM3MZvAbuuCIfvBFnpYMbo/pBPVaLBEjMpVoPVDSQ+E6qTho
         HepA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IaNNUPHz;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73c225f4062sor1960127b3a.5.2025.04.17.02.27.35
        (Google Transport Security);
        Thu, 17 Apr 2025 02:27:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IaNNUPHz;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744882055; x=1745486855; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rmq6tnV3oobqPR6ZeDk8CKR3QdvTx9T6LSTEeuuSMFg=;
        b=IaNNUPHzfW2abi4VT/VxW2K8CLYoUxcaT1rLTRjAVhTn4ruTGRuBjrwILHElbEXw2/
         +2K6B+hJyqKDqv6gA7/ISujiM+wwZrS+lKCtWdzmp0YRxQnGceJBPWTCYibN8r5i60jd
         1C+IPZlNusa49qmhR8mXzQSJRXGpeJzt3bQi/O/5K+jGINiuWdBT/dKQ3xxxPQT4ulyZ
         ni99Nf88vWoTXLZTkwgiGLFjuU/6ED5GUWVASl1Wut1i+GsRe8PeJL53BArPKwRT+tUX
         ITKLXvUAUeTxFiFsVClr5qmyxNhrJ4/MI/0tP/IkFmzQtlJGQwafWfvo86MBxK/DagIC
         65ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744882055; x=1745486855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rmq6tnV3oobqPR6ZeDk8CKR3QdvTx9T6LSTEeuuSMFg=;
        b=vav+rtvAiz/JucsSksosM5ff82PEGQNHYL0qo6P43pQtkTiGkqUPyZTCwD3Xp5DgS2
         GKynCkPIBKD8/LtoHPZIprX48KciWHIU4JHrtFGLYMGq9fOPEeK9qDRdZk5AKiEux0qO
         7M+Qfsd2Bb7q2j7M38cZCrEnqwlibtzZl0kHA+602QMEApcR7Euqhv2UIqNDWOrcJ4Zq
         bZcq6pSWspwUQ1Jq/P4vgoYjBeuPAPVBgz/0URxOkbIiBNI/PMDchivwcKElmE65dEVa
         YrPoYWEt9JmWqig7AaUBui9grQYtL4pJeiRXd0naIqyWPjmjmT0102sKC9JsA+cegmif
         JXPA==
X-Forwarded-Encrypted: i=1; AJvYcCU2jkSgogMUZXGZfcT2ssj/djCTdpbea4Mi42kOL2XbJYlvM14DZaNA3uNgknlDj3KG1sxlojzUoI3zTJs0Czvld7s=@linaro.org, AJvYcCUi6aCQPhzOS1P/XvdDnyCFtV8Upg9YvoB+ZIswtp4xEAzyllV2r3LSC56AW1VSkUOqaumwXddPzfTBWJi0@linaro.org, AJvYcCWsLW+rkbByT+LWHiVivvKItUw2mgOdEpGkcLI6yKyemP+lmR0BBDO0s6wW3649I+8ko+j2t3r3Hd2iqDuqMcLr4g==@linaro.org
X-Gm-Message-State: AOJu0YxQ9/J6NWPDYnglX/6opa/MJKOuU2voGd9PKWtn4o3WmQbT5zt6
	3bf6siXD1OKdlBBe0ioiP99dykVO7MO5L5Ll+7+08jFPuh1Y4Sv2YlPv3N2LpaNSh+VJbAija6T
	5KhNhuutawu38q+bbwWIkB/w5WbmgxTNhJ5U=
X-Gm-Gg: ASbGncvtmUmix1UsmAdgX0Zc9sGeYR1bWt+hFYFDKaiwZdNJgS5nPqMzZV73T54BCwO
	z9NusSghb+/d10bXYx/HhipcPLeFD0Po7nZLO4eE1rWaVxWwp24kKxV9UaS51OO0BSVOnYO+Bs4
	vhlLgrm3Gpuxl5DcYtLEhJqB6gWtRtfr1BntvgBrOlEJ9EXH+429EIRR1w//pmvqI=
X-Google-Smtp-Source: AGHT+IGF+Vkrm9uDjKFzLmTshgVd8s7nlzAFtbfV/yAmDU8+/yUUoSqd7K7AfX6UvmF4lqNEtvM0CwXgZobg+fDYuXY=
X-Received: by 2002:a17:90b:6cf:b0:2fa:42f3:e3e4 with SMTP id
 98e67ed59e1d1-3086f3c7908mr3177332a91.3.1744882054787; Thu, 17 Apr 2025
 02:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <97a2164b3f428265136bb1c01615a16b516138c2.1744787186.git.ktokunaga.mail@gmail.com>
 <29330430-61a8-42c8-a87c-259f0cdbefe0@linaro.org>
In-Reply-To: <29330430-61a8-42c8-a87c-259f0cdbefe0@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 17 Apr 2025 18:27:22 +0900
X-Gm-Features: ATxdqUE7DUGXiaiXQZUUdbzbb-Cv03aYAE2cd1t2TtTNMflviKjNJHtvlmo3h98
Message-ID: <CAEDrbUYu-NH4Dwkby-UTtQpiy0ApN+Z4dwt+iOs_SZjCwfM_ZA@mail.gmail.com>
Subject: Re: [PATCH 11/19] util/cacheflush.c: Update cache flushing mechanism
 for Emscripten
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org
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
	Richard Henderson <richard.henderson@linaro.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000cfcd70632f603c7"
X-TUID: MM398TWDqUpn

--0000000000000cfcd70632f603c7
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

> The "why?" isn't clearly described.

Although __builtin___clear_cache is used to flush the instruction cache for
a specified memory region[1], this operation doesn't apply to wasm, as its
memory isn't executable. Moreover, Emscripten does not support this builtin
and fails to compile it with the following error.

> fatal error: error in backend: llvm.clear_cache is not supported on wasm

To resolve this, I've removed the call to __builtin___clear_cache.

I'll update this patch to include an explicit "#elif" branch with an
explanation, like the following:

+#elif defined(EMSCRIPTEN)
+
+/* Wasm does not have an executable memory region. */
+

Please let me know if I'm missing something or if there is a preferred way
to handle this case.

[1]
https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/Other-Builtins.html#index-_005f_005fbuiltin_005f_005f_005fclear_005fcache

--0000000000000cfcd70632f603c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe,<br><br>&gt; The &quot;why?&q=
uot; isn&#39;t clearly described.<br><br>Although __builtin___clear_cache i=
s used to flush the instruction cache for<br>a specified memory region[1], =
this operation doesn&#39;t apply to wasm, as its<br>memory isn&#39;t execut=
able. Moreover, Emscripten does not support this builtin<br>and fails to co=
mpile it with the following error.<br><br>&gt; fatal error: error in backen=
d: llvm.clear_cache is not supported on wasm<br><br>To resolve this, I&#39;=
ve removed the call to __builtin___clear_cache.<br><br>I&#39;ll update this=
 patch to include an explicit &quot;#elif&quot; branch with an<br>explanati=
on, like the following:<br><br>+#elif defined(EMSCRIPTEN)<br>+<br>+/* Wasm =
does not have an executable memory region. */<br>+<br><br>Please let me kno=
w if I&#39;m missing something or if there is a preferred way<br>to handle =
this case.<br><br>[1] <a href=3D"https://gcc.gnu.org/onlinedocs/gcc-14.2.0/=
gcc/Other-Builtins.html#index-_005f_005fbuiltin_005f_005f_005fclear_005fcac=
he">https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/Other-Builtins.html#index=
-_005f_005fbuiltin_005f_005f_005fclear_005fcache</a><br><br></div></div>

--0000000000000cfcd70632f603c7--
