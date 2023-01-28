Received: by 2002:a17:906:a8d:b0:883:7228:2f81 with SMTP id y13csp179389ejf;
        Sat, 28 Jan 2023 02:29:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8USFIfHUi4cBUSaNfFfn1Xd2J1ubP4t4G0T7upwtSNCW6nkslWEQZS9Ok42d6fvUws2BjY
X-Received: by 2002:ac8:574f:0:b0:3b8:4169:2b96 with SMTP id 15-20020ac8574f000000b003b841692b96mr1713232qtx.30.1674901765486;
        Sat, 28 Jan 2023 02:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674901765; cv=none;
        d=google.com; s=arc-20160816;
        b=Sx0SjlCsY+pxEhuHfPcdX1iN3T2wORbRxtz32dvEuLVycE0Tf4CWvuf0oZPeopKwxN
         eJRczxK2NdQoH3M0Spe1MKboElBI7T8uDS6fdpFkemvJs6o2+2Lwm+3Qz3fUvn66qAN2
         Uak+dPDEtUFgdlgfb/A/Y5xpBFkTC1lMSW1Z1q/scLIaYlrV4Hcrhz6VR2hDqyvVmMKC
         Rlgff7h1sBAmu8LSBuKhGYnZh0k2saeliH7EGVXoXTPHy110acONUNKzWdeMVdXZlAOR
         RNttQnyie6E61/R+2N18tUW4hD2o553E7fUL4TB1/VuBU7E4LB8rVkLJTs0ylH7NTOBG
         siGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=onqBJLAeKWJ00rmW8PmLFuUlG7BY36S6l8hn+KpBJ40=;
        b=WHLM9GA9n4b/yesdhQJMhvxtWZtvRV5PTlgcUOdL8rBe3MhY7hD+DhEwocKZGlDsfc
         /xnLGiLyH57P0ZmcWk/1tpCdogD7LhDebAlzo+sQOK79xQO9yYzbagTjnLImuhVs1Htf
         tFZt8L6zWQLrAMYF+pt8fWzUq3Ugx6SrBr5JZv6ogaRPL/DyB7c0DmrsAlGiLwT57wVF
         W4HT+TPdUD31dwvVNDKyP/Dwj8zxPlsNWQb9J2HrHtjkz6PYD3zYsYnDben4t05ZZByD
         xIkF+SRHffP29bp/ml8wLrU86iqpUgI9++znFNhF/r9lS8QGQERRb7Qb0W7RVMY3X0q/
         rqfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ArVzU5VH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pe2-20020a05620a850200b00706185a5a39si3946017qkn.690.2023.01.28.02.29.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Jan 2023 02:29:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ArVzU5VH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLiRv-0005G4-U8; Sat, 28 Jan 2023 05:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiRr-0005F9-6x
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 05:28:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiRn-0004AK-Vh
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 05:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674901714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=onqBJLAeKWJ00rmW8PmLFuUlG7BY36S6l8hn+KpBJ40=;
 b=ArVzU5VH3oZcSYXQhkplr/SN86R4bnCkjNvXH6FI9TJVSV5MIrY/7Q1/n/x/helCr8Wd8m
 pm1l7ramWPK6IdqdHESQw5JpjPo3x1qROW4ZFoxaV8spRmkZBYfB7un36R0CkRyhoA1ra6
 gXa1OMBoQJV0LgkXstwTDH4AY8EVo2Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-101-phyTuHwdMsqrHrGcPTzOqQ-1; Sat, 28 Jan 2023 05:28:33 -0500
X-MC-Unique: phyTuHwdMsqrHrGcPTzOqQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h2-20020a1ccc02000000b003db1ded176dso2177116wmb.5
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 02:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onqBJLAeKWJ00rmW8PmLFuUlG7BY36S6l8hn+KpBJ40=;
 b=WUq69ll1pe1beYO135/qEfHPBF2L4Xgk76D+Rl5h28PB5eqczqJ/2cEY7MsJFEZ824
 E8RFSSOlFXqRE0CzeP58jsYm3gvsYIoQDpsvhNWb/LOkvyGPfTPEdWGwKm3CU3MELwIB
 Xbxej8gZGFp2Hxqj9mGvuycknLLHbSOMDvIWFV4PpM9HuVlbHDpRkGSp8oRIBLfflGzM
 pS9GT/roFFj/RO7X4Vj0IwcBYqnj+3e8BHEjYgqX+UsTLC0SIzTJTvHdbdGYLnID/BFY
 wrzVaE6po4CLu0lQaMtqHWmHJElOO0UQXpKYTo3rN/9ElZFJLGIojQIfihEZqHRvWm8R
 74Lw==
X-Gm-Message-State: AFqh2kpFqP3ibGVX+VK3MFHp7DxwvkpUAAAbXcd+oOL2EoMduy9G/CLp
 Bi8Ch6wlZnwUWxsi0JxmFZG+Z0EFmIxgqqjdhFJmnNjt8OLJZBqTIyv0fZWT8fY+5v0xgujcxTN
 6HcGM1wk6yw3H2qU=
X-Received: by 2002:a05:600c:4fd3:b0:3cf:7197:e68a with SMTP id
 o19-20020a05600c4fd300b003cf7197e68amr40912375wmq.18.1674901711972; 
 Sat, 28 Jan 2023 02:28:31 -0800 (PST)
X-Received: by 2002:a05:600c:4fd3:b0:3cf:7197:e68a with SMTP id
 o19-20020a05600c4fd300b003cf7197e68amr40912341wmq.18.1674901711722; 
 Sat, 28 Jan 2023 02:28:31 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 z24-20020a1cf418000000b003dc36981727sm4465426wma.14.2023.01.28.02.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 02:28:31 -0800 (PST)
Date: Sat, 28 Jan 2023 05:28:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 dgilbert@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 01/19] scripts/clean-includes: Fully skip / ignore files
Message-ID: <20230128052749-mutt-send-email-mst@kernel.org>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119065959.3104012-2-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vEqiWXVjkgPY

On Thu, Jan 19, 2023 at 07:59:41AM +0100, Markus Armbruster wrote:
> When clean-includes claims to skip or ignore a file, only the part
> that sanitizes use of qemu/osdep.h skips the file.  The part that
> looks for duplicate #include does not, and neither does committing to
> Git.
> 
> The latter can get unrelated stuff included in the commit, but only if
> you run clean-includes in a dirty tree, which is unwise.  Messed up
> when we added skipping in commit fd3e39a40c "scripts/clean-includes:
> Enhance to handle header files".
> 
> The former can cause bogus reports for --check-dup-head.  Added in
> commit d66253e46a "scripts/clean-includes: added duplicate #include
> check", duplicating the prior mistake.
> 
> Fix the script to fully skip files.
> 
> Fixes: fd3e39a40ca2ee26b09a5de3149af8b056b85233
> Fixes: d66253e46ae2b9c36a9dd90b2b74c0dfa5804b22

Isn't
Fixes: %h (\"%s\")

the accepted format for this?

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/clean-includes | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/clean-includes b/scripts/clean-includes
> index d37bd4f692..86944f27fc 100755
> --- a/scripts/clean-includes
> +++ b/scripts/clean-includes
> @@ -111,6 +111,7 @@ cat >"$COCCIFILE" <<EOT
>  )
>  EOT
>  
> +files=
>  for f in "$@"; do
>    case "$f" in
>      *.c.inc)
> @@ -144,6 +145,7 @@ for f in "$@"; do
>        continue
>        ;;
>    esac
> +  files="$files $f"
>  
>    if [ "$MODE" = "c" ]; then
>      # First, use Coccinelle to add qemu/osdep.h before the first existing include
> @@ -174,8 +176,8 @@ for f in "$@"; do
>  
>  done
>  
> -if [ "$DUPHEAD" = "yes" ]; then
> -    egrep "^[[:space:]]*#[[:space:]]*include" "$@" | tr -d '[:blank:]' \
> +if [ "$DUPHEAD" = "yes" ] && [ -n "$files" ]; then
> +    egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
>          | sort | uniq -c | awk '{if ($1 > 1) print $0}'
>      if [ $? -eq 0 ]; then
>          echo "Found duplicate header file includes. Please check the above files manually."
> @@ -184,7 +186,7 @@ if [ "$DUPHEAD" = "yes" ]; then
>  fi
>  
>  if [ "$GIT" = "yes" ]; then
> -    git add -- "$@"
> +    git add -- $files
>      git commit --signoff -F - <<EOF
>  $GITSUBJ: Clean up includes
>  
> -- 
> 2.39.0

