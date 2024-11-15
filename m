Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1125655njc;
        Fri, 15 Nov 2024 09:26:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXE5dU1NXx43auN6sCJybUCNLffgsRX2l+gslzMOSB5rN5jJ/DjS7+roV6NIUtRqnp2TpEei3g+w6y41g==@linaro.org
X-Google-Smtp-Source: AGHT+IEQ9VN9wpmEaP/SkHHSedt2A6SRpLkq+v1TCnh+XMqyQJMqzCm2fBwZaLuw8/BUer1GVSth
X-Received: by 2002:a05:620a:4542:b0:7b1:171a:5abf with SMTP id af79cd13be357-7b362313b03mr320928785a.45.1731691590753;
        Fri, 15 Nov 2024 09:26:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731691590; cv=none;
        d=google.com; s=arc-20240605;
        b=fUz31+dL0ED9ZoaWrJdcKOnohMrcGU98/kQ7uYjxFCDbT2NhH/Efn2+8n5MUp4JqlB
         ZFfJWo8YK3GndVQrH8aKyI08qS0yBO3FccK86gDZhFkujA+0JOLoi/1YD8Yd754GaMlg
         WUyqzGJ6CpcXozxhekuDuKEdR1jPjq2Cg7Bw4v3+aU8QjwEVbj/cFXcBOYWjjygECQ7j
         TKC9Q2o7NbiYWMn7ATyvIXgZYtyxjkMZnS6M+5+gVGC+iQQpFLpFk1tKgLiHa3W0SYE8
         sgTI9KIcrRlsPW2RWZ3JrZvlC5rN+UlinqUnyK0CBAYqfpGbFX/4K1o9Es77+PACA2bX
         8Hug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Cy0bpqhYABl5xQS0sS5/3rdfS2dftArPARrYrzeGb04=;
        fh=RIJSHWIsLcix4D6ssFbFgcHcQSapzfOdZU6/OQbiegI=;
        b=YyxzHbIvOOA552hRk2dYbOJ94h7Rc3o3vbB5Jt0i2ZJQtao9+b0dwo3HLtqTHZEy34
         3Y9KfjZONTwXg5S2J0wmKlt6g0hbyuAcRfAJTMEMaDKMdLX5jSSH1iky32g6JWRL+H5X
         WsqvkZHsE46N92oPKyP3FY1iy8yHk6GNmN36+6ORvROcNIbHeUHfzKXy8Y5Dnykgi1fK
         lpYGKtml7OywROzt6YX6O1spHKPibTcRwV2kFV2p93AMKByfUWQD65H9UOL5IQh4BRuz
         A9D7JdyIYOZ9EHb4F4Y5EOW+xStORnKUZMFMKvgwjo3L7xH8e8+gpKmbMQDZBSUHW88p
         Yukw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J8+pYP0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35cac6788si399053785a.543.2024.11.15.09.26.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 09:26:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J8+pYP0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tC05G-0004WB-9q; Fri, 15 Nov 2024 12:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tC055-0004Rk-IR
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 12:26:06 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tC054-0001Yx-6e
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 12:26:03 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f804233so1400328a12.2
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2024 09:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731691560; x=1732296360; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cy0bpqhYABl5xQS0sS5/3rdfS2dftArPARrYrzeGb04=;
 b=J8+pYP0tSZb8i5L11YZaWyC8cHEB6fzcN2PpjrFoYHHO+HED5WJO+G76Ic1IwwX4O7
 ZmbQ0AXq82/rWwtjsdL45mfzgt6Ia5KsjpkzM5Q2QevYGRMGhC+1IoQ+Vvh9TknZK5Dv
 rZfCC9ZwAJH1/lW+L/c/WlTqnpnpOoNJX4jw+NGYkvtyfZKU5k7r8sZO/jTKRy2BY/I/
 QdeanMEohABNi2mV9Y1zGwlTIzM+i3VfqO3+pgXadgN8g+sBwNIhHxqW8qtHOLQVskje
 0Geh+y8pYhOEvVjdIJaXYCDvW8dNEQS4smsEyPHpdJ8/MnlZeLkxEvSs2XqG6J5j7RSn
 eM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731691560; x=1732296360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cy0bpqhYABl5xQS0sS5/3rdfS2dftArPARrYrzeGb04=;
 b=euUHZwlzo8KWVq2xLY4wug/KOqdrSiXp3wKJ+iod5RivdF1WS85dqfEXNk7cuRUKt3
 uxmCFtefqUXKZBSjrn08MahpOKXK0PCj3AQ1X1ebz6eiEbiEgCAhEEwRphXG9C5+X5Nt
 +lwzkIsXTJbTJ8L7wozEWWdKpVdHG5+iRV0fQFaETSaW5YAN7iYv88kMcLfuACslUhwC
 3RpAbZzcJC3fi+T1G4SY9cvbLuGqMzIx4tJXKwTkm14+woHsDuHA9l1Z3t+viqUZyBtq
 ptg5n65brj5VJasBW32xL78JTd7N2PxQGwmw1yvlzuu40JzUIYBmf0F4SMk9Lsf0qvsd
 U10w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3eWuQeA5aDNrzvtjZhDRFt9WL2JzY2lKJn/AsOrmXd2pW0VAv9kBOtowVCfMOLZp0qyb0Lgm5cg==@nongnu.org
X-Gm-Message-State: AOJu0YxX3UvjcGzysynYQ3BcvyaDHFcpFT2pc9n9ZvL6qrK3epZXz3Ka
 ELeCj1Taivw7G4WMsSrAh003HNjTA7d1kUe7b6ZJxU1WuWwAQkdAM5702mharjfPgi6EI59Koyr
 4n8B8woy/I7Yu5Rl7R18wxrfCSfRwA7Wzk5V+sg==
X-Received: by 2002:a05:6402:b65:b0:5c9:5c40:6d9a with SMTP id
 4fb4d7f45d1cf-5cf8fd1b721mr1808724a12.34.1731691560442; Fri, 15 Nov 2024
 09:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20241115160328.1650269-1-roqueh@google.com>
 <CAKbPEtafvSf1ACPRQj2-eEGS_Son53rmyqZ_8vH8gx-uK4o78g@mail.gmail.com>
In-Reply-To: <CAKbPEtafvSf1ACPRQj2-eEGS_Son53rmyqZ_8vH8gx-uK4o78g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Nov 2024 17:25:49 +0000
Message-ID: <CAFEAcA8zJQ+3vwWm_cEbqqRuptdLm1Ts6r+fK8nR=a5C2jZtTw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Make WDOGCONTROL.INTEN the counter enable of the
 CMSDK APB Watchdog
To: Roque Arcudia Hernandez <roqueh@google.com>
Cc: farosas@suse.de, lvivier@redhat.com, slongfield@google.com, 
 komlodi@google.com, pbonzini@redhat.com, venture@google.com, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: Kvr9MR8tGbnB

On Fri, 15 Nov 2024 at 17:21, Roque Arcudia Hernandez <roqueh@google.com> wrote:
>
> Hello,
>
> I forgot to add the -v 2 to this patch series. This is the second
> version after Peter's feedback. Shall I resend it again or is it fine
> like this?

It's fine like this, no need to resend just to add the v2 tag.

-- PMM
