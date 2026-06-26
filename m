Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14B3C43327
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 13:28:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd6bf-0008BL-CW; Fri, 26 Jun 2026 09:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6be-0008Ai-2r
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:28:30 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6bb-0004d4-O0
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:28:29 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-662dc387b7aso1182556d50.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 06:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782480506; cv=none;
 d=google.com; s=arc-20260327;
 b=JqpqMpL/aeLZyeQNCuJ58fawAa0Q/WiT5FBUg1n1RhBbfZQy4fZJf3cc3Bu0iZxJ/l
 NBPenkpWH9cOkGYjBbCvKMPEGtuzXkqTH9IP/YMs5kfjAjD13GZkJemnni4+pufTml+n
 fEiiEVICufYBf0m6PxPs1CwUS6eotTjwg1TQxTNAQbNkhBWYNBYGASy43ES1gxeUAkZ6
 XeZK/EwjWsc9N55QKTg56wQjjo+myR9l8MiJaCfMdd4G3qiQg+6iFF0tCxUEQOFS8aVm
 wPochVFlLxg/HY5tad7r0kZyhaRQwHH4ZkE3uvRyamDZW1HUF+/bbyhcTaZ+3tTHQbbQ
 cSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=16rcxC9eKTWRh45+UkrBUmawBkQjl/XSO1guN6LYfy8=;
 fh=c7uwlZo+sUlyubH3ecJ2gAfyvieWsId5O9YmlKV1wpg=;
 b=IGtVggfYI4j/CzEPWrLKDWntNkPbF+q9fCzHOz5hLFxIPiqgOuKSQ1enTphBMqJwhA
 DS+EF58BJ53a8UcFmdt37HdiANJ9nt4Skor1NHnxvz9QLuCfJwtxYoc+rZ7f2Wg1UkQ+
 fjMDuPgS915IOGoJa/o1DXTEogkgosfIiea8JNgO5+Gy46KJJffm7etMduQErkL7Difd
 1GKEVRNc6tbLnqqh23b+JzXSrekcZuz1q9PFoxN8TKh28oFHUDoFDdOx/hpoqbED7Wss
 FtIkm0GvkkcOE8LvNDbPYjb3206AhfFg4wlO5/JbjlSK8HKO+oo+dn7fJSM4e9FHPWc2
 /yhA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782480506; x=1783085306; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=16rcxC9eKTWRh45+UkrBUmawBkQjl/XSO1guN6LYfy8=;
 b=JbkDLhax4uBUaKyUczwngVg/zvUH1h1OA0rszq75G1OuLBC6X108qYwGGuVAYJtpWF
 OEOKpJn7/gfe991EoD9f4wzF8bWQPVa6YSyen8mikmF6rMr0iaxv9YJCZuBX6hecUir2
 pIQYkAEFiEoRufFK/yKkHS50o76CJZr+i6BPZ1SJDSH6WsSFVAssqkjQ7VYsZaotzRaS
 xs6yCRXlPZVXwyirjkrJ0WzDzVve2Op0EUjeTdprcVpjByEaJ9qCfNG3glsNF9xUUpeW
 A7XSpvLh3kAX2zfMRZu9+7fPbsTzRBnTPKisvAyP3+RlWgfLIFYL8/yJtTeQKzDWqPjb
 EwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782480506; x=1783085306;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=16rcxC9eKTWRh45+UkrBUmawBkQjl/XSO1guN6LYfy8=;
 b=dBN+GcoTH1G84obMZg5Pzr7If9rl4EztSZP/BPetCn+IK3iDyPRNpl042E7qvdRbJO
 m7zlgZUSa0g8iXm/j4LloPZwFwEP8QZlDEznCSVuFOdtFlf2rD+RRC4SPkh3LZ6Daz0d
 pG4qCEeIpREroefNPixlKTmwafaKbHFSykhtHQTTd2Dsji6osIkDxjoGN1FY7wEXBiVN
 gP9bmn0YMlG/WS0MekakBSf146RBjfwa/0SzpLn6SxU81Ggs4x+vvKKbkw2mg9oWNt9O
 cXJzfzQYDiIgpaYvcVZrIz4NEPyCemaUIIB4rnTpds+AumIne9nOXFG+VK60IOvzpSOa
 gf5A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqX1FpDL/puAoS5H189UgfQr7Eh3zNmUFgn4c5iLPMr9deTiBEUPhchVdxmluPRCcsgBLYTRmM5Lg==@nongnu.org
X-Gm-Message-State: AOJu0Yx7DQCqYIIDvUcOqZ5DrswbTZnBX/pHC0rJ4GtPp8nOcb4SBNaK
 0ZcPiqbEfMg8XhMcQDMfXe+zMvbS2lyGbtU6o1iEJ8U0G0fKWAsxfNJPoZDgEtrhx92KoEtoG4q
 c3nlU8pCHgAp7s3w7XmWrj6hcCONOWmaL/kH6p68H668a3iCwZW9fR1zFxDw9
X-Gm-Gg: AfdE7cmNg5MXq+kDJ6R7RMJl7umBqVHbhpcvQu4EycaakzEO3rQ4UahJwH/1aEqTR/i
 b7xM2rPRHB2wts8Gzm0zn94BAWQxS3ZDedsEcMpFST5JHdCuEbO94JPIMD4eHEgQ9t9iks6BRDE
 W2R0rzeB/8qQwDgqt5n48/vucd2xuj9p3uDccEh3oXVVCqcfvyJxnqi5zscThE3JIr5rNbn6sTJ
 8TBAznsmn2kcoQBxz0nu3YRD6bbQVOBj6ACmAyedT6hI6axxTS4N+N6sXNEnfqb2xE9EJepvaj/
 mS3FXhMrAht58qX7v+SsJxnTjxhfzEOzfAFDL1zSZxmZzrJ/OgOp5+Oy
X-Received: by 2002:a05:690e:b88:b0:660:82bb:e9db with SMTP id
 956f58d0204a3-66487e54b9bmr5440123d50.40.1782480506440; Fri, 26 Jun 2026
 06:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-10-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 14:28:13 +0100
X-Gm-Features: AVVi8CdC-TjmP4fBX7xeOhvey82_GKMkiuKFjALM0NJ7U5PQifT1gakByool_tY
Message-ID: <CAFEAcA8i+eu6XxpEDxKVgF=OkBF9FXTQJBgJ78AVx+_6CWJS6A@mail.gmail.com>
Subject: Re: [PATCH 09/15] target/arm: Implement SMOP4[AS] (2-way)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Thu, 25 Jun 2026 at 23:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

