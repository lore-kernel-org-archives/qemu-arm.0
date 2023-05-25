Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp315720ejb;
        Thu, 25 May 2023 02:49:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6dARunCGKfkiol4lSB3ALJv2l2qSMow2dkex/nrOadmT4BFfr/TV8us4Odgj90M/4woiTL
X-Received: by 2002:ad4:5de7:0:b0:621:68e8:999f with SMTP id jn7-20020ad45de7000000b0062168e8999fmr579146qvb.33.1685008184565;
        Thu, 25 May 2023 02:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685008184; cv=none;
        d=google.com; s=arc-20160816;
        b=wNOyDntPgzH16fGjVoOhvb2rtmrZAawRl3sYUeex8RZKnadjSil/j4z4pw6NRoAwjv
         ZWcpNBJdHmJyBhgBbizJ0E4ifugPiqZSWR4AvBdv8oK1VqPUg7X1xVXtFYvTbBOUYhyA
         6yl5bqnm3/f/jY+WQuDQBeIGMXtWDN4eXX893xROaWhbyWXUQ5bpbYSiQ4SCrYfSPh4K
         bXKH2yDDizQaeKkIKJpmJIiQbNN7yna3B/ydDdGmAe8/SkmsoDqDYMuQ4UZyiG7oJAqM
         jJjrr0HUR5/QXLwYGo4mSU+0RZnCv3WcHTerDbaFaNn0wk9frI6BkdhSPKgpxDOSCGX2
         4P/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4sYvGft6xk5i4rrYz/pMCkCtyYEcRAprUfgUpVNQu4E=;
        b=GoJfgCGTVpdWJkkEP5VayMY3JvAiapbV2sVThpVB5Mf6BJMxzAnoXIR9RFfiylx3cR
         cgM6oLBR+DMj4prr2vmE1JW9BIq5UlkI7GhdD9xuEt/8T+K5zGjgeLBZme+16c3gYIEA
         ylKSFF8gfu6zHtJzl7DuRKZwxFZCVQOmFZOnYDTH/p6ihpU2w605wH/b13saJcgT4Zpc
         AkhudQnPLBj37nUU9+NPRY8DREhaNCtRtaHP0nzkNJKz4x2QEfM9XBvt478f+RNAXC6G
         W6uEwpcqR7z4TH2okB3Ae999Dj8QSo3OujNYZWmZTDPdblNk+ufU9x2yrjIx+gOfQU00
         N02Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iDLz/bKX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a0562140da200b00625b6cf122dsi334731qvh.115.2023.05.25.02.49.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 02:49:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iDLz/bKX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q27aj-0001Z5-Jr; Thu, 25 May 2023 05:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q27ai-0001Xm-6a
 for qemu-arm@nongnu.org; Thu, 25 May 2023 05:49:04 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q27af-0000Eh-Fj
 for qemu-arm@nongnu.org; Thu, 25 May 2023 05:49:03 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-510f525e06cso4059578a12.2
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685008139; x=1687600139;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4sYvGft6xk5i4rrYz/pMCkCtyYEcRAprUfgUpVNQu4E=;
 b=iDLz/bKXkzv9CqdPqken8ZEOQnCL9JTOwmelTqCTnK5IUtSstw1yXmfzWJJIfK5aKR
 /J4i0XFzGUITSWc9yt0ge7d9GDDPzBA/HHFqx4ew5LeBTxQqgQabC3sDgVAoDbG/6PsB
 MtGzMhYxZThROtU7OIszo951dLoxvqxieLFfsOiacbU7cL1DXjIAgsg4tPVZzA1EYi+5
 AFweuusXCX7YIW+kH+GKm6NVDxeOO5LMxTQonXuRooh1ksRALEfo/heMFXj2bXQQGQhD
 3b4+3n50jgyIFfD2YC9X/jwCPcCDPSd3DyTOVmZiEiO0WK960B8dpjIhexTqAOWwHgRj
 hQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685008139; x=1687600139;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4sYvGft6xk5i4rrYz/pMCkCtyYEcRAprUfgUpVNQu4E=;
 b=gN2CcR+5tvWWrsm/uvewLv6CwuzWlw9oWIE6JeHnPPfHtfDQaLVi0l5GzE1nhAmRfj
 0LEh9o5zfh7I3gOunnwtVPbm4LibI0VgmgeP1fFVFdQHOdLvgTrA1iEEWSM6Rxno/fx/
 kVZmJeMothCa2MPa5e0pRvkisM7z8A4vb8dyqu3vgvWQJPZwTOaOnaPkyiL2kQmfdnoq
 AFDBp7EdzjAH8iu1G0xrYZXzzu6rgmGMYeZNd1NUEGDgzm78sJmKDOWEVGmT/CHOWEvt
 0do3lf/1ubrnsnrKNQhK6QT9LmuENL66UHqpdiV7TU5ypMPYBam6ftLf3mJECNXwWCf9
 c9qw==
X-Gm-Message-State: AC+VfDxw4NlHlxVLt0a8uv7UmncIFBmC6J0XB0GbyiO/0AStq4UcbLwi
 7WFDr0vqH8jXYLS6XmU7s/uioOnqiESrp9MXtIM2aw==
X-Received: by 2002:aa7:dd10:0:b0:50d:1e11:eb9 with SMTP id
 i16-20020aa7dd10000000b0050d1e110eb9mr4148589edv.1.1685008139289; Thu, 25 May
 2023 02:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230510103004.30015-1-qianfanguijin@163.com>
 <CAPan3WrukRx7NSBsCFkgfaRwbGD4j1P_SZpNiUJk5T3030aKug@mail.gmail.com>
In-Reply-To: <CAPan3WrukRx7NSBsCFkgfaRwbGD4j1P_SZpNiUJk5T3030aKug@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 May 2023 10:48:48 +0100
Message-ID: <CAFEAcA_L5QNBWvXWkcyKn4U-=yHv1kYuear5F1v6wQtt0TMRPw@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] *** Add allwinner r40 support ***
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qianfanguijin@163.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5JhqHmLvaMq7

On Mon, 15 May 2023 at 21:25, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> Hi Qianfan,
>
> Thanks for sending the v4. I've reviewed all patches and replied to each individual patch.
>
> Great work so far!
>
> One thing I wanted to mention is that when you receive a 'Reviewed-by:' or 'Tested-by:' line from a reviewer,
> please feel free to include it in the commit message on the next version of that patch. This helps you and reviewers
> to keep track on what has been reviewed and what not.

Looks like this didn't happen for v5 :-(  (If it had, I'd
probably have been able to take v5 into target-arm.next...)

thanks
-- PMM
