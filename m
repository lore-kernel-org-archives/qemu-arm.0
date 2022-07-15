Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp198516lfp;
        Fri, 15 Jul 2022 07:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uC9LTOxK0N4EB8rgf0EsXE/o0CD5rIFSmxk41R1VBkYNIkEFq/5f1oKbYQ9BI8pwyA1v2Z
X-Received: by 2002:a05:620a:3183:b0:6af:40c:284d with SMTP id bi3-20020a05620a318300b006af040c284dmr9956885qkb.433.1657896033170;
        Fri, 15 Jul 2022 07:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657896033; cv=none;
        d=google.com; s=arc-20160816;
        b=ezfQ1Ida4unVU/vXNeG4wIfXtZx1Nyq/aq7raWzcOV5cFAT9EjJvlvFD0iUL8DYDQp
         U3ETwW+zKiDI/F5aJa3rB5AVhVb8yNEF084wjtHp7Pc4/DPcagmtH+PL/o33QaqQjb0d
         hDKML+zZ+F1g8PpggFBPrnd6PR6CanAxpRbSwWWYx9JWwRr3iqDU54kUH0MvwXt6qJlP
         7yHbRSCNoFsxGJ5/sPCEIhjb3yz4VZfgBfuOK8sYKnGhj0c7laABrr1I5C8zql6shORB
         2IO6PF0H/Dkf2t7KSze0e/OX1gYDc7yGC2k21LplziYjDA5myFqT8I4HHFXDdW0Zxn49
         OKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kUIlrUGIUbUS6JTwE8ANIkvcSGy7MLA6+8iIhvZJBW4=;
        b=z7mgdpyy6q1qYcb/ZbITMSUi01fgZzS9kwSiwMnZl9fo14i1ZM/njpk9REHglVeGfD
         AMFtA6eR9TUzvx81w9On6IQK+Gxe0RNZfUEO3D9js73Ryo6uvPtZBSssjgVFwJ0AvzDk
         M4L4hJCb+r2da5j4aqRHO1vqz7fDtXznt1IuXH69I0VCvgKEpeluO4zgS0nx4z8ASm3R
         ZKIsDVxKoMiPwq/DVARY2bq4E3azixA3TlHp6mKftVDb2JkbWOYej84l7Rzz129iOUCz
         ote2AeDMRL0z8OUzToe3J6tCxe59t3y4YmZDMVHVmt9lkOMJ7qVk3RIWwx3W+SbBYLzE
         YnqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jm2DhMd9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8-20020a056214212800b0047302c2d85fsi3059325qvc.329.2022.07.15.07.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 07:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jm2DhMd9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCMUa-0000bx-OG
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 10:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCMUO-0000bl-Sc
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 10:40:20 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:35461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCMUN-0004Kd-FO
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 10:40:20 -0400
Received: by mail-yb1-xb35.google.com with SMTP id e69so8776504ybh.2
 for <qemu-arm@nongnu.org>; Fri, 15 Jul 2022 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kUIlrUGIUbUS6JTwE8ANIkvcSGy7MLA6+8iIhvZJBW4=;
 b=jm2DhMd93x0UUFxZrWHzCMEExlchQbXWBrlv5SBnvUMmHVgEd6+A9y2YLDLJpG8zeq
 tDW2oekyLPjudAD9TbGx4xhHALPhvdGehbY49IpgieWmfUQeLYuCzW61DlrzYNjcpd6D
 HI3AOmpu/Maj2nBrn1pyWvfV5j1b0j8njz1dcnquYQTLZpaCXZKJoyq/td0r1Iy+zSJT
 ZJbkAZ9XRLdyeHlO14GljJrfGUduLWUdk7Qy3LXes95arIX7LWHrjYUt1YZrN9nmGcVN
 KoiCNcYCuedrOWabEcRlXn/7Jq1ZcN2HVKLegdSQKQH4Y1bGlAS98Bu8+q20/sa4vXt0
 w6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kUIlrUGIUbUS6JTwE8ANIkvcSGy7MLA6+8iIhvZJBW4=;
 b=ataXitBq5BKCye1fQ8myBZtwhJreEf+fqNFYIyVxVleHCxbctdqAaLJ32TcUM7Z5Mh
 zy3BRjzDacp/2oWBII66OsnVN39HZBwN5GDp1xQe27egz+lmujG7mnXNaZkDAkdHRVUY
 f0vPHJrRPpeYgkPMbqGUP4SeGYA7UILjqvhhfAELIjTr3z9C4OA92MAO24IJPjfzFVLU
 f7ZzPp5N5iKr/IalRnprSsgL2mXqwD+fEzQUDOuCD6lBy3z1OpBBagjkBkSnk9yZhvUr
 6PpC1VP//1GkNcgq7u1Qa7R9g7molYLy1QGvtDrGvIo369GPQSXLbuweIFScvsGiRwgt
 JOyQ==
X-Gm-Message-State: AJIora9Mo6+ZpUTk5pmEhbDpA4H4NsaFJMWE+MNq3NCG00sRgvhG1hXe
 6K9I+rgPPFwhyePFn06tnCJfR19DjEYw+enbKEr7wA==
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr14381863ybg.140.1657896014613; Fri, 15
 Jul 2022 07:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
In-Reply-To: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 15:39:35 +0100
Message-ID: <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dzr9nQmJD5Z5

On Fri, 15 Jul 2022 at 15:36, Jon Alduan <jon.alduan@gmail.com> wrote:
> I compiled a common and simple posix timer (timer_create/timer_delete) ap=
plication to verify that qemu-arm-static is handling these calls correctly.=
 I found out, that regardless of Ubuntu's version, qemu-arm-static with ver=
sion 4.2.1 does it right, but 5.0.0 onwards it does not.

> qemu-arm-static version: 4.2.1 works fine. 5.0.0 onwards the issue can be=
 reproduced.

> I can provide logs and application to test if needed.

Yes, if you can provide a reproducible test case that would be great.

thanks
-- PMM
