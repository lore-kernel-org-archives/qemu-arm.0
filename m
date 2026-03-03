Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6E5EDA682
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 15:13:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxRPA-0008Uw-44; Tue, 03 Mar 2026 10:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxRP7-0008NL-P2
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 10:11:23 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxRP4-0004SZ-Q4
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 10:11:21 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-7986fb839f5so48670217b3.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 07:11:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772550677; cv=none;
 d=google.com; s=arc-20240605;
 b=Jis13CB2b/88tAN4meMPTUmNpy5vAamLpzw8MWqxUKhLluWQPPQvVz2xgrVqy7hCks
 h3kSBqCArXQ1yr5FYPtDwASmq3tqc5x9iczDwC395C2FihFYa8G/b6QNWaFDs4XXC3hz
 gHHIYN/ZzlyG6fJ6Hlm9gtb4wKTG350VlbiafC/b0DUxI/d173jZt8rBeUvE8GPnF03n
 aCKMINp72StAgu2vw3SzGhB/ibpa/yqxN2U47FkwPdtC9E7s3mfZ/H6ucX5xf9nyQ99i
 zKLL4cFh/bLdo8qbtmyTHNmziUncRcWlyFis/Eb0W3ANQdpSFezX2en1xdb9FBCkWaRW
 zvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Nle2FLO5QO+OJp8DMg93RBHmiBQ5xMqtYMT81rPyudw=;
 fh=V9XOC7p/ewQCkq5ow4RXRtn7siWPU41tawiAJ2VfY+s=;
 b=S5FAME4LgB60eVgkq8AS1MsX5pO6afyHdvxb1RtxVn4b6vh1HFp+z0JDkdCdSLTTzc
 bD21PfIvHlPWtE0v1hMOBpLLTho3wW4/eOaXKGElbhxA9v2g5F8+Dy9rQrA7XT4rUmrs
 IGWaCh7rw1wWbM/OTBqkY5Yf0P2lOalkdd0XvXFe5eCbBp6DdCfQlLmzS1sVawb+AQYp
 dMFNfspGn6E2H4u16x53OJEPUWdNGCXxhbHVuSPau57Y7HkLvLI++9ahUJdciA0YFzA9
 UJLKDiDg6HZdLXimltZ4dNEuooGWIYu9qod/qRKKKmqHnt6676pn/UBby1E3RZ3nOXsz
 3jkw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772550677; x=1773155477; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nle2FLO5QO+OJp8DMg93RBHmiBQ5xMqtYMT81rPyudw=;
 b=KjLWpL+Gv2wgoN0GyQr/RNYD3DJvm1ubEArgp03Fx8TH6C6v0CKIwsWAoOVLw9XagM
 lWXyvDKR+kUBzphhGVoKOawgZh0ZvGGwxyu1NoZV8L8QXl+H05aiVOKUhhZXY5FX33Og
 bV0xN9lPrarVHEyF1bGZ8rm8Dx2ctdu0JBy+AfFaNLa/9HL12IB8H5DZ4E45rm7qPVXV
 /OvQX+SFcuk/bWItQY+tvbpRQE9Dm7pQUXMtzMiPxIk06qaoBhR0DorhaEqvYkHa0JKS
 fGuS4WpKDycwtR5xCiOIQvlfsgrI2lzAPH7OIrQ7tQxBL5YfTqogvUr4O/FkeBIWYTK7
 iEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772550677; x=1773155477;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nle2FLO5QO+OJp8DMg93RBHmiBQ5xMqtYMT81rPyudw=;
 b=ADqSz6wORXiZll++3vKb0A7MZaPLnZOgyx7Bscn+jQussvRMgNG+zG6gx2TlIYj+sb
 JK3HogDS54UKyQ1Xwv9Tf+AMVQUohJS3k80cEszA4rTBIUtmk8RM1dJGcXOgg+WAyOzx
 dx3rqLYr+YCgiJINXcA23Cmv/oMGc0/rzfo9iLuvsPVJ5DIgmNXwsbQnQwfjrBvB5r0q
 aURJVV+Dw7gqeGxsmsUlsGnovU1aMAzAyBVaaJH/ZTY3zWgqvf3cvEUYL4LibaXXTQBO
 aT1gsDUrGWZx1CKK2YsKA17Gc7iMdgU+atva1y/rYMfvXIySedA1n6l4st2ipGwrYy11
 TcEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV5IN3WESOXQbWOnX6Mbef35wp2ATIsEugJm0rP/455DJ46BWmofl/znIzOO9VGA0oKhNa0ufdVA==@nongnu.org
X-Gm-Message-State: AOJu0YzZg0rFdeSN24MDooEnfUgPSSOitvW5g4e8nZfUAYZv2bJWNJQ8
 LdyNCcZcJaB3f4gVBSQY8QNOj0e6nl0Y4bm0hrb21Ij+aPs5Q4v+SFUnnEqwOLuEx6ox4g9j59p
 +afm/YDfY5qFZ7Siajo6LZUFaTTcXp7OOJlZntrDTjA==
X-Gm-Gg: ATEYQzzHtIG0OBpAILZhVYgG/pQsrs7XoDLg3UMyYHuzcafqwWr1rYbGGZm3927rmSH
 3qqhrWXWTiM0UyppvnpJVBb5v4tlUqEDJ3hmL3/No7IeWxJpvtqBm25KkOMx9ea90GXOtrfeS2l
 hmPJ+ZvBbnsLjNItDF590l/q/LJX/Hmau6RvAKmA2AuJB3/Cw7uKDlgxB6XDvoo6sQQ4eZlCRdC
 thDdWQOhFQCtBcUpAn+np0CC7m4/Nib0dNU1Qym28aY2ujB8MUysFX5R7EpacJAeXyWcyyb5Eg4
 Scvk8CHqwrlLnY1B02abwBNZLO6LYRJ1817w/xri9SnLc2mztwYFAZwb4hWfzfg0GSs=
X-Received: by 2002:a53:ecd5:0:b0:649:bbf4:121b with SMTP id
 956f58d0204a3-64cc201e459mr10769416d50.2.1772550677379; Tue, 03 Mar 2026
 07:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20260303143928.1747116-1-eric.auger@redhat.com>
 <20260303143928.1747116-7-eric.auger@redhat.com>
In-Reply-To: <20260303143928.1747116-7-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 15:11:06 +0000
X-Gm-Features: AaiRm51vq65CRQcdJKlm7jyFix0xSuaq8lAWEH7xJZvPzSjzPYE_-mUfYAEafAg
Message-ID: <CAFEAcA9BviMjiKKLRPWKgzFST2YeaijaGQvMPFYhfcqRwtM38w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] target/arm/machine: Trace all register mismatches
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 3 Mar 2026 at 14:39, Eric Auger <eric.auger@redhat.com> wrote:
>
> At the moment, cpu_post_load() exists with error on the first

"exits"

> catch of unexpected register in the incoming stream. Let the code
> go further and trace all the issues before exiting.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/machine.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

