Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2762379njc;
        Mon, 18 Nov 2024 09:52:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXTSa3pEIY4w0NpcPYm/kZW1SgvDlFIrTcV0zE/jxp0eFGGuflm/Q1K9zq/RNOOcbHsUoR4GBNLobNXNg==@linaro.org
X-Google-Smtp-Source: AGHT+IH6DbTsfcaWlozMiMSSyLrpRyHuz6a75+QW9MJWLt1l/kjIpl5cWGMKuWAHk8y8ogZox3qJ
X-Received: by 2002:a05:622a:4d4b:b0:462:f685:3c29 with SMTP id d75a77b69052e-46363e95508mr191012741cf.42.1731952376376;
        Mon, 18 Nov 2024 09:52:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731952376; cv=none;
        d=google.com; s=arc-20240605;
        b=KzmYZT+Ns8gf0vInJbg8Woer4/EdHtdGjuafRDONTWWVqxLjWq6II8t4dpFC4wpFaA
         kYQR6rpEuGq3luHw2+ysPAzuU4PVIBCEYR/Rj01KH3nCr7TAkTpyev5d8WWRyADFfDFS
         WJzXaDQ1SipoKUqdKVU4SIT1YU8Gk5A7KjY3HsH1tkzL49LHCLMVYpJcnPaRRUtcTG7+
         CXzT+QPig3skT/3uvHJp8QMKozSTDIa/+9rXtTpOXLvePOlNAha+UetN16WDv7YA7f1v
         YGrMAwuFVb6BcOXpuEb0AH8CGkgbY27Bo+umk1k9gABuoJPz/rPDz2vy+nVNjDuXYYBG
         OONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=FzB3uG2YzDJYNup3z5b1idalppx7G1F6If9BrKWJBWI=;
        fh=adDlGcu0xHQur9DKbGnup3yOLwrFV1y0o7L74W+8hbE=;
        b=NxbiGzfZRBTGBtPZs2caYQIgCoI2Cwv78B7LMYlFZ6irS6k9nddUmXs+Xcn8ylFxDA
         R34fLGMndnxjM4gLbpT59yDHFPvqx8ViLaXzNv6lc4ung6FH6x1dlCoxdVjCTXWxSb9/
         kapgo15H9wPnQ7bjZ2iw4bzrXVXYMq6HYaPXSRyRaBjJAX7TkDHeK+vs8t422JnDcXe9
         /l+dbvGNr5LJpZUOCMrOZkN2WVRxGZ4t+1TrV/MVK1gvKnUCRH56639nWDrjtTv203OL
         Vrwn7FG4LrcPMXEOZkHUTmAZsJsTpWldVWBCAhPpRHQJHrEvQo4djy18rMqeRDgU5ikL
         6K3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n/AeZiBU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46392c79c42si1478521cf.692.2024.11.18.09.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 09:52:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n/AeZiBU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tD5vP-0001d1-2t; Mon, 18 Nov 2024 12:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tD5vL-0001cW-AP
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 12:52:31 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tD5vH-0006bg-Ax
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 12:52:29 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9ee097a478so172139666b.2
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2024 09:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731952344; x=1732557144; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FzB3uG2YzDJYNup3z5b1idalppx7G1F6If9BrKWJBWI=;
 b=n/AeZiBU65fFfIvzNvdKbhfvWPIw+rU6319HHSTGzU5UGDnYYO4eoLg80KEF2KS3ts
 ruodhKMnuhn1x5XnuXZdu/BTD9cGiSowXH+TUoXc2HbuHSB0azAB4ZqMx8o0WdWyrrYr
 M3p9NAtYT4ZyNa46epZdd+27In7vK5fhBjo1f03S5DZocjWo1LUCK6xiY1E+Gs2peXrk
 +t7n5mzlXumCDWonDzwxpEcBLiaZtFPbK0gpRFgTPe/yW4SMwFAdmVucJ115H+RDaDk/
 Rtm/M0xfQton2bY2xzZDvd2DnPAqx1iYoZvH9sTom44v/7hieONzYq0mEWmUJ/VVWMPT
 RtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731952344; x=1732557144;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FzB3uG2YzDJYNup3z5b1idalppx7G1F6If9BrKWJBWI=;
 b=jXmwJ4M0hW7xliwD15XCG+/ELYB/Zg/dn0Cc+CmWgwXYx09wTSl6bPKyfQZy9y20em
 aHjTgPezTguiB+dSxRA00NQ3Ot02cPziJbnbaAsZ7pP56F3MghB6hjF2Gm9zZcGRA8Kh
 zWuRQNOqB0nZSRPIHQAXyJiovVquf12lNHIjRs/ofZbYKBM16Np5r5/m6f8DrKtrTXgZ
 skdmnLwkPJxt1g4MfYkrkpNKDoEtGyWaVTDilPlhRvXlvDr0px2+stH2LpDHwHmsnm+/
 QnrUNam+y2MqtelkfQygKo7inn5/ifLBPXQ9/mtlfeYn3/kWc2eAewg8Uyv/iNwi3xcW
 7coA==
X-Gm-Message-State: AOJu0YyOSXFkO9p+OZ9ctQK3s9IhOdConZzw0dnXN2MqJWNlRkNWmF+M
 yNZJh6ZIRAS5IXDQsYWsHdLA222tyor43DX4v73ftKw3MJGfRYyNoD8WwNwC+kJ2mFV37V6SaXe
 0ST54wfZnunAzRH8gA7DXhOSaJ8XB2WoEIpfhJg==
X-Received: by 2002:a05:6402:50cb:b0:5cf:c22f:524a with SMTP id
 4fb4d7f45d1cf-5cfc22f524fmr7684102a12.8.1731952344657; Mon, 18 Nov 2024
 09:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20241118152507.45046-1-paskripkin@gmail.com>
In-Reply-To: <20241118152507.45046-1-paskripkin@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2024 17:52:13 +0000
Message-ID: <CAFEAcA_mEmC3M0VP=BGQ5sikroMA_8DXPwXz7QXwgyXQ5vkHYg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm/ptw: fix missing sctlr.{u}wxn handling in
 get_phys_addr_v6
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /VhZq3blSAk1

On Mon, 18 Nov 2024 at 15:25, Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> We observed failing WXN tests in our OS which we tracked down to missing
> WXN handling in qemu.
>
> The problem was in that short descriptor format walker did not respect WXN
> bit. To fix it, make it possible to call get_S1prot() from
> get_phys_addr_v6().
>
> Tested localy that all permission-related tests in our OS passed on
> following platforms:
>
> - arm64-virt
> - arm-vexpress (v7)
> - arm-virt     (v7)
>
> Changes from v2:
>   - Fix naming
>   - Fix too early ap decoding in get_phys_addr_lpae
>   - Refactor a bit security-space related code in get_phys_addr_v6()
>
> Changes from v1:
>   - Fix style errors
>   - Add cover letter
>   - Use get_S1prot() instead of open-coded checks
>
> v2: https://lore.kernel.org/qemu-devel/20241117134931.37249-1-paskripkin@gmail.com/
> v1: https://lore.kernel.org/qemu-devel/20241114165900.6399-1-paskripkin@gmail.com/
>
> Pavel Skripkin (2):
>   arm/ptw: make get_S1prot accept decoded AP
>   arm/ptw: use get_S1prot in get_phys_addr_v6

Applied to target-arm.next, thanks.

-- PMM
