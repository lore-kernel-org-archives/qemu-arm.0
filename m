Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D052FFCB61E
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 16:22:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyXq2-0004Ac-Od; Fri, 06 Mar 2026 11:15:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1vyXq2-00049c-1L
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:15:42 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1vyXpv-00076t-Nu
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:15:41 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4833115090dso97351055e9.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 08:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772813732; x=1773418532; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vJBKXDfMOLJ17O6L4XJmaIZKXkUgnXJYCsrzUr4ccow=;
 b=R++pQJlG5GbZpzW7L1isbs1H05aQBohyklCLtqu5LM068wrd//2kXBY7nVwJpTcyoK
 n3v56FTcSILzg51qlF0x9i6UWYAF9C6WXmAUN9QcFqjpqOcYE7T/MGzsxq5AxwiGVfUg
 IGT4R2zNdwB6BaYYf3bPxNhYnZlh75o6r2ZMv8hK2lS71aUO85ga24Z3S/zotiJLfzKA
 TugZaq54HC6Rd53Yp/L52P5rXsW+FP59Y+5HcJ/XRf9MAhnI19PUpwrQYT6iyHUU8Zm+
 sIu7Pu/rpzjpC7OQDH0PaUutR2mjnxo9Q2ViPImEVE/Lzp+N89K+nEPFrfWgj0JsmBcK
 8q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772813732; x=1773418532;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vJBKXDfMOLJ17O6L4XJmaIZKXkUgnXJYCsrzUr4ccow=;
 b=LlZUNgpICJMgsI0qw4VKLmc/MjT5SODzyqKcByZD0i2h6RzTQKrhXb34wm+KnPa5x6
 6Gf2zhbe9E87gwh2zE1o5zTubUXVnQRmNI5uSHV8qLqr+0UvuJEMQ5TrtkqJ4vaW1PSD
 Mc047xygo2gh01upFrpoOPrTA/WmjkqDq2EOFmv85uMhqkyeyhveWagZuoGZu1unOnsQ
 KJ8lfbB74/7ELk1pSR0syiSY1E7urdo4MCJsIU+3+A9bFEVUAhkVRV4MnKq0S+OjkPMu
 osUPmNzi5BSk96q8WqCjs1cfkJO53AdqTxV7ktBCbW+IkSOcLZCdXq+LW8YfuRSGFsbY
 E92w==
X-Gm-Message-State: AOJu0Yx6Oojrz3krp2T1+Lo5zNsMurne6c2aiyjSRwY6azSbC1bapAPo
 2Fp/E6wYM2+3jrBg/PnIFYKWwj1g3g1YQfnOGuQ/coR5HWU58T5YMHCW4S4+pdD2Q5aALJKRAWd
 1fx16
X-Gm-Gg: ATEYQzxvPL2eL0PaIwrkE1WSXuzompaCeQDTDLXs+vL3T/+m0R+87NdMCJsB6gpo0Lm
 XaY4W2dkxt5Zi8XjDBsc7ypf3IG0Na8q3+CeCpCdhygATRcfTjKEu78sJPd2hMn3oyBtOm0OFU9
 ibkQ31Og9bFaeXyxiabnk3hUoLN6q5Uh8mufpjMgYHZhRwP38s5I1ZPyBUZmk0CrzHfxawCLnrI
 8vBDJd3C8LyhcMwZFYSS7AvB/5owk0Kiot2ex2ZFGEDGXgvhXFHkbaGp0HD8Pa1EqtAWsvpGwqV
 Eb43f7JH9qlgonHw6y6APSU/uuhz8LiOzksNTORmhOWYK9FRXCzG25Z9kPl69rPdqPzWOo1IgKU
 r4L6zpSk0AhJFVnSpWoGd//T8w0KDyXYMYBxRBwjaBuplIcMD3UrDpEqj+LuOeB+ifTjiSZxw5q
 v4mRa1U2UryuGIiiNT8ZcoSjolWRs/xq/xCA==
X-Received: by 2002:a05:600c:3593:b0:482:eec4:74c with SMTP id
 5b1f17b1804b1-4852695881dmr45079165e9.22.1772813731992; 
 Fri, 06 Mar 2026 08:15:31 -0800 (PST)
Received: from linaro.org ([2a10:d582:31e:0:456b:162e:d641:32])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485238003a3sm31061105e9.3.2026.03.06.08.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:15:31 -0800 (PST)
Date: Fri, 6 Mar 2026 16:15:30 +0000
From: Jim MacArthur <jim.macarthur@linaro.org>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/dma/pl080: Handle bogus swidth and dwidth in transfers
Message-ID: <aar9otqHQI08k2sN@linaro.org>
References: <20260306152140.2191653-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306152140.2191653-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x333.google.com
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

On Fri, Mar 06, 2026 at 03:21:40PM +0000, Peter Maydell wrote:
> The PL080 TRM states that the DWidth and SWidth fields of the channel
> control registers can only validly specify widths up to 32 bits (i.e.
> values from 0 to 2) and all other values are reserved.
> 
> Currently we don't check this, so if the guest specifies an invalid
> value we will transfer more data into our local 'buff[]' array than
> it can hold.
> 
> Check the widths; since the TRM doesn't clearly specify any behaviour
> for what to do on invalid values, we choose to log them and then
> ignore the channel for transfers.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3203
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/dma/pl080.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
> index 3f8acb03de..6262c3f3df 100644
> --- a/hw/dma/pl080.c
> +++ b/hw/dma/pl080.c
> @@ -164,6 +164,21 @@ again:
>                 destination widths are different.  */
>              swidth = 1 << ((ch->ctrl >> 18) & 7);
>              dwidth = 1 << ((ch->ctrl >> 21) & 7);
> +
> +            /* Only widths of 1, 2 or 4 are valid */
> +            if (swidth > 4) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "pl080: channel %d: invalid SWidth %d\n",
> +                              c, extract32(ch->ctrl, 18, 3));
> +                continue;
> +            }
> +            if (dwidth > 4) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "pl080: channel %d: invalid DWidth %d\n",
> +                              c, extract32(ch->ctrl, 21, 3));
> +                continue;
> +            }
> +
>              for (n = 0; n < dwidth; n+= swidth) {
>                  address_space_read(&s->downstream_as, ch->src,
>                                     MEMTXATTRS_UNSPECIFIED, buff + n, swidth);
> -- 
> 2.43.0

Thanks for picking this up, Peter.

Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>

