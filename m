Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2629607wrt;
        Thu, 10 Jan 2019 22:37:14 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7lgn9UhEQy0QOhuWm5K3TixiGR3OGEoYUI+LGZ3gFpfWr0N6EPdhQIpf2SXgfo+E0JD2Vn
X-Received: by 2002:a1c:ba89:: with SMTP id k131mr975446wmf.85.1547188633984;
        Thu, 10 Jan 2019 22:37:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547188633; cv=none;
        d=google.com; s=arc-20160816;
        b=mq5qceyI4hoJh7h5Q8tWdrWV5H69hw6wN4+WMv+RlF4Y1au5afva6USmDCM5Vn54QF
         VzjmdokdVzuqva6PnWZRxd8foRrjvROM3/fE2U3d0Y7OYSGb7LLxVhT1oSEbNn7VLYJ3
         X6fNu/3WP/5aVQXXe+1hSTxJNrbdQRTmBuIVgYxKwRSK777BguJAxToGguDBQ7EwmwH1
         +mpanhY0UXHS+1ZIqGEKuvFwsQptsGT30h6ATjiV3dzNqAw4yohHD/R7ohN6joSkpf/P
         g3/Uxw6IyLs36kwWN991R7XITdzmjxZqufSCGvifVsof8VMdDxd3sX5uxHNGtKZlUCBd
         F3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tNTLPY82oDTYQOiuEr2jnv2zJjalkgTGU0NV6QScwlU=;
        b=HYPYd5FuVLznU319OWcC4LcOucMZksoCtKxYcJmH6B1KCCComSwdfpa32Qtn0P1jqq
         CLZGWn5HML0F49SG2/EKY0j0wFP2IA4JopIjdQ3AYGwYLOjuRRr1xFLBMfEempgD1/Rf
         ITn7KP/LGAIjmejKVMxhxmMuep5oYZzjW0FrdSPoEH/shKyfAquq1+kTurgB3KoFpSqd
         4xFUlpKGVbtuFq9jiCjhbh1Y6vzFHhtI1OQoYlicXhvfM/OnZ4R0M9+OgpCc8JzUGugt
         SZFeHzEz/Eh3HWdyEy2a7GNcE86jzhviUKZeRPnP0epKCfAxbRslmRnPzL8k1v/JIwyg
         Z3nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cpMgDhPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12si42655922wrr.19.2019.01.10.22.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Jan 2019 22:37:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cpMgDhPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:54118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghqRN-0002A9-34
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 01:37:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ghqR8-00029K-UT
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 01:37:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ghqR7-000734-2p
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 01:36:58 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1ghqQw-0006uF-8b; Fri, 11 Jan 2019 01:36:48 -0500
Received: by mail-wr1-x441.google.com with SMTP id r10so13895573wrs.10;
	Thu, 10 Jan 2019 22:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tNTLPY82oDTYQOiuEr2jnv2zJjalkgTGU0NV6QScwlU=;
	b=cpMgDhPz0cRah7jGFsriaPrQNlP+WLEzhP9cyaoRHR2ToZeMOK+RgcAgS4XbwoOB0M
	sTtacclxiDW9kGaoA3t+3hCRFjNzgCnB93ZVrTE3nkPWcstjS64sk/qDEv9pDvm78OTe
	cn7wtVLSNRztnQ0ACcmB6/fw4lRXXcq6mX3KFvvhoST2tDFMS3LWNNfCgvjAWMv5ZOY9
	syUdWUCd0TcPWl1835g1H8gEznJps2SLAmzqsVku4LC96o6eAOnAcNqxCRJLYr4hfPaD
	gwrDUO0J781OJpUEAI+7QX6GEmxkxx08hMo3N+FGgGFRmTVCqovN1s5VmRjZMdie20oX
	bocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tNTLPY82oDTYQOiuEr2jnv2zJjalkgTGU0NV6QScwlU=;
	b=SprVOYrMGLLEV30bDOG2bQd5m4MbsuIPg6xF398LBbYAmKjOJGJbvlIgYykT7Bt4Qu
	2wkiyMTbhgF2aWHpfMdkaM2VR/p9+ojQImr1kLx2Gy9MLj/a7oi+inowpAUe/bB+BdzJ
	hxUbbw5Q8eYIcEhplEbriAbGgL/boUbUU8GT30n8x0ie3rqIJNKRsYLS24yxLZ285Mj+
	5H7/NPu+xzoE01G2g2dgeXibKhYf9b07SszhEsEZSUHolzZj/87B2ucVFFoSzI/B8d8N
	3dkQqhiGLW+0Pow5a8IQGnoUHVNs59ohQP43968xfeo1E6YO5Xq1s9BBy9tR92cqTJyD
	7A1A==
X-Gm-Message-State: AJcUukdwJoDzLd7F93hdqEOt/sPvpFmdXZiIJpTFqhn7wWtFV+82NkP9
	EOZ8Qi15mAm7Q+0keX8iJIbg9tMV7t61C5lSHxI=
X-Received: by 2002:a5d:538a:: with SMTP id d10mr11695990wrv.202.1547188602072;
	Thu, 10 Jan 2019 22:36:42 -0800 (PST)
MIME-Version: 1.0
References: <20190110094020.18354-1-stefanha@redhat.com>
	<20190110094020.18354-3-stefanha@redhat.com>
	<cd32de08-afd0-4b8b-a10a-99e1d88d1755@redhat.com>
	<5cc00012-1929-22a0-cbf8-14573b083ae7@mail.ru>
In-Reply-To: <5cc00012-1929-22a0-cbf8-14573b083ae7@mail.ru>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 11 Jan 2019 06:36:30 +0000
Message-ID: <CAJSP0QUzKzJ9FNC5O+i64J3Tw3oR61TODnYGnsHeW27JhKoftQ@mail.gmail.com>
To: Julia Suvorova <jusual@mail.ru>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] tests/microbit-test: add
 TWI stub device test
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>, qemu-devel <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /1w26IkWnmZa

On Thu, Jan 10, 2019 at 10:12 AM Julia Suvorova via Qemu-devel
<qemu-devel@nongnu.org> wrote:
> On 10.01.2019 12:48, Thomas Huth wrote:
> > On 2019-01-10 10:40, Stefan Hajnoczi wrote:
> > Any chance that you could use qemu_writel() right from the start here?
> > That will make it easier to finally get rid of global_qtest one day...
>
> I'll send a patch soon to fix it.
> But this test can be merged without corrections.

Thank you, Julia!

Stefan
