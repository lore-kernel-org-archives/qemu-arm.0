Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1351752wrt;
        Tue, 27 Nov 2018 06:35:51 -0800 (PST)
X-Google-Smtp-Source: AJdET5eCwRhIF9EFuunRliGYJoYi8cG9Ic3ncf/1oE4theZt5UiCJLFx32ahAHqqYXah9Va84R1T
X-Received: by 2002:a81:3149:: with SMTP id x70mr33719134ywx.420.1543329351463;
        Tue, 27 Nov 2018 06:35:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543329351; cv=none;
        d=google.com; s=arc-20160816;
        b=m7qSTRzkJcjzqzHVPd/ll5sbIoCuUZlrFYWoZZlANmMCeCR4YIQBxr20xJRagdtUJ2
         C+HE2aWR2gnOZ4vO4PoU01ilUlsbqJIUKkmVJWRVKYI2RermlYBlGJtykvxkUyrhSXUI
         qhJXu8FmMMxpPWaj53mlSrrGLJWPIH6hNuMJDrplqp559yV65OVq0iKqychU7jx9LXLj
         XfKfXxTERQyWRjiqLNpKSOdbuvRHDd/wDc6YFd1ZKpX+1PwSFBuxCUrwRGfykYOq8r5W
         MEdsaEYtZfdDeGH+PHBkLfPjTWV5YK5CafqiLs/+ysez5UDxj7Tvao0w3tTkF18Ajge0
         sdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vM5rqtxv26YvPrpq5pwOEOj1SKh7VtGbLEJ4qs+uzrk=;
        b=CgZHcf03jAsMXLl6eIePytGrvNJyemDjWe1xNqh7aUb2pvMpfFfs3pXavPlS7WMe9S
         kvKb9M4bGTIpzi4DFo5G2widmP+98VCSNT4uWdTLBQvxD8mNzHqrKGaH5fgXlzulUaUL
         bFi4Ia8GbTRQ7etdLiCulNe5r4u3RdCI8sH8ioe6M15AZo7Ol0zVOR0uPqueflJu4pKM
         oAr78Hk6iLETfVx+Nj6QcO0I4b86+YaIOkYDdA7sJ3XOILMeKLVXGod3KWBIGUP/3U8e
         qQ4QLWPcL0n3Zxb2H5K4OWCg1RoC/+HF7zPTUnmm1TByFpMzoiG5Tvq7hD3XLypcn6Wv
         jqoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gI1VqyPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p65-v6si2878910ywf.211.2018.11.27.06.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 06:35:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gI1VqyPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gReSs-0003Cg-Un
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 09:35:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gReSh-0003Br-2d
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 09:35:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gReSf-0006ts-MY
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 09:35:39 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gReSf-0006op-DW
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 09:35:37 -0500
Received: by mail-oi1-x243.google.com with SMTP id v6so19452066oif.2
	for <qemu-arm@nongnu.org>; Tue, 27 Nov 2018 06:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vM5rqtxv26YvPrpq5pwOEOj1SKh7VtGbLEJ4qs+uzrk=;
	b=gI1VqyPU4igOpx1UIYIu/Jl8OEheuJs0vdAOPFRhVOYvBNjkK4S01eKMJcyTixh2Fo
	IU8ch3A5bI1xh+PEqVcBGW1wBTyEQ4qnNEHTunQQ3AztvSjLRBGLvG1JfnVl/rKQXNDi
	LnFUU/fyY5leBqNpPN8uFFvitB9yDvLLO1xlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vM5rqtxv26YvPrpq5pwOEOj1SKh7VtGbLEJ4qs+uzrk=;
	b=H+wBiALOJ++cXR9ZboTkr7MwLv3MlOD0IkqyaumyOJF4ZDJY1P8fMaJFOSNKbqZJ9/
	Kjefjp2jNv5fjx4Lz26GewBM2PRHq0rlBv97uJryNUNTg7eBeswtIjurzSaIfpTU7gpM
	4j9oCjm/EQwTG+jOrS8P4dqEO/X1HpZWdZjuk4s3QzePW5vi5C+wPLyuLd6rZQBiQfvt
	m4Fnb2WZmQLZ6UbN5aUxhi3qEWxK0dRubBv4X7iCJ2SOp593uFVd/qFzvXRMJ0UobNM7
	iwxENwOdQUMSgzNLbkVfdbO+vyOrd1zX9R1TNnLJH4XctoHsZa/Aq3Y7PkL5Og6Cwijs
	B9Ww==
X-Gm-Message-State: AGRZ1gJFfUcgR3VwzI/SnMUpuC9/GT1JMxJDYo43gKeLqs3Jba7U/8EK
	ZyOZf/OVHnphZewMBeYGoiJoJsPyFYXCnjpax3+oNw==
X-Received: by 2002:aca:c501:: with SMTP id v1mr17002172oif.48.1543329335406; 
	Tue, 27 Nov 2018 06:35:35 -0800 (PST)
MIME-Version: 1.0
References: <1543316565-1101590-1-git-send-email-luzhipeng@uniudc.com>
In-Reply-To: <1543316565-1101590-1-git-send-email-luzhipeng@uniudc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Nov 2018 14:35:24 +0000
Message-ID: <CAFEAcA-Ln_72bdLYSBg1ZLsPDg5UeXW++opU_5huUfpL3TUhnA@mail.gmail.com>
To: luzhipeng@uniudc.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH RESEND] hw/virt/arm: Add support for
 Cortex-A72 in virt
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5E5hahFpInUw

On Tue, 27 Nov 2018 at 11:02, <luzhipeng@uniudc.com> wrote:
>
> From: ZhiPeng Lu <luzhipeng@uniudc.com>
>
> Signed-off-by: ZhiPeng Lu <luzhipeng@uniudc.com>
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a2b8d8f..f69e7eb 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -174,6 +174,7 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a15"),
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
> +    ARM_CPU_TYPE_NAME("cortex-a72"),
>      ARM_CPU_TYPE_NAME("host"),
>      ARM_CPU_TYPE_NAME("max"),
>  };

Applied, thanks.

-- PMM
