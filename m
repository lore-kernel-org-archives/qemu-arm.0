Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA97BC43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 23:02:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgsK0-0002Bj-8Z; Mon, 06 Jul 2026 19:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wgsJy-00026b-Oq
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 19:01:50 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wgsJw-0007ME-K2
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 19:01:50 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5aeb6bdeaeaso944e87.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 16:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783378906; cv=none;
 d=google.com; s=arc-20260327;
 b=cZYWhdsP0A3pjT1k67/jdFIr6JBOq+jNkyue0P3DqWT2czhIH2l6RXhbXzvGDiclSe
 jaev54eel1EgdHVozcZi8f8mASoscEqx56UHrhpk+AmGMtc9vCJD8NyTV6UzH7tvM7uZ
 v/34EhCj9GlUkhfTYED28Rvmbz3gW4b2kSk+5xH4uYj0Lx/zYqakyWsnGZGowrPRjwAQ
 gV/0SOKc52WG48RYSqp7ZUyb00d6+D9anm+Ly2rUy4UbPdWlWRlI8r/p7/KXXHvPPmqF
 3482NdjL2W03y5DVqIwuNjVaLLMXNlOMSqOZINZcZ2ciEHMqOKvq8upPBXqlUYHUGhq7
 kUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wO2iLMvkV2w5S4S4Uow4ZdR28T9K7ZwbCl7ZUO9/KrQ=;
 fh=B5ygAomjRB3Qcja3UEAsNS0lbYuQN3gLWvIb3hYXtxM=;
 b=S3x/e8MPbai+EUiVvJX5V8niFv2PbuHODwiUoSA1Kl4cTzBTDAmxjXnW1PE0s+nPTU
 NXWX3qVuTFQSHBFjOb3AXTv9RqhLN3vpXu3PernBz5pYkGF1RMOfaClnUWPNUZlB4un5
 avhn7NBRJfpwVeTZkN306PZxETLsMJZrLJobwpjJlk9L2jY5QTcJs/24iPHsJjauLkS/
 iPjVx8fh9rx4jVbPJFVwpD3D0fOoCn+CfohwGvORKbY0syctk8FlvrfOSBkEAXfRbBcc
 1jrXnj/f3Xdk0TQokDHdfmjOfPtkAYiUy6SLBP3Pq8zHiKEjlcdbHFXBkilJUEZkYNdS
 TC+Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1783378906; x=1783983706; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wO2iLMvkV2w5S4S4Uow4ZdR28T9K7ZwbCl7ZUO9/KrQ=;
 b=jNGoT93UBE/anvNB7w5tpgyPVUxyqlb0GcfKhckAgei5zpP6usEw2mtfJ7gSsSwKtO
 NkoiAk3YYag/6Qz1oVKnSQCIqyh5Ko0nF5SAvcgO8660xzpoAEcjJMZhNQzdLF8MIkbR
 cSfDm7q6CBRwxrBlU+y96zqun0BhRJHEsGDh977N7fke5sCI+4NIFjOfIWBOt6Jk/uWM
 3WTQqqL7W0vNgzwaDwdqxZw5YYrHDm118XUzIjhIG1L6enLKjeBQEhlFcav2JBSmYMTI
 2OYFuqpSoLZ6ybbhbUvfDF8yNN1boF/C9veZmWJGCVIZohxHp4jMn2UsrY7+L7o4KctE
 A5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783378906; x=1783983706;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=wO2iLMvkV2w5S4S4Uow4ZdR28T9K7ZwbCl7ZUO9/KrQ=;
 b=tA5jwk2xHhZ/8EXTITL2eZYd6G4JTHkFuP/+lU8p/mwwSvEP8qJZDhHaKxOpWe40YW
 YNSfEVJlCzsq0d7UHmjKq3JBut80lI/PREmyvKE/iIaLU2b17VyDNZXYIYw6SNRn7OKE
 hvUZlV6SCJ0mT6R4vZl3vzO8zWh/xyMe3L9JB5K3J6a46U/vhDHatuLi4UFQ1cKAQL6u
 +wbqA3Sk+TpAF/3U5+ogrJJrTk+B+w8tCVowhxk5euQDN+prtYD8Pj8GJniAtQUuk+L0
 6lgpUifB00pGLomJBTZs+99CQRFWlpQYm72JmhF5ci2m/JqhEYUq4cncz6+etcVPYTeq
 bp6A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpbzVBsG8YlPQjCr0Qi5UpXlgmFVG7HChxLNHGt1sqNtRTEpKJsGrfeEsrJ1NbQZB+5f+FzzqKv6A==@nongnu.org
X-Gm-Message-State: AOJu0YyuftJjSHhmT2lNQnT/W68aj2PRnBOSICAN7P3q47dUSkOpBpUr
 f5i8OCzqcKn6VqTXaPMZkl0Ehm0+uLO/nFFzGSkVjHQNvXxbawKLQ11eeqs4+hhLKQZnVViLtzV
 V1jw/NUHUELRxVCrJa4M4QBPYC0uM0sSnOlXqJ2Qf
X-Gm-Gg: AfdE7ckypQ83AdqH+V8cv9gpPO1AeAw+PeIogjOncQfh2jx1fbSEZVl97aNXrrl+UEr
 Qy35PP7xIyFqNe2THS/cB0hhyp4zGAbpfjE80FLz1glju6dwBwQIDRkbpM0WT6dEIUeBaXtFJ6c
 kUGKblWlmQGwVJ/qxmwkw1v/gLokUDHnA3PwOiNtZ53QyrZsvCZoxQ+EjNhgDm6zMwnaxK/a8Nn
 g33mB/2khJnDByOt8ZZJsUhCdxupSsiIc8ljlEKa9SymyqxDN0Y38SNKamA+c7rnXscbsS0A4yg
 q4ohP6tkA2mo/sIKp8SRArwx8UXsCkVP7/T14Q==
X-Received: by 2002:a05:6512:234b:b0:5ae:b59b:c65e with SMTP id
 2adb3069b0e04-5b00ace6efemr21718e87.4.1783378905391; Mon, 06 Jul 2026
 16:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260614222131.5795-1-imaginos32@gmail.com>
 <CAFEAcA-GGP6aALn4Az5By31q1R3d75Mm+p_YXN0y=tO3GxDYrg@mail.gmail.com>
 <CAFEAcA8zLzVLzTq-EJQ9+OpxytMdPuFkUbOF7xjmY0JrhPhYhA@mail.gmail.com>
In-Reply-To: <CAFEAcA8zLzVLzTq-EJQ9+OpxytMdPuFkUbOF7xjmY0JrhPhYhA@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Mon, 6 Jul 2026 16:01:08 -0700
X-Gm-Features: AVVi8CdLqN8eY1LBzlLVKuOnYS6NtHDIMx0rBUqE6HslYAOblXlH1N4b8QB4PCE
Message-ID: <CAMvPwGpaYiE0uwY6oVJjxdoVwGf8Mxr40o_m+PAhdZqqcShf1g@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c: pmbus: NUL-terminate strings received via block
 write
To: Peter Maydell <peter.maydell@linaro.org>
Cc: imaginos <imaginos32@gmail.com>, qemu-devel@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=titusr@google.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The adm1266 has a strange access pattern for the MFR_* registers, I'm
creating a series with the patch that fixes it, but a quick summary:
the data written to the register is the length of the data to be read
back, the actual string contents are read only.

I'm sending the patches that update SMBus and the adm1266 up.

-Titus

