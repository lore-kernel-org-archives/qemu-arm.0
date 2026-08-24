Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D92DC5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 14:16:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyVT0-0005z6-TJ; Mon, 24 Aug 2026 10:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyVSz-0005yQ-2f
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 10:16:01 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyVSt-0006rJ-Hd
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 10:15:59 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-66c711b7f2aso5174239d50.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 07:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787580953; cv=none;
 d=google.com; s=arc-20260327;
 b=m3mK5NNayJFTNVA+NTOFQQF0NzSG8WtAcs8oCWsYZ2LB4f77YsbnnQ7z6EBreDoaBH
 nfkjW+G14Op/xgaDIWAiEWM8AZUq7wdANBxYvvBNS1Dv9bxHSlAw3doqJU+cNmT6TrOw
 MIia+snlCOhHRNRcyEsCWL7/d40GpycPvS3oZrpdZA+6CPDuve+DWRI/ffx1wErw/E47
 +7PSZE9zqnBRJC3wdVRRGyx2p6g9LoBoZUjiukTc4cWWhlT3jvd7CItYvBoitSyHVst/
 4PrWIl6LlA6fhyKYuR0K8QwdRBdhi7AKfjnVJsS6KGTHjAR4aKOe9of0lieYAKm/Q5QX
 Zqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bOE19ddvt3OiBdu36MUo3HBusa8hq0RDUQcKaDJOVPg=;
 fh=bylHTlXKagR60JR6hlKikcBZkjoax/Kz3v/HLA7SjSY=;
 b=gl6IjyBw1ETMX3tBEoUuVp9cu3XdWwqQ9oK1S9CNWvwiL3Q+OYRh7p9ayuNbZ4iAZ+
 mK3mcn91VQTaThk6N1tL+67ylCtEPCPnD9LBawyCtuMISXxFG2o1DBg2VZzYcU7OVhjZ
 1xH6QJLoUXG0vJiRhTe3HjMQYv6UgpoGnYJrTAnMiYRUT6O/ZVHseQLQkdQctVtyKAex
 qz3UCPkZjn9LuKViqeBNlVYi4npgPn2hNbTvvTmKkGdjfvyLUQRwqHEfqo5h0p6XBvYs
 ZGsytFncwClOFfd/f/AK66B/seiJviBoKNtW9SoqnLcEzPEuqM4hKRXrgNzhK4Fs+nXR
 sKBQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787580953; x=1788185753; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=bOE19ddvt3OiBdu36MUo3HBusa8hq0RDUQcKaDJOVPg=;
 b=nGSs81BxnkggcsP8tpD4VcmDSzwCJ/2mb8cZjwGUKuA4PlxydZc0EA/eoerFpUSOj6
 3MlJrFOkIDUzDrARdwRjBdQWI4L6IrkNLIpJ1svLNFnzkLSSkUkSVuHzj/KsxmY0Y3Jz
 ytnpXbjT+uvCgoC9k7xk0IXtdfG2X79kF2tBos3TfZxDnN6e2Q0K4Mez1JF0ccqRcpJU
 VGXjtX8GxbwvQyOH7pas4VlzZrQWyOPHSp7eaNmzHCpwuN9TIfePb1yC00d946PlAcO8
 1r5UbWVaX7OXGmuHy54kBEmZveZbJd1ac2STinfSefL3vOcAlSAaFeVYG7SIkWLn/NJh
 wyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787580953; x=1788185753;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bOE19ddvt3OiBdu36MUo3HBusa8hq0RDUQcKaDJOVPg=;
 b=XCQxuco9CXxbbQAnh3prNOogIWTEpEiMCr4kVqlNyp+FnhVkM7MeaFOgaubrZZcGgb
 glBJPbgYauOCCfbB1zEJjsISrK7wCBsFH1q1xJKiEZSosGju3zwjVGzifhHEjEUFdscd
 NRK/APCYgKF2CIOw4zaETw9FngE4NaeoZeACL3y2o6s6OwaCi/ceoZORarcKyrkTIa16
 hqq8yaIJ6/8rARXXzO8WNZFSUZ6/jSqRvifgeRp8SIcNFLAPXIsrunnyjnT763CKCz9k
 8TZOPe+JChPObXmhSmlNZVWOxY00Qw9pp4Z7vKO6pa7azOWrNv94om2YKUlVGFqaFMnA
 tL7A==
X-Gm-Message-State: AFuF++k5hj7TtEqKPgLColn/l3rWX8pJxu1BtJnCJUYr0azXPNOTood1
 c+gEwIOgyfhqX2ZoYtJ+SyufE25H0fXKlUqKGmDziWPH/kDURtteuTK7rxtf6pts0QDyWBoeTxQ
 kFSCQhv/uzSNofdlk7ika0sncMjqwLlca5XwCe74zlg==
X-Gm-Gg: AR+sD13DoZDh2FLLM2V1Ov33sgqX0VzHpPEkQa105tkJe0dlQE2nxoHsam5Fs2PBJ73
 ncXP8OUkQWfylieVVhSq6F6GU0vdAJPTA9nqrtgEAgoEA7G4abxJyiuODy0ePaVXbnudtBaZkAP
 iHWeAvPBwh/17ELKvzcqDH07WDQk9jlEHJHmdEU21YUm1/HRTtJsSUwaCc7WrN+/OTlHXNScfql
 CRf6h+xNk/Z5iAs5JRsjZFtDgK4HqNxwpCkSo2gupsA+GMJxVYZhJEVcANmyY9mV1IaoskoQ7Ui
 EjPJk704QhbSwwIEmbp43Pq+s/SJj3r/DNSJnLvEJdrlPBURAYvS1ClmJ/V4Evk1rO/SG/t2w5g
 mt8J5qNd/S0nGcx5uC9GAOXZV7v6u
X-Received: by 2002:a53:bbcb:0:b0:668:8acd:14df with SMTP id
 956f58d0204a3-66ce4b8d8femr6465718d50.54.1787580953113; Mon, 24 Aug 2026
 07:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260824102805.639072-1-peter.maydell@linaro.org>
 <20260824102805.639072-6-peter.maydell@linaro.org>
 <03dfa51a-64c2-4b79-b524-2bac3e53335c@oss.qualcomm.com>
In-Reply-To: <03dfa51a-64c2-4b79-b524-2bac3e53335c@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2026 15:15:40 +0100
X-Gm-Features: AcwNN1XIdjJmFRvIiK6phJWJ4XpuAWCRNEG52YayHrDMB-K21_FpubgxphzL82A
Message-ID: <CAFEAcA8HOx3nQN00LTtqRVLqBGuQTT8bu7gaSntJyeot=hzcHQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] hw/intc/arm_gicv5: Free memory in finalize
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 24 Aug 2026 at 14:55, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Hi Peter,
>
> On 24/8/26 12:28, Peter Maydell wrote:
> > The GICv5 allocates memory and creates hashtables during realize and
> > as part of its operation.  Free those resources in finalize.
>
> Why not in unrealize() path?

No particular strong reason. Do we have some life-cycle/style
guidance on when we should put things in unrealize vs finalize ?

-- PMM

