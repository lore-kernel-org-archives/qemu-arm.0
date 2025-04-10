Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8319298njd;
        Thu, 10 Apr 2025 04:27:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKEja3uXCymKpSr3yTWjLlFukiDtaw1y5f7TIu2IV2JA6Lb3nhPqN4CCeJE0AaOAhS9boF
X-Received: by 2002:a17:907:3f9d:b0:ab7:bac4:b321 with SMTP id a640c23a62f3a-acac009e1aamr178065266b.29.1744284450796;
        Thu, 10 Apr 2025 04:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744284450; cv=none;
        d=google.com; s=arc-20240605;
        b=U28bWT4ZsheHvaW2Ff5u3U4ZeleFFkZnbuoC196oZ3vfp4A6pfUEauUOyepcDdTTcI
         +DoINGNHGT7wymrYXF7mwv/o1vKSQF5+CwrD5dGfBSRV0mIMWCCOQbn2OpJbavEkVl71
         FfxzjIgbyqj++i4yuvRFihZOJTqLgSoQXHibXcxNZ0CalJdLor2IDfqO0gAwmhUOblzB
         4EwRsJaKKORKoKDaYWR/9L4Ng5HwVxSPoNsqhoLrTVbdo6Ey9yT/wUEwbNMJd96FyYn2
         79qfFaSxhbdVttEGhw0rBm2O6dkYNNYXg9L5mYGLqnlAQINXAVTuUGlXx3jXJW3K8mf1
         eiyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bqRCx/Y012Cn2fRNmp67eIyBgyBRV81tOmdZjdIetiY=;
        fh=iv5kSy73Lb252KXM6QlvA9YbhP1hyWLq9Ww5woQ4y9g=;
        b=cJotT4A0OMtpa4KCPZeTiVsNpLxYodcesQqxsUaKg+CQWieL2vinPV29GCzVijy5U3
         m/3N8fBrrgfeOWj3WSm9Y1VCnfkzLMdA4ALgKc8HI757cHXUqUawr73p2YoBUQDkwk0F
         t0MiR6iKV5A0rHdkxXIYW1GK49zFgaAete4tAoRVgKdQ55M57nUfz+qr2L+4nXINxDMY
         yN67ISEdHy4lldRTURKRtPB51erRinfRlQDafB7cVpQ61SnWCnuYN1q0MkXP6XpAsMIA
         vZYNXgiXUegWL1Ld4pHPewfqGcEPKFUxGqzGGUlEYL2bNQ+F79PN7X4X9aMum9NebVKQ
         vpMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=kylie header.b="U/Ri2rGW";
       spf=pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) smtp.mailfrom=qemu_oss@crudebyte.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
Return-Path: <qemu_oss@crudebyte.com>
Received: from kylie.crudebyte.com (kylie.crudebyte.com. [5.189.157.229])
        by mx.google.com with ESMTPS id a640c23a62f3a-acaa1c9694fsi224522766b.268.2025.04.10.04.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 04:27:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) client-ip=5.189.157.229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=kylie header.b="U/Ri2rGW";
       spf=pass (google.com: domain of qemu_oss@crudebyte.com designates 5.189.157.229 as permitted sender) smtp.mailfrom=qemu_oss@crudebyte.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=bqRCx/Y012Cn2fRNmp67eIyBgyBRV81tOmdZjdIetiY=; b=U/Ri2rGWUEOsEneRH01REGKGIx
	C55h3D7Or5BWc2JmdGN3RMpSdyddNBxLR1Xyf2lNxrbd8br3QT+GhWUZjy9N5unyKG4dhABBLN9O8
	7p23SBfGJwBQsqBZ+ELrtP50wTfa8x9sHTVP7yekHlNTXcv8gB0fP8w320Pl3qbrSrG7s9Gj3oyh1
	5W+tecztrbUldD2CQDFqpXv3iREL62hbghnirdriFKfWh1x5Ia1ZJ6bS96sWL9JZzBytqkdVEhauJ
	i4YMlmqZBJqK/LFScX0t5YcM5HAGmaqCCeVwV6pfcH878AEZUk89j+XqE6u1r+toALgOllxwt7pZL
	H2aWclkpvnLfQBeM4UkYg8qWEcK/GU4TyPT+YjP+NquG7S8HVmopexZovn6MLXWLYhc4C6/dyJalZ
	ZZoPSFaSdHUl6+o8nctqsgfMweBaUibSIdQOAbfxbKazyFWCR9xWIP/5ZLQzGzHpfURWkWkBba1zV
	VTp9MTQv5To9CBlgBb4zzBdAPIBtpWJz48BeB7xVmurJVJeHk6Vu5kVzj0fNjqzB+XKk9oTRnofNg
	U1tG+XsTULrewEAELQvVyB3Xsc25VoOfigDly6ZB2moygTtkDhHlZkwTmsN1JOHimyZNe4i5JvDUt
	Q8c871suHMrXz6/UzFBUMPrHh1m30DQ6rP+egMBEc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Greg Kurz <groug@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?ISO-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>
Subject: Re: [PATCH 08/10] hw/9pfs: Allow using hw/9pfs with emscripten
Date: Thu, 10 Apr 2025 13:27:19 +0200
Message-ID: <2533109.DitPQcejgS@silver>
In-Reply-To:
 <16376e4b63fad6f847ceadb39b8f9780fc288198.1744032780.git.ktokunaga.mail@gmail.com>
References:
 <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <16376e4b63fad6f847ceadb39b8f9780fc288198.1744032780.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TUID: si+ZWlFLl2QO

On Monday, April 7, 2025 4:45:59 PM CEST Kohei Tokunaga wrote:
> Emscripten's fiber does not support submitting coroutines to other
> threads. So this commit modifies hw/9pfs/coth.h to disable this behavior
> when compiled with Emscripten.

The lack of being able to dispatch a coroutine to a worker thread is one
thing, however it would probably still make sense to use fibers in 9pfs as
replacement of its coroutines mechanism.

In 9pfs coroutines are used to dispatch blocking fs I/O syscalls from main
thread to worker thread(s):

https://wiki.qemu.org/Documentation/9p#Control_Flow

If you just remove the coroutine code entirely, 9p server might hang for good,
and with it QEMU's main thread.

By using fibers instead, it would not hang, as it seems as if I/O syscalls are
emulated in Emscripten, right?

> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>  fsdev/file-op-9p.h     |  3 +++
>  fsdev/meson.build      |  2 +-
>  hw/9pfs/9p-util-stub.c | 43 ++++++++++++++++++++++++++++++++++++++++++
>  hw/9pfs/9p-util.h      | 18 ++++++++++++++++++
>  hw/9pfs/9p.c           |  3 +++
>  hw/9pfs/coth.h         | 12 ++++++++++++
>  hw/9pfs/meson.build    |  2 ++
>  meson.build            |  6 +++---
>  8 files changed, 85 insertions(+), 4 deletions(-)
>  create mode 100644 hw/9pfs/9p-util-stub.c
> 
> diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
> index 4997677460..b7ca2640ce 100644
> --- a/fsdev/file-op-9p.h
> +++ b/fsdev/file-op-9p.h
> @@ -26,6 +26,9 @@
>  # include <sys/param.h>
>  # include <sys/mount.h>
>  #endif
> +#ifdef EMSCRIPTEN
> +#include <sys/vfs.h>
> +#endif
>  
>  #define SM_LOCAL_MODE_BITS    0600
>  #define SM_LOCAL_DIR_MODE_BITS    0700
> diff --git a/fsdev/meson.build b/fsdev/meson.build
> index c751d8cb62..c3e92a29d7 100644
> --- a/fsdev/meson.build
> +++ b/fsdev/meson.build
> @@ -5,6 +5,6 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
>    '9p-marshal.c',
>    'qemu-fsdev.c',
>  ), if_false: files('qemu-fsdev-dummy.c'))
> -if host_os in ['linux', 'darwin']
> +if host_os in ['linux', 'darwin', 'emscripten']
>    system_ss.add_all(fsdev_ss)
>  endif
> diff --git a/hw/9pfs/9p-util-stub.c b/hw/9pfs/9p-util-stub.c
> new file mode 100644
> index 0000000000..57c89902ab
> --- /dev/null
> +++ b/hw/9pfs/9p-util-stub.c
> @@ -0,0 +1,43 @@
> +/*
> + * 9p utilities stub functions
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "9p-util.h"
> +
> +ssize_t fgetxattrat_nofollow(int dirfd, const char *path, const char *name,
> +                             void *value, size_t size)
> +{
> +    return -1;
> +}
> +
> +ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> +                              char *list, size_t size)
> +{
> +    return -1;
> +}
> +
> +ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> +                                const char *name)
> +{
> +    return -1;
> +}
> +
> +int fsetxattrat_nofollow(int dirfd, const char *path, const char *name,
> +                         void *value, size_t size, int flags)
> +{
> +    return -1;
> +
> +}
> +
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +{
> +    return -1;
> +}
> +
> +ssize_t fgetxattr(int fd, const char *name, void *value, size_t size)
> +{
> +    return -1;
> +}

Missing

    errno = ENOTSUP;

> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 7bc4ec8e85..8c5006fcdc 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -84,6 +84,24 @@ static inline int errno_to_dotl(int err) {
>      } else if (err == EOPNOTSUPP) {
>          err = 95; /* ==EOPNOTSUPP on Linux */
>      }
> +#elif defined(EMSCRIPTEN)
> +    /*
> +     * FIXME: Only most important errnos translated here yet, this should be
> +     * extended to as many errnos being translated as possible in future.
> +     */
> +    if (err == ENAMETOOLONG) {
> +        err = 36; /* ==ENAMETOOLONG on Linux */
> +    } else if (err == ENOTEMPTY) {
> +        err = 39; /* ==ENOTEMPTY on Linux */
> +    } else if (err == ELOOP) {
> +        err = 40; /* ==ELOOP on Linux */
> +    } else if (err == ENODATA) {
> +        err = 61; /* ==ENODATA on Linux */
> +    } else if (err == ENOTSUP) {
> +        err = 95; /* ==EOPNOTSUPP on Linux */
> +    } else if (err == EOPNOTSUPP) {
> +        err = 95; /* ==EOPNOTSUPP on Linux */
> +    }

Looks like you just copied the macOS errno translation code. That probably
doesn't make sense.

/Christian

>  #else
>  #error Missing errno translation to Linux for this host system
>  #endif
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 7cad2bce62..4f45f0edd3 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -4013,6 +4013,9 @@ out_nofid:
>   * Linux guests.
>   */
>  #define P9_XATTR_SIZE_MAX 65536
> +#elif defined(EMSCRIPTEN)
> +/* No support for xattr */
> +#define P9_XATTR_SIZE_MAX 0
>  #else
>  #error Missing definition for P9_XATTR_SIZE_MAX for this host system
>  #endif
> diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
> index 2c54249b35..7b0d05ba1b 100644
> --- a/hw/9pfs/coth.h
> +++ b/hw/9pfs/coth.h
> @@ -19,6 +19,7 @@
>  #include "qemu/coroutine-core.h"
>  #include "9p.h"
>  
> +#ifndef EMSCRIPTEN
>  /*
>   * we want to use bottom half because we want to make sure the below
>   * sequence of events.
> @@ -57,6 +58,17 @@
>          /* re-enter back to qemu thread */                              \
>          qemu_coroutine_yield();                                         \
>      } while (0)
> +#else
> +/*
> + * FIXME: implement this on emscripten but emscripten's coroutine
> + * implementation (fiber) doesn't support submitting a coroutine to other
> + * threads.
> + */
> +#define v9fs_co_run_in_worker(code_block)                               \
> +    do {                                                                \
> +        code_block;                                                     \
> +    } while (0)
> +#endif
>  
>  void co_run_in_worker_bh(void *);
>  int coroutine_fn v9fs_co_readlink(V9fsPDU *, V9fsPath *, V9fsString *);
> diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
> index d35d4f44ff..04f85fb9e9 100644
> --- a/hw/9pfs/meson.build
> +++ b/hw/9pfs/meson.build
> @@ -17,6 +17,8 @@ if host_os == 'darwin'
>    fs_ss.add(files('9p-util-darwin.c'))
>  elif host_os == 'linux'
>    fs_ss.add(files('9p-util-linux.c'))
> +elif host_os == 'emscripten'
> +  fs_ss.add(files('9p-util-stub.c'))
>  endif
>  fs_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-9p-backend.c'))
>  system_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
> diff --git a/meson.build b/meson.build
> index ab84820bc5..a3aadf8b59 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2356,11 +2356,11 @@ dbus_display = get_option('dbus_display') \
>    .allowed()
>  
>  have_virtfs = get_option('virtfs') \
> -    .require(host_os == 'linux' or host_os == 'darwin',
> +    .require(host_os == 'linux' or host_os == 'darwin' or host_os == 'emscripten',
>               error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
> -    .require(host_os == 'linux' or cc.has_function('pthread_fchdir_np'),
> +    .require(host_os == 'linux' or host_os == 'emscripten' or cc.has_function('pthread_fchdir_np'),
>               error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
> -    .require(host_os == 'darwin' or libattr.found(),
> +    .require(host_os == 'darwin' or host_os == 'emscripten' or libattr.found(),
>               error_message: 'virtio-9p (virtfs) on Linux requires libattr-devel') \
>      .disable_auto_if(not have_tools and not have_system) \
>      .allowed()
>

