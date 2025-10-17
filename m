Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0FECCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:19:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kKS-0006IX-SR; Fri, 17 Oct 2025 09:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9kKO-0006Du-3G
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:17:04 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9kKG-00063E-A9
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:17:03 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-63e0c6f0adfso1974962d50.3
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760707009; x=1761311809; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7TPU5XqP3DgREr2vUJwqsd5twFBOrmveHWArUFDvCoI=;
 b=SjhF/+SOXpAJZsQDEj4ZnJxOHWRgsaWGPQ1BhwXzkkCAgeEW3bz8ZN9WyjpaLn4h95
 JjqjyzUchhZDFeaw8NWilmxSq8KVGcl8W6Dq4/KwCOHDNLyx9XqPxTVaJQ2+pJbl4VOU
 /lVLAHu0xEazi89MMpd5fySmKWsre9kXLdf6rIJx43Jk0DW+qPGBqQt1MOiRxQdTthnO
 WYuxDCTKZDlGzm27UWmxs2KeY4b5ErPcW8wdl7w9voL+IJ6j3iu32LWUbwMyeKadaQ0a
 j4PRIzQ6+16rE8QqRXsWG0P2F4cjWNcpFzmRLs3JnGOC93GM/PomJ6D+lST9MjqqTF7J
 /Gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760707009; x=1761311809;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7TPU5XqP3DgREr2vUJwqsd5twFBOrmveHWArUFDvCoI=;
 b=av+XYeo1M/D6Mdo4pR0xaa02LP1Wlgp4GBLewleLwQENxC1GtUdbosYHJJJun5dSV3
 gMMdDFs7q4GpdjO7o3tUEN/97gEFUs3qyCAQypBJrOyFnvX23VQWSz8eLIPdk5fXopuN
 4eZS4Ar2UxEaGZu920qnJK5UdB3ti0j2SEAdEk76+F3NUQ2CNy5xJ4W2jWR7GgG7XzGo
 1ggVj/2MDLZrM5Z4w62WoCek1oY42to2m/nKiOXhhRzG2hwu/PEaacXKtpS09FEtTCc0
 rX/aWczbIGEpN9jm0TqrERe4xbOSfRvRPh/jI5f6/rY8m+ghHgxyKKG1z9Ckv1mvaWXb
 jGgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTgusHHepX8rgfYzSh4ng2FZae9dDRkLHcluIMnPNJJ7/ZtyCzTYFRRTv3gupfAT98TGO2ToMKbA==@nongnu.org
X-Gm-Message-State: AOJu0YxSHvXwRdLfapF9fKIQLHIS4ZpAihtoQgdz3L46Ks4yfSUDij5h
 JSyQGOTqzLyzyaqguXN0BjyYS4ZzfvaZEiWgkGPer6SGEVEVTGQQV+qrw8v25x+rH6pRKFls82H
 Jvtuc2FrCTAr0A2jvomaqicEul21zXAvFMGmhnU1qZQ==
X-Gm-Gg: ASbGncvjIuyuZPZQVoRv0QNUkq7rQnm7E5wjE/Kfl6vtSK4AJ63Rp96FIpB9Z1muCOX
 9Cvjco5VW2hWhOBT7XSVY0RuiPCkQ9Bs+NMy0jkWmveko5R6RjvMsQMn/waVkkZ9R100Hgm+T7/
 089df9Y0A9RQzCeWInwJyGKapeNeBiylYkbhkvNjy9YxNkKnRwrd9yXlEb7GBy+Hf1pZjPaPB2M
 aZsVNQJGDvsu24OhpDqtA09Xrbxj6WaMZyQJ4PJ0FR85iFWc8n59La2ZGdekg==
X-Google-Smtp-Source: AGHT+IHwySxUilY92HgXDaux84iUgENGKAIJAHBXR0V+ON2rRNJk+W0Xo8Pm52WGJhpdIKlLwlsip11NJLkiJRfbuE4=
X-Received: by 2002:a53:acd1:0:10b0:63e:1ee2:eb12 with SMTP id
 956f58d0204a3-63e1ee2eca8mr945659d50.23.1760707009646; Fri, 17 Oct 2025
 06:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-10-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 14:16:37 +0100
X-Gm-Features: AS18NWDpYkVCRIj3ds21V59gW47gXG4-rIpsqOQH9vIE9rVvvij0DqbY2vp8krY
Message-ID: <CAFEAcA_DVB6tdyLjHn6TcwKP14-gSwGyzjmv5vDZJbmYLVY+WQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/37] target/arm: Merge arm_gen_one_feature_sysreg
 into the single caller
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 14 Oct 2025 at 21:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/gdbstub.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

