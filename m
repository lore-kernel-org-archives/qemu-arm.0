Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7484AFF885A
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 05:55:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHbPb-0002AL-0i; Tue, 28 Apr 2026 01:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbPP-0001vw-19
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 01:55:01 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbPN-0002ZA-Hh
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 01:54:58 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43d0deb7ad5so9005205f8f.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 22:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777355695; x=1777960495; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n2pOa3UxaT3QvQbXdEwPNoYPt2Hehykle1YltTvX/x4=;
 b=t9ScBVE81URT5GxG0yFIOzCCfHBcVicYZkdaCWWZPEAAZwoZgnc6g2TR22qwrbEdSM
 VTludJu8MjkU7uijjUuL4d0a+TwGarihHzxlFfeV2OL/0wUKp17Ok4DpJZRoU2tPJuuA
 aJKcI8u1CrSjRAStBGOn/WgUlGZxdk0nk6Oi2t8WneooWszGBRqsiIObfUKMc992+RLW
 LXtki218spiEhKYltB1UY1BnpjG/zSFMg1Tfa/GusFfBNSIlGrF4bz643WQ8kKwZ3y9a
 oAvfzE7WSl0lruqiUgUlRm0n3eNDfJFxo8h/OPnfOE5Kdw/IMpLkOyqqROv6iUmk7ymg
 z7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777355695; x=1777960495;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n2pOa3UxaT3QvQbXdEwPNoYPt2Hehykle1YltTvX/x4=;
 b=EEBVU/vXfRuz7FgaNoS0TKsv5wUXrR7KcdegKGu7UyOsZeeivQaJhTjDfuJcnGHa6r
 54qFFNnVvXcXhPeOpC+7BX32ANvI9vNNt1WOPFtC8n2qeSD4ZSpPd5ORgxeLxX4XhX8B
 Jg1njkrruglU76lL5x3oXB+l5a9QGVlTCChp6UHxjVdCd97uZxEWqhf1rR+eBHquJqeJ
 97OtEApbm0PVuEyxphe1D6ZdCKp9D+FDMOckK0OlGLE5FQeWr/06GSbCRVYyIGBkumOZ
 cErclnGALtm3ccTCnXp72TkEIyKBBUpiDotfMzwk5+2wgRrZufxpyedUSL7nU70TCRo7
 H9GA==
X-Gm-Message-State: AOJu0YxNLWDrTQ/zD9cslt9DDY571hFfpeWUBC9qfQco+xBkjorZbdUU
 f1TTUSwIvyJIlWdSswMau0gxJvVaXbRZQHQy0ynhIYU5Cr+9dmNDToD13fy7BG9IqCk=
X-Gm-Gg: AeBDies9cjVt1PT4oAxO0HkC4SOO9sYjx17fnUGhgvsJVYenaPM76AYzXNTEhHKy9Uk
 H+oMC88EeH9zCStHXjuKV9nte/c9BuJXzJSU9sHy3kXNNgYeoh9pwYuQwjVUFke6FzMLrV+8hy7
 GV0mBCJQTcl/9JQzhnHMQucVSTKTDF5hwuSW+d4CJvC38DoQCNwdKyOwhBYCkxMeb9ktcT9l5qE
 Ba4elorK+6sunUBcBwkqQaoePVxWH/qEWPzBKocrFzBlHEDQ/fFR8kKxPxiqUO6QYluRsZ49MxK
 PESA29XfLdMa3vnqmSgzgNwucqVAvjvuipeNfJ/R1JytqkgEOxJrDESIhu11tHRgFrUIN3f+q4l
 Lfo94RGI3X/cc7hBgEdpBsK5Gktm8bidg5c13dstlflnf0LCTL+Th8h1nzEd1V4V+YYjcAE4WMy
 Gv9SHxWsRuBiD4ABnMk615EFI2Zgt1eF5mgHGoQWLjJTcLyL/aaRpZausWRuN6i6EZ9UHeH6Y/1
 UWQkHC3WjAl07Q=
X-Received: by 2002:a5d:5d08:0:b0:43c:fc5c:aa0b with SMTP id
 ffacd0b85a97d-4464a632a5amr2874316f8f.42.1777355694505; 
 Mon, 27 Apr 2026 22:54:54 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44639f2d534sm3438067f8f.0.2026.04.27.22.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 22:54:53 -0700 (PDT)
Message-ID: <0692a3e8-023f-43c2-95d6-174659b9cad6@linaro.org>
Date: Tue, 28 Apr 2026 07:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/84] fpu: Drop parts_float_to_uint
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 26/4/26 15:38, Richard Henderson wrote:
> Use parts{64,128}_float_to_uint at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 42 ++++++++++++++++--------------------------
>   1 file changed, 16 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

