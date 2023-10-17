Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3874770ejc;
        Tue, 17 Oct 2023 05:16:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv4ycTGTVMDT9yMUBQRxemtjH9qeVHq5s1AUE2hY9FkrXkdOoJFutsFXfeAJfLU0reXi7+
X-Received: by 2002:a05:622a:3d1:b0:418:11ee:ad6c with SMTP id k17-20020a05622a03d100b0041811eead6cmr2267448qtx.23.1697544961630;
        Tue, 17 Oct 2023 05:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697544961; cv=none;
        d=google.com; s=arc-20160816;
        b=SimsPfNvrNJ0edrLbctcHZmG/AQ/DB0dSE9c6un/TeM9dZJd62ID9mM/+camF6LX1d
         IJg9XTtUnIG2oLrA+bevWGrFvQNAyFWOqUp8idhx8N+1lIVGTT/AIztkCBglRKqqoes5
         E6XAwEcxQ6VBvAYB09UccF7DuLFA7Kbr2lfBjygG1FdRqGMdP7NMefqpSLOwhqsJ8lG9
         QdopAthn9kiN222ji89FGvlHkn1iClFTM3Kz/bcEbuW0xm5TeA8jNRJuP4jcpKR+XF2j
         zIqMpP+ibAhS/646xlVwlIbjekqGrtrWyCwEhXunzskh1lJgnW2ENwlQKDeMBxe7waWW
         eBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RYJFy+a6sx3s6+zSIv8CY0p4W3xeTRNrNo9sBoS0Q1I=;
        fh=EaL8vpFTtKEklWwwD6O/c+T8TzXw1DOSm5u3xOKG98U=;
        b=uJDIp0hGZORAuEvgKtxdmHKfdUwZ8cbW1um3Q2UoAxobE/yG35APKDUDzncikpRpXI
         oXtpbSPDyIikprcj4IuqDzqhiPcUD8mXzzpEe2jvkxV9yW37Ln4EK2IfzKpYtnlblmdD
         xbaTFnd7b84JycOXNLtNijbAV7lgSZtrg5TlS7R9a5Cgh02gbkArPxeF6hw2efTziJPO
         UzWEdUlvkpAzUxX/NlBc+hRPVKL4dnImPsq5y+g02h50xQFhgQecXnaoRbMS7R6hwEzM
         owaNHom54QnW14fMWW1jhe8KvvZETK5liHQeJywPZU0ybvzAtkIKVLXqnHt4+UsqT3PP
         SF7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gJrtTftW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020ac85793000000b00417aec1fb7bsi1010176qta.353.2023.10.17.05.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 05:16:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gJrtTftW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsiz4-0004DU-M7; Tue, 17 Oct 2023 08:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsiyy-0004CX-A1
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:15:36 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsiyw-0002It-Ev
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:15:32 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53d8320f0easo9585513a12.3
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 05:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697544929; x=1698149729; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RYJFy+a6sx3s6+zSIv8CY0p4W3xeTRNrNo9sBoS0Q1I=;
 b=gJrtTftWA3XtxNABPl/mZohRYda81katRiRgRszQTPNrdL4A6tyra9PF7/FmgWp4U4
 Zlac49RLzzi3Uzd0Qe+wHlBpplNefbor0owOHA65XVnLoEdLvKkCG7imngEfKLBVPyXu
 FZUfDmHijjwt7Lig/3tbG8mF968lAYOX34gXGx66IP/Rq/lrkQ9m1Cx1r+DN5xbW9hh9
 MTU/F2UP8YJ8Ysqtbq40Cc8w4sBVP0dxiH3Xh1apKWZy+jcv4kDZUYz/fJQCRJ7GnAKC
 1RHo64AsKQ3pMc76P/InrZJxoKAgRKDmqHD5+3L98K3vGh08i5R3Kxk4c2o87ZZF4J+K
 V/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697544929; x=1698149729;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RYJFy+a6sx3s6+zSIv8CY0p4W3xeTRNrNo9sBoS0Q1I=;
 b=J9vymI/TXgriHhXjIgj93euT/gLt0Zvpbsx08YyPF9bAxvVGCYVQX32oQl0yI8/jby
 lnYbqeMETpnmWfEZyBkvG4NLaXOOdZmv37RzdR7Wv1kAf2pU4WWaXb+xVLDTwrA4f/3F
 QqePoTLf3AAj+bdN8KvTaBQZHcGptVeov4BUPwlbix1Zzlvxc2WFp2DbSH0OxzSK+Ra3
 umbqt6iWhwX4jXkPBj34jdNstrS+W6mMJSiBOeDicIIWFEwgl20j9HLBQ7JcCdkmVDR0
 /CUVgis1vrvmIHsjMG3vXWWAFyg2JTPAtr430CRbpeGM/qPwG9zr3wpEed9+WwnohhYI
 5KeQ==
X-Gm-Message-State: AOJu0Yya9WUQaL7G1leC+DGlYFlIM5Oo+HmWJ6NvRrv/NA9PtGgTog2w
 WqtlojbqK/xy+2IAPNAEfRg74zPVoy+HP6Hz/C7TNg==
X-Received: by 2002:a50:cc9c:0:b0:53d:f180:3cc5 with SMTP id
 q28-20020a50cc9c000000b0053df1803cc5mr1744853edi.20.1697544928848; Tue, 17
 Oct 2023 05:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231010142453.224369-1-cohuck@redhat.com>
In-Reply-To: <20231010142453.224369-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2023 13:15:17 +0100
Message-ID: <CAFEAcA9cLZ-Q5-oPqSgt2GdR=J4yGo6BD4nWoeNnwj-ZXfBHaw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm/kvm: use kvm_{get,set}_one_reg
To: Cornelia Huck <cohuck@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: +TAbWjbv7dOW

On Tue, 10 Oct 2023 at 15:25, Cornelia Huck <cohuck@redhat.com> wrote:
>
> I sent this cleanup first... in mid-July (ugh). But better late than never, I guess.
>
> From v1:
> - fix buglets (thanks Gavin)
> - add patch 3 on top
>
> The kvm_{get,set}_one_reg functions have been around for a very long
> time, and using them instead of open-coding the ioctl invocations
> saves lines of code, and gives us a tracepoint as well. They cannot
> be used by invocations of the ioctl not acting on a CPUState, but
> that still leaves a lot of conversions in the target/arm code.

I've applied patches 1 and 2 to target-arm.next.

thanks
-- PMM
