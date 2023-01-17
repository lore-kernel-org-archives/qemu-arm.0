Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2468105ejc;
        Tue, 17 Jan 2023 07:24:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXspOFKXBwa+7v9qZh6ZEnruSjNAmW3Y/BUXYPcmoVUCGqwH9pZjZlz1LddhImeTSbKkgBjV
X-Received: by 2002:a05:6214:380d:b0:532:2c20:ee91 with SMTP id ns13-20020a056214380d00b005322c20ee91mr6223767qvb.19.1673969096963;
        Tue, 17 Jan 2023 07:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673969096; cv=none;
        d=google.com; s=arc-20160816;
        b=ogum2uUiw5VBoNPa7Tuopj+v+T7oUNRyEwq1anlNK+oc8Hs9VHFQcf6kMV9K6m65rK
         DcBP2ZRf7H3ZInCkQeG0DUK+SU9Mp01/XL08FTgNqNJUfd5Hcfpi+UVh8glumnA4bIB/
         T4RJtiqFLxZrq8A/aSxj65mkss9nMPvuFo4sl+XayMiuvMPgZ5skdMA9sPgrAAbbId0s
         m6/a1jnzxbgKJkcP/K93Sscz3GjH8aGccrYD9LCq33kuxj/aBx62H0zpTQD8kpP67wmg
         JY0JnbDeHTMoMfy+vb+UoNM/Kg+W/9QRS5qgSwn3p6YkaU22XtO314wOCt5YPFogKpXw
         7/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VxGfnLZbl8s+w4O1PgvBFziNKFycArgQaGQPSdH6DeE=;
        b=ZtV1UD8XKk1HKbQnftd6e7p3Sa5+ajRXef2/2dwMmaquqjUPOGpZxwBRA3oIbQSz5x
         FWND1bD2PXSU9kqFz6CeNEVCY2To0UyLjbSR9xx7EIIA7f8SCqjEBkOft4jAbIjHDS0T
         6taCauZlP9+7t6zqQ3CDEf5vLUxG2GKWOCe1Jzd9a+Dmv1HAmJvpNAEOmSKfvc88m8A6
         pPA/4WucZbm3KcR8vxRVHEtZMy5cIxElxMHmm8vamFj1PUniusbdbq1/GJYeEMwL0Hw8
         yI+1f57P3YGYacN0QZN7I/TdQ1cxBnWMOHfouAhEZThtoNTLEjYQ+m10GMF3AnzGLh8+
         SlvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ak1juYI6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn6-20020ad45d66000000b00534e7545058si4135696qvb.230.2023.01.17.07.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 07:24:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ak1juYI6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHnpI-0000Rz-Mq; Tue, 17 Jan 2023 10:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHnpH-0000Re-SA
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 10:24:39 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHnpG-0003zA-9N
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 10:24:39 -0500
Received: by mail-pg1-x531.google.com with SMTP id b12so22208317pgj.6
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 07:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VxGfnLZbl8s+w4O1PgvBFziNKFycArgQaGQPSdH6DeE=;
 b=Ak1juYI6rSebqVurtvU2pmcIL3+TLqprG+5VG4uE3R3Td9n5udULAjH41gVpTYRHHi
 Sha0msStGNFTmpZq0PTEa//hPu/hHVuWuhaUM3tNTyEIZ4iEBkt9IJbclySrdFGZOlB3
 9fmQkxxaGb36Ewusndo7D0EVtpaf0XbAV63myBYsC2wtR1jFdKQ2kzwoUqPZwtt+HNUI
 vm0V2HborsOB3SD0b5+vm60Dn5X6N1Ksso/ID8ptPJKUuPFIezz5GqinqsSOSJ0ABrcC
 3llgWTr54IfkcDYx0qVoftoNL/0wCJ4J3VOnNyzi01IgK+cOhWnyZTcNEwNGZR8S5nre
 H01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VxGfnLZbl8s+w4O1PgvBFziNKFycArgQaGQPSdH6DeE=;
 b=6gZZiCUziBR3Gl6o4hHHjFRBeDopf3g5u//evTwlgb+PYHoDg5KILyQlqRiIOXQFmB
 EipdP0/GErUxLU8qFbasjUwdnzduVlinw67lbN1Xb7SkxxXevCioob7/A7S+qGq7mizC
 OcLsFEi3uI0p7jz3m2bHtzvK0AIJEWbl8nyKLNXeZB9qKrVP7qYFHlch1pV0OSYVcgix
 W79nxRpFhCD6Go656z9lN2O5DYao2o2wQ1f71EdHlbRyrm/ICDXD8OC2gg8fe3IaDnwI
 IZSfAYSdvs1fF2UinmxXEegKyjIeSG2rV3FHJhhqxr2oVb0vnpk0nbpJ8pC51RwxAxAI
 UmqA==
X-Gm-Message-State: AFqh2kpvrD0Buzd0ztLMJ+XHhuJGpQXidKilYLU/c0km14PyEjONKwhW
 GbrKE5Kv6uq1wBbrugFPl8Xr9m76VSKqVypnnpP/9g==
X-Received: by 2002:a63:510f:0:b0:477:86c1:640f with SMTP id
 f15-20020a63510f000000b0047786c1640fmr276336pgb.231.1673969076664; Tue, 17
 Jan 2023 07:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
 <20230106172851.2430-2-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230106172851.2430-2-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 15:24:25 +0000
Message-ID: <CAFEAcA-VkWjSO84dCmoeKaO0PEFydi7Bj2gXhBYDatGpuCuc_w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/char/pl011: better handling of FIFO flags on LCR
 reset
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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
X-TUID: se6tmTzfqdAv

On Fri, 6 Jan 2023 at 17:28, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> Current FIFO handling code does not reset RXFE/RXFF flags when guest
> resets FIFO by writing to UARTLCR register, although internal FIFO state
> is reset to 0 read count. Actual flag update will happen only on next
> read or write to UART. As a result of that any guest that expects RXFE
> flag to be set (and RXFF to be cleared) after resetting FIFO will just
> hang.
>
> Correctly reset FIFO flags on FIFO reset. Also, clean up some FIFO
> depth handling code based on current FIFO mode.

This patch is doing multiple things at once ("also" in a
commit message is often a sign of that) and I think it
would be helpful to split it. There are three things here:
 * refactorings which aren't making any real code change
   (eg calling pl011_get_fifo_depth() instead of doing the
   "if LCR bit set then 16 else 1" inline)
 * the fix to the actual bug
 * changes to the handling of the FIFO which should in theory
   not be visible to the guest (I think it now when the FIFO
   is disabled always puts the incoming character in read_fifo[0],
   whereas previously it would allow read_pos to increment all
   the way around the FIFO even though we only keep one character
   at a time).

Type 3 in particular is tricky and could use a commit message
explaining what it's doing.

I think the actual code changes are OK, but the FIFO handling
change is a bit complicated and at first I thought it had
introduced a bug.

thanks
-- PMM
