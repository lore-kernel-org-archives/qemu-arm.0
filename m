Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp867139ejo;
        Fri, 5 Jan 2024 09:50:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwTDSsRO1bVjPyuT4UMGe4sqFll+Q4tJsw6vH20JnosexU58xQnscU2zVADtjIQF4b4ChS
X-Received: by 2002:ae9:e71a:0:b0:781:ee6:6316 with SMTP id m26-20020ae9e71a000000b007810ee66316mr2402022qka.153.1704477003910;
        Fri, 05 Jan 2024 09:50:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704477003; cv=none;
        d=google.com; s=arc-20160816;
        b=JkZIAMtP+lhaKFY/s4y927Flf6pEwWMVdTFqr1yZPV3RZr+68Bg2i8h6qeko4XdW4y
         5hIbOwd+2ydGzPiXf7EpbrTLQX0o8CeD7z6jHL/VRG/NJFfv6YyxKYDOsfUnpLlogUXl
         aioX//7LuHFpPGa++RM7LkYFAodrWYCfbgud/sia09CphXbEgXLOZNigYLA0G113i/Kd
         GKLdU1kDNjInJC7eIqOlNcfDQbIn144t+GT3FSyU2rU/2q6eOV+h7MKmngAi0hAhLCYI
         mBDXrj2k3WMRDNotRdZ+5GjBSbebP5JWNpcmZ68/kwT/E5lCIVq8t1fh2AwtWatxbKfV
         bllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+sXnJtWcjyBLOb2yW1MhZlclOJfsqSSZCQwvR/NIHrA=;
        fh=X19VirOLIMtiJW1NyLmfKzGxHLaEMk4tdbk15iOGI9w=;
        b=mUQiTiRQFMDZSp0bNgXPz6a6ZyHX9nVSs3+4fnOT6UW4aPKWV4PMmS1u1Hb1JjjpuU
         H/XuAHYqoq/XH24iEjXJzEg0FAoQ1u300/x5AYMy8dLkPgZdZDq1tOpkJxOaH8trTsbY
         WmnLCYwPs3bMs2ByhjxYh4fyPJwNtXNyLehgWgPN2TK6M1Qklf5n3k9ipUHrXSbX7qFW
         Vs+EzJdeEPjw3k1yc+2tvZHMSCpCAK0H5LplIbFTjWwSrhM1Yj42BWd6fNvULNQggwDJ
         iuAgzlBXrlvsPS6J7537WIPGjC9yQco05jR69HLPmb8iZ5wf5i/8d+V+6N71iTtz6DFV
         XpMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N+MnHX/M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020a05620a245100b0077da9bb98a7si2344773qkn.347.2024.01.05.09.50.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 09:50:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N+MnHX/M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLoKG-0006e6-5m; Fri, 05 Jan 2024 12:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLoKE-0006dV-Hb
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 12:49:42 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLoKB-0007mW-T4
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 12:49:42 -0500
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ccbf8cbf3aso26947631fa.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 09:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704476976; x=1705081776; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+sXnJtWcjyBLOb2yW1MhZlclOJfsqSSZCQwvR/NIHrA=;
 b=N+MnHX/MO4x3+RFDyu5814V3teR4vZUK9qrnKwjz7Ks3yJz5hdoEugTXNWqegxMrlU
 3ZZiVGqzXaBdGdwWauR80cQhuGT/jb16vmC2r49+Zmhq8MPLsK244HstFNLUDRcUGSyz
 xTewPEfaV5khOkEJUOBh5E9l5utknjRQ/HWVA8IIeINfgrXW+zPEWvrRzLzYyf1zSUWj
 P0mFya+iVBmYAJP0FS4zwNQeoyJD9IsnUqWbPmulhE6tTppWgxSG2wsFQnGes/Mwe/G9
 Gb8QIG5ZEePJxNVHWXOMneoWv/bLPQyE9xqhh+vHSZ3ucYV6ypSwE0d52EuUhvjQ1Vvy
 LBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704476976; x=1705081776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+sXnJtWcjyBLOb2yW1MhZlclOJfsqSSZCQwvR/NIHrA=;
 b=dALmyx2KjP+K6gsEnZTjK4/yqG28VVi2C4H0j02XWBzM9k7hlH4QcbQdfMCdwLlbMJ
 nm3XBtQODAWA1joNNFGb32Kg8gl5GTxxQ/lv/8qv5LazzIl7h7Cya3+AOGywAJZuNko7
 alXjI3/HGpTmmBCpov2TqFHiW9971ynZA5TaGePfOyg8fLSsPGrPPdT/yVVnnVr5/R05
 jPvBDBhghgXhjeqS5LbQfRNWZ4N2mLaJpDG4LVg/u7ZBm31xzojzgSYlhAlCYjlBUi/y
 YUhN8UeO39iVzLozT4TfuelLfTLtXywh+MjLBQ8dh7YvwRtPCUIB2luTIaFTU89Yw0u/
 Httw==
X-Gm-Message-State: AOJu0Yyqp041u2JkKjRaCPotj8DrJbg8np6p6MPhdM/01m00iiLNdNrX
 OoNOgOAZNAne+AeezeZG7uVRAbX/sPK+VjuXfwbZhu/iMj10zimT/RtbM9m1
X-Received: by 2002:a05:651c:1693:b0:2cc:f586:ce9a with SMTP id
 bd19-20020a05651c169300b002ccf586ce9amr1442366ljb.93.1704476976171; Fri, 05
 Jan 2024 09:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20240103172817.2197737-1-sam@rfc1149.net>
In-Reply-To: <20240103172817.2197737-1-sam@rfc1149.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jan 2024 17:49:25 +0000
Message-ID: <CAFEAcA_yoBEM-6cw5QOTcpO=TH+2=ySFu6=XRkBqGywxAi2SHA@mail.gmail.com>
Subject: Re: [PATCH] docs: use "buses" rather than "busses"
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org, 
 Vikram Garhwal <fnu.vikram@xilinx.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: UsirwCGR6dXa

On Wed, 3 Jan 2024 at 17:28, Samuel Tardieu <sam@rfc1149.net> wrote:
>
> If "busses" might be encountered as a plural of "bus" (5 instances),
> the correct spelling is "buses" (26 instances). Fixing those 5
> instances makes the doc more consistent.
>
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>

Applied to target-arm.next, thanks (since 2 out of 3 of these
are arm related).

-- PMM
