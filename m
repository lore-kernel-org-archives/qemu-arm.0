Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp829408njc;
        Thu, 13 Mar 2025 03:14:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcegZcbZjzA3hbJmJdJLZnm6qgUwqEnhLgUZUuiwYcf42upfDBe2M16DbCEhXQ41P8df31uR1eQXefdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHb5kpgTyfJSiYqXaBwma6lR4yrO6dBZjMFysGwa8gCVbzJxzdJNXvpH0iiA0e/raXZaI6Y
X-Received: by 2002:ac8:598c:0:b0:476:8db0:8cab with SMTP id d75a77b69052e-4768db090abmr213512221cf.6.1741860876693;
        Thu, 13 Mar 2025 03:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741860876; cv=none;
        d=google.com; s=arc-20240605;
        b=csU1f2vm+AbuHMkZRv7ZraaV+sQwlKXCL1x/SIYSDXWiLYsZanTkhuZP2X60Gz30KL
         h4hnvLRvkN6V2JSUveUpSqsiAWsGBP91kM3oyqzpBD/h8XhzrFsN+NHLNSTYm2XEHEY+
         yC+fqC+okM9UKKLz3JaEQSj/emF0zawKHlEDxUTKRIxGf6Fn6DVGh7K4TmfqNGjJR28l
         43H8w3tSy53PeArGa96SQuqKvpcP+/CkOKx9UmYyw/f0S34TzAHNXQe0/TENIue0Kkud
         NgjuXx+SrbywOAHHPg1cNyrwxTCg/uyxgcoz2ES/JTADRP34w0TzkjXyzu45kMy+ZAA+
         8oXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rvcGDSMoadqD9QNs4fnKIwN6H1fgdMN8ghB5j4tu86o=;
        fh=A+s60Hg0HSkuscWTCN4VIXgkp3NVobMm+1KLnySGuUc=;
        b=fIGLVhUGsfAceRHB2dviyXVxO+HEYj1VrqzUjJOeSd/VhUDQpvdAD2SE4bOb0ssDId
         PSFLE6pcFJNlKdixQprh1ckaTif5GUQ84lCnz4ZQ/EWarTYWP3cMWILtmIHh108D1chP
         BHadCTvLQ6Lgfer72sHVfUg2LHTj9abq9Q/lh07fo6yMdhRkXhvYJKAcsvut3UpkK6cB
         eHNmZ1suM6YLT16Kr0OSQnGgU8k5D4gHyqRJ+9YsrzOH3h0xzqdRF4UqvFJACSf9Lri2
         zwokNyhdjbWu+ifwacZ2+8XF3J8T3tm4ydy1kih0EES9r4Av+P8kpcamaaZYMPD8tfQY
         B+vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OI/o+06R";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb61a45asi13640751cf.56.2025.03.13.03.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Mar 2025 03:14:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OI/o+06R";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tsfZv-00014j-Ne; Thu, 13 Mar 2025 06:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tsfZt-00013S-8k
 for qemu-devel@nongnu.org; Thu, 13 Mar 2025 06:14:13 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tsfZq-0001Kn-Lb
 for qemu-devel@nongnu.org; Thu, 13 Mar 2025 06:14:12 -0400
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e3c8ae3a3b2so664140276.0
 for <qemu-devel@nongnu.org>; Thu, 13 Mar 2025 03:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741860849; x=1742465649; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rvcGDSMoadqD9QNs4fnKIwN6H1fgdMN8ghB5j4tu86o=;
 b=OI/o+06RGBDJGQeOGW9wp+J+rq5KlxvbZJQwUku50tCB3U2YVp7wE8LW+HxuYNiru1
 hJqlEXnzZHmo4LIfw8LUH9ZhzH+8hXHu+8tSvwpQF1g0crTOCHg3vub+aIVj9jJ98vCV
 LF1BtTyTpMETMQ4BNNHC1O/WYYiI0KG2ZGVPrxYbfD3ui90Jqop4Ql88UvKSibWrOGW2
 1GvoABXql2wMMg+ZFcAqGK/rxTT085MKR5Nl7GQufbUoGbgxmJvp04Xtn3BXFeoh7E/z
 nDUTNXuGpdze75cMX8ueQJR1XJ+lP8HEAgRNvprU/YvpiYiFsHaZSxC0GrSxUSkIzaMD
 a+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741860849; x=1742465649;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rvcGDSMoadqD9QNs4fnKIwN6H1fgdMN8ghB5j4tu86o=;
 b=h/JV06uxMbU1+jDzDTTF2TwlGWbPdDDEihP3knI19Kbvehww7b+stk7tA1nTIXOCEC
 zFFhZNDmvEdLOzmu34EAlP2NBAb8lF+fbKY8eak5WxRgs9e2tJnNi9dpM+phwBd+xF24
 eAvyA1JHnLG3CxcrGr98k12BygwecN5G+HzWDafBhKtgL8hy608ta5DViQ4rrvWS2ak0
 tCw3334InSOdnDB6jXT+RkfQNvGZPEzJCtUd31vdOkCeKx18vJWa0Spjx8CXPcfiDsNo
 bjMn6dHddhY5ZZZ4SHfu1eswzZbaZ3572FDJH8HayIkpeUEWXPU4ktfHuK/w/N9rXcOO
 9aeA==
X-Gm-Message-State: AOJu0YwH7lLvWxZH4f4vV8EgZcAlW+woZn/D6mj2x5kqxiBHJYlm3xoi
 apySuUSxuTAkqTnrznGOO89xAoAsat0H0WOeafWRk5kbGGMjT+fumjn/+lNe3BVFwkj/ljqcNLX
 n5RwMvT3ZYcrvGJN2COel6UV3i940N6ZKHco3RdDlAUKEir0S
X-Gm-Gg: ASbGncsz1IRr82IWQxsOlvCaJ6FtOueIqXr1woU1xkUPz4c+DA5F6e+agt292dARnBs
 NOwWKQBosDDd5QA5rcjUTvqxeaeNDVFsY3R2SihbDA15nDhL208owJBgP+SxN/rdnlpDILzk9P0
 9FzZZmJxF5h77aEYfdAuBYSUUVxZo=
X-Received: by 2002:a05:6902:200f:b0:e60:a1fc:1229 with SMTP id
 3f1490d57ef6-e635c0f92a8mr35486567276.7.1741860849354; Thu, 13 Mar 2025
 03:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250313-clr-v1-1-2cc49df40fe9@daynix.com>
In-Reply-To: <20250313-clr-v1-1-2cc49df40fe9@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Mar 2025 10:13:58 +0000
X-Gm-Features: AQ5f1Jr19n6UznsoOVUqiECzQAOheCYZVWtXYBodDIQQi049s0ggLZBWPFVtbM4
Message-ID: <CAFEAcA9Gvg2S63_pXKG0bJ1A7bndQNd3meUDeQFiJCwehOgMUQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Define raw write for PMU CLR registers
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Tz6X3CaZ9XjF

On Thu, 13 Mar 2025 at 07:16, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> PMCNTENCLR_EL0 and PMINTENCLR_EL1 clears written bits so we need an
> alternative raw write functions, which will be used to copy KVM kernel
> coprocessor state into userspace.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Nice catch. Did you find this because it caused a visible
problem/bug, or was it just code inspection?

thanks
-- PMM
