Received: by 10.223.172.38 with SMTP id v35csp5896087wrc;
        Mon, 11 Sep 2017 11:09:23 -0700 (PDT)
X-Received: by 10.55.79.65 with SMTP id d62mr16857651qkb.224.1505153363101;
        Mon, 11 Sep 2017 11:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505153363; cv=none;
        d=google.com; s=arc-20160816;
        b=FZ2HfLaPU63DZrUa8YjfzyiZ5a/GrHfxrTVeMoiQ6O3ZRbYjU7pYPZcvwAeoGjfjJb
         zavI1Xv0CvCbssyCNwzrn2YhgYzuFcLnVPITKWmUxKOPpRwCU1LkYNz/sbc2/tYyqoNB
         UrLMawu1WLyzKvWqBguHzwgTgiJIn+9Rilcg+8zw/u8wuPFD0DI0R7GF1249/2z/QHDY
         kkj1GGU1Qf10niWgwdnRbUHuLkxn3sLirLd/qPGFs2sQcsxhTgBS8iLKabiJyTccjvob
         wIH6h0HTp6oeXO/pzkm/7zfBf2zdLKeQ8Z29g0rwMep1pW7+Fg/XoDR0hivx/46TTGs9
         775w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Q5qTb8DeqqH4ZI42OsRSdJEd5Go1Xe5fATwmO/6wuLE=;
        b=xz/31d9s0Ywso1bNqFkzmx8YOpdYUR8lIuXyA+p7ZJ6HGfaxRVzwc5gboY1/U+M/+9
         /3t+YtHQP2QllCJUYSq3z8POtra5fXQ8+sy+qzqmWSRxiMLuFOtpTJ1ZmI65xetM8+tn
         BuI4ij28boXWfULwZP1nz+XSMt38pLGj4MKfsUJY9sILF7D2Qz9FvS4GoAcZ79OjWvxq
         iH9oavbeD8YgqCK6VXbWZx1BlX1F9AuSX+7DQij+R9eJwtv9Dm31FVnAKiC2UaAcyEKT
         Nc+rjfWfY1jZVinINCQgyUQHbaHzdoBoo1L4OGWov8vGxhPHPFTthZy7tMaABzMSQWhG
         jMYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ln0bc7Oz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v64si2592682qkb.46.2017.09.11.11.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 11:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ln0bc7Oz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drT96-0001oE-Ls
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 14:09:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1drSiO-00010l-Bv
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 13:41:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1drSiN-0004Mc-Ez
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 13:41:44 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:35124)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1drSiN-0004Ld-8u; Mon, 11 Sep 2017 13:41:43 -0400
Received: by mail-wm0-x244.google.com with SMTP id e64so7464813wmi.2;
	Mon, 11 Sep 2017 10:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q5qTb8DeqqH4ZI42OsRSdJEd5Go1Xe5fATwmO/6wuLE=;
	b=Ln0bc7OzePSKrsuZtQd9x8dIUd9t7dpmBBwRAFGZlJ5mLE3kM8rNZBCAH5i9y72eFn
	Px347l0B+WtfJRfExJmqkV4FlyrQUDBtWbqciGLJnD8vpzVYNt23RDW0kBCHsJVeX+7l
	z+w+2yBRHI8sglS3a0F96kt5nyT3PczL9YFVfM1sSUq/WuSLsCWGZ4Z8C9sIinF8fw1o
	UBd3VlnZGSgVcD4PWoB9fRAEW2JdGgP0ptMZFm18a6j7Y62fZvrmJSRxK9bu99uuTmrk
	4AbQJry0gG0Y1d8OxDhAcKGn1JvzVGnLuYUE5UCiChgtemi+UCklarzcfpAyxbXvime4
	VupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q5qTb8DeqqH4ZI42OsRSdJEd5Go1Xe5fATwmO/6wuLE=;
	b=STieePRiiXglTcdBRVRGxjDPfV+hl0H/A3JxX0/Hvbv0SaiVdc+c1uqEdYAj8P9Y57
	kEjNPKI5QvI8hfw03OjjXZ1n9QDO+GERPrDb45k7BN8QBfkSUDh/kR7lPk7bASTI9MZT
	E8iRY+aqUnlTCy4UOFsag1ksVLVOy4E7h28SL0oo7qrwYJVnUqSfzBCsNKdsgoNXEaXQ
	Mn/b3XjU64QYxyjs7IkbwTH4PFuSzRp4/6J6JanBYhrCK1iQNqcmNMkvXSVeTY5j1c2h
	Gqly7Wc4Btea+9efDnQp0euLHXL0GJK84YwTppZEtRb9WvRL/88uNYek4EGL065WuPCL
	SyXQ==
X-Gm-Message-State: AHPjjUh7jgW+Cw2b85Vt+RLzCHvRCLFWTbY0Mn+kPLEaZ0E8bc+CSXNs
	PQKnK1QksQq4awH43n//rpGbLfu3OQ==
X-Google-Smtp-Source: AOwi7QArOeupnlH1UQoA9wjmNu5+GGzejIyW9cD0XcgRlofRhwkyidtWUkwvvIetnN799zWKb53vkQnFIO6JTYZ7I1c=
X-Received: by 10.28.129.23 with SMTP id c23mr9681878wmd.27.1505151702173;
	Mon, 11 Sep 2017 10:41:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Mon, 11 Sep 2017 10:41:11 -0700 (PDT)
In-Reply-To: <1505137930-13255-6-git-send-email-peter.maydell@linaro.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-6-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Sep 2017 10:41:11 -0700
Message-ID: <CAKmqyKPjNG5ttpTmSrdqNvWRk6=+Y1_kT6HE2bTah_C+2OvEuA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/7] target/arm: Remove
 unnecessary '| 0xf0000000' from do_v7m_exception_exit()
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kk8mPfpRR5tx

On Mon, Sep 11, 2017 at 6:52 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> In do_v7m_exception_exit(), there's no need to force the high 4
> bits of 'type' to 1 when calling v7m_exception_taken(), because
> we know that they're always 1 or we could not have got to this
> "handle return to magic exception return address" code. Remove
> the unnecessary ORs.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 1741e0d..fdd5cc6 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6306,7 +6306,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>           */
>          env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
> -        v7m_exception_taken(cpu, type | 0xf0000000);
> +        v7m_exception_taken(cpu, type);
>          qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
>                        "stackframe: failed exception return integrity check\n");
>          return;
> @@ -6348,7 +6348,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
>          env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
>          v7m_push_stack(cpu);
> -        v7m_exception_taken(cpu, type | 0xf0000000);
> +        v7m_exception_taken(cpu, type);
>          qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on new stackframe: "
>                        "failed exception return integrity check\n");
>          return;
> --
> 2.7.4
>
>
