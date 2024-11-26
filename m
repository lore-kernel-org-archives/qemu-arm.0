Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp43566njb;
        Tue, 26 Nov 2024 05:15:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXthJuFYCJg3ClQMIebxAehEX5fV8S0I14bdWbjlPvn6N8m+auZtPP++Yo1J6aKWjPak7tA2QKs6JDBCg==@linaro.org
X-Google-Smtp-Source: AGHT+IFlC5A0RI2TYRcqQq2uQLXIgFia+GCe+ls/1TaX6WWGfFdNYbcDmhwxXag34XSJPV2AmC7A
X-Received: by 2002:a05:6830:7301:b0:71d:548d:6f76 with SMTP id 46e09a7af769-71d548d7113mr4731038a34.26.1732626932275;
        Tue, 26 Nov 2024 05:15:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732626932; cv=none;
        d=google.com; s=arc-20240605;
        b=S57hRPDCmkvP0VKhRzGPRQjgcjiqCpMZM4VuMKIxdnkHOQs6Tt1aHkniidvSXXb/KY
         oghVLELqaGOLxrPxXWtuQV8buch8dwi7g6JVJw5Hr2MGbtbvTw+DkYTL8/tNJi4yxbo1
         aNTla8wTWP/cZhJVQOd2Mza9KfmXSKUrGmP9DagbfWwYpbTCiikWiAid+gT6m0C216nd
         Vh6GBHt3BIIvBWFSIDBS9e5Mv11pn7V4SLNUkFZmYDqwkIGiEslGFqDOKrdxnkhRRSYk
         0Kj2UKHydoufefNgQKgfiTas67LmQli6+hkjF+rz90+jGNxgBE7x7OEGPjAq6Di3j5Dx
         roLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4l0CJj8RvJAvRigw/HDAj1EXsBOQZdxFcnAHit473Jk=;
        fh=diLTHqbv8I693Wo1qZ2PelJQ7iXxejpO03nkfeGaQug=;
        b=TRd5iWrFdN15l+Xupe+Y1VAyHxV1futDZIwe71P25+J623f6do4fjuJs6vKBEVjhrt
         QGv97448jU9KarDDurn+CNgdiDVAOArhuXiOXRwhUaoGezedzS/2cdYtkvRPQfJ8136q
         3UBvjqDQX8CNisCkPhuABJMX5ZTR+mXat8SPpc9GgcTYlH0FYv1l7ctDBehajEHFPvbV
         X55g3m+SHt5DOnNUVzX4caVe/HnB/fYZqVAaHZpGcvWRhmyUUCXaA1oudBe38X0g4a+u
         r3+ozJbrUv1o3ymfSA44f/4skgHjXu4sdsTrz8rhLAGayslu+nwHxn6kEkA5K35wkRC+
         b6mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NnDTsphT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af3590cf91si624443137.421.2024.11.26.05.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 05:15:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NnDTsphT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tFvPM-00076t-S7; Tue, 26 Nov 2024 08:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tFvPK-00073i-8Z
 for qemu-devel@nongnu.org; Tue, 26 Nov 2024 08:15:10 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tFvPI-0003Gu-8d
 for qemu-devel@nongnu.org; Tue, 26 Nov 2024 08:15:09 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so6822772a12.0
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2024 05:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732626906; x=1733231706; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4l0CJj8RvJAvRigw/HDAj1EXsBOQZdxFcnAHit473Jk=;
 b=NnDTsphTous07yAUyvqJm3dmHHqmHLVYz1851ba02fFvQGA3ZyMnXEULZUlid9+dRe
 qlYhj+91x9cq4oqHuTZxksScC/AtLIkBjnhdRD5f0I5XMWVfGCxWNGcszLU4BDEl/ORB
 bcvnlzp5lwcWpI+AmKS7MKVfahGOZih/HS/ljn9o0BNBZRRoFM6HgUV6+TAmNcsUlQjh
 qOSPU7VrUgEgYg37NpjihsaCkQoAJWhFb6gHtOd3/FHP6AW5brPagI9ASDVR7y+X8kBq
 LutjMxAQLxtquI43Mm2VabsH34LyLw86FZF6RfbDNWhSF3jup2JRKx1Bh09Ex716iMYi
 jdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732626906; x=1733231706;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4l0CJj8RvJAvRigw/HDAj1EXsBOQZdxFcnAHit473Jk=;
 b=Ei34WdOIsEoa4ax+SXO3esVKc5ZPUs1NnAOsGFI1vdRrxukozBABzCF8YLo+p8pRXJ
 jqLP4K4bV6ThdPS7ih34NN6p6Y3OnfVoAB6hF/3zQcDc/Bnh6TTZuZ2FrnCovcI7OzUN
 aMSP7H6vFDkUNyC5tdHVs4XMP1N2xz9XSO0Y2Y1zYmXuEMAVy465hm7NMMchACXkEGne
 M1zV3z/bvziDwYE7id9OKzosgM01L9r9yJNV3Y93e5tejpDEcVdTTq8kEF/+ekMYFwaT
 ZcgprJX/rhXT0SgWWdXS9gXynOw6EyvX41L4GYFvNNjuCPGjF15lypFeUncc+GwWyH0Z
 WKiw==
X-Gm-Message-State: AOJu0Yx+6S9gi7KD7ClDFNHSdbhI37KqWwSmHxoKZiRc2+8ZabVjsUKP
 CCzfoxUaTYsxZY39d5NMCgnxN9VNiCw7f54PhWtZjXFCQ7rxBlAN9VSRGbvFny3QHXupgQOoCcR
 T3RcKKPyojXQ5RfINcgGzVVNJYb4SH+NcbFD7bMd0cqLScV4S
X-Gm-Gg: ASbGncuy5VWquQCUEAy2ki1QwaulD88t5ghGQeO9hp6CL49xRf8x9DgFhWJwfJ3FCBM
 71u1f7Dq1/C3oE3AnahtxeoKHYwstdMdx
X-Received: by 2002:a05:6402:502:b0:5d0:214b:9343 with SMTP id
 4fb4d7f45d1cf-5d0214b962amr12203229a12.4.1732626905696; Tue, 26 Nov 2024
 05:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20241126084928.252067-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20241126084928.252067-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Nov 2024 13:14:54 +0000
Message-ID: <CAFEAcA_SkZ+ew8AAVpBHuw-9YW4S5wFbB0Vqx+dBzXf97JGDGw@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: bump default memory size to 2GB
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-arm@nongnu.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QVyCpDhKlY0w

On Tue, 26 Nov 2024 at 08:49, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> We are working on adding RME support to SBSA Reference Platform.
> When RME is enabled then RMM (Realm Managment Monitor) takes 1072MB of
> memory for own use. Which ends with firmware panic on 1GB machine.

Reasonable change, but isn't it also a bug in the RMM that it
grabs 1GB of RAM regardless of how much RAM the machine
actually has?

thanks
-- PMM
