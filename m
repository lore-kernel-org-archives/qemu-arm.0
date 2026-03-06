Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3235F01832
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 13:10:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyUwA-0002vD-TH; Fri, 06 Mar 2026 08:09:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyUw7-0002un-SG
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 08:09:47 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyUw6-0000gX-5I
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 08:09:47 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64ad46a44easo8144115d50.0
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 05:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772802585; cv=none;
 d=google.com; s=arc-20240605;
 b=BgQyMsWpn9MY8TGl1rm/EcpDQf5Fkqo2qbIxXjE6qRleQcR3rHNFaWufrkL2oP2OWV
 A3x98xHojgpc/ZUXS0YPDI+eYT5QNi3BtTTJJUEDtTEWT+I8W0EkFPaQcmBq5g7GZ0M/
 b3CcoaSaseFB2hNW4QmAmDZmdBS3gZDjcdJae2cdmj+M6xLr9vlHD/EO9HYLhKoC2EH7
 FnEGXcfOBOugexLCCWulSrxyi146L9SkNa1Kh9t1547kDb2QISxlbrTzstwPqll7nvPX
 BbFYO7p/jSbAu3Nco9d1Hp/HWHwn16MIp+YV/UPjoOEfTUXve30lgmZj1T2G+PXsDiZC
 80Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Swf1K3gZWqxMPuwFx8GjZ1bCIultsIOQVBWJg7tJVms=;
 fh=F2znR2JgTxgwQAfCkf9SBUb1QPalOk9r+RyFr6s3Mng=;
 b=JC+MOZkCSEcOjHQEOXz0vHs2feRy7oUxlkR2dfBYJgPthLxuOtb9bsbTipNCaP0Vok
 ve/VVTsTM3DZMv18uVzX0dj+FgHDhO3+spYfQ49vHVQkeNe1aMOH/nDjnjbCiDGB2UA7
 GQpH2qOr78kuGFO8h62tedlABiggGKJTJT40G4nvMNRJGXJLZgXpQJ24ZkxAdPpOey0T
 0vhX9Hw+/llbiFn1X8I3wJLjI3us2QkPgoSVLhRYWqwftNGZHKQCMgqTv4JgnAA4pk1z
 hASyvhWpQbkBqQAqSVSZUcf9I6sCyvALSR1E2a6AdwKSGempjxrubNwGgNWM0KA3/bjU
 p9rQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772802585; x=1773407385; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Swf1K3gZWqxMPuwFx8GjZ1bCIultsIOQVBWJg7tJVms=;
 b=RSKhnrGVeuWMinQ5hy+/9qnbz24/HjoRJQ5davb/Z1BaUDqrdxkkRp/IG+GX0BXuU9
 Nehk7DdDcmiZqGUGEkZ3Bq8FZj5bUvTGnleoOFVyDYEYGIEk3UVUZHr0hTjJSQWCHnbp
 YYCldyNy95X6rE2zhuJtxDLLW/p19XIP7anQAFToXDPlsJKoyTHGz6hyVLmU19U9UBEF
 ulC3eVYtiqk2huyW9QyFeTQ4FFJNwMumKPrzxnkQbB07cE8gCvdMqCk3o6qXDzbpP6xC
 84wYEzWjCzjTzqtM7VEc7PUnQrHCx/P16G0TfW/pMRkQtsEGd844w7yvsj+ZK0cFWqg7
 rerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772802585; x=1773407385;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Swf1K3gZWqxMPuwFx8GjZ1bCIultsIOQVBWJg7tJVms=;
 b=DuuaefLOY+zm1/rhhRb1Px3imvtTXxzpgurcsldCk2JheLIiql75sa85jRYBJQI/Om
 bcqLMo0kUChLSpFAbQNGMuzuQqFbWAqLPl4aVL161EzwTDjKPJA93RB4PXH+jOuvmWSH
 pshHcnwPsY2AJGIPGhK/KLQYLI+T5STInDGMhFrSg0G8dwdN7rVTxJvPNkzMbTggTnNC
 whj7J5R0FlQTeLoYa9e1yCEXJVXUT5LX5r1cCWtGlfwQDiruEKqqh9xW3D8MYjStr7KO
 q9vYpSCmOuYiy7/Uqb1ad/mKbZ8Ris5DESRChoKLyZPYxXzuokwMzu4Lpl3z8G6iaikE
 eF0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfWuH0wFSB0oLShOijLyhkJk7upr+K1FJBuwniik7woWkrd7Ec1YajwLljVFWL7IRi7zspLjpdKw==@nongnu.org
X-Gm-Message-State: AOJu0YzHvU6k9d6wRxORVXF7wAauEFHHsp4wOpfPWYsCzCGskWVb83Of
 2Y7iCQvFAZTk1lfIK4ysxLuTTGFE0LGTtml9eEQW5QtK3M6WzBNl1mM5Q8WP+kukkn3bu5CQ4hg
 wM8+i/Vhxcp9xS8/OJXbDwZHJmjuVxDQKtlXk87xDSQ==
X-Gm-Gg: ATEYQzx4uYmY4YyJ+zh8RV1k5qP/FNcPMqbGrHlnP/BpdlnVWb1mLkUpOFCg0rhbUYb
 knii93db7JZOewtyap74YfoFPXjyXFE4e2FbWkja9XFuDea9oQ9hljE+GZdedu0HQIUdAZC+TbV
 agE3CfInkwTcynrQf0W/mSM+lQ11rKUvvtvihrHapSKVCnDQkLOI/iwAMvTrGoc7RYf7SmsR4iw
 ib4ngnnzG23it6g2ekwMkVUVpaHo4ybgbI1xQDCwSQgk7g2HRovm5l/Y075CiD4WSceACo4GBsT
 mN709jVjp6cPq1HBvVr8fpVR7DQIEg8sRUATxLIRr5vbgDqkW/SZkl0DSoU5Ab+syKM=
X-Received: by 2002:a53:b44a:0:b0:64c:c267:7f82 with SMTP id
 956f58d0204a3-64d14279a74mr1398364d50.48.1772802584764; Fri, 06 Mar 2026
 05:09:44 -0800 (PST)
MIME-Version: 1.0
References: <20260306-sme2-hvf-v7-0-e72eeda41ed3@linaro.org>
In-Reply-To: <20260306-sme2-hvf-v7-0-e72eeda41ed3@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 13:09:33 +0000
X-Gm-Features: AaiRm52fzqlmbRbXO6JlHmq9ubx2lGn2wCk2wvvNTZ_cAmQGSZgd-t4nYNjl6WA
Message-ID: <CAFEAcA_V3FeSrhWdeegs6XoO-VQXH0Y-A_X9ChcRDR9ZYUjiSw@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] arm/hvf: Add SME2 support
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Fri, 6 Mar 2026 at 12:45, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> M4/M5 Macs support SME2, and HVF exposes this functionality in its
> public API.
>
> Add support for it in QEMU.
>
> This was tested by running an SME2 benchmark from Arm [0]. savevm and
> loadvm during the benchmark's run were used to verify migration works.
>
> [0]:
> https://learn.arm.com/learning-paths/cross-platform/multiplying-matrices-with-sme2/1-get-started/
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Thanks for the respin -- applied to target-arm.next.

-- PMM

