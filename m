Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp350019wrm;
        Fri, 4 Oct 2019 05:05:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuSeAfiNkfSyskf35cc/JehtcS10vFqOQLOfu/AUEDfSA4Jgvm7pDLxns5jI0OQOBU5MyZ
X-Received: by 2002:a05:6402:794:: with SMTP id d20mr14719237edy.20.1570190700816;
        Fri, 04 Oct 2019 05:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570190700; cv=none;
        d=google.com; s=arc-20160816;
        b=EtY59S1PtQzZewOLFaqj5Pg/0Zo4VjpY8BIYwrtXiY2F0ageUpQETan80fxshmt5eO
         XBrYow3CmQl72OadamcAocoitDooPdYQ7uouyIDzGA1cjn5Twoxn9eP0NmFq81HpzDyf
         97tEaZUXwv4vgRN17Sj6SCg8vNF/1ZZ6JhsWdPP1NEsqb9KkrjmzfS5OyTL10vnDeW+B
         VdtuapL66aQg61uu0e56xqFJA4/63MYYhYV+LX3MGf4pxw1xeSKFYPzf8lISubb8UMrP
         KwXYdVuvUTMEvP5RGUAHqKowGp0WOfSyHFFwxoDE70vm/QKPiGJrxfVv7bKehUb0pnh3
         hakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xt2EzE0z6lux5nyX4FA3db27ZeOXTHbOvN3tP7Q4FCA=;
        b=mqLJWYp5UKzsGjeDCI+p+1nJ1wK7uAd4aeaJzW65QDh2Hn6Rpu2TIMld7e6DDVvFts
         K4NdGYwvjkNyxVK89eXmSMA8v3AGAw+gqRUEv6MiGCk3eMphob9xIDy6UBUgN1ypUgs7
         e3LHM6fryZqAOptzi7/+gJWxmhmOSbMxEXSxfOULgGZxGTF0kMJE+NHeQhRgEl52Zc5V
         ab/JP9uvUTpDVgJk9DvTpe5x56dwyf4c20x0rSs0Wr3qkN3S3rxn7kWmojCAmBNkndRC
         /+5Thjweaf6M5QvYyzlZHRft2st/TfN4nw+d+UpGRZjufSVMccTseJhdoHAS2ZeP8K1K
         Q66g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pO8owpDl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si3348022edr.382.2019.10.04.05.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 05:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pO8owpDl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGMKR-00008B-JY
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 08:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57911)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iGMGn-0007B4-2W
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 08:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iGMGl-0000ov-EC
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 08:01:12 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45326)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iGMGl-0000lC-6z
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 08:01:11 -0400
Received: by mail-ot1-x341.google.com with SMTP id 41so5037431oti.12
 for <qemu-devel@nongnu.org>; Fri, 04 Oct 2019 05:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xt2EzE0z6lux5nyX4FA3db27ZeOXTHbOvN3tP7Q4FCA=;
 b=pO8owpDlj0kimzb4ma2uZRM4scJJc0Ow1ocXrnE7frdCJdyjeicdq/1UANY+EwY8qw
 5IBrLKMHxT4zVtKDUkaEiQrh/L3WGGoX8c3rw141UtLP2D+cE6bmFZa4G1mLRt/HSiMm
 y9TBc1zRxU8OZilqD4/FICdV+ofv96V9hi+UzLuwAKjOdvRGnSZqBUN1wKxSSQCa1mqJ
 gu06ABXVobrvWwPLD0oiKUk5EJySetvqgvIbZTvhRkyzE/Hjdbmvaxzpn9e8PPKNlPdc
 S5nIGqpUr8LMFzmr2T0o8ZwZfTjjv/WxMDV2bVGEOP6ybcinAov4BYJI8TuU0vjJTGR5
 0iVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xt2EzE0z6lux5nyX4FA3db27ZeOXTHbOvN3tP7Q4FCA=;
 b=DzXV/T6MRYAka1ON4mMX/u89dVToUTzhqMDGJK7iBeZIECAwWJCASNM6ogPgJfqZ6x
 viMRNamYUTahEA4N4epyLQrFd7sfNlmP9XyTz+lki4qXYf+WxLlkXULOx613ZSSxIGer
 76bFEgTUJ25N2X4Zxwu4F2BCxBPpuPntBlqKkUEH1l7d/Y06ezda4G3WkYSk88AVBZr6
 mQhgXooAYzu15ufflbOHHxUezrV9EctYIyxR78Owt2/nsfzXNZHNtpjWGfNZb96Ukbl+
 yqTVlmWoE9XfwTEz0XntbONYMf55EtPiY0CsfAt0RZVA8jXEmcKNaLPIz6c6OqXi6ukK
 Y1oA==
X-Gm-Message-State: APjAAAXoI0MpHimnO1uMbPmgLGNW8UL8w8akYsjyZn0MBUfk4B6LofSI
 mvM2cAq9G8YdGhdBnZssMEzkFm7E22qbx23rYgyLxw==
X-Received: by 2002:a9d:6d0a:: with SMTP id o10mr9740157otp.221.1570190469713; 
 Fri, 04 Oct 2019 05:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191004114848.16831-1-peter.maydell@linaro.org>
 <2edcfdab-0682-2728-2632-e4f5bb6cd7e2@redhat.com>
In-Reply-To: <2edcfdab-0682-2728-2632-e4f5bb6cd7e2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2019 13:00:58 +0100
Message-ID: <CAFEAcA_cReY=9a40pJ3J1esWTEise-Q29DPqVgm9AAHx9FesvQ@mail.gmail.com>
Subject: Re: [RFC 0/4] transaction-based ptimer API
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OZYr+1Ko8xf8

On Fri, 4 Oct 2019 at 12:57, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 04/10/19 13:48, Peter Maydell wrote:
> > must be between matched calls to ptimer_transaction_begin() and
> > ptimer_transaction_commit().  When ptimer_transaction_commit() is
> > called it will evaluate the state of the timer after all the changes
> > in the transaction, and call the callback if necessary.
>
> Could ptimer_stop/ptimer_run act as the begin and commit functions?
> That is, ptimer_set_* can be called only between ptimer_stop and ptimer_run?

No, because stop/run causes the ptimer to "lose time"
(we stop the underlying timer and restart it). It's
very common for a device to want to change the ptimer
properties without a stop/restart -- "set the ptimer
count value when the guest writes to the device's counter
register" is the common one. Of the three begin/commit
blocks in the arm_timer.c conversion, only one of those
involves calls to stop/run, and even there we only
call stop/run if the write to the control register
modified the enable bit.

thanks
-- PMM
