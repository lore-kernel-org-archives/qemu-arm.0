Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2372124lfi;
        Thu, 26 Mar 2020 13:48:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvuhCcjx/9/TuseRWOFEimw/88wTF0miEGlBwrV8fBvIWdkKX7AAyxl4IvsbNAQJMTmgVrt
X-Received: by 2002:a37:a397:: with SMTP id m145mr10326732qke.411.1585255698684;
        Thu, 26 Mar 2020 13:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585255698; cv=none;
        d=google.com; s=arc-20160816;
        b=VpmvznCOrOcA1c1+1zXso+pTviQ2jYUNj68qPR+nY1BIZktYOUSrG1p3ggRGLyMOKt
         Vk2KtJVE3wQGODDoFMBCR9ygdSJ1B11b+Zbv4T/jOMQTLFrk5PIcYxpecd7U5PsgYO53
         kk1HOUg+BKcIwXuO7L+lpy4rvUtuBMcIGmQ2gxmOeq+ngTZWjP4mr5fvfeycQPYNlrhG
         XiGoXm9s05TXx6H7+UpCfCbW6BJzj7ZgaBcquQQuyoBKjkDytcs3AkWMkiq/W5Bu2qGP
         MDuxLcIfkFA51IJqQ8EYaLvc1hhmhg2hkVgAzvaViPoOP/A2QRc6bPp89So995igro3l
         TvCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VwTRuyh67zhKy36kTR6tjW++EUwdrEkMtctprYlY2v8=;
        b=0A+EcRRKK7Sy76LybOzrXN9JsNHYi8Zi7AqS/Qf9BKo/KuJLAwTcrTu5xelMgtSjGZ
         YJK7PaAz7MexRk9ZBwX2uF/lvoC9f0FUHtH5b2XFkqy0QJlZJp84lNMjVDYCQbwuOL3D
         9yp+hx3FN6FKyPVf/NvvveIhyx22RejGWTBPsYLduPaKKdWR0owIRLmMUGOk4jA1vafl
         QIooBJ2eoa7rYtajVYNQVgr/Gx1cJ/1qvIsa/FIzI7MizUhVgVFVHXnPMhHUq37XI6f7
         siLx9Uw+KRS7Xp0Ye9QQwr9kV/sX6SeCLL8uc6FjTRQzNWXoOwZtcntRkTY9WZnNp3MB
         e5/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WC7rKjnp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10si2259026qto.241.2020.03.26.13.48.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 13:48:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WC7rKjnp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHZQI-0003lo-4J
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 16:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39372)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHZQ3-0003lY-RE
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 16:48:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHZQ2-0004JZ-Il
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 16:48:03 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39998)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHZQ2-0004Hh-5T
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 16:48:02 -0400
Received: by mail-ot1-x343.google.com with SMTP id r19so1621237otn.7
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VwTRuyh67zhKy36kTR6tjW++EUwdrEkMtctprYlY2v8=;
 b=WC7rKjnpwAoamR61hi7yiWrnjzW8JhGCJx9sVSKmNjrAWa2keYbLk9TTEcJL4rMaRQ
 PyH+gCHx/91SmnD8C5i70EEzGWNCxlvNV+XiQ41zRbrvvTb4JREPpLNLqn18cGO5nFLF
 X3/ImP6Futvd5FmEOnBXcMf/TE94d2Btu/7BKiPJhsNz1Wo8ECZy8ReJ80n55jcOvFfO
 sCmQ2naWx3u04UOoJ16SUxgcYmsBfuM8qwbQj7aBpBvx+BPC6qB8y1/9ANStfPpEl7f0
 1urTmeRmGydRszkzlirH1tB7AAaXUt16URZQYfmtpyfFTn9Xe0X7b6p8z5LCQkhYX8sW
 84TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VwTRuyh67zhKy36kTR6tjW++EUwdrEkMtctprYlY2v8=;
 b=IZdV9FaXWahKWqWkbXf3aRUw0q0Rb8n/3vRbseZp4VUP9FeLjIcz2vHiI0jNPeDzAC
 CaglnnacAlPKFRAD84WFDfA6Ya0aNIPxCScrggaHROZoxQ11KtxhuuQGKEvJG2BmB8b3
 UuRz8FyuqWFwWnzsmW1KH8Jpd5/vPXJ7I+FHOd5bXdTCgq1BU1Bqi/plUraPayTJ/Dpy
 NG0Oa46IqWB/wXZBEhJ3xEvHksAWZvt4GMkjpTNKnmxOEZwf18a62FiVA4KYKkfiYvqc
 +8OWMGjdQ91+9MN+lPlQc+dRdrhCN84wUfdlIdCkv4ej/kVNT2e6exOU/U2lO/cCpk4A
 0EAg==
X-Gm-Message-State: ANhLgQ2MvyytW1pqz3QEagBuWXm5ct1hzRSYAdQu1wmfL0dSVWHzbtwi
 a0goJir/W7Hm9oqAHzB+GkG9+AzOlU0sYkBBJ4TfZ+3I4Xs=
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr7955332oth.135.1585255680707; 
 Thu, 26 Mar 2020 13:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200326203414.18140-1-peter.maydell@linaro.org>
In-Reply-To: <20200326203414.18140-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 20:47:48 +0000
Message-ID: <CAFEAcA_3xLS_f+u3Ka5fJTx_vQq+1Jxyucz-VG4hmsNpPHkJfg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/collie: Put StrongARMState* into a
 CollieMachineState struct
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RS/gvI3yi76g

On Thu, 26 Mar 2020 at 20:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Coverity complains that the collie_init() function leaks the memory
> allocated in sa1110_init().  This is true but not significant since
> the function is called only once on machine init and the memory must
> remain in existence until QEMU exits anyway.
>
> Still, we can avoid the technical memory leak by keeping the pointer
> to the StrongARMState inside the machine state struct.  Switch from
> the simple DEFINE_MACHINE() style to defining a subclass of
> TYPE_MACHINE which extends the MachineState struct, and keep the
> pointer there.
>
> Fixes: CID 1421921
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Rats, sent this out and immediately noticed I'd forgotten
to commit a change. v2 coming up...

-- PMM
