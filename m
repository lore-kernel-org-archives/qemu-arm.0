Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48162E7BD8A
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 10:37:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vrvyV-0000XC-C4; Mon, 16 Feb 2026 05:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vrvyT-0000WY-VK
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 05:37:06 -0500
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vrvyS-0000D8-13
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 05:37:05 -0500
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-64ae222d978so2734035d50.1
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 02:37:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771238222; cv=none;
 d=google.com; s=arc-20240605;
 b=kp9ss7pIDFgeCbYvrJrurwS4z+1baYySHj7/vILmFKS11h0fVY33raGJhd4FZjcHsi
 fvDaTdqlgPMx6LmkaqWYPJ5XRsu0Dbr57c6p4J6HzvfbaRmPSQq74S2VgnGHHJKnLt1X
 QOMIcGdZpl35foWRYbSd2/wF6kEdzwReilCjmdpSgZWYnQIEbStCbkPNzpKTHBXhV52v
 rIOUqAHJEYbVQm9qpDZXoI5cP0bVdo/j/ZeDEQGo2FxHcEFmbmvwUXoDOe5i08Ps7xNa
 RCF0g1ev0TQRJbIU8u6qrw3V1BiYo01iRCrYPiBP+9jx/vJq4yGFgUwZkR9IxesSIHXE
 21Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PNFM5+6c5CJRXmjbExY3p8bIi5a/JqFYyA3oNTdf1PM=;
 fh=YBbVW6dRSeEXZQS42waGjdsSAaldAZtX+toVjajkxrE=;
 b=iisgBAdc+/QEGZlS3OrjZK77f8ZBGqrMtaKHkuBQPqeE0yN/CxZMWpTwnUn53pavJp
 vokHsae1CFdWMc/lkTHva0M5MHNnAMbG/8/C8OEGyZ9H+x0e6vR+VrOf64QNLiEeSxPK
 k1Hq/kfjA/FYnqLngNpXA06EJVIYawR3Ghi1+W2wPMvOR0guwjM/LAbM9JvQY8o7eEgi
 DezuIN+L2RufjO82NHURcw1q01LKgQuhhAkFWqFrmcxCFcULSGjUIB29vCHzjvF1/UH6
 Nw0i1Imk7OtBTffYdQAvJ4WSz7Rb5JMaq6Rs73doat1YjK09ns1mxQeMS8EesPrjsdf6
 CWig==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771238222; x=1771843022; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PNFM5+6c5CJRXmjbExY3p8bIi5a/JqFYyA3oNTdf1PM=;
 b=H+iZzll6bY1AWkolcQNb763j1DUxjQKX/9vyYcQyVoL9vOP3VTq3MbdpB2urH1EKLA
 KcE63lKyoFmQ4+q2IzD9HJpr7OTXgzcz4WxhWH6aArxvA61oz8SWAPCnAF6IuLMrYJHB
 DEwBHnySqVOo3fsezyAycFgbAx9dJC7o3AoTquI89fZiexnqt5WZ+cvC5uFN3/YJvtn8
 dQSR2TQd4lN1gs+zu72ogiG2kDrMogLrW/3/Uri/jEso97oO13ATeqsKRcMG5JJ2xLgZ
 zYrIJfJuP7Yv2g4wOqsvk3u1WFS59wIL4mLg+3vgn7RmGjCmfBD7ASh9RogGCba/+wOE
 I6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771238222; x=1771843022;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PNFM5+6c5CJRXmjbExY3p8bIi5a/JqFYyA3oNTdf1PM=;
 b=r4G1b84CzkKr2BOjPskp5u5Q4y8mIwpswGeJYmuqzPSwTn2eNmSBWyxfqtYAMobB0t
 TyqkgruA1J4NU9yH63nAegUydYHl6lpAUYmJKMqDsZWz6OH71bh9LU0zEg/Gn3mCwAC6
 JrtYYgjtpmwnJnYXhcdEBfK8sUG1CYb+b7fJ4pkiCqkIZtB7hcFlzklzuSJ1yJeC5YxO
 4Q7TvEi9Ac1o3Hd1yCZB50AJzVBe/iEQMp7BLcO6nvqj2Uds4eRo3GWdzQJTWSjUY+u9
 tfJ5YqZNajEhn1q+WZd5h8CKCdeRtIWwbJuoyEOFmOAmuYEgl+O4ZHoCm9H8AFH7d3qT
 lhQw==
X-Gm-Message-State: AOJu0Yz5TaDXZx4Np01H6spc9HLyTExIrwQPCM3NqBVSMXDLJRzZemdZ
 jiUzOUErIg1vQS1yoGTJKf7kBLKWaQoA6+dQxmBRsCrhLnqW6HZTJqml72lJR4hQLqNmjXnKWTY
 wxmW8J510lDLjgXGFPHHLQ6bkw582oAfm/Uqgdv4Vi3+EK8hfDJlN
X-Gm-Gg: AZuq6aLGYZxU9Wu2PKNntLzUomJlL7WoNmaxERDrSBFpJV3FE1zf/962HTiiCkovOe8
 2K6oK8KX+eOOMpN6vnL0gs4Dj+f6956ScS6FYhU4Lqv64jzCGnJi9VA5NjL9ZaybXEc4pEgvMX4
 hARo9Y7KLSX2fildV+1re1YZbwklDPsbjr8HQdmwazr3Xa+VTRkf0y8ImJB0P/9O+AmUGuZOuXL
 38VrMPV9nCFDGvP1bW8286pNLMx0AXZHYGwu8CyD6D4k4wkyS9ak8mD3MQURgTpaf67YdryPCoV
 GdstY19j7X3xWF/+5axh5LIkJFO27RB5QQadANzMT7DBYqtAga9WHpvLUtiVyZFzByA=
X-Received: by 2002:a05:690e:4196:b0:64a:d8a7:10ab with SMTP id
 956f58d0204a3-64c196ca092mr7148795d50.0.1771238221620; Mon, 16 Feb 2026
 02:37:01 -0800 (PST)
MIME-Version: 1.0
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
 <20260202133353.2231685-3-peter.maydell@linaro.org>
In-Reply-To: <20260202133353.2231685-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Feb 2026 10:36:50 +0000
X-Gm-Features: AZwV_Qh5IaWmpdWSKuuluBDTjBAfoDJ_U_nOJA82vaKyeF311NPaVq9yHKDKG8g
Message-ID: <CAFEAcA8SNQGp+96ZWTqcss6za3ibtQRSf4cA8JKfusfz17yyJQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] target/arm: Report correct vector width in
 gdbstub when SME present
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Mon, 2 Feb 2026 at 13:33, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> Our gdbstub implementation of the org.gnu.gdb.aarch64.sve feature
> doesn't account for SME correctly.  We always report the Zn vector
> registers with a width based on the maximum SVE vector register size,
> even though SME's maximum size could be larger.
>
> This is particularly bad in the case of a CPU with SME but not SVE,
> because there the SVE vector width will be zero.  If we report the Zn
> registers in the XML as having a zero width then gdb falls over with
> an internal error:
>
>  (gdb) target remote :1234
>  Remote debugging using :1234
>  /build/gdb-1WjiBe/gdb-15.0.50.20240403/gdb/aarch64-tdep.c:3066: internal=
-error: aarch64_pseudo_register_type: bad register number 160
>  A problem internal to GDB has been detected,
>  further debugging may prove unreliable.
>
> Report the Zn registers with their correct size.  This matches how we
> already handle the 'vg' pseudoregister in org.gnu.gdb.aarch64.sve: we
> call sve_vqm1_for_el(), which returns the vector size accounting for
> SME, not the pure SVE vector size.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
> We should make sure we have agreement on the gdb side about
> the interpretation of this bit of the protocol. See this
> gdb mailing list email:
> https://sourceware.org/pipermail/gdb/2026-January/052056.html

I'm going to take the cc-stable line off this commit, because
we're still not completely sure we have the SVE/SME remote debug
protocol nailed down, and the one case where this commit really is
useful is the "SME only" one that we don't permit in the stable
branches. So I'm happy to put it into current git (with the
possibility we might find some extra change is needed on top),
but not to put it in a stable branch right now.

We can always backport the commit later if we need to.

-- PMM

