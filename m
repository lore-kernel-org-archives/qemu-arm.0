Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1459829lfc;
        Fri, 16 Jul 2021 09:40:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAKDK3AQnZvrM3VtAFtBCQA3DVqLWTYiyAlh892RlVkAiwJyAZZBXKzxVbUPT7YAoG+h3o
X-Received: by 2002:a1c:1d82:: with SMTP id d124mr17800997wmd.68.1626453634026;
        Fri, 16 Jul 2021 09:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626453634; cv=none;
        d=google.com; s=arc-20160816;
        b=Io3DdCBQjreSEmPsJWOGK84jmPFpk+bg2CpHn/EhpjheP0KG8l/XwbjBWmfVLgLqTz
         IY5yOgmqFydAzU5h3BLEkVKZh0NkcSFaErwbO3sSSdkB8Br1/DhjXzmop+tddvjqdSDt
         eeCZAQH58cB0cngUmi/Bm7B7l3XEIHtETFkmFkaUPzQDCMZTQqkAZf17h8jL8OMtXf1P
         LNUB+cW5vKF8vVv7u8m1pF0eFCvzAl+7Hk0K6R8NC7IPfgz2gPtai7fC+b8Q8I1NkVTF
         zc6rBtr3W0Xnah+hxdD/9CAVPL/NIbTdKj6iL0QGN0xv7xfVc4BVTE0cqWep1pyV0iHE
         2nag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7nZhr8OL4/8cjX9uRq9EBoz3R0CDrLz+eqwL0azsoM=;
        b=fnvQLCyJm3i+YIujEPbPzBwFhKmDZ1xpdZZWn6srYlVuwj+9oN7OCAtzd8LqM3HiCp
         UGdu826yGGlKuZeF+VhY2nEFk9Qppv1aMswx+qn1CQSjn7T68b3lvSS4dgnVi6xaNq88
         +0GypiSJPhrBl11mqaj5ldf3N2XqmeW8P7yk7VGN8jUXUwM0wuAGAo9yxNVZNX1Bhg63
         4Az8ofq5KGQZuVmhk+0Gwu3HEfXItO7Neex4hNdgEJ5VIOq6FVUyRB2g8o2Klk8oCLtk
         PGAVYH3jz/FrGK5igfIPxBHOODT467XESaDzJH3xLwzZarg6Wj+ju5iCk4p+Q+y1YSx1
         VxUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nzhRnc6G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si12340875wrp.328.2021.07.16.09.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 09:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nzhRnc6G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4Qt6-0001gV-QA
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 12:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4Qsp-0001ZX-NI
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:40:15 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4Qsn-0003Pj-2S
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:40:15 -0400
Received: by mail-ed1-x52a.google.com with SMTP id k27so13734264edk.9
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F7nZhr8OL4/8cjX9uRq9EBoz3R0CDrLz+eqwL0azsoM=;
 b=nzhRnc6Gztzap8K41c2OH1EWuo8tuIyHwP4DsvCBK8rNY/rTDqXth+rdxGtPnRwbzM
 DlQ41FD0zNg6I1N8TyNCTw2lTrLv+ePDYSOLqEBD4krEojIH/hBZbkEslzdoX6Bq3Apo
 Nnh4Zd0S0j/d634Wa/BTka6NAz6axNPnd0EjwYXO6esavoT5RWn88pgMNF7ipjrKHhEq
 3jiBgzr3F8NF+JgfDgz204tm6VUgETSgKlbElUoFj4uA7Q3bzKelOB4CaB01PvC9I6bi
 DCJc7iqYPdqJft6EEmCo4Su4bt7xQc077sTuqIHBSZdY/OOCXvi3YgytKl06YvbUyom9
 CJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F7nZhr8OL4/8cjX9uRq9EBoz3R0CDrLz+eqwL0azsoM=;
 b=G7YDilHOkgCf1h51Cjnvu8zfVtUEggZ5+/Rk4xcwFUaJ4QMIHh+80oh9pKB7krbJpx
 HzqM2/sUo4LS1QUF/dLoEK9PyY7SUd2B1ezYRYWHhjOwhB/DPsCbt2b/SOKGJGzO5Xkl
 bfBkQ6UsllihpKl7+dUMP05/xWa94Mb2xyQwiyUY6En86Iwtml4u49MVpMjnlypBruRX
 XROfoPcsD2hYUlE8bTROu8EcdgjrLpMwgP2WOTBl+CQTocT5WYlEL77waHFiOAoYKnna
 0Y3ALaJ4bJzpkk1eX0WEgMb9jD1gUqOsbE+aOa/N9dkkMe4UGKFWJqeKSHastnSS9w07
 U9XQ==
X-Gm-Message-State: AOAM531hL09euEdM1xKpQIZTX1cyJUjD0POVJHsbFH/ng6QZiTZfEnWL
 LuEZitBsP1PPtmtkIei6+55QPtlqfkaSfihuT1X1Fw==
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr15714069edy.44.1626453608200; 
 Fri, 16 Jul 2021 09:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-7-peter.maydell@linaro.org>
 <0332b682-1bd0-ca64-65f6-e06e1ad9c0bb@linaro.org>
In-Reply-To: <0332b682-1bd0-ca64-65f6-e06e1ad9c0bb@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 17:39:28 +0100
Message-ID: <CAFEAcA8c+cAs0bGgmShCNLHM-sKOdSDuv_Ow5OrB9iLoQ+eeFg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 06/34] target/arm: Fix 48-bit saturating shifts
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eBhOgq73Pqp9

On Fri, 16 Jul 2021 at 17:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/13/21 6:36 AM, Peter Maydell wrote:
> > -    return (1ULL << 47) - (src >= 0);
> > +    return sextract64((1ULL << 47) - (src >= 0), 0, 48);
>
> Clearer as
>
>    return src >= 0 ? MAKE_64BIT_MASK(0, 47) : MAKE_64BIT_MASK(47, 17);

Yeah, agreed.

thanks
-- PMM
