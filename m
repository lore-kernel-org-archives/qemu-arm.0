Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp853409lfj;
        Mon, 2 May 2022 09:56:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIbPELf0QjgRjgztdSSwcvb9F0B2DuNNy0KGSfqoaS17sFkJ+RfLet8gLnWeoIaJKOLOFK
X-Received: by 2002:a25:d393:0:b0:648:4871:3b91 with SMTP id e141-20020a25d393000000b0064848713b91mr10748331ybf.506.1651510563629;
        Mon, 02 May 2022 09:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651510563; cv=none;
        d=google.com; s=arc-20160816;
        b=usfrZGxGtVqxK5YZptRStBvVDU1QowI4ScxvmjdPiF7YWAoJKSkq4I1NKlrTo27aj+
         dyA/dGd21ybSgQD1tSGNxbiLVFbVcvbwUElL/PBD4ddBwjCxbKDxwxPPDlp8lD8bKdVp
         51maRRSbKFk+28X6B5vyGQQjt2Z0UPgkdnJ/sZytDI31g4iXX7n6gsmgE7W9C1DcxMF4
         rFOvwmEsOv8WMsfC1L5O+NtADaXG7oonEq+byMnhVNsk216mHT8yccvNzTx68/cEigRm
         kvp2QG1uCpCjFc7XazrnOUr1jSIY8xOVR9LFS6upRUydl0NA7wf8snZvpS1O0+Hne70f
         iHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=CQHHSgloLAwk4XFN5QRZgzh+UxF3C6JNjcO3znxUQl0=;
        b=AhF2/gs+nsTFt8Ha4CcRLci24cpmmNo71pKKa4R22oEJgdocfyHgKRy6eBaYu+hGs+
         h6yDrAQqqyQgNrsxJLEThDowmoIjsTL0qlWYK5AT0YpdXrP1JU9F8Hb8trvoXV7B//w2
         XNF3YQ2BxeW03NGN0prHkpf9/BIxyyLfrLxg6lq1EGfth02oq549CsokKjMsFKVdKQ3e
         QSGWqSH+FD8hHXGlLYb5VPrDc5dUVLqkI39Z+tR6AW7CAl8/6smj7VJr5CJLGk1YC4Mz
         y2JfDoJ/Vh7DYGH5EkLgo5UzbhzEGP/rX7rZ7jbckdTmJyzGR5MlkKG+gi3PIvVXgzxw
         Fncg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=NEHFZn0J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bf7-20020a05690c028700b002f9afdc5fe8si933081ywb.380.2022.05.02.09.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 May 2022 09:56:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=NEHFZn0J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlZL9-0001I5-0E
	for alex.bennee@linaro.org; Mon, 02 May 2022 12:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bherman.live@gmail.com>)
 id 1nlZKt-0001Hq-Dp
 for Qemu-arm@nongnu.org; Mon, 02 May 2022 12:55:47 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bherman.live@gmail.com>)
 id 1nlZKr-0005Us-SS
 for Qemu-arm@nongnu.org; Mon, 02 May 2022 12:55:47 -0400
Received: by mail-wr1-x432.google.com with SMTP id c11so10472831wrn.8
 for <Qemu-arm@nongnu.org>; Mon, 02 May 2022 09:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=CQHHSgloLAwk4XFN5QRZgzh+UxF3C6JNjcO3znxUQl0=;
 b=NEHFZn0JWjY8jNRH5xfK/6F3oBQWvzomParzG14qiaC6ely50h2Eo3pyLdT8J32S7o
 psPGqtvmuzjQm4h3enHKW3UuwrWK2UOjDrd7QsUY+uVRdACcnWUqbvMcrhppGOoKxeKn
 Oudg47uv4xqv4+07C3hHv3+osRrPn4+V8tsvczTgWxjeVseiJMAAvS9gbihHHid2Cg/s
 45bmBNHzk8/LwcqzOkzmx1tDyp0bjPhlCkIsH/DjQ6TAoxXAJj9xRkkwwUzPC4oudvDr
 +Ql0zNdx5/MtzEuhFu1qD5F8Sl1/J5AWIwQITPfQ+2n6HSjoGGnQPmWr2oqzgvIGPEXl
 4xhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CQHHSgloLAwk4XFN5QRZgzh+UxF3C6JNjcO3znxUQl0=;
 b=jeHi9epBXQVtKm+gjxuZWbbnvXRqBt2AOgIUm6z4/Qfow+aE9YRMPKahKxgCMwwP6b
 poWMmpHrnK2h156irp3B/1ThoCRZGw4dLX1XyjDHnQtPzuxeagM90SlGG+KXV8X9hcVI
 r/kxbqhYgQp/DhWo3LO5nAswr9nKk0rkJGukEUsVL8DpRwKimFO4bfDN6kCkxM+DBPRf
 SVdHvSjG4nX/WtbwcSCIdLFPptH5UoFG51g7OaaFm1zjVPTGNOSODf45yobL5DPYF9Kv
 2K0AK5eomSQ63p4nJ31x8iJfuxj75eOnYbnqtlhe0SaTUt0F86VVdA7cZlNEZO2+XQka
 FR8A==
X-Gm-Message-State: AOAM530O03Ha5/clJp7DSo1+evdL+7I7QsIRxIZkRBGhXV3petNLvvrc
 Igu/dn0Ufs3LQ3vvep7rszT/CcBLmq9tyPIrVzjgRwluUOg=
X-Received: by 2002:a5d:59a2:0:b0:20c:67de:494a with SMTP id
 p2-20020a5d59a2000000b0020c67de494amr2997548wrr.267.1651510543004; Mon, 02
 May 2022 09:55:43 -0700 (PDT)
MIME-Version: 1.0
From: Brian Herman <bherman.live@gmail.com>
Date: Mon, 2 May 2022 11:55:32 -0500
Message-ID: <CAN0LK4Ont8RYV94+ycvf+yNfONpee8Fcfx324dKAjzojEWpNKw@mail.gmail.com>
Subject: Sponsored work
To: Qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000042370805de0a43a2"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=bherman.live@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JKQ5YauB0TNR

--00000000000042370805de0a43a2
Content-Type: text/plain; charset="UTF-8"

I would be willing to sponsor the following feature in QEMU-ARM
Mac M1 ARM Metal support for gpu acceleration for x86 windows hosts.
Is anyone willing to take up the project?
How does one do this properly?
Is this the appropriate form for this question?

--00000000000042370805de0a43a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I would be willing to sponsor the following feature in QEM=
U-ARM<div>Mac M1 ARM Metal support for gpu acceleration for x86 windows hos=
ts.</div><div>Is anyone willing to take up the project?</div><div>How does =
one do this properly?</div><div>Is this the appropriate=C2=A0form for this =
question?</div></div>

--00000000000042370805de0a43a2--
