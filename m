Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp402602njb;
        Tue, 11 Feb 2025 07:44:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVzYZTDSOogVyEQZ6Ly5ea0YNaLI5lzF16FIYjaoXVtylAgY0t8WjZaFhWvIH9dteOrkWc/TsR72dVnIA==@linaro.org
X-Google-Smtp-Source: AGHT+IFYGUDIpwpya9ZpVvZVsDaYge6MGXfQNIJDXebroD/lCQyyeHa2+FUNr7Fe09R1VCO+YW6u
X-Received: by 2002:a05:620a:404c:b0:7b6:6b52:8bb1 with SMTP id af79cd13be357-7c047bba1e6mr2392624385a.14.1739288680729;
        Tue, 11 Feb 2025 07:44:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739288680; cv=none;
        d=google.com; s=arc-20240605;
        b=lysHaoPivyMxrk9i+zzQpRHqNy+0CWVbzrXNgiswKkDYA6NyM+wmdM3uLO/tRn76FB
         9VpUYXLqycq3vjWN5iSdc+XUwJmOWaXkCPDHHyC2oQ8wEKOYVGM43r9tNspvzbAzmsGl
         eh9DMNpGD38ioiPpZ4gzBJZc3Mg1Tk4AnJxx9qdqmfIVUF0eJdNHfYQ26eRQ/7FjNqfl
         6GV8TnBhd+qloGxWyY1pD9XpUo0HGB8CYwRpG0uO+VTOL9aStXZ3AEMS6JSfH8XtxHwS
         Xlj1C8+PnBOUibdY2QmwserKBen883ewPwKuqgDEkHba9pfrf7EgpsVldgOJgSsBi0/9
         PwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=oWOYYEa+6s/NbH3ZPeR9OuuWzJMhNpe0oTscVGP6bVc=;
        fh=uIvcBnLwxq7BLOkcA10em9Q8GT2+j5x9qbbvx/hvh9M=;
        b=Y4Ma0p6upPDuo/veK3YfRFtqzJU10MBWO08wvmsY+XdII9nU5wgk4FAne1maioh3+z
         q9Vq935O+1FZiBU0d18ta06g2jAGeKKlmgoXyGtG5FlpFQI20h/B3uNzOHI/sjNMzKBn
         mOQcCZixgps8fVXs/7GSZAgi5Dnd+tS04dh6K+JW2QGb1AO+x56OFK8XveUqD+c3NLtu
         ifkRGXzvHU5xvydSdB2Zy8N4B3hLxE8AF9bzIXxwaTS7gBDCnU0VARH0gvq9SAHB4jMU
         3139bzXRuaKaHtt+vm5fuYET/Z3g/Dj1nEhoiD07ZbCRMoC5gLUoMO9k2d2ivkiQaZGo
         axYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V0QZdewS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c062f27bd3si327661385a.28.2025.02.11.07.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 07:44:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V0QZdewS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thsR8-0001EG-R6; Tue, 11 Feb 2025 10:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thsR4-0001CE-7w
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 10:44:30 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1thsR1-0007RJ-91
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 10:44:28 -0500
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e4419a47887so4437776276.0
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2025 07:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739288666; x=1739893466; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWOYYEa+6s/NbH3ZPeR9OuuWzJMhNpe0oTscVGP6bVc=;
 b=V0QZdewSOathB8b8lDWVcrhmuiug/oUQXj8c6GGECLFK2KJLwHghhu5mNrf8zacqpk
 W8ERf27TagjT2O0Q7CzzoceRghrXpZYMaKTpso1ZnVViMxB2ZCSkORH1llmaU4RPTk8E
 fOD/pHXqKOLk+w1BkpFxsbrasOy4ILPFIV2zp4XISTYRnXJ59ZVLl/fvChO/rlRZLLmZ
 eJDKb9p3ZAYBQE6Wda9KY3WTETa0ESwXtuUNjwX0TUvc399pmT5wOdo/8GtUfbPeTXbL
 LG7a1NEGlf0SuskuVh5TnOakvi61O5aSLz+ZLYSO/qdRjMm4CzdIZBqcO+6xwqAb4Zn7
 V03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739288666; x=1739893466;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oWOYYEa+6s/NbH3ZPeR9OuuWzJMhNpe0oTscVGP6bVc=;
 b=MVzkzguJxv1XZVLL6v/+9kmimr6sSuGv0drrB+Yt6RVXau7iXErG9yXl8IQMPyRbcY
 rGJwH9RXqPGCcNqQakv93bemNp1BxXdkvrw3YBypYAOUfBJhUbrqBRLb+OiIyN/nm76i
 AhJQ6bXivjJzojcbGJ0llKlyyREIe1xho4cufZb8GhDc0fPiqFpsn8YVJVMf/wfFaF5p
 yC2HEDmuHGOsBQpwqCs8Nw5/7fA3xB3RK4+yPEXIep+wIKdw/2q2Hhp5qk5nOpyPRz1j
 F0ETUXtUZLT+dh6BOLRVIw2MAjQVFIZq7+u+DqZKp3+FFELyqiIZLmYnEestof+fr+HC
 boSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqZaMoVc1anm7KolrMDFK1wgX+oUcxTE18XSor+wGKxlocG9JOUoPhBD4Mz8e5bpQLhZLF7w5Qzw==@nongnu.org
X-Gm-Message-State: AOJu0YymZlxQQQRKvi8fNWruxP/byxmZ4bkOyZZN1zh3Ag1mhoMkngF4
 8mCnE+x/yIqgTpFV128iBYTZgouNksCeqXM+U6gt193gbk/wcOjkYE/LVe0fod0DNGqWGxt/F6s
 MJLVMgX0RsheDmejxbJ9MES8U8Tu0wWmQVzSwvg==
X-Gm-Gg: ASbGncsyx+vRwl6uefVKFYO8NpsQhpB/8yf0y7PDxX/sm261vV8DZOnXg/srWwQPfCO
 VEbG+ciC/nlu9HMWKAjb5BoaWJjqwMEo6G7SYUE+DpPaTYVpg7Iu8Ausutmz0ED0JgvZ4xMiZ8Q
 ==
X-Received: by 2002:a05:6902:1201:b0:e5b:43f5:fa3d with SMTP id
 3f1490d57ef6-e5b461ea0acmr15194271276.24.1739288666087; Tue, 11 Feb 2025
 07:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20250127112715.2936555-1-peter.maydell@linaro.org>
 <44f75f64-4480-4cd2-a907-cf0638568e55@linaro.org>
 <CAFEAcA_BF_b8r8cOJVsk13qEQZg0BS5F16s9M6NFLQVHZBfq4Q@mail.gmail.com>
 <27599be5-9669-466e-8e34-4ec0831c91cc@linaro.org>
In-Reply-To: <27599be5-9669-466e-8e34-4ec0831c91cc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2025 15:44:13 +0000
X-Gm-Features: AWEUYZlLug6vg8uUi3v3dMnBV8jqUW9o3FIS9K-GNtXu8BRkxpQA_ht1kqFKtVA
Message-ID: <CAFEAcA8RX527GvvxKwCViynqyGA+g_wUbtmaaoyz9Sak2brjow@mail.gmail.com>
Subject: Re: Deprecate nwfpe emulation?
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: 2MUj8j97j0hb

On Mon, 27 Jan 2025 at 21:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/27/25 09:46, Peter Maydell wrote:
> > On Mon, 27 Jan 2025 at 17:27, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >> On 27/1/25 12:27, Peter Maydell wrote:
> >>> We have one test case in check-tcg which purports to be checking
> >>> iwMMXt. In fact it is doing no such thing: it runs the test without
> >>> selecting an iwMMXt CPU, which means the iwMMXt insns are interpreted
> >>> as FPA11 insns by the linux-user emulate_arm_fpa11() code. So the tes=
t
> >>> prints garbage and then succeeds anyway.
> >>
> >> Uh...
> >
> > It had me confused for a while, because I'd convinced myself
> > by code inspection that we only enabled iwMMXt if you
> > manually asked for a pxa2xx CPU and not in the default 'max'
> > CPU, and then I found this test case that we were running
> > with the default CPU type and which was apparently passing :-)
>
> Any chance we can deprecate the fpa11 stuff too?

I had wondered about that from the QEMU side, but it's
a little trickier than the iwmmxt deprecation because
we enable the fpa11 emulation by default, so it's harder
to tell if any users are still using it. (In practice I'm
pretty sure it'll only being used if people are running
old binaries that used the ancient "floating point return
values go in an FPA register" ABI.)

-- PMM
