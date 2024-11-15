Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1113282njc;
        Fri, 15 Nov 2024 09:08:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVIOFFPmwmStAyYIL4rKUI2gTDDjeNyC8HhiWWkEojY22sSp8B3ytzKLGS/v/pYpl58+oLE4Rcl95NeKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEWylqhGQgbs2Nfck4GqG5foO131wTMcI/po7eU0QrmxZpcBSWuTeWXFD2xm6sHGyJnS52Z
X-Received: by 2002:a05:6214:3d10:b0:6c5:1fe5:f84c with SMTP id 6a1803df08f44-6d3fb78a4ffmr46232266d6.20.1731690520939;
        Fri, 15 Nov 2024 09:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731690520; cv=none;
        d=google.com; s=arc-20240605;
        b=jbj2YMpr5VQhMUpQsOf89fjstS5I/uDNgKeCMtmJV1mEyi9u9OmlnhnZp+7CCKOGrg
         Ol3BDVCPeK4WgGmsTdFYNjHpevQJOlM6fz0YtzWebRqNQMwyfRyhlUApyak1oMfLhkUV
         nWSRpruw0ZG5OWNTvHxXAS3CtFQU702Y9SN/lwB03ndmoktAgEk/wnv8AWllvI9B/IBp
         usQ4KLlX3eS3pQsd3BepuCZ+r8X6qcYlqe0gI5s1z+2IIw/WfIFw26UetUeZsYMxQSc5
         456bjkWZtjNU5AWB/bE+pdG5zGKlR9JIWeiznjCxmJK3YCAA9HYVYwvyQGiHbafrTN8M
         12Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xEztyymN/5RLgE6ZfeIG0HjojZRRmBc3K3JhZw7fk1U=;
        fh=adDlGcu0xHQur9DKbGnup3yOLwrFV1y0o7L74W+8hbE=;
        b=dQArVNYaKSyC91sp+KWXkauuJ7t3UBm7X8TG1vglqHZnOrnGrsaLEbwmJ8DmZnMJGt
         G48Y3yhI1LIaGcv43HyF5BTi0zToI3ghzxVVfn/FcVKpAc9ViQjwTEM4jSoycNjUPidB
         +p6xDXNYN0BQm2ykX+Khd4g/oqvUZBjiqQWLkP1ELT7W86h8YwN40bsvRzhkKuflsnaZ
         243rq0TLQTQMPrzQV1TxMTqYMHSe2Di7mSzFGU7ZbqeXXiCoUweR6YJcZz9c1xht1ZvG
         u1ZNVbn5DJAzAOOP4ZzX1nIjgArHmYfKFBPQ3W4O2k0PMZEeSzlJITwtBRzZlAL5rXgo
         V1uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tNP4BpI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3ee9faf3dsi41358586d6.523.2024.11.15.09.08.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 09:08:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tNP4BpI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBznx-0006pF-L8; Fri, 15 Nov 2024 12:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBznw-0006p6-P3
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 12:08:20 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBznt-0006NL-Hh
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 12:08:19 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5ced377447bso2771133a12.1
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2024 09:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731690495; x=1732295295; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xEztyymN/5RLgE6ZfeIG0HjojZRRmBc3K3JhZw7fk1U=;
 b=tNP4BpI2IJIrGxspm1+tEkZ93Dtf2WBqaIR9XAPTmL9vsNL4XsGohGdU9r7Ngg3ZOl
 L3JQh3U8kBsO0EW0riPaf6F6RmRkpMVUPrH87g4BAkj04zJKU6hggLUbRTGuV4fNmY2U
 lNbttIiRXPOzU0X1G16o2CQ7jfBy9YY41/jwqvpuoZZpas2PNK6v3+RWr+NM8GE6mNQS
 x876F3otKeZ7cPcNAFHCpYvWKpjg4JKSWT3dvShwSVho9HJcUDVxTRikZLPHMXDfoBDn
 Ekn1JD988N9JeNkzwPpYn3ZWx3igDz2OTz7DnT8inrzHlHg+OKRR2WChAv6+FPKnABE7
 Yjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731690495; x=1732295295;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xEztyymN/5RLgE6ZfeIG0HjojZRRmBc3K3JhZw7fk1U=;
 b=gIS8ZNxClNZ6XMR6CMZdKrfzL6W1BlbDnQxXMiwhPHtKLuHfPeEq5Ptzg+yTPO07+g
 NrlqEiNUSqM8K/21z2avt1YxVynhERKdEgAVrCeXpJ4m7nwO0OlLQfnX/HzETfEYAw/z
 xUcu4ocMk0NYCe7yIsGoi3liN2ZPdP98vuqn5Z91MYuV8qMd8hJcGxiAA+E6qtYhRgPp
 0UJwFFvmuP0ComvCtwyAgwcJvvLUpU+qIDzgwwAZZYRvI5jQ+SpW0t6Dmdkum02/3kzJ
 RHZ3VnBaa+WFUVnjREb/HVpp4kLv+zaLipxF10jR6MtlUzA6ISYSYBs3ACryfSBcemjH
 IkYw==
X-Gm-Message-State: AOJu0Ywpa+ynh4p1M/hrIMUDLkeN2QDc7i5gDpYyOI+U/wEs5Iub67mG
 afGRP/eDV2O9etABoOwJm5Q3WY58JDE4aP6PnC69Vy+NIuvqB4zlu2FEina4FBkxFcZqAYkugxP
 8WcIXwlQY5kj4rsJY2BiIM4ZajS6E196fx+nybQ==
X-Received: by 2002:a05:6402:358b:b0:5cf:9039:84cc with SMTP id
 4fb4d7f45d1cf-5cf903987d8mr1966324a12.1.1731690495578; Fri, 15 Nov 2024
 09:08:15 -0800 (PST)
MIME-Version: 1.0
References: <20241114165900.6399-1-paskripkin@gmail.com>
 <20241114165953.6894-1-paskripkin@gmail.com>
 <CAFEAcA9i+YmGj5tznoc9FQkDQKqN4vx_0grOjh_ZFGyj-aPgng@mail.gmail.com>
 <6303c5ee-e6f9-48f7-9cd4-f78680c2e785@gmail.com>
In-Reply-To: <6303c5ee-e6f9-48f7-9cd4-f78680c2e785@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Nov 2024 17:08:04 +0000
Message-ID: <CAFEAcA8cLSXYAcEjE97RucH1fz+Y4sB2_e53apVf8HZGzf2q=Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm/ptw: respect sctlr.{u}wxn in get_phys_addr_v6
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: zgoVACFt3iEL

On Fri, 15 Nov 2024 at 16:54, Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> Hi Peter,
>
> Peter Maydell <peter.maydell@linaro.org> says:
> > On Thu, 14 Nov 2024 at 16:59, Pavel Skripkin <paskripkin@gmail.com> wrote:
> >>
> >> get_phys_addr_v6() is used for decoding armv7's short descriptor format.
> >> Based on ARM ARM AArch32.S1SDHasPermissionsFault(), WXN should be
> >> respected in !LPAE mode as well.
> >>
> >> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> >> ---
> >>  target/arm/ptw.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >
> > Instead of this, would it be possible to have get_phys_addr_v6()
> > call get_S1prot() (replacing most of the existing open-coded
> > handling of PAN, simple vs classing AP model, etc) ? I haven't
> > looked at the fine detail, so we might need to tweak get_S1prot()
> > if it's missing logic that only matters in the short-descriptor
> > case, but I think that would be better than having two places
> > that need updating for new architectural features.
> >
>
> I also thought about that, but suspected there was a reason it was not
> used at the first place.

I think it's likely purely for historical reasons. The
short-descriptor handling code is older, and has
had to change less to accommodate new architectural
features. When we originally created get_S1prot()
we were doing it as a refactoring to deal with
increasing complexity in the previously open-coded
handling of access bits in get_phys_addr_lpae() and
I don't think we really thought much about the possibility
of code-sharing with the short-descriptor codepath.

thanks
-- PMM
