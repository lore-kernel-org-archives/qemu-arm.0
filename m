Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp463675ejf;
        Fri, 23 Feb 2024 02:06:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLj761EV5TLyI6bEMRy9PX9AVX//5pZ6nU6U/yPs8gZcQ7Zx7A5if/xo+n602MLduDo+b4ew+oYlVrxzGYqsT647ntY0C8
X-Google-Smtp-Source: AGHT+IG2b1OLNO7zfXXoMgVdDehNn1Al9EPMQHn6q/O+FpkJXgyRVDIB4FzhS6k+Zh9EZRVCB/8M
X-Received: by 2002:a05:622a:40e:b0:42e:3cbf:f7a8 with SMTP id n14-20020a05622a040e00b0042e3cbff7a8mr1763510qtx.19.1708682764298;
        Fri, 23 Feb 2024 02:06:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708682764; cv=none;
        d=google.com; s=arc-20160816;
        b=IFPXE2XL1mx18xMSgWpr9ITtdCZV24gmSlm0G8YdxaYRmVs/n5lvaFZlSFKDSSUhFm
         unX0jTtXcamt6G1dlmgJZcNUjYvmAukp57aymRdlIQ42S9MMw4yPE7EiM7X2Rh9XQoZp
         9rJ8b0mEIQux/jlgdi9e7gBVae+fW+RM5T9dlTpzp98h6V2rrQdtdMVZr+u0g1XeQsCa
         /M4zNfu/neCckGHIoNRFN2b2Auz7M9Ifon+YX7dUN+59MaItWmkdA3Flr8CCEi6xU4Y+
         W+5RZfkLL+ScBpI8guYqbBXjtUWdjtEb5S2FZ+GIYPJmSElKTfRjlhsQrespmPSAwKmZ
         T6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CnhNgcKju63+PRubhhaomuRl9ieZhBhLIJ6OWiqVIsM=;
        fh=A2Dee7XtbJDugaGrbV/QG0OIwPiRh/g+n/5+XBeA20U=;
        b=Fk/8X7xjzG53oO7CMv8cQLONXYQRPHK54+cVzBuxKx9P8xP1wswvfz/jIa5VXaNXd5
         LBKhKhfG2zGcUoniFDh+8+GDflGy58ITvH8y2wkK7JklSKxFuzGqVv7aZvCECc0INqyP
         JcRucYOVTE1+chZFLg7KfTsgdnaQbILRfq25pa4EbQbz7RX5R/+Xr5woNjzvHUur+L5t
         IxcKjME/pbrEp5Rvgnx2HN6Pi6zCzerSYo2ThfzdhnK+WHaFM5PB4txiyY08y6/nwkaP
         cciacVlr1DSZukWp5bQI5h3foJftFnNDNFV9NCoTXwcvMK/jbYSFr3zQImGdaWOeT+vl
         38MA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FZiw34at;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8-20020ac84908000000b0042dc9057affsi11266879qtq.128.2024.02.23.02.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:06:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FZiw34at;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdSRN-0003yQ-Rg; Fri, 23 Feb 2024 05:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdSRM-0003rp-04
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 05:06:00 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdSRK-0005uL-EW
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 05:05:59 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55f279dca99so828932a12.3
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 02:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708682757; x=1709287557; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CnhNgcKju63+PRubhhaomuRl9ieZhBhLIJ6OWiqVIsM=;
 b=FZiw34athoMbzjYp49OG2GA5XMbF/gvTr73Kq52lNLOFdWAB3VIW/UQV9i71sgbQSN
 aS9OaR9yk6QEBL22mq1ZKtOySaMc+AFklpm6tK//LHbNO+CyhtMc1ZdJFmX5u2z+sGyf
 2pMjk9Ob9ff79p7Hq897PolsBkgMoGoq6YUCafKZIjN04bjj3Znc1vOEefoHpS8ISWeB
 0SMBBuXni+buoazD2BJv2XOK4ZpUxjALytLte6za2XPkwQFfsJAkKedWiLm/enrjg0SN
 Yy2o+lYUmEsT1rUPMqxzyLGZW4TISkT7o0ELHDSCbvDDe2UacgJF7lxIZ0KwJR+3ctKz
 BIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708682757; x=1709287557;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CnhNgcKju63+PRubhhaomuRl9ieZhBhLIJ6OWiqVIsM=;
 b=j/YLyMLK491uByDJHoyg9QEPaWLCKHPLGbvsQpEOiQUhFTk6D0cT6Yu0ENOePvdcEY
 N6/u/Jan2Pif5VOp0U8qk9qKM95ccWe4Nb3Jlc04QA9yv/SM3VqZVsm2IigNP6iGT8kf
 oQNoIfKKIVuxGYmNl7MEevnknXZx854/bzjBuhSFavYd0kzkh003zzRJdBP82B5QSYz0
 71Pdo0xZ+nvCOXC8bN7c/PDTx2hKgACAz6SwVSLbYM9vD/oYSYxrbzjkhP6Z/9YY8Dvi
 5vVMrdBaXggbEvTdxbmkZRsWQR56ENTSMNLz3BZr5LHMIhI9taIJWpAGQ8+ajqD3LTjn
 GerA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/ROBQTnydsBqkHevFmPPDWepsvFBvU9bEyh70S4GZz+4vLwsdbTLAhdB/NYHQvVVqLo7+iYpI3kvhXFQq+VnGOCDW
X-Gm-Message-State: AOJu0YyhVF7kdzYyvxncbJoFVBWF8Jg7T/npDPRWslLlS8qfqJbF2tMi
 PMobQOzvGaFlEyOa8X0in2UhvdU7b35YZnwpE3VSTcA40BiJpzOkk6qlPr4L9PGlV1w202QCux/
 W1ryVjDyjTDMOPsx027ohFqQ/V/7VZSC7qvvqGw==
X-Received: by 2002:aa7:c515:0:b0:565:7eff:58d5 with SMTP id
 o21-20020aa7c515000000b005657eff58d5mr349558edq.41.1708682756761; Fri, 23 Feb
 2024 02:05:56 -0800 (PST)
MIME-Version: 1.0
References: <20240220134120.2961059-1-rayhan.faizel@gmail.com>
 <20240220134120.2961059-2-rayhan.faizel@gmail.com>
In-Reply-To: <20240220134120.2961059-2-rayhan.faizel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 10:05:46 +0000
Message-ID: <CAFEAcA83CG9bXP4akpeccSA5qDas8t8TcMozxWjwVwQtVA7PvQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/i2c: Implement Broadcom Serial Controller (BSC)
To: Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, pbonzini@redhat.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XxR8djd99rr0

On Tue, 20 Feb 2024 at 13:42, Rayhan Faizel <rayhan.faizel@gmail.com> wrote:
>
> A few deficiencies in the current device model need to be noted.
>
> 1. FIFOs are not used. All sends and receives are done directly.
> 2. Repeated starts are not emulated. Repeated starts can be triggered in real
> hardware by sending a new read transfer request in the window time between
> transfer active set of write transfer request and done bit set of the same.
>
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>

Other than the minor things Philippe has noted,

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
