Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1511628njf;
        Tue, 3 Sep 2024 09:40:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSzNs9UadTVy7fcgAO/y65094o3UGPOgQ01Dw6wBm9JQ4hOUoxz2Y4/kEULdblRRIIPUZ3o9/B0BEHRA==@linaro.org
X-Google-Smtp-Source: AGHT+IEwsQ4oHq6z/RWXUF0aGNS9gIjy5ngtH5VNlG6amwS0naL/6db3cT+yry+5W/DhXFqjbcmo
X-Received: by 2002:a05:6122:923:b0:4fc:f1e3:d20e with SMTP id 71dfb90a1353d-500d5b93b31mr4197870e0c.1.1725381627076;
        Tue, 03 Sep 2024 09:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725381627; cv=none;
        d=google.com; s=arc-20160816;
        b=DFxaY6PwVWkDbjKRCcHNKZ4rNPJhtCN3UWTS+9rr0AYhCAYbsvfvWwmxpMALrWuXdW
         jeYqHOP/3zbx5ZtvT7AZy+UWpKyd2/UDY4NEoFe0QA7tN+sVVrVtGpr7dtYVguWwO03f
         ezew3XAyJaRj0n8lnDQXzfX11GV7tPLGBfMLI5KP3SH3MVM3T+ifXGTTG9id9/U7EuKh
         whzCFRSbGIu6vDtzf8GRSpJ4Q/9MRYMxr0PRpiNq6HZrsHK/XrD8zblGrVTRJzqciPt/
         04ZQCrwqj9J7ey8frv9sKKcylv4Fn3/AcLEhT1GCWrJFhunOhqTVL/tuUHqODEolSa60
         GMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7Ca4/u9BxH3ehujKMf3VQzgAvKmTY63OWpDI6n9L/94=;
        fh=0IHf63TISguL+jc92bgZAsc2lC3r3vHGqSByvb5kNZs=;
        b=ptjy/GkcOjffrvXGmAJADuYxE6VqDAxMYY4kKfJyi5Ef5mkDISLnKbAQyTmmPcbKOu
         1WhqtCWcmpjNA2KxMNV2aEpygOrQgQrDJFQUlINc0nX76deBTJQDpWlLbA9nac7jpxw9
         oWBO/tV9iCt+c51oX/3T5bXuu4j5Uz7UwfUAVdOisAuRLNanQR1tN3cqpyfiOBdBSDEI
         c/yS67VoxMkJhcMzQX169/FFAbAO+X+8lb8/AkCQCuk9PjJdFcbwoWSHXeVV/FdPQ1UB
         qvbs15tWF8snLHfh/OFzVpFx3Lmjd7uebIlr1bnZNfyhOkjjhDAPtXUQtBHvkbFazSGp
         bu4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QXJAzkWL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5007168337csi2712845e0c.245.2024.09.03.09.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:40:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QXJAzkWL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slWZi-0004gL-Hp; Tue, 03 Sep 2024 12:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slWZh-0004c5-HA
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:40:13 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slWZf-0007R9-VV
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:40:13 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-374c7e64b60so1554845f8f.2
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725381609; x=1725986409; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Ca4/u9BxH3ehujKMf3VQzgAvKmTY63OWpDI6n9L/94=;
 b=QXJAzkWL8dnt1YQUEtEG4rpWSume2XZkkQP7xUJLALZ0O4Ched7qXO/5rw6CuUrSEt
 l3XkpkaphQ4IiEWebjPQGxcWVdEV5DtCDBWj6G1eRNAIyUIXm3hbHJnHCfG+IASYOyY4
 HzcxjW/DfaspA2qQ94p1boHIwtlfrmkgr4JOrP8LmovlBwwEbpaVT18kgXRPCCc3xUyf
 bZr5DyeBm6p8oboaNATPDl6+3TlWhCa0Qhlz0f+tAzYyef3l3a/Y0k1/Yi/Z3pSau43x
 M93v4mWnTUaN78W5f+x+m+PmaaijN8a6ButYTJ1nfTY/F4PmQIAwAe6trzP9VQmeH8gr
 ikvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725381609; x=1725986409;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Ca4/u9BxH3ehujKMf3VQzgAvKmTY63OWpDI6n9L/94=;
 b=Ysifa3YJoSgwcA0bLQbSa02IU6xKUunQHEQlwVUylOSzHqxBpL55ni8L3XeJNNlkPW
 LgdenKqGPmICgJXLAglmzYAZbhKROF0dTt48nq30lkt/Ym65+YcQg9uyzR62PkxIg6iJ
 t83Lkih/HbXFGlQLz7x3PluhgCnYznridPOBPU8jW/EnrD5czfyXfh46k4ykpau9GAAp
 S+cs69Frl9auZ52Y4HOCXi8hahbP+yETm0KtYmBb4BJVOrZThF6INbn95BTs27EHHMz4
 4g0uI2N3UTwlKHGpBn7cXYJccWpGmYwc/08sRCcjR9PJMDxSCFosJpRDolfhvVedOQUM
 a3jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP0vzmLlpccczzf/Qfuw48otJTIeC/MITBzrEAMAiR2p5Tu5r2u/UlMmd7BnSWwFe00R8eU45Q9Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx14/TJSGJSo0xQ2dheaKT/3pojBEdgSzRYxjU2YjNI3ZwUF+PZ
 YO4e8aBQ0akWMCOHOXtrxQ8iOPkpg1/sjGelkZMws1BYmH1i/qfCTo9vKT+bdqfTmU8ug8dZI6/
 7J3oJPI1sS8UvdfCF1bfeNsVGfOou9gTsaPNRbw==
X-Received: by 2002:adf:f589:0:b0:374:c92e:f699 with SMTP id
 ffacd0b85a97d-374ecc8f1c7mr2962135f8f.23.1725381609426; Tue, 03 Sep 2024
 09:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240903144154.17135-1-philmd@linaro.org>
In-Reply-To: <20240903144154.17135-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2024 17:39:49 +0100
Message-ID: <CAFEAcA92ze+sow=S71hG0HNwYOyUnPh=+26kzxu=W7NLYN09KA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: Explain why load_elf_hdr() error is ignored
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Changbin Du <changbin.du@huawei.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: e9hpFqZQ7hpz

On Tue, 3 Sept 2024 at 15:41, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> If the file is not an ELF file, arm_setup_direct_kernel_boot()
> falls back to try it as a uimage or an AArch64 Image file or as
> last resort a bare raw binary. We can discard load_elf_hdr()
> error and silently return.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM
