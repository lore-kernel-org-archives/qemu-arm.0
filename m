Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp900041njb;
        Fri, 18 Oct 2024 08:42:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTxMJLyqB7Y3LymF4jvJCLgqJfaDJ/LVewFD49eHTlIYkaL3BgsaWqwNV7QfWOs19Mf9lxp7B+UTPOpA==@linaro.org
X-Google-Smtp-Source: AGHT+IGFtMq+buKfDy/IAumgFtD5ZMuIxPdTFput50gpFxW/U3asVXcxms756CL+M+D4xpN7HTsD
X-Received: by 2002:a0c:f64e:0:b0:6cc:3fb:376a with SMTP id 6a1803df08f44-6cc379048b5mr87392646d6.25.1729266160597;
        Fri, 18 Oct 2024 08:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729266160; cv=none;
        d=google.com; s=arc-20240605;
        b=TkIDJFe0Xb3uZSNtqYuAl8oMDXRbxnj2/mwEFj69A2F1BwzNJMwuI5mo/F7oyjVw/T
         rePKFG1KrLZyiAiMSTZAjnFX5KY1KjaZlYFNYN0FZ4RmJJx1Gqq0zTpR7xn/Vj3XZjg0
         8qiFIZz3DiXfZHJUGrakG8J3KtDhNTR9R4MTGeP6t+K5n/NS+VBO+BvO4Ycy76sZzboH
         7R8zYWTSsKrvqf03dV0LH4KxzVKhKzRMMx3yG4AhTgnKOjJKdR57AGpd8x2z2vXJu9i/
         RSGWTeNDOjd/TxjSG6unpvOgSgVGfwvuH4dFn8g3XRSoXoxZhlwo9hxAEW4G1KZLOuNj
         M69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=m21PZad2rLJLTKcO9mA/D+REAZ1vjk35GaRaPiKNmj4=;
        fh=OxEHe7h6ySA8HVNPiaRyT3paCjJpMtAksambj+c0jMU=;
        b=NN/uqhZ6/kEnslPUHL97EvavqqroPbVH9QUTDmdRbBOX37hTLtdQLAf1IKcsqGgeDA
         WmFYjDsZIEfZk28KVGoYGNAhYMw+B24DTfZqnxwSWFoeEd9HxMRV8nYqsKwR303Af1jq
         w197az+KWYjfbiHWFr1eZJaToq7CZwWly4JMIgAU2Th0pZKZNzskl2Buzh38UQj7t966
         yGd10ifLO/g9t83GrIr04ieP8bqGmPoO5BH/hbqCMH5g/it5Pfx6plsFfEJlR7Wdu9kx
         5aF8t3grvM5QJVsKEXNJEsJxy+wmG4pXcQStobMj0xikn8IygnNhNUlibvNU6su6Jv1m
         PaLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VJsULgu3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cde13a3a46si19889666d6.485.2024.10.18.08.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2024 08:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VJsULgu3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1p7J-00044r-0M; Fri, 18 Oct 2024 11:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1p7H-00044a-QS
 for qemu-arm@nongnu.org; Fri, 18 Oct 2024 11:42:15 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1p7D-00010S-SW
 for qemu-arm@nongnu.org; Fri, 18 Oct 2024 11:42:14 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c9454f3bfaso2643209a12.2
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2024 08:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729266129; x=1729870929; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m21PZad2rLJLTKcO9mA/D+REAZ1vjk35GaRaPiKNmj4=;
 b=VJsULgu3RtX6uT7v0+2ImzG5jWinyen7j1/fOwkvedPcoC97dg8YsHw7reLJP4IIe3
 p2tlKqa24lUQq7O7ShUoHBbA6BHjb8w/veb3BcvnZGpyCpNMJJJvDR2g43e18n8vv2m5
 heKFsyvIFfAP6/+R7lYdXw3tYD2kTanOczfjNhEaE1Xj/ei0e1sZfMA8oa79StrtnyaT
 vYlp5sZ8TIBK9Wsx7tddConuRtOMHXRVZQ1LzByPpwQdA6v0ucYZmd7sd9hhoC8xYPhw
 zbEr9vbg4dHOtXNK34BPUU77GIcioLTVIF75izybKY/jErLJCe2jNO6D/7Zl3RnDnNtk
 CXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729266129; x=1729870929;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m21PZad2rLJLTKcO9mA/D+REAZ1vjk35GaRaPiKNmj4=;
 b=kluTheuT7VuDftZTYVzOhlF6YbYtZ4buUEIU1xK2zCibum8sDc8tMzrkjHSXEAYnQV
 qQFGagTiW3Z96dSfcwHMhgvB/2VrEh6a678ACV2WRZg9xQIZChGw8JwWGnHJUHVPJ/ea
 YV6O/DQ+D5Wjcw7sfTCr/SjNkV2zM0fqPdxv4g1H0h5yyPlNKHPw7IuJsDzpPDpBLdvu
 FC7k6F9dORAVh9HXr7pLnDd50k3lQ2PHqCj8x8i5ncI+wuXDeWK8cJZ2v0Qch20kEDqh
 DJDWpyDZrJtY0dDp7/Dh43a1/hkg56NjLHQW1Dzut1tAhJEl36GDuD4GAnYfAhE2Dlz7
 g1MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULubQclR7xkcTbdZpzgn0aY9LyPG1ZDtKlaCfKoC86rKleuWgQe1K/Z3l6S8NeLMZ7q6EfYhh/TQ==@nongnu.org
X-Gm-Message-State: AOJu0YzHewFRz2oAs3cu+QSscNLjVRlLTcs3YR/MIeWy9gPtQ7NIl+HY
 YbUMt6SSrcoBgoWZ8LpM7AVU/tKn+bhXkcM2q5FSceqYxTqlxLJu3QIrt5Ckpfgdf5Nu4eSDydL
 0q9kNfwIevji3oY35JgGYEceWqbAd8UC7t91zUJPgoQt+YbtE
X-Received: by 2002:a05:6402:26ce:b0:5c9:87a0:4fcc with SMTP id
 4fb4d7f45d1cf-5ca0ac62747mr2093839a12.16.1729266129425; Fri, 18 Oct 2024
 08:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241007171700.1594342-1-titusr@google.com>
In-Reply-To: <20241007171700.1594342-1-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2024 16:41:58 +0100
Message-ID: <CAFEAcA-YKnQT4QUrqSgJR1_XOo-xVOCR+4Um0xxP-sZdopgHHA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add Quanta GSZ bmc machine
To: Titus Rwantare <titusr@google.com>
Cc: minyard@acm.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 venture@google.com, wuhaotsh@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9FLAQHZIOKWC

On Mon, 7 Oct 2024 at 18:17, Titus Rwantare <titusr@google.com> wrote:
>
> This patch adds the quanta-gsz-bmc target, a current Google machine of
> the day. This machine will be used as a platform to enable features such
> as the PECI bmc interface, and Intel eSPI virtual wire interface in
> QEMU.
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---

Nothing obviously wrong-looking here, but I am assuming
somebody who knows the hardware will review this.

For a new machine type, you should add something to docs/
for it. (See also
https://patchew.org/QEMU/20241018141332.942844-1-peter.maydell@linaro.org/
which is a series I just posted today that expands out
the "*-bmc" wildcards previously used in the doc titles
for these boards.)

thanks
-- PMM
