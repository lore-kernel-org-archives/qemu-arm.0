Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1519985njf;
        Tue, 3 Sep 2024 10:04:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2WYlgY8iaQe2ZuctrlLi2YPAYMZsAI2fdIp56ZQs639z+zpiCbqx6G86pTYXs6ht4ogbI+iVIWaHkpg==@linaro.org
X-Google-Smtp-Source: AGHT+IFMkp0SRhpkSKRh2J9Z45/Yr3MycmYu6KoWFX3HP1k23+6ndAdDNhkyc2yxQ8TlMAkkuBz5
X-Received: by 2002:a05:620a:4010:b0:7a2:d64:1bbf with SMTP id af79cd13be357-7a8f6b7679cmr1480533785a.1.1725383081820;
        Tue, 03 Sep 2024 10:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725383081; cv=none;
        d=google.com; s=arc-20160816;
        b=nNlJ6BBS/hatQ9zcGtVZ/wH4OHK9+vP/P90hVVfeY2Hd4hf+gA9jzM1ZBzqZl6E1CR
         fOncM0xPX6ytbZBJo7LlJCFlYFg2InMIjJteFg5Lb+p7ZZrNYTnOtliTGkKmXKtJx9cA
         idy152tOHUIlnq/eH1yrPlAHXRqWYdnc15yBvAEoYEOTVAosYGYxOI6IErqbjwHyvlC6
         Gc50mlg/2NAYpa08f6kMfEXe6CLZNG74CYb2JJwHMn24DNxbbJy7TkMI6WsuCV1jxh69
         BXQJm8lfyF2Qkyc+GJL8DUxwLO3Z0VUJDmYcG9Nl229RYg7kfLD8dgMmNfnOsHTtig/K
         Ki5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SzD5+zVDqSDxG8DuYOWElnkzoc20vrPEEDM4mF8RX8s=;
        fh=9D19eF7BJvJCRJEfOUDGN36+uYI2HR83VnGNvOmS1Lc=;
        b=s/3XMlestBOZl+e3ZdG8cJj9NHi2u/OmOEtcNF0V+66waRR5xDbxKVPqe3+kn4pTr+
         2SE0c2dVrclgiTorlbn5vZAVyNPCLNjDtYFu2e/+30VJoY+ndGFKSqqRXwU3ZHcL0CrL
         7iyxYvBOz+ihaXqjskGDZ83ZvGZsJ86LEy8xnEyPwrYfUmhK7pYsH5vUBRAowJPPMEyb
         segG6Yt6Xfx9M6rnGRhH7D0UX+x93Hxn+uYjgCN9+hA5TTU3iVjX1BWEPQRiq/UkK2b5
         ddScjiFbUXvYguFeMxMyjjMSkFQjzeSrlnsPC000d/uanWgeqw5W6on74Aex7bxS/FOA
         zYCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tl0qxFb0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806d848dcsi861662785a.450.2024.09.03.10.04.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 10:04:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tl0qxFb0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slWww-0000c6-2P; Tue, 03 Sep 2024 13:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slWwu-0000WN-KU
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 13:04:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slWws-0001ip-9k
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 13:04:12 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-367990aaef3so3304541f8f.0
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725383048; x=1725987848; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SzD5+zVDqSDxG8DuYOWElnkzoc20vrPEEDM4mF8RX8s=;
 b=Tl0qxFb08jvcQA5jsW0+J5IEr6i+0I486Qt+9daDel8nx95vEQnv5S7vm2COggLZyW
 WcxLFi1XnKEThhgVd1b7W6h7W7BHIV8xwvs+E+cEip1VqvLBt5SSqyF3AX9i+tUifeUl
 GuPnwtayYdWxSJfPpRJ0eOKi5aYaksieyZFjRCd5XketkrZE9hi4JdT7HVgLgxHV+t7B
 B24axvCeRe0wZDeUTHhBqC7xHbKSztBGk3q5/yO30skM60mZVf011JrGqsvsH/WRAQ/4
 JxeqOZ13+c2/tH5MQ+QFTUcUkuVE4G0lDPEs/7Z1SaiA35ZKqGwMpbZxCIKW2ibZaNZV
 zyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725383048; x=1725987848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SzD5+zVDqSDxG8DuYOWElnkzoc20vrPEEDM4mF8RX8s=;
 b=hrj/o8ce23/WGbMkIYONpKWQZcfhaOgW1OlhKhplU8er6jTbtYal+DWkFFNIUS81Fm
 UvF74Lm08xAkMte+wmajWEsGUgsXStmd1zl5nkX+tUBwZ/wt2KXtn+uSz+4eTckx3ZUe
 dSKwu4B/7TBTS40gQ7FbFqDRyTYUffd3JI0JAHz5+nhk67DsuABUOZhjOpRIPcYXmmFZ
 OF3E9Q/e+23bMNiqN7tQyOcp0z/H9Skb+eJKX5omNoB0bvU/b+RZaAkYHysCSQn0sx/Y
 e3tH7M/MLTNwcdqdrk/Bt2r5K+8D14JTtzMpdSuwRYoVhxS+UGFGJDZ7S+k88CrWgQUM
 pcwQ==
X-Gm-Message-State: AOJu0YzBfS2Dg0xPrR/okD6V6iZ85QxHqXvcojoxh2SHmxirQB3k9RRw
 6u2TAgqP4KOZziQ5Yo7RWjajGZQMAaQXMNNcPf8bDtD4wDh4fk9joL7K0t/7okvjDhkjwcGE+0n
 pLKZWWOmTODllPd6dBPxm3CWzjr9tykDT5TGHPg==
X-Received: by 2002:adf:e2c6:0:b0:374:c671:2324 with SMTP id
 ffacd0b85a97d-376dea47305mr1124877f8f.44.1725383048189; Tue, 03 Sep 2024
 10:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <762867ba-8980-44f6-a9a6-5e766bc6a60b@redhat.com>
In-Reply-To: <762867ba-8980-44f6-a9a6-5e766bc6a60b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2024 18:03:43 +0100
Message-ID: <CAFEAcA-uTqq9Ke4pS59aQ_9t7KObRxff8DN_rY-2JkfSCQkASQ@mail.gmail.com>
Subject: Re: [PATCH for-9.2 00/53] arm: Drop deprecated boards
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: 564VJq/lU62f

On Tue, 3 Sept 2024 at 17:55, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 9/3/24 18:06, Peter Maydell wrote:
> > This patchset removes the various Arm machines which we deprecated
> > for the 9.0 release and are therefore allowed to remove for the 9.2
> > release:
> >   akita, borzoi, cheetah, connex, mainstone, n800, n810,
> >   spitz, terrier, tosa, verdex, z2
> > We get to drop over 30,000 lines of unmaintained code. So it's
> > a big patchset but it's almost all deletions.
> >
> > We have some command line options which were documented as only used
> > by the pxa2xx LCD display driver: -portrait and -rotate.  These
> > allowed the user to tell the display device to rotate its output by
> > 90/180/270 degrees (and the ui input layer to correspondingly rotate
> > mouse event coordinates to match).  I didn't realize these existed
> > when we deprecated the pxa2xx machines -- do we need a separate
> > deprecate-and-drop period to remove the command line options?  (If
> > so, I can drop the relevant patch from this series.)
>
> They are not specific to PXA; PXA LCD is the only one that supports
> passing it to the guest, but the logic is generic: if (for whatever
> reason) your VM generates output that is rotated, you can use the option
> to rotate mouse input.
>
> It's okay to remove it without deprecation notice, but also to keep it.
> Your choice, it's not a lot of code.

Well, the documentation for them says:
 -portrait       rotate graphical output 90 deg left (only PXA LCD)
 -rotate <deg>   rotate graphical output some deg left (only PXA LCD)

so the original intent was clearly (a) that the main effect
was rotation of the graphical output and (b) that these were
only effective for PXA.

The PXA display device doesn't pass anything through to the guest,
by the way -- it just draws the pixels in the guest framebuffer
in a different place in the UI window. As the FIXME comment in
pxa2xx_lcd.c notes, this should really have been done in common
code, not in a specific display driver.

As we both note, the UI input layer part *is* generic code so it
will do the rotation regardless of whether the display device is
also rotating the guest output. But that seems to me more of
an accident than an intentional feature.

I don't care very much because there's not that much code
involved. It's all separated out into patch 24 of this series:
https://patchew.org/QEMU/20240903160751.4100218-1-peter.maydell@linaro.org/20240903160751.4100218-25-peter.maydell@linaro.org/

-- PMM
