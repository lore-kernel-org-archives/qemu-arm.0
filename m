Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20024CDE00E
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 09:12:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd2bb-0005ov-VM; Fri, 26 Jun 2026 05:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2bY-0005nh-5x
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:12:09 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2bW-0003VM-Jb
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:12:07 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-80ac88a3948so2896117b3.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 02:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782465125; cv=none;
 d=google.com; s=arc-20260327;
 b=C5dkM/Gkl/ChmDugD52rHhM+Em21qSqF4HVYaA7KBl5kcsAVOGU3UE0l4+qjiXEgUR
 t55eI81lZhTA+HiO2YsTF47LBn2uxCpvAhZiu79Zq3faaDTEpttQHFvqA1OVhG1Dn4Gz
 TDlYiw2AHK49kEL4ssuAiEo5JTnD88sd/glE8AIV2n5+1O8wrzbUJIBDqSCsCR8GBrqd
 VZAsNgurgDApZlk9dGkdAMweImWJm+ew9hAvcY9tdsQBoDUsy+ccwONbw5PljXs1HUsU
 hntTEoJUjOEEt/MOYc8spa047N7P0YOkC+XMYkOtWsnWfk0rt7MlAoA2jY7vubGMrrM4
 N8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1aviLi2/Rh3IL2Ysy0j/MTvHuB0C2Lb1ZZWo7AyKS6M=;
 fh=O2CFwtldMwiGzsk9cmriSyvp8pPLCyecgIsi3AKQIOw=;
 b=ohoRsqvD6bTxVI6DOP7QFYPSP1gCNQAdUef2C6oQmMznIXuMHhYTX4D71fafXIGX5x
 hhjPyxe5WOTgM1nf0WZI/kFFPzZddyeC0ryTX/oUWpkeVfN9+dT6C68rrVSi3icg7lov
 RsqWloGfqFLo01fVc4jy1Hq22x04hw5wb011SWa0gYotgKFQnzqHzH2asoWuOh0ap9Hu
 GQtIsuUirIvveP9RaOrlCbGqW6QgB0CohD1MZVwaQvP+2OtYqMR+xMj3EBooYLMTG/lm
 eBeXZukWzIHTSoEgLCYc2tLJHTy+C6foYh++P7yTuypuRO3ltYIkUjn7C164UDHgIfPV
 BaqA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782465125; x=1783069925; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1aviLi2/Rh3IL2Ysy0j/MTvHuB0C2Lb1ZZWo7AyKS6M=;
 b=ddKItAm6FBgshLMreZ1g1YVym7s+oe4QzLAGCjr8HXdnP26c+xmSHmOf12C81yCYHe
 7UEzBJ/hJXSBQUXiizoa9oLzm0SBQuOwbLL6j++fkCSgrHDgGsPG9V0ZGV8/Azd+N2JQ
 t8RmTeaEOKDnDq8dPgw2bCWa/JCnhoyZiqfRSUeINtFfTz79mZsV7ZRQw5hDt1qVeVSV
 GdcerxgNS2T6D6PY8hj8aN0l4G5IThJASJkmc9Um1oaN6iGYw+A/EcAtbgYofPfWw1uY
 FBTxatVbr2xuvb9Eph2rim8IZeAcwz+RvvJkBCPFFaCGCKN26NnABfZw5kPj+8qbrOx2
 KQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782465125; x=1783069925;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1aviLi2/Rh3IL2Ysy0j/MTvHuB0C2Lb1ZZWo7AyKS6M=;
 b=Hlq3EGxdOtoZ7kr37HzrBYoooFLnr7XTzSdKkafHHTstQDPSZIPG+SZsHWC/uVi+D/
 DN9hia8XATADZxW2rf9AZS/M/iR09UwctnBkwXetgWUFoelCvmoMrAkO65z8P9h0CSEq
 Znj/KMy3ny3KURXURGBjk6jGBaZleYfaBOSWH5DVLOVu4i4Ew4kWQRAt8KAscw6sfew6
 WQ1GpdWpHIsofom8g/sZCaYAEP7Jw0yXeACS71miCDrdbdHHrpkTjhGQhhNCd7yzGQEd
 Ma+1TjJzyJfAto0RPlPJXElcz21UkJjrXA534uFiUGfWPby0MeCeiYcSrLMr7cH5fqLO
 zlvg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ronq3olba0RPlpZWA3OchgvpOdErnoNWzgl8tjsB57P3ptOWj9gnrVPVxGRbWXMMTX1rzBkwgin0g==@nongnu.org
X-Gm-Message-State: AOJu0YxscE8/V0AIJ9SABH7y3HGCqSLFYAhrKhsXf7/dUiDScUqkUbLv
 36MuDsOgN7Laxln+ZYVYifJAp4g4Gl4D0F3IUP5XpNYH2QeC2qBnFPINTIiOZhGmhJvbBvcOj0w
 owxLAwZvHGvwkL94WRY6iSS6HgZ3kSt4ECwVh/iH5eQ==
X-Gm-Gg: AfdE7cnl8xHqUtwqGNIEe74Yrft5SV/scwsZ0czJV9kGpFPOnrwsS9pdhNIgHq3f5eY
 SrIZ/RCxSPGFGFvochMke57LJqu2VGsxWn+cLhpBTmgxnYEzuFWLBiUD6fmOeFcP4tdY7ndsqy/
 WuZS3p9qLNxTVAbDgqDOeLbHY7OlWWprJROU5YK6Kf/jOL/hHfCC4Zcasxj0KUI/4CVspPq9wxi
 Gv0/stpDHBzFh7e4VlEuIG1K16wm10FoUHcDI7ymoY6rMgaMuTsbOxvMqJj/VqNJ9eVYPvrO8I3
 E9f2iSI1BTIkTfYiNGVDdBbyYQgIfUvRF6sV26XUUSQXDbFEixpX+k7u
X-Received: by 2002:a05:690e:128c:b0:664:8d90:25db with SMTP id
 956f58d0204a3-6648d902b19mr4110387d50.61.1782465124973; Fri, 26 Jun 2026
 02:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260625015159.719300-1-richard.henderson@linaro.org>
 <20260625015159.719300-4-richard.henderson@linaro.org>
In-Reply-To: <20260625015159.719300-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 10:11:52 +0100
X-Gm-Features: AVVi8CfSZLxrDjQwhClRfBX9gVXZVUslKdVlasNTu6KI-jf_gHDWxU02B5Cy-WM
Message-ID: <CAFEAcA_rO2nPO+iQXHO5qbgekxPscVEtsgD7V6WdJtEXwcSyBA@mail.gmail.com>
Subject: Re: [PATCH 03/10] target/arm: Implement FMLAL (multiple, multiple and
 single, FP8 to FP16)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Thu, 25 Jun 2026 at 02:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c | 9 +++++++++
>  target/arm/tcg/sme.decode      | 7 +++++++
>  2 files changed, 16 insertions(+)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

