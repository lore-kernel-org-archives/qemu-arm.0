Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D487CC9833F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 12:19:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBAJs-00007v-VW; Mon, 28 Sep 2026 08:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBAJQ-0008Rn-Ma
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:18:30 -0400
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBAJM-0007PJ-9L
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:18:26 -0400
Received: by mail-yx2-x0e.google.com with SMTP id
 956f58d0204a3-672f90fc533so2681832d50.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 05:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597902; cv=none;
 d=google.com; s=arc-20260327;
 b=Wiqpma0UZzLMx62dNqQg54VbNlVb19VjjhJdz4MFVFAs2RCtiJ1okTy3k4MTUKYQlu
 2gj5ZS2GzaR9lJm4XWel5j81c1S4h9lVACa9MmMBZgYhV0I4VFG2sF5vkFjCbtWHkKzm
 xAru1jBPgj4cpNWNpRYxqS5B8WwlFH66CfgkP6/7BLEEe7EhO3BmFlA71U6raG6xn7GX
 inI9Ijrf2QVntr6WabWxEPAsgiFPipm+2D+XYMoilTI+QbaYE8crGnwyVKkcqIMSZvta
 MWnc/u5yn0S/nctgeAXxO1m9HCjBRoyAXW2mWyGA+LNjk/fb7jqI26by0eNAdTp+58rV
 n/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tyhR6K8kv2DiaBgjFE5j6JP51JNzMA3q085iJsPNf8s=;
 fh=UKXd/hKAJ08rj29/DDF/b3G9KXvfsPpFHT9bpRNwACU=;
 b=Ri2Ofn0RCkskzLTXYGRTFHPUDeiR75ezfMfPG2zAeNqAKo5s+CL7ipXDLh09yuiZjR
 h0osUC1N+jm2ec+IYZ5uO57etupx7sWX04O+uK5Bt8h+Uqp9cxXoOUgIEcWBJvsU2qGi
 h9y8+p/kcE5vAwYVS6VF/Rtm9jmr0KY63x5N2JnTjnmZDi8sT2462zUl035kekN1Rt8v
 m5MfADmA1FOtgK8G9anxmOjV6yB++eDkg5KknbG8RX8syOYWkC/ufRL2f+Nk9l73AKyZ
 TqMu6bJR0amH94pAuTnTmK0Lcc/9DmvatSKtF+H/akLyxHep12dh7eMiLeZJr4rlnPdi
 AFog==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790597902; x=1791202702; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=tyhR6K8kv2DiaBgjFE5j6JP51JNzMA3q085iJsPNf8s=;
 b=pD98JnWO4cP29tAnDj5txLVFwmZHXI/QKQsNQUV4w0cRhZmfu2D22SLoySuWWzouf8
 9c3bN+M3e75TvDVBO1zrYcVzeSWupnk/QudfiTBRpwUbMPP5VxoL4hkZdiruy5LHiB9Q
 SdkuxL+RtbogmV57aYsRA4++8b3NeSYPifXWjBFCSh9h6ndXRHO+054xkD3mekFBrUOy
 w3K7dHYbKZHgA84k9R7PH8nu3goRpOpH7cS3Zlam+220MM3yvoy8Bi++dZyYq8NH61hd
 iO1B9AAXKqCbjggjGeyk/hH33Gl5QVzqHLcKHtpkj5LPldCfNAmHmSTDZOGSvJy+GhDJ
 FtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790597902; x=1791202702;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=tyhR6K8kv2DiaBgjFE5j6JP51JNzMA3q085iJsPNf8s=;
 b=CdcNypouFsaJku5utFCAtfb3F2QBuuo3AAtMFUtpeNLsALOOA1asL9rDvMqNcMZEzZ
 WYiKldIh7qfNBXAOi14Cn/oyhhWJh46Ju/qB6CeBPJsef2JTv4Noy2//9KUm8vBD81/+
 P9bcRMSo4qjCo+CTF5pEUC4y3OpVN7roFmEa1dpsdfdyGt8SQcBmEiBqoLn1Nv2qd73Y
 T5TcIe12H7mO1a6KlsxEe48DrIWBQl9X82jnQZOxNYaeCwDZ4xkGcgK1WueGlT8T+ql8
 msZz7eSEyVgQW7rC8lw+wzwrXcqLFjSTW1rUIJhJZW24aQsKfsLKdawZ1GNk7K6FHZKT
 1LgQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBybC7HwVTYVaKSiFpMfuE6WUzhyCeRpjjhOsWh8QnrHQpo8P4qPILHQ3iMlHwM24k8L3IHv0owe4g==@nongnu.org
X-Gm-Message-State: AFq9FYL/esVCNh+IWWCEqAYZNK8X0Nok+qyGgH4A6LBtmfQHzVzG58jg
 0Hm4WvHKqVbh3sw405rNb9OAvG5h/awVYDEE7G4Ybl5p/6JSgJfSxZae2ElLVyibfxxDggI0K5z
 9NwEOPGV2bHFYOXWKRGKVGvFVbGa91/7vknXzNyfk7g==
X-Gm-Gg: AYBFou1rACAiRDgnPAag2g2brFl4zOUr0CE71CGgVZmFa57LZ6By+yNnk1NWYfKf2qP
 ar4qs8wBvmHMmItPu5FpO6hFzabFYSq8Dz2F5uQk/tK7FHo7u+kVN/Seb0EKK18T/tAUdMRDasu
 ht3U4AjDCaw5sctC1XEpt7tdyUWLQN6Jk9aptX8dUSFJcYY2T7fsuXjvm1WC1T31vAaneM962lo
 /f5mPTa6jvB21OmUUoVeQwpndIDUSR4g8XLVI5pxcaxxQk1lCL4brKcpZICikDfetk5KAMjNLxi
 fdyGYqLV/FtsiH6mAtwHF4vYxXidCmOi1RJwdj3GDytvPt594eR7KcfvOEgCvgHeUKEOwNffcdN
 UC3K5yS4WT5TTF5Y96FmIsjd4E5f0wra78ON1heo=
X-Received: by 2002:a05:690e:dcb:b0:671:43a0:77c1 with SMTP id
 956f58d0204a3-672ed3b5989mr4523407d50.66.1790597901959; Mon, 28 Sep 2026
 05:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260925162632.404001-1-richard.henderson@linaro.org>
In-Reply-To: <20260925162632.404001-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 13:18:10 +0100
X-Gm-Features: AclHuK8kmZe_VtLT6MyoHjA3rojXfYTWWpiZFWu8iZkiem5QwyY5U50CBobbcPQ
Message-ID: <CAFEAcA9GAqVM-G2EYrAcJ-xcAQUoHgGFVtkcMfaYYjG_78uetg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] target/arm: Implement FEAT_IDTE3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0e.google.com
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

On Fri, 25 Sept 2026 at 17:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v3:
>   - Drop helper_tid3_udef_el1, because the entire tid3 space has backing cpregs.
>
> r~
>
> Richard Henderson (5):
>   target/arm: Rename isar_feature_aa64_idst
>   target/arm: Enable writes to SCR_EL3.TID{3,5}
>   target/arm: Implement SCR_EL3.TID3
>   target/arm: Implement SCR_EL3.TID5
>   target/arm: Enable FEAT_IDTE3 for -cpu max
>



Applied to target-arm.next, thanks.

-- PMM

