Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145E7C61DC6
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 13:25:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wza6N-0006S1-75; Thu, 27 Aug 2026 09:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wza6L-0006QY-Lc
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 09:25:05 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wza6K-0008Qs-1c
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 09:25:05 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-836ce5d6e85so35799167b3.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 06:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787837103; cv=none;
 d=google.com; s=arc-20260327;
 b=V5J52Nq0R60gm3oLY5ymAeFRazWNb2NAqwUu7OamxtW4ctAhyGd9OBsgRwqJ8KH2zK
 Z40D4+3wYp2JwTGa0qfA8T81CP60N4TzVuWYMzZeRGyLOguk/Q16vZwD1qtzG4YcLWXx
 jnf1UlRNGaNGils+cO1t8p8ROdBmifzpKgBffpYkErQT8yJ9Uqz+jhkmFaZku+YEq1Gm
 A1ajbBHBcIwNUlD03Arv3SvyjQ/+Rz7SmxLVjfH9o5pus6mTQIY5+u6vJtpeN4afzAeI
 yAjjOw4yev/1B+IiXpviepdYrg/E+v88NNT8fpY8DtSZHupHi4ANmEAa/mCG521/bqeB
 bVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XfjMHc10et9ReVOFdjsA4jI9Vmgt2LhsatNQBv0Y6DU=;
 fh=5b0hivkRJAy/mV6y5XWqZ1UT+7rMaqgc6ihu5LzLF0c=;
 b=R4iFJ83D7u8MvRrjpScAmBfJI+noRls/dTB1jHgTTEmdjR53J7KRnvGB9HyfsDKMFD
 AxyDsQRIhhE2gCO5T5TaS8QRxBK7lPtmXm76WrpWUIQQIgkX7U0FP8riGWWZvRUKJ6bf
 rA4VMq/xKMkmVV10iPSrbcBWY2Cbn9jGVWR6ELqkbbRWL1Gvvx/6hiYxcU+B/atmaWob
 K3M/OMPT3po/jjIFaCuGdqobko/nEvCd4dJK2RfRS8o3Q9cD1lP3jZ5oK74ihKJpd2To
 6UDZK0It1xZEAMReeNPEzWOHpbJYrcxg4Mwqy6ul1saAW6xd7d3YZe7wW6YeLZAUz45i
 ukSg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787837103; x=1788441903; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=XfjMHc10et9ReVOFdjsA4jI9Vmgt2LhsatNQBv0Y6DU=;
 b=YNe4Cc9NmwSSHU0yfJqzTz5iyIU/AQ5TulYQTjTUfb3yRBqbeSiEBYaWejcNaH+asi
 rwe6Yi4khyl67pkUtiUG0Ht9WAMa25LL8u6Xoq3GMwCn1uVUEoQwkiVE4IV10eexXT9r
 +zapV6am9MXighrz1yz2GzcjWSdTAM1x2uftIwNjbsystyfap5Xx/X+JOYAb3WWhS0qc
 6gZ9LYTMrKlMiX+szvVIM7w+zZyvVqLtvZ1s/MreHM2RNbzMFsmMHWQWa8jGRbN3OQnA
 3wggWxMSJR+5Ul28IEzi/8YM+5KY2u2n0dsDj8kLwFUY1dh6e6j2r4+yaM8dRaLxh1HU
 DyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787837103; x=1788441903;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=XfjMHc10et9ReVOFdjsA4jI9Vmgt2LhsatNQBv0Y6DU=;
 b=fuOqVWDTNuuqyPTale1Ji87KKVIr2PaqVhKD8abqGdJLDKek35UsbX+As5eMuGKQzG
 4mWTNM6Ie3Nfo6uCje5N9IEGYOEz72fLiXX9EpF5HNdVanwJfOPEri79bDdxjkCV8Skz
 hf9fy5jqtx9D8KFpjv1Gq76d7LQmAsl3hf+PWq6ck23g8G9h+PXhHT57C0WZCexEMR5l
 rv+k1mpMm/NPKGouk7wm823jKzul716DbXa9YIqsJqv243e3TKUz93Xxkg9idLzOM1+q
 B6oBagoGbrjomJVr6Ui6afkhuyIgVB+HWsOyIm8Y93qjAkvxKHN0fUIq0vqez6eVALQN
 ZcIQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqe6gwjPek4ITJQR8C4gB3/duUL5g5W/hLPfD4TnWDQnQG0NncU4hTjZgVGP/25TrwlrFWWl4zKZQ==@nongnu.org
X-Gm-Message-State: AFuF++kxiN0YYT81zQNta2PjauZGHWGtWrh1XzxOBxKZYFU9MGDNAkSt
 q04BaP0sTw8BR+/jZ4NJ5JPye4QNY7bDPLni4sqDyI46TdpV9p+4KMe0yFawdNoxPjMNpNDKan1
 WuLdz4GIz/EsAOo6xHP+NhYa7/dAvWV3CHnMrE95oqg==
X-Gm-Gg: AR+sD139hWHPEpcds+YY/iYA8uk3w69RpqBl3R/pXXpbI7vkPRL/ZXQayiXm6yKmQoD
 vnNcfHRePKig0iU0pLEX94s3DKvSZb/RW+/RsiLNe2yIligIksyYc8IJTt+46rJTR6fn4jb4K18
 EQwpUaGJNbrTOAG4rpe89aOd1mk0sF+zi/j1q4kM+6kQcS34xGXkTvgvEtyNSucn6U6vvd45Hzp
 iBMXgCqYamazWDXVkC9jpN32VdWNkpQPbj1u6/Oia40nZ9ifCSeQHTb0n7+U8Rk2gMLUfrrxnYc
 cnwHNGkAUDtUF/QPcPKwZyKP7I9G1faJ8jWXXfui1WsN0jr3foN8+6h/WxssqMkfRWtylt5QiIG
 5C/v5Ip2hh6nzr7s8BMuZO0BloRm7
X-Received: by 2002:a05:690c:89:b0:857:b539:c43f with SMTP id
 00721157ae682-857b539d443mr56834937b3.26.1787837102655; Thu, 27 Aug 2026
 06:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260818002629.172827-1-simonxhy0404@gmail.com>
 <20260818002629.172827-4-simonxhy0404@gmail.com>
In-Reply-To: <20260818002629.172827-4-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 14:24:50 +0100
X-Gm-Features: AcwNN1XLCfAouug5BgrkFYDY0KdyTVkPrqcTuZNWq5_PneG-NlKiPf3UuhzrwF4
Message-ID: <CAFEAcA-jp-rQ2rdE-xYpZ75CbBC3ow4x6xj+P_3uNy3M0qevuw@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] hw/misc/iotkit-sysctl.c: add SSE-310 support
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>, Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 18 Aug 2026 at 01:26, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Add SSE-310 case statements for reads and writes.
> Add new SSE-310 PIDR and CLIDR values.
> Add new SSE-310 PPUINTSTAT register as RAZ with LOG_UMIMP on reads and
> RO on writes.
>
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> Message-Id: <20260805153005.9989-4-simonxhy0404@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

