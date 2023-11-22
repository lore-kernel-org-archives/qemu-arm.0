Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp146026ejx;
        Tue, 21 Nov 2023 23:43:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGE7D5f+fDPGV3wtwmkdnsjiQ3in0JWuhbZJNRwIoH1SOY3UpCNBvv46H88NfbdlNAD4K7S
X-Received: by 2002:a05:620a:1646:b0:775:cf5f:8a57 with SMTP id c6-20020a05620a164600b00775cf5f8a57mr1437621qko.7.1700639030581;
        Tue, 21 Nov 2023 23:43:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700639030; cv=none;
        d=google.com; s=arc-20160816;
        b=FaZ6duI7TT+FWTRPDVdEoFuECLWVHccUi5MKmneqwm0FQsttW9H2FzW45cqnj5w7NU
         Jqvj65ATLxqVPFYcmiTZ4wTZv7p6wB9qjeRcvCQfr55IL5sicuR1vjKwWsa0gS71w4Mi
         l+fWSG/HDNogYBFwxP4HdT7eKBSV8ebHTFkuGEej0GkS52Eek8DaBIo8Bonur6vdDoy8
         r6ptqBFMPRRPFCDQupUq5jlvPKGwbuVTjRn4NeTvM/EFvPxjpViQryJCTm8GJah4v/Y4
         R7HWNv+mpi9SWW4K65a3MoFdNUlsYNZK9O9VcIwo2R1Gn3yvvTe7Ov29pLUdtfGDfI9M
         Yn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=wdW9qcPlDU/+9o1J0Z3/UYDtxEMyX40Ti/pc/+pjnZI=;
        fh=LfB3pI/ASD7VrxYo/YXpVTr7iHr5JIyMLCPd7wMK64o=;
        b=IaUMy/ZMI/CyHy2I0pHxK45eLf3p/ZtpZkv1wepZ4Q/mnHr6UOw7Q0f58I6gXwieCe
         LTMkQJBoeIOVfiWn2QZuQdlXTf5fQpp01EvCgTEdc/e/PrKYDZ2gxWXCD/XFWYRDxB8b
         H1tzK5rGKUEo35RcxqoHPOxTZMxQWOX0lW2yr0Vg5zQAgbyAadNGmDpatcb8PyJ6p4ui
         uNux8krJUmTCyhgLSOrs8mWudnaU2GY31AAkriMjpO4F2dsfNfYrXh3SWAffSSZWwrzO
         k5K52ylyzRJuKvaBaHqNXGUyLRvah4OjzHkkdUwK8hDZr8Q0ab1sNfojKWYhzziat5lJ
         F/BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LhmpmRJG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a05620a040c00b0077d5da3e69esi2067901qkp.214.2023.11.21.23.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 23:43:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LhmpmRJG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5htN-0007A9-Sb; Wed, 22 Nov 2023 02:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5htL-00079K-Rw
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:43:23 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5htJ-0003pa-Nq
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:43:23 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c87903d314so45764861fa.1
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 23:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700639000; x=1701243800; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wdW9qcPlDU/+9o1J0Z3/UYDtxEMyX40Ti/pc/+pjnZI=;
 b=LhmpmRJGZmGuSb8VF0a5fGQSgx6G7PK1K16hmDqY1abPe6vDESgQtDRayuNP9Edf0O
 dyybwTmitq8eJ4tvdUyrAfs7A1DoxwiIv4ODdFhCzJcQQrWZY7VFF2DRQ2V7RsJ+hysP
 14r1ZKgKfDd+WbC0HZYBBiY/+2d6zWDg5OI5A3F2g26hIfWn9L1nZkVFS1MV+jDRAhao
 T71OrdUjyoPQEyWQjQP5KweKvaRqFZmWEtsozhdgrzRy9wRWl80DR1H+JbgVsj3Kn5cN
 hkmtezAyNMDUSyMjyqpf6uSUYHJvuUufDVH+u4CFhtcpQiW8bAW5vnKlchBj8b3mwrU9
 s3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700639000; x=1701243800;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wdW9qcPlDU/+9o1J0Z3/UYDtxEMyX40Ti/pc/+pjnZI=;
 b=IA4wu8RGVXQjCgkk35uxGK2t/gukwW6/jeRORoCi1iZsnY/VxNM69XLi4VsSHRqrMM
 2JKoNiq+ZS6UskdQXWbVDosrusa4z4sYY7Ue+OnJTWP+HQV2MvHR41ISS/9/llML7u/E
 i8CJVO2IkMAFVBqYRHIFQMuMcdQ69cvfRrbYZt10FO7Rvwr701qtE1kb4a5RaYsk1Rp5
 /faCGn9zy8xJLYhwNsKlbTUPy1ccJJcXEVhnaWu12i2/GkOwg5JNnf7u3cNoCrBUbr15
 4wGvLPie10k2ZLi3GBSO0qxLvjhB1U7CqBQSFcHEGk1pNvFtAG89r3Gg7ahXpbJrHEVB
 7YUQ==
X-Gm-Message-State: AOJu0Yy0e0/nlape/gbICA+UaMUSQSD+i4kfOUqew5sq7tP61GeBoBL9
 Jns/XDPHES5vBtqkm9zG2Jsj+g==
X-Received: by 2002:a05:651c:b2c:b0:2c0:2583:520e with SMTP id
 b44-20020a05651c0b2c00b002c02583520emr1268551ljr.41.1700638999942; 
 Tue, 21 Nov 2023 23:43:19 -0800 (PST)
Received: from meli.delivery (adsl-27.37.6.163.tellas.gr. [37.6.163.27])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c1c1300b0040b2b412a0dsm1242710wms.7.2023.11.21.23.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 23:43:19 -0800 (PST)
Date: Wed, 22 Nov 2023 09:42:01 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 C=?UTF-8?B?w6k=?= dric Le Goater <clg@kaod.org>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Herv=?UTF-8?B?w6kg?=Poussineau <hpoussin@reactos.org>
Bcc: 
Subject: Re: [PATCH-for-9.0 20/25] hw: Simplify memory_region_init_ram() calls
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-21-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-21-philmd@linaro.org>
Message-ID: <4ilg5.a7wcjg47v90i@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: /mHgGFQHYphe

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Mechanical change using the following coccinelle script:
>
>@@
>expression mr, owner, arg3, arg4, errp;
>@@
>-   memory_region_init_ram(mr, owner, arg3, arg4, &errp);
>    if (
>-       errp
>+       !memory_region_init_ram(mr, owner, arg3, arg4, &errp)
>    ) {
>        ...
>        return;
>    }
>
>and removing the local Error variable.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


