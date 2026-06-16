Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61394CD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 13:43:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZU4j-00017W-6B; Tue, 16 Jun 2026 09:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZU4h-00016E-L5
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:43:31 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZU4g-0002uY-8j
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:43:31 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-662b95934dcso712939d50.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 06:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781617409; cv=none;
 d=google.com; s=arc-20240605;
 b=DXkP3K3i8bNYdciCou3tZg0PDVLWXkGPiLCgqmcIo+7QKDHzi5WfeJHWcbQ2+OKMxn
 AifV/855hUvuBKNzDD1l4UwIClfupVs3YrZc6fUr9CWs/aw7KfYuccE3PXFTfF3no8JJ
 3lOZSIsUdRqAWI6sv+hdMeBpnHNbMJsiaa9dRbHM715VjzapKlrxEs1JCGAzqStyUh0W
 WRZ+gu7eoKnZmtAgc9cDwVJsjJMZ35z08M1mFctv04bwDgg2rqMeBxddJYfkUtQBd11u
 bTAhfC8RIuw/Lcn7/RQAUipAqMFRq1yoMzZk+aj4OjHXx5E7fTq0bNiv7dO0wprjnh3N
 JTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rFx0EQzEcHO811YSsAQIZMlh7Pfymft/YImwBbwytGc=;
 fh=5lCE0OiQyRxRXdw6zwgp8tXH3fneSaYBRhu04ECPKNQ=;
 b=kHFKephiIW7SBdL8a/FpmV4CnMkBOMXIkDOK8/fZ3UTe3FMz7EHRrBuGvQxKnsOXo7
 sgqoSnWHsckMsuya+nafKBhh/AqpSMBm5Ftyas8I64+ecUoyX4sAIeNyDVzUSpruofun
 vMFXzJz5qPjN1WEtUwnWbCjS0y4zK0LP2uHN83qxOUCsWNMX+v8aW43OHGYQ+nv5T4BQ
 kc++GGMSFu51TVz1MFU5hXYJYJ3+DG3dOG4AHVlprbkhREnDPFpjTGBxD5Kroon5S4sX
 xWB+WNDwIqUW9EFOs686yD0HCPL13EWW1EAmHpSFzldpwx0dCcXd1KiQNKjDnH0JNwxh
 x3vw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781617409; x=1782222209; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rFx0EQzEcHO811YSsAQIZMlh7Pfymft/YImwBbwytGc=;
 b=hddOmwUFbTT1gtvjuTUSPWOP2eKuWBwOlB2HhqH6q6L/8zV9eXbUIU2ncTFYPtxHSm
 3A60og2zZFzm6D7ZuxvuUjFtHWXt+IlOvQMxkj5imyIAiIdozD201jH8G4m+q7+lwhW4
 BRYjDw4ZkuS5iENldt5+W6ry8BpmhZ+qsrMhSTkfV0e7pZa6pQFtAAZ4MpeIwhePPSay
 lVeXnIaICckw9aEVgGc17iFmCLi0lexoHcSe3IFpkB3p1Mb1elIIS7NAoU0TqaUWQgEi
 k4LFFd8d+NOVk0DD6NvxwmOC2aZ7lQEMLXvuhAb4Bjr8TFVl88DuFE1T65wBjN8wOlmd
 J8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781617409; x=1782222209;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFx0EQzEcHO811YSsAQIZMlh7Pfymft/YImwBbwytGc=;
 b=Sc03k6Jfb+Dzn3mnQQan3sUOdqcr6ey9WqchAW7PtOEQGNU5Pw9jBm44fQImftmOgR
 Wf2zr/6YkIm5IZysoYS5C71oLMwFfwfb4XQvcp3L0grDKoyxmmw2DvBsj/lpR/pFsdig
 vY52ZuKInj/rs/uxPTnZ1ON5h4/4joLjZ5sCm0gfUEE57USsNOFZ/hjs22Na4s/NQcLB
 AiXMzUdiVeoAOb+OsRqs5IIV2RpK5qA6Kbabf4ZruYyXkzOvv2tXMw4z+jjsbIaoq5nw
 TnWZfMs9XROcmkyoEp6o6m3AIjlyKGYSZR3CjgidO0xuPiNr0cdRdDp1FqxsfGsIcJsg
 buwg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8h7ZBqiIh+vJHggjKN5vvm2cYWcCcffKy3jjWUUjajHYEhU0G/DwM9qB1IbLSs18WGukCCPJFfGA==@nongnu.org
X-Gm-Message-State: AOJu0YxftlvR1ABU5SNrZAkkmNqwbGgdHcgS3M4wJPodw+4fqPEijZi/
 cEsTY0YHWFVDr3rAjskWOvcNh5YO/jVbWTLH3QZFapZNkvCIUryE1GXgUYUCn2GGC8Upn/25aqj
 McLQ8vrE3PMK5fIcYX7l3zyOmQvMuznWjeez811rl7g==
X-Gm-Gg: Acq92OH4vTOlgtrcVxXhdgWEbIHNt/ldERozkRCOWsWV4Za2tHjtnqybpDbQ91dAoNF
 X2k7DkCHNB7u3ETysiKNIgVnulBYf1vSrUaAmn9zBU7Sbym5UJX1IE/Mqxg4eWOEe+k9ocIlRW/
 cEWgLcVYrpcYxrUplS+iCfMHrTRi0e1CP894pl1C1pe1L5D9KO1GNHCSsiUI6NbKsmgAy85Mfyh
 +WOMM0R4gnCqsa9aUr/MupT/vZN4MHei0erbgn9IjEazTrY5u2w9WLMjMiikK49e+AHsbFJtTFg
 uchNpURD9kJegWUDGEcXxlgjr+ox5zkex/ayfDuWvtvCAdWMK7Xo440KKuCNO2rRb/I=
X-Received: by 2002:a05:690e:e89:b0:65e:1d95:29cd with SMTP id
 956f58d0204a3-662782d4ed5mr16406881d50.40.1781617408870; Tue, 16 Jun 2026
 06:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-24-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 14:43:16 +0100
X-Gm-Features: AVVi8CfWAkgaeP3TjuE937BV1pQiu8H52TgM5b0U_LOfA_D46dmutV0RS98U4T4
Message-ID: <CAFEAcA9zRtLb_judmNjvXSq_ZgASNyQZJMGmhcgaQ+p2RkcKKw@mail.gmail.com>
Subject: Re: [PATCH 23/25] target/arm: Enable FEAT_SVE2p2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Fri, 5 Jun 2026 at 00:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 1 +
>  target/arm/tcg/cpu64.c        | 2 +-
>  docs/system/arm/emulation.rst | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)

This is fine as a patch, so
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but maybe we should hold off on enabling SVE2p2 for "max"
until we have SME2p2 ? Architecturally if you have SVE2p2
and SME then you're supposed to also have SME2p2.
I know we usually don't worry about that kind of "feature X
implies feature Y" when adding a new feature, trusting the
guest to check separately for X and Y being present, but
I feel like SVE/SME versions are particularly likely to be
something guest software might make assumptions about here.

thanks
-- PMM

