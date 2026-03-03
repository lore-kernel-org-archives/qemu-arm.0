Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5906EEC142A
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 10:59:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxNSy-0006Vg-SP; Tue, 03 Mar 2026 05:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNSy-0006VN-7W
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:59:04 -0500
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNSw-0007Nd-JO
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:59:03 -0500
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-64ad8435f46so5129528d50.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 02:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772535541; cv=none;
 d=google.com; s=arc-20240605;
 b=CAihQmmamuxXw4myzKAMb18uzhYhb+Fn0pGQ2qNdAKDtGROFWMXJMQHUywdBTMB9t2
 Lwlb4B9MOfEPnaJrSYREoF3oKTijW+Sd7s2FEpRHdyFYJbwOynH9I9FuNA/BHEsKDbGM
 XPRLZOeraugutgE7DOuWoO6jZs+3Big8q3fLH03Wn9CdBfMIg06o/cPlI6ssfRsTqaq3
 PQWCJsaCOQSDwHDZ7puQo3U6/ie9ZCfWGIy1sn4CQyGQfcf7M0jdL5jg4oMyGn8GC1pH
 nywN8vMlr3jivF8/wdW5UiPEg2Ake76qCG4180JUF8QaQancGhMNZGOjhbSEy1XLEDmP
 gAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OuOUtAA7u9Z398L/7FL7Ixn0YPCowf0iHHYo7fQ+/J4=;
 fh=YbJlNAjX5UbRUemX5bWfMpcpgNkkxAY9jZeM7c36a30=;
 b=YwR7ZaVtFpmE/XHCUqw4Rg0xTGSnblv73jpc1qAdawOth5ndPBcVnZHrXZ4HIHoCip
 lZKUfSHKqjGug+qCNA8dtQiJcXO62xg7kJtU95U5V+SpWaFzLEDVYltXFto52FHeoHyO
 B0hRaobxfh3Jf6Am7W0GT8zYdyFP6zJdwdAqHd57SnV+f1o+91pmC4kjPSkGJJA1bOBD
 ck65IsJtIUKj1QlFjXirEFRmwTwCmTnwG0tLyahxjaKde4mFyhpDRKKq+ZTyjzjfWucl
 ZKJtoN/8rC9Mvbo19c2hCVi5LnNl5An/RAFywb0u5juf0io7RhuiSHAvnITiz9JalWSY
 B5EQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772535541; x=1773140341; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OuOUtAA7u9Z398L/7FL7Ixn0YPCowf0iHHYo7fQ+/J4=;
 b=zRB+C+DXHCtoEXq2hzMkV35HpCZjKEs7K1heR5Yxhkzf/pbRVMpBBmZLq2e56Uc7Yj
 DCco4XlqceJGQQXLXxQ8oW4KviYtIF7tdsIuhZU0xyW+5zJKlb268aufnd604XIhjDJR
 pzLz371rhmDNtZaxXZfxe02e9rqycp8xPiCQtHSzkSbE5PrZc3rsMXIrF00kgbIOEMSQ
 mhKu/i7B9c06/ggTRemXnHiTvM3k202+CA16Wt04071gGaqE0VGprmu4L/CLRscgwlWH
 Q5aPnrkBfoCM0zHyuf8v16vIQW7OHA8F2RIMy9Lk3dGPoNnqBVD4AhnjcLcT0FB0oDDJ
 +Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772535541; x=1773140341;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OuOUtAA7u9Z398L/7FL7Ixn0YPCowf0iHHYo7fQ+/J4=;
 b=VZ4+itIZzT9ehSUDhHsfdT0nTyN/8gv6K0JSQuJIZSolS6C0Yuo3l/eo4GYdaoOWWh
 9JIyiJOtyWQkBJTl8ZovfwogrWXXJOPfXpsyVYg9U3JkGy9da/Jd/sHQaDD9HzwF3qoj
 RcOiHQ1nDMEeiuwG35RXsVRI7mqm9JoEzLFymW8pzFMhzz7J3dNWuCFpoCc1ncqxK6yQ
 gTZ4W7IE7JXVeP6JQ8gRsy7JPrnlrSaflEWfyck1LCgbh6PoGkb8Su4yjAGsj8z+ZiFh
 58ImRdHxA1nPp3CEIqme3b7cQ2XUbTcGn4wc3oCvTG4NFtUPhSAPHulan9SnL2nOTlTF
 Bs5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyRamkGN+v8HFQoSqpH2RV63XDS2pvQux2+M9hvpJHfY43/vflgRRRjtscVvP91gzM961nxMWhpg==@nongnu.org
X-Gm-Message-State: AOJu0YwvH9mfNoPpLryQbb0EK8gV3dhSFyl6FA7fZOPpwl2jZ4dEVukm
 toDcVxsSLiX2YPVrNzz+GHt+gU7m4hZ4KNORcPYvg6QHAWpSrhYQHe2B7DU9jOSE698jjJFYG9S
 OcK7VbVl9hCcdND8tKXdDkKwJs/FHAJzalislcvmkuQ==
X-Gm-Gg: ATEYQzx5ziS2cijf8RM4qM5cJzzFcrd1W817z4LTRixtCdueG30AJo96gFaKMgh3GjS
 hbqOB3kCXp5gCYHpHmJ2ZCyCUSeOOjPRMEEn0ACAwqK1ttnp/DCRBS1LetVkQOi4X+ycasSSC3A
 XIq7Y53dSQ1Weq4qZqzuQyCO66DB4I1qJCTp3VMNaM5LRHD7pJ1dW7UKjNb3N5QwNkXSq+3/4QD
 DryHEHD/fCC6jNo2U1vD1BRBttkb+pXI+wDMPMHskQnquPCWirRkxdGMBGwymWDfv7U2QZcY+YM
 fRLbwdLLAS2tyVk6SYLO709I/M7j7suxSGyc6ese5His4T5N6p9SsLEk2u2et5U2AV0=
X-Received: by 2002:a53:cf0d:0:b0:64a:ced1:4fa6 with SMTP id
 956f58d0204a3-64cc207eb33mr9746165d50.12.1772535541110; Tue, 03 Mar 2026
 02:59:01 -0800 (PST)
MIME-Version: 1.0
References: <20260226100232.500781-1-eric.auger@redhat.com>
 <20260226100232.500781-5-eric.auger@redhat.com>
In-Reply-To: <20260226100232.500781-5-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 10:58:49 +0000
X-Gm-Features: AaiRm529-MeTUVjWWwQ00t0xbktOtoPP-RRlvyU37tcYEBaikNvCcJ0bUKFq0Ng
Message-ID: <CAFEAcA8V6nAHaB89kjozmidtwXtD0v3qdYsfovaTwsuY9CW5Xw@mail.gmail.com>
Subject: Re: [PATCH 4/5] target/arm/machine: Trace cpreg names which do not
 match on migration
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Thu, 26 Feb 2026 at 10:02, Eric Auger <eric.auger@redhat.com> wrote:
>
> Whenever there is a mismatch between cpreg indexes in the incoming
> stream and cpregs exposed by the destination output the name of
> the register. We use a print_register_name() wrapper helper. At the
> moment we are only able to do a nice decoding of the index for
> KVM regs.
>
> Without this patch, the error would be:
> qemu-system-aarch64: load of migration failed: Operation not permitted:
> error while loading state for instance 0x0 of device 'cpu': post load
> hook failed for: cpu, version_id: 22, minimum_version: 22, ret: -1
> which is not helpful for the end user to understand the actual
> issue.
>
> This patch adds the actual information about the probme:
> qemu-system-aarch64: cpu_post_load: op0:3 op1:0 crn:2 crm:0 op2:3 in the
> incoming stream but unknown on the destination, fail migration

I think it would be helpful to be slightly more specific in
both these messages by saying "system register", so in this
example

qemu-system-aarch64: cpu_post_load: system register op0:3 op1:0 crn:2
crm:0 op2:3 in the
incoming stream but unknown on the destination: fail migration

and we should use ":" rather than "," at the end between
the error and the bit about what we're going to do.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

