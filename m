Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA54F31E44
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 15:51:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wArfT-0007DM-Df; Thu, 09 Apr 2026 11:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wArfH-00073k-BD
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 11:51:31 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wArfF-0000Oq-Ow
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 11:51:31 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-79ab3e26cceso10699667b3.3
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 08:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775749888; cv=none;
 d=google.com; s=arc-20240605;
 b=XOwzAmO5WOGsNHaWEAtUDEG/tz5U5bEtBZH0pdoQD5PMtcsFysC33s2P91gZB+p4mT
 01Eu7ZHcRlDQxqxjYIa5Ant20hWuFiXAFf+hSpwmk2epa3DADCCKIv4+mnzRvkWbPMo7
 XRzsRIhx8sblYXBou44IFq9q754y4FtuSHSi20FLFUIyWiDkPGINGzyXUTJJzNJKtWkc
 v20nCEJOsRMw5uE6wN3yk4Pz9vub3zwM6qMyUu4AeJKrYDqA+7HGIA2svzSdI8lnCtSJ
 vej5i1/fUlFzzyWBRu6/xxfU4u2KpmmRW3IWbr38e2AQPqOpu8Y3Bol/ftxyvytBFwbR
 JTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=c8TY27wWNlO+TidtfvNQahmpjcDAa/fwBc1qFWnBTIE=;
 fh=8/Pvz4R4IXZR52QpA4QRK3ywdUje/uNoD7bArfN80K8=;
 b=k62si376MGGYBoOqJ+hNNG8O9RTOvdrssEYUCeynbgF7g/otugH1XFsF+VSpw7C/b5
 U5oKVyvlsu8u+sGJZUurNYayqmgx2Pm3/Nc4nNhv0g5Au3qRqX2lKP73r9GY1rmsX3Kl
 zQWmULpTEF+l/xskXa9b4L+B0EeA07QAPweDDPgcNiJUoh63DyUjo+meXwVParbed4w5
 G8Ak3heXZtB9n9hP2oySpJjZO29NSgoJMUJoIkhf6N716TjvpR9TsOQ16+q+NTI7VZIw
 lAcc5a5vPktlENlnQJhSJqjbMtYxbaoaCkStkIO+LcGRAuh9ReTtqmk6PUnkTZmEG8jC
 AUBA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775749888; x=1776354688; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c8TY27wWNlO+TidtfvNQahmpjcDAa/fwBc1qFWnBTIE=;
 b=ntv3J2E360oa89d0rwP9VXWAJaNNSsQnLkTAFNIePQRQmH4AMg7zYavzhd+ZDjcrVQ
 7+NgUSiB1QRN9hHgDFR70vhrAbl0jS8aGn1vUaByLjwvcC5HqWWjH9m/3/7Ml35Aua9T
 atpyTHqFZUeZC5dSj0OgXad8G9gwIp/QDz28KuxZH+a+17qUq1OwP2nQ8t68THy1P6Hy
 tmcldlTNONkbQ6B+WtIx1q2OVWw5zYNJv9AvMTHNiP7RqS1wLDUfH6b8w4hZ7B9kM02P
 NDDOZHaIihfNjxMI/sAlVkWtPhniWG1n5wRlsknVfmwXnfBYruUENhqDMtg6I5lcnUbx
 1hLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775749888; x=1776354688;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8TY27wWNlO+TidtfvNQahmpjcDAa/fwBc1qFWnBTIE=;
 b=Cq9CvSEpXqOhgEgtb5sl1uID/oWJnQOQI/8phT5Q6mEut4c3Ikz4ajUqdo+1BYiuDa
 AZHsfXHFYmRN3hZ/edxL4G9Nrb2QiYBSivWw8SCEyxtJEcGlH+Oo+v+Jf0OEOPr020Yi
 IDIk5zQz992CCDtas3fJJHOWsXjdlbYfFjDrTzvO9LH1HvqTrV34veRM3CXllFSLpuHf
 hD3/h12sh8RwPVWWQ+fLoJ9Pj1o5lCTFGsZ2Ag8C8VQIbomEwXn9tr32no9H6OR9GTSk
 4vf+wCRELte+pIUwTKnRMzZlFHRQHfbJCQjbzKvzR31XpolSJwmord2cYbq9xBLAMWXu
 ZNdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxL694DoTmJUzlzZqunvemu9EjrA02XNfY9ajbyvAuMEM8AizkPWED2+cW/rY4+PB83tJ46WAbvQ==@nongnu.org
X-Gm-Message-State: AOJu0YxqGowaR0e8j7tuqIb3QOYAR6MXcvWX9/Wz7eScJgQLY/nJuPU7
 IpM02OXtRRrQdtt0aFIftJHEYPiD3VtPekc5kR25j68dYepcBs7rlWpT35sovd5UKQPpHv88rqb
 jnkOEsy5zaDvyJetawqq3kd6EPSujGnm6i0cRm1ZokQ==
X-Gm-Gg: AeBDievbluLUhTuhNZD8oCbdx8+ilRT+MPdvBDRzhmj2tTC1vAHB5ikp+N/IJeO07eJ
 IJmXpi5EBb2BlUfZ72JWZQNBgYiqNjL4dFgiMmpM/CRAoBY82JMQUbutoOEh8fXcVbH5gfBQoCv
 2lQV5oyyo85tzUrV4kh4VH+xJXiw4CF3AmBEetJEHFvW+EydgjGjxKwpmqFxwXkPPd9cM1P35/7
 Zkrp+Rbi/6u/bKvpf+CTaDug2QnP5jS9S6rquSIY/1Yv9J8ZOob6hccVXHSOAI9Jtn5K2Pt8NCe
 0/RrqWELNra6q/8G0m713ela73zUQJOHwekICKFCX0f+L3Ue0xA0c/U1zz2zTD9c75LVJF51fqc
 YQQ==
X-Received: by 2002:a05:690e:43cb:b0:650:1485:26c6 with SMTP id
 956f58d0204a3-650486ef810mr17821202d50.19.1775749888378; Thu, 09 Apr 2026
 08:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Apr 2026 16:51:17 +0100
X-Gm-Features: AQROBzBjfZ-OKubnGZzZsOsd0PaLIW362ws-YqKyzOItkm-WBeLFuU9c-iQaGh0
Message-ID: <CAFEAcA9rQez-BFVhpDBjFKZjKNXtCuK8ikPWRryN1Xed-MZ6=A@mail.gmail.com>
Subject: Re: [PATCH v11 00/21] target/arm: single-binary
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, jim.macarthur@linaro.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Tue, 7 Apr 2026 at 23:22, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> This series tackles (most of) the rest of target/arm, especially tcg folder.
>
> We extract tcg memory operation in a new header, with a new type representing
> virtual addresses.
>
> Initially, I went down the way to have a dynamic definition of TCGv, which
> required much more boilerplate and runtime checks. After discussing with
> Richard, I realized it was not needed, and that could simply split 32 and 64 bit
> properly in different files instead. This approach will not work with other
> architectures, requiring something else, but it's enough for target/arm.
>
> Files left are:
> - target/arm/tcg/mve_helper.c
> - target/arm/tcg/m_helper.c
> - target/arm/tcg/cpu32.c
>
> v11
> ---
>
> - update comments

It looks like this is all fully reviewed, so I've applied it
to what will become my target-arm queue once 11.1 reopens
for development.

thanks
-- PMM

