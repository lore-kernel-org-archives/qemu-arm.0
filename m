Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp48850njd;
        Thu, 17 Apr 2025 23:54:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:d704:b0:1fd:f8dc:7c0e with SMTP id adf61e73a8af0-203cbc4e941mr2816289637.12.1744959242600;
        Thu, 17 Apr 2025 23:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744959242; cv=none;
        d=google.com; s=arc-20240605;
        b=k5ytAZ7JYe2HjAXCbWpFNpSkNnkXmyE7lJDZ1YHGE6vf291I/0Hx4wY3wzjLIXXi73
         EMCbu5+j4ZqXddTYZ8ySQz4EnfeEGSf24g1mdBxIBcOBzf4SYrmiNMIhsUKj9Fr2atFW
         OjIYIaoCtI18xSTqkCikxBv1QXvZrQIrWt/7mbM9ayPkHWpDeQxOONl8qR2jNLC4wMZD
         D6lpZjWI7AmOFqjRh75M1fGaF6aEI7t2oDKrsKAESQiY9FlMppUE3E1uzWicAXL49MQ0
         UU6nVDGFLTsBprIggf+b3Dy4kLwlRBSl/qzVoJviS9Sk1shnPWX3s9H9XoOJW2y6PH7k
         2zmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YLEkyMApbPIGGQquRcY2VmYQsJL8RB3s9s0I1o7NgYw=;
        fh=OxzRQBxV0PfJPf7eRxsU/UZqozot5QxrNJ26Rwg/W6k=;
        b=XDVRrdqvnCcO2H6jHQMh9EPHO4Wc2FbbqJSWBJ5Bx4p08GIIBiCZ+49sQCdmTMEy4W
         Qn0byg/wUZcKcNV1r5Qe1Ua8lh3ZNIlcThU0jIXJ6WK8NAXLI8tv3nqYLkPEz8PAw8h0
         qn4bfNjV6fUhQxiPN99agS5nBxqXUPka36Yoqj1zNlCJkx+cYGV7gWD0Hy/CKc37kHJR
         kHerx070lFi/wwwBA682EaXUHSSl2kIQ+X8DSLCw8eaufX3mDOPZkg6tylidhCvJtqUG
         yIbVMoxnMbQUk5Sf5zEWKLLf9uUFM7koYTvY0iFSLD7CMMeOzESUHZXeBXexFV5TeKbw
         yJiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gX4a7sv5;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b0db120b9b7sor809935a12.1.2025.04.17.23.54.02
        (Google Transport Security);
        Thu, 17 Apr 2025 23:54:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gX4a7sv5;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744959242; x=1745564042; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YLEkyMApbPIGGQquRcY2VmYQsJL8RB3s9s0I1o7NgYw=;
        b=gX4a7sv5kCMSpTHtXjnTTMwW+mTthJInQzL7AVPQwGvXCV4ZZMOjc8qgWODZJTq81r
         ILj02KKTlEgNO0o85/GRKjzLOkjE1/fFPcwFhPvfUiKQpe5nq9jbKbFY8a4WawSi13Mn
         +IXseTMfxSbkA+QzlRsr7sJrqk/S+W8G2X9K/4tfgyq6NGRs5ozeUXO4AzpoaENybgio
         tkDr+r5I3AefRmb9ORXvdG4YK/zG0fVPiDgF28Bb+CDwLsF9QvWrYfsrNlAdcfn0fvZG
         2zrk14mcPENdriGEBM/Ab2iuGIbvHbEBiCK0MyVgzqwGu/jkez0DERlnLXAJQ8wwKC4Y
         fdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744959242; x=1745564042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLEkyMApbPIGGQquRcY2VmYQsJL8RB3s9s0I1o7NgYw=;
        b=YWItanV5/YUv07zjyfzXXLELEnpFFh67CymVpRERTH1hZTZe6Lp8XK9bIEc9SeE/HI
         fwVqcmEAX8BPOHhrA/E+khM+F+buvXgocRf8yjNJMtqa5x+xbMBTTEo2qzY1TiFOzcBA
         pFe6QQyrnfW/VjS5jBUVIHCQBWpriVFLLtL4A4YNR6eA9sc+PSZRYnzyY86DQ+xZ5LSh
         zhoF+7oIIgUeoi6bYkkok16BeSucuQahVwyoL1+310WPQ9REo9LPZHI2pCDD4YuxbC5D
         J2LmICFKyKENUm2bnj/STKylcm98avhP82PLHlQK02VDeViFvJIi+cGgrh+sSl+La4tD
         +bIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV53gnxN4zM+TlvZ5THNwsMfyrnNB+fkfBx/C2omK5nr4ftCTUheDarD8zQoy4L5fBw4WY7055j/lrkXkivSfieLw==@linaro.org, AJvYcCWTOrvNsakiAYFWbs61CVN926QwpYkrqoxGC8eB+8A+vGIwM9GVirgM2xmWGJhEKdtBiwL9V4zokC1dr9Vq@linaro.org, AJvYcCWUlKp9qgFH4MCA8iSfMdt+u7PDcYxJls0fcoZTfcB7JvV24O62DS+dDHcVRe7ntejRzk9p13hAAHAvNWej3fiSFBE=@linaro.org
X-Gm-Message-State: AOJu0Yy81QfMG1hlTEuKdPO/yF3IKw8dKQkbf/5QwCtEGthqrnLgE0aj
	bD69NnMPmM2htK/zO60O5A03pkBJAQ3cc2311g2vnOb3FSgR/Zd6AtU9FpCPMjxnS89dADxqYUT
	xTzC36AomtDPowOyJLcKVFNReis2Obo70eHs=
X-Gm-Gg: ASbGncu/q55RuMipv/9Vq7tIoGH9AP14p1aZV4RjcLhgwYlC/dkEB3yvNrMZf1LpBhz
	3badtlTiTJGFzCbb1HIb/HAam/YWYdKPy2lTNH5WPxOA47zC3Bvgez+sEAw9p48L2Qlthx7jl2f
	oiBBV1mgx8UeBIKfmXA0DLwQ==
X-Google-Smtp-Source: AGHT+IHkpfY5hHAFvYvTGFKYPidYXM/IL+jZhfak47UIbJcmuSAYn2S1dkxNea3orbH0GfDyxASc5nkUisjZICCumP4=
X-Received: by 2002:a17:90b:3b50:b0:305:5f28:2d5c with SMTP id
 98e67ed59e1d1-3087bb679c2mr2267154a91.15.1744959241732; Thu, 17 Apr 2025
 23:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <9da41d784991f77e2c1f38d0781cd047b593e053.1744787186.git.ktokunaga.mail@gmail.com>
 <afe0abf1-2c33-47d8-bde6-8abc722eb212@linaro.org> <2d232dbc-4613-4352-8ede-3fd5dcefc32c@linaro.org>
 <CAEDrbUbQ2h1wj-KJqjYjcGPb4Pyp0te8ycy2DoJGENvT2+Mxcg@mail.gmail.com> <e7f66ec8-ee38-453d-a6de-4ed8d5a54268@linaro.org>
In-Reply-To: <e7f66ec8-ee38-453d-a6de-4ed8d5a54268@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Fri, 18 Apr 2025 15:53:49 +0900
X-Gm-Features: ATxdqUELYxpc16CMfbZ7wEabwr_03yB3vJtXle1t0CMdpVlr73kuh4qY3JKExuU
Message-ID: <CAEDrbUYw2mp-UrYGXtEDSuwRP+8oC3nHq5s9VppGj=7f7_Gq_w@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000c04c5b063307fb33"
X-TUID: QeqxDPHeak6E

--000000000000c04c5b063307fb33
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

> If meson fails to link, it won't define HAVE_COPY_FILE_RANGE,

Yes, meson correctly detects the link failure when checking for
copy_file_range, as shown in meson-log.txt:

> wasm-ld: error: /tmp/emscripten_temp_oqvz296m/testfile_0.o: undefined
symbol: copy_file_range

and reflects this in the configure output:

> Checking for function "copy_file_range" : NO

> so you
> shouldn't get "static declaration of 'copy_file_range' follows
> non-static declaration" right?

To fix this error, I needed to update the stub implementation in
file-posix.c to exactly match the declaration in Emscripten's
headers. Specifically, I changed the return type from off_t to ssize_t and
removed the "static" qualifier. With this change, file-posix.c builds
correctly under Emscripten, and there is no need to add a new stub in
stubs/emscripten.c

The following is the patch updates file-posix.c to solve this error:

 #ifndef HAVE_COPY_FILE_RANGE
-static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
-                             off_t *out_off, size_t len, unsigned int
flags)
+ssize_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
+                               off_t *out_off, size_t len, unsigned int
flags)
 {
 #ifdef __NR_copy_file_range
     return syscall(__NR_copy_file_range, in_fd, in_off, out_fd,

--000000000000c04c5b063307fb33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe,</div><br>&gt; If meson fails=
 to link, it won&#39;t define HAVE_COPY_FILE_RANGE,<br><br>Yes, meson corre=
ctly detects the link failure when checking for<br>copy_file_range, as show=
n in meson-log.txt:<br><br>&gt; wasm-ld: error: /tmp/emscripten_temp_oqvz29=
6m/testfile_0.o: undefined symbol: copy_file_range<br><br>and reflects this=
 in the configure output:<br><br>&gt; Checking for function &quot;copy_file=
_range&quot; : NO<br><br>&gt; so you<br>&gt; shouldn&#39;t get &quot;static=
 declaration of &#39;copy_file_range&#39; follows<br>&gt; non-static declar=
ation&quot; right?<br><br>To fix this error, I needed to update the stub im=
plementation in<br>file-posix.c to exactly match the declaration in Emscrip=
ten&#39;s<br>headers. Specifically, I changed the return type from off_t to=
 ssize_t and<br>removed the &quot;static&quot; qualifier. With this change,=
 file-posix.c builds<br>correctly under Emscripten, and there is no need to=
 add a new stub in<br><div>stubs/emscripten.c</div><br>The following is the=
 patch updates file-posix.c to solve this error:<br><br>=C2=A0#ifndef HAVE_=
COPY_FILE_RANGE<br>-static off_t copy_file_range(int in_fd, off_t *in_off, =
int out_fd,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off_t *out_off, size_t len, unsig=
ned int flags)<br>+ssize_t copy_file_range(int in_fd, off_t *in_off, int ou=
t_fd,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off_t *out_off, size_t len, unsig=
ned int flags)<br>=C2=A0{<br>=C2=A0#ifdef __NR_copy_file_range<br>=C2=A0 =
=C2=A0 =C2=A0return syscall(__NR_copy_file_range, in_fd, in_off, out_fd,<br=
><br></div>

--000000000000c04c5b063307fb33--
