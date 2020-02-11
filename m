Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5400531lfp;
        Tue, 11 Feb 2020 10:26:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqy9XLQsq5dHKPyXrp5yLwlrW+l9ZpfYWzRlKWtjZCNjoffMiz/zT5KVynW3DgE2hVzLBwqm
X-Received: by 2002:a05:6214:1923:: with SMTP id es3mr4157582qvb.49.1581445585844;
        Tue, 11 Feb 2020 10:26:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581445585; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMrKX2/DLgaFYugNcX6H9Nk7I0YJRHsGF0dlch5xU5/5TbRMqVMB9V2X75f78Xo2Cj
         bbRw5haHmjg16ktU6GwSXF64qRrPWN7RkgYETadQLoeTdl7vgr4UFtwInKWeqXIDKyIR
         4c1d4VakK+oPsGANoWU8q/0Oyye4jQIO3YRClE36Aw8ZYKYOGfGnUDm5QgxUfpb/W9L4
         R90AP4yq/0kpAsN3uh5DHi5FI5gQsZhW21d6BKjVU98s5CRasqNtvo3Vb8lX4BTA2D3J
         +g29Ak6Lfoa4i38CPt7ExSAm59ZOATFp5UYYo77ZR6Z4icitLGEzl6/WLNUSIZNWVYHI
         YMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=pbVS14weyRBfRKZk0C8oEHtPLLyHkDt0WAt2KTAXFR0=;
        b=kIbWJvAkt73BS1sxl93Phd1fnizymj9Fc1edAQVxDZU4jYuIyzVXkL3+ATM/7Otgav
         bXi2adpG45A91pcsDKPElEm87s3BVKjudMdjW6cJAT/9lDW/A6PNPtwEmBHJbnU8f7m3
         3tLkzUuTQFbkl/HO94IWoIeWWARWaBdgFpChQgU3m8rcetfU+vR7SvwzlXllc9ChdTFn
         hHWJir/NMgtDZSJmrC0hLPaknNv63uzfP9TU+hc6WJv+JrmutS71OmjVoFw1EdSbDgu2
         v6s13XQjv+9XoejX0ZHzjCPXq9MgLdWnnkHOpdZyhRBRrnahZPM+Y/N4nLPDC3ZrvJrv
         D+pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cq5oSMRM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si2196398qtj.97.2020.02.11.10.26.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:26:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cq5oSMRM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1aEr-0004kf-9b
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aEZ-0004kN-0S
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:26:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aEX-0007hr-8B
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:26:06 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34823)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1aEV-0007e8-AG
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:26:03 -0500
Received: by mail-pf1-x443.google.com with SMTP id y73so5901846pfg.2
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 10:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pbVS14weyRBfRKZk0C8oEHtPLLyHkDt0WAt2KTAXFR0=;
 b=cq5oSMRM/HFXn3zF0CFc6qMNMrUbsfKpNwLA7GnbHzMIUNuBkzX9NYknfj7bvcWObH
 l8RCA4GzrX63vfSCSO1ZWPc9naYJ9R1ITOwp1HHKMM1lQ8rwla691V2vsE65/VjEuSLm
 DsP7d8P49PQed2Sh86edmzN8dxikOX+tEVlU/TltLKmulBRak6s4rg1mZML2/tfFXDNI
 3hfcHdwLbz+d7RVbJ/dZUH09bEFtMHmnjScAQ8dY9zDCHiutpNOxHZASUA6JOzZLHV5U
 QDcRnT8GVFACkYJ2HRpinMUArgzsWaf2qPt61ipAnt/51EdRnOLr/ZHcszIY5ca4b4XZ
 egCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pbVS14weyRBfRKZk0C8oEHtPLLyHkDt0WAt2KTAXFR0=;
 b=e8xAP+yVFH+pWGvQTbYWjdl3gO+RD1S2pcko1ADJL7UKNz2MVqyY8ckY0rd4AamMcN
 AfXwMmVgVCi8hwmvQeO6wzrcx5XS3L6l9bBeMzTKCqJbJRpb1hd8itM5mNsZf1jbokg/
 Ps+4tKpkTxX+QXPOM4WEfeTE7bSnpCQzQBhwbNnYkU6PKJdPKIyEAmCPSJyvp4oq+rfP
 DAIpYdpAoJpylZlVyoT38Ic/QgGjNMMJVrq1rmC/iaxdaGuFK5xSL8yM1hUCK8ngWOC7
 dbISL4tI4OirK1DKCejEUgyGvODL4mkp4t/CCT9cKohS511rIqWA44+UHwg6bRuSXuAm
 MEQA==
X-Gm-Message-State: APjAAAVr/fUpoSw93DTa09FYxKGSaT/ZaVGZoziW7C+YGc/uJaXEmLrt
 +SgM+zJSLnPqyEC2uHJQ4SuI1w==
X-Received: by 2002:a63:7558:: with SMTP id f24mr8067131pgn.259.1581445562156; 
 Tue, 11 Feb 2020 10:26:02 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d3sm4929725pfn.113.2020.02.11.10.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:26:01 -0800 (PST)
Subject: Re: [PATCH 01/13] target/arm: Add _aa32_ to isar_feature functions
 testing 32-bit ID registers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1cb2368b-4e72-cea5-d3fd-170d15c11c88@linaro.org>
Date: Tue, 11 Feb 2020 10:25:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zs00eACSGodw

On 2/11/20 9:37 AM, Peter Maydell wrote:
> Enforce a convention that an isar_feature function that tests a
> 32-bit ID register always has _aa32_ in its name, and one that
> tests a 64-bit ID register always has _aa64_ in its name.
> We already follow this except for three cases: thumb_div,
> arm_div and jazelle, which all need _aa32_ adding.
> 
> (As noted in the comment, isar_feature_aa32_fp16_arith()
> is an exception in that it currently tests ID_AA64PFR0_EL1,
> but will switch to MVFR1 once we've properly implemented
> FP16 for AArch32.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       | 13 ++++++++++---
>  linux-user/elfload.c   |  4 ++--
>  target/arm/cpu.c       |  6 ++++--
>  target/arm/helper.c    |  2 +-
>  target/arm/translate.c |  6 +++---
>  5 files changed, 20 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

