Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2131437njb;
        Mon, 10 Feb 2025 10:25:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCxfdgzhKYDH30CanYp1REbmt8qLXYVbF/tF/vloGYYuEAMwiFASGI04vuhJiGMvmQWv/ktAOFtm76Lg==@linaro.org
X-Google-Smtp-Source: AGHT+IGMdfReK+YUGlBAukJLMVAve4jC9FKj4zaxzVFpjBdXD9LnYl3xqos/N/NSfEvkx8Y/2ErJ
X-Received: by 2002:a05:6214:f2a:b0:6e4:3ece:d26d with SMTP id 6a1803df08f44-6e46785a5aemr10749096d6.18.1739211912990;
        Mon, 10 Feb 2025 10:25:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739211912; cv=none;
        d=google.com; s=arc-20240605;
        b=OUlzB1OcKsJm3zRXx+u5kGOsr8R5oP/rf7mrpxDmYvdIDDz/aQ72rTEX9bgZ32MH5N
         Wg/INgsYrU69gY6vo/hgyti3UnupLvf52kT+VZYXmrZSHHR5HWv8cFhljDGUFAGnmDnN
         OUy3dfxygIct8fUGOx5x21DkH/u1dB6IodTbdLnS4aIfD1eIbnGiPl4JDQz8aEZBVK7O
         V+VJFcNITRtp5WTFMPqDDFOVJyhJmo4gd2jy7EnJF3MvmAX6KZvog1RWqK67q7+6UEUx
         aRuCmKXzpPfSFJl+n/c2yaloOGsTtl57WR5rgGHiL+oGsxC+4N78PTnIy4l7r7KdM+6S
         pWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GG691S8paD09D2xs/5uikDvgjy24u72wmjbW8fA7/E8=;
        fh=hZzpMQR7J0Q/7z8afcEYAHEEp4dEj1dAi4AWTBkxRrU=;
        b=e+SFaUE8tCv0M/KPLBNNhTHVPHKfQOLIPykKcPzfLCjoHgJOIB4HfSk259lc/fbsVw
         ZlSSPMLWEoSAB+N2/wWvYPjIOw9uN5KuKnDMhjH47RoRU3vseXK3xxEXHHzN79KTJrLt
         74ySJq6UhwLxL8oER7M8+58eG+lR+Afsx4u42gfWuiWOkfyfpAo1MuE0oVtL+ynPQQ9N
         PybjDTg5AnJN8siNEMduLiull74TtCJZay6lLIF+S5LZz4/yZ2Z+tzvUivL+qs9AB1kP
         2xpqvYFao52ichmz9DNpArUtlMunmRNOazL/h94yEyrjky+Q5E0ZCE28mR48/WvyHx0P
         GjVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hZ90dn8G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e44327429bsi85792576d6.487.2025.02.10.10.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 10:25:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hZ90dn8G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thYSU-0006IH-5A; Mon, 10 Feb 2025 13:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thYSS-0006Hr-S5
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 13:24:36 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thYSQ-0004GF-Sw
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 13:24:36 -0500
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e46c6547266so3703886276.3
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 10:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739211873; x=1739816673; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GG691S8paD09D2xs/5uikDvgjy24u72wmjbW8fA7/E8=;
 b=hZ90dn8G+qYWr0jaHSPLczKnRpyXhzGDf+X5R6o1tp7hnYn+1PZoHUntoOwbqp5ion
 TFBYIUf8mqRqQNIRQIZp9Q4ztyphfa2Sd5hqaJkJL0CEpS+RDG2RiSKrLciZlfixuFjb
 Q41ALZi9s3wUHrZtrFUJPfnTubSIqNqjaz1fQL9IAiY13Y10+UIqhTEB1v3ur7rwPXm9
 PvkbXlz/E9ZTGP+gOYVufh7WzYQTLGJ19j0uT5mUwPZhaI0bwNfk4fS74Ib/WeJuUmDs
 Wjlnku4yZ105uX49quEe19qV+0wCsrBpTLgoi2rBbtG4FIs+ai0rC8jNWP5sf+KUIoUY
 ifuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739211873; x=1739816673;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GG691S8paD09D2xs/5uikDvgjy24u72wmjbW8fA7/E8=;
 b=G4bEdBmaTMBLzNwUqKSIHcfoRLWyFhgUR77rtijuq0h+8LVirxHu60feH/ZdJkRcAc
 Q0xTevV6tupg9bp3qclc4N9YUJMQg/9QPVwx0N+iYrCc9dmU1uE4UWkVVjYAH0QVfAtP
 skjs4v8J/KKA1gcIUBm5AYv47S19xCjT/+obloveehDsfFHn15iy6T1wnwMZ1jkgfyWU
 4cIc34+R1qygqskqAnINdTjItXObaBWQJU6bIIvL4k+qtyFZVNdZcfzfH+RJV8It1/WQ
 nWkOk4+aCWjFsdkvPONm+WUnT7J2DF0hj+ERuDPA722TC1Hgw+5Wjqr3YCWyQ86bQ4VI
 rsKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRaEkGwwg3SnpvjVp7Li8ebyiHfZaniYClz+x66UOPjMkp4G68vBd2Bb700xi7KVpLx5An9cdUKQ==@nongnu.org
X-Gm-Message-State: AOJu0YxEP3Ml6SogfhW0XnCQAulmTESdl9g3Mm7iqBykNewzHpHsZ3MG
 tyWJ65tjd5EyPOUU7Mxw96hyiVSTrKJ2IJw2AdtP8OAzlB494UB9dy9Oi/O74o2wZFFlQL3lCie
 dIXv5uw//Jkh9CIl1cinFAoWugXU2UWNc5uwp2YOptFLehsE7
X-Gm-Gg: ASbGncsK7Z337uf6W6u/woQuwL1UUHqfXACEJCYzuhtY1mdKIc2SrGXhGikAojQmjyo
 kkTjeM1f7mGodkQFVHjafYtMhcQhaarjV207aVLLpb8ta/CZfNeWvwbvOn4j8SGLsfF8/TWFYTw
 ==
X-Received: by 2002:a05:6902:1707:b0:e48:7efe:57b0 with SMTP id
 3f1490d57ef6-e5d93d30f5amr980298276.47.1739211873431; Mon, 10 Feb 2025
 10:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20240828111552.93482-1-danny_canter@apple.com>
 <20240828111552.93482-4-danny_canter@apple.com>
 <e67f8106-f741-4e81-a291-db06bfbedd7c@linaro.org>
 <1CE8C01E-6930-4DFA-8C96-CACCFEBD24AE@apple.com>
In-Reply-To: <1CE8C01E-6930-4DFA-8C96-CACCFEBD24AE@apple.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Feb 2025 18:24:22 +0000
X-Gm-Features: AWEUYZmPu8_UjAOXexgPN6NLNIUZbyhkjjw-zvGgLyfEtYXN6JJ4BZpezP5N6ZM
Message-ID: <CAFEAcA-Npf_9gV=LP2pmpgQ+dbqxQnJk1ubrtAhUc3nVbM-s6Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hvf: arm: Implement and use
 hvf_get_physical_address_range
To: Danny Canter <danny_canter@apple.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Itaru Kitayama <itaru.kitayama@fujitsu.com>, dirty@apple.com,
 rbolshakov@ddn.com, 
 agraf@csgraf.de, pbonzini@redhat.com, richard.henderson@linaro.org, 
 eduardo@habkost.net, mst@redhat.com, marcel.apfelbaum@gmail.com, 
 wangyanan55@huawei.com, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZRatShfPcFON

On Mon, 10 Feb 2025 at 18:20, Danny Canter <danny_canter@apple.com> wrote:
>
> Will do. I=E2=80=99ll reach out if I need extra info. The issue appears t=
o be closed though, was this fixed/no-repro already though?

Whoops, no, that must have been a mis-click on my part.

While you're looking at address-space related bugs,
https://gitlab.com/qemu-project/qemu/-/issues/2713
is another recent one -- user reports that QEMU says they're
limited to 32 bits even though their mac/macos has a 40-bit
IVA space.

thanks
-- PMM
