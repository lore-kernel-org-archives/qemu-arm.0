Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp3151854ejb;
        Tue, 1 Aug 2023 14:27:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGnoX+Dxx58rg5MByrPfn4M/bH0qQKuLuv8Mu32zEibUa8gBSp9wcePS7hBlN+Dg+4eUY8/
X-Received: by 2002:a05:622a:11cd:b0:40f:c547:c6a1 with SMTP id n13-20020a05622a11cd00b0040fc547c6a1mr6522910qtk.5.1690925275370;
        Tue, 01 Aug 2023 14:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690925275; cv=none;
        d=google.com; s=arc-20160816;
        b=a33fIJx3Z4iPtj3oTOdNmSumcfwsarJ/3pKJDLzJSQtbZaRu0sQN4KiG4k5XyCy6uB
         Sk634TGZ2G3+8obvCGC7EH+RyBUcLzvB4t1uS+oOhmqjtqFyOf3niO/bvjKSuGt2jB/7
         XCqUbZ0TtQRpJSdqwpwdwSYKCYxPOuB0p4TTv+z+U1BfLN5KsWCTD7xoCXz7XnotA9n1
         FJnCQDRflWcjerxP2xpL2RJMfsQd7aQr6nztmsmHYwASbA8mdERInZW4RVU5/vjQSVNN
         ccXzM28qv0zv+QoyDE/eMRKk0s+ZuEB5P2swo/RKFjxTNI9V6BZ+wLPM2gV9AwL70lDv
         QiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=qWpzn6EDfV3epZYHPu3ZWiKxJPJcv6XZsVNadt1LM98=;
        fh=SYsFp2iEL90nHLJUDqioV8rlUeUraaclr1fUXH6bNX4=;
        b=UBnujERrO3eMSNoq0RSGzU4LW/CMIMdtVFWkch7+q8500/X0G6dUmoxa1RQ2XEUEYp
         qYMuwQbMQl7BvzRhuE8PierRfm6yF6j9sq5IXzwzayHByJI0BPHES7B+5FqM2uce4cpq
         wPUSvNPE0FYLesw5mlzA/Gg/xlQywyaXDJUNlsYbEjQMFMw7JN0kxs6BlmI8fZUJV0tg
         N8/qkzxAI9iHLrZ03ANfZkMHNagXKhCGIjTobdApnBvRXFb9J+OkqLCEarsrlu3OamaB
         zABYgvVaQY0w2zYmwKQzf7jY3LrAGdMTvEKjZD75B9hDkxp/V5UJXn+p/va9mu01ibeJ
         CYBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JkERyqeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19-20020a05622a00d300b0040fd6b6036dsi1266468qtw.290.2023.08.01.14.27.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Aug 2023 14:27:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JkERyqeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQwth-0006CJ-6A; Tue, 01 Aug 2023 17:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qQwtg-0006Bv-51
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 17:27:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qQwtd-0005o8-TL
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 17:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690925232;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qWpzn6EDfV3epZYHPu3ZWiKxJPJcv6XZsVNadt1LM98=;
 b=JkERyqePstRYoch4Qhef9WfC90+exuqH1f4ykWsx/Ghe69KuqD87zTYBbDOnaTQvuniuqB
 NdfndXXarnfJMOJ/xMnvTUnHyyEfGsX6SSXfbX3ZMA3suh/tqgDrqGTbNq2rLSPLNHt5KL
 RE8bBnqkcUeenF0oM2pYk68l1DZ9rD8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-e9nC9lpSP2Ctlxo3K2P79w-1; Tue, 01 Aug 2023 17:27:07 -0400
X-MC-Unique: e9nC9lpSP2Ctlxo3K2P79w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA9461C05134;
 Tue,  1 Aug 2023 21:27:06 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7C0FC57963;
 Tue,  1 Aug 2023 21:27:05 +0000 (UTC)
Date: Tue, 1 Aug 2023 22:27:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Helge Deller <deller@gmx.de>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Subject: Re: [PATCH 1/2] linux-user: Fix openat() emulation to correctly
 detect accesses to /proc
Message-ID: <ZMl4p2oLv9vhGfAV@redhat.com>
References: <20230801191035.374120-1-deller@gmx.de>
 <20230801191035.374120-2-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230801191035.374120-2-deller@gmx.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nnsUxbqOQUzd

On Tue, Aug 01, 2023 at 09:10:34PM +0200, Helge Deller wrote:
> In qemu we catch accesses to files like /proc/cpuinfo or /proc/net/route
> and return to the guest contents which would be visible on a real system
> (instead what the host would show).
> 
> This patch fixes a bug, where for example the accesses
>     cat /proc////cpuinfo
> or
>     cd /proc && cat cpuinfo
> will not be recognized by qemu and where qemu will wrongly show
> the contents of the host's /proc/cpuinfo file.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> --
> v2:
> - use g_autofree instead of pathname on stack
>   Daniel P. Berrangé requested to not put buffers on stack.
>   Using g_autofree keeps code much cleaner than using
>   extended semantics of realpath(), unless I can use g_autofree
>   on malloced area from realpath().

g_autofree is backed by free(), so it is fine to use that
with the realpath() allocated buffer.

> ---
>  linux-user/syscall.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 95727a816a..a089463969 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8539,9 +8539,12 @@ static int open_hardware(CPUArchState *cpu_env, int fd)
>  }
>  #endif
> 
> -int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
> +
> +int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *fname,
>                      int flags, mode_t mode, bool safe)
>  {
> +    g_autofree char *proc_name = g_new(char, PATH_MAX);
> +    const char *pathname;
>      struct fake_open {
>          const char *filename;
>          int (*fill)(CPUArchState *cpu_env, int fd);
> @@ -8567,6 +8570,13 @@ int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
>          { NULL, NULL, NULL }
>      };
> 
> +    /* if this is a file from /proc/ filesystem, expand full name */
> +    if (realpath(fname, proc_name) && strncmp(proc_name, "/proc/", 6) == 0) {
> +        pathname = proc_name;
> +    } else {
> +        pathname = fname;
> +    }
> +
>      if (is_proc_myself(pathname, "exe")) {
>          if (safe) {
>              return safe_openat(dirfd, exec_path, flags, mode);
> --
> 2.41.0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

