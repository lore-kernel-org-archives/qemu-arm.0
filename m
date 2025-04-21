Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp1512645njd;
        Sun, 20 Apr 2025 20:23:59 -0700 (PDT)
X-Received: by 2002:a17:903:3205:b0:221:1356:10c5 with SMTP id d9443c01a7336-22c50bf0412mr156105295ad.9.1745205838966;
        Sun, 20 Apr 2025 20:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745205838; cv=none;
        d=google.com; s=arc-20240605;
        b=PFxVIpXXJgv00fQreawOWc7I8+J3G09xMGoKsPYh+tCyH+ZY3cYiN0uikKa329CFmU
         M6zqS1Q5qKLAmQQ7muiLxAwZKT4LBM4HuHGZmpg4yas4RM9TxI6WEkheKe7lXD2cAGGj
         RoeOqMIKkA2TmCU2teg0LIVBCB+IwFgy6sAO/fTvrrQAaMmZO2YyywdGurdbmqXnt8Kl
         c69ZH10JzPemq4BkzsWyzIgwUEXPHrRoQXNPOY/Hg2LlZX9dHFL2TA75t1Zc9p3fDbcy
         EvJEffgjrEvaeL2gTOnUHfuWrt+3N1YvyckY/9PyqjoVURFqzPbldrSUv0YPN3A7t0jC
         EhWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tKpgRnNh0U38Le3i5dspQLi3SwFeogrfZxQNfKJq3R0=;
        fh=9v4AkdWKYVbfGM12JpTCDnTr5eE9nOuOoyxPpCJ4JqE=;
        b=Bhb4uexUSwVVtrvaMt3LClTIbTicFwWj4M5IVClqKBBa9Z926FQy8vJaH5dw86oIWp
         4iKNAlOeQih2kd/9bscQi9bC0fnEhhGmI23Rs/Gez2w0zXOeslWp1aW7LyKG0cgkbejf
         qZpJjxvIQLhz+I1AWk94dEzeFzTuhv4ce00Y3Y7weugBw4WHasrhca0OKL3Jq3nuwuBz
         +gq7VHmvj4PKaeX9GXqIc7pwmUhXrB63Du53pGE4EdWX06w3Yls8iZx1cBmrDRHcPhGK
         JNm66MQRkVZ7TZO5OIpFZLm7LeA6QBWdo3TTtp1rVS2RB2YNlWG4T+7KXXoHO4p6Q0Uh
         7VJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=eh67ywzZ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b0db12095f0sor2826788a12.1.2025.04.20.20.23.58
        (Google Transport Security);
        Sun, 20 Apr 2025 20:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=eh67ywzZ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745205838; x=1745810638; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tKpgRnNh0U38Le3i5dspQLi3SwFeogrfZxQNfKJq3R0=;
        b=eh67ywzZaj3F7DGq0vs50iTtM+ueJQiYS9lgpM+7pDQyLcFS3fSltISsQ9y8XPN8G7
         snncDT9kGA+cNOFdPe2vZn+KPjFJSEIBGzLPTtM3fF3HJemRUhSjv4JVhF9WwrB00VVN
         Kplsv/of3ifqERJJDmVzMmAZGe7U2xSpwgmtyk58rmu5Fqk1mZvhkzjUYduPUNM8rRnC
         H5GdVwkmnnYEh4m5z/Ntkt8tkmkpiAd/dF+WEcut4Ygt5Rm4NbiqysgunOvwZi0jszja
         U0m4ikUaSXyVN9B/z+lqN8GnLuFDeeqqlP6P3oVElouFvYnLda7+RldxwocClZ8Vscv8
         t/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745205838; x=1745810638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKpgRnNh0U38Le3i5dspQLi3SwFeogrfZxQNfKJq3R0=;
        b=tg26GJKuKVw0REIFHTtltqDnVyaW2rEx1s3cK2UD/+JzsEewc5bBYKb/znl+41cZB+
         D9NffHfj4+qnWCCvAE4nt8RqWpQQcxv0VO0h2IvML6Aonry7G6l5XFDXCo6dG5X1tcyJ
         sTlbGOj81dyAXC4qxKXcAdxqhCfU5HW8+70vKqTgJf/GUldRDEuhbVTZUlg7Xl58fdzd
         J8e47aZUCl+U0LyI8VluepVwu1cAMZXnsu1/dnGzOlDNtKpECn/ag1WDCA9GGyM33/TU
         s+k2BTTZaTPKqIHJHmKqU9zX4LzPNbXjjas/SNecZ4D1A6folTOopf+NJqb5CFAwl1pd
         +auw==
X-Forwarded-Encrypted: i=1; AJvYcCX5dWJPCbDDorELMgxFwfx1cXgX8gY97WnK4lpZn+/pVUAUpXk7VARdSRCyV4uFcq0UNLCuAJoMW340D12WZwTXJg==@linaro.org, AJvYcCX804L/u3NgfHJlqCydO2R4NbFbdIChNREQmqxG2+4mrPIYr9Nn4qEDZNPdhnK3RjWuo6s5yGpIHkTcYdK7q13mDm0=@linaro.org, AJvYcCXzd1Lm2XYrJ6QDLFAm56GI/DFFxKTQSJRLVyQUBlGrtN0gg/RVRMFJGjtrR4WglW88TdlcGc671UzBMyGi@linaro.org
X-Gm-Message-State: AOJu0YyV0TlCbTt7Q45K0K5WqLYohyLVv/YROh1iIOmCSsU5d9qhVRzu
	V1iZsN1R+UKg3Ve1PvsmQtfk4c3pFS+3oMiRlvMWWGIyeunOF3K/j+Jw0pu9WHkqhtTRl50qFVQ
	9SmN4n+OKChqFEKMZ9T4jTBWoKGUv1eYHHWY=
X-Gm-Gg: ASbGncs09yYoZHJcyzx6rVYmI6L4WNYA5ilNW7DhXsAecgMTDRWmEc1nyD+VmiULR4R
	HHBk2eRujueMrQanZ3TILUtzRnARqJqkr40BSB9U+jMbYbRiPnM5wf9ARKYvLlEUEZQsXiKV5gZ
	ngE+S89rdrOIKX4en2l8ahmND7Jst+a5010oJTkidX2bxLbPS4H4tb
X-Google-Smtp-Source: AGHT+IHCaB055zoL1kSt2nejF9OG6vn+9UVi1woRfh23vbDtdyxHtCSay9c5mk6rt2bFvh378wpuoT6VqgJHu2ooXTE=
X-Received: by 2002:a17:90a:fc44:b0:2fa:2268:1af4 with SMTP id
 98e67ed59e1d1-30879ac20b7mr15984996a91.7.1745205838276; Sun, 20 Apr 2025
 20:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <7ef485c860a0c26d2ddcf6a96430f5443deb5aee.1744787186.git.ktokunaga.mail@gmail.com>
 <a92737eb-786d-4ebc-87df-a5518417195c@linaro.org> <CAEDrbUaZYYxvW_D8ZS=qxOai06PiQQnN4mO2fjupPkwiNqqQjA@mail.gmail.com>
In-Reply-To: <CAEDrbUaZYYxvW_D8ZS=qxOai06PiQQnN4mO2fjupPkwiNqqQjA@mail.gmail.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Mon, 21 Apr 2025 12:23:46 +0900
X-Gm-Features: ATxdqUGzPN5zwPQ2PhIfSgS3wTaWXk6CXzjm0P-q913OiQmtwBX2W11MHRIDA0U
Message-ID: <CAEDrbUb1zb1sVjBboSyq7Pe=MGJ+8mWQX8S3SQ0RiY05xHbWew@mail.gmail.com>
Subject: Re: [PATCH 15/19] util/mmap-alloc: Add qemu_ram_mmap implementation
 for emscripten
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
Content-Type: multipart/alternative; boundary="0000000000000cf21206334166ec"
X-TUID: UnsoTU8qJYpf

--0000000000000cf21206334166ec
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

While working on mmap-alloc.c, I found that Emscripten does not support
partial unmapping of memory regions [1]. This limitation prevents correct
implementation of qemu_ram_mmap and qemu_ram_munmap, which rely on partial
unmap behavior.

[1]
https://github.com/emscripten-core/emscripten/blob/d4a74336f23214bf3304d9eb0d03966786b30a36/system/lib/libc/emscripten_mmap.c#L61

As a workaround, I'm considering excluding mmap-alloc.c from the Emscripten
build. Instead, for Emscripten build, we can modify qemu_anon_ram_alloc (in
oslib-posix.c) to use qemu_memalign in place of qemu_ram_mmap, and disable
memory backends that rely on mmap, such as memory-backend-file and
memory-backend-shm.

I plan to include this fix in the next version of the patch series. I'm
happy to hear any suggestions if there is a better way to address this
limitation.

The change in oslib-posix.c will look like this:

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index a697c602c6..8eb0e53458 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -58,6 +58,7 @@
 #include <lwp.h>
 #endif

+#include "qemu/memalign.h"
 #include "qemu/mmap-alloc.h"

 #define MAX_MEM_PREALLOC_THREAD_COUNT 16
@@ -210,11 +211,21 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t
*alignment, bool shared,
     const uint32_t qemu_map_flags = (shared ? QEMU_MAP_SHARED : 0) |
                                     (noreserve ? QEMU_MAP_NORESERVE : 0);
     size_t align = QEMU_VMALLOC_ALIGN;
+#ifndef EMSCRIPTEN
     void *ptr = qemu_ram_mmap(-1, size, align, qemu_map_flags, 0);

     if (ptr == MAP_FAILED) {
         return NULL;
     }
+#else
+    /*
+     * qemu_ram_mmap is not implemented for Emscripten. Use qemu_memalign
+     * for the anonymous allocation. noreserve is ignored as there is no
swap
+     * space on Emscripten, and shared is ignored as there is no other
+     * processes on Emscripten.
+     */
+    void *ptr = qemu_memalign(align, size);
+#endif

     if (alignment) {
         *alignment = align;
@@ -227,7 +238,16 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t
*alignment, bool shared,
 void qemu_anon_ram_free(void *ptr, size_t size)
 {
     trace_qemu_anon_ram_free(ptr, size);
+#ifndef EMSCRIPTEN
     qemu_ram_munmap(-1, ptr, size);
+#else
+    /*
+     * qemu_ram_munmap is not implemented for Emscripten and qemu_memalign
+     * was used for the allocation. Use the corresponding freeing function
+     * here.
+     */
+    qemu_vfree(ptr);
+#endif
 }

 void qemu_socket_set_block(int fd)
@@ -588,7 +608,15 @@ bool qemu_prealloc_mem(int fd, char *area, size_t sz,
int max_threads,
 {
     static gsize initialized;
     int ret;
+#ifndef EMSCRIPTEN
     size_t hpagesize = qemu_fd_getpagesize(fd);
+#else
+    /*
+     * mmap-alloc.c is excluded from Emscripten build, so
qemu_fd_getpagesize
+     * is unavailable. Fallback to the lower level implementation.
+     */
+    size_t hpagesize = qemu_real_host_page_size();
+#endif
     size_t numpages = DIV_ROUND_UP(sz, hpagesize);
     bool use_madv_populate_write;
     struct sigaction act;

--0000000000000cf21206334166ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe,</div><div><br></div><div>While working o=
n mmap-alloc.c, I found that Emscripten does not support<br>partial unmappi=
ng of memory regions [1]. This limitation prevents correct<br>implementatio=
n of qemu_ram_mmap and qemu_ram_munmap, which rely on partial<br>unmap beha=
vior.<br><br>[1] <a href=3D"https://github.com/emscripten-core/emscripten/b=
lob/d4a74336f23214bf3304d9eb0d03966786b30a36/system/lib/libc/emscripten_mma=
p.c#L61">https://github.com/emscripten-core/emscripten/blob/d4a74336f23214b=
f3304d9eb0d03966786b30a36/system/lib/libc/emscripten_mmap.c#L61</a><br><br>=
As a workaround, I&#39;m considering excluding mmap-alloc.c from the Emscri=
pten<br>build. Instead, for Emscripten build, we can modify qemu_anon_ram_a=
lloc (in<br>oslib-posix.c) to use qemu_memalign in place of qemu_ram_mmap, =
and disable<br>memory backends that rely on mmap, such as memory-backend-fi=
le and<br>memory-backend-shm.<br><br>I plan to include this fix in the next=
 version of the patch series. I&#39;m<br>happy to hear any suggestions if t=
here is a better way to address this<br>limitation.<br><br>The change in os=
lib-posix.c will look like this:<br><br>diff --git a/util/oslib-posix.c b/u=
til/oslib-posix.c<br>index a697c602c6..8eb0e53458 100644<br>--- a/util/osli=
b-posix.c<br>+++ b/util/oslib-posix.c<br>@@ -58,6 +58,7 @@<br>=C2=A0#includ=
e &lt;lwp.h&gt;<br>=C2=A0#endif<br>=C2=A0<br>+#include &quot;qemu/memalign.=
h&quot;<br>=C2=A0#include &quot;qemu/mmap-alloc.h&quot;<br>=C2=A0<br>=C2=A0=
#define MAX_MEM_PREALLOC_THREAD_COUNT 16<br>@@ -210,11 +211,21 @@ void *qem=
u_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared,<br>=C2=A0 =
=C2=A0 =C2=A0const uint32_t qemu_map_flags =3D (shared ? QEMU_MAP_SHARED : =
0) |<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(noreserv=
e ? QEMU_MAP_NORESERVE : 0);<br>=C2=A0 =C2=A0 =C2=A0size_t align =3D QEMU_V=
MALLOC_ALIGN;<br>+#ifndef EMSCRIPTEN<br>=C2=A0 =C2=A0 =C2=A0void *ptr =3D q=
emu_ram_mmap(-1, size, align, qemu_map_flags, 0);<br>=C2=A0<br>=C2=A0 =C2=
=A0 =C2=A0if (ptr =3D=3D MAP_FAILED) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return NULL;<br>=C2=A0 =C2=A0 =C2=A0}<br>+#else<br>+ =C2=A0 =C2=A0/* <br=
>+ =C2=A0 =C2=A0 * qemu_ram_mmap is not implemented for Emscripten. Use qem=
u_memalign<br>+ =C2=A0 =C2=A0 * for the anonymous allocation. noreserve is =
ignored as there is no swap<br>+ =C2=A0 =C2=A0 * space on Emscripten, and s=
hared is ignored as there is no other<br>+ =C2=A0 =C2=A0 * processes on Ems=
cripten.<br>+ =C2=A0 =C2=A0 */<br>+ =C2=A0 =C2=A0void *ptr =3D qemu_memalig=
n(align, size);<br>+#endif<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (alignment) =
{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*alignment =3D align;<br>@@ -227,7 +=
238,16 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool =
shared,<br>=C2=A0void qemu_anon_ram_free(void *ptr, size_t size)<br>=C2=A0{=
<br>=C2=A0 =C2=A0 =C2=A0trace_qemu_anon_ram_free(ptr, size);<br>+#ifndef EM=
SCRIPTEN<br>=C2=A0 =C2=A0 =C2=A0qemu_ram_munmap(-1, ptr, size);<br>+#else<b=
r>+ =C2=A0 =C2=A0/*<br>+ =C2=A0 =C2=A0 * qemu_ram_munmap is not implemented=
 for Emscripten and qemu_memalign<br>+ =C2=A0 =C2=A0 * was used for the all=
ocation. Use the corresponding freeing function<br>+ =C2=A0 =C2=A0 * here.<=
br>+ =C2=A0 =C2=A0 */<br>+ =C2=A0 =C2=A0qemu_vfree(ptr);<br>+#endif<br>=C2=
=A0}<br>=C2=A0<br>=C2=A0void qemu_socket_set_block(int fd)<br>@@ -588,7 +60=
8,15 @@ bool qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threa=
ds,<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0static gsize initialized;<br>=C2=A0 =
=C2=A0 =C2=A0int ret;<br>+#ifndef EMSCRIPTEN<br>=C2=A0 =C2=A0 =C2=A0size_t =
hpagesize =3D qemu_fd_getpagesize(fd);<br>+#else<br>+ =C2=A0 =C2=A0/*<br>+ =
=C2=A0 =C2=A0 * mmap-alloc.c is excluded from Emscripten build, so qemu_fd_=
getpagesize<br>+ =C2=A0 =C2=A0 * is unavailable. Fallback to the lower leve=
l implementation.<br>+ =C2=A0 =C2=A0 */<br>+ =C2=A0 =C2=A0size_t hpagesize =
=3D qemu_real_host_page_size();<br>+#endif<br>=C2=A0 =C2=A0 =C2=A0size_t nu=
mpages =3D DIV_ROUND_UP(sz, hpagesize);<br>=C2=A0 =C2=A0 =C2=A0bool use_mad=
v_populate_write;<br>=C2=A0 =C2=A0 =C2=A0struct sigaction act;</div></div>

--0000000000000cf21206334166ec--
