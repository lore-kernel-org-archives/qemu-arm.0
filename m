Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26DACD8CAA
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 11:02:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWuDa-0001z5-Qj; Tue, 09 Jun 2026 07:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWuDP-0001wb-Im
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 07:01:55 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWuDN-0005Tp-IE
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 07:01:51 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-6603246b66dso5425263d50.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 04:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781002908; cv=none;
 d=google.com; s=arc-20240605;
 b=AZpdI0KODJIwL1o+CO+c8Xmi4fABSJSYUUA5k7Kx6t8fylg5I0Qr0EWaIHcGz6i+3M
 7erVgwDYIhcu7XzrIsGNFBWpcsfE2CagSV4cfGT/dPGJomUHerJpYDyWcqXYqCiGrx1l
 kn48bxjjmpCpCWjQOMiEAa4MEvFNo1H+rv5Pet8J/sD91KhC9ea6WApL7/lcOy2d9GSQ
 akTVd6x/TEy3LNT7Q8O2elyBvpHQsvz0bnolfwl2zj7/LmuF/g5lH9LSvN9Kc1oHMS37
 qzd3ugEAAlqlWXVtQva9syM6ZTKpl4NRCh2G+sT6tU71d2GXZHBdCdWYRaTvTCk0JHr5
 nSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=IWvx6N/trd7GUv7lRQQJVJ/o7RKzQvf1YBdlMGaL8p0=;
 fh=ItvdWDkvqC5arY5poLShezManql6HrJhqwuPRqXWPIU=;
 b=F4lBkXlkHUl+auXuLvwfRfgtPgaAbWtA69zTz79nKYKPaulAAkMqLMSemosNpw4SXF
 gcYiOUF+dsRSbq4KpdT0Wjlcbw5NrRFWmEF3PIEEqGCeOxPQEbuvjWSkYhWD6vZ/9BS/
 K2Cr++m+29ZV+V8RYwtM8q2XebYnHdwRjAYe/RpkmwZxk0SnWhTtpYdLkz4LZf74KXQg
 tU/MXbciIJGCi9c182AEZRHvwqtNYNPzgk0CYsrbwdJKhyIDPzkgqUra0OU8QmnkRbxq
 L/iY6VW/cVNYRYDJZpUaPtV2mRleCxQZxm3brF6nzWPeDnxqrLlqXYSxjGYqnZWIrtO+
 rwgQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781002908; x=1781607708; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IWvx6N/trd7GUv7lRQQJVJ/o7RKzQvf1YBdlMGaL8p0=;
 b=j982zha9PMd0YJB2FolzjXg8DnxZPgzYM+fNPO2h7b43IL/z1IuRFeFZsbN/oBWVyq
 vrVXgYoCQ6gbuGPTz8Pa/sif8FxanER3ffotZ9Jp3Jz069G7HK01Fnp4nZYfAlG9jBw2
 yFRdK8v5cNiSU2Mqex2hqMSgG4mlhsWWtK8TNkqdPsRWvr+0xdS0yt7oCfsGSl/6gICZ
 PPh+7fIR4sfr1Xxt7ZP44beVKq+mKS9evTxsdfnCxjNKOR1XIXAqy1IO8q+VBjeCCD90
 kYDo+aoDyotgdOOPfXIIqViM4OjPXALZ3FdfuHNaTtDwhMCjIVngQ6oS6pqcofyrBVYW
 TkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781002908; x=1781607708;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWvx6N/trd7GUv7lRQQJVJ/o7RKzQvf1YBdlMGaL8p0=;
 b=lHPs/Sn/IqjYMd1O26D1N94TbKthtC1u46qyuxG3lz8p11s0NJfaoZZxftDyX9zhy2
 Weac+DtjVmkuNpa20R+hXqvqMS07yKu1X4+lveqqPqad7cCaG7odgsfkyaXTmHy5abkP
 5pWt3miS+bNK84YcvUuMLHFQLNXrs2/O6Hmiz67IFGRp9jClNi5dRtttBQGIPC6Hd4rP
 0cL+drMBv9jFt4ThLuyi8oH8JN8UhSVLLke/y+HwkBfOjIfBijWfevB+w9ibOPTAdF4A
 Na+oSQb4GvFAG6e4QP3iPLtnIdL4L1R1c4coVq9QsAxw4fTSnm58O4A2RNqU4rPPxyaq
 bCpA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/JqvLz7V5KLtwc/w5c8AINGUpVJALA1J49k37gx5v+FP9x2qhOf8i9lqFdgTmNAAy4BeJ2ymIzqg==@nongnu.org
X-Gm-Message-State: AOJu0Yx77pmR4LvueC0W/J3ApFuef2h4/N07uRztbJejLxnKxA0Q1mWn
 dXwMq5KsQSjicytUh+P05yl6Sf8OAJso0VaNCr3yVNvRzdX3L98HSukjOZ+yec7yIC4FQ9KfmIz
 Rv9CdeUXgetct4pn88rr5ZNrx/522Ma+DUCtYUHz2uw==
X-Gm-Gg: Acq92OGuWIUHsO9bsnjcjSGbKUPePKfqOpOl1ESdjM/JXDcpJh0sxczfZWzFTo/8C1z
 /Z8+U3SOVeiX3YiRVREn858x5LXkkTvShYXq7l1MFoEvn450c3mHRJAjxV3Od0iHdJ5baGHnFEm
 cJHVDDl4+l5dWKYSQMmxdxjMpCZR45qFneD1yGuPY0KL2cjSb3P0xOl3TmJAKXc42ODx+ektq+D
 K1kN3PdYoqcoCYTV2s4XK12zlE/b0T6N+UpLiHOXMkJ1LbXMV2Hz9TPYZiuYh6f2Qv/dp1hPkZY
 jpMyWwLVUE+KS3nnKZCG/LCoAtZbWkuv4dVK1sFvqBY1nj0Hcdg5nd/7FGpeuHQtNJSZlOt3Oeh
 ix9OcN8NlfAzk
X-Received: by 2002:a05:690e:140d:b0:660:62e5:9300 with SMTP id
 956f58d0204a3-6610779e02amr17201153d50.48.1781002908052; Tue, 09 Jun 2026
 04:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260609105626.1038690-1-thuth@redhat.com>
In-Reply-To: <20260609105626.1038690-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 12:01:36 +0100
X-Gm-Features: AVVi8Cc8oKQrydmGDQOBxXvHxwWMlyhEXLAqM4JoePjcSpmZv054gl6whVUi45E
Message-ID: <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/pmbus_device: Fix a possible crash when requesting
 too many bytes
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Titus Rwantare <titusr@google.com>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Tue, 9 Jun 2026 at 11:56, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The pmbus_send_string() function contains an assert() statement that
> can be triggered by the guest code when requesting too many data
> without reading from the device in between. This should not be possible.
> pmbus_send() already has a similar logic, but it simply ignores the
> error after logging a message with qemu_log_mask(), so do the same now
> in pmbus_send_string() to fix the issue.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3388
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/i2c/pmbus_device.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index b1f9843f52e..6aa608a2998 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -104,7 +104,12 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
>      }
>
>      size_t len = strlen(data);
> -    g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
> +    if (len + pmdev->out_buf_len >= SMBUS_DATA_MAX_LEN) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: requested too much data from PMBus device\n",
> +                      __func__);
> +        return;
> +    }

I had a look at this bug earlier, but was not sure that this is the
right thing. What happens is that the guest does something that
causes the device to queue up data X ready for the guest to
read, but then instead of reading it, the guest does another
"I would like data X please" action. My guess is that the way
the hardware handles this is probably not "add the second
copy of data X after the first one". Perhaps it is "drop the
data the guest didn't read, so the next guest read gets the
second lot of data, not the first". But maybe the spec really
does say "you can do things in the order 'ask for A, ask for
B, read data for A, read data for B".

I couldn't conveniently find the pmbus spec to find out what
the hardware is supposed to do here. We need some input from
somebody who knows about pmbus.

thanks
-- PMM

