Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp290125njk;
        Tue, 17 Dec 2024 07:24:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU8O2fEiwFCebLa0VjsdN/crWu9zb4aLNjOfXYLOPIjGrvWgYmzUo7knFWaLy0n4DLHy5iV6ea+cw77BQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHu8PA91NQOSeR0ND+NvqLVaPa8G3FAo3K6TDeRXVJfMap402eSlgayTjrzIDwB0or8X0IR
X-Received: by 2002:a05:6102:94d:b0:4b2:48ef:3cf2 with SMTP id ada2fe7eead31-4b25dc3f47bmr16603504137.25.1734449080757;
        Tue, 17 Dec 2024 07:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734449080; cv=none;
        d=google.com; s=arc-20240605;
        b=J1E2+vsptxV78M2fSFFjqSo21tzZ4+GxACmuFfeyRuPuYWxip6guJIEya1s/oQJZaU
         Z26egVwA8GSHRBb/yANCOoDKzVhv/yRyU6dLGSupP3SCt4LUDI8v9nIpBU3yfDPtGQQ+
         dYxOkQMGUsTZjvPwZ60ucC4KUqVHuo0XuGfr2NuE4hjqhUTHxd5Gbeild8mAqI0cjtZ9
         /OcIzX2K4Wcn+uAaZcXpLV+UWEGxovk/yeh2ADNCTAJiYj/inzAZMIUfKwcSu83ZxQwY
         1FLEShCnWGYbeopaYJbpgrD7EtHARTO52r4kEhrqKT1cntOWKjuRS4o/05rdBwlJ3Pac
         56HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KGacxlOZQAptlHnSzuUMpoaURNl1rAufdDjm6Dz77lg=;
        fh=GKPb9ozIdV1cBW3xkzTqBggJbMnk0FLeDl+hZ5ACP8A=;
        b=jeFbCyR/6/0S/YVFKsCYzFTIUOeYblxcYuDQRCJeXZ99XmLUJ8tCniqqhcU2wMo4ZV
         CCPeAd1yDH0rJctf8geoiiaPWoamQ8kz65q2urN1l1aGh7O6jGbJ7WziBYXhGpStidkZ
         eBNUAoJYLG4N8vqZNQxn5fno780jZPpG8sZQb/SZ0qrbAd3kGtfPVlrR53n+vmfeIfp1
         9+Wdixkfs+ZGEh7BnhtREcqphr0D5Wlj9ft+rqafDPYJFdrENZOlTAqhCSYv1vmmDKbG
         7rU+J79unM2yJVzvRj95sWR34HLLYHkHzUIGQnzef91SF8OIpWa8nHeoxuJ3PzL7MgKD
         Ft9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fhu2+pmU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-860ab78fdebsi2112511241.148.2024.12.17.07.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2024 07:24:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fhu2+pmU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNZR2-0008Hb-30; Tue, 17 Dec 2024 10:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tNZR0-0008HE-Qs
 for qemu-arm@nongnu.org; Tue, 17 Dec 2024 10:24:30 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tNZQx-0004mZ-RO
 for qemu-arm@nongnu.org; Tue, 17 Dec 2024 10:24:29 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so1113029a12.2
 for <qemu-arm@nongnu.org>; Tue, 17 Dec 2024 07:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734449066; x=1735053866; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KGacxlOZQAptlHnSzuUMpoaURNl1rAufdDjm6Dz77lg=;
 b=Fhu2+pmU2KLcS8D2MVUh+b5RGSoguHDZ0fFyYTUwJhgOAROYZGTyvMDAnU5NT8PCeh
 L8cXWi6pH+A2RQIpKaXJYja5GWC6tmb8n1Eg75nZV3Qe+dYYAfRnugzLH/jUHRZqHyfw
 1KztJmQKWW7kQyHqry87/XVdyM33ZIPP3zFPSW5E+rub0F2W7FmRTcywbIEy8pl+9z9y
 WECPBxxpaorJ7meGyDppY7X2y0awIBgfXvGzWo66RSCjlD2QQlRPPDzZ9pq7jkrcdXX4
 o/fBtQvS6Pj3FVREgFuRtJjs4yLID23Ip2PNtY3vFYe/g0h6UNqt24CJN78z5OYLX+9R
 B7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734449066; x=1735053866;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KGacxlOZQAptlHnSzuUMpoaURNl1rAufdDjm6Dz77lg=;
 b=qQKN6AM6WfQS9i19Jb7ED3rJPW6sI6UTDT8EnMhm6iAaNy1vO653Tt0jCJCz/shuW8
 /jI+Jx9wEb4M0ix0/EIvBqnYgWV0rt8Hf8qk6XdDUUDbsrVjLxY9dK8vWmJ9wVthu6lb
 S/KciSxBPxwNm26POio+4TsvOx32VXIbVsbrXRWk+rK6tM/NkjErHLin6hpY1t1bRNrd
 VesqCU4PDspJPxiVZLrs4XN0K7RTPl7yJd+baQIeuC3Cfsl3JVOj83CX2q3Y77OUOtXL
 jq1qv8rvR2QvZj88dHpoBivC3tkvvCyDeYoN19Yyj3xxdA6iiQQi2FNjFYxxV/75tFHu
 k0PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG+tamyUZCS/7M667OvO5I7yxBwtMCxdY4Cbldp+oXXa3WaAYtOXx7A6I3QA7KaPMDmHq5QhQbUg==@nongnu.org
X-Gm-Message-State: AOJu0YzC0XX/rKl32Ha6B9Ucw1lKh9LtQQDEYkaNN47WOHnHaLojJ1XV
 Uu7d52lsL7zJUjGr+fuKVIRTOmRELuDBGqsxcHl8NdKcHki9yRlNFlEZtBCjkeVhgVtbe4JG6Bd
 iGaJZRhngAbjODAuDSC4KUSn7HopMcFiKwkOHwQ==
X-Gm-Gg: ASbGncuyrN8Y+oomEuUdZA2jOCGlKpkQR/VeosxXFZqt7PyPgYWWL3gZbZiUqxlPqId
 3aINKOgtsqjh2SO1A4YUg2IBd+HIIY/psDY9hhlM=
X-Received: by 2002:a05:6402:35c2:b0:5d0:ea2a:726c with SMTP id
 4fb4d7f45d1cf-5d63c307086mr14679256a12.8.1734449065664; Tue, 17 Dec 2024
 07:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20241125125448.185504-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA-V3PGF7vst8QFjh+bWVx5EGDt_B9ZCe1OryNV8e39N4w@mail.gmail.com>
 <CAFEAcA_SRU5UtttB=G2=L2YSK2D1U7Rumbc6eafioxR3yfnYUQ@mail.gmail.com>
 <7d5f349e-761c-459c-93db-cc32ec2a207d@linaro.org>
In-Reply-To: <7d5f349e-761c-459c-93db-cc32ec2a207d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Dec 2024 15:24:12 +0000
Message-ID: <CAFEAcA_xRN_yjn1UCpD9xyv2Rkn0X0QzDzqUCd70W7L4ZNZb=A@mail.gmail.com>
Subject: Re: [PATCH 1/1] tests/avocado: update sbsa-ref firmware
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: kyMqe0gknCb3

On Tue, 17 Dec 2024 at 07:10, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> W dniu 16.12.2024 o 13:46, Peter Maydell pisze:
> > On Mon, 25 Nov 2024 at 13:25, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> On Mon, 25 Nov 2024 at 12:54, Marcin Juszkiewicz
> >> <marcin.juszkiewicz@linaro.org> wrote:
> >>>
> >>> Firmware is built using Debian 'bookworm' cross toolchain (gcc 12.2.0).
> >>>
> >>> Used versions:
> >>>
> >>> - Trusted Firmware v2.12.0
> >>> - Tianocore EDK2 stable202411
> >>> - Tianocore EDK2 Platforms code commit 4b3530d
> >>>
> >>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> >>
> >> Hi; what's the benefit to taking this update? Would it be better
> >> postponed until the 9.2 release is complete?
> >
> > We're now past the 9.2 release, but it would still be good
> > to know what the benefit to updating the firmware images
> > for this test is.
>
> We tend to update firmware to the latest in all places it is used.
> Previous one was built from pre-selected git commits due to changes done
> during cycle.
>
> Now we got both components (TF-A and EDK2) from stable releases.

Thanks; I've applied this to target-arm.next with the commit
message updated to include the rationale for the change.

-- PMM
