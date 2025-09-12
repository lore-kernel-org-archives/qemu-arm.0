Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC66CAC582
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Sep 2025 16:51:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ux6yr-0003uo-3T; Fri, 12 Sep 2025 12:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ux6yo-0003Xs-2t
 for qemu-arm@nongnu.org; Fri, 12 Sep 2025 12:50:34 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ux6ym-0000AZ-4d
 for qemu-arm@nongnu.org; Fri, 12 Sep 2025 12:50:33 -0400
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e96c48e7101so1755105276.2
 for <qemu-arm@nongnu.org>; Fri, 12 Sep 2025 09:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757695830; x=1758300630; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+kZZ2T9UOlyWo2/Fv57TNDm/aMnOlGEdEA+7yELhCDM=;
 b=xwpyo4Qkg6MHUCkvhPttVqY4XFpIby8jApdWpHTzFMUdGsLCWLuWyFzFcsNR2cFFpv
 zGue4v8MlCHgePfR2FchCZHR2t65e2G4XWZH/KpVT8abHVdjhR5v1vfVv26sGhwIQNNJ
 qqqjjz0Wtx8hv/aij6vDM6GRJOAuqtidbvtYitRxERT+58PevspGqzPRQgQvXxmpCW/P
 JAEjbIAfwI5dqtO+HQnlvWbu8CyrdRmu4g6yX4lE5LZKyYwUR0aIvdAahR3mKegNNmZE
 hTFlwEwGfvwauTxoyYREuZsWchr0uHqOunDHtQh8LcK07FEDlGHaf5PZCGFXbLAVnip7
 N5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757695830; x=1758300630;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+kZZ2T9UOlyWo2/Fv57TNDm/aMnOlGEdEA+7yELhCDM=;
 b=PPrY6VIJFTRi8gzQgpe4APeVP81lyhZNxHOK0Gfe691m40efMpvx/MI6Ar3ElupVKX
 RidlukI6sBHmytaKUqRCOhE2nuPpB35RI3JBOqUpYJzmDyqVdSQuuYh9MB8Azy/48xcP
 flEaRKKmGQ1O5jb7UGQaWR5jI/uI8quXFne+zNrWPQmZW4Isup5b5rDoNal6mPpLlZgz
 LMcDZ2BXvKL/dlyI32P7Fy9e+PPJrTVQomdfeEEFt0StZVG/tabrJvRigg/eqdHC6cWz
 uH7HPNpM5nr6FWG7eDoN1OocVwNJ8/m6lR8i/nsIicqdO8snHiawYjeyr88QsFrdEfez
 A27A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeYHFbFpVIc5NE7lqV1Y2Bs3Y0ATsEZDiFqaBt5hPELBe5/pCFQPOdaTzej0K21E/MSjr3gjWTLw==@nongnu.org
X-Gm-Message-State: AOJu0YyHeiJ957rSl+Z4MMQ0O3MGlJsL4pyx7qTT0hvrDiMweuFVR3tE
 DSHz/ecTbhcwPvup0gJWytnDSMy6PQdCmOWcj73RvFDVZGK2aQQgJKxHGUVYJRzuGpbfnEmE3D7
 uzC1h+6v59ogsojvexQs3P2U/ZwlXOhjt7W7XLsXk+A==
X-Gm-Gg: ASbGncsCyI77d9UKHXRzs4d/b9SSvzkwjdj3sw3te4yra6Hu9ABOJYtQNMfr7InKNm3
 1DXGaGEevqnqC/GGCHikuTzLN4vO1p2IJLmiDBeG9f4ILD8SbXeKDEddt3tDr5V73v1tBnFaNAJ
 cnA1YiCHl7dUrmaYS42j57QE4Rl8xRL+jQpT+SFiOoOVqrHZOh29xbjH6iYHXn0rjkf3bUPXWgK
 Mc1qiHjZZcSQavpuIs=
X-Google-Smtp-Source: AGHT+IFp81WeNcFb7MRuA84hGznaQWU/8s3iRlaYh0Meh2Yn8zomG0jriDaJHSOvL/ZB/c3SReNk0B1WWLdvrj/K83s=
X-Received: by 2002:a05:690c:a012:b0:730:c83b:e9f2 with SMTP id
 00721157ae682-730c83c14b2mr21655167b3.37.1757695830176; Fri, 12 Sep 2025
 09:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250904154640.52687-1-gustavo.romero@linaro.org>
 <aL7CsSppNc-WZFY-@redhat.com>
 <a6320118-84f0-4088-82de-7192be6093cd@linaro.org>
 <aMQzD0m3QluWzlmh@redhat.com> <871pob64iv.fsf@draig.linaro.org>
 <aMRJ6nfXF2l7iu7b@redhat.com>
In-Reply-To: <aMRJ6nfXF2l7iu7b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Sep 2025 17:50:18 +0100
X-Gm-Features: Ac12FXx4E0BId-0fc-ViiDMLWNcqfd9YV-1uoLsyuOoSLuHKE2jDTsjCPlKx5lw
Message-ID: <CAFEAcA9u1v3=BwrC3Vuo4mk+H+5bCcYcQ0FNeT15z44HALaA8Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] tests/functional: Adapt reverse_debugging to run
 w/o Avocado
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 thuth@redhat.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Fri, 12 Sept 2025 at 17:27, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> Well if 'easy' is our goal, then we can just copy the gdbmi.py
> file from avocado into our test suite. It didn't originate in
> avocado to begin with, they copied it from its orignal repo
> to then port it to py3. The only real downside with gdbmi is
> that the machine level protocol is ugly to read, but I'll take
> that over this current patch, as I think the reverse debugging
> stuff is a match for the functional test suite, and moving to
> the tcg tests still leaves us with the unpleasant interaction
> and debugging issue that I've described - they're just hidden
> from the functional test suite, but still impacting QEMU as a
> whole.

If we're doing programmatic driving of GDB then the machine
interface sounds like the better choice for the task anyway...

-- PMM

