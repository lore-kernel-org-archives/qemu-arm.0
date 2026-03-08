Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32986EA8549
	for <qemu-arm@archiver.kernel.org>; Sun,  8 Mar 2026 23:46:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzNoZ-0005Mx-MG; Sun, 08 Mar 2026 19:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzNoY-0005M9-ID
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 19:45:38 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzNoW-00046c-E0
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 19:45:37 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439b7a87fb5so4746118f8f.3
 for <qemu-arm@nongnu.org>; Sun, 08 Mar 2026 16:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773013534; x=1773618334; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kz6hwCDYSZmCQFiPEnhiS0z96BV++MzgihMYSWEhr4A=;
 b=KR+qIQ0D1upELQXVGIbMDCZ/C7NhRiYk2St89xbLDGuHU9Gdv1PjNd+WNMXPUha2LZ
 UasdB42VP7Jr7zQKa8Qy5YO0PPDoE5Qng37YdMZKd55JG0S7C5A50qr5qwAPmDFdSChB
 ptJF/m2XXEMM9xMB4fsqZE1ZcM1LmP7P0fFyjxJzM/SdPFEnljrVRRWL7f8zDPNgjWT7
 r2xIFcH5b1pPJK+691EJbmgNgryYfALg+0+iUwmfDA2ov4W6weqcYbc4nM6YZC64TcT1
 I31rLDQypANz4p1Ly+lkmFwXcYKBed7bZwi4DR0GUGcFzrrof+gm4vyJ4N3AJJn5H+Nu
 W6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773013534; x=1773618334;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kz6hwCDYSZmCQFiPEnhiS0z96BV++MzgihMYSWEhr4A=;
 b=ZVdYwRxjSLmv+GCL2eWL8YTbXZue6hf+IXqlLiTX6gke3J1VwmSYo5JM/RH1yqh3of
 G5o+ZG3DWRaCmSXupwCIpp72gfiTuafEBf+nbulmboaai1FltHaS3ifgStKVhZIRbIed
 Gsdzo+l0ri8RSA1G5q34F6ceBdDFICVDrwC9NSf+ExicaRMdZiDWydS9cYPMOfEdEqsv
 u1ATeBTkT+P/DTUcJnkl2pXixcRHroRRubAkVyyMVAM01fx6dmlpNnCq6/COXlkbOuqO
 Tt1CExmnbi4Kb3aKe6W83TsFnd0Ug5PfWinKIPWj3R2xWqcVUPLNuRevvWWeL8rmkcwU
 u3Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsyG68lX4QkDkkzOdQg8/cH/9HlJHl1UbRdOz6UkskrtT7Do/8umw0me99p1eL9rFYWoznbutU3g==@nongnu.org
X-Gm-Message-State: AOJu0YxRSCC02KWsO3UMW7Rzs6wirrWKlPk4KywLk68o4ezHKCAzbzyh
 qILm5EhPERDh5KOcADDH8R3NwqYPGubLo9ttYMTJVH33mAZdy9dBiwj6
X-Gm-Gg: ATEYQzyvXHjg1C1xGAHOAHk5kRCGxzo4+lmMQhsg6m3aZcos7dNptYmXSWlNfjpmnNT
 mlHpfc2o2xLR2PjKzAYgouDBXbc2vFLCkXD7CGPhFTJmu8dZOd+6zJNz+9xIVRBJO984wzbKaGU
 bHF7OoB3ojT3USfQa+x28+8IO3zQDEKggMp7Y3bwnA8RCmlUqmskehWoQ5eqsOAtMKq/SOrrq0/
 VfiPN+6r+Z3o5vPRPPpmN7eu2LBmluHFuWUE0BJXdveHzf2RcViv4OrRG9F8NLk9CwV4kj17uOq
 GDriUGI8P+beTBKRdfSm/poyJ2pGnESQAWFJduUfnWdU0wx0wiq9F9qqM4Z84bDE3XNCPegJVzl
 kZ7HTacKjklhDvbeQ1LqKtagucQTw2+gnM4cpoUyDP0bafC9O7GuP5H90GuUXa0SKSfWNAer6Sk
 Oxj7XmleXwf83BT5hrcsMMiJctoiMx5igzAhZsliVGqwde3CbdRMDfXUL1xnlcsR3pgcevohU1P
 ovYUSjdCb8=
X-Received: by 2002:a05:6000:2285:b0:439:b811:11f1 with SMTP id
 ffacd0b85a97d-439da66a2fbmr16474885f8f.31.1773013533698; 
 Sun, 08 Mar 2026 16:45:33 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (dynamic-089-012-148-039.89.12.pool.telefonica.de. [89.12.148.39])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8ec97sm23894453f8f.5.2026.03.08.16.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2026 16:45:33 -0700 (PDT)
Date: Sun, 08 Mar 2026 23:45:32 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, Troy Lee <leetroy@gmail.com>, 
 Joel Stanley <joel@jms.id.au>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 qemu-arm@nongnu.org, Helge Deller <deller@gmx.de>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_09/14=5D_hw/char/serial=3A_A?=
 =?US-ASCII?Q?dd_constants_for_Line_Control_Register?=
In-Reply-To: <5a2fa521-1575-4237-b91e-c19bf8b04ee3@linaro.org>
References: <20260305220911.131508-1-shentey@gmail.com>
 <20260305220911.131508-10-shentey@gmail.com>
 <5a2fa521-1575-4237-b91e-c19bf8b04ee3@linaro.org>
Message-ID: <77990C45-89C0-4762-846B-697B21EC8DD6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 8=2E M=C3=A4rz 2026 21:55:24 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>On 5/3/26 23:09, Bernhard Beschow wrote:
>> Substitute some magic numbers by named constants for slightly improved
>> readability=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Peter Maydell <peter=2Emaydell@linaro=2Eorg>
>> ---
>>   hw/char/serial=2Ec | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>
>
>> @@ -153,23 +158,23 @@ static void serial_update_parameters(SerialState =
*s)
>>         /* Start bit=2E */
>>       frame_size =3D 1;
>> -    if (s->lcr & 0x08) {
>> +    if (s->lcr & UART_LCR_PEN) {
>>           /* Parity bit=2E */
>>           frame_size++;
>> -        if (s->lcr & 0x10)
>> +        if (s->lcr & UART_LCR_EPS)
>
>FYI checkpatch is complaining because you are changing code
>that doesn't follow our coding style:
>
>ERROR: braces {} are necessary for all arms of this statement
>#42: FILE: hw/char/serial=2Ec:164:
>+        if (s->lcr & UART_LCR_EPS)
>[=2E=2E=2E]
>         else
>[=2E=2E=2E]
>
>Next time better use a preliminary commit addressing style=2E

I need to check my configuration=2E Thanks for queueing and sorry for the =
inconvenience!

Best regards,
Bernhard

>
>>               parity =3D 'E';
>>           else
>>               parity =3D 'O';
>>       } else {
>>               parity =3D 'N';
>>       }
>> -    if (s->lcr & 0x04) {
>> +    if (s->lcr & UART_LCR_NSTB) {
>>           stop_bits =3D 2;
>>       } else {
>>           stop_bits =3D 1;
>>       }

