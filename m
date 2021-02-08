Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1466642lfc;
        Mon, 8 Feb 2021 12:14:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMEeBNJ6CWxnbSUijzN960NQ6ZGW4EOt/WyfrfEshTkkxawj19eHyBzix1NWMW104KY75s
X-Received: by 2002:a25:a527:: with SMTP id h36mr27740016ybi.400.1612815285951;
        Mon, 08 Feb 2021 12:14:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612815285; cv=none;
        d=google.com; s=arc-20160816;
        b=YGF8gRyT2lRKnGaA5wFNiiPi5XYht6JBKMId6MhC0kAWV/V5mGuqzhbuRzSWg3jFjP
         hBIrtz/Ux4OXHSkBZI7q2+4M8jR1xlNWq30HL8PsvMbCojFEnybZHhV09n7kn6p2I2Fu
         KkSJtpILYnal1qUORHna8ynzCRNrIG5P8wNOh4cHL4yBCyzs3qwre60a+qOJb3oDJUKE
         tTC0HMHI8lvUPvvYi/wMx8rai0SYUJp0SeDmDe51UcoEML7lB0wEJVg83Gqg0uGLnhmH
         75AcLhZyL5XVj2LMPv07h7KNFwHw6jb3ILGG3aqp5MNVgoyrZNXZiIpKNnEIREwPbZDk
         DjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVDqkMFjX3DZafZntChvxhRXcB2jgfScmAOqtURtVjY=;
        b=ZvF+3Q0YTdT2OmeGcEb+5qBjreq0aJ1eSWrnIvw1YeHkYMKTkkp4wbHKe1ZGDVZ8+7
         AIDJ3xXOkNXtg6q6KPbCc1gmyHgu4IfXdmFI8Hbbj6+WDPo/kQi9YhGZXWc88EarEQdv
         BP6qZKYv4pW81Iavz1IyRnWDiRmIFA609SguXklMs85OBQEVhPUl1elC54AEWq386x20
         QqPEYTO7I8H73Ku+juwbvW4p91KQDbskJGpLJpgAxK2N4PPiAlCwxwub1hlBUGp/O/wb
         AVRilrjyq5T3U+IX9Kj/jNnMh8maITvVt8ntTP/PD9tNjr6MIXBEsp76a3rr1rz2giA1
         0rXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dAGzjaAs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i185si17143279ybc.372.2021.02.08.12.14.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 12:14:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dAGzjaAs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9Cvl-0002OI-9I
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 15:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96wk-0004hw-OQ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:51:23 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96wO-0008Ji-Bq
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:51:13 -0500
Received: by mail-ed1-x52e.google.com with SMTP id df22so18190785edb.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iVDqkMFjX3DZafZntChvxhRXcB2jgfScmAOqtURtVjY=;
 b=dAGzjaAsDVfpoa7PhS6UsOB6/nge5p3BrLs/e+hKCjyb30nH1SGhVZNbqkzXAJr7nx
 4ZgxeCUuvTOfO5Pajhuk0mnsvxvY3iEC3NgMgNPXzpRtDWQRYHLqYgoRo1C/foe/KCp/
 Ak7m+RsP37c7JDkguuQMal4ZikTv14FRJPcwcadFF60hUR+N94AiYJovtwlogVbMqWwz
 byFkYzDqBP2DmV+KBSYaTea5SkHOnfaUh7H/IMukxPQPH6UUxzEZbR12K8SBJfb/ju+a
 mya4OSVHinpBvjOBdImCscE9eHOOMGv8LTVajggHib52ab+KzBZcpyxSrKZ8eKOogasW
 YjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVDqkMFjX3DZafZntChvxhRXcB2jgfScmAOqtURtVjY=;
 b=GuhaxKgvERNgJdR8saGTeHF6u4EZU9OGdZcDnIMEXX2egU+epVTF0Rd5MTIJB3bAyQ
 2JxnoZov3d/J69TMX3whxJwkIoumvFmRJYdcnY3fvN4k+UZuTsequKOZ0+Qm5PrOnr6g
 Ug3yMrLvbKzVclmkb1oeBPumVU21nHMNimaAe+2XoXjjhzdIW5Sf5qe3JNWC01RKeJE+
 U8WFG4pm8MJpy7N2tVwCv9mUNPubmVDxjAAbtNt7JzwCrAdhP5Qc0wYH6oI0eySJSQ3v
 8DcGTCj0V2nHlVPs0PymiduXDHvt19X2FBBbKJ5q6DdR2TzoGPb2tjz+r8BAK+VPEf4w
 9tLQ==
X-Gm-Message-State: AOAM533QTSbF/ujq8v1jbaQ+1u0fBZCQVnGzvB3jI7NtGtXbgDz8pFFU
 YljEU0ir60E/pxuap4l5qVSFgfKbnYCFNXc72HukNw==
X-Received: by 2002:a50:e80d:: with SMTP id e13mr16907978edn.251.1612792252304; 
 Mon, 08 Feb 2021 05:50:52 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-18-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:50:41 +0000
Message-ID: <CAFEAcA-gjcEqLBw0UuOb9Q8Z=0nJHsWxTgHRYbYND4DueiiDvA@mail.gmail.com>
Subject: Re: [PATCH v5 17/31] linux-user: Move lock_user et al out of line
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OEljkNSmpOg/

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions are not small, except for unlock_user
> without debugging enabled.  Move them out of line, and
> add missing braces on the way.
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
