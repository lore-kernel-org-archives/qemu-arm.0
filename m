Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1830360njb;
        Mon, 14 Oct 2024 05:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqv7PfSDjHph7XrNIGcB5Ninxe4fR1YlupCracAde7TvkAl04sUYadszi/S1xYC4ZO3xghvop82yT8mA==@linaro.org
X-Google-Smtp-Source: AGHT+IFjRQHA0eyQ8GRWjEXBYooMEFQDxjSRod6Igm7UfkiTVxEQyUUhKl9tEsgt73EbAtKMCuU7
X-Received: by 2002:a05:622a:1f91:b0:460:3a7e:a8be with SMTP id d75a77b69052e-4605846c4acmr158750651cf.26.1728910394611;
        Mon, 14 Oct 2024 05:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728910394; cv=none;
        d=google.com; s=arc-20240605;
        b=OSsMOQ3yBuk13q4bRvpvM+fcLu1hY8oAorAYXRXTsHfEUwu9HsaDoXjaQdQuwbguiA
         vrGOfun1tTGdL78xVi3iO4C4/ry5D06EkycGGDvXvZUCCI1nUyCmsM3GPyLdPbGhi5LI
         pNArmZ2FOg/wzvsdjkivo1SIOOzUZgxvRS5DuMAYL17CFwxg4C2+7PU+jAHC6R5oXWfR
         FZ7ki12xhTcryLn/wbEulIcDLmi0FirrjilR2g/j56kWaCjqxeHRGeGfx61K7eXQbdoJ
         3p9yB7Ba/I2IvE7Th/ORwBu5qpbqntbnkStz6CjAXDUDZtWBmn6lRFNEodp5un9/sH0j
         C7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WVXDycQUZRrNMXnJ7zKhQ1aD88B9Ro1MR8lFeX8DosE=;
        fh=tNFroiu15YbqE9DrTqXhURly4QnQ60QScnmnFILm2ZI=;
        b=EyQj7cOLtrxgNwHDSH/fGrY1byz63zS9pq+voj73ot8zNQ7hjiXJ4FtCBDo9Pn1kHP
         1FYT4EjeCs7OEz8ml2tsc9mqGynw3FxLphmnMXV9bD0l2UGnJHJ1AuyVM5uSBr9+WL5X
         qO2PuAa0sxtb7+/lpeB7i5TyZHj2S0VgsHr/yZwy7FIEKIa2cLvHh3bCcZNS1ZCKUAtV
         hu2VJNjBAvCvaY+EuNA9lmJFSYh5awBt7RgwzWebsRQLPaPDionRCe3kwqKej5ysahpO
         6WAQW8R/0CESts3tWFYqex0Jg/NRwMQk2/QGPawUiVZqbGC8w6HRDPDHMmGPA2TJiSD1
         4nkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j33zmXhH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4604288378esi101460861cf.336.2024.10.14.05.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2024 05:53:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j33zmXhH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0KZR-000469-Fy; Mon, 14 Oct 2024 08:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0KZP-00045t-Un
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 08:53:07 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0KZO-0005W0-Bn
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 08:53:07 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c94c4ad9d8so3917251a12.2
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2024 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728910384; x=1729515184; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WVXDycQUZRrNMXnJ7zKhQ1aD88B9Ro1MR8lFeX8DosE=;
 b=j33zmXhHb8xyKdFUVTEMaBg+GJ7RbDgshEVdCaQYmGqvlO1Qvk+zm+L4JvdNVxHZxZ
 cwZXFsfiKQuOoXV/pi2AKOXg6vMUle9IqHPwA/D32Eq5DAklLjf4mYIpGAcS/9Ri7GdZ
 /96JK9ZHmXTVDSC6YcO5jZ+X3cG/2Nwqc8YE6YgHFqPEoVKYDs+AvyfRSk8ux1RVuVP3
 qealj3IqVOZ9CSbqVpYlGP11FKHHSufMK2r1PUSHNip6uLyyMOSEmAC37OsOu9pXST8J
 uhSHO3rvN8l/lvihK7BeW40EQZv0gkNCrWFHffE4woX3jWBxQELwY+T5/DKjiDbZ0+YP
 eAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728910384; x=1729515184;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WVXDycQUZRrNMXnJ7zKhQ1aD88B9Ro1MR8lFeX8DosE=;
 b=ZexhugRnKUYO/Y/uxiyWqPU0u27/qe4WkUjJ8wdW4YDmHdxLr+qrrAFfS6cw/Wx5x2
 hdAVIS+TQXMC8CSxbDbTMEBEkx+OC5AQktbLwe2NL2vT3iG8xLxQPxSnLT40JOkEP/s3
 6uI6gl7o1oLDkdT3bFKN6N6dhx+u77cfZKDLUaeOdvF4AFpPk1iGXgqgeyuhH5eqpMj5
 FhNN0gt/d6bxN6kZRKq40KVPToK4sOEbibZVsPHflRdfif5Uh9ixcsAXUfZ9zyGlWdlO
 mU7kjH1iIH6GtV3SqoCDwlnyGB5ThBsXMGn5idWo3ilyi0jzYgnhrY5XGbzgXw6RwCP2
 UDqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeDMOLAwwuH3cPDM5Cx5i7Xlz6ef5+3SgNI9NHx7u9AfkR0MiI/210j8AEN4EFvZzDt3Px8/n4lQ==@nongnu.org
X-Gm-Message-State: AOJu0YzqO1Fe6uBg/JQvq55+LoNGoSP4RIjj6jm33hORi8jgM0/JXu1+
 ShXZxp1aZXn9at8cABx7FxW+8J6DqYvb3RhAyrc+5iVxM3Saru3eKCAlPP3PXcHNjji9W+g73T/
 ZdGZjZSHSQ1WzJc7rDxjgkRrAyX5pk5WspkeTww==
X-Received: by 2002:a05:6402:13c3:b0:5c9:2a8c:8961 with SMTP id
 4fb4d7f45d1cf-5c948d48286mr9182269a12.22.1728910384267; Mon, 14 Oct 2024
 05:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241005205748.29203-1-shentey@gmail.com>
 <20241005205748.29203-5-shentey@gmail.com>
In-Reply-To: <20241005205748.29203-5-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2024 13:52:53 +0100
Message-ID: <CAFEAcA-qhDAje+Jv3gR=B-vZ2cJ7FaB+nf9Jh_t00n_7OL3nVg@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/net/lan9118_phy: Add missing 100 mbps full duplex
 advertisement
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /Wlp8296Wdkf

On Sat, 5 Oct 2024 at 21:58, Bernhard Beschow <shentey@gmail.com> wrote:
>
> The real device advertises this mode and the device model already advertises
> 100 mbps half duplex and 10 mbps full+half duplex. So advertise this mode to
> make the model more realistic.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/net/lan9118_phy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/lan9118_phy.c b/hw/net/lan9118_phy.c
> index 1c2f30c81a..4815a4da35 100644
> --- a/hw/net/lan9118_phy.c
> +++ b/hw/net/lan9118_phy.c
> @@ -145,8 +145,8 @@ void lan9118_phy_write(Lan9118PhyState *s, int reg, uint32_t val)
>          break;
>      case MII_ANAR:
>          s->advertise = (val & (MII_ANAR_RFAULT | MII_ANAR_PAUSE_ASYM |
> -                               MII_ANAR_PAUSE | MII_ANAR_10FD | MII_ANAR_10 |
> -                               MII_ANAR_SELECT))
> +                               MII_ANAR_PAUSE | MII_ANAR_TXFD | MII_ANAR_10FD |
> +                               MII_ANAR_10 | MII_ANAR_SELECT))
>                       | MII_ANAR_TX;
>          break;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
