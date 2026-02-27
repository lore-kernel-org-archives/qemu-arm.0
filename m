Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DD0FEFB47
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 13:36:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvy12-0006OK-Az; Fri, 27 Feb 2026 08:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvy0z-0006Nj-4g
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 08:36:22 -0500
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvy0v-0002Ti-UT
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 08:36:20 -0500
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64ad9238d8fso1928566d50.3
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 05:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772199375; cv=none;
 d=google.com; s=arc-20240605;
 b=c87HEB3qNEgEJInLWNqnPi5pmLfNaGMcMp7Getiq8MCZsorFdo35/8MqR87OUGi1yY
 14+LXr2vqAoLNxOHk8A2GUEZVZVMRhkQAC9euIpvJY2bn9V9tJ39yt1JSEGn1d4aNK5x
 D7Q4gAqqQWuJfZGXGjr0IfygwVNd5qijRudz56rjcJXHzsri4l1WgoK7ShAeQKFvhun6
 1Muq8nRZ1EtPB/KT9Y/IDSZor9jkTa5uBqv6WuFs4AIdVjBnnIXKUChVkvldUycFipfu
 xMuF30OVNb4mUa3p4Nag/6VabZmoEK4OKG1sip6DUg/A9y7mQkos0dOOfU4dmSIShsI6
 HEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=S4irztnqbbgQlCoC34C43pIRxRtPZhHtjrI1JhWV6sc=;
 fh=32NfRCuSTSZeV4deBkV1kj/pA8TAka/zkBhxcIwthj4=;
 b=WP6qSiRu3buJNyMeQKhHHjGKWUZGOqO3GAs9u7B8Uk84Dn48u4RU41Tg4oaw7lzW5J
 EJJ9IZVFA7vKJxS4XLDW71hkLrF4ufN88qM3IVxtvIIrBiGfOjN3M13+1eCseHIMt1FL
 ohJvhqOxn5gbwNMOlpdjovyJrONLcpDbwMX6DPElnrWQ0ywdkUy8lzPjjdAAv+Elkk/F
 VMBWGEja1BoZBK9lVk12nDQeRdP8U8KxjBP8u56f7RZjtjUGWzNQC7kak9OOiEmsnC0N
 2kqu4T60bBRVPZQDSXUtcIssVpZqQDnj8LE7NelvdMMmAnO94bzhosOzQATj0NDgRuPo
 woMQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772199375; x=1772804175; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4irztnqbbgQlCoC34C43pIRxRtPZhHtjrI1JhWV6sc=;
 b=dfa42zi1qB7WAW/CxCFJzWQbAPa6/wA4W9FXK0mktL3w6S7gvw520IcH/wcyZIbbUS
 APx26mST6rc5kf4rz8D0jibuPuhmLghLmcwP346XhZyO0UWDjcD17VM7tZQt/Heo4eH8
 mUXjxqmxhctpfIT6tYrSF+QkwSYel9pXx82dk+YWMXvdks3fq/Xgd4hO3V0SdkEdjZTg
 KTOpD3LOqW9jokNTssN8TM/wbplMBMX7tltQwL2NyQGgjcjLdDnMOqQUYBE9Ryu/StEU
 KKi6WrKIlilGmp4QB0AcbLUAfkdmrbqUHsIMPKNm0dC5EQzmZB9C5Qw3twIXiVOy6vc/
 LM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772199375; x=1772804175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S4irztnqbbgQlCoC34C43pIRxRtPZhHtjrI1JhWV6sc=;
 b=gxQBP4q31WzLYGxNLTDuPkR5cH1PbuYoudvp1M5SoKxud61ZNNsaZ6Cnfu/ki3LK1+
 LtncI6EmO6sVtt0a31S25NNuWlU8qq/qNdyiKQrrAZ4u7sz/xzdish7EkaWc2mgbCH2a
 3VRCoAeJqHBX4XNILqvQlBv/QiQardR0UM1Jl+y8rUgUuOjJhwWaJ274+FQap/qlJ+/h
 nwtwc74fpq3mDbQ02hQQGwM07uV44XrL71oC6HDsJgCPVRzGsJjfi23vUDammQ2m8407
 BRsejtFMJNZCPnEyTBHPwKPc4CTxtFWha+BK4mtBabf6RjEUyNy1u55nzQ1gDXIR+PYU
 NLqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbVqIDKDn53QWWJJapsFManamwzezVLXArYXvYWJeqo4BWle5c9w9ggOxMCA8qnnpYziW/gajTBg==@nongnu.org
X-Gm-Message-State: AOJu0YwbPBaOhp5QrGiowt0MCEOijtNJoBfNmCQEagLrfaJCVDbFVki4
 IGBFwxFAci4I0vrxkaL+hSs35omCdkveiqmbu9JVA2Cldd3cIz2hXlek1qtkPrkoQjQ1zcr/3HZ
 0LKoOqEy/xQYNaea1gtib/Mcmhgln5jX94G5zLv6X9g==
X-Gm-Gg: ATEYQzxDtu3zX+BkjTSgshQbmuL3wMKLYIz0qPAub5wusQ3L2/dJM3FEz/xRra6zzfB
 xbK7cb2OzMqQNxqoFjv9orwMqrI0/p37yMmoerCklPB/3Z0dzZsteg2j8Qf+cceGk+RvILXQPCS
 yVD66U0BGl0zT8kBFtRUTOau9vr/G+HuzbkPeA8+73U8DFvzmra1bO4TxC9QirHqfYgMIxGZfSh
 ptis0aFD8GI0kh7g9a/STbbLacyn2A22MH6ChPnf9l6NcJQIh2QITGu5CJcIRg7hzdrDJCWB0g/
 4ZF0rDBbimkvKeWREHG6FWoJVfW4AsMI7WDqyICMlLJ5VQLAYXBPujr+I4fxKqkQA04=
X-Received: by 2002:a53:ac9c:0:b0:649:b851:4eb with SMTP id
 956f58d0204a3-64cc22100bdmr2606703d50.53.1772199374837; Fri, 27 Feb 2026
 05:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20260225034451.41338-1-philmd@linaro.org>
In-Reply-To: <20260225034451.41338-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Feb 2026 13:36:03 +0000
X-Gm-Features: AaiRm51VAa1zifQcOFsoVOEXynBvuazfWCEr_Te26Q1eijg12ZVJYwSm0I3Ahmo
Message-ID: <CAFEAcA-U5FdcNC-RQL1rkdPsVBWuk8-4B_JFtPMWS0eZid8L4g@mail.gmail.com>
Subject: Re: [PATCH] hw/cpu: Build a15mpcore.c once as common object
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 25 Feb 2026 at 03:44, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> a15mpcore.c doesn't need to include the target-specific 'kvm_arm.h'
> header, it only lacks the qemu_get_cpu() declaration which comes
> from 'hw/core/cpu.h'. Include the latter and build as common object.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>



Applied to target-arm.next, thanks (and now in master, looks like
I forgot to hit 'send' on this mail...).

-- PMM

