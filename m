Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3170952lft;
        Mon, 4 Jul 2022 05:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vLO+46Ttb0JwG2QV7f6tlRlt7u//QhzEx5wB2uly8QnBE3xbuybTBJvdUBMbGcL8myj+kC
X-Received: by 2002:a5d:430d:0:b0:210:2ce0:e2a9 with SMTP id h13-20020a5d430d000000b002102ce0e2a9mr26487119wrq.627.1656936231542;
        Mon, 04 Jul 2022 05:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656936231; cv=none;
        d=google.com; s=arc-20160816;
        b=p5X9jka3v2hqYjO8Eh8HER8G6T880cQexmU8JSVRwWwkmjp7rEYCFApLqZTQzXXH+5
         4ZQxv+9mIoDKhudBpu+LI4MjGz8dyDIxxkZx4a7KvnfahdF/t4vYpo6lC/TDNb3Klyao
         K+4tcLstifw4UOIJgc4JXaPfSZFd0h2fXr2UgVELG9pXwkkf5WuxapGjV20PQeowK6xy
         j05kQJIlkXi87b5DH1rwUtqX2bMclb/nPVQyV5zHfBJViH/Fv19xCtplohK64+LZE/mm
         vCq9cKbW5sDk/BUhRE+rilJJkPtQ2WpDRrzkkH6ijHkyNc3wCGioZBcUsUzFS0B9JfVc
         o79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QaSQc951CE9MI+P/5fjBEYTsbczMqj7zV7C8rroQKXU=;
        b=ktV1dVSQHSfapIrlff6jCzXg8cMuvQEmVyjrBvNL0QwKocg1JPMHteU+JTYe9DuSM+
         w8Ev6PbPt3pWXvl4b6W2kOR1jWgAbbLCpN11YX/c4HdIYK4cCf4g7d6bCx7KAkfqMuvW
         izLqCPZ8x11LwMLYJriNIpxP2nOptBgZKIaR4gCHzC5mSi/lGioa7o8WkpR9eUkjf7S4
         Dr53EKGSUqOuXC0n2HHtnsvfdvDjb+HsbPtpKgKFZoDDb8B9tC551BMjwrCHbKa7Ev4j
         46y6HasSnMxXjaTqc8hrKPItk+su/WyQq2nErV+JNfT7UzP75l+vYfsguNXkxvbNle2a
         6g+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wlYtuMl1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020a5d6da2000000b0021d2eb7c74dsi24687552wrs.837.2022.07.04.05.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 05:03:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wlYtuMl1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Knu-0003EP-Mo
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 08:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Kmm-0002Rx-PL
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 08:02:47 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:35732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Kml-0005EC-6H
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 08:02:40 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31cac89d8d6so10236967b3.2
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 05:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QaSQc951CE9MI+P/5fjBEYTsbczMqj7zV7C8rroQKXU=;
 b=wlYtuMl1cd3KLPMRyDjRmci/K/GKsd4Y0N7kuys1OBPAUaYA1FVxkk83RySr5oSJNE
 yjCnKA40HxG467dVwI3t3lEorpRFzSGQUNTDKB2YJWxBLRzb1pVDN/VxNgs0zWBFo0Tu
 I0bxA81d2RgeYN7Ie1QLGgbunKWHWtivjVUWp+h/4LOLGTWwU433XUMRPCTHhzF+f6HT
 2gFu44LWstot+2+Ponx9gnd4vKWepv7T28YCSC6BFYCPU24/MTL5q8WnPyZLGY8eqtPo
 /Pd2PmInfBc4E6CFiwZEl61cQ7i3xBBnSoapzo0MXWwZKsBqllRL7PwzQB5YuaL0hhxZ
 GkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QaSQc951CE9MI+P/5fjBEYTsbczMqj7zV7C8rroQKXU=;
 b=uK8ncrZysqMstAzSnxGitDwMBKiuKkGd844aiWTE4KnpjVu1/Epg7+SpaAxGlG3ncT
 WpuxcKxkRgTj3fr4BWNbrOyCk7AXdF+LkPxI+4etOkwUSeIre+UTb8m9o5hASeLtTppe
 +m5yxyQ2c//Y+i0CeF6optQ4fGSQE+JGu+Fhg+vu4/Ap44640dThScgBhDhPaY89RA43
 e8s4ttaH3WSFko8qtOQBsxc0ci+xSO8WTaU0m0clRG7Tz8rrTmyhs7bz4yrNZnaWP/AL
 LLFbtyljHCls3Ixxcu3lQ3+cwTnxBAH2hDh4CrJ9rSqC32Tofi8PbLZoakQxIJpKxIc0
 rRDw==
X-Gm-Message-State: AJIora8FNQzx2U3NCZ6lsFfTUuQzeT647H1DcXHDtxzPF+NzVrkF8i+G
 o0vepWkGly3Otix+KmW7d4LxGqaywIMcBuQiSqw2hg==
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr387204ywb.469.1656936158140; Mon, 04
 Jul 2022 05:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-36-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:02:27 +0100
Message-ID: <CAFEAcA80YR_jKXqW=qfVBFgd_FG9ZiMiqLs29Njsw3jtXdSgxw@mail.gmail.com>
Subject: Re: [PATCH v4 35/45] linux-user/aarch64: Add SM bit to SVE signal
 context
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AtUnYKiaDWkh

On Tue, 28 Jun 2022 at 06:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Make sure to zero the currently reserved fields.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/signal.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index 7da0e36c6d..3cef2f44cf 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -78,7 +78,8 @@ struct target_extra_context {
>  struct target_sve_context {
>      struct target_aarch64_ctx head;
>      uint16_t vl;
> -    uint16_t reserved[3];
> +    uint16_t flags;
> +    uint16_t reserved[2];
>      /* The actual SVE data immediately follows.  It is laid out
>       * according to TARGET_SVE_SIG_{Z,P}REG_OFFSET, based off of
>       * the original struct pointer.
> @@ -101,6 +102,8 @@ struct target_sve_context {
>  #define TARGET_SVE_SIG_CONTEXT_SIZE(VQ) \
>      (TARGET_SVE_SIG_PREG_OFFSET(VQ, 17))
>
> +#define TARGET_SVE_SIG_FLAG_SM  1
> +
>  struct target_rt_sigframe {
>      struct target_siginfo info;
>      struct target_ucontext uc;
> @@ -177,9 +180,13 @@ static void target_setup_sve_record(struct target_sve_context *sve,
>  {
>      int i, j;
>
> +    memset(sve, 0, sizeof(*sve));
>      __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
>      __put_user(size, &sve->head.size);
>      __put_user(vq * TARGET_SVE_VQ_BYTES, &sve->vl);
> +    if (FIELD_EX64(env->svcr, SVCR, SM)) {
> +        __put_user(TARGET_SVE_SIG_FLAG_SM, &sve->flags);
> +    }
>

The kernel documentation says that if this is set then the SVE
record contains the streaming vector length. Does that happen
automatically (ie vq is the right thing for both streaming
and non-streaming) or do we need to do something there?

I gather that the other half of handling this bit (allowing
it to be changed on signal-return) is in a later patch.

thanks
-- PMM
