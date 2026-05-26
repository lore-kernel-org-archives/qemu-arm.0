Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815ECCD5BD0
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 09:17:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRnu4-0004cQ-5d; Tue, 26 May 2026 05:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRnu2-0004c1-BZ
 for qemu-arm@nongnu.org; Tue, 26 May 2026 05:16:46 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRnu0-0000Gn-1R
 for qemu-arm@nongnu.org; Tue, 26 May 2026 05:16:46 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-7d1bcb92072so52158107b3.1
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 02:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779787002; cv=none;
 d=google.com; s=arc-20240605;
 b=aWyh/4zuCfKPHeHdFsXRaAxbmkaoAtxPfg6MH8snbv5A5iCLNrbJM2/Y+af8zjJVx0
 9689j9CADtIG5HFiUnO2XVwEKkmCBCfAMFtaDfrusHcDFE4cUstN6mcGfGXxXn8wv98M
 dj2Am2J9QcOBFK3JNy7SJvfr8f+GkGJpIoBG8j8iEI1/95LyJd60lJl3XA/D5Owg0zwn
 gZs0ZopSMOVxagA3FqbmSKJ+88X0xd/MIwvAfm7/3//S/OdiBQchD8MtzrY7D9gw9Rsy
 DzYCeF1UZDGHIM6LC0mbPDLnewz7VBIDUAGMbFDElO8am9oIxeyjVHkbkQqWz0hKzltd
 Uclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=qQm5IUUOEJMJxBOveOn6m8VarH/FynIw8RGfUUbzmHI=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=iLMSbsXlrX80i+zLaqHIMsuwj4mHYSNzVvqk57Eztz6gvLEdinnQn6vymH8ybJ4eVQ
 YeymYdFy4Wd8hplxUXqvhrAekevjuAjuy06SeIaO+NOJjKxHxczpIOLNZJMAwte6QClx
 Px4JRUmnjhPcE8luRFhTdDH5MpiEh8ALhFCWjS4rzPTBjf73DUuxmGvwVzNrjKzP2+9m
 coJXDA11pfgnbiDs7ClU50z3GJkthORaXZ2KM/3hE+CQnheXS5q0//AlkPRVOQwICsju
 BoV/WN1oDxCK6Xi4TIdVDLAMbf6zSj9Re0MeFgIZUh450Pv0wtpg91C5AQXLXqJ0ISZj
 B8lQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779787002; x=1780391802; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qQm5IUUOEJMJxBOveOn6m8VarH/FynIw8RGfUUbzmHI=;
 b=UjFoDaaPZN4GlwKiaudGeed+/GjAda2MnfYObnenClVINp0Qw3jIGfldleUsg9RIZj
 agtMamDN8TTPSvL4EoN5rvakYe54V/DFbK3/w/dAVOHspGo2TOrkjqPz3x34Qq2ghjO9
 4DeFvZLtpzLcf/xdBh2415SscR6ZJCnHkB+KtbtUpCI6EyXRKYRSemxQpnGY99Y0B0wQ
 RQr650nszVsSp76ZvuY9vGYTMlJkC8lF+fCn+RICSfo3B1Wc6wJc6OOius22W7qKFG+T
 YNs5N1F/waJqt9DWi1eeIklaV1TUpExXe8WLx7NEm5V01sOLgXMyLpohjaxo25VsJ+Sd
 aNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779787002; x=1780391802;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qQm5IUUOEJMJxBOveOn6m8VarH/FynIw8RGfUUbzmHI=;
 b=K0NZUKMX1ge31fcbrHGojmyzdT3M1eCOvi+v7iKwiQi35aZpuxamG0ce2U5vS3pLhh
 hB0LB7lB2sFvND/xX0FW8OQSQ9me5TR1gf1xcWWRFS2vwVaEoLOYzwWciyAsFbe7blPI
 wGuxoLgmeHZcIaAEjmB0xGxJDORlQEW1Y/zOczu2+N0+bItxUdQbuyfzqzXFU6fEY+Fz
 2sPzirdYtXB1y3y9pMLuEyiFHRCuSJqYqGspBESen62JAnAurbu/3AUreGEYrJhF2CUF
 W3f+h4S4ZzcBwtR1rfTKCz4il31iF3awwF2pqr85WjNXOn8+kg8vylORni+c2DgJ0WYd
 /dXQ==
X-Gm-Message-State: AOJu0Yz/NnqJ8mMuWX/pKMrGvzLITnOvbh/Y/G8nGh6cCFGKpmvm72dq
 qleiBjfk3Occe/LOVWauvRMSzOLLihAqpErLIs/ksiIoRGqOzFI+edrWL9Xi8IiF2mLeJpy7V/r
 dYoIk194ynZwCWW/qvdAXrEBRgom8Z45SGlc1ghICe99K2vvMn/D3
X-Gm-Gg: Acq92OFKIWrD877btHEfdy25Qgy+pUO+MUU0X9NusI0tr0GnvCfpuEo1TNC80yzSCN7
 9HYegjF//rPUEsXKrVRcTLmwo6MBObK9T8xMXIrTFFQXw7zbOuX+fHvTpXbVxgMPOhWcCffzzLw
 Hhk+QD8zou0v6tL6s8AzWTEI7Y9hT4CMQbfjX8FdJlkf6KOe1BcbN8ODkfum5WKCZxL/75fQ4FO
 YwGphk6rc/VjZ9IQmsfZ7Wpg6WKacL6oHYIL3KihBpFtc6meESLBOqdvS5g4Tsn5Woc2mpClFwR
 y1aJ55HJJRNbGuV71XG1gR1QFKIh8IFRkktvjyetZ4T3e23yJEYvHrmn+L4PAXLO3nSIz2TUy6E
 /MQ==
X-Received: by 2002:a05:690c:6f06:b0:7bd:5b06:b35e with SMTP id
 00721157ae682-7d33b0445d1mr182806817b3.47.1779787002350; Tue, 26 May 2026
 02:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260515142541.571911-1-peter.maydell@linaro.org>
In-Reply-To: <20260515142541.571911-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 May 2026 10:16:30 +0100
X-Gm-Features: AVHnY4IStFn3JjfVh-J2NU7wXrAW3b0jK0T2sfKJXvi8I3kgoq4xZoMJrJ7eYG4
Message-ID: <CAFEAcA_WZA+XpmEDcrD4YfmQ8re6XeQJRLRQYap18C=1AvviCg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] target/arm/ptw: Flip sense of get_phys_addr*
 function return values
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 15 May 2026 at 15:25, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset changes all the get_phys_addr* functions in the arm
> page-table-walk code so that instead of "return true on translation
> failure, false on success" they are "return true on success, false on
> failure". This convention seems more intuitive and it matches the
> sense we use for the translate_for_debug and tlb_fill_align methods.
>
> I've marked it RFC for two reasons:
> (1) I'm on the fence about whether the upheaval is worth it; I
> think on balance yes, especially now I've done the work, but
> you could argue the other way
> (2) I'm open to suggestions of whether the patchset could
> be better structured for review

Since the patchset has got review from Phillipe and Richard
(thankyou!) and no adverse comment, I'm going to take this as
consensus that this change is worth doing.

I've applied the series to target-arm.next.

-- PMM

