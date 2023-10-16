Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3305068ejc;
        Mon, 16 Oct 2023 09:30:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCWhfZiIE7O1Ip+njjUTJouaZB4w83wBiFdD6KkZHC9MaxblIadAj5NFjlVX0XXtLvSAan
X-Received: by 2002:a05:622a:1818:b0:418:1365:9b41 with SMTP id t24-20020a05622a181800b0041813659b41mr43894279qtc.54.1697473821409;
        Mon, 16 Oct 2023 09:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697473821; cv=none;
        d=google.com; s=arc-20160816;
        b=WW2NtXjB1gtApwnvG8Dn3E1OZg1jQsA9AkTknyUPU5h5rHTxThAnSKGRdbs2+jcHNo
         2doYkDxhnSLNzSsxmISDdieWdRRmDYg7L0jW+5j2HZtfJd1/Ns+DTgDHW4ODCgDTGbtg
         5Y0ykp6dKknMw4nUXn1eVywycu6RbtlYwModVZb3qn+9B5gj1ehcCU7siHQQOsx8J9KW
         JzTHu6l6eoCJbvv6hx3aZ0T+za1Qxwya7l6sZuHpMk2ZQTawOjRwXK58V8WrDjcvOPbl
         IuAtWRYS0M7zpA34BBZUshrPMQ6YnKf6AixVR1eLPxOsCWN6FGyS/RBLDIHFRieJ/Hnw
         2ZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jaHxq+1L8bc9x0CmHiuTE+EfN01okvvFhh08nMu3ds8=;
        fh=j/v/ufwsVFWAxDisQ+bUJlpLZ9J2BcNZvMYjnEqO56I=;
        b=glxbaYISs8xQ3lUOO9V6gZGAhZCVVBIdXZRkCIAJjqLfMa3rLKqJZ7gQVb/8m3PKJc
         /LZSPaU1j3t1ZJb6EpxOxlCn2XJXmt6OHarPwDImv4wO18dfufmYTS5YKPsUr5XXzgvl
         mj8BViCob5TP1JhuLzjtWAEnKcxkb727Q0jIRf93gpYfl6WJj4JIiOb8o02DTQ4MA283
         HOMXUrzyw+kvFjuECJORXlnk+fvwJMOtrREp7S7L1jEXODZaaMiATQk8MsXANSDQKQay
         g7jJtKMBRHcmVL9CrglPZBzUJjAYW2qMyY4Tz9GN9FUoUyjR1cO9PIxSonEMT/RW0MKc
         GtuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aQFz2yJ4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020ac85f91000000b004181594e15dsi5544972qta.326.2023.10.16.09.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Oct 2023 09:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aQFz2yJ4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qsQTP-0002nw-DI; Mon, 16 Oct 2023 12:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQTN-0002nN-VY
 for qemu-devel@nongnu.org; Mon, 16 Oct 2023 12:29:41 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQTM-0000jr-Gu
 for qemu-devel@nongnu.org; Mon, 16 Oct 2023 12:29:41 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so8229890a12.0
 for <qemu-devel@nongnu.org>; Mon, 16 Oct 2023 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697473779; x=1698078579; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jaHxq+1L8bc9x0CmHiuTE+EfN01okvvFhh08nMu3ds8=;
 b=aQFz2yJ47skH33Tg7N8gRRR6io5mNe/jLBPRqb3waAcJD+2S7gmlCBZhKJ496wdsvo
 XgyGrw7pfv/jcpIaRr1wovhVb1gV3AoB324Oy46ubvfT6hlSm4vqPE1wDbyky83KfRIk
 L0CGOwqieEx7XOrxLznC6zrcUJ0RQ8MM8n33SbwqCuYDOW3JgM8LWFnEu6Ae+bQNX01L
 7QYCGews7j6ddYw6n45nLzsokElK0+Nm/PM8zx+3aDpzNse1RYcIfGQ0MSTdiADX5eF+
 jPfY9wjorAos/oFOYEClI1AfhUx32J54Ghfl99Qna3Fn/vfWpsy08vnWOZs9X5XbSzQu
 Zk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697473779; x=1698078579;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jaHxq+1L8bc9x0CmHiuTE+EfN01okvvFhh08nMu3ds8=;
 b=V2V3wbAvGwwbfV5SBUaG4WjH2PcpJOmqfBaQxVhhqwrr6hjgimpnOFFb3OSRB0g2o8
 lr7pSbvSua7hEbXNEy9EJ0BfV6rc+C7c3HhwxbeF5/gVSe/gEexI2a+qFFNzg2KBLtBg
 +NfvPMPMMxisny+JMVcSfVaMC5glF3mqzMMzfOJQPBF6t1M9cc2oo3hni0ynZj1Dx8Qw
 Sb+CXaQLIviiiLgaIdXPNtK3PyY3e1POk9fAWULY+Jv0GTYxWOfw4asPZj118l+l79FY
 niEMO7oR5buWPJXFwTy31mjGzLsuucTwFY7GZeN8iP/QaGpC4vvN4wwYhHAncRZuRjhS
 iuLg==
X-Gm-Message-State: AOJu0Yz/h3WMyKhxy806NhXbh/uZD4B41iAxcq0FkwlcUIR+kvRfjTtZ
 zsMZt+ZciyEiYbNXEFgPtfLlAtXdNytuUJF7MQlXLw==
X-Received: by 2002:a05:6402:951:b0:53d:a4a3:e5cc with SMTP id
 h17-20020a056402095100b0053da4a3e5ccmr11762181edz.42.1697473779035; Mon, 16
 Oct 2023 09:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231003052345.199725-1-tong.ho@amd.com>
In-Reply-To: <20231003052345.199725-1-tong.ho@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Oct 2023 17:29:27 +0100
Message-ID: <CAFEAcA-4TkKVAOsnmQSQF_Sfd7ECQPYHtv5zkWVhBsv-O6YLjw@mail.gmail.com>
Subject: Re: [PATCH] xlnx-bbram: hw/nvram: Remove deprecated device reset
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me, 
 edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: nXpXKk0dKmh6

On Tue, 3 Oct 2023 at 06:23, Tong Ho <tong.ho@amd.com> wrote:
>
> This change implements the ResettableClass interface for the device.
>
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> ---
>  hw/nvram/xlnx-bbram.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
