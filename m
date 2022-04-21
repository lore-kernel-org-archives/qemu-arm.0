Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp489729lfk;
        Thu, 21 Apr 2022 09:42:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKmFSGeoGdQ8SEHICxhjpkbK1ECu4ixnJFO1bepj0GGFD8arJ/gvcCxyyoHRXUDTRQrbZl
X-Received: by 2002:a81:1353:0:b0:2eb:f72c:318b with SMTP id 80-20020a811353000000b002ebf72c318bmr589092ywt.240.1650559354248;
        Thu, 21 Apr 2022 09:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650559354; cv=none;
        d=google.com; s=arc-20160816;
        b=iSycgzTpesqKUwXNu6KTFFW0HFybQK8nltiG9geJkei41RmKZk3b6XZ7JahGee4k6J
         RxdPdc0YXjiaoaOVKHDET0cedZLPexCDuPU8kzwWxKKAnrIbhvDsVRhXPtXCt6GBNYIi
         UUycirNJqhIIfjVBrMcflD1fsDpc5wAYMEONPaRcHplD0pMLFMQoNfyK96ocE01rmftj
         2qQmUUQtCcDx8sTdzz4E2ukO1qGVXW/9YP4tEZCBdbZs7E5yB9oQJp2GS8qgsDQEspwc
         Uahq+8XxnFT6mM/aGnt8dBOdNwdlNWANcB/Yn5AweAem9ylceWR4UjQWXaH25HCAdq/z
         CGjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z9u8Xy5HBCQXZ7zOwo4qOL0k6WBJRHNMRD/wfdUkQzw=;
        b=aR9WPS5rYerOAX6dhNymQzQhmu8Kkzi2YfMSmXB04nMXqXeDbm04DiTLEQoIjr+IeE
         FgPjXuLqRks15hNqYF3qCIEcwR0VnYj3v/pKKKviJSvlnSTNf/1wQhSRqvlzjhTgAq6j
         kjMe1p0PD6nQOSwXsw9NR8BzAzKTLfeG0YFyB5Ttx9MqLjO4uT6oB5OWWzgzxPCRR/nU
         ii68s5V0iHUUBHaFV5iD24V3wnWqVDUNRRRLKByESGTGHxoOlkJdy8GWSXKav/scytwf
         mLNfkTdBsAAzheYwYBMRvUu85IfNgSSBk+uAvtgPj1UBDty6EqpAE7KorTvaOx7v1vQt
         VN/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="g5a0K/8a";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a124-20020a254d82000000b0063d9125ca4asi2654495ybb.308.2022.04.21.09.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 09:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="g5a0K/8a";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhZt3-0000vE-M2
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 12:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZTJ-00080J-Lc
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 12:15:57 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:45393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZTI-0007BN-5D
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 12:15:57 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ec04a2ebadso57391507b3.12
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z9u8Xy5HBCQXZ7zOwo4qOL0k6WBJRHNMRD/wfdUkQzw=;
 b=g5a0K/8aFZ18XZtnLl2bCuDK4XuYlZ7mKkTKDN7WShDMEZ9WrO60pgsHtlUKSpktl0
 StGEhw915oB8yjIql1q9uyUIA1+p/k/xd7ay1gJ/6tjzQ+nMczpCiwzCwX0qcpAK2kwt
 GuFy/THde3ZXFfOuV7go8oznk9myJv5wAravd3iuJQD3NtKro9c45RI1xl4Y3wM9wcMI
 PQVDdy9wgmetUsviP4Yh+sf99fVC1N/uH5BPjDin91+EC/NFnYmDcFSBeHgVHN3xVicu
 sbxfAIYBx/f73sjdY0w0ZOYXzXxRAfSk0DAaf7r5b3r2m51J9TghsSQnhQJ5GzRC4rZc
 +RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z9u8Xy5HBCQXZ7zOwo4qOL0k6WBJRHNMRD/wfdUkQzw=;
 b=72UPi3TBtSTCiCwxvIp2J+2CYH1AX0vz2FWRoRZj+5VthGOY9HjF3BpOacboPDZ8QZ
 aLpkQYNX2DKRbbUKwtiWIA1xBAXgBo2zQZH3FC0U0gmney2+KB4k5OKrhnR99SgOdCzS
 PZ0512KeFoqtq/MEl/uuC+UbbmiOErLJ4zWx5FGFhQtnuP5g5aYiSAX5NLp7bO+8GgeR
 G5kkZbAy/oUf/LX6ruWcPy/772wlC5hn0vhPAux5673QLtdcM74l/k9AAEDgA1PP0oNk
 w5RMpCPWiHzWWI82kqOVyeZnxsVjrugGdT79a5SvAj1Scq4oZPRk+TFDXVudz/7it3EC
 Im6w==
X-Gm-Message-State: AOAM530v//mEMThCE5NKUYUp963ol7hSy9BySw2vkmCei+em4jyOfUvm
 OtxmxhliQtHJHzNmT5838R3w3acZ4vk2ra5saEVZUQ==
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr406557ywj.329.1650557754983; Thu, 21
 Apr 2022 09:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-9-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 17:15:44 +0100
Message-ID: <CAFEAcA8=3ut2_jV5Q2vp2n+NLYF2-m+mBT6BEEkKdnaVoTS3aQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/60] target/arm: Change DisasContext.thumb to bool
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jt8x3vukRvNf

On Sun, 17 Apr 2022 at 18:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Bool is a more appropriate type for this value.
> Move the member down in the struct to keep the
> bool type members together and remove a hole.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
