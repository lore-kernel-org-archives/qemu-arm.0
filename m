Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094B7EC110E
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:25:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZg9-0002aB-4O; Mon, 23 Feb 2026 12:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZg7-0002Zs-OL
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:25:04 -0500
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZg6-0004XQ-4r
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:25:03 -0500
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-64ad79dfb6eso4395122d50.0
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:25:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771867501; cv=none;
 d=google.com; s=arc-20240605;
 b=ILXgnO6/lY4Koknlguq4pGi3oDfyBU9yryhsV4SGZg5pAfzjleW6dR3uPH051DHTY/
 oL+5tCqIs6FylODye6JbE122CTJgHFbry3ZsApQQf4ZTvPpjCFxtd/oq3aMvGyP77i9M
 Ce8+Rqm/ugYFt26fHRGYdOPHthRImWUT9Z6hEPgzcHbyO9zockSPXPuCNfYFyiOPq0Br
 +DlWNRljfKlNOp7chG3Z8MLI4NaWhj8TG753osIEmVvsmLlvTXAu39N/+2zZzOYsM88p
 zCoWJCaFGBpODFV3dl3N3W1XDtO9nQghnvKFNAb50XWoV30w4oSFD/g1XddI6toIo/LN
 Pf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=aF4nLYer1W1Plh9seuNY1nlMdTk4JdT0Dd9anPkXhLg=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=VWd2aIKNL25hq/oSL7ru+GmzTxt6RoSMU8mVb7Luan/k8rqetVX4k3/KP5v/xmkgUA
 RAM9ejGpeyzvEf+pk8Q3aj/rr226qpOktAyHcuZwjvlL5emJElSQ1Hl5zzig/O38jUZ+
 1d6xBm5AR/jaPkOB+Vp0seyY6JzF274mN70Dh3mB7SS2vgtIMg5b4NU9ZjpZqan+m7ZL
 wqeB/gNY7t1mKk8pEm/4mhjvHbp40a6TjyQM1gZ5FBqvViq+vhPzK1SoSNxsTcS12W4O
 /tXPKxai7NtheGxCXDNna2jaNwM2UgQ1zZCrIOJi5CEz6n7w7/OokTxbyQKuptoM1W4G
 vuCg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771867501; x=1772472301; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aF4nLYer1W1Plh9seuNY1nlMdTk4JdT0Dd9anPkXhLg=;
 b=mQlfavWTMAvLLTQ6t31Xrm4XrF1gSMSH+j76/Cvo7BmgqNuH6r93PaXXVeBhdk/wHm
 5FyBg/COUjpL3SwZnxj5XZPaH5V5E/Xho7xBJEXJNuvsu6P4hR3Z2jRWwYPMfImeCh81
 ME3m/Km05KjAsCWyZvcGoh9BQqV0okhyvXadFOuibuTbhijXXfo4xc3bp2E3N/9L99RQ
 /PNNjI6NTg2pM/sRhQ9G8g30iwjtKox7tahRmHh+4bTPdyCjUEzEtiUzYm+N6IV62OgS
 FJWKeBugRZ4AqlkEfKwhQ+RTfrmu2/k9/9zVox34Qm1sg9cO91i5pzdwb/HXsF7OF0sp
 6u8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771867501; x=1772472301;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aF4nLYer1W1Plh9seuNY1nlMdTk4JdT0Dd9anPkXhLg=;
 b=Lz6o24Qjy1FikQvcikTFnVU3ZLMFgtQyRSKGONiFy2usuvv/pZFXnBLKTyW+2yAmvQ
 sVmO+dUFohnGEZXop/Uk6YEqNaDDXJwJ3HS/gcqeQHBPBM0ozjs7dTohoAjOLqvkjrko
 U20MH8iZIH3DMdPqk7CgIkZHizH8Qj+eNFpfjuCfj/uO1nrxD9iJvzbbbkqzil6C04b8
 gJOEk6P5PzswAKNTLs02ySlZ5JOX2QfHUEs/PlL7Oz8btk+h/v/tgFCyM1/pqf5bcqCe
 Ygd6iP4T9w4VqUoZkqFcQ+tQcEytWYSd5kjKY5OLRaHiweSNfmGBCoLJboxOQlq9MXY/
 ks/A==
X-Gm-Message-State: AOJu0Yy6eUxApCGeqgXhp+gpHqWxYnSktc3i2umwDv8k/HAXrYTSHmXu
 9+xMMsfO9ovDPTE1gUwtfwNJeTGiWUa9hfWFGvgclMW4V89xGuSx2Pv9RWi1HIpiNj3vf4on9Fw
 0JyLWWX5sNeIkZJkZUJryINY/aWD7uNh/0KfZGNxthOmD53Kd2Z3IGMc=
X-Gm-Gg: ATEYQzztkN4dl7ikGXTuUoTXaTzDF9NgTnJDAR9DL0TzsyMKyABWOl1TNooRkgMuLI/
 NVq/G8k1iyy4TfByaEZ/J7Hwnw5uYEfqExywOq+URWl7MvG9j+tILP6pZk0QegbTcTyrL9y/lB/
 wF6rCEVTh13KvK1NBwTzgi3+Id+Py3/2m5vQKri1Pg5pO+eBGQCDesIvzANANzZDNe705e30TSl
 UnHVVh9lmMQCkkhKDzPVf3RdPYcQZJQPSesCIvnytP6r+S5O4ticJ3tbe8/oHUmuruLyYZRAPv5
 wQVKHnsrepfxDc0wQe62aueU9VUSmynNsgyW+MQn0o9lzdhg/wNPhtfyh6UbIVzymVI=
X-Received: by 2002:a53:c589:0:b0:644:60d9:7514 with SMTP id
 956f58d0204a3-64c78f5ed96mr6173581d50.88.1771867500689; Mon, 23 Feb 2026
 09:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20260223170212.441276-1-peter.maydell@linaro.org>
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Feb 2026 17:24:49 +0000
X-Gm-Features: AaiRm51f0kcYPGySN4UXNcplzCOwp3QbERK55DXkVz-N5xuOxveUSTJWs1XpaTA
Message-ID: <CAFEAcA9ciDOcF-jNa84QKxGFO27qgzpOn1TVVC+M28T_Ybh2MQ@mail.gmail.com>
Subject: Re: [PATCH 00/65] arm: Implement an emulation of GICv5 interrupt
 controller
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 23 Feb 2026 at 17:02, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset implements initial support of emulation of Arm's new
> interrupt controller architecture, GICv5.

...forgot to mention, but if you prefer a git tree you can find one at
 https://gitlab.com/pm215/qemu/-/tree/gicv5-v1

-- PMM

