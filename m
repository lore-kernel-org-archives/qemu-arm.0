Received: by 10.25.21.156 with SMTP id 28csp205163lfv;
        Wed, 24 Aug 2016 01:38:09 -0700 (PDT)
X-Received: by 10.55.100.21 with SMTP id y21mr1871982qkb.281.1472027889892;
        Wed, 24 Aug 2016 01:38:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id v187si5563261qkh.300.2016.08.24.01.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 01:38:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcThJ-0004id-G7
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 04:38:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bcThE-0004iH-Cn
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 04:38:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bcThA-0004nf-3y
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 04:38:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60278)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1bcTh9-0004nb-SO; Wed, 24 Aug 2016 04:38:00 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4958B1B25;
	Wed, 24 Aug 2016 08:37:59 +0000 (UTC)
Received: from work-vm (ovpn-116-84.ams2.redhat.com [10.36.116.84])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7O8btrH016541
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 24 Aug 2016 04:37:57 -0400
Date: Wed, 24 Aug 2016 09:37:55 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20160824083754.GB2032@work-vm>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
	<1472012279-20581-3-git-send-email-rth@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1472012279-20581-3-git-send-email-rth@twiddle.net>
User-Agent: Mutt/1.6.2 (2016-07-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 24 Aug 2016 08:37:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/7] cutils: Export only
 buffer_is_zero
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
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	vijay.kilari@gmail.com, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VubpBYFVnEum

* Richard Henderson (rth@twiddle.net) wrote:
> Since the two users don't make use of the returned offset,
> beyond ensuring that the entire buffer is zero, consider the
> can_use_buffer_find_nonzero_offset and buffer_find_nonzero_offset
> functions internal.
> 
> Signed-off-by: Richard Henderson <rth@twiddle.net>

Thanks, I've wanted to kill that off for a while.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/qemu/cutils.h | 2 --
>  migration/ram.c       | 2 +-
>  migration/rdma.c      | 5 +----
>  util/cutils.c         | 8 ++++----
>  4 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index 3e4ea23..ca58577 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -168,8 +168,6 @@ int64_t qemu_strtosz_suffix_unit(const char *nptr, char **end,
>  /* used to print char* safely */
>  #define STR_OR_NULL(str) ((str) ? (str) : "null")
>  
> -bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len);
> -size_t buffer_find_nonzero_offset(const void *buf, size_t len);
>  bool buffer_is_zero(const void *buf, size_t len);
>  
>  /*
> diff --git a/migration/ram.c b/migration/ram.c
> index a3d70c4..a6e1c63 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -73,7 +73,7 @@ static const uint8_t ZERO_TARGET_PAGE[TARGET_PAGE_SIZE];
>  
>  static inline bool is_zero_range(uint8_t *p, uint64_t size)
>  {
> -    return buffer_find_nonzero_offset(p, size) == size;
> +    return buffer_is_zero(p, size);
>  }
>  
>  /* struct contains XBZRLE cache and a static page
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 5110ec8..88bdb64 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1934,10 +1934,7 @@ retry:
>               * memset() + madvise() the entire chunk without RDMA.
>               */
>  
> -            if (can_use_buffer_find_nonzero_offset((void *)(uintptr_t)sge.addr,
> -                                                   length)
> -                   && buffer_find_nonzero_offset((void *)(uintptr_t)sge.addr,
> -                                                    length) == length) {
> +            if (buffer_is_zero((void *)(uintptr_t)sge.addr, length)) {
>                  RDMACompress comp = {
>                                          .offset = current_addr,
>                                          .value = 0,
> diff --git a/util/cutils.c b/util/cutils.c
> index 1c8635c..621ca67 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -327,9 +327,9 @@ static bool avx2_support(void)
>      return b & bit_AVX2;
>  }
>  
> -bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len) \
> +static bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len) \
>           __attribute__ ((ifunc("can_use_buffer_find_nonzero_offset_ifunc")));
> -size_t buffer_find_nonzero_offset(const void *buf, size_t len) \
> +static size_t buffer_find_nonzero_offset(const void *buf, size_t len) \
>           __attribute__ ((ifunc("buffer_find_nonzero_offset_ifunc")));
>  
>  static void *buffer_find_nonzero_offset_ifunc(void)
> @@ -350,12 +350,12 @@ static void *can_use_buffer_find_nonzero_offset_ifunc(void)
>  }
>  #pragma GCC pop_options
>  #else
> -bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len)
> +static bool can_use_buffer_find_nonzero_offset(const void *buf, size_t len)
>  {
>      return can_use_buffer_find_nonzero_offset_inner(buf, len);
>  }
>  
> -size_t buffer_find_nonzero_offset(const void *buf, size_t len)
> +static size_t buffer_find_nonzero_offset(const void *buf, size_t len)
>  {
>      return buffer_find_nonzero_offset_inner(buf, len);
>  }
> -- 
> 2.7.4
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
