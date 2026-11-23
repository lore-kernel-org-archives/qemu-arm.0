Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FFD606A32C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zmqbBoka
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVVWg-0008Q4-Ha; Mon, 23 Nov 2026 10:00:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVVWe-0008Po-TM
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 10:00:12 -0500
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVVWd-0000kI-8K
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 10:00:12 -0500
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-67db3a48dc6so3676568d50.3
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 07:00:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795446009; cv=none;
 d=google.com; s=arc-20260327;
 b=TnmrBObV9XdZPRstyl4AAwSrBftvoCaQ4mXY8ZNYTmmHX8LiItmS3ZGeieZndzEv2x
 DkqwkpexqO6r7awkNufTnyI+mBqTzCJkqJLSWM74HZXTjeUlFen1q+TDqh1mSDuww9eo
 w6UDy2s1xbTHpRYnOUeBAvaXEC3hHTxWOjxMHryjA1AGc1Aa6jeYEIIpcOBRmG16LtSA
 4TmtUnQgxvihygfgtc2/W8q+JanMiB0pDlBcje9aTBRFTWnvrrBQ+8apJzQ71aNvRdMm
 6aQMjUOhiPfFUYNW1aDgS9oDcwPNZ3BCXLirzrQxKR6i5+qlNsLN0/mbNMNxInBNvp3Q
 ED/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+1oGA59yDH4YlH1yU0/HwmNs9ocQJIujbNzwQDzzQQk=;
 fh=CDB+OED1VYCiSOHmzxrthrr8ZA46dXAhTfcjh034tnU=;
 b=giGMmN2ARXmpa63HEa+82//muo5WQ6EKi+eRmEDL/rblwU8FCxS5hcary4jVD3XK9b
 /ulNvD1uy7WM6xl78QHdyKX4hIWKEGZNmX3s8dPLBQ81ZfHn1ijcU/HjWR7EvOmiIRfD
 wMnMGOAi1O08UzvBBdLlfRQ7+m7DGkfJo3iETxg3NAdTEwISAVCMJI2niaDRkgUEKstC
 K19pdwYfJWI42t7q8XYxnfg6obbhWAr/2/YUOOWR9Nxq1XUCZlfspHoh8ININvWLZiDK
 OJnFSppeJGAJzHEJdHmqzpHt6dEWgVWSlvvnXT+5KhDVwq9inUpT9gQdbcOZY8KvMkqP
 bYYw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795446009; x=1796050809; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=+1oGA59yDH4YlH1yU0/HwmNs9ocQJIujbNzwQDzzQQk=;
 b=zmqbBokaLNrCLSiENIFDu71VP153gQWzUbL048VnkWL7JjTGuUz648tQ2exCcC7vSH
 kh/QsQI0LqX2G6Fsn2I6Zn3sRWXOCtTXbs7qKOF2ZwXUsbiF/5AZ42zcWNYaY5kQ+0z4
 zCrfyEXqj8LHtMuakwU4/VLQ4qmAjr1onvtjKjUisUWMptBdkiOWYH2Atvot5z7m0iSg
 BLhr13Gxgdi8D/Zl4ylyLkDfChT5thheUweqjmrc3AeC0MIrvYsqGwspTR6hIL8B5YaX
 eUucYJxSfCsfPbAx4iPynIbf1ZC7Xz+gaimeTpvmHti8BQ3zOCIBH9l4krlwXlEXye76
 iMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795446009; x=1796050809;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=+1oGA59yDH4YlH1yU0/HwmNs9ocQJIujbNzwQDzzQQk=;
 b=DrvylJdzJLRjRcg9eERoIDYWHd9lvWXkRtxiWcJA9yNf0yik0QIyxu4J8KLNlKEdVi
 RByg+qCW6BMqjYwamm1/64Ln40jNmXQS2W6RD90OqaXsv9I6X0mSD75qljnUoS3URqz/
 LYgbKGEDptVGiRGCJ/qmVTwfiCuSuw3yWRKIdPSPX/rG1+ijRFOFyBKa4S7UhNjM5k4D
 DRDJr0Yt2BC94QUErId0t7beWIUJGaSpP6PH7EqzHu9ZsGbf3pgOJr2kqTCmRwvfeXK/
 Jmcdo+LOMZREVnxRUNSGV8J2cPNF71ns60piv4hQq5MoGLagekVsd5PilYjX5WC3Y+/k
 jQBQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFKqxMApY/ccJdbfUHKBXO+LJYGMjZK5QE4i14Pl6uCjPLiGHBkA63Cj/BTxQelN052oP856A7zZw==@nongnu.org
X-Gm-Message-State: APuU4Z+1hiu4Yg5TVWeB97AvSu8fmuoV4nKH89j772jR7X10cQZ4jqBA
 apyPxd3jr+4n+QM4TaZK8k0gPB3KhBtv7VG0W0bk6Uh3Jm4+MNBqGQQcuktW6rRgNHv7IacKETK
 LH5gd2yw36t1l/GfRksQ913DKziy07HDSwnZTup2kzg==
X-Gm-Gg: AZFdTZfLyTKjNpJVd4HuQsZZbZChfmA0g5TPLNE56Pc2uFa0+WAbyp5d3kqlL6ppT57
 /WoTvwO+0RbcSLcPHZy7BvAezQBMbQXxjx8ZqE7JCremhydoYeLhpLszc9zfnO7tbiRFa3AsgtI
 +RxSRIz0Aft2BZh2PWIDGSPGSrKqKK1B2+omJ5CTaXldCovPSWmDhfv2Rw5ORtwFSsm+OQfcvK+
 kv6cGQR2fBQBh/mpzbK1jnXWE1Ns8ida0M3XYOMIoVMbzmeBFE4gavju8MOTrbHmiQYp9Qww/5f
 sfTqHyl93fDZsgKJo4chvGzN2ftT4/f/CcWxcWDjzh/1UDGbeHSSV68tqg9jbruTNRH5Doc4uKO
 +BfIFz9BITMvW9rRXfRQjvhIXOKFSrzxfnVbCBNvJTrFYg9mtH9n90vhxy0TP6jiUWr0pXhatvF
 0orFwwnRUSyT33Cf2QLtVq
X-Received: by 2002:a05:690e:43ce:b0:679:be6b:42d5 with SMTP id
 956f58d0204a3-67df4456982mr1894966d50.98.1795446009195; Mon, 23 Nov 2026
 07:00:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAFEAcA_4+PcP8f2DF+mtjkO5iO6eU6C6R6hjfBN7dg0o_TGPiw@mail.gmail.com>
 <20261123144943.9630-1-agarwaljayesh03@gmail.com>
In-Reply-To: <20261123144943.9630-1-agarwaljayesh03@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2026 14:59:57 +0000
X-Gm-Features: Aa3M54r9rslau8NuUH0xmZP1kFcJ32ffoHz5vA_0i4JbbB5brmf7wB0u-bJ_2K8
Message-ID: <CAFEAcA92futWE7aK_ppeBan7Fgr+SsemmQ0E+sz5hFX2hfq7Uw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/bcm2838: Route system timer interrupts to GIC
To: Jayesh Agarwal <agarwaljayesh03@gmail.com>
Cc: philmd@oss.qualcomm.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 s23adhik@csclub.uwaterloo.ca
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026 at 14:49, Jayesh Agarwal <agarwaljayesh03@gmail.com> wrote:
>
> On Mon, 23 Nov 2026 at 11:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> > Thanks; applied to target-arm.next.
>
> Thank you. The problem that you raised in the 2025 thread on Sourojeet's
> patch also affects the following devices:
> uart0, aux, mbox, sdhost, mphi, dwc2, rng200, the eMMC OR gate, DMA
> channels 0-6 and the two DMA OR gates.
>
> bcm_soc_peripherals_common_realize() and bcm2838_peripherals_realize(),
> for the Pi4 only peripherals, wire these devices to the legacy
> controller, and later in bcm2838_realize(), the GIC wiring overwrites
> that.
>
> Should I fix them the same way, one patch per device? I will send them
> in December.

Hmm, that's quite a lot of devices. We should fix them, but I
suggest you have a look at whether there's a useful way to
limit the amount of code-duplication involved (e.g. use an
array of splitter objects and a data-driven loop rather than
open-coding all the creation and wiring individually).

December is fine; as we're in freeze for the 11.2 release
this wouldn't be going into the tree until we reopen at
the end of December anyway.

thanks
-- PMM

