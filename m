Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2388964ejc;
        Tue, 17 Jan 2023 05:50:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvIxfLOaa3TANqa+tyuBY1JIpzeSNhskeQYtqSwsFj2hG/qriAtjiaVDrl8llijViVeMNZ6
X-Received: by 2002:ac8:5ed2:0:b0:3b6:313a:f461 with SMTP id s18-20020ac85ed2000000b003b6313af461mr3334696qtx.65.1673963457635;
        Tue, 17 Jan 2023 05:50:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673963457; cv=none;
        d=google.com; s=arc-20160816;
        b=CtFJwl31XcmPWteU5DtnFiFj7gvNIettQXqvcu1xgeXS77WItahR5lcM148VPgogs/
         t70fjG5VfzLK9liELa2bWjoaKV28sxLGLMioESeaPw8ExLuDXT1pbeHZY2R1zRPdLPRm
         b2wByFfoz0lN6x6FdWQ6openZoiN5YYGZ7HdudGPwUHE/x/3qGB4kC2YnmBZrTeCKW/+
         uYaGAwZDCq/MTSf0CdvmhFLXsk9DViC6DNSpVo0zZzBdvx1o+ndBnmDExwDRUhF5QSeR
         QQYF8pVjWr6tafJ3hYPtGacWPjWzmihLyaDWQgGNyDjpmBIm7yOfjrzpZX1kM287HH+L
         lhew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=YMY6ESmdDG9Xclj4ipJgoT2OZT7+OvsQUtfNxfRyaG0=;
        b=n1OvHtFWxuvq9j8BzeDc0otCCGqUJDL+39vTZ7DqLl5Y87MUrypLymvcT96QfP3r6Y
         WOttqd7S/E08AlUy5g00NiEYdhW81d+uoaOFmQeTdqlyhS24b99+CpPD5g8w+JjckX/F
         Uu3Ptz5i/BjN4Q0KkCeV4FDJlGzHUDOj0l0GXRFsnOQFYulWJO+TT7kbtA2jV8oHMaRo
         v8snCOVPF8nXn6JXFPj52Ap7N9o+FyWkQA/mOTZhDPf30OmGH/JSwkjeodE9AAjD5c92
         DxbDWuSTwXGp8v5rx9vlAppoHg+yG16E4NSZx7g8grEiOQL/Tm2pJYUheEdTLeFiegf6
         wRkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Syhk8GtN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22-20020ac87dd6000000b003a7f4cbdccasi2959470qte.194.2023.01.17.05.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 05:50:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Syhk8GtN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHmMQ-0007um-6D; Tue, 17 Jan 2023 08:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmMM-0007iy-So
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 08:50:43 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmML-0005d5-B9
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 08:50:42 -0500
Received: by mail-pg1-x536.google.com with SMTP id e10so21983106pgc.9
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 05:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YMY6ESmdDG9Xclj4ipJgoT2OZT7+OvsQUtfNxfRyaG0=;
 b=Syhk8GtNdS8S7HTf856AKBp7kovRojpGBxRJAQ6F1BdjLmcuFFubIiQasDT3aMK5X/
 Lzil1WG/bjSTOYFtzgpcs5p6pzNvKLSracJIm4njJQdPCfE9u4GOgTLIurm0RzL8Kgqw
 qT9mlOeqBUpbAqg0Rs31f+zzo+8aUvhnlABi8FOKSmTGvfYoMOPsb0SyUdJv532Sfzn/
 tu39/Vgz+TcYZf/bBIUpCXu0EraQmHfHo+OSuiIFeUu32+7ZVGSeWHgAmC1Jiy8HpiNz
 3hGhzMWE/fhWUt0HnjuxFCWsuazRJwwOJFqxsVFAeOdO60CPavhEh9jH0npwUMabahbJ
 SOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMY6ESmdDG9Xclj4ipJgoT2OZT7+OvsQUtfNxfRyaG0=;
 b=0BjbtISr5uxbQ7KTJY7C49VwnNtgxtr0Sxt5Z4dRXFfAYnkKX05pqx/LmuLeEeFsza
 STrRxdtBgjz8pJjDngji5t9JJHFRJUuwNUWdcy5rtVxo/w4ybDYB9cIrEnqwpvYaB7IM
 uqed/5WX3jH1RMfupPluoPFBUoQa9FzZ5wAPL4EKCG9xZumgFWiriv1Xac86AGoPeQ/4
 rVtjwWf8k8K/1UisFIYf6Xs8wLstiZSdfO2fNjmqqOaw48pPQG1a3GabcXAhAnznTS+q
 V1ImWbzaAbTk+V61ujBYXqktrz9q1GBWHc/X1AF0PH6b82oVlQKK3tOVjQWTjR+W6HFl
 2WWQ==
X-Gm-Message-State: AFqh2kouJLgLF94CDOr+z1TTG9gjGU6upxhK1KaPA+CcQiL7+sAKcnLM
 G9EMULd2FD7ydFEJGTQ5X1JUAy0KzOCTgX215C8oJg==
X-Received: by 2002:a63:1005:0:b0:4af:9f91:54d1 with SMTP id
 f5-20020a631005000000b004af9f9154d1mr154987pgl.192.1673963439622; Tue, 17 Jan
 2023 05:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20230110082508.24038-1-philmd@linaro.org>
In-Reply-To: <20230110082508.24038-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 13:50:28 +0000
Message-ID: <CAFEAcA_VzFUAWmDeD4Y000JnuDPqnCaaK33UPFzqx21PRMDyFw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/i2c: Rename TYPE_VERSATILE_I2C ->
 TYPE_ARM_SBCON_I2C
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: myseSDMuFZmx

On Tue, 10 Jan 2023 at 08:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Series fully reviewed.
>
> Since v1:
> - Updated MAINTAINERS
> - Picked R-b tags
>



Applied to target-arm.next, thanks.

-- PMM
