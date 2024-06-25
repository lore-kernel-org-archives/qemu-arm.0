Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp661193njc;
        Tue, 25 Jun 2024 05:42:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVa3i6Vqz8aMGY+dyNFfuO0r8EaEKUvzd3wQvh/CPKpOK1qdknMdeze7xQbW9QKonKklp+CU1uSwzdj3Pvpsaq5xHnuLPBt
X-Google-Smtp-Source: AGHT+IHrVz5/zzLMTQOZNQzV+awDONbESj9TEuX/rkKX7K9H9JxWNiO4FtgwVTTynl7s+IZbSQON
X-Received: by 2002:a67:f40b:0:b0:48c:3e33:998f with SMTP id ada2fe7eead31-48f52b80598mr6162634137.31.1719319357011;
        Tue, 25 Jun 2024 05:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719319356; cv=none;
        d=google.com; s=arc-20160816;
        b=k2jMgCXlKKSB6RWsMzq7tovhjKzO/o+/gKY6D1pVwZnJ+ITbfxWRg5Lmk6z9uUk+ip
         HDpb7o88zi7TKjE2pKeGzqy+ZIRlDMLlLd1QmvYeCiJ5Ut58m8gxDH3I9q1tNl3D4k8X
         OHKV94Or60MWtbxfmn06/n9Zi82Bot6det+KkHxR3GM2XHLA7RMYn+egDcKHG0rPFN+Y
         BPPK7ACkaDX+4OaCIvumCxF46e5zioRUYr8dmhu3/1ItdFYgjbNMDA4zgbaocPmL8g1O
         Z+IHB81cr+Cn5gTqC5ZRlZ0SN2Hktk0i+rJ0KrF/iVFWZvz7xZAJhjgmq9HE/XRjqYRD
         aieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PioTf4AvfeN3IDOrz8rSqaCnt0oQlJLiKekkHsZ9aU0=;
        fh=za3bjM9ic1ixP4hxV8Y4FsS4J93Muz2biLoaiEERHLA=;
        b=ApLRcHEoJhM9nuZodx4A8TLJ62bYk2QWsa00i7Hlo+JGEtutphAGEtScaC8yjcVWYK
         8evI1z6NQP5QEf/2FYxxMu5q0pap/wr9c9tNB/cMEcUNL2UozNTQqv9JtnAtp/hSJI01
         gnkzpP77232nfpzI/KSAdhTeibVBz4mPJHs1cQJv2MI6PWraUuk8ejM7ahRqqULlPwDG
         ieGhIZL8O2s8FVUbbsvLc9pOzbEm4d3L681XMcBOxzDrhHXK3UWzL/JyJDuvU6XWUlug
         l0MHbsphot8W6n+K9fpsCleYs9mlTH0SBpIAE865/pU243zSBqlFMwFvHqf3tl1naqIh
         GYyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UMJRRzot;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2b702a8si101288771cf.179.2024.06.25.05.42.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 05:42:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UMJRRzot;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM5VH-0006TT-Q1; Tue, 25 Jun 2024 08:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5VB-0006Io-GV
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:42:28 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5VA-0002hm-2a
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:42:25 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57d05e0017aso6634709a12.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 05:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719319343; x=1719924143; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PioTf4AvfeN3IDOrz8rSqaCnt0oQlJLiKekkHsZ9aU0=;
 b=UMJRRzotUld8xjFCyxcybImMi1WIjyk205x6TbEcaEz4GpuSOm9cVe7DYGkDVdTFqu
 XlGl2wkeUbC9xyh7PMWgoDfRxLqA/RW/ulI205bFop9cHulonf0qBT2/ixPAaoX60Rl8
 nFNahUnyLG1EwJ76pJ4JS956Dbq3pgGAkdU88TVC7UDBMsGIOcyzpKJ5Yp3+p7oYwtz6
 pP4bNsDoY5aIDbs7cQW49cSDKtrSL1HiY6ENXkrEbXNEpHH4yBPW+L6z9q93Vfp2kJtc
 QVcC3/QbssIEJa1k9Fpg7ymmK0bCa8VE5uAhjMv/7Y3uG9eNKjPwvL7cnG+A9qdPyydG
 pbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719319343; x=1719924143;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PioTf4AvfeN3IDOrz8rSqaCnt0oQlJLiKekkHsZ9aU0=;
 b=JyNFIdnu6MUkbvVGpqzxZfH4Wm+O7sHkhV2284LPcK8Ja+YGH+q5kw18ucKK6qBxV8
 AKa8r0oKeD1yYXa/h2HvfhodO1VDYtuosB1DLkc3UATDGnTxO0rbK2mMSqhBghd+7Y8L
 URAq4lAR9sX9ij9J4Dn+n62oz//cD+wQfpjf7J9y5E//8CQXqeoyD5Dq08BA4cidVryp
 QJy8uZSqcInKRi5rBZLwa0CtJI/XazlmEGcz7RQhnYJDcPb0tkMj4oUzwhVY3xpVEles
 6xaWWQqn1VnsgzlqfctT+pc9nrL5WIsUlg9pc+fFxHdyIZIqBU/N/f9zd5NBIW3Zz90j
 oW4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOA4FgXfFb32WmCUrKoxdH+4PqhraXHuRKBCsCyRAjwbtOvBs7aHXkdn5Bhf4+JdKm3OcrbnP9L9OuZwJH3jaj1nQa
X-Gm-Message-State: AOJu0YwJdMc3fw1OEJJd1CHZb8h4hhSqlO+/HH9mLJNCtqEAEFOQx+6s
 mzbZkEXW9oQ0RYTn3/YUzrXiXN7NLoFSo6BjFL6qyHuuMujGF9ATRLSGphQfAYwc5AkyTF8TRIe
 EMqyd1nkdpcfq5M0huNrqpWuWggDln1oB305tdA==
X-Received: by 2002:a50:f61d:0:b0:57d:5c0:9dc0 with SMTP id
 4fb4d7f45d1cf-57d7007f509mr2064941a12.38.1719319342768; Tue, 25 Jun 2024
 05:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-8-richard.henderson@linaro.org>
In-Reply-To: <20240625050810.1475643-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 13:42:12 +0100
Message-ID: <CAFEAcA82Oh7tDtho3Q2rNmRCp93gMo-eEbV34X00YGOuRX7uFA@mail.gmail.com>
Subject: Re: [PATCH 07/13] target/arm: Convert BFDOT to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: R70nQhkn1mbs

On Tue, 25 Jun 2024 at 06:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  2 ++
>  target/arm/tcg/translate-a64.c | 20 +++++---------------
>  2 files changed, 7 insertions(+), 15 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
