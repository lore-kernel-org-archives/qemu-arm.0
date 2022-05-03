Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1527030lfj;
        Tue, 3 May 2022 09:23:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqSYTj8LrBJsO64pXHBh+Qd9OegTCg66/N3weoWUXR45FgUhVH9G+6to0Z0UnfIxEFzZvc
X-Received: by 2002:a37:a7ce:0:b0:69f:bcc4:eb17 with SMTP id q197-20020a37a7ce000000b0069fbcc4eb17mr12796964qke.439.1651595036187;
        Tue, 03 May 2022 09:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651595036; cv=none;
        d=google.com; s=arc-20160816;
        b=oT9xPv37hiVkZo6z8IXsjHwbFKWN5NQ6LyDzPBOVWlyisrf91YGZPevYS5r8LQ8GkC
         Qs9TRewdMIq+MovEMDOFGnVE7ZCW7Azbif06MJJvNsv2PXRN5jn/jK8PKqm8ysKUEdYw
         KI66DfD2S3To6dazUddAUdsh1jXe1QclD60o/5BK+hZjb6Y28rMRKOO84r243avd/B4e
         3lgL6kDY3qncDafbv2aeLtPvvl9E4mcWvDvzAAZrvkiJFyZWm48en/UPceDlh9yWePMW
         kMEmMo0WJYiMCuWoGO+5VAn/1jcLirGKw885Fqnvc04P76JqNowWWgNL96Jc6uetsw/3
         djzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0rVwcEFg7a2VnJnWKRRVObbsy+REu8LqtiRDqYZ66yo=;
        b=yTI+zhTLBmT7m9NXzWNra68NP7YgEVDMhVDbXxOPVlPgH9iKqb8c5vf4JUj4oAgzks
         YwyGTmgJgFT2QtMSZp5jGBat2jpqBo3sNT7ScCLE7Z/zpgrJb6Bx1F8tNum4/0fGBaZF
         kqefRcUxQYghZf/NklVmkuOJJc5IZNVcajL3p7MjvO5ga7ErwaFyd+cV4FNULvuRoPJd
         ufVKSVsn65G0jdE01Hwue3c2AQs7Q8ruOsK3mvt13iEFp6y2EAhV6L4KzztmwJ+fJoPp
         CM6q8BSTiNOAeds9RYGs3+0iyZJu2akfD9OoN0ZK5EjfRMBU0r1cOYWwlFzauPjCJA1T
         YKew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zIg91eXe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a05620a244400b0069fba2135f2si5673019qkn.690.2022.05.03.09.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zIg91eXe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlvJb-0007uI-Mq
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvIN-000674-RX
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:22:41 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:46361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvIM-0007GR-CH
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:22:39 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2f7d19cac0bso185144477b3.13
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0rVwcEFg7a2VnJnWKRRVObbsy+REu8LqtiRDqYZ66yo=;
 b=zIg91eXeJdei3cyn9R21r6bY/YXvVqBN92Z2W/wGD0kTXIuSQ8p+yq49LgC8n+BuU0
 t2eibbp4MndhWj/lPPJYLen6bbiSfH9GoXQ3RuVoI8w4eFZq2FMLgxMtrvCjSjRazh0P
 KNfP/JJMwx52X13Vre5i1+dJmGaiNOIEcBXhOUYJhDJFLxnbZhXQqk7SjxfGd7y3WX5f
 D3YSAWIbO1UUFFGKuUXMEUERuWowJ1SFu8Uk3X8t9lPenl1ItsuMy24CRYFX5YhpF7Vu
 xijeXrKvRJKD9kcKwYWtoQFSZLM4cEpgeavUZ9ge7HPnPfa51agIu8PEFE0GWAQkC6GY
 UfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0rVwcEFg7a2VnJnWKRRVObbsy+REu8LqtiRDqYZ66yo=;
 b=2H3FsyI9g2kfcJEeutm/y/IDl4iNEnOqa9p6uhWVHfzkzo/yeKhOxA78esHjrQAJvc
 OsuHRzU16rFEwF8QB0spg0NxiAU4PW1g+CmS0cKc1uSPYVyv99vWAvIc31xjzbmV/g7I
 4X7Y2pBxrZUV1HDEMNtWFgnrE3eHwsPSzWPEgK5SnnoXwCLZZM1jGL4aEOH/yeN8DowX
 CHOvbkReM4o7euxvBE8cqT8UAjFFWzekOxsazpk14Cc+Vt2cSH6hkbx185tUcQZrDDSw
 8yXpe7ty/jWIcOiHrWbhRq5yMTzOXFd7EFYUL9MBCOg8qP/2AYJQCRAgx9DsQhfHArIH
 N8AA==
X-Gm-Message-State: AOAM530IdeDuBBVCVzgKgmUTC9Vm+5F3jqTbCl88oswp/1Fsn2pKuWk6
 MFjdRJDmXkc+gcqY4XV8b6OnTRC4lL8VI9/e6BH5cw==
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr15882842ywj.329.1651594957317; Tue, 03
 May 2022 09:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-19-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:22:26 +0100
Message-ID: <CAFEAcA_C_ayXjAJmz+YZ1A3Sg2rV972kO_6NRNajBVNh_C2a=g@mail.gmail.com>
Subject: Re: [PATCH v4 18/45] target/arm: Reformat comments in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
X-TUID: KrHKVSWsiIUP

On Sun, 1 May 2022 at 07:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Put the block comments into the current coding style.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
