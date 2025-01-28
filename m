Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3088341njk;
        Tue, 28 Jan 2025 05:23:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXzjIBZWREanbQDlHklEtaO3rWVZQQH85TXEOCnK6kg9PInM1E4ItC+Eg1mbP4HTIGgZtTi96GDmQpeg==@linaro.org
X-Google-Smtp-Source: AGHT+IF1n7DSJXB6KqOarwNu3y6UsHmht895zBq8VbgPLccAh57/z+9G5Ez8NKmf7vJdMZItebwI
X-Received: by 2002:ad4:5c6d:0:b0:6e1:6aa2:2156 with SMTP id 6a1803df08f44-6e1b224c283mr554539346d6.30.1738070620225;
        Tue, 28 Jan 2025 05:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738070620; cv=none;
        d=google.com; s=arc-20240605;
        b=F/Tbr4hJR+1BQvUSDL6zAwJ0mVh3vlu3ZsXKHAlZNKZspNWKNuK6revQG/KVRQgZev
         BQhacDw4e6z0HudfGE0BCUY+RDcFhOXFsBt7HwG8nQzA9fo1xOYOEY20D29HIwlvaRQn
         Fw24kTwHymXH5al8l9//gAAvQld0gDeQE6E15xzJLoJDdVuAzEg35yoBEhI2VKuqh4x2
         y7bjtrcStCEdgep1VDETbPnLdl7iyTCIYMftl7h0sRTmSXGU1UW/KG1vEOko0dmk3YXn
         aJkudMEXzF7r96XPj1EyneO45F1r4Pnj6zMPFJrdByl2Ts94ohn5+UM0IuLLeap628mk
         bOtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Axz5E3/0syXeLtx38Nztqx4VhAYcg41Xh5fhz5/CPao=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=cCSbtVn6ZobeLsprA9gBPJXNbMom8+tOJ18QocWEotURzd1ohLOOp6cl+pZaSu9hj8
         lVkxMRNJUZKLNlNonjaEDkkeS5WRLtKdD19BZTv/4mmPPQvphFRkzbqFNJoQPQQan4la
         tc8PR7pGhchzjwjGtVU2RBKDIbgh2687DDRkdc3p2bsrHnnZW3vH4B5Ea2XupAJXTSBv
         ocaG+hj7G/O1CpDWzxmaE0IyYYZUHRaU7s+UMNtMSZ21hl2PoBCAPhALQyLGoIGHihYQ
         xm+7XOnoKfLzxnkx5U6dqc7xi5OmekT8ERgfS7K/zpwCZXZoFsRW/jnVpPb1xszzafH1
         tx/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wEUxbSf4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20525e487si121860376d6.79.2025.01.28.05.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 05:23:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wEUxbSf4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tclYs-0004M4-9Q; Tue, 28 Jan 2025 08:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tclYl-0004LK-HE
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 08:23:21 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tclYj-0001xT-Cb
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 08:23:19 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e46c6547266so8247355276.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2025 05:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738070593; x=1738675393; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Axz5E3/0syXeLtx38Nztqx4VhAYcg41Xh5fhz5/CPao=;
 b=wEUxbSf4JlXRSB0SXU1QoGQVmgegg+nroyucmvIUkdmpHHONFh68BshZ/WkJFRGVZK
 2Xe1zuQYlDrBZ5jOaAaal8xWqcxIbcDzfGmqmYx7Ey2YdH7vmQej7SiWoGSa719i3S+q
 urfFDYEmFmzEKgTIAv7l6WggFRuYhy4Vwo84Dsxc/mmZ+8KVPyjF7aqIcJxubdchQ4dA
 +ta3t3pWbA9QHuNbx7av5TprQkhO3Yp0E/foFkyA5R/YPWpUR1bGh13ckEcG6W0jREbM
 1OuImb0uQZo9j35Hcmc1SdbWwmaFFaG96rCFKv2lnxJHAVrtUdCJnSRXbRUZJH2u1ksG
 HJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738070593; x=1738675393;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Axz5E3/0syXeLtx38Nztqx4VhAYcg41Xh5fhz5/CPao=;
 b=CalpQOyAWQ52XKUALCv2adK9l8HZuHZWlmbGqwj8fIluSBN/paT9dAKmMD9X7RczdB
 sDlD0xTUW5cY0vTqk0nfb1cm0o6g9clbAnMPI8L6h5r4RKWUvThaQ6AT9uPe8PP3PHbM
 t/Ov4PaCfgBXlD+A6Pk3pE3qAbXPAdhFr+qCf1e6SHLlmJfbDlPQlyL9kI3WLW9wS2ll
 E1dkhldgzTY0Vj5xMoI38zVkNZWwKyagxCpdJuzTSH/SZvTvoQnK4ELe6QYsUIZ/KxCz
 aV8kS/G3zSl1CD2/xL0fGp8gAL7OsDNjUQVVEdztc9FvN1K7W59Y+kmvYa8h4TMlZ+ZK
 LMHA==
X-Gm-Message-State: AOJu0YxZulKX0Qo3+oQT2FKIMBdQEfZXj3fsEbt+WRpJAzZDh+lXyT4G
 rBx47OrCk2QxA2yNLq1EoEZWVoRbDq9w2Y5Y8lDR2qCCjFVJlcGntLxnMVHtZYk2xjlR8SUtOet
 RnBwb0ZIM0Ao3imVaEWleI2jUMFEpnS3TuScT8hsaofx0sjQa
X-Gm-Gg: ASbGncukNVTlYAAXY6vhEt0NBFXNB1TF1wFOUUFkRRE4qmNyA7h/bv8XDzxOpPfK+cl
 TFFmCEHnKRQZaB6zq/JHdfjSHJ9ZZD00AUVpR1kM9nIG85fnYt21Ln9Av8bV8ix76dhylX/bvpw
 ==
X-Received: by 2002:a05:6902:72a:b0:e58:32b4:486d with SMTP id
 3f1490d57ef6-e5832b449c5mr17368474276.30.1738070592830; Tue, 28 Jan 2025
 05:23:12 -0800 (PST)
MIME-Version: 1.0
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jan 2025 13:23:01 +0000
X-Gm-Features: AWEUYZnHW0ZL2sk_ht5fFjcurmIhSi4e_bRExQhgQaUQwq2Bqt14KKJEyYlx74M
Message-ID: <CAFEAcA98=OVehu6Yp5i-30ascFJogupQVBf2WkCg5AEEh=yJ-Q@mail.gmail.com>
Subject: Re: [PATCH 00/76] target/arm: Implement FEAT_AFP and FEAT_RPRES
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
X-TUID: 7GZi0IFh6NFn

On Fri, 24 Jan 2025 at 16:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset implements emulation of the Arm FEAT_AFP and FEAT_RPRES
> extensions, which are floating-point related.

I plan to take into target-arm.next the following patches
from the start of this series: 3-21, 25, 26. (Paolo has
already picked up 1 and 2.)

I'm making the renaming of the FPCR_* constants RTH suggested
as I do that (i.e. not reposting the series just for that).
I'm also making the correction to the is_ebf() function
discussed in the review subthread on patch 7.

Handling the review comments on the rest of the series
will take a bit more time/work, but at least this way
v2 will be a bit smaller...

thanks
-- PMM
