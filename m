Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp438998dyc;
        Thu, 3 Jul 2025 03:33:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkyXRxfpZ4p9PBD4UGL+IdfhqZth+qOHtVYzYfB0oG//aWVrMneoKQoOC8kXBaEvJhvA30bjQX1UuqlA==@linaro.org
X-Google-Smtp-Source: AGHT+IFBZkQ18kSsg8lXOpMLdXhdhiVeyDnG7Q71oZSK5UruH3GwqVssFOBHQU4NfSB6fzJn5Klm
X-Received: by 2002:a05:6214:2b8b:b0:700:c7f6:67cc with SMTP id 6a1803df08f44-702bc8c8930mr33306626d6.15.1751538817405;
        Thu, 03 Jul 2025 03:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751538817; cv=none;
        d=google.com; s=arc-20240605;
        b=NpOnjfsOgHtfX29BQ3OJ+LE6F48aylS/PYhWIC437PAACCzC7hhWTN/YwFR9DNS3ed
         cd42UlnJecbvOuQnKHiFTMj8LVPqbuWUxOKMR7M9SZFfyRU9zF5lfhAErIVttW+OhUjS
         Tq0ew45pzJ09RUia7JZAGdIVfAq7hCFfePzwghbaHyA07oeZpgTvcGjwYSzQAT5wpL+I
         9BdxfSysbh39SR4oHxlkxpGWyDWdIDUyxC1GT0TAr9B+OPGYiB1cn8moqBZDhw/aNRHu
         tQroMVOKwcbz+OSSVbB7vD6VuaKNi+EAG8A+nt4e4/zBGhDRQn+dGTvnYiGZf+7Kk1G6
         0OcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jJM8tLaU5xnHHK1n7aXPHkWtlPGa+f4/E1Z4BGUerHs=;
        fh=9bXn756rfFZnCaD0ZH6DpHRqMnJ+4HnvlCJkD5Kvf5o=;
        b=CZgSgc0WhQLLbKQ1dn5w9Ehz6Y9AdxOgEIL+vTz4viG9TSvt8CicL6u4oSWtDsrUYc
         LU9V5UY9VFJW6c8WqoFlbIYCUzcx1jzeJGPc9vwCGJ8engvOpnkcFnVus6V8duKRofzC
         Lg8p9bfAehaYrX4yFL+PF3O3mvQqh6M4tHgICVsoLHGWpt75IpQ7Ura1i0XSkO5VfZcb
         8sNYu9k9OpKZNTh6R2jrutj07TXxlKHq79G8atIHLUt5+Vxe+4B6mVsr+g8nhqz6eKnS
         bMX4G0iZb1AOKfG2chsofpY9EYILlVQ+RQbsTYgjtJurkFs4BaSZQyP7d02zsv57UDaM
         kKpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iZ1tcNm7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7736b3d1si170894966d6.316.2025.07.03.03.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:33:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iZ1tcNm7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXHG1-0000HJ-RV; Thu, 03 Jul 2025 06:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXHFz-0000G4-2Z
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:33:31 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXHFv-0008O5-HV
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:33:30 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-70a57a8ffc3so81396827b3.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751538806; x=1752143606; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jJM8tLaU5xnHHK1n7aXPHkWtlPGa+f4/E1Z4BGUerHs=;
 b=iZ1tcNm7EukfZG86s0pIvdkaMwZ4fcEZ9jwr/69w1aSEd35DkqhsqsOBXuE8STvfcr
 pdlmCv29M2QescUP9TRWiBppCsk3sUFGQ1R0vfgR4EuBW68bmuAxYteZO91vY8VHj769
 MFfSKeIUtuWuOSVBGHPeGD/zBJ2ljrT24BWa4dS2XF6JZxnORuY/aXRzWmSszY5QpC7w
 c5pp/ATc3G5a8jiwhQrsR1pBT/cv+DhLC6ldEFF1d0oLaxo+bVt9Mjt4xrWJ6yECyIg1
 nTnSUplzOCFu4QQkZFTq9Ew+5gZQ20MHXRaTgZBM3VAPwerJr/MvSxN3e5cxte3K83x8
 r2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538806; x=1752143606;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jJM8tLaU5xnHHK1n7aXPHkWtlPGa+f4/E1Z4BGUerHs=;
 b=VFWPWyp0rjY4TN3GTGPY5z3CQKHgHuLCkgIRf5kRpYLLREeiHidesd9wZqTvXqObTm
 Tz/VeNl+exL8T29VzKZ620SZT5ca/gcS4FON7k3m6o/BitEzHpUQml+I1bLxEy3GHgq7
 rHZXhx8eU7ja2EhOP5razaQl/AcAQSlSrnQzpCc1RlMc4hLF00z05By3JROCsx1+d51P
 Lh+zpdxvQgHx7Z22izaAdg0J2AOpl05Kraw1P2J+78M4lgqaxFkvTcUjmiPcgt5nNqvA
 0aBzN/b4whD42bxBsvtTIGHLW4zDYj/7VZf5ytf3owV1HawOCIKuIAp2P5CvWVBY9WR/
 Ri7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdKEg7WRBxnYIZtCdyVgr+UJnsdjeoU4sOUPJb+QrsGguuohB3B2E30a7ND8fjkpoKJ6JaDY8wdg==@nongnu.org
X-Gm-Message-State: AOJu0YyRf+QUN2xAgoWGNs9oeCJIipaDhMyTeDu+ucSfwZi+lw2gIrlc
 MPMfD6wq0xCVLiTfRQe9Vz5lXDfaR/ZdB+8FihQ74Jb35YU1uVEGYA5DQogdtGsaEd6ZjjGWGDF
 BAtwfE38SEetKp6i3aif+J6gczVipJbKv3HZwS19LSQ==
X-Gm-Gg: ASbGncvadc8t4ry2qvYdHsszVmwffW/2CEb4H3CmmBC2LfcDuJ0GH30ZV/HV6OkGzCb
 c2hEupjxnqGSaj2R3v53YfhW5z5u99STfn0sMS1VGe6MpbiVvW8JRbVdOD5QPbAhlrIR1bo9jro
 Hwtu4wUoIK9DOA+udP2EBPaWrUdKZQ02eSK7AfhN4HqJJd
X-Received: by 2002:a05:690c:f87:b0:70e:5eda:4940 with SMTP id
 00721157ae682-716590cb34dmr44031177b3.25.1751538806027; Thu, 03 Jul 2025
 03:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-60-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-60-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:33:14 +0100
X-Gm-Features: Ac12FXwVUooZ5XwGI_pdqxyAHUqbUHgfVGGxGfELI-6N6_BxAoaOMuQI3hYKxCs
Message-ID: <CAFEAcA-LePcpBVD_Wty5BFnn-kJMcwtdZbyXVjF9EOFwQuECHw@mail.gmail.com>
Subject: Re: [PATCH v3 59/97] target/arm: Implement SME2p1 Multiple Zero
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
X-TUID: WO5eQJGAjV0b

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c | 20 ++++++++++++++++++++
>  target/arm/tcg/sme.decode      | 23 +++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
