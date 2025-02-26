Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp842845njg;
        Wed, 26 Feb 2025 03:50:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUPTYl2C6jIGk69FVvXsHQU3iM+evACYdJUjffC+4JaUPNVKGYkCrFEiQWgMOhqrQfGqpKl/Bg9SbrjAA==@linaro.org
X-Google-Smtp-Source: AGHT+IGwCmxGUMT2+6wdfv7pgdub1OoG8v2646XlTTm3Zomxi6mY6SgONnlmrcONyrFHll74LKuh
X-Received: by 2002:ac8:5fc6:0:b0:472:6c9:3741 with SMTP id d75a77b69052e-47381317105mr35935281cf.9.1740570649239;
        Wed, 26 Feb 2025 03:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740570649; cv=none;
        d=google.com; s=arc-20240605;
        b=DVRWXbMvlLXStc2nVHr1Bc8731fUpNrRLwWZ7r1GkkLeQbNawMsyTG/IVFZkW7G/7u
         OfiMR/0j57muf6L4beoC8XV6a8P/XpfaIsGuZEj+iBGNAMDWzh4rumG58Q63L84vsVYi
         5toRdtxOvPTfr3OgqNZiB+2++U43UVBcGkNYWjBcOQGSYdbER8BQqyoA++E6TQMmrxKn
         cqYzTojB/EI2J3+cd3IYamaZCm6Hun4w2ac4diMYQz3VHaVSOZPjODXgkcpZAFrKPIaD
         v4QFTE2vjqdWobmjcWx1wncJaidtYf1PVVHNDw/WKBt8GuCQNEllk/4D8I5PW9nGVvk3
         9Ycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=h2Vatto6nSrvODRy+Qu/VnnAtl5w9cRYwpnb27LlFdw=;
        fh=uWFHx5QPGdO4IVzlJg5PH5GptM7suwSk+d0vY0vP8Gs=;
        b=C1toDsyiXU5x4zks4N3csyfYZx1mG8bgQwTrXwNcWsGz7Qpg0jwFNo9ugcTNEibfO2
         1zBe9hbW9OHhC+SNw+cqokHI8u95HSe0aFRwtBjbX8jMw1e5ACiyc38kdSTvOVFGrabh
         h9gTpAqpXmDgWQdI9vTOZE6RilbDTn/HVG/WEg6EWYeFyq4RoCdH0rrvD2uL+0u50ZUF
         cWYcN5kZy3i1XdW9xYetbVte8+Fcr8KBLn8EQDLTO2s4Vmw/jhAlbOFtnb3VvpyrXsFU
         yVvL3XGUXS3CcZXvPFOToqgoZE8TYi3QOEySrjkA+ksxayUxcGb3+gAv8mkg2jy54vJu
         cjoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IowpKkvq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-473780813acsi33901231cf.223.2025.02.26.03.50.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 03:50:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IowpKkvq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnFvv-0001u0-6F; Wed, 26 Feb 2025 06:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnFvt-0001tb-Dp
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 06:50:33 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnFvr-0005S4-Je
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 06:50:33 -0500
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e5df8468d6eso5524971276.0
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2025 03:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740570630; x=1741175430; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h2Vatto6nSrvODRy+Qu/VnnAtl5w9cRYwpnb27LlFdw=;
 b=IowpKkvqGHOdI76X1Ws3Ed2ahFLjft6Y633VX6ZKQOamvL2yZjyELZrH1q2fEBkina
 Rq052b1mIDlEEvX8pRhIgPr3IAcygXl6NPQV27DXqFVecCejH0VVUQ21zxgSOMMYGSkQ
 1GR3/7Ql9/0f5zPRh2xsSGwWqKWRU87+r9/pylszNgUwC7t2j8C8f9BwMyUN5gJoF9bX
 6TrweDRE23rNQSFhvAGxoudj1YGaXk1JoOmHbQ7S3eZ2VegaI73lniZhRvJteDLreSkP
 25pyeJQG7h6MjFb03LvcAVpfG/GFFSdrCnuraAez0B+Sj6AtQ+juXu6NdUU+u3uFDu51
 9NtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740570630; x=1741175430;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h2Vatto6nSrvODRy+Qu/VnnAtl5w9cRYwpnb27LlFdw=;
 b=SqCRSUMNN8uYfrvgL2kjDKp6GF/0m02ao/mHccHze6isC4C8jg/1ioXHB+EWtMxbf4
 4mOw1BD/XjbcXcBzKfrkw9dq1f3dqpKuPLe8wl6EKleBzVuUvhe+mrpI7WZhk/4JVa4C
 W7WafUXqmWfw06TzTGtNA6S6hVT0UnbAWBg6Hc5c4UQmlVXNLNxqsAIaymGX7ltPk8qC
 1/b3a59MYHuDpcSzu3HFhqZOTmjNn3C62iVXUbrABdFz+hpAR8kBLHUuc3jmNBGppeHR
 r5bC/emrZB6s4/ysMR0D4ohYs+qDYy55mudb1H06Evw5FWFgzrFAxRl9glRsQ01WYA+W
 E12w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5FzB49BNFjItVMT3iLE+X4dJjgPzqW9jMWEQDXlthtFLxtl1ZYYaOt8Tcz3KekZaxsv5UTeQ0pA==@nongnu.org
X-Gm-Message-State: AOJu0YxY2JeBmSyYEDZhpqN90GywOkfI60cZZxkeZg4kJBewvBM2NK54
 QGfS7OVR+hrT07L+31Afjd9C6EJ8LK4np7xAXpOf6rHhR3MM/44QNJ57rzWaRhNW0hlZ/qxYZG5
 AuiE79M/D5/JK2SgV/WRIXtMlCW+ScdlnQk/PNw==
X-Gm-Gg: ASbGncu9HfJRB60lqGngGrGfG/K2CfXCuO+ALQdfnv7oPNMjGYPgfLLtXLkB1BD8f8c
 j42kzRbBPb1EhlecWDB5r1jCpqIVGIL/7EG34AUmgEOWI+JTAU7WRCIxLqFqG+MV/ci0wGO0WtS
 cd0uXb9SDn
X-Received: by 2002:a05:6902:1b04:b0:e58:30dc:615b with SMTP id
 3f1490d57ef6-e608a56d282mr3011080276.22.1740570629981; Wed, 26 Feb 2025
 03:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20250224205053.104959-1-pierrick.bouvier@linaro.org>
 <CAFEAcA_sz-_6WGCQ=4kC2vtK2RUBXbAtMVzh3iZsp0xmNbgaxQ@mail.gmail.com>
 <829e9fd0-2d0f-45e6-ab89-d933d344cfe2@linaro.org>
In-Reply-To: <829e9fd0-2d0f-45e6-ab89-d933d344cfe2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Feb 2025 11:50:18 +0000
X-Gm-Features: AWEUYZkTC4CfXKM-iA9oHWkGexNeyUEl9CBDtKNHRCHZbKN9AzbswPYxU6-joBU
Message-ID: <CAFEAcA8BHzA_P7yX+cDMb1WiyGTzkh6xjvam4RHs5aoM1X6mkw@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/npcm_clk: fix buffer-overflow
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, titusr@google.com, hskinnemoen@google.com, 
 wuhaotsh@google.com, qemu-arm@nongnu.org, Tyrone Ting <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
X-TUID: 9TE8Ov13gq4i

On Tue, 25 Feb 2025 at 20:57, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 2/25/25 05:41, Peter Maydell wrote:
> > (Looking more closely at the cold_reset_values handling
> > in npcm_gcr.c, that looks not quite right in a different
> > way; I'll send a reply to that patch email about that.)
> >
>
> It may be a hole in our CI right now.
> Would that be interesting for CI to run all tests (check-functional +
> check w/o functional) with both ubsan and asan?

We do have at least some ubsan tests in our CI right now
(eg the "clang-system" job). The problem with ubsan coverage
is the usual one that we already have too much CI going on,
and it takes forever and we don't have that much headroom
for adding more jobs.

On the asan front, also, yes, coverage would be a good idea.
Here I think we will probably have to gradually ratchet
up the coverage because I'm pretty sure that at the moment
we will find we don't get a clean pass (mostly for "uninteresting"
memory leaks).

(I do also usually run a local
ubsan test build when doing my acculumation of patches in
target-arm, but since that's a manual step it is fallible :-))

-- PMM
