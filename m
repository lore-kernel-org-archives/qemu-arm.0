Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D0FCAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 15:12:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1nd7-0000qS-FE; Thu, 25 Sep 2025 11:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1nd1-0000kx-LA
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 11:11:30 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1ncq-0007Ec-Pe
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 11:11:27 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-62f24b7be4fso2136644a12.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758813072; x=1759417872; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=045KJQYjq50AYx9Yrp9chejGioJucBwRLdCITMUH/qc=;
 b=bb8K/z95JPTzV+dpRYC2hgqS7prOr4EvKU93urzVJpMKw+yRVhyfym5aOmCqtd0IV7
 IFwuS09YrmKxwuURBYakCQH/3KgAFMfSigjvWWC4NGQzrN/LmPwPOyGgkQlwt/qP8uvs
 9FCKuJbBxpXp9+lgkzTFcovb87MG1oo4rJWJt37moU0M5BAdmCMktYp1/mNnmCJJNz7Q
 IN8bZ35iiTLTDljOeQvy6RM3QtnbJxoUw4TYljP75PX0x9N5o6JjTsBwKkhjAqrPpw5D
 ooU/gyu+4fO8An1MiyQxk0pIZmgA/7QsilpoEpTgCtXMoELN3kd2HYYzMkF4wgl+E6Hp
 V3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813072; x=1759417872;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=045KJQYjq50AYx9Yrp9chejGioJucBwRLdCITMUH/qc=;
 b=YO6RjDNxEUH0BsU9k7JjB/QhtvqB4L4FwvXL9r/fxxlARLIPTzkGsf9TSDDzMIrX5Q
 XlLg8Zt5yyvNsOZ5q13mvColhoeWB5zjzc+A89sJz3Uy3yaQFCgU0EpSLJOGpAXOLlQ1
 ZENDqo7xq5IIW4VXhAQ29ettsNdg0IstH1AGDNKMYLjIgsY2Nx3LPsivo4nxiv8fAagw
 ODwvJE0IU7N7DSvr7v29iJgGIQ4lHQiZu6K9O5qRx1I2RohvkVjH6n6LXov4VjsQx4Ep
 wwSL9ckY5/3EnVJ/EgMDvTOLwTwO/s6nW0xn3Uk/gSUuK4L9JQl7F3zvvqbknptxjNA4
 vnPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwo2ajI12mwI9FNzLvpsfIMCbqipzzmQgainshuf8t50YUSW+M6J/aoOQNIEwCTwVywDdWrwLFZQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy2ZvGUE5CwqCzc0+JjNesXO81Wd6ZlJ9YywFb3HQyfpn94vgWk
 j1Iuw76gKrKrWdNsPpg3YHTGTJ8VsmrxKLZnki9BiEWp8SBNYMFPDE0YaJooA4CXqb4Uc8oyUrS
 7pPq07sZNOubeiUFJkaMxoduo+6FWHP5DHuqzijw/XqomoDjQUEzr
X-Gm-Gg: ASbGncvZAcuoPmlJQ2xkZP5KypZST+WdE76hh+113cHyV3xR4E422KwmOZwMSZUj/24
 5nz85ftDNeV/On/RaT9NmOzHrSMMUG0serStzwkcKDokWzlEbiYzfJJWUiF6Xa0bE0a1uqEjNiF
 1e9StFbmAKhVhxdnqgkG3bvcNd0aeCls5wbsANXyxoy3JQ3n3xeKbUQ3J3ES5bfyM1JPBbTdbxr
 zgnQNDr
X-Google-Smtp-Source: AGHT+IE/ki19rsgHzUhzupvRYmR0VqzPEjIXE/PwSJbkgsK5lFn4njM7wrt8rZFhOAzx/6PWDX4r2HtOgSjnpU+IMkg=
X-Received: by 2002:a05:6402:4543:b0:632:df3d:7b04 with SMTP id
 4fb4d7f45d1cf-6349f9ef66dmr3046852a12.14.1758813072340; Thu, 25 Sep 2025
 08:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250916142238.664316-1-richard.henderson@linaro.org>
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 16:10:59 +0100
X-Gm-Features: AS18NWArSzPSl3izKBw1crn-WPaSvtrvmWQdV4mutpyNLFJ62dkZ6hOg-KgU1C0
Message-ID: <CAFEAcA8zeYKGj2eRZNOAUSbErVQ_aVFCcVsMg18+Guh5oUrp1g@mail.gmail.com>
Subject: Re: [PATCH v2 00/36] target/arm: Reorg VHE redirection
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 16 Sept 2025 at 15:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Prerequisite for FEAT_SYSREG128, split out of
>
>   20250827010453.4059782-1-richard.henderson@linaro.org
>   [RFC PATCH 00/61] target/arm: Implement FEAT_SYSREG128
>
> which also reorganizes how ARMCPRegInfo are allocated during registration.
>

Applied to target-arm.next (with a few minor tweaks as
noted in my replies). Thanks to Manos and Philippe
for doing the review here.

-- PMM

