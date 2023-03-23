Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp6391363ejb;
        Thu, 23 Mar 2023 04:27:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set/llSQ2oWSDstr/rkxf58uOqMltdLQXqvk1wQR0CtizdQsnIxUWZf/oXWjldt4QbTYPN5CB
X-Received: by 2002:a05:6214:20ac:b0:5a6:3dc:a7f3 with SMTP id 12-20020a05621420ac00b005a603dca7f3mr8400425qvd.15.1679570850753;
        Thu, 23 Mar 2023 04:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679570850; cv=none;
        d=google.com; s=arc-20160816;
        b=mTM8uNM1TvSKwnk3K/5naohFEQb9n0fsbVHYOvkgCPkAng5d4BUSLpeMxogqu86jio
         U+p16ViwkfsbWQpqMAQAush6AXxogAUxb0Y692ovkFDBoSRdtLnQXdrsPtAkn9iMO6eL
         ODRjgUuyzXg85lBaiczObmwizO8cN17qT1yIFVNPuk4YLyKK8dFJ/bevRgaQlCXvQo2p
         BXUFFUiuTulwiNSDGTtY3vZrps8tWM287Ccoy86+0r05jmKvlpfHj0zqDeycVh0Lz0V4
         g+vl+1NodaKUjmsJ3COK0OO21kDraWfFyzM9x8N4yFEON9ingR9CIOhQ7LM5XjSchTfe
         jcjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=na3vfhMV/9RU+XBpFi5fJnfv6Pf/vez3GlZkp/8INEo=;
        b=rIEfRlN+bVY/WTF/K3brDXAd+TcL6YL946mlwxaUhrVoH+Oe6LrLjZBe4PDV8wCLuH
         77c8Ht7x8KiXaZJXn9f6hEZhT2nf1Wd8BJakKHTE1COh7j/E57BpdO58OvaZipAvfBBW
         LMewrcwQcdUBTyuy3c+aZlA/J/axXLM40TxrcurKMM4hrOyVLGsmWXMT7oY8o4KCGxIK
         drVkbpbQM9lBDhINNcUQ+85JYa3ojwcRxd+PblNkZEcRa5fzqAsmFwiwW4bIVcwWI0t/
         QsxS1vqzfm2wErsiVAdDh+IEunaPIBUOusBvJG1rOwsU/AswCb5WOPxgGGPKqRgKKkdJ
         2+9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aeB/6P/P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020a374004000000b007426f1d0cbesi10940928qka.376.2023.03.23.04.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Mar 2023 04:27:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aeB/6P/P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pfJ66-0002kt-Kl; Thu, 23 Mar 2023 07:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfJ64-0002kJ-T1
 for qemu-arm@nongnu.org; Thu, 23 Mar 2023 07:27:09 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfJ60-00014k-Uk
 for qemu-arm@nongnu.org; Thu, 23 Mar 2023 07:27:08 -0400
Received: by mail-ed1-x530.google.com with SMTP id b20so51985457edd.1
 for <qemu-arm@nongnu.org>; Thu, 23 Mar 2023 04:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679570823;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=na3vfhMV/9RU+XBpFi5fJnfv6Pf/vez3GlZkp/8INEo=;
 b=aeB/6P/PXvKWOQhVY1V26ki652mRbZYqUVA3yCW4zbXZBgz7LYk4w3hW5Fw+zAe8ne
 r0BspDXaSvIOBEFRVyISor5SlCoqeWxVdFHkuScLaj9L9C4dPIDsFtAgpC8cEG7iZRio
 la3jO54pz56ZueQYC07+SrloCp13JfYHNJdHAbAM7znY3feFSOPYIb7sgbhUSK7vfzCW
 IEe4lkNHYYAqSBIk8Rea1qPlHzge+XRj5r8cHQI2YxzA8smq38cscXNHgODHBDM/Imqa
 cvxiS6pR+jkNy0kDH9geE81hJBlnASqoxJDCkR+rG1UvMurTOr87KzikLDF5fJ2ZbVR2
 p1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679570823;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=na3vfhMV/9RU+XBpFi5fJnfv6Pf/vez3GlZkp/8INEo=;
 b=QL64ft12C3TFlK1VwD0KpMcfDgqmv21qPaz1fa4EIczGWhiygtcfjghPPrZwoLhQPl
 jOzI2lr5nhmQawyN0E7FCTyygANesmMqgoQo6MVQEB/8oZ81JZIRw0w6aY07WsVIvpR3
 1dWZOFgPbbyhS0FFLuj0RelYrVQoyUpVLJrMGw0DRGT4cmOg5x1kbPpRorc9YM6yuXY+
 VYMXtMIa0AtDaJhod/tw0hseF6ZAIWCqkfk/LVKzpCMBc+oKHSFQiae+yyjTmifm1Iqk
 ZR8kPf7b1q9rT+VvWjPr/8Gqkte0FdOPqT7jeOVxjLq04PG1QpOfSu2gWpxdvwFpEsgy
 OgkA==
X-Gm-Message-State: AO0yUKVfmWMyMNvSPZNd4Oc8I5xS3/10qMtOgRyfYb8GhgNgHyutyA2/
 4srXul1eIHb51Di+lNcyKmEHMrY85i42h2T/tjn37g==
X-Received: by 2002:a17:907:788e:b0:932:4577:6705 with SMTP id
 ku14-20020a170907788e00b0093245776705mr5151875ejc.6.1679570823093; Thu, 23
 Mar 2023 04:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230322232704.206683-1-venture@google.com>
In-Reply-To: <20230322232704.206683-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Mar 2023 11:26:52 +0000
Message-ID: <CAFEAcA_ftH3N5NJWfBMCxXW6T+OfA=MmpKMi=_DvrNk9u2WTxg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: support both pl011 and 16550 uart
To: Patrick Venture <venture@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shu-Chun Weng <scw@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: t9NDJVJHhElQ

On Wed, 22 Mar 2023 at 23:27, Patrick Venture <venture@google.com> wrote:
>
> From: Shu-Chun Weng <scw@google.com>
>
> Select uart for virt machine from pl011 and ns16550a with
> -M virt,uart={pl011|ns16550a}.

Firm "no". The PL011 is a perfectly good UART widely
supported by guest OSes, and there is no reason
why we should want to also provide a 16550.

thanks
-- PMM
