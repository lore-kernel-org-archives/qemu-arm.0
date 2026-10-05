Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25756CA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:23:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfqh-0008TK-1X; Mon, 05 Oct 2026 06:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xDfob-0003PR-20
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:21:05 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xDfoZ-0001Mb-ET
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:21:00 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8ac9d666d4eso13187157b3.3
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791195654; cv=none;
 d=google.com; s=arc-20260327;
 b=FJ/OBzH1ihRv25rCspsG3Ajri212oSzdlZc65/nOF1IbBb+izliEdBK5GvNR8pE5fg
 mOpAjwX90+75qq6KPcXmdgQQFxO4eaR5jBq8Ow6Xfy0fBHqE+LMzXhqUcAsf4W3FAQTy
 46DHy+KQriuHFMoXnZs75z543QTQ4/eEHCU9T1WunzwUhHPl6FSUoxOo63rlU9SgYINE
 U8npuzA+Zli+ER5L+RRQx4tySGNM226oHUHAVzlu/+pflqTrtAXdStgNdv1EVRpJ8K3y
 kat+Uq4/0u4/iT6x1VbXkk5ss8vyOB3Gnrejg9vzmy3Xv2AHf8QE8UDh83eEccyZ9NbA
 q+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rsICQAjWvmy+ljjVOj/7u/Nn9zIVoBVRDJL9QHoTuWU=;
 fh=/u4YkHlf5TNbFl3sSu2CQL+y1gOWWAKKJkfskBUaz+Y=;
 b=I0Z3XfahaGjAAysv93cOGLkaWPdRSeAGe9mAAAic7Jqx+UAxrLNhqFBC8VmyFBNnkD
 ULlcVf5YSHP+rerF4khPdpcGrqkznKvWFNoPcu2MXeRmUAZ1eOkU06e0zmsPT79IIFx/
 bkmAzzsfjRl546jvOi0PpYVXYDUU7XoMCoRZGr+p9S2x0gO9N+qGdjmuH+/ulxPRaWT/
 ZeEhtEgJglgUeKzoBJD/riIoIKW3r8WRGUaeoyd/MaqgppobQCJPIZxF1+xDBS9uNFC3
 GBu8r8QRLAqCQVmK4uNn2dJcuezIqN9dmqdfeEesKZ9gjKC97fNPcqLo/aQNGsZtUjyo
 wFvw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791195654; x=1791800454; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=rsICQAjWvmy+ljjVOj/7u/Nn9zIVoBVRDJL9QHoTuWU=;
 b=Hq21dVXv5so2WaEr3y+PDhJqcQo74tn2VjreaM/yjGphhI7cQ9HYIy/1UJzz003nw/
 j00c10hxjluT3gDkOR+Bjhf/0P0gTcB0m1W4C5GVxZoq18pkzPRZoCpbJFbSGuvVyWko
 DZKgj1e9dLqshYUn13+xX7dnmiU+w4Z5UJWpQMhIpQLdLMZvaSqPSdi9GmOnsVbqA5NB
 dhDzEE5ZPXukZmuSWfnT5vn5wRMH+EkVce09saPoGatJCO7YRtEQsT1zXd9k86HB3FGV
 1/zYvMpn9pwmW+ArqzG0owQwvvXaTljQpjStgnMi+kSBgo5s0fViNuSIdUVSQTXWqMjU
 Mbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195654; x=1791800454;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rsICQAjWvmy+ljjVOj/7u/Nn9zIVoBVRDJL9QHoTuWU=;
 b=ZSm0fqjZRWy2Zvmr/HteSltGxLpLAjZ8fYaK+snlU9DDa3z40fNk7HnInVw0beCRMx
 LunTsz9UL3Zx/PgffLpk7YT18bo34j8B0y4Tm5WwUq00wpKkTDaJk5GMAdV2P3HNfBQT
 u+LjF0QlPMUW9qf9VNQjGStyT7caEj/0/dEIVR4WU/xbxb5qD2gTJBvwps1Y9Dbjmsn0
 SNJerXcXz0nYjyCGOS4Fw5M8MiQlvlEK7KKxxSLnasQct0hu7+ycnhIglD22z/AjDhFw
 QNvtW/TL26lvMIbf9pOiRg7KQoCqhxxnIA5BKTbZzFj5R5nnFFrC99fzZdLgdtv9BOsM
 XE5w==
X-Forwarded-Encrypted: i=1;
 AKwUvByxWq/hApO4KaCybKxZcGr8aWs0FzDGcbU8d9R5KaQ+hLp8pahC0f8WCV2V/np0phLohY2tCb9TGg==@nongnu.org
X-Gm-Message-State: AFq9FYK9Uju8Pr5Nw8J5UMGn6Cb4++9n9/g+ZfUNojRo5JX30lHvkZn8
 jMLdGjVARVnqvfZhugdAj1Rj8qIdqZvc34/Zfg13IFj25ERQfjZlIYVn2aTX1OSm0ONNMIpAZYA
 FCzJ0WOzluVbOAoiQuSfBSkwR3kbkajUu6MuJcv4qXg==
X-Gm-Gg: AYBFou1Awx21uFeKxedUlbXG3l9jGREZb3dltrgcOJnBuHratdRnMWLUaSl5lbNZCT7
 +ApxWV+uDax6xqneOt6Ecz0mR26nnVhMjBFp/gVYqpyrlZFFyvaRKAz8cjOhq2i7XhjZyCZwH0T
 jIqRcwfd/VJUkzcoZwhd5/q6tHwbJ9t06rPEnIqA37tSTHfBxksaLhHHTzZOgu7MS3f0iKygCP5
 MzExP72ATAqs+0JJw08p6QzLP6M6tCPwx+9vwcjOgyWdsfb2SjETO/5cGeXIW5IAOiqt3340efy
 e7Sf+9BG+EfcD4c2ii9/OgZCQlNVpyHlev7Ob65bOqIxke5zYSb0EZ/0MTSIFQLcW/X+VGMt3y9
 vkBRXaTxn+GUbusuQLJyuMWp8mfuKfdXlLoQPr0C6nQbhGtP9OA==
X-Received: by 2002:a05:690c:c013:b0:8ae:8021:568b with SMTP id
 00721157ae682-8ae94cecc2bmr15640597b3.55.1791195654441; Mon, 05 Oct 2026
 03:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-2-shentey@gmail.com>
In-Reply-To: <20261005101800.10821-2-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Oct 2026 11:20:43 +0100
X-Gm-Features: AclHuK9551smn9ZrHUsIL3a61fGpmqYiwQpUymJOV1A6pTNNN7ZfrEZP4Hoi7i8
Message-ID: <CAFEAcA9w+7kWh4ikMkiRio1xw9iH1OASiK2-NMGPRqLgTOJy-Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/31] hw/watchdog/wdt_imx2: Preserve own locked bits
 in WCR
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org, 
 Bin Meng <bin.meng@processmission.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Mon, 5 Oct 2026 at 11:18, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Apparently there is a typo in the WCR locked bits handling: The locked
> values for s->wcr must come from itself rather than from s->wicr, so fix
> that. Without it, guests such as u-boot may experience inadvertent
> reboots when configuring the WCR register.
>
> Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog
> support")
> cc: qemu-stable
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

