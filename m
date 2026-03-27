Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD9310AB830
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 14:16:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w67zG-0002kn-Mv; Fri, 27 Mar 2026 10:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w67z2-0002bM-Nx
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:16:23 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w67z1-0006re-1E
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:16:20 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-64ca4dfdd88so2384715d50.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 07:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774620978; cv=none;
 d=google.com; s=arc-20240605;
 b=BIgofXNWzHG6UZCxYjkCEhYAJoOe5q5OeJxIY0DVF0Ei4rqGHshYsmIEAuGv43QN2c
 G/xSgQ8Ask5HvM7IHXAbx76mHBGb3Rb4rsoYUNsMpbQx6oeRZ69RvkHG+GllU2VthVhd
 +HZ7Z4vmYTygIYamokv/pI8MgzGkdKl8A2+h1yJESlZ+ajEppIDQQHaXzvgS2wrddPet
 ZFZ/m9hR4ouSNxQe/K/oWqAmDHNIX9mrXmecQro2w9QXz+ozdGzOxt18/TEpqlqNgMYd
 s8DD7s9hAdUTDXJ4olpgbIlSMhgVyIUuOafRJwQGFq+BLRUllY1/vJFCF1btkrMWM6PP
 qYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XHqKNwchX9pcFRNbqu4Pgrl3e/KIoiPTpQ/JU0j/py4=;
 fh=oZ/kmeETaAPFzZ9hJ+WWBl25V4eH6QRilsPhtqmLvBk=;
 b=f0wlSg0GXJXjs6pKwc8wPgvltxBh+itPg7017STZaBROSbwcmRNAGdEx6J/tjrwtdf
 aYGgrwgixvhcEkm4coxwsMls6RZWINbWPIfQ0K0o1Sq36Xv/r3UifU+0Lmrb8mwOFurw
 QPy9Ik7qIss0ovQgekVd0padPpgwJpHdBSqc1HnpIEEZcDEoQM6dDXt6n8nLC1TQf83g
 3ZvzDObFLLOS4KkSOTIhDkYoYP9n7ZF+oaV3uBU2pCQgpKfaQYEPfgde6KuM33zTLOXB
 aBUU77UUAi9ItZjkxcFEUcoaMz5F2hBNHkBRsai6pBp0eosFki5iZUDvzWUefhYINOZM
 +mLg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774620978; x=1775225778; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XHqKNwchX9pcFRNbqu4Pgrl3e/KIoiPTpQ/JU0j/py4=;
 b=TkzYWhTtSpn0knCuLm9iVigwEX4EQgTeUT1aHLNCn8Y+5PDV+DLPT/729ITr+uDrnN
 ILOk5asYDknDuOmMeYK8I6biPtamfQnZW9qRfQJLhQz27tUuvgHjum34rquKUOKbKX/p
 4f7UKeD1jKLs0BExvWkR/2UGSGeLKolhUR0RV7JEWr4HZFM6L8EZUEX7b9Ls2z/WNDfW
 JU+p7Y/TMJnjdZYhbbov0e2a/7Qg8c5nl3KLcwCqZcDgrzqmhBVPBcnYfi4AoQJpvg9E
 bKaKRR8pqJTbVkw1qdmcFtrz1EwYIJFp3w7uDZGEr2eJ1IyiTL21An+OWs8KU7H5SD7Q
 yFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774620978; x=1775225778;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHqKNwchX9pcFRNbqu4Pgrl3e/KIoiPTpQ/JU0j/py4=;
 b=eccKqOE7fhKSmN6ZUcfTHKtmzXdhF3mLo7uXreYi97Dv1/F0MD+DI25IhsPe0cXZST
 axJCeWfaKHIyaqo01lfryRCpy95lepm9iyLVsGgJbsK29Izkzdf8bbR0000jsWrwHBjx
 ph22t8jYtVRRZrArirrMdky9aqUGVFF2SN7XgcyeFo8LlTTJE2/PVEoH2ywlBN+3SdVm
 totUu7QrOeMnNuJdswIlMneCVNFlQhaPFnEochNHB7dMlg+Q8V7y1KLosoWxD+HYySly
 dcqe5dpQ+dVZoSEHroe3VaUVJCAJp7+xnsBBsvbzY+6lUmYPv2qboi946PWL/C823WqG
 yfOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV36D2bRO0dsKg0Mia8TMgc0acq6FsGCFSbk5lVhhl/pLunykCxzUmqdySDZ4E0Xc2jty1cQb9WRw==@nongnu.org
X-Gm-Message-State: AOJu0YwdITktS5WyaO7hQ14gWk3qom2Y+ows+KnD9voBgKT9oLzTE+oy
 53pv0JQjM3KdMwUDx4EcBzhKUv5yr3xHwT1NRPLCGyBZxBsy3n/MSah7gZnHym5/UzpzlZPub5E
 clQHgqxm8C2n/X+68ppsb8vIxrtzZVSIgSUGL/y9B1g==
X-Gm-Gg: ATEYQzzlpOlkhvvwVaccs6BmLaZfCokqRLDvxnxdIh8qjlv6XYPCZO6AfirbFiyXwUo
 /rongrP8IBUGtGlUpsUvOIjk711bR85Hrk7XV3SoQPreVAsFpxMvzKPuWzOWl0CYzd7VC4LpXwv
 F3PrIvlorVbMRadv4jUo/xrhDY65ahrfK3Uj2YbA4wyREe9vt7rPsz9tzyBiutFyRmnQfQXgreD
 Bawvoa46jAo4HNcwn6VMcO2hd1SxnBM0imobNfyIKJIRgIxVeX2HdLWHaTiGHfpLlDugr185Jkn
 BEYHuXU0L7zyN61nNnUCvqKw0YxnryReCcR5dX3x0fxGepltmW35MxaVklh08h3whYk=
X-Received: by 2002:a05:690e:11ce:b0:64e:e464:12fa with SMTP id
 956f58d0204a3-64ff7186196mr2658872d50.5.1774620977579; Fri, 27 Mar 2026
 07:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-8-kkostiuk@redhat.com>
In-Reply-To: <20260327134401.270186-8-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 14:16:06 +0000
X-Gm-Features: AQROBzB7drqtslZ5P4MR3E6zpMZVuU-zinN5xOcd-ktq5T8QKtXHBkqxN3bKfLU
Message-ID: <CAFEAcA9rGYiN7=819n2Fd-J3pA10ZVd8Tmt4VhHqp+sme2j5qQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] target/riscv: Use glib2 instead of
 strcasecmp/strncasecmp
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 27 Mar 2026 at 13:45, Kostiantyn Kostiuk <kkostiuk@redhat.com> wrote:
>
> This is a change in semantics. g_ascii_strcasecmp() doesn't honour
> locale but strcasecmp() does. But this is OK for at least one reason:
>  (1) QEMU always runs with the C locale so there's not an actual
>      behaviour change here
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

