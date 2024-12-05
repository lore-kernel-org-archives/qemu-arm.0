Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp306705njb;
        Thu, 5 Dec 2024 09:43:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXARH7K0HSeJVzg/sl+5RngAD184mfukIV5t2nGF1gs1sKrndvddlaosUmsWivnE0VBSXclMCITkMoMBw==@linaro.org
X-Google-Smtp-Source: AGHT+IHEPE7z7+CGmV6gvdYQqQqh605YaaovXC6t1jH4c42LiPO/JxsjN0b9DKiK2IYAM9n3qoyW
X-Received: by 2002:ac8:5747:0:b0:466:97b9:ecc2 with SMTP id d75a77b69052e-46734ee2a60mr424011cf.48.1733420601054;
        Thu, 05 Dec 2024 09:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733420601; cv=none;
        d=google.com; s=arc-20240605;
        b=fuOEdWLJYXTtlOr5m3uxXdS6KQxRfG4+L4KuP73HkuHevQEB1G+26XQFz4aK46DedW
         b28SG/hlybpz1xq1T9LsdBc1EeZQcBbyQckBufwWoenWTo06GjkkGpU8KF2we9ELPrPA
         LMrL1q5zkHCPlRN27KsZ84wMBnXuPTDRrYGqCCtImJTbiSjWu5K/SNOgvz20XAePxt2V
         IXKLkD2w3408E3v/86SeIxt2jZaceHVPKBLYWAJfNOU2Y1CQxEa6zMwEuQmq7dyTFt9q
         VKrImf8c6F7WLTtPgSKRu6wmYkxOvQAFg4BychpI+9n3o9D4oxglm9fb818BBGC/xOnC
         sI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SM2jvQ7Mm0KjM20jPndgEZJvk8M+uJsuwsmSk1Rx4c8=;
        fh=hz0f/8mcDZxF9tsl14umgxikkEbf18FwkoFwfI94wXo=;
        b=BkOgi1mMMqwCuLoZ7OXvCfjarXgCEJDc+cg+lRfHOhwJJk3N8dDs4qEbxxXHgdWa/e
         SduuhJ/dZvSWGuPr41KcsJ3EvhE9l8G82DOu+D+l7KeRn90je1KqrPk7Eu0mgZu0EZ6M
         e1ntHYrkTKRW32Sp49pHHVb2lJkptPVJoT1tT8BY1XCJ5qo8E+js7rgjK8T+mKeuOVMJ
         j6+f7B01lVthauIWO+01dbSyEBnr7sKU2e/Sj59UetoWOkVOZDyNk4WgwgFBKrf8Ipks
         TTiR19IXXJZiq0QTgXtq/8TkDZ3Tfw9aIN9STLgU5zPtKzRBwZ6k2R/nDeE0vSTwjAyf
         uuCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S91JOnr8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296ed322si21378101cf.189.2024.12.05.09.43.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 09:43:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S91JOnr8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJFse-0000Em-Qd; Thu, 05 Dec 2024 12:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFsd-0000EL-25
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:43:11 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFsX-0008BU-TW
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:43:08 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385dbf79881so1498469f8f.1
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 09:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733420584; x=1734025384; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SM2jvQ7Mm0KjM20jPndgEZJvk8M+uJsuwsmSk1Rx4c8=;
 b=S91JOnr8+pRP/G289vqiLhScBf4gsTfmNWCrR7AMkKbcjUqWRCj5ZHdZ9+0f/5ZNNa
 JF6wPfH5cpjLE2GyGLXGCE8z0q0HyNFbUcNgoUbj/oxuoCFr9fbyGgfoy/j2LrqldpwI
 zjzqTojeyTmIsLDxr5w1sHqCOVXDzkxO6sWeFHQYAUNUTdRfKXlh5nGmxYhGJwePhXDK
 ueehVtxSAjmJzMzeHXBF190TuUqjTn2ZBYwWXZgG2pjBd0RMoDglYbfoFyVTW+C38/99
 b9NFpoxt0Igg0lIFme0Vis2BS3U1GZ7w1HGkXshTa/KMIieYnaRZGk4m77qsqf4XuRr5
 7v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733420584; x=1734025384;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SM2jvQ7Mm0KjM20jPndgEZJvk8M+uJsuwsmSk1Rx4c8=;
 b=pln3tdVLcdNlv8OrsiD8zVMk2a25QxapaJXNuu6zKshDn2YNJzW4RQkRh6QjcAXfn/
 IZpqnFLPoRu+QpdiaroOJu5/FB5OQze9xIkEdvelkfAA4SE2pAaoUWNSBECfdj2oBe55
 HcwxBl+awSKa0M/eyVp4JUmKsUGLgPlr4lpGUvTcSSNUnJQgyaqWCyUcKfZ7sESxnrWM
 2H3oXK2sDL8JIivLQB9nI+Q3XqOICfd2QdZ4HKXdpxAglgI0W1GpUWSubCg8/iYD7D+0
 gPXOqS5fr0IcHlGOn7OmIN8N5G6Y5XpOOIU/ThQuhuekYfOdMiN6vAsN90ZUZTUZBHiq
 KD5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqZ5TgUu1PHEfNzAm0yyOBFRURr1akdOJAuKVREocVuFguq7y7tHX+Cqp4CDi/+xLywDhfWVSgRQ==@nongnu.org
X-Gm-Message-State: AOJu0YwFR7/ywsU98+X3R10nTH83UlPOfepsfHu/siSk2xEvqhPW3yNs
 3VscdZQBgY0R9+fI7MKFMJoOHdx3iw9BOLElTIOFVdza4XiJ7zblW7hBqey8K2QCT/0ojnsqHXV
 ZLjrrRuQE9Uwo5eOqRKK3KAlLt6W4CyHvYG5bUQ==
X-Gm-Gg: ASbGncuZolVOAgiV5Sh02iSZhuxoTVsA92p3+QFgFzvhHjOxDERnBQcXmYxVz33i8XF
 REJYyunAdmz+SYOYbEs/1wSL7ZRJBccn9
X-Received: by 2002:a5d:5f46:0:b0:385:f07a:f4cb with SMTP id
 ffacd0b85a97d-3862a893f98mr138266f8f.8.1733420584035; Thu, 05 Dec 2024
 09:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-13-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 17:42:53 +0000
Message-ID: <CAFEAcA9cmbYjwLG26C7Z-GVOQ-jAoy3eHMP7Z-d5H2D97BPXEw@mail.gmail.com>
Subject: Re: [PATCH 12/67] target/arm: Convert disas_add_sub_ext_reg to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: EWSqpOzOueiX

On Sun, 1 Dec 2024 at 15:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes ADD, SUB, ADDS, SUBS (extended register).
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
