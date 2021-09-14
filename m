Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp553604lfp;
        Tue, 14 Sep 2021 03:52:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze+ZlACB8VqjfWTp4jNfLdODKzqPJiVNRWlXlbBMkojC6B+HfOgpLyDFQDvpxLIMu1g3Vm
X-Received: by 2002:a02:7b24:: with SMTP id q36mr13634703jac.130.1631616773260;
        Tue, 14 Sep 2021 03:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631616773; cv=none;
        d=google.com; s=arc-20160816;
        b=lAai5X4DaG7mSvxXBmZFmjocT3K9ehZUlreS0G7mYuqs2aq/mPsdmErkyJi6xQMySR
         nfnWrEfslyxRrCSG8fDpXwdgHoZv7HWqLnATIyYnR7Q9r44qw8SlpEldrc5kky4sldoo
         HP0ad35Ys6BhNnnqzLmFDBoSF0mlA57NQcF8eKs2qp1RdMZh8eauWbnD/yYCP3A5c54m
         LtUdUH0D13OoDqTicpxeeKWZVGQxBWs0K4z1U3vXaHzxXrKHlhj3d0lgbEE0wSm64Ji3
         ShKtDlvg09yO9oeLj6rCy9SctqQi8jc8HNdKuPal+ZBhCXWDaF+/O4IpmpNAlI4r+70x
         ACsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=laagcRJAJo+1gquNVmYG6q6KvnEr9cDlR6J0BVYkuNY=;
        b=oerbA+QMsPtdHelzWtUjUbstB2l/WrAZor7RyVnxw+cSImq/MDXFQVZq9txBg1oQ5F
         fWLoSbyeuvrY2/TXaVcD2Mszh/sx5EQ458E0xqiWZEhbwvVC1ZWd7yOriRLJY58BkMQ4
         B/V8MOKdSXLJJgD5HAUj4SadzIoSTWIrhwB+kzkf6r4fuT9vMdvV0EhS37ha2TRQmK8p
         zXMWm3VTOqgvB7MNf5wevuVxTJRi3t/huhYG2cXQ2M1hVXjq1wfvmZ6146pJJjPtm6Wy
         XIdJrDZ6SBXyp8SJdk9YvRmYMnok/VnRNlOoF62mv9ScC7mrnQhLnSN19I7+w+irHCSu
         9hWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gUu6YvoE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si7125299ilo.26.2021.09.14.03.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 03:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gUu6YvoE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ63Y-0000qz-Jr
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 06:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ63O-0000mB-Hj
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 06:52:42 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ63L-0000Yp-LC
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 06:52:41 -0400
Received: by mail-wr1-x42d.google.com with SMTP id w29so18685593wra.8
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 03:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=laagcRJAJo+1gquNVmYG6q6KvnEr9cDlR6J0BVYkuNY=;
 b=gUu6YvoEkCe1+39amstjHpgG/0UdcHs0loGuPJ7Id+UoFM1xNB+dfWDzclzWeM+Dqr
 9nqDOFzW73nCg/w1Bnev4X/IUv0wYDRaSKmhwt+SA3KRsW4Nw8cdq/oglsrdKDVdfyBN
 22fehNpwp1TYb655TAc6nQjSP75Ad8OCvA1yxuOfwBZ+w8TlmJIX8TEV/C/BXf1xnH+h
 RM437l0szEmjK14Cl5TeT9TAqeePArHyGSNJES7gWfT8bCMQm6wtuDEDFqKQ2WPPm90J
 u+tYLROARR4qFvQUmV5dxBjeg3nopDOFgNL+WDQ1V44bGFAxoSTG1lZcfiQ0GIgbQ5L+
 OCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=laagcRJAJo+1gquNVmYG6q6KvnEr9cDlR6J0BVYkuNY=;
 b=QoDOvTL6QfOZaSjKY43njSKkHI5Ic8K0//hNG7GIgo6oLZcPxRN15clfuSorVAEMO/
 VOppS0rH/sld7VQT93oqT6GcbOZBHingwQPuX3JcWVUs3jC3XKMWScPVw8/K/HoePE3p
 dNZkWorZA3+o+fr9T13spA1SHwjY3se4d4ZpAAZ6x6yAJ/n0AnRCVxrevGtfCq0+wJs6
 cM6vDcV77IsjEohRYlJsIFGXR3ZLrRVjJfKVmU9z2Bn4nPCWHKqvk12B4eTI2BbRfzxj
 XGgc3P0Lm7FkMyqFaYGyUFG/CrriWfo8SabQH5/u+Pdb2JpgsYJXur7QGWDn8PCJW/6P
 0hQA==
X-Gm-Message-State: AOAM533TxjRwOH2uRarAbGn9lXsWxYEjR+ctDOTpRDGULONcfjY7j0Ki
 B7KbYVlPb2wGf0vOvoKVxLSbdws3sZrd7oQ8iB0flw==
X-Received: by 2002:adf:fd12:: with SMTP id e18mr14091092wrr.275.1631616757831; 
 Tue, 14 Sep 2021 03:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210913161304.3805652-1-clg@kaod.org>
In-Reply-To: <20210913161304.3805652-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 11:51:47 +0100
Message-ID: <CAFEAcA9CJekxghvjOpoweVNX6ebKz9yP27tP8OVsiR49T4XSHw@mail.gmail.com>
Subject: Re: [PULL 00/14] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cs/q/FZ3pFaX

On Mon, 13 Sept 2021 at 17:13, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit eae587e8e3694b1aceab23239493fb4c7e1a80=
f5:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-13'=
 into staging (2021-09-13 11:00:30 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210913
>
> for you to fetch changes up to d7add12e20fa8982f5932ff4dca317c5d2dfe7d9:
>
>   hw/arm/aspeed: Add Fuji machine type (2021-09-13 15:19:20 +0200)
>
> ----------------------------------------------------------------
> Aspeed patches :
>
> * MAC enablement fixes (Guenter)
> * Watchdog  and pca9552 fixes (Andrew)
> * GPIO fixes (Joel)
> * AST2600A3 SoC and DPS310 models (Joel)
> * New Fuji BMC machine (Peter)

Hi; this fails 'make check' on 32-bit hosts:

qemu-system-aarch64: at most 2047 MB RAM can be simulated
Broken pipe
ERROR qtest-aarch64/qom-test - too few tests run (expected 83, got 31)

I suspect the new machine type has a default of more than 2GB
of RAM, which won't work on 32 bit systems.

-- PMM
