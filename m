Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4359213wrg;
        Thu, 6 Jun 2019 04:25:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtz9G26BUzZ5t1RajWI98+Z8p6S5RVBIQZcxM3voJhjv76M7/oYV3gRm2HckI6DPyKq8Ic
X-Received: by 2002:a37:40d3:: with SMTP id n202mr30655509qka.350.1559820326406;
        Thu, 06 Jun 2019 04:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559820326; cv=none;
        d=google.com; s=arc-20160816;
        b=rwAveOnmBC4gZDmfGyre9iWy2Siie0axYlP2zvcwSUx7LxF49apWIEt6xXRCgGwHpi
         a3rqW71XrHg/swcDng9btThgJIOSelDTH63a11gdQpYaJE5YvsVEkUBWwLWFZq9bBJSt
         r/vN3pacVo4VN6nEHrXuR1MaCSoKai97MShaxKo4TPSu7zk6oylCa8sBnclD9daCD8iN
         3rqvITM3cWbmyuwvHzz+tccA+MScVyh9pTpayEtOlwU5hqZ+PQ/M+SsHUFbnmteUITkH
         zc1NbibEBSapP7ozfZLh2MCTtMXxl/3JLxjS71255OSaUcb4YQvU/B7tTHgHsN7k2QFc
         /3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=TuKbpy20S50FOjzjtwzcjwAWM/ZcxnNh7Vn6W9kFWTI=;
        b=HdcEE61mCDJ1kqopK3OB5KgHq86FU3CuFAoPUXk87TLZWWSXMI2CUa+tVk4lb0D9vA
         Y1AFhJ/If+5hAhKerETOc5X2EhqK8U0Bv7BhHbeXotfg4zujsDoPwwpfDBZnvc2jekkA
         O1Kcns+CmnmlMlKOCK0Acuet0zZfRtSmg8AGEQQr+XMfr5xixvqPHEgsHpjjjjYc8xzP
         IPv9nRQIKpFcwWwcIFdGf6rxWejD8LLDPaopimF9Pp9uhqxbBpbeBLr176a9SQZCMs4t
         aTJ8KmCCERBQE0/vN4yfAKKFqEvNl2TXxUuUQHESKVUFndKplyZVyFUVwhizl+fQv3tp
         ERcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hGDFPvs4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c65si1637263qkd.52.2019.06.06.04.25.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 04:25:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hGDFPvs4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYqWL-0006if-SP
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 07:25:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1hYqW8-0006gX-4a
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 07:25:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1hYqW4-0002UJ-BY
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 07:25:12 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33609)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
	id 1hYqVx-0002Bm-25; Thu, 06 Jun 2019 07:25:01 -0400
Received: by mail-ot1-x342.google.com with SMTP id p4so1620293oti.0;
	Thu, 06 Jun 2019 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TuKbpy20S50FOjzjtwzcjwAWM/ZcxnNh7Vn6W9kFWTI=;
	b=hGDFPvs43bVUyoinkqH+263d5/fhyAedwwuoiOlF11rO+GlNzomkxf7XuCjG+zxSQO
	0rfr6FMwlhvREr+4a9Gq/IAp3H5X2oEIK+HuqaST0CHMxtx66X5sm/g1AKN7dlbOQtzy
	0Tpz743ta7XdrymwhTS/0ZQ0TxkTqtahN+ufJsM9yfEJUKc2WjSB88biZ27uCRLNRICJ
	t+GBz4jschOfm9jQwhQRrfethx2KY8ADUFUpPA59JZIcFlJOPW664KoeeSY9KHVBeOBR
	lGJaNY+8g6e88MFBCtmssPwnd+Y+1CBTSufbZjywYo8DFjZSMRS4FJ0b8zun8M2E/5PH
	Qgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TuKbpy20S50FOjzjtwzcjwAWM/ZcxnNh7Vn6W9kFWTI=;
	b=nuM9p+EKll3JcRk8ZfriibCJlYzwrJRX6kCiU8XkTHhZAPsfrFD3uFTan5wgNpmxjH
	4DWVyvX3Ceq2qPVuhQQtTYkECiHJXHFM2GKhbp+sG4N3QQWg4Az0yqk4q9Bz5NfxcBos
	Wz+Rkz/tJhcEAOgLmEua7uGKEhK4ikZetifVywZtt0+8VNaWuCosjIIIon8nT2gq1pKH
	dQe7+0yowyhqdtUlS2Kyr6HJHnY9n3gIX+Mye1hAYh0/ou21pcIui7sFNUKeaatXSSQF
	NuJtTblS5qxhJ3RIBlZMgkcGZ8miZ+rEJZlSQjsdC/dTg6R/Rd+uGWeLAABGfrhw9JMB
	uy7Q==
X-Gm-Message-State: APjAAAWkViQtw4koS8g0EswLETp3wmKbDerZiTdk67kDCtffaNSQAvNx
	g86Qs/8/2RKMMMMmnwzWqDIEC0g9y5NPdoXTIis=
X-Received: by 2002:a9d:2aa:: with SMTP id 39mr13872417otl.121.1559820300038; 
	Thu, 06 Jun 2019 04:25:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e4:0:0:0:0:0 with HTTP;
	Thu, 6 Jun 2019 04:24:59 -0700 (PDT)
Received: by 2002:a9d:20e4:0:0:0:0:0 with HTTP;
	Thu, 6 Jun 2019 04:24:59 -0700 (PDT)
In-Reply-To: <20190605205706.569-3-richard.henderson@linaro.org>
References: <20190605205706.569-1-richard.henderson@linaro.org>
	<20190605205706.569-3-richard.henderson@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 6 Jun 2019 13:24:59 +0200
Message-ID: <CAL1e-=he9+=jC4XMD2jc2uhnWCkSxkncwat7UB=MSQMRjTsBhw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e5b74e058aa5f607"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 2/6] linux-user: Validate
 mmap/mprotect prot value
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Dave.Martin@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m6kIRn9rtOMk

--000000000000e5b74e058aa5f607
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Jun 5, 2019 11:13 PM, "Richard Henderson" <richard.henderson@linaro.org>
wrote:
>
> The kernel will return -EINVAL for bits set in the prot argument
> that are unknown or invalid.  Previously we were simply cropping
> out the bits that we care about.
>
> Introduce validate_prot_to_pageflags to perform this check in a
> single place between the two syscalls.  Differentiate between
> the target and host versions of prot.  Compute the qemu internal
> page_flags value at the same time.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/mmap.c | 106 ++++++++++++++++++++++++++++++++--------------
>  1 file changed, 75 insertions(+), 31 deletions(-)
>
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index af41339d57..3117f57fd8 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -61,11 +61,38 @@ void mmap_fork_end(int child)
>          pthread_mutex_unlock(&mmap_mutex);
>  }
>
> +/*
> + * Validate target prot bitmask.
> + * Return the prot bitmask for the host in *HOST_PROT.
> + * Return 0 if the target prot bitmask is invalid, otherwise
> + * the internal qemu page_flags (which will include PAGE_VALID).
> + */
> +static int validate_prot_to_pageflags(int *host_prot, int prot)
> +{
> +    int valid =3D PROT_READ | PROT_WRITE | PROT_EXEC | TARGET_PROT_SEM;
> +    int page_flags =3D (prot & PAGE_BITS) | PAGE_VALID;
> +
> +    /*
> +     * For the host, we need not pass anything except read/write/exec.
> +     * While PROT_SEM is allowed by all hosts, it is also ignored, so
> +     * don't bother transforming guest bit to host bit.

I don't think that making assumptions based on an undocumented behavior is
the best practice.

Your =E2=80=9CLet's don't bother=E2=80=9D about such easy to implement thin=
gs may create a
lot of bothering in future.

Regards,
Aleksandar

>  Any other
> +     * target-specific prot bits will not be understood by the host
> +     * and will need to be encoded into page_flags for qemu emulation.
> +     *
> +     * TODO: We do not actually have to map guest pages as executable,
> +     * since they will not be directly executed by the host.  We only
> +     * need to remember exec within page_flags.
> +     */
> +    *host_prot =3D prot & (PROT_READ | PROT_WRITE | PROT_EXEC);
> +
> +    return prot & ~valid ? 0 : page_flags;
> +}
> +
>  /* NOTE: all the constants are the HOST ones, but addresses are target.
*/
> -int target_mprotect(abi_ulong start, abi_ulong len, int prot)
> +int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
>  {
>      abi_ulong end, host_start, host_end, addr;
> -    int prot1, ret;
> +    int prot1, ret, page_flags, host_prot;
>
>  #ifdef DEBUG_MMAP
>      printf("mprotect: start=3D0x" TARGET_ABI_FMT_lx
> @@ -75,56 +102,65 @@ int target_mprotect(abi_ulong start, abi_ulong len,
int prot)
>             prot & PROT_EXEC ? 'x' : '-');
>  #endif
>
> -    if ((start & ~TARGET_PAGE_MASK) !=3D 0)
> +    if ((start & ~TARGET_PAGE_MASK) !=3D 0) {
>          return -TARGET_EINVAL;
> +    }
> +    page_flags =3D validate_prot_to_pageflags(&host_prot, target_prot);
> +    if (!page_flags) {
> +        return -TARGET_EINVAL;
> +    }
>      len =3D TARGET_PAGE_ALIGN(len);
>      end =3D start + len;
>      if (!guest_range_valid(start, len)) {
>          return -TARGET_ENOMEM;
>      }
> -    prot &=3D PROT_READ | PROT_WRITE | PROT_EXEC;
> -    if (len =3D=3D 0)
> +    if (len =3D=3D 0) {
>          return 0;
> +    }
>
>      mmap_lock();
>      host_start =3D start & qemu_host_page_mask;
>      host_end =3D HOST_PAGE_ALIGN(end);
>      if (start > host_start) {
>          /* handle host page containing start */
> -        prot1 =3D prot;
> -        for(addr =3D host_start; addr < start; addr +=3D TARGET_PAGE_SIZ=
E) {
> +        prot1 =3D host_prot;
> +        for (addr =3D host_start; addr < start; addr +=3D TARGET_PAGE_SI=
ZE) {
>              prot1 |=3D page_get_flags(addr);
>          }
>          if (host_end =3D=3D host_start + qemu_host_page_size) {
> -            for(addr =3D end; addr < host_end; addr +=3D TARGET_PAGE_SIZ=
E) {
> +            for (addr =3D end; addr < host_end; addr +=3D TARGET_PAGE_SI=
ZE) {
>                  prot1 |=3D page_get_flags(addr);
>              }
>              end =3D host_end;
>          }
> -        ret =3D mprotect(g2h(host_start), qemu_host_page_size, prot1 &
PAGE_BITS);
> -        if (ret !=3D 0)
> +        ret =3D mprotect(g2h(host_start), qemu_host_page_size,
> +                       prot1 & PAGE_BITS);
> +        if (ret !=3D 0) {
>              goto error;
> +        }
>          host_start +=3D qemu_host_page_size;
>      }
>      if (end < host_end) {
> -        prot1 =3D prot;
> -        for(addr =3D end; addr < host_end; addr +=3D TARGET_PAGE_SIZE) {
> +        prot1 =3D host_prot;
> +        for (addr =3D end; addr < host_end; addr +=3D TARGET_PAGE_SIZE) =
{
>              prot1 |=3D page_get_flags(addr);
>          }
> -        ret =3D mprotect(g2h(host_end - qemu_host_page_size),
qemu_host_page_size,
> -                       prot1 & PAGE_BITS);
> -        if (ret !=3D 0)
> +        ret =3D mprotect(g2h(host_end - qemu_host_page_size),
> +                       qemu_host_page_size, prot1 & PAGE_BITS);
> +        if (ret !=3D 0) {
>              goto error;
> +        }
>          host_end -=3D qemu_host_page_size;
>      }
>
>      /* handle the pages in the middle */
>      if (host_start < host_end) {
> -        ret =3D mprotect(g2h(host_start), host_end - host_start, prot);
> -        if (ret !=3D 0)
> +        ret =3D mprotect(g2h(host_start), host_end - host_start,
host_prot);
> +        if (ret !=3D 0) {
>              goto error;
> +        }
>      }
> -    page_set_flags(start, start + len, prot | PAGE_VALID);
> +    page_set_flags(start, start + len, page_flags);
>      mmap_unlock();
>      return 0;
>  error:
> @@ -364,10 +400,11 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong
size, abi_ulong align)
>  }
>
>  /* NOTE: all the constants are the HOST ones */
> -abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
> +abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
>                       int flags, int fd, abi_ulong offset)
>  {
>      abi_ulong ret, end, real_start, real_end, retaddr, host_offset,
host_len;
> +    int page_flags, host_prot;
>
>      mmap_lock();
>  #ifdef DEBUG_MMAP
> @@ -402,6 +439,12 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,
int prot,
>          goto fail;
>      }
>
> +    page_flags =3D validate_prot_to_pageflags(&host_prot, target_prot);
> +    if (!page_flags) {
> +        errno =3D EINVAL;
> +        goto fail;
> +    }
> +
>      /* Also check for overflows... */
>      len =3D TARGET_PAGE_ALIGN(len);
>      if (!len) {
> @@ -467,14 +510,15 @@ abi_long target_mmap(abi_ulong start, abi_ulong
len, int prot,
>          /* Note: we prefer to control the mapping address. It is
>             especially important if qemu_host_page_size >
>             qemu_real_host_page_size */
> -        p =3D mmap(g2h(start), host_len, prot,
> +        p =3D mmap(g2h(start), host_len, host_prot,
>                   flags | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> -        if (p =3D=3D MAP_FAILED)
> +        if (p =3D=3D MAP_FAILED) {
>              goto fail;
> +        }
>          /* update start so that it points to the file position at
'offset' */
>          host_start =3D (unsigned long)p;
>          if (!(flags & MAP_ANONYMOUS)) {
> -            p =3D mmap(g2h(start), len, prot,
> +            p =3D mmap(g2h(start), len, host_prot,
>                       flags | MAP_FIXED, fd, host_offset);
>              if (p =3D=3D MAP_FAILED) {
>                  munmap(g2h(start), host_len);
> @@ -508,19 +552,19 @@ abi_long target_mmap(abi_ulong start, abi_ulong
len, int prot,
>              /* msync() won't work here, so we return an error if write i=
s
>                 possible while it is a shared mapping */
>              if ((flags & MAP_TYPE) =3D=3D MAP_SHARED &&
> -                (prot & PROT_WRITE)) {
> +                (host_prot & PROT_WRITE)) {
>                  errno =3D EINVAL;
>                  goto fail;
>              }
> -            retaddr =3D target_mmap(start, len, prot | PROT_WRITE,
> +            retaddr =3D target_mmap(start, len, target_prot | PROT_WRITE=
,
>                                    MAP_FIXED | MAP_PRIVATE |
MAP_ANONYMOUS,
>                                    -1, 0);
>              if (retaddr =3D=3D -1)
>                  goto fail;
>              if (pread(fd, g2h(start), len, offset) =3D=3D -1)
>                  goto fail;
> -            if (!(prot & PROT_WRITE)) {
> -                ret =3D target_mprotect(start, len, prot);
> +            if (!(host_prot & PROT_WRITE)) {
> +                ret =3D target_mprotect(start, len, target_prot);
>                  assert(ret =3D=3D 0);
>              }
>              goto the_end;
> @@ -531,13 +575,13 @@ abi_long target_mmap(abi_ulong start, abi_ulong
len, int prot,
>              if (real_end =3D=3D real_start + qemu_host_page_size) {
>                  /* one single host page */
>                  ret =3D mmap_frag(real_start, start, end,
> -                                prot, flags, fd, offset);
> +                                host_prot, flags, fd, offset);
>                  if (ret =3D=3D -1)
>                      goto fail;
>                  goto the_end1;
>              }
>              ret =3D mmap_frag(real_start, start, real_start +
qemu_host_page_size,
> -                            prot, flags, fd, offset);
> +                            host_prot, flags, fd, offset);
>              if (ret =3D=3D -1)
>                  goto fail;
>              real_start +=3D qemu_host_page_size;
> @@ -546,7 +590,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,
int prot,
>          if (end < real_end) {
>              ret =3D mmap_frag(real_end - qemu_host_page_size,
>                              real_end - qemu_host_page_size, end,
> -                            prot, flags, fd,
> +                            host_prot, flags, fd,
>                              offset + real_end - qemu_host_page_size -
start);
>              if (ret =3D=3D -1)
>                  goto fail;
> @@ -562,13 +606,13 @@ abi_long target_mmap(abi_ulong start, abi_ulong
len, int prot,
>              else
>                  offset1 =3D offset + real_start - start;
>              p =3D mmap(g2h(real_start), real_end - real_start,
> -                     prot, flags, fd, offset1);
> +                     host_prot, flags, fd, offset1);
>              if (p =3D=3D MAP_FAILED)
>                  goto fail;
>          }
>      }
>   the_end1:
> -    page_set_flags(start, start + len, prot | PAGE_VALID);
> +    page_set_flags(start, start + len, page_flags);
>   the_end:
>  #ifdef DEBUG_MMAP
>      printf("ret=3D0x" TARGET_ABI_FMT_lx "\n", start);
> --
> 2.17.1
>
>

--000000000000e5b74e058aa5f607
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jun 5, 2019 11:13 PM, &quot;Richard Henderson&quot; &lt;<a href=3D"mailt=
o:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:=
<br>
&gt;<br>
&gt; The kernel will return -EINVAL for bits set in the prot argument<br>
&gt; that are unknown or invalid.=C2=A0 Previously we were simply cropping<=
br>
&gt; out the bits that we care about.<br>
&gt;<br>
&gt; Introduce validate_prot_to_pageflags to perform this check in a<br>
&gt; single place between the two syscalls.=C2=A0 Differentiate between<br>
&gt; the target and host versions of prot.=C2=A0 Compute the qemu internal<=
br>
&gt; page_flags value at the same time.<br>
&gt;<br>
&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henders=
on@linaro.org">richard.henderson@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0linux-user/mmap.c | 106 ++++++++++++++++++++++++++++++++--------=
------<br>
&gt; =C2=A01 file changed, 75 insertions(+), 31 deletions(-)<br>
&gt;<br>
&gt; diff --git a/linux-user/mmap.c b/linux-user/mmap.c<br>
&gt; index af41339d57..3117f57fd8 100644<br>
&gt; --- a/linux-user/mmap.c<br>
&gt; +++ b/linux-user/mmap.c<br>
&gt; @@ -61,11 +61,38 @@ void mmap_fork_end(int child)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_mutex_unlock(&amp;mmap_mutex=
);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; +/*<br>
&gt; + * Validate target prot bitmask.<br>
&gt; + * Return the prot bitmask for the host in *HOST_PROT.<br>
&gt; + * Return 0 if the target prot bitmask is invalid, otherwise<br>
&gt; + * the internal qemu page_flags (which will include PAGE_VALID).<br>
&gt; + */<br>
&gt; +static int validate_prot_to_pageflags(int *host_prot, int prot)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int valid =3D PROT_READ | PROT_WRITE | PROT_EXEC | TARG=
ET_PROT_SEM;<br>
&gt; +=C2=A0 =C2=A0 int page_flags =3D (prot &amp; PAGE_BITS) | PAGE_VALID;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* For the host, we need not pass anything except =
read/write/exec.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* While PROT_SEM is allowed by all hosts, it is a=
lso ignored, so<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* don&#39;t bother transforming guest bit to host=
 bit.</p>
<p dir=3D"ltr">I don&#39;t think that making assumptions based on an undocu=
mented behavior is the best practice.</p>
<p dir=3D"ltr">Your =E2=80=9CLet&#39;s don&#39;t bother=E2=80=9D about such=
 easy to implement things may create a lot of bothering in future.</p>
<p dir=3D"ltr">Regards,<br>
Aleksandar</p>
<p dir=3D"ltr">&gt;=C2=A0 Any other<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* target-specific prot bits will not be understoo=
d by the host<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* and will need to be encoded into page_flags for=
 qemu emulation.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* TODO: We do not actually have to map guest page=
s as executable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* since they will not be directly executed by the=
 host.=C2=A0 We only<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* need to remember exec within page_flags.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 *host_prot =3D prot &amp; (PROT_READ | PROT_WRITE | PRO=
T_EXEC);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return prot &amp; ~valid ? 0 : page_flags;<br>
&gt; +}<br>
&gt; +<br>
&gt; =C2=A0/* NOTE: all the constants are the HOST ones, but addresses are =
target. */<br>
&gt; -int target_mprotect(abi_ulong start, abi_ulong len, int prot)<br>
&gt; +int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)<=
br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0abi_ulong end, host_start, host_end, addr;<br>
&gt; -=C2=A0 =C2=A0 int prot1, ret;<br>
&gt; +=C2=A0 =C2=A0 int prot1, ret, page_flags, host_prot;<br>
&gt;<br>
&gt; =C2=A0#ifdef DEBUG_MMAP<br>
&gt; =C2=A0 =C2=A0 =C2=A0printf(&quot;mprotect: start=3D0x&quot; TARGET_ABI=
_FMT_lx<br>
&gt; @@ -75,56 +102,65 @@ int target_mprotect(abi_ulong start, abi_ulong le=
n, int prot)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prot &amp; PROT_EXEC ? &#39;=
x&#39; : &#39;-&#39;);<br>
&gt; =C2=A0#endif<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 if ((start &amp; ~TARGET_PAGE_MASK) !=3D 0)<br>
&gt; +=C2=A0 =C2=A0 if ((start &amp; ~TARGET_PAGE_MASK) !=3D 0) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -TARGET_EINVAL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 page_flags =3D validate_prot_to_pageflags(&amp;host_pro=
t, target_prot);<br>
&gt; +=C2=A0 =C2=A0 if (!page_flags) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EINVAL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0len =3D TARGET_PAGE_ALIGN(len);<br>
&gt; =C2=A0 =C2=A0 =C2=A0end =3D start + len;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!guest_range_valid(start, len)) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -TARGET_ENOMEM;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 prot &amp;=3D PROT_READ | PROT_WRITE | PROT_EXEC;<br>
&gt; -=C2=A0 =C2=A0 if (len =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 if (len =3D=3D 0) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0mmap_lock();<br>
&gt; =C2=A0 =C2=A0 =C2=A0host_start =3D start &amp; qemu_host_page_mask;<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0host_end =3D HOST_PAGE_ALIGN(end);<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (start &gt; host_start) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* handle host page containing start=
 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 prot1 =3D prot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(addr =3D host_start; addr &lt; start;=
 addr +=3D TARGET_PAGE_SIZE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 prot1 =3D host_prot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (addr =3D host_start; addr &lt; start=
; addr +=3D TARGET_PAGE_SIZE) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prot1 |=3D page_get_fl=
ags(addr);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (host_end =3D=3D host_start + qem=
u_host_page_size) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for(addr =3D end; addr &lt;=
 host_end; addr +=3D TARGET_PAGE_SIZE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (addr =3D end; addr &lt=
; host_end; addr +=3D TARGET_PAGE_SIZE) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prot1 |=
=3D page_get_flags(addr);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end =3D host_end;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mprotect(g2h(host_start), qemu_ho=
st_page_size, prot1 &amp; PAGE_BITS);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mprotect(g2h(host_start), qemu_ho=
st_page_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0prot1 &amp; PAGE_BITS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_start +=3D qemu_host_page_size;=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (end &lt; host_end) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 prot1 =3D prot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(addr =3D end; addr &lt; host_end; add=
r +=3D TARGET_PAGE_SIZE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 prot1 =3D host_prot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (addr =3D end; addr &lt; host_end; ad=
dr +=3D TARGET_PAGE_SIZE) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prot1 |=3D page_get_fl=
ags(addr);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mprotect(g2h(host_end - qemu_host=
_page_size), qemu_host_page_size,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0prot1 &amp; PAGE_BITS);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mprotect(g2h(host_end - qemu_host=
_page_size),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0qemu_host_page_size, prot1 &amp; PAGE_BITS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_end -=3D qemu_host_page_size;<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* handle the pages in the middle */<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (host_start &lt; host_end) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mprotect(g2h(host_start), host_en=
d - host_start, prot);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mprotect(g2h(host_start), host_en=
d - host_start, host_prot);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 page_set_flags(start, start + len, prot | PAGE_VALID);<=
br>
&gt; +=C2=A0 =C2=A0 page_set_flags(start, start + len, page_flags);<br>
&gt; =C2=A0 =C2=A0 =C2=A0mmap_unlock();<br>
&gt; =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; =C2=A0error:<br>
&gt; @@ -364,10 +400,11 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulo=
ng size, abi_ulong align)<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0/* NOTE: all the constants are the HOST ones */<br>
&gt; -abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,<br>
&gt; +abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int flags, int fd, abi_ulong offset)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0abi_ulong ret, end, real_start, real_end, retaddr,=
 host_offset, host_len;<br>
&gt; +=C2=A0 =C2=A0 int page_flags, host_prot;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0mmap_lock();<br>
&gt; =C2=A0#ifdef DEBUG_MMAP<br>
&gt; @@ -402,6 +439,12 @@ abi_long target_mmap(abi_ulong start, abi_ulong l=
en, int prot,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 page_flags =3D validate_prot_to_pageflags(&amp;host_pro=
t, target_prot);<br>
&gt; +=C2=A0 =C2=A0 if (!page_flags) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* Also check for overflows... */<br>
&gt; =C2=A0 =C2=A0 =C2=A0len =3D TARGET_PAGE_ALIGN(len);<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!len) {<br>
&gt; @@ -467,14 +510,15 @@ abi_long target_mmap(abi_ulong start, abi_ulong =
len, int prot,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Note: we prefer to control the ma=
pping address. It is<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 especially important if qemu=
_host_page_size &gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_real_host_page_size */<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap(g2h(start), host_len, prot,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap(g2h(start), host_len, host_pro=
t,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=
 MAP_FIXED | MAP_ANONYMOUS, -1, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p =3D=3D MAP_FAILED)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p =3D=3D MAP_FAILED) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* update start so that it points to=
 the file position at &#39;offset&#39; */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_start =3D (unsigned long)p;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(flags &amp; MAP_ANONYMOUS)) {<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap(g2h(start), len,=
 prot,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap(g2h(start), len,=
 host_prot,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 flags | MAP_FIXED, fd, host_offset);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D MAP_FAILE=
D) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munmap(g=
2h(start), host_len);<br>
&gt; @@ -508,19 +552,19 @@ abi_long target_mmap(abi_ulong start, abi_ulong =
len, int prot,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* msync() won&#39;t w=
ork here, so we return an error if write is<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 possible while=
 it is a shared mapping */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((flags &amp; MAP_T=
YPE) =3D=3D MAP_SHARED &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (prot &amp; P=
ROT_WRITE)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (host_prot &a=
mp; PROT_WRITE)) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =
=3D EINVAL;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fai=
l;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retaddr =3D target_mmap(sta=
rt, len, prot | PROT_WRITE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retaddr =3D target_mmap(sta=
rt, len, target_prot | PROT_WRITE,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_FIXED | MAP_PRIV=
ATE | MAP_ANONYMOUS,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-1, 0);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retaddr =3D=3D -1)=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fai=
l;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pread(fd, g2h(star=
t), len, offset) =3D=3D -1)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fai=
l;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(prot &amp; PROT_WRITE=
)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D targe=
t_mprotect(start, len, prot);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(host_prot &amp; PROT_=
WRITE)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D targe=
t_mprotect(start, len, target_prot);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(r=
et =3D=3D 0);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto the_end;<br>
&gt; @@ -531,13 +575,13 @@ abi_long target_mmap(abi_ulong start, abi_ulong =
len, int prot,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (real_end =3D=3D re=
al_start + qemu_host_page_size) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* one s=
ingle host page */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D =
mmap_frag(real_start, start, end,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prot, flags, fd, offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host_prot, flags, fd, offset);<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =
=3D=3D -1)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0goto fail;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto the=
_end1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mmap_frag(real=
_start, start, real_start + qemu_host_page_size,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prot, flags, fd, offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host_prot, flags, fd, offset);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fai=
l;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0real_start +=3D qemu_h=
ost_page_size;<br>
&gt; @@ -546,7 +590,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong le=
n, int prot,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (end &lt; real_end) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mmap_frag(real=
_end - qemu_host_page_size,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0real_end - qemu_host_page_size, end,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prot, flags, fd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host_prot, flags, fd,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset + real_end - qemu_host_page_size -=
 start);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fai=
l;<br>
&gt; @@ -562,13 +606,13 @@ abi_long target_mmap(abi_ulong start, abi_ulong =
len, int prot,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset1 =
=3D offset + real_start - start;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D mmap(g2h(real_st=
art), real_end - real_start,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0prot, flags, fd, offset1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0host_prot, flags, fd, offset1);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D MAP_FAILE=
D)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fai=
l;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 the_end1:<br>
&gt; -=C2=A0 =C2=A0 page_set_flags(start, start + len, prot | PAGE_VALID);<=
br>
&gt; +=C2=A0 =C2=A0 page_set_flags(start, start + len, page_flags);<br>
&gt; =C2=A0 the_end:<br>
&gt; =C2=A0#ifdef DEBUG_MMAP<br>
&gt; =C2=A0 =C2=A0 =C2=A0printf(&quot;ret=3D0x&quot; TARGET_ABI_FMT_lx &quo=
t;\n&quot;, start);<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
</p>

--000000000000e5b74e058aa5f607--
