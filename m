Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp1857685njj;
        Thu, 31 Oct 2024 10:41:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMa5QRB+1lVToN/m0u0zyOTrzcojNl4b74lG0lSNj9JGokbwRk+XPhvezyUNRKOTqZSkSfIiEs9pt6Mw==@linaro.org
X-Google-Smtp-Source: AGHT+IHF4vkUNYKnidqtNj918o+TacSPFpJknupF3lMCYW0cSMexI73ihgwfP0XspFgyjW+7xXf0
X-Received: by 2002:a05:6808:3309:b0:3e6:3a82:f788 with SMTP id 5614622812f47-3e758b54913mr707971b6e.0.1730396471207;
        Thu, 31 Oct 2024 10:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730396471; cv=none;
        d=google.com; s=arc-20240605;
        b=Mdb21LLyG9YkYdaSXf5UuukPz+G2BIaPgYeHotPtSHM1UDA0gpi59fig8ZIa2nZCUC
         EcSptqxNPMGGZL/ckuLzoz9j+kxyy8/x3Su0cMzo0Z8E4HSdl37YNpLLj7hhTE8LRJUQ
         iO22jKqh1pT7QbjEdxhSJ7mrkYTAO6280hlQJOYW9e781tkrOH/DAKxcRnWsu/IfOehc
         ofQsLd/EWWpTWV/ZHftQZl3grz7/i4VCGv5VJskXU1zB7GmZV89AZZ5Jlk6iobhWC/Kk
         IRKxm8P+cfUSDvWWa1T1uDqFzN92YggeyWt59OUyZlwuUt7czO3YeFhge5gK42tGnDco
         ilsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=z6y3FOO8OcqNeygX9RAKdp+RqY8wKyvhx/vH9nFmekM=;
        fh=Qn1H9FvNn+TGcEV1NfzUGeRpdQw7Bepr5J1ThRVgzGw=;
        b=i95BH+vCPwXNzaLrnXMvr+vushsilKq55kdhdL4TD1JokuuohDsKFOXeZW8m7yWhdL
         nqUNrfPynPA1K8GPXP/Ga390leFUAxUxvbbGDaTdvd2MdeN8Mdih7xAt5XUoOjzaPi28
         jzAlW+SZ64iHSWR5FpxOrRMOLsegLBVfW8n7iVVmP2S93hp9smz3HoQCPG4lbQrGXjOy
         gYuchoWZZga5Lb1ilR86nfuzMSBRcBWbqi5M5WpswbwkF2YHLS80+L3RGxjXcH1VpgGf
         TDVia+m3Z51Q96ivVmjjfTe+n/OZKuQM6ezsIzCsDlvu5jyeUWVNdHQoAdtrVXzUKwf9
         wWkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KmC/6psY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d353fa93d6si24649946d6.119.2024.10.31.10.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2024 10:41:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KmC/6psY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t6Z9v-0004iA-Uq; Thu, 31 Oct 2024 13:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6Z9r-0004he-Hw
 for qemu-devel@nongnu.org; Thu, 31 Oct 2024 13:40:31 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6Z9p-0005Xz-MX
 for qemu-devel@nongnu.org; Thu, 31 Oct 2024 13:40:31 -0400
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2fb5014e2daso11008791fa.0
 for <qemu-devel@nongnu.org>; Thu, 31 Oct 2024 10:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730396427; x=1731001227; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z6y3FOO8OcqNeygX9RAKdp+RqY8wKyvhx/vH9nFmekM=;
 b=KmC/6psYSU5FsOCbU5NcNfN8E6HO4KCQUp3fZcU0vSdlGyhDzBkkzTZ7zNs9IRkR8j
 pBc8PflAMpQy9AesVptCXJdKrGX1yMPxWzaBcowl1fLZBoAzRlAwDH8kknvPN922rovn
 Ms5xAcPbf9fA2aYC6AvJVy43Wpp0/dG/yXRQ1kzRZcD/fU7gj1mzTTHcV1m4yPIWyads
 2KXY/I8YJXrAWQWJovEN0pkb2OYZsA5sQhBRPIQJaiF2pCm2/ZNJ36Dl3EdtW7bMr8eb
 fbjiZDAFrGqWUA0LmihXUVRFqNvoLRC3RB1qACStcUxbvtcle8ouW1W4fvYEV0llf2Yx
 6ZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730396427; x=1731001227;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z6y3FOO8OcqNeygX9RAKdp+RqY8wKyvhx/vH9nFmekM=;
 b=aL2NenDGg9FHL7hWV8D8ChrCTaIo8sZLeDexLWFOEGZqC0oqVDwlZ/zNRrK16AWyrk
 0LGHESiH35bWjXFUA9DM9psN7HN7XJTYZcKVQwk3tu9ee6GMunFQpg9nNXPSjQcKnhkK
 uh8ODbifKHpzAMSnLL4RCxSSiXJd2nvY9vgFnDHfXU0LI6m/oJXCsmfp+dq9vRhtEkmS
 7kko1RhuQ9op+8PLR6PT+/DWY3Ufmp02cagl7DXh1o5G56hJQEQgD4LgYOIFlR1gIE3C
 /cLfUMrbYNzw6omUvmEe9E66X0NftsBz+0WcwYNWto/x5C6haTs/4AvdAriSgHxllsKr
 HqEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7msep0khMaYt7nBgl3+hS6nU+A9fYgwCKvy5pKBh2U2fEMYlrh9xxVaa3sQDCzJrrE3b+5a7Cpjog@nongnu.org
X-Gm-Message-State: AOJu0YwKzyeI+iwsIlVWC8TrAoRo+tBCAYPm9IK/YtX9FucsvDDIaDnF
 Mha+PDE353g2N5Brm48agWIpX03fQidExYy5XV/8ey8t+qWbNMEIonUZbH6zmd3pkFfADVqHUQF
 O17jhNUK5ReHLXiA0z8br9ZLrJJ5hTY9mFSYKRw==
X-Received: by 2002:a2e:9fc2:0:b0:2fb:4ca9:8f4 with SMTP id
 38308e7fff4ca-2fedb796712mr4958311fa.23.1730396427399; Thu, 31 Oct 2024
 10:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
 <20241029151048.1047247-4-peter.maydell@linaro.org>
 <95086c66-9e1c-4013-86d6-373d68d55441@tls.msk.ru>
 <CAFEAcA_xoSkhk-dGUXw3-0hQyb1NF+6qRP-+6TpoQkFPOBs8Jg@mail.gmail.com>
 <1a18a816-ba21-4838-a9c0-fb8362ee5e17@tls.msk.ru>
In-Reply-To: <1a18a816-ba21-4838-a9c0-fb8362ee5e17@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Oct 2024 17:40:16 +0000
Message-ID: <CAFEAcA8YC82WdP_cesZVM_Luf3WBdQH8dpJHrRThE-DLzaAqng@mail.gmail.com>
Subject: Re: [PULL 03/18] target/arm: Store FPSR cumulative exception bits in
 env->vfp.fpsr
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22a.google.com
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
X-TUID: 66jTKzho/oQI

On Thu, 31 Oct 2024 at 17:31, Michael Tokarev <mjt@tls.msk.ru> wrote:
> What I see is that the whole thing - plus one more commit right
> before the mentioned refactoring, ea8618382aba, "target/arm: Correct
> comments about M-profile FPSCR" - applies cleanly to 9.0 and 8.2.
> For 7.2 though, this is definitely too much because there, tcg code
> has different rules for the temps, - in particular, it frees all
> temps explicitly, so new code wont fit there anyway, resulting in
> leaks and requiring major re-review.
>
> Being niche, I'd not bother with that even in 8.2, but the fact
> this refactoring applies nicely.. :)
>
> It's probably the first time when the difference between many
> changes but tested in master, vs smaller possible change, is quite
> significant.  I prefer for it to just work ;))
>
> 8.2 is in ubuntu noble (LTS), so it might be with us a bit longer
> than some other series, but in ubuntu they build with KVM support,
> so the bug isn't there.

Note that the bug is not in "TCG + KVM" or "TCG only"
configs, but specifically "KVM without TCG" (i.e
you configured with '--disable-tcg' on an aarch64 host).

-- PMM
