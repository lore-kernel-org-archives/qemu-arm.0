Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp280298lfb;
        Mon, 4 May 2020 03:13:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypJAGSZmXxfm3TwaGh0rlj8m4HnhrnFNL6MCV+dZ9umBrbDSpJF3m3GSP4ugE4gQeCN5unLl
X-Received: by 2002:ac8:4983:: with SMTP id f3mr16187425qtq.343.1588587216865;
        Mon, 04 May 2020 03:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588587216; cv=none;
        d=google.com; s=arc-20160816;
        b=QkDMax6QFhedokjowskC/y5e/zKWccPXzuzaMuBSNXQv7qc89fy7mpr4I6QyrFUKTH
         dGCLrsfTBbQjOivhPzAq1z5dM+9/loOAc5uIHHLAix6wRs5QT8micqazMuk/jebJNl5J
         PRVwj1Ykmm6BQhw/R64846tDBsk5Ff5DsMhmPLgosw6oP8yQ7kCD+hm06L4zBaTylKD/
         6h6bPm9gn9nXO1kNQPAIfm2482HAv4IiqcALckIZcDVPLAZ+2h56rLuZm/ZeJvex3t1I
         QBekVRZeRjDzwK67NdXuGB5L7Mt8mvvgljDIy6ymO+Te4ppv4BRJ8OFYyPqKonxKrBLl
         f7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SWJV4LEKJvjbK2yln++dNu2xdGV/QYWWYugOVX772lM=;
        b=WatCbuklIEtmXJ5fnENjbL07oXvxy/pUkBknTgvFeMsuIR3RZaNepjg/zDyy35QUbu
         OYt7djW/+EdqgLd+O9ZmzZMjlFx+sIXx/RAmlmJr5uLVzxpjqd/FdqkitTJWjLpLZE0W
         Wrw37t/QKv+SyOi2i5WIGOgrpmEKlB59VouhdB/ONG0Jvm6vRBYkg9aXhEXmzvmaGGKu
         jAXzLWQPYw5nS1aId0HxLep/PlNwKGxwTlCEv1Epk5OQ6gl/NDIvC2cKwetwiwQ/eE96
         2WC7HJB1V3RMsyUx0eMKZqLmkhIW2HcpPrpWTO8bKM3T0XVzOSuZ7AM14BYsLKQ+gdY+
         m7Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SkEqraYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id e26si3333136qkn.225.2020.05.04.03.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 03:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SkEqraYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVY6S-00056e-81
	for alex.bennee@linaro.org; Mon, 04 May 2020 06:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVY6K-00054j-LF
 for qemu-arm@nongnu.org; Mon, 04 May 2020 06:13:28 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:36577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVY6J-0005PF-H9
 for qemu-arm@nongnu.org; Mon, 04 May 2020 06:13:28 -0400
Received: by mail-oo1-xc42.google.com with SMTP id x17so2264017ooa.3
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 03:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SWJV4LEKJvjbK2yln++dNu2xdGV/QYWWYugOVX772lM=;
 b=SkEqraYRcq0PddMOW6g3eOzTokDYQsY3oq83TVjCIJo3rmUc3pPFZnALJMZ7KL5oTA
 TScbFZW/IeEDyha8wEI3oGxJH7EBhxhFOrb76EuNmAVA9dx6mY+ATAJTH7bZl1g2kGOx
 FeHZs+LEFjkOitzaCMnJWkQghw78WcAIA6ystF1t0/FuewguuPZRrMZ50pkmg9Xd23g7
 aHFwBGer/fHavMUN9lWCdOTrgrNX3kD9c1Op0ZE/lL4psYPv/wXlVgQsVHiRCVvFzDM0
 fhGtU1b8xtlGKoCeKhOg+vUOtsbCxYdwNPSrwsM4qU/ZPHYemyZq3iZe/ToLvynN2kFW
 Np7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SWJV4LEKJvjbK2yln++dNu2xdGV/QYWWYugOVX772lM=;
 b=eczLIw7dQvX1wjUsVMs0KA845VR+cdbhIGa1NlPnemhHPDCaqaLttN5oNOI138QIkG
 b35FVCjqJvFfNcl8zyc2lw6kAgdfLqP5aZ0zwa/NCQomPHg1J9q+XxkQSRuf1IdQGvqG
 l+YzZjf0/8sYQJtGWBtVZzMGuNl2aAkRNWw3zQF5/4HGOjQXvJAYnCetah67Hc1OUIct
 jPpmtudZLA+4fok0CLqYnLJy6j9foOZwZ8kPTkyGpjiS8+EPq88HL6Gz+ZvJQCYT8nqz
 1g8OatIyIof3+MTfS2hjMVpbL00omHGTs5AH0HL/PjBtSSGHzD5HF3VmxnyGHrTFTyE9
 ecQw==
X-Gm-Message-State: AGi0PubrtqCUqermG+7JghH2zlnor8MaZ6gaRAa2gLJDOZyChR0fDFgs
 Q1d3QSHLOUT5HxRY5jY8Qj+Mowoka0IMCd7aeeyfYA==
X-Received: by 2002:a4a:8253:: with SMTP id t19mr14258321oog.69.1588587206247; 
 Mon, 04 May 2020 03:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
In-Reply-To: <20200427181649.26851-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 May 2020 11:13:15 +0100
Message-ID: <CAFEAcA-MJtGvFbvYmqfKk_H_d3_RWP5Q7AeR37z791zMVAq1QA@mail.gmail.com>
Subject: Re: [PATCH v1 00/11] hw/arm: versal: Add SD and the RTC
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6PQm1G+fRrZU

On Mon, 27 Apr 2020 at 19:16, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This series starts with some basic cleaning, continues with embedding
> devices into the Versal SoC (as suggested by Peter in another review).
> We then connect SD and the RTC to the Versal SoC and hook it all up
> into the Versal Virt board.

Applied to target-arm.next, thanks.

-- PMM
