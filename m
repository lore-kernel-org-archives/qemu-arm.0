Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2742588lfc;
        Mon, 26 Jul 2021 03:58:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCWB77XbBVn2yhP4HRIPcfctO4um4w2nCtEqRmVAUYElrDw3sW1Ion2WHCyDlmAM8eQK1j
X-Received: by 2002:a02:a69a:: with SMTP id j26mr15820296jam.9.1627297090811;
        Mon, 26 Jul 2021 03:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627297090; cv=none;
        d=google.com; s=arc-20160816;
        b=PWX4besuXpkwxQ9wIbLXQTGKO0uFAXD04rfafMTA+YkXFI5oWGOgxSbQS+MaCXPiiV
         c1OVqROHh+XvoDgvfWGIC5DUgIV9zxqHNnrBPvdv0RcxykLN+q3snUGFpRTwpcdjfGXL
         nIIF5b+phBOAyJ7qS35wcDZwxsR+pC4MYImco4uCJ9YyLNAlwTsHvqQK9aR9KBwcmmKD
         h6VExR6q6G/XWVNxwtfL8/dZ/BDESnxArSOnGLHFlQtqJCsT5gee7M1cjZpRgompy67O
         zBS+U2hUoyDEt4PAExv9hxWzHUatyRxV+jGeKbB/ZVwtvz+PutfpHHF3CPowvN0AudRh
         aCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qsDbt63OCeJH2XQqD2nB/I7kiILKLEh68LhGWk3ylCc=;
        b=AameGwyT2FkSgACzpN4HA0880di+g3GAXHmXRSlY0XyZKqwOYRcHQfyqikLdACwTLh
         kCxUAfv4Autwps0Hi3fW4o4ZT+m0klRjq1B+JJYS6J/hn7VyacG48htczZyQmaWOv2xJ
         OXKYpD4BNx9HFP8PNwwYlNBk0sDgGgy4rPcpiPVQ8BDfqwitm+K04yXpJL703PA37KPK
         DQCW36+ywiGer3jciJN3JOBhOD8wYhrQOqV/skjTKsOvhK/NR5NgH7C0iNBQjzq1wRv/
         smg67n4OxF5bxZ92zzSvZqrsahtQWJZxtvzxoCBzva84QEox8AYXvWelFigrgM+Pc4+4
         uSag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pNi4sLVg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 187si42904710iow.86.2021.07.26.03.58.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 03:58:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pNi4sLVg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m7yJG-0002d8-4x
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 06:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7yJ7-0002ah-Di
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 06:58:01 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7yJ5-00076d-W2
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 06:58:01 -0400
Received: by mail-ej1-x630.google.com with SMTP id v21so15879079ejg.1
 for <qemu-arm@nongnu.org>; Mon, 26 Jul 2021 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qsDbt63OCeJH2XQqD2nB/I7kiILKLEh68LhGWk3ylCc=;
 b=pNi4sLVgt2Tqhtp9keVXBVoC17N0oLRFlB9BcDILO7V1E0DAMwovwuzuKQNN/PxOBg
 0GV0D6ZqiDWFflyjMsZGddtsW5nJF0K9Wy0UIslBrVY7iYVrBNJJFZPYkBv0dlQ/h+je
 8AnswSoHFH5eEhhZHyH5W1esbDbNl5ADS8fEqVXD/dAQUm/GblLWIYPBn0+NOtaUB3BP
 Qzq4Lec/XtnxKWPlKFHvjpMV66UZ0ciXw37/CWoLs6PR9KjUc2ld2o/nGQ36rxPYqa5F
 DPA7sS4a1JUx780PkZIJBKR/slmWIri/YUJiz7SSjKljWNOpDnP2DQNzq9sWyo4qs39q
 /sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qsDbt63OCeJH2XQqD2nB/I7kiILKLEh68LhGWk3ylCc=;
 b=Hswf/h2gua3M7wz0qOJZkL1TJF/RUQwAOWE9LlGaxYWGFEG1cbspb5mk8WUtkXSW7m
 NYtUPG0Qy0yTqxX1LSBMRFU7Au0yKjVk4wrrmMf20uRAjdeG/wE7ubbw5Fh4bZMhBEHR
 AK8rqHYRsi0IAGlNhxkacJAURQ9NTzLWtPZ/QTPt0dyW1z9+KvEfthBwdUwjjuuZYQif
 e/pEEsrPtxTwwUkua94kOyuNK6KnLnio8h0aDlJp+TBWVSOKmO03oh8wbxKf9DdApVjB
 PcNUFditgaarAS7+AaCEAhxQrqadbqBbiJeX4YbSRs9GJAqSnezmcJOVMcXVUM+oQ8di
 Hhxw==
X-Gm-Message-State: AOAM531ncH8Yz4k1MEVrohX4h1KWlxlrld8qktcsLGvaeZQPJa859cGa
 wtWvcIQ/oIfuwCFFx0t6Ho4550gfmPnmEZ7lvAnGTJE5wGc=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr16747863ejc.56.1627297078680; 
 Mon, 26 Jul 2021 03:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <20210723203344.968563-3-richard.henderson@linaro.org>
In-Reply-To: <20210723203344.968563-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 11:57:16 +0100
Message-ID: <CAFEAcA8CdAba9W+k1SerET73TOooDcazinxHwj+YToHQ_j7jLQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/arm: Export aarch64_sve_zcr_get_valid_len
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q4A7MPtY7lmu

On Fri, 23 Jul 2021 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from sve_zcr_get_valid_len and make accessible
> from outside of helper.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 10 ++++++++++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
