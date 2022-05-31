Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3426505lfh;
        Tue, 31 May 2022 05:45:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhuQ7j3gPAvRdN8Km/+xvY7vDBBNwLNA9zfdRdHMrnY0mIcDuWl2GDYegH2mpKsv3MWWYY
X-Received: by 2002:ad4:594b:0:b0:462:3a57:b789 with SMTP id eo11-20020ad4594b000000b004623a57b789mr37252471qvb.74.1654001130605;
        Tue, 31 May 2022 05:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654001130; cv=none;
        d=google.com; s=arc-20160816;
        b=t51/08Fk49oi2CuKQKTkMK3mt93kpe2RgnDhoRPmEeDa7gXGMVV7SoW/eK0yLAVRYM
         0zXjOU9LjkNRtdPb5B00i/3MWgYqBNcy4uGcwCR8Ig0cr53NKbZwO+GeNYJEQyflx+W8
         qDLKyXjQ5pZJM11qu37SXF12LwXAl6NRAo18ubIptJNai5060j2fGBFUGgzqiMOTwZ4W
         TJk3zJMj2IWCrFeChaOxDNMH+VhJoUFNUGDISap6HsF6O9+EmP0wUdvessNG3FmClmij
         3i7yVPRUi3Z41RYr/m0mw1aUdYeFaUULigDOKzXC6ywGVhkCravtrsH67ebQdqowZ5T4
         KPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jMADFqesLsXAbDofLCwKbZvqL36f6EuAdL3asckzVPE=;
        b=byhXgWshbhJKHTBY6BNXumRTdR9XvKiYGUB0nhrbfUrgQIOS+/09ccdwM+bZ3ewhyN
         NnFWLsg9FLU4SaFt6ehKE9DI6nOV+XLFV60S4QbB9hLZhdUyZNbSJto/BXVQofnhiPod
         NDOdjqK1Z1ayTA0TgHcAf4f21eUFmGddf5R8j/cwn5km8JjS5IKOxJZUIvAvieQ6v7fZ
         sbHAp7a6QC6VCwakxLPfL3TKXvKPDAfyYPLVkZq/naOAozk1RhCb3D3+2ICQVCwz9ECZ
         euoio/CYwxHftBjEQY7Pag+aF2UWraFzhbpf7kjrZyw2WTOFV2gJrGBG10PuG6W16LOZ
         RPJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GpYTwwzF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020ac85e51000000b002f935d30083si8833640qtx.433.2022.05.31.05.45.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GpYTwwzF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw1Fa-0002F0-0U
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0x2-0006n3-TU
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:26:24 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0x1-0005wt-GE
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:26:20 -0400
Received: by mail-yb1-xb31.google.com with SMTP id l204so12882522ybf.10
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jMADFqesLsXAbDofLCwKbZvqL36f6EuAdL3asckzVPE=;
 b=GpYTwwzFEY0qzCZXHRHRjC5PV7h1uRMyDbqHkt+1qRX9OcKaw3TW6F5562X6YgON9T
 eBIhkqyiSI/u767a4OnG/stU69il/Q1q127TvVCFOkR8dM3TIMLU8XuSkD1b0RusAyD3
 nRCS7ozT1UL18e0/IMkLbQAZ+bFTngNqhHCYkGusiD60vaJi45CupVqVyvmIFxWwocJI
 6ytI7aTPSR6YCwUsOrC655XPCRQF9Hrio1v4aFlQqhgm0eURnxZaRROLgF3+3y/l6Gu0
 dvbF3C/XPgk9iXZOwSvIlMpx3uENS0m2uz2meB/6J7S1Htfro73LBy48Gcf48uHYv/1B
 03nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jMADFqesLsXAbDofLCwKbZvqL36f6EuAdL3asckzVPE=;
 b=cgCN23uvcXvptOwhuC9t0dDUyaduT03dL6xUoZWoD0vxVKjiRmnV4WbEP885UhT76b
 l9hjLubFjzI617oGT6C/7SUWKOHoY12XqIEnvDYipyzvCpI7DFPvsE7jfp2RxTtGcM7x
 Gfd24zAiZRr695H7NvS8YYFPCg/xP9kRt4Z63mdiAnuXRuGsQWWpiQwp3Ry5NcYVJ4Jt
 xVRCWlYgtjNrwiurV3D6uzMnfDFq0OtWkbv1EjXoLeFP0hTDyWTxAk9s/uoT1insQU3a
 Y64I8AmGZ4UvJ3/XhtC4b2Kq+2Q84wugkdCosoJzLr34Y6bUbyvDSQFeayuqtapGRGig
 dGbw==
X-Gm-Message-State: AOAM5326g31A/nRKQ0z15KlTI8h8bVPiwQHRT8HhG8WpHLdfqBdo7K1r
 n3wk9SXOMgwzBqrvV+GUy3aHbR/WErx6JG23kdbEJQ==
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr1802882yba.39.1653999978542; Tue, 31
 May 2022 05:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-10-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:26:07 +0100
Message-ID: <CAFEAcA-7Zet-RHMEvRRunxZ5q1==DA2xZMcLdCQdxKCPyHKbZQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] target/arm: Use el_is_in_host for sve_vqm1_for_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cvf294ZcD66g

On Fri, 27 May 2022 at 19:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The ARM pseudocode function NVL uses this predicate now,
> and I think it's a bit clearer.  Simplify the pseudocode
> condition by noting that IsInHost is always false for EL1.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
